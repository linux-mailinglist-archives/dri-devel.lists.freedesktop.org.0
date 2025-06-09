Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 3DF79AD2146
	for <lists+dri-devel@lfdr.de>; Mon,  9 Jun 2025 16:48:08 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 4376B10E3F4;
	Mon,  9 Jun 2025 14:48:00 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from szxga07-in.huawei.com (szxga07-in.huawei.com [45.249.212.35])
 by gabe.freedesktop.org (Postfix) with ESMTPS id BD61A10E3F6
 for <dri-devel@lists.freedesktop.org>; Mon,  9 Jun 2025 14:47:57 +0000 (UTC)
Received: from mail.maildlp.com (unknown [172.19.163.17])
 by szxga07-in.huawei.com (SkyGuard) with ESMTP id 4bGF9n691Sz1fy6G;
 Mon,  9 Jun 2025 22:46:37 +0800 (CST)
Received: from dggemv712-chm.china.huawei.com (unknown [10.1.198.32])
 by mail.maildlp.com (Postfix) with ESMTPS id 8AA6D1A0188;
 Mon,  9 Jun 2025 22:47:55 +0800 (CST)
Received: from kwepemq100007.china.huawei.com (7.202.195.175) by
 dggemv712-chm.china.huawei.com (10.1.198.32) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.1544.11; Mon, 9 Jun 2025 22:47:55 +0800
Received: from [10.159.166.136] (10.159.166.136) by
 kwepemq100007.china.huawei.com (7.202.195.175) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.1544.11; Mon, 9 Jun 2025 22:47:54 +0800
Message-ID: <49a4644d-0e73-419a-aa53-0db69bd00833@huawei.com>
Date: Mon, 9 Jun 2025 22:47:50 +0800
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH drm-dp 02/10] drm/hisilicon/hibmc: fix dp probabilistical
 detect errors after HPD irq
To: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
CC: <xinliang.liu@linaro.org>, <tiantao6@hisilicon.com>,
 <maarten.lankhorst@linux.intel.com>, <mripard@kernel.org>,
 <tzimmermann@suse.de>, <airlied@gmail.com>, <daniel@ffwll.ch>,
 <kong.kongxinwei@hisilicon.com>, <liangjian010@huawei.com>,
 <chenjianmin@huawei.com>, <lidongming5@huawei.com>, <libaihan@huawei.com>,
 <shenjian15@huawei.com>, <shaojijie@huawei.com>,
 <jani.nikula@linux.intel.com>, <dri-devel@lists.freedesktop.org>,
 <linux-kernel@vger.kernel.org>, <shiyongbang@huawei.com>
References: <20250530095432.1206966-1-shiyongbang@huawei.com>
 <20250530095432.1206966-3-shiyongbang@huawei.com>
 <r3tnmjl5bnlyhgblhfqwouu57oh5tfpmfsrx5xczzmsovalvse@mujphkc4mv5k>
From: Yongbang Shi <shiyongbang@huawei.com>
In-Reply-To: <r3tnmjl5bnlyhgblhfqwouu57oh5tfpmfsrx5xczzmsovalvse@mujphkc4mv5k>
Content-Type: text/plain; charset="UTF-8"; format=flowed
Content-Transfer-Encoding: 7bit
X-Originating-IP: [10.159.166.136]
X-ClientProxiedBy: kwepems100002.china.huawei.com (7.221.188.206) To
 kwepemq100007.china.huawei.com (7.202.195.175)
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


