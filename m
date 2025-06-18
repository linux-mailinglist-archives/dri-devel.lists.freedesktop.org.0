Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 1173DADF981
	for <lists+dri-devel@lfdr.de>; Thu, 19 Jun 2025 00:39:11 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 0D8DE10E544;
	Wed, 18 Jun 2025 22:39:09 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (1024-bit key; unprotected) header.d=samsung.com header.i=@samsung.com header.b="HVeJw2ne";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mailout1.w1.samsung.com (mailout1.w1.samsung.com
 [210.118.77.11])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 007DF10E544
 for <dri-devel@lists.freedesktop.org>; Wed, 18 Jun 2025 22:39:06 +0000 (UTC)
Received: from eucas1p2.samsung.com (unknown [182.198.249.207])
 by mailout1.w1.samsung.com (KnoxPortal) with ESMTP id
 20250618223901euoutp01d81f80ed99730e4fe0993bf2aa63ef5d~KRCeS-gJ_0633606336euoutp01e
 for <dri-devel@lists.freedesktop.org>; Wed, 18 Jun 2025 22:39:01 +0000 (GMT)
DKIM-Filter: OpenDKIM Filter v2.11.0 mailout1.w1.samsung.com
 20250618223901euoutp01d81f80ed99730e4fe0993bf2aa63ef5d~KRCeS-gJ_0633606336euoutp01e
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=samsung.com;
 s=mail20170921; t=1750286341;
 bh=l5qg81NSDR/Hok1RYgRscCAxqtO2fW9GcPjDWWGGkxw=;
 h=Date:Subject:To:Cc:From:In-Reply-To:References:From;
 b=HVeJw2nez52li1ZM/lHYlsImxHbZnkge9yf74y8IWsxBnYkXmFoWtpIeVXUSLu0eN
 ogh2cEVyO8s3kyvxjkb4KYSaN7/Yb08OOOTg4m86iY5IpEIgaYn1LhpL3X1RCybeUj
 yW9Yb4sbzXa3y9zylIkE34hw/oP0tXl4KP39KmnI=
Received: from eusmtip1.samsung.com (unknown [203.254.199.221]) by
 eucas1p2.samsung.com (KnoxPortal) with ESMTPA id
 20250618223900eucas1p29d01fa0266e4c66e58029c4373e9d9d3~KRCdS8GFz2299722997eucas1p2K;
 Wed, 18 Jun 2025 22:39:00 +0000 (GMT)
Received: from [106.210.134.192] (unknown [106.210.134.192]) by
 eusmtip1.samsung.com (KnoxPortal) with ESMTPA id
 20250618223900eusmtip1882d2eee1b90cdc0f5148af81cab9720~KRCckHJ110058200582eusmtip1J;
 Wed, 18 Jun 2025 22:39:00 +0000 (GMT)
Message-ID: <a89ebc1f-82a0-4bb8-87a8-71a6b373ab24@samsung.com>
Date: Thu, 19 Jun 2025 00:38:59 +0200
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH] drm/exynos: fimd: Guard display clock control with
 runtime PM calls
To: Tomi Valkeinen <tomi.valkeinen@ideasonboard.com>,
 dri-devel@lists.freedesktop.org, linux-samsung-soc@vger.kernel.org
Cc: Thomas Zimmermann <tzimmermann@suse.de>, Aradhya Bhatia
 <a-bhatia1@ti.com>, Aradhya Bhatia <aradhya.bhatia@linux.dev>, Inki Dae
 <inki.dae@samsung.com>, David Airlie <airlied@gmail.com>, Simona Vetter
 <simona@ffwll.ch>, Krzysztof Kozlowski <krzk@kernel.org>, Alim Akhtar
 <alim.akhtar@samsung.com>, Andrzej Hajda <andrzej.hajda@intel.com>
Content-Language: en-US
From: Marek Szyprowski <m.szyprowski@samsung.com>
In-Reply-To: <96b92a56-028f-452d-b2dd-8362491f5a84@ideasonboard.com>
Content-Transfer-Encoding: 7bit
X-CMS-MailID: 20250618223900eucas1p29d01fa0266e4c66e58029c4373e9d9d3
X-Msg-Generator: CA
Content-Type: text/plain; charset="utf-8"
X-RootMTR: 20250618120644eucas1p2b084977540772f3623f3f9e834604668
X-EPHeader: CA
X-CMS-RootMailID: 20250618120644eucas1p2b084977540772f3623f3f9e834604668
References: <CGME20250618120644eucas1p2b084977540772f3623f3f9e834604668@eucas1p2.samsung.com>
 <20250618120626.217023-1-m.szyprowski@samsung.com>
 <96b92a56-028f-452d-b2dd-8362491f5a84@ideasonboard.com>
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

