Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 843FF59F478
	for <lists+dri-devel@lfdr.de>; Wed, 24 Aug 2022 09:39:03 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 194B010E4B2;
	Wed, 24 Aug 2022 07:38:56 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from honk.sigxcpu.org (honk.sigxcpu.org [24.134.29.49])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 1047210EA21;
 Wed, 24 Aug 2022 07:38:30 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by honk.sigxcpu.org (Postfix) with ESMTP id 78FE9FB03;
 Wed, 24 Aug 2022 09:28:33 +0200 (CEST)
X-Virus-Scanned: Debian amavisd-new at honk.sigxcpu.org
Received: from honk.sigxcpu.org ([127.0.0.1])
 by localhost (honk.sigxcpu.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id xH3tz5zPO1qU; Wed, 24 Aug 2022 09:28:32 +0200 (CEST)
Date: Wed, 24 Aug 2022 09:28:31 +0200
From: Guido =?iso-8859-1?Q?G=FCnther?= <agx@sigxcpu.org>
To: Lucas Stach <l.stach@pengutronix.de>
Subject: Re: [PATCH 2/2] drm/etnaviv: reap idle mapping if it doesn't match
 the softpin address
Message-ID: <YwXTH6c/EH5Nc3HX@qwark.sigxcpu.org>
References: <20220714103143.1704573-1-l.stach@pengutronix.de>
 <20220714103143.1704573-2-l.stach@pengutronix.de>
MIME-Version: 1.0
Content-Type: text/plain; charset=iso-8859-1
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <20220714103143.1704573-2-l.stach@pengutronix.de>
X-BeenThere: dri-devel@lists.freedesktop.org
X-Mailman-Version: 2.1.29
Precedence: list
List-Id: Direct Rendering Infrastructure - Development
 <dri-devel.lists.freedesktop.org>
List-Unsubscribe: <https://lists.freedesktop.org/mailman/options/dri-devel>,
 <mailto:dri-devel-request@lists.freedesktop.org?subject=unsubscribe>
List-Archive: <https://lists.freedesktop.org/archives/dri-devel>
List-Post: <mailto:dri-devel@lists.freedesktop.org>
List-Help: <mailto:dri-devel-request@lists.freedesktop.org?subject=help>
List-Subscribe: <https://lists.freedesktop.org/mailman/listinfo/dri-devel>,
 <mailto:dri-devel-request@lists.freedesktop.org?subject=subscribe>
Cc: etnaviv@lists.freedesktop.org, dri-devel@lists.freedesktop.org,
 patchwork-lst@pengutronix.de, kernel@pengutronix.de,
 Russell King <linux+etnaviv@armlinux.org.uk>
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

Hi,
On Thu, Jul 14, 2022 at 12:31:43PM +0200, Lucas Stach wrote:
> When a idle BO, which is held open by another process, gets freed by
> userspace and subsequently referenced again by e.g. importing it again,
> userspace may assign a different softpin VA than the last time around.
> As the kernel GEM object still exists, we likely have a idle mapping
> with the old VA still cached, if it hasn't been reaped in the meantime.
> 
> As the context matches, we then simply try to resurrect this mapping by
> increasing the refcount. As the VA in this mapping does not match the
> new softpin address, we consequently fail the otherwise valid submit.
> Instead of failing, reap the idle mapping.
> 
> Cc: stable@vger.kernel.org # 5.19
> Signed-off-by: Lucas Stach <l.stach@pengutronix.de>
> ---
>  drivers/gpu/drm/etnaviv/etnaviv_gem.c | 7 ++++++-
>  1 file changed, 6 insertions(+), 1 deletion(-)
> 
> diff --git a/drivers/gpu/drm/etnaviv/etnaviv_gem.c b/drivers/gpu/drm/etnaviv/etnaviv_gem.c
> index cc386f8a7116..5cf13e52f7c9 100644
> --- a/drivers/gpu/drm/etnaviv/etnaviv_gem.c
> +++ b/drivers/gpu/drm/etnaviv/etnaviv_gem.c
> @@ -258,7 +258,12 @@ struct etnaviv_vram_mapping *etnaviv_gem_mapping_get(
>  		if (mapping->use == 0) {
>  			mutex_lock(&mmu_context->lock);
>  			if (mapping->context == mmu_context)
> -				mapping->use += 1;
> +				if (va && mapping->iova != va) {
> +					etnaviv_iommu_reap_mapping(mapping);
> +					mapping = NULL;
> +				} else {
> +					mapping->use += 1;
> +				}
>  			else
>  				mapping = NULL;
>  			mutex_unlock(&mmu_context->lock);

Reviewed-by: Guido Günther <agx@sigxcpu.org>

Cheers,
 -- Guido

> -- 
> 2.30.2
> 
