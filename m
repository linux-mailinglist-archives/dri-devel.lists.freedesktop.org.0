Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 57C491531BA
	for <lists+dri-devel@lfdr.de>; Wed,  5 Feb 2020 14:25:56 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 353276E982;
	Wed,  5 Feb 2020 13:25:53 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from foss.arm.com (foss.arm.com [217.140.110.172])
 by gabe.freedesktop.org (Postfix) with ESMTP id 904906E982
 for <dri-devel@lists.freedesktop.org>; Wed,  5 Feb 2020 13:25:51 +0000 (UTC)
Received: from usa-sjc-imap-foss1.foss.arm.com (unknown [10.121.207.14])
 by usa-sjc-mx-foss1.foss.arm.com (Postfix) with ESMTP id F16C231B;
 Wed,  5 Feb 2020 05:25:50 -0800 (PST)
Received: from [10.1.196.37] (e121345-lin.cambridge.arm.com [10.1.196.37])
 by usa-sjc-imap-foss1.foss.arm.com (Postfix) with ESMTPSA id 2AC093F52E;
 Wed,  5 Feb 2020 05:25:50 -0800 (PST)
Subject: Re: [PATCH] drm/panfrost: Don't try to map on error faults
To: Tomeu Vizoso <tomeu.vizoso@collabora.com>, linux-kernel@vger.kernel.org
References: <20200205100719.24999-1-tomeu.vizoso@collabora.com>
From: Robin Murphy <robin.murphy@arm.com>
Message-ID: <3500c501-b166-6a1e-267b-31a4e5c62619@arm.com>
Date: Wed, 5 Feb 2020 13:25:48 +0000
User-Agent: Mozilla/5.0 (X11; Linux aarch64; rv:60.0) Gecko/20100101
 Thunderbird/60.9.0
MIME-Version: 1.0
In-Reply-To: <20200205100719.24999-1-tomeu.vizoso@collabora.com>
Content-Language: en-GB
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
Cc: David Airlie <airlied@linux.ie>,
 Alyssa Rosenzweig <alyssa.rosenzweig@collabora.com>,
 dri-devel@lists.freedesktop.org, Steven Price <steven.price@arm.com>
Content-Transfer-Encoding: 7bit
Content-Type: text/plain; charset="us-ascii"; Format="flowed"
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

On 05/02/2020 10:07 am, Tomeu Vizoso wrote:
> If the exception type isn't one of the normal faults, don't try to map
> and instead go straight to a terminal fault.

"One of the the normal faults" seems a rather vague way of saying "a 
translation fault", which is what we're specifically handling here, and 
logically the only fault reflecting something not yet mapped rather than 
mapped inappropriately ;)

(Who knows how the level ended up as 1-4 rather than 0-3 as it really 
should be - another Mali Mystery(TM)...)

> Otherwise, we can get flooded by kernel warnings and further faults.

Either way,

Reviewed-by: Robin Murphy <robin.murphy@arm.com>

> Signed-off-by: Tomeu Vizoso <tomeu.vizoso@collabora.com>
> ---
>   drivers/gpu/drm/panfrost/panfrost_mmu.c | 5 +++--
>   1 file changed, 3 insertions(+), 2 deletions(-)
> 
> diff --git a/drivers/gpu/drm/panfrost/panfrost_mmu.c b/drivers/gpu/drm/panfrost/panfrost_mmu.c
> index 763cfca886a7..80abddb4544c 100644
> --- a/drivers/gpu/drm/panfrost/panfrost_mmu.c
> +++ b/drivers/gpu/drm/panfrost/panfrost_mmu.c
> @@ -596,8 +596,9 @@ static irqreturn_t panfrost_mmu_irq_handler_thread(int irq, void *data)
>   		source_id = (fault_status >> 16);
>   
>   		/* Page fault only */
> -		if ((status & mask) == BIT(i)) {
> -			WARN_ON(exception_type < 0xC1 || exception_type > 0xC4);
> +		if ((status & mask) == BIT(i) &&
> +		     exception_type >= 0xC1 &&
> +		     exception_type <= 0xC4) {
>   
>   			ret = panfrost_mmu_map_fault_addr(pfdev, i, addr);
>   			if (!ret) {
> 
_______________________________________________
dri-devel mailing list
dri-devel@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/dri-devel
