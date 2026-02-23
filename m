Return-Path: <dri-devel-bounces@lists.freedesktop.org>
Delivered-To: lists+dri-devel@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id YHYwF7gBnGn6+wMAu9opvQ
	(envelope-from <dri-devel-bounces@lists.freedesktop.org>)
	for <lists+dri-devel@lfdr.de>; Mon, 23 Feb 2026 08:28:56 +0100
X-Original-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id E55C5172A79
	for <lists+dri-devel@lfdr.de>; Mon, 23 Feb 2026 08:28:55 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id B4E3110E1F4;
	Mon, 23 Feb 2026 07:28:52 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (1024-bit key; unprotected) header.d=samsung.com header.i=@samsung.com header.b="dxCgZj3E";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mailout1.w1.samsung.com (mailout1.w1.samsung.com
 [210.118.77.11])
 by gabe.freedesktop.org (Postfix) with ESMTPS id E76A310E1F4
 for <dri-devel@lists.freedesktop.org>; Mon, 23 Feb 2026 07:28:47 +0000 (UTC)
Received: from eucas1p1.samsung.com (unknown [182.198.249.206])
 by mailout1.w1.samsung.com (KnoxPortal) with ESMTP id
 20260223072845euoutp01b17baf92e829775c8f7f9939f122bf63~Wz5EqsvyB1711517115euoutp01a
 for <dri-devel@lists.freedesktop.org>; Mon, 23 Feb 2026 07:28:45 +0000 (GMT)
DKIM-Filter: OpenDKIM Filter v2.11.0 mailout1.w1.samsung.com
 20260223072845euoutp01b17baf92e829775c8f7f9939f122bf63~Wz5EqsvyB1711517115euoutp01a
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=samsung.com;
 s=mail20170921; t=1771831725;
 bh=fHwzvy/lJyzDBJ9QYguzkw4r84XxwakyncGKU7DpSRo=;
 h=Date:Subject:To:Cc:From:In-Reply-To:References:From;
 b=dxCgZj3EJWyjxlcARoDCZRa2yYKXIbd5WcWfBShCk11DnhMzW21d4gKyt3hItQMBO
 1K0FkaIxNrgCgtUlx4/0vY6CG1ndBcvSZCJ6EKkPmqNANPg+pxRuuWSzaizRsM0dYe
 iR11kOjlYz3ssGLrjw4z2bgC7Uo7QfBxXzA2gPoI=
Received: from eusmtip2.samsung.com (unknown [203.254.199.222]) by
 eucas1p2.samsung.com (KnoxPortal) with ESMTPA id
 20260223072845eucas1p238d8a317d8340fe8e9c8b658727e8ee8~Wz5ESAyjY2513825138eucas1p2J;
 Mon, 23 Feb 2026 07:28:45 +0000 (GMT)
Received: from [106.210.134.192] (unknown [106.210.134.192]) by
 eusmtip2.samsung.com (KnoxPortal) with ESMTPA id
 20260223072842eusmtip2e953ab7b19655f3b5707f07bf625dab3~Wz5Bw0DU62888828888eusmtip2N;
 Mon, 23 Feb 2026 07:28:42 +0000 (GMT)
Message-ID: <666eefa7-3e00-4586-a443-1a71dc24e6dd@samsung.com>
Date: Mon, 23 Feb 2026 08:28:41 +0100
MIME-Version: 1.0
User-Agent: Betterbird (Windows)
Subject: Re: [PATCH 1/5] dma-mapping: avoid random addr value print out on
 error path
To: Jiri Pirko <jiri@resnulli.us>, dri-devel@lists.freedesktop.org,
 linaro-mm-sig@lists.linaro.org, iommu@lists.linux.dev,
 linux-media@vger.kernel.org
Cc: sumit.semwal@linaro.org, benjamin.gaignard@collabora.com,
 Brian.Starkey@arm.com, jstultz@google.com, tjmercier@google.com,
 christian.koenig@amd.com, robin.murphy@arm.com, jgg@ziepe.ca,
 leon@kernel.org, sean.anderson@linux.dev, ptesarik@suse.com,
 catalin.marinas@arm.com, aneesh.kumar@kernel.org, suzuki.poulose@arm.com,
 steven.price@arm.com, thomas.lendacky@amd.com, john.allen@amd.com,
 ashish.kalra@amd.com, suravee.suthikulpanit@amd.com,
 linux-coco@lists.linux.dev