On 18.06.2025 14:25, Tomi Valkeinen wrote:
> On 18/06/2025 15:06, Marek Szyprowski wrote:
>> Commit c9b1150a68d9 ("drm/atomic-helper: Re-order bridge chain pre-enable
>> and post-disable") changed the call sequence to the CRTC enable/disable
>> and bridge pre_enable/post_disable methods, so those bridge methods are
>> now called when CRTC is not yet enabled.
>>
>> This causes a lockup observed on Samsung Peach-Pit/Pi Chromebooks. The
>> source of this lockup is a call to fimd_dp_clock_enable() function, when
>> FIMD device is not yet runtime resumed. It worked before the mentioned
>> commit only because the CRTC implemented by the FIMD driver was always
>> enabled what guaranteed the FIMD device to be runtime resumed.
>>
>> This patch adds runtime PM guards to the fimd_dp_clock_enable() function
>> to enable its proper operation also when the CRTC implemented by FIMD is
>> not yet enabled.
>>
>> Fixes: 196e059a8a6a ("drm/exynos: convert clock_enable crtc callback to pipeline clock")
>> Signed-off-by: Marek Szyprowski <m.szyprowski@samsung.com>
>> ---
>>   drivers/gpu/drm/exynos/exynos_drm_fimd.c | 12 ++++++++++++
>>   1 file changed, 12 insertions(+)
>>
>> diff --git a/drivers/gpu/drm/exynos/exynos_drm_fimd.c b/drivers/gpu/drm/exynos/exynos_drm_fimd.c
>> index c394cc702d7d..205c238cc73a 100644
>> --- a/drivers/gpu/drm/exynos/exynos_drm_fimd.c
>> +++ b/drivers/gpu/drm/exynos/exynos_drm_fimd.c
>> @@ -187,6 +187,7 @@ struct fimd_context {
>>   	u32				i80ifcon;
>>   	bool				i80_if;
>>   	bool				suspended;
>> +	bool				dp_clk_enabled;
>>   	wait_queue_head_t		wait_vsync_queue;
>>   	atomic_t			wait_vsync_event;
>>   	atomic_t			win_updated;
>> @@ -1047,7 +1048,18 @@ static void fimd_dp_clock_enable(struct exynos_drm_clk *clk, bool enable)
>>   	struct fimd_context *ctx = container_of(clk, struct fimd_context,
>>   						dp_clk);
>>   	u32 val = enable ? DP_MIE_CLK_DP_ENABLE : DP_MIE_CLK_DISABLE;
>> +
>> +	if (enable == ctx->dp_clk_enabled)
>> +		return;
> Does this happen, i.e. is this function called multiple times with
> enable set? If so, do you rather need ref counting here? Otherwise the
> first fimd_dp_clock_enable(enable=false) call with disable the clock,
> instead of the last (assuming the enable/disable calls are matched on
> the caller side).

No reference counting is needed here, as the clock enable/disable is 
called from runtime resume/suspend of the exynos_dp (analogix_dp_core) 
and there are only single calls to enable or disable. The only problem 
is that the first call is fimd_dp_clock_enable(enable=false), which 
should be skipped from the fimd runtime PM perspective, that is why I 
added the (enable == ctx->dp_clk_enabled) check.

>> +
>> +	if (enable)
>> +		pm_runtime_resume_and_get(ctx->dev);
>> +
>> +	ctx->dp_clk_enabled = enable;
>>   	writel(val, ctx->regs + DP_MIE_CLKCON);
>> +
>> +	if (!enable)
>> +		pm_runtime_put(ctx->dev);
>>   }
>>   
>>   static const struct exynos_drm_crtc_ops fimd_crtc_ops = {
>   Tomi
>
>
Best regards
-- 
Marek Szyprowski, PhD
Samsung R&D Institute Poland

