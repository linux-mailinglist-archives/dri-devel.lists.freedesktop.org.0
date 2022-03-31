Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 68D764ED7FB
	for <lists+dri-devel@lfdr.de>; Thu, 31 Mar 2022 12:51:05 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id C478710E1ED;
	Thu, 31 Mar 2022 10:51:01 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from honk.sigxcpu.org (honk.sigxcpu.org [24.134.29.49])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 043F310E2D8;
 Thu, 31 Mar 2022 10:50:59 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by honk.sigxcpu.org (Postfix) with ESMTP id 58EEDFB03;
 Thu, 31 Mar 2022 12:50:57 +0200 (CEST)
X-Virus-Scanned: Debian amavisd-new at honk.sigxcpu.org
Received: from honk.sigxcpu.org ([127.0.0.1])
 by localhost (honk.sigxcpu.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id qB6e2mIjWzBq; Thu, 31 Mar 2022 12:50:55 +0200 (CEST)
Date: Thu, 31 Mar 2022 12:50:54 +0200
From: Guido =?iso-8859-1?Q?G=FCnther?= <agx@sigxcpu.org>
To: Lucas Stach <l.stach@pengutronix.de>
Subject: Re: [PATCH 1/4] drm/etnaviv: check for reaped mapping in
 etnaviv_iommu_unmap_gem
Message-ID: <YkWHjsMFAu/lWFUU@qwark.sigxcpu.org>
References: <20220323160825.3858619-1-l.stach@pengutronix.de>
MIME-Version: 1.0
Content-Type: text/plain; charset=iso-8859-1
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <20220323160825.3858619-1-l.stach@pengutronix.de>
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

Hi Lucas,
On Wed, Mar 23, 2022 at 05:08:22PM +0100, Lucas Stach wrote:
> When the mapping is already reaped the unmap must be a no-op, as we
> would otherwise try to remove the mapping twice, corrupting the involved
> data structures.
> 
> Cc: stable@vger.kernel.org # 5.4
> Signed-off-by: Lucas Stach <l.stach@pengutronix.de>

Whole series

Tested-by: Guido Günther <agx@sigxcpu.org>
Acked-by: Guido Günther <agx@sigxcpu.org>

The code changes look good to me too but I got some details wrong too many times
for a `Reviewed-by:`

Cheers,
 -- Guido

> ---
>  drivers/gpu/drm/etnaviv/etnaviv_mmu.c | 6 ++++++
>  1 file changed, 6 insertions(+)
> 
> diff --git a/drivers/gpu/drm/etnaviv/etnaviv_mmu.c b/drivers/gpu/drm/etnaviv/etnaviv_mmu.c
> index 9fb1a2aadbcb..aabb997a74eb 100644
> --- a/drivers/gpu/drm/etnaviv/etnaviv_mmu.c
> +++ b/drivers/gpu/drm/etnaviv/etnaviv_mmu.c
> @@ -286,6 +286,12 @@ void etnaviv_iommu_unmap_gem(struct etnaviv_iommu_context *context,
>  
>  	mutex_lock(&context->lock);
>  
> +	/* Bail if the mapping has been reaped by another thread */
> +	if (!mapping->context) {
> +		mutex_unlock(&context->lock);
> +		return;
> +	}
> +
>  	/* If the vram node is on the mm, unmap and remove the node */
>  	if (mapping->vram_node.mm == &context->mm)
>  		etnaviv_iommu_remove_mapping(context, mapping);
> -- 
> 2.30.2
> 