> On Fri, May 30, 2025 at 05:54:24PM +0800, Yongbang Shi wrote:
>> From: Baihan Li <libaihan@huawei.com>
>>
>> The debouncing when HPD pulled out still remains sometimes, 200ms still can
>> not ensure helper_detect() is correct. So add a flag to hold the sink
>> status, and changed detect_ctx() functions by using flag to check status.
>>
>> Fixes: 3c7623fb5bb6 ("drm/hisilicon/hibmc: Enable this hot plug detect of irq feature")
>> Signed-off-by: Baihan Li <libaihan@huawei.com>
>> ---
>>   drivers/gpu/drm/hisilicon/hibmc/dp/dp_hw.h    |  1 +
>>   .../gpu/drm/hisilicon/hibmc/hibmc_drm_dp.c    | 38 +++++++++++++------
>>   2 files changed, 28 insertions(+), 11 deletions(-)
>>
>> diff --git a/drivers/gpu/drm/hisilicon/hibmc/dp/dp_hw.h b/drivers/gpu/drm/hisilicon/hibmc/dp/dp_hw.h
>> index 665f5b166dfb..68867475508c 100644
>> --- a/drivers/gpu/drm/hisilicon/hibmc/dp/dp_hw.h
>> +++ b/drivers/gpu/drm/hisilicon/hibmc/dp/dp_hw.h
>> @@ -50,6 +50,7 @@ struct hibmc_dp {
>>   	struct drm_dp_aux aux;
>>   	struct hibmc_dp_cbar_cfg cfg;
>>   	u32 irq_status;
>> +	int hpd_status;
>>   };
>>   
>>   int hibmc_dp_hw_init(struct hibmc_dp *dp);
>> diff --git a/drivers/gpu/drm/hisilicon/hibmc/hibmc_drm_dp.c b/drivers/gpu/drm/hisilicon/hibmc/hibmc_drm_dp.c
>> index d06832e62e96..191fb434baa7 100644
>> --- a/drivers/gpu/drm/hisilicon/hibmc/hibmc_drm_dp.c
>> +++ b/drivers/gpu/drm/hisilicon/hibmc/hibmc_drm_dp.c
>> @@ -13,7 +13,8 @@
>>   #include "hibmc_drm_drv.h"
>>   #include "dp/dp_hw.h"
>>   
>> -#define DP_MASKED_SINK_HPD_PLUG_INT	BIT(2)
>> +#define HIBMC_DP_MASKED_SINK_HPD_PLUG_INT	BIT(2)
>> +#define HIBMC_DP_MASKED_SINK_HPD_UNPLUG_INT	BIT(3)
>>   
>>   static int hibmc_dp_connector_get_modes(struct drm_connector *connector)
>>   {
>> @@ -34,9 +35,12 @@ static int hibmc_dp_connector_get_modes(struct drm_connector *connector)
>>   static int hibmc_dp_detect(struct drm_connector *connector,
>>   			   struct drm_modeset_acquire_ctx *ctx, bool force)
>>   {
>> -	mdelay(200);
>> +	struct hibmc_dp *dp = to_hibmc_dp(connector);
>>   
>> -	return drm_connector_helper_detect_from_ddc(connector, ctx, force);
>> +	if (dp->hpd_status)
>> +		return connector_status_connected;
>> +	else
>> +		return connector_status_disconnected;
>>   }
>>   
>>   static const struct drm_connector_helper_funcs hibmc_dp_conn_helper_funcs = {
>> @@ -115,22 +119,34 @@ irqreturn_t hibmc_dp_hpd_isr(int irq, void *arg)
>>   {
>>   	struct drm_device *dev = (struct drm_device *)arg;
>>   	struct hibmc_drm_private *priv = to_hibmc_drm_private(dev);
>> +	struct hibmc_dp *dp = &priv->dp;
>>   	int idx;
>>   
>>   	if (!drm_dev_enter(dev, &idx))
>>   		return -ENODEV;
>>   
>> -	if (priv->dp.irq_status & DP_MASKED_SINK_HPD_PLUG_INT) {
>> -		drm_dbg_dp(&priv->dev, "HPD IN isr occur!\n");
>> -		hibmc_dp_hpd_cfg(&priv->dp);
>> +	if (dp->hpd_status) { /* only check unplug int when the last status is HPD in */
> I think this way you'll ignore HPD short pulses. Could you possibly
> clarify whether it is the case or not?

We actually doesn't enable short HPD here, this feature just used in our electrical tests.


>> +		if ((dp->irq_status & HIBMC_DP_MASKED_SINK_HPD_UNPLUG_INT)) {
>> +			drm_dbg_dp(dev, "HPD OUT isr occur.");
>> +			hibmc_dp_reset_link(dp);
>> +			dp->hpd_status = 0;
>> +			if (dev->registered)
>> +				drm_connector_helper_hpd_irq_event(&dp->connector);
>> +		} else {
>> +			drm_warn(dev, "HPD OUT occurs, irq status err: %u", dp->irq_status);
> These should be ratelimited.

Sorry, I didn't get it. Do you mean I need print the link rate here?


>> +		}
>>   	} else {
>> -		drm_dbg_dp(&priv->dev, "HPD OUT isr occur!\n");
>> -		hibmc_dp_reset_link(&priv->dp);
>> +		if (dp->irq_status & HIBMC_DP_MASKED_SINK_HPD_PLUG_INT) {
>> +			drm_dbg_dp(&priv->dev, "HPD IN isr occur.");
>> +			hibmc_dp_hpd_cfg(dp);
>> +			dp->hpd_status = 1;
>> +			if (dev->registered)
>> +				drm_connector_helper_hpd_irq_event(&dp->connector);
>> +		} else {
>> +			drm_warn(dev, "HPD IN occurs, irq status err: %u", dp->irq_status);
>> +		}
>>   	}
>>   
>> -	if (dev->registered)
>> -		drm_connector_helper_hpd_irq_event(&priv->dp.connector);
> There is no need to, just call this function always at the end of the
> ISR handler as it is done currently.

Ok.


>> -
>>   	drm_dev_exit(idx);
>>   
>>   	return IRQ_HANDLED;
>> -- 
>> 2.33.0
>>
