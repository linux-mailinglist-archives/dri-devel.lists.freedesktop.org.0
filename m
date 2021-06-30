Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id BF8DA3B85AA
	for <lists+dri-devel@lfdr.de>; Wed, 30 Jun 2021 17:01:19 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id DE29E6EA02;
	Wed, 30 Jun 2021 15:01:17 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from foss.arm.com (foss.arm.com [217.140.110.172])
 by gabe.freedesktop.org (Postfix) with ESMTP id 26C7E6EA04
 for <dri-devel@lists.freedesktop.org>; Wed, 30 Jun 2021 15:01:17 +0000 (UTC)
Received: from usa-sjc-imap-foss1.foss.arm.com (unknown [10.121.207.14])
 by usa-sjc-mx-foss1.foss.arm.com (Postfix) with ESMTP id 7AF091FB;
 Wed, 30 Jun 2021 08:01:16 -0700 (PDT)
Received: from [192.168.1.179] (unknown [172.31.20.19])
 by usa-sjc-imap-foss1.foss.arm.com (Postfix) with ESMTPSA id 077F33F718;
 Wed, 30 Jun 2021 08:01:14 -0700 (PDT)
Subject: Re: [PATCH v6 16/16] drm/panfrost: Increase the AS_ACTIVE polling
 timeout
To: Boris Brezillon <boris.brezillon@collabora.com>,
 dri-devel@lists.freedesktop.org
References: <20210630062751.2832545-1-boris.brezillon@collabora.com>
 <20210630062751.2832545-17-boris.brezillon@collabora.com>
From: Steven Price <steven.price@arm.com>
Message-ID: <56cba9eb-32a9-6227-a8fb-79e585c5dd1e@arm.com>
Date: Wed, 30 Jun 2021 16:01:13 +0100
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.11.0
MIME-Version: 1.0
In-Reply-To: <20210630062751.2832545-17-boris.brezillon@collabora.com>
Content-Type: text/plain; charset=utf-8
Content-Language: en-GB
Content-Transfer-Encoding: 7bit
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
Cc: Tomeu Vizoso <tomeu.vizoso@collabora.com>, Rob Herring <robh+dt@kernel.org>,
 Alyssa Rosenzweig <alyssa.rosenzweig@collabora.com>,
 Robin Murphy <robin.murphy@arm.com>
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

On 30/06/2021 07:27, Boris Brezillon wrote:
> Experience has shown that 1ms is sometimes not enough, even when the GPU
> is running at its maximum frequency, not to mention that an MMU operation
> might take longer if the GPU is running at a lower frequency, which is
> likely to be the case if devfreq is active.
> 
> Let's pick a significantly bigger timeout value (1ms -> 100ms) to be on
> the safe side.
> 
> v5:
> * New patch
> 
> Signed-off-by: Boris Brezillon <boris.brezillon@collabora.com>

Reviewed-by: Steven Price <steven.price@arm.com>

> ---
>  drivers/gpu/drm/panfrost/panfrost_mmu.c | 2 +-
>  1 file changed, 1 insertion(+), 1 deletion(-)
> 
> diff --git a/drivers/gpu/drm/panfrost/panfrost_mmu.c b/drivers/gpu/drm/panfrost/panfrost_mmu.c
> index e0356e68e768..0da5b3100ab1 100644
> --- a/drivers/gpu/drm/panfrost/panfrost_mmu.c
> +++ b/drivers/gpu/drm/panfrost/panfrost_mmu.c
> @@ -34,7 +34,7 @@ static int wait_ready(struct panfrost_device *pfdev, u32 as_nr)
>  	/* Wait for the MMU status to indicate there is no active command, in
>  	 * case one is pending. */
>  	ret = readl_relaxed_poll_timeout_atomic(pfdev->iomem + AS_STATUS(as_nr),
> -		val, !(val & AS_STATUS_AS_ACTIVE), 10, 1000);
> +		val, !(val & AS_STATUS_AS_ACTIVE), 10, 100000);
>  
>  	if (ret) {
>  		/* The GPU hung, let's trigger a reset */
> 

