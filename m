Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 91917B9D216
	for <lists+dri-devel@lfdr.de>; Thu, 25 Sep 2025 04:24:40 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 85C0910E821;
	Thu, 25 Sep 2025 02:24:37 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (1024-bit key; unprotected) header.d=rock-chips.com header.i=@rock-chips.com header.b="GsGZ+ILQ";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-m19731109.qiye.163.com (mail-m19731109.qiye.163.com
 [220.197.31.109])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 71B9110E821
 for <dri-devel@lists.freedesktop.org>; Thu, 25 Sep 2025 02:24:35 +0000 (UTC)
Received: from [172.16.12.26] (unknown [58.22.7.114])
 by smtp.qiye.163.com (Hmail) with ESMTP id 23f99a352;
 Thu, 25 Sep 2025 10:19:27 +0800 (GMT+08:00)
Message-ID: <be24f371-3afa-47ce-a5e8-26f3fac9b6ba@rock-chips.com>
Date: Thu, 25 Sep 2025 10:19:26 +0800
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v5 15/17] drm/bridge: analogix_dp: Remove panel disabling
 and enabling in analogix_dp_set_bridge()
To: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
Cc: andrzej.hajda@intel.com, neil.armstrong@linaro.org, rfoss@kernel.org,
 Laurent.pinchart@ideasonboard.com, jonas@kwiboo.se,
 jernej.skrabec@gmail.com, maarten.lankhorst@linux.intel.com,
 mripard@kernel.org, tzimmermann@suse.de, airlied@gmail.com, simona@ffwll.ch,
 jingoohan1@gmail.com, inki.dae@samsung.com, sw0312.kim@samsung.com,
 kyungmin.park@samsung.com, krzk@kernel.org, alim.akhtar@samsung.com,
 hjc@rock-chips.com, heiko@sntech.de, andy.yan@rock-chips.com,
 dianders@chromium.org, m.szyprowski@samsung.com, luca.ceresoli@bootlin.com,
 dri-devel@lists.freedesktop.org, linux-kernel@vger.kernel.org,
 linux-arm-kernel@lists.infradead.org, linux-samsung-soc@vger.kernel.org,
 linux-rockchip@lists.infradead.org
References: <20250912085846.7349-1-damon.ding@rock-chips.com>
 <20250912085846.7349-16-damon.ding@rock-chips.com>
 <tywxkfjhulxsgdphngtfs24whslbkmnza7yx2sb7c4ulea6val@46pi6e2sjs6c>
Content-Language: en-US
From: Damon Ding <damon.ding@rock-chips.com>
In-Reply-To: <tywxkfjhulxsgdphngtfs24whslbkmnza7yx2sb7c4ulea6val@46pi6e2sjs6c>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-HM-Tid: 0a997eab1b8503a3kunm2418fa8d88dbd
X-HM-MType: 1
X-HM-Spam-Status: e1kfGhgUHx5ZQUpXWQgPGg8OCBgUHx5ZQUlOS1dZFg8aDwILHllBWSg2Ly
 tZV1koWUFDSUNOT01LS0k3V1ktWUFJV1kPCRoVCBIfWUFZGksfSFZLQ0NNT0tPSB1JGhhWFRQJFh
 oXVRMBExYaEhckFA4PWVdZGBILWUFZTkNVSUlVTFVKSk9ZV1kWGg8SFR0UWUFZT0tIVUpLSU9PT0
 hVSktLVUpCS0tZBg++
DKIM-Signature: a=rsa-sha256;
 b=GsGZ+ILQSnhzfvkwCAq4Z5+SIR0C9MOYar77DGQSbSeGev+Jr7L0Oq+AJf75d65bd6zyRrxMuhWK8gclELJ4evu+yYA7/9XQBUMFnRBep9EUwls+dIUpkvslnvd0hq55ReRjD8rAi0041WcrraaNBRTCVlfzPkJmY1YFlPIkZ8k=;
 c=relaxed/relaxed; s=default; d=rock-chips.com; v=1; 
 bh=RPN3KyxMz8emyUFUk3HlxuaTyBLn7qeeJmHvt/BIWwI=;
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

On 9/12/2025 7:09 PM, Dmitry Baryshkov wrote:
> On Fri, Sep 12, 2025 at 04:58:44PM +0800, Damon Ding wrote:
>> The &drm_panel_funcs.enable() and &drm_panel_funcs.disable() mainly
>> help turn on/off the backlight to make the image visible, and the
>> backlight operations are even needless if drm_panel_of_backlight() or
>> drm_panel_dp_aux_backlight() is applied, in which case the enabling
>> and disabling process just add necessary delays.
> 
> Not necessary, it can actually be turning the panel off and on. Maybe
> it's worth squashing this patch into the panel_bridge conversion as it
> will point out that these functions are still being called at a correct
> times by the DRM bridge framework.
> 

Will do in v6.

>>
>> Therefore, it should make sense to remove panel disabling and move
>> panel enabling after analogix_dp_set_bridge() finished.
>>
>> Signed-off-by: Damon Ding <damon.ding@rock-chips.com>
>> ---
>>   drivers/gpu/drm/bridge/analogix/analogix_dp_core.c | 7 +------
>>   1 file changed, 1 insertion(+), 6 deletions(-)
>>
>> diff --git a/drivers/gpu/drm/bridge/analogix/analogix_dp_core.c b/drivers/gpu/drm/bridge/analogix/analogix_dp_core.c
>> index 66d0cca1f268..c98058e9c917 100644
>> --- a/drivers/gpu/drm/bridge/analogix/analogix_dp_core.c
>> +++ b/drivers/gpu/drm/bridge/analogix/analogix_dp_core.c
>> @@ -749,9 +749,6 @@ static int analogix_dp_commit(struct analogix_dp_device *dp)
>>   {
>>   	int ret;
>>   
>> -	/* Keep the panel disabled while we configure video */
>> -	drm_panel_disable(dp->plat_data->panel);
>> -
>>   	ret = analogix_dp_train_link(dp);
>>   	if (ret) {
>>   		dev_err(dp->dev, "unable to do link train, ret=%d\n", ret);
>> @@ -771,9 +768,6 @@ static int analogix_dp_commit(struct analogix_dp_device *dp)
>>   		return ret;
>>   	}
>>   
>> -	/* Safe to enable the panel now */
>> -	drm_panel_enable(dp->plat_data->panel);
>> -
>>   	/* Check whether panel supports fast training */
>>   	ret = analogix_dp_fast_link_train_detection(dp);
>>   	if (ret)
>> @@ -1156,6 +1150,7 @@ static void analogix_dp_bridge_atomic_enable(struct drm_bridge *bridge,
>>   	while (timeout_loop < MAX_PLL_LOCK_LOOP) {
>>   		if (analogix_dp_set_bridge(dp) == 0) {
>>   			dp->dpms_mode = DRM_MODE_DPMS_ON;
>> +			drm_panel_enable(dp->plat_data->panel);
>>   			return;
>>   		}
>>   		dev_err(dp->dev, "failed to set bridge, retry: %d\n",
>> -- 
>> 2.34.1
>>
> 

Best regards,
Damon

