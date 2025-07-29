Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 8819EB146DC
	for <lists+dri-devel@lfdr.de>; Tue, 29 Jul 2025 05:28:03 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 8827610E5AF;
	Tue, 29 Jul 2025 03:28:00 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (1024-bit key; unprotected) header.d=rock-chips.com header.i=@rock-chips.com header.b="LiMF/V4r";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-m3299.qiye.163.com (mail-m3299.qiye.163.com
 [220.197.32.99])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 8D65A10E5AF
 for <dri-devel@lists.freedesktop.org>; Tue, 29 Jul 2025 03:27:58 +0000 (UTC)
Received: from [172.16.12.26] (unknown [58.22.7.114])
 by smtp.qiye.163.com (Hmail) with ESMTP id 1d8de167e;
 Tue, 29 Jul 2025 11:22:50 +0800 (GMT+08:00)
Message-ID: <63226b37-1dec-4998-b2b6-e969ca786f37@rock-chips.com>
Date: Tue, 29 Jul 2025 11:22:49 +0800
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v3 03/14] drm/rockchip: analogix_dp: Apply
 drmm_encoder_init() instead of drm_simple_encoder_init()
To: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
Cc: andrzej.hajda@intel.com, neil.armstrong@linaro.org, rfoss@kernel.org,
 Laurent.pinchart@ideasonboard.com, jonas@kwiboo.se,
 jernej.skrabec@gmail.com, maarten.lankhorst@linux.intel.com,
 mripard@kernel.org, tzimmermann@suse.de, airlied@gmail.com, simona@ffwll.ch,
 jingoohan1@gmail.com, inki.dae@samsung.com, sw0312.kim@samsung.com,
 kyungmin.park@samsung.com, krzk@kernel.org, alim.akhtar@samsung.com,
 hjc@rock-chips.com, heiko@sntech.de, andy.yan@rock-chips.com,
 l.stach@pengutronix.de, dianders@chromium.org,
 dri-devel@lists.freedesktop.org, linux-kernel@vger.kernel.org,
 linux-arm-kernel@lists.infradead.org, linux-samsung-soc@vger.kernel.org,
 linux-rockchip@lists.infradead.org
References: <20250724080304.3572457-1-damon.ding@rock-chips.com>
 <20250724080304.3572457-4-damon.ding@rock-chips.com>
 <6psjcrhbnk7czdrdtxh65kr6qvygkwogvert75dg2svbm2cqd3@uhffyfdxqpec>
Content-Language: en-US
From: Damon Ding <damon.ding@rock-chips.com>
In-Reply-To: <6psjcrhbnk7czdrdtxh65kr6qvygkwogvert75dg2svbm2cqd3@uhffyfdxqpec>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-HM-Tid: 0a9854344c1803a3kunmbc6d5ef53b5bbd
X-HM-MType: 1
X-HM-Spam-Status: e1kfGhgUHx5ZQUpXWQgPGg8OCBgUHx5ZQUlOS1dZFg8aDwILHllBWSg2Ly
 tZV1koWUFDSUNOT01LS0k3V1ktWUFJV1kPCRoVCBIfWUFZGklKGlZIHx1LHkkeSx9DH09WFRQJFh
 oXVRMBExYaEhckFA4PWVdZGBILWUFZTkNVSUlVTFVKSk9ZV1kWGg8SFR0UWUFZT0tIVUpLSU9PT0
 hVSktLVUpCS0tZBg++
DKIM-Signature: a=rsa-sha256;
 b=LiMF/V4rH3QqRzk0VLBeqKLCLbx/NP1Emxe528xmhWl9Zye0NFzYX4UPlWJWn/fBxk/znUKcFCVyqFWK/urEAE3LRP6IEmQNllUopbTDUvA9KZ7BnHHZB1R5zzAf8eLa+eIeuBYiAe2DouhqA3FKqaEfD9JHKsZvXXMvHM6RQTY=;
 c=relaxed/relaxed; s=default; d=rock-chips.com; v=1; 
 bh=n/oZwA3AlTNfmx4P7C3GWExCuKTHEtbzFqxGSx8S9/k=;
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

Hi Dmitry,

On 2025/7/26 8:12, Dmitry Baryshkov wrote:
> On Thu, Jul 24, 2025 at 04:02:53PM +0800, Damon Ding wrote:
>> Compared with drm_simple_encoder_init(), drmm_encoder_init() can handle
>> the cleanup automatically through registering drm_encoder_cleanup() with
>> drmm_add_action().
>>
>> Signed-off-by: Damon Ding <damon.ding@rock-chips.com>
>> ---
>>   drivers/gpu/drm/rockchip/analogix_dp-rockchip.c | 4 +---
>>   1 file changed, 1 insertion(+), 3 deletions(-)
>>
>> diff --git a/drivers/gpu/drm/rockchip/analogix_dp-rockchip.c b/drivers/gpu/drm/rockchip/analogix_dp-rockchip.c
>> index d30f0983a53a..4ed6bf9e5377 100644
>> --- a/drivers/gpu/drm/rockchip/analogix_dp-rockchip.c
>> +++ b/drivers/gpu/drm/rockchip/analogix_dp-rockchip.c
>> @@ -29,7 +29,6 @@
>>   #include <drm/drm_of.h>
>>   #include <drm/drm_panel.h>
>>   #include <drm/drm_probe_helper.h>
>> -#include <drm/drm_simple_kms_helper.h>
>>   
>>   #include "rockchip_drm_drv.h"
>>   
>> @@ -377,8 +376,7 @@ static int rockchip_dp_drm_create_encoder(struct rockchip_dp_device *dp)
>>   							     dev->of_node);
>>   	DRM_DEBUG_KMS("possible_crtcs = 0x%x\n", encoder->possible_crtcs);
>>   
>> -	ret = drm_simple_encoder_init(drm_dev, encoder,
>> -				      DRM_MODE_ENCODER_TMDS);
>> +	ret = drmm_encoder_init(drm_dev, encoder, NULL, DRM_MODE_ENCODER_TMDS, NULL);
> 
> It's not possible to use drmm_encoder_init() here. Per the documentation
> the encoder data structure should be allocated by drmm_kzalloc().
> However this drm_encoder is a part of struct rockchip_dp_device. It's
> allocated by rockchip_dp_probe() via devm_kzalloc(). This means that it
> can potentially be freed before the drm device is completely released,
> creating a use-after-free error.
> 
>>   	if (ret) {
>>   		DRM_ERROR("failed to initialize encoder with drm\n");
>>   		return ret;
>> -- 
>> 2.34.1
>>
> 

Got it. This patch will be dropped in the next version.

Best regards,
Damon

