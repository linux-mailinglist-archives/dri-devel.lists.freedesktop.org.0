Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 21A83B3439B
	for <lists+dri-devel@lfdr.de>; Mon, 25 Aug 2025 16:26:14 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 7523110E4BB;
	Mon, 25 Aug 2025 14:26:12 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (1024-bit key; unprotected) header.d=samsung.com header.i=@samsung.com header.b="OONYzdpi";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mailout1.w1.samsung.com (mailout1.w1.samsung.com
 [210.118.77.11])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 1DF1B10E4BB
 for <dri-devel@lists.freedesktop.org>; Mon, 25 Aug 2025 14:26:11 +0000 (UTC)
Received: from eucas1p1.samsung.com (unknown [182.198.249.206])
 by mailout1.w1.samsung.com (KnoxPortal) with ESMTP id
 20250825142609euoutp01e8d7ea916da17902db83adc126f259f8~fCLje6Q-e1749917499euoutp01h
 for <dri-devel@lists.freedesktop.org>; Mon, 25 Aug 2025 14:26:09 +0000 (GMT)
DKIM-Filter: OpenDKIM Filter v2.11.0 mailout1.w1.samsung.com
 20250825142609euoutp01e8d7ea916da17902db83adc126f259f8~fCLje6Q-e1749917499euoutp01h
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=samsung.com;
 s=mail20170921; t=1756131969;
 bh=+/fhlaFQpc9GWye8OcasT16gmUpaIUbWQDT9KvPLfwM=;
 h=Date:Subject:To:Cc:From:In-Reply-To:References:From;
 b=OONYzdpiR5yidVbIpwQKR5Nxp54WV08CgIO23BBl8VHuPi0BBKD+Un0Psa2PE0rsT
 M/H3LSDgxIstsLqsIQBxQr+bjDAQ5cKRaenInGRmmU3rd5yor6k1bRC/C8osUeSc6K
 Aklm3NcJvyStuLIKBJE7OUWiWPPdBdCfn03yjvqM=
Received: from eusmtip2.samsung.com (unknown [203.254.199.222]) by
 eucas1p1.samsung.com (KnoxPortal) with ESMTPA id
 20250825142609eucas1p164334c203abbc296bbbce60f9b6840a5~fCLi1GS9n0240502405eucas1p1j;
 Mon, 25 Aug 2025 14:26:09 +0000 (GMT)
Received: from [106.210.134.192] (unknown [106.210.134.192]) by
 eusmtip2.samsung.com (KnoxPortal) with ESMTPA id
 20250825142606eusmtip29798f7b6677e4c6c11c859ab5a5459c7~fCLgRwoo-0270802708eusmtip2b;
 Mon, 25 Aug 2025 14:26:06 +0000 (GMT)
Message-ID: <567789e1-8c17-4603-9f27-b33470f6a165@samsung.com>
Date: Mon, 25 Aug 2025 16:26:05 +0200
MIME-Version: 1.0
User-Agent: Betterbird (Windows)
Subject: Re: [PATCH v1] drm/bridge: analogix_dp: Reuse
 &link_train.training_lane[] to set DPCD DP_TRAINING_LANEx_SET
To: Damon Ding <damon.ding@rock-chips.com>, andrzej.hajda@intel.com,
 neil.armstrong@linaro.org, rfoss@kernel.org
Cc: Laurent.pinchart@ideasonboard.com, jonas@kwiboo.se,
 jernej.skrabec@gmail.com, maarten.lankhorst@linux.intel.com,
 mripard@kernel.org, tzimmermann@suse.de, airlied@gmail.com, simona@ffwll.ch,
 dmitry.baryshkov@oss.qualcomm.com, dianders@chromium.org,
 andy.yan@rock-chips.com, dri-devel@lists.freedesktop.org,
 linux-kernel@vger.kernel.org
Content-Language: en-US
From: Marek Szyprowski <m.szyprowski@samsung.com>
In-Reply-To: <20250824034138.3207855-1-damon.ding@rock-chips.com>
Content-Transfer-Encoding: 7bit
X-CMS-MailID: 20250825142609eucas1p164334c203abbc296bbbce60f9b6840a5
X-Msg-Generator: CA
Content-Type: text/plain; charset="utf-8"
X-RootMTR: 20250824034253eucas1p2fa1ad3da751f4d0ac9645ec277cf4563
X-EPHeader: CA
X-CMS-RootMailID: 20250824034253eucas1p2fa1ad3da751f4d0ac9645ec277cf4563
References: <CGME20250824034253eucas1p2fa1ad3da751f4d0ac9645ec277cf4563@eucas1p2.samsung.com>
 <20250824034138.3207855-1-damon.ding@rock-chips.com>
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

On 24.08.2025 05:41, Damon Ding wrote:
> In analogix_dp_link_start(), &link_train.training_lane[] is used to
> set phy PE/VS configurations, and buf[] is initialized with the same
> values to set DPCD DP_TRAINING_LANEx_SET.
>
> It makes sense to reuse &link_train.training_lane[] to set DPCD
> DP_TRAINING_LANEx_SET, which can remove the redundant assignments
> and make codes more consice.
>
> Signed-off-by: Damon Ding <damon.ding@rock-chips.com>
Tested-by: Marek Szyprowski <m.szyprowski@samsung.com>
> ---
>   drivers/gpu/drm/bridge/analogix/analogix_dp_core.c | 8 ++------
>   1 file changed, 2 insertions(+), 6 deletions(-)
>
> diff --git a/drivers/gpu/drm/bridge/analogix/analogix_dp_core.c b/drivers/gpu/drm/bridge/analogix/analogix_dp_core.c
> index ed35e567d117..ec8443d66075 100644
> --- a/drivers/gpu/drm/bridge/analogix/analogix_dp_core.c
> +++ b/drivers/gpu/drm/bridge/analogix/analogix_dp_core.c
> @@ -281,12 +281,8 @@ static int analogix_dp_link_start(struct analogix_dp_device *dp)
>   	if (retval < 0)
>   		return retval;
>   
> -	for (lane = 0; lane < lane_count; lane++)
> -		buf[lane] = DP_TRAIN_PRE_EMPH_LEVEL_0 |
> -			    DP_TRAIN_VOLTAGE_SWING_LEVEL_0;
> -
> -	retval = drm_dp_dpcd_write(&dp->aux, DP_TRAINING_LANE0_SET, buf,
> -				   lane_count);
> +	retval = drm_dp_dpcd_write(&dp->aux, DP_TRAINING_LANE0_SET,
> +				   dp->link_train.training_lane, lane_count);
>   	if (retval < 0)
>   		return retval;
>   

Best regards
-- 
Marek Szyprowski, PhD
Samsung R&D Institute Poland

