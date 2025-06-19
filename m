Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 5A388ADFD46
	for <lists+dri-devel@lfdr.de>; Thu, 19 Jun 2025 07:52:36 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id B8E6110E1FB;
	Thu, 19 Jun 2025 05:52:34 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (1024-bit key; unprotected) header.d=ideasonboard.com header.i=@ideasonboard.com header.b="Nw7bMaOF";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from perceval.ideasonboard.com (perceval.ideasonboard.com
 [213.167.242.64])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 0708810E99D
 for <dri-devel@lists.freedesktop.org>; Thu, 19 Jun 2025 05:52:31 +0000 (UTC)
Received: from [192.168.88.20] (91-158-153-178.elisa-laajakaista.fi
 [91.158.153.178])
 by perceval.ideasonboard.com (Postfix) with ESMTPSA id 62F839CA;
 Thu, 19 Jun 2025 07:52:14 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=ideasonboard.com;
 s=mail; t=1750312335;
 bh=TjsuD8IF1hWPFz2yaEr1UB4Y8XoYeLDAfIyr/x6Bvsw=;
 h=Date:Subject:To:Cc:References:From:In-Reply-To:From;
 b=Nw7bMaOF8ufYHe6MqVZzBMByfARWkJgdXpyvWH23G+2HkkUaw8FJraAxEGVvmhti8
 XJs5zDb2yAq0lmX5Hy1d2V0lJOy9A6j5HJUZjQd5yXz3O9MOpe+rmZS0+imqqPsLuV
 Z3Yb3oXkwEjk4pOzsfKYKZjBOGPsa5HkvncfP8fY=
Message-ID: <fcf6fa86-5dcb-412f-aa18-e4079814ca1d@ideasonboard.com>
Date: Thu, 19 Jun 2025 08:52:25 +0300
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH] drm/exynos: fimd: Guard display clock control with
 runtime PM calls
To: Marek Szyprowski <m.szyprowski@samsung.com>,
 dri-devel@lists.freedesktop.org, linux-samsung-soc@vger.kernel.org
Cc: Thomas Zimmermann <tzimmermann@suse.de>, Aradhya Bhatia
 <a-bhatia1@ti.com>, Aradhya Bhatia <aradhya.bhatia@linux.dev>,
 Inki Dae <inki.dae@samsung.com>, David Airlie <airlied@gmail.com>,
 Simona Vetter <simona@ffwll.ch>, Krzysztof Kozlowski <krzk@kernel.org>,
 Alim Akhtar <alim.akhtar@samsung.com>,
 Andrzej Hajda <andrzej.hajda@intel.com>
References: <CGME20250618120644eucas1p2b084977540772f3623f3f9e834604668@eucas1p2.samsung.com>
 <20250618120626.217023-1-m.szyprowski@samsung.com>
 <96b92a56-028f-452d-b2dd-8362491f5a84@ideasonboard.com>
 <a89ebc1f-82a0-4bb8-87a8-71a6b373ab24@samsung.com>
Content-Language: en-US
From: Tomi Valkeinen <tomi.valkeinen@ideasonboard.com>
Autocrypt: addr=tomi.valkeinen@ideasonboard.com; keydata=
 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
In-Reply-To: <a89ebc1f-82a0-4bb8-87a8-71a6b373ab24@samsung.com>
Content-Type: text/plain; charset=UTF-8
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
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

Hi,

On 19/06/2025 01:38, Marek Szyprowski wrote:
> On 18.06.2025 14:25, Tomi Valkeinen wrote:
>> On 18/06/2025 15:06, Marek Szyprowski wrote:
>>> Commit c9b1150a68d9 ("drm/atomic-helper: Re-order bridge chain pre-enable
>>> and post-disable") changed the call sequence to the CRTC enable/disable
>>> and bridge pre_enable/post_disable methods, so those bridge methods are
>>> now called when CRTC is not yet enabled.
>>>
>>> This causes a lockup observed on Samsung Peach-Pit/Pi Chromebooks. The
>>> source of this lockup is a call to fimd_dp_clock_enable() function, when
>>> FIMD device is not yet runtime resumed. It worked before the mentioned
>>> commit only because the CRTC implemented by the FIMD driver was always
>>> enabled what guaranteed the FIMD device to be runtime resumed.
>>>
>>> This patch adds runtime PM guards to the fimd_dp_clock_enable() function
>>> to enable its proper operation also when the CRTC implemented by FIMD is
>>> not yet enabled.
>>>
>>> Fixes: 196e059a8a6a ("drm/exynos: convert clock_enable crtc callback to pipeline clock")
>>> Signed-off-by: Marek Szyprowski <m.szyprowski@samsung.com>
>>> ---
>>>   drivers/gpu/drm/exynos/exynos_drm_fimd.c | 12 ++++++++++++
>>>   1 file changed, 12 insertions(+)
>>>
>>> diff --git a/drivers/gpu/drm/exynos/exynos_drm_fimd.c b/drivers/gpu/drm/exynos/exynos_drm_fimd.c
>>> index c394cc702d7d..205c238cc73a 100644
>>> --- a/drivers/gpu/drm/exynos/exynos_drm_fimd.c
>>> +++ b/drivers/gpu/drm/exynos/exynos_drm_fimd.c
>>> @@ -187,6 +187,7 @@ struct fimd_context {
>>>   	u32				i80ifcon;
>>>   	bool				i80_if;
>>>   	bool				suspended;
>>> +	bool				dp_clk_enabled;
>>>   	wait_queue_head_t		wait_vsync_queue;
>>>   	atomic_t			wait_vsync_event;
>>>   	atomic_t			win_updated;
>>> @@ -1047,7 +1048,18 @@ static void fimd_dp_clock_enable(struct exynos_drm_clk *clk, bool enable)
>>>   	struct fimd_context *ctx = container_of(clk, struct fimd_context,
>>>   						dp_clk);
>>>   	u32 val = enable ? DP_MIE_CLK_DP_ENABLE : DP_MIE_CLK_DISABLE;
>>> +
>>> +	if (enable == ctx->dp_clk_enabled)
>>> +		return;
>> Does this happen, i.e. is this function called multiple times with
>> enable set? If so, do you rather need ref counting here? Otherwise the
>> first fimd_dp_clock_enable(enable=false) call with disable the clock,
>> instead of the last (assuming the enable/disable calls are matched on
>> the caller side).
> 
> No reference counting is needed here, as the clock enable/disable is 
> called from runtime resume/suspend of the exynos_dp (analogix_dp_core) 
> and there are only single calls to enable or disable. The only problem 
> is that the first call is fimd_dp_clock_enable(enable=false), which 
> should be skipped from the fimd runtime PM perspective, that is why I 
> added the (enable == ctx->dp_clk_enabled) check.

I see. It's a bit confusing call pattern, but not related to this patch.

Reviewed-by: Tomi Valkeinen <tomi.valkeinen@ideasonboard.com>

 Tomi