Content-Language: en-US
From: Marek Szyprowski <m.szyprowski@samsung.com>
In-Reply-To: <20260209153809.250835-2-jiri@resnulli.us>
Content-Transfer-Encoding: 7bit
X-CMS-MailID: 20260223072845eucas1p238d8a317d8340fe8e9c8b658727e8ee8
X-Msg-Generator: CA
Content-Type: text/plain; charset="utf-8"
X-RootMTR: 20260209153816eucas1p22befaa2c5ef3c6d5e67956eea08424ed
X-EPHeader: CA
X-CMS-RootMailID: 20260209153816eucas1p22befaa2c5ef3c6d5e67956eea08424ed
References: <20260209153809.250835-1-jiri@resnulli.us>
 <CGME20260209153816eucas1p22befaa2c5ef3c6d5e67956eea08424ed@eucas1p2.samsung.com>
 <20260209153809.250835-2-jiri@resnulli.us>
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
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>
X-Rspamd-Server: lfdr
X-Spamd-Result: default: False [-1.30 / 15.00];
	DMARC_POLICY_ALLOW(-0.50)[samsung.com,none];
	MAILLIST(-0.20)[mailman];
	R_SPF_ALLOW(-0.20)[+ip4:131.252.210.177:c];
	R_DKIM_ALLOW(-0.20)[samsung.com:s=mail20170921];
	RWL_MAILSPIKE_GOOD(-0.10)[131.252.210.177:from];
	MIME_GOOD(-0.10)[text/plain];
	XM_UA_NO_VERSION(0.01)[];
	HAS_LIST_UNSUB(-0.01)[];
	FORGED_RECIPIENTS(0.00)[m:jiri@resnulli.us,m:linaro-mm-sig@lists.linaro.org,m:iommu@lists.linux.dev,m:linux-media@vger.kernel.org,m:sumit.semwal@linaro.org,m:benjamin.gaignard@collabora.com,m:Brian.Starkey@arm.com,m:jstultz@google.com,m:tjmercier@google.com,m:christian.koenig@amd.com,m:robin.murphy@arm.com,m:jgg@ziepe.ca,m:leon@kernel.org,m:sean.anderson@linux.dev,m:ptesarik@suse.com,m:catalin.marinas@arm.com,m:aneesh.kumar@kernel.org,m:suzuki.poulose@arm.com,m:steven.price@arm.com,m:thomas.lendacky@amd.com,m:john.allen@amd.com,m:ashish.kalra@amd.com,m:suravee.suthikulpanit@amd.com,m:linux-coco@lists.linux.dev,s:lists@lfdr.de];
	RCVD_TLS_LAST(0.00)[];
	FORGED_SENDER_MAILLIST(0.00)[];
	ARC_NA(0.00)[];
	RCPT_COUNT_TWELVE(0.00)[25];
	FORGED_SENDER(0.00)[m.szyprowski@samsung.com,dri-devel-bounces@lists.freedesktop.org];
	MIME_TRACE(0.00)[0:+];
	FORWARDED(0.00)[dri-devel@lists.freedesktop.org];
	DKIM_TRACE(0.00)[samsung.com:+];
	ASN(0.00)[asn:6366, ipnet:131.252.0.0/16, country:US];
	TO_DN_SOME(0.00)[];
	FORGED_SENDER_FORWARDING(0.00)[];
	RCVD_COUNT_FIVE(0.00)[5];
	FROM_NEQ_ENVFROM(0.00)[m.szyprowski@samsung.com,dri-devel-bounces@lists.freedesktop.org];
	FROM_HAS_DN(0.00)[];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	PREVIOUSLY_DELIVERED(0.00)[dri-devel@lists.freedesktop.org];
	MID_RHS_MATCH_FROM(0.00)[];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	NEURAL_HAM(-0.00)[-0.999];
	TAGGED_RCPT(0.00)[dri-devel];
	FORGED_RECIPIENTS_FORWARDING(0.00)[];
	DBL_BLOCKED_OPENRESOLVER(0.00)[samsung.com:mid,samsung.com:dkim,gabe.freedesktop.org:helo,gabe.freedesktop.org:rdns,nvidia.com:email]
X-Rspamd-Queue-Id: E55C5172A79
X-Rspamd-Action: no action

On 09.02.2026 16:38, Jiri Pirko wrote:
> From: Jiri Pirko <jiri@nvidia.com>
>
> dma_addr is unitialized in dma_direct_map_phys() when swiotlb is forced
> and DMA_ATTR_MMIO is set which leads to random value print out in
> warning. Fix that by just returning DMA_MAPPING_ERROR.
>
> Fixes: e53d29f957b3 ("dma-mapping: convert dma_direct_*map_page to be phys_addr_t based")
> Signed-off-by: Jiri Pirko <jiri@nvidia.com>

Applied to dma-mapping-fixes, thanks!

> ---
>   kernel/dma/direct.h | 2 +-
>   1 file changed, 1 insertion(+), 1 deletion(-)
>
> diff --git a/kernel/dma/direct.h b/kernel/dma/direct.h
> index da2fadf45bcd..62f0d9d0ba02 100644
> --- a/kernel/dma/direct.h
> +++ b/kernel/dma/direct.h
> @@ -88,7 +88,7 @@ static inline dma_addr_t dma_direct_map_phys(struct device *dev,
>   
>   	if (is_swiotlb_force_bounce(dev)) {
>   		if (attrs & DMA_ATTR_MMIO)
> -			goto err_overflow;
> +			return DMA_MAPPING_ERROR;
>   
>   		return swiotlb_map(dev, phys, size, dir, attrs);
>   	}

Best regards
-- 
Marek Szyprowski, PhD
Samsung R&D Institute Poland

