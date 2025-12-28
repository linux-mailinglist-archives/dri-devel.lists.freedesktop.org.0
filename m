Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id DE855CE4A53
	for <lists+dri-devel@lfdr.de>; Sun, 28 Dec 2025 09:52:40 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id B96CC1120C7;
	Sun, 28 Dec 2025 08:52:37 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (1024-bit key; unprotected) header.d=rock-chips.com header.i=@rock-chips.com header.b="Z76NvJSA";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
X-Greylist: delayed 303 seconds by postgrey-1.36 at gabe;
 Sun, 28 Dec 2025 08:52:35 UTC
Received: from mail-m82129.xmail.ntesmail.com (mail-m82129.xmail.ntesmail.com
 [156.224.82.129])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 77B5B1120C7
 for <dri-devel@lists.freedesktop.org>; Sun, 28 Dec 2025 08:52:35 +0000 (UTC)
Received: from [172.16.12.43] (unknown [58.22.7.114])
 by smtp.qiye.163.com (Hmail) with ESMTP id 2ec8cc627;
 Sun, 28 Dec 2025 16:47:27 +0800 (GMT+08:00)
Message-ID: <469f900d-1352-4137-94ec-4daeb5b7a998@rock-chips.com>
Date: Sun, 28 Dec 2025 16:47:25 +0800
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [RESEND v3] drm/bridge: analogix_dp: Reuse
 &link_train.training_lane[] to set DPCD DP_TRAINING_LANEx_SET
To: andrzej.hajda@intel.com, neil.armstrong@linaro.org, rfoss@kernel.org
Cc: Laurent.pinchart@ideasonboard.com, jonas@kwiboo.se,
 jernej.skrabec@gmail.com, maarten.lankhorst@linux.intel.com,
 mripard@kernel.org, tzimmermann@suse.de, airlied@gmail.com, simona@ffwll.ch,
 dmitry.baryshkov@oss.qualcomm.com, dianders@chromium.org,
 m.szyprowski@samsung.com, andy.yan@rock-chips.com,
 dri-devel@lists.freedesktop.org, linux-kernel@vger.kernel.org
References: <20251111022103.1350183-1-damon.ding@rock-chips.com>
Content-Language: en-US
From: Damon Ding <damon.ding@rock-chips.com>
In-Reply-To: <20251111022103.1350183-1-damon.ding@rock-chips.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-HM-Tid: 0a9b64241d3b03a3kunm82b17a0c1c0950
X-HM-MType: 1
X-HM-Spam-Status: e1kfGhgUHx5ZQUpXWQgPGg8OCBgUHx5ZQUlOS1dZFg8aDwILHllBWSg2Ly
 tZV1koWUFDSUNOT01LS0k3V1ktWUFJV1kPCRoVCBIfWUFZQhkdS1ZPT0kaQ08dHUNISEhWFRQJFh
 oXVRMBExYaEhckFA4PWVdZGBILWUFZTkNVSUlVTFVKSk9ZV1kWGg8SFR0UWUFZT0tIVUpLSEpKQk
 xVSktLVUpCS0tZBg++
DKIM-Signature: a=rsa-sha256;
 b=Z76NvJSAgROd5gPtXcZi+ExsVLacwPFhFFrWfpqfe1rOrv5tyuttLwUNfNL66ZuNAGCK5vk9F0IZn8WPSvNHUzWtAoLPFToXB9m1mkMPZDBY2CRISWAINQB6ZJ8HGTSqIrjagaiGD7msXN2ncLEBUYLWj4cs0CkPT3ylkRS2SlU=;
 c=relaxed/relaxed; s=default; d=rock-chips.com; v=1; 
 bh=LAKChGK/jlN8bmWUU/MgPZqrpCIuy+LnVeYX41YXAvk=;
 h=date:mime-version:subject:message-id:from;
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

On 11/11/2025 10:21 AM, Damon Ding wrote:
> In analogix_dp_link_start(), &link_train.training_lane[] is used to
> set phy PE/VS configurations, and buf[] is initialized with the same
> values to set DPCD DP_TRAINING_LANEx_SET.
> 
> It makes sense to reuse &link_train.training_lane[] to set DPCD
> DP_TRAINING_LANEx_SET, which can remove the redundant assignments
> and make codes more concise.
> 
> Signed-off-by: Damon Ding <damon.ding@rock-chips.com>
> Tested-by: Marek Szyprowski <m.szyprowski@samsung.com>
> Reviewed-by: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
> 
> ---
> 
> Changes in v2:
> - Add Tested-by tag.
> 
> Changes in v3:
> - Add Reviewed-by tag.
> - Fix the spelling error 'consice' to 'concise'.

Gentle ping.

I just added tags in v2 and v3, and I also tried resend. The patch is 
merely a pre-optimization work for the following patch series:

https://lore.kernel.org/all/20251217093321.3108939-1-damon.ding@rock-chips.com/

> ---
>   drivers/gpu/drm/bridge/analogix/analogix_dp_core.c | 8 ++------
>   1 file changed, 2 insertions(+), 6 deletions(-)
> 
> diff --git a/drivers/gpu/drm/bridge/analogix/analogix_dp_core.c b/drivers/gpu/drm/bridge/analogix/analogix_dp_core.c
> index 6ec3d811b5f0..1e834d3656c1 100644
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

