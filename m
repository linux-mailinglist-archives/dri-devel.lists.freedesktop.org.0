Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 7596CB52D59
	for <lists+dri-devel@lfdr.de>; Thu, 11 Sep 2025 11:32:48 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id C9FF710EA65;
	Thu, 11 Sep 2025 09:32:46 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from szxga04-in.huawei.com (szxga04-in.huawei.com [45.249.212.190])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 9AAB810EA65
 for <dri-devel@lists.freedesktop.org>; Thu, 11 Sep 2025 09:32:45 +0000 (UTC)
Received: from mail.maildlp.com (unknown [172.19.162.112])
 by szxga04-in.huawei.com (SkyGuard) with ESMTP id 4cMsfy2fm9z2CgjF;
 Thu, 11 Sep 2025 17:28:10 +0800 (CST)
Received: from dggemv712-chm.china.huawei.com (unknown [10.1.198.32])
 by mail.maildlp.com (Postfix) with ESMTPS id 0CA4F1400CB;
 Thu, 11 Sep 2025 17:32:43 +0800 (CST)
Received: from kwepemq100007.china.huawei.com (7.202.195.175) by
 dggemv712-chm.china.huawei.com (10.1.198.32) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.1544.11; Thu, 11 Sep 2025 17:32:42 +0800
Received: from [10.159.166.136] (10.159.166.136) by
 kwepemq100007.china.huawei.com (7.202.195.175) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.1544.11; Thu, 11 Sep 2025 17:32:42 +0800
Message-ID: <8bbfd02f-138d-420c-b456-10d0c913f46e@huawei.com>
Date: Thu, 11 Sep 2025 17:32:40 +0800
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v4 drm-dp 02/11] drm/hisilicon/hibmc: fix dp
 probabilistical detect errors after HPD irq
To: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
CC: <xinliang.liu@linaro.org>, <tiantao6@hisilicon.com>,
 <maarten.lankhorst@linux.intel.com>, <mripard@kernel.org>,
 <tzimmermann@suse.de>, <airlied@gmail.com>, <daniel@ffwll.ch>,
 <kong.kongxinwei@hisilicon.com>, <liangjian010@huawei.com>,
 <chenjianmin@huawei.com>, <fengsheng5@huawei.com>, <libaihan@huawei.com>,
 <shenjian15@huawei.com>, <shaojijie@huawei.com>,
 <dri-devel@lists.freedesktop.org>, <linux-kernel@vger.kernel.org>,
 <shiyongbang@huawei.com>
References: <20250813094238.3722345-1-shiyongbang@huawei.com>
 <20250813094238.3722345-3-shiyongbang@huawei.com>
 <aayi7zjrmru2ancexrqmcutams6ohde3nrkhqacixwp45dsk4v@7ig6hqzahdxf>
 <1dd93bb7-4f67-4b9b-8b6a-d7c5c77cf807@huawei.com>
 <ce47v3y77uc4dunlwyvmfe6j7d7mza4zfrbvu5dz67t66jdlop@vqgv47saj37i>
From: Yongbang Shi <shiyongbang@huawei.com>
In-Reply-To: <ce47v3y77uc4dunlwyvmfe6j7d7mza4zfrbvu5dz67t66jdlop@vqgv47saj37i>
Content-Type: text/plain; charset="UTF-8"; format=flowed
Content-Transfer-Encoding: 7bit
X-Originating-IP: [10.159.166.136]
X-ClientProxiedBy: kwepems100001.china.huawei.com (7.221.188.238) To
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


> On Thu, Aug 14, 2025 at 08:19:41PM +0800, Yongbang Shi wrote:
>>> On Wed, Aug 13, 2025 at 05:42:29PM +0800, Yongbang Shi wrote:
>>>> From: Baihan Li <libaihan@huawei.com>
>>>>
>>>> The debouncing when HPD pulled out still remains sometimes, 200ms still can
>>>> not ensure helper_detect() is correct. So add a flag to hold the sink
>>>> status, and changed detect_ctx() functions by using flag to check status.
>>> THis doesn't explain what is wrong with
>>> drm_connector_helper_detect_from_ddc(). In the end, this function
>>> doesn't use the HPD pin.
>> I'm sorry about the misunderstanding.
>> The issue is that after plugging or unplugging the monitor, the driver takes no action sometimes
>> even though an interrupt is triggered. The root cause is that drm_connector_helper_detect_from_ddc()
>> still returns connected status when the monitor is unplugged.
>> And I will fix the way in the end.
> Can you perform a normal DP detection: read DPCD and check that there is
> a DPRX attached and that it's either non-branch device or it has one or
> more sinks?

I'm very sorry that I didn't get the last sentence's asking before.
It's a non-branch device. We just connect a DP monitor.

Thanks,
Baihan Li!

>> Thanks,
>> Baihan Li!
>>
>>
>>>> Fixes: 3c7623fb5bb6 ("drm/hisilicon/hibmc: Enable this hot plug detect of irq feature")
>>>> Signed-off-by: Baihan Li <libaihan@huawei.com>
>>>> Signed-off-by: Yongbang Shi <shiyongbang@huawei.com>
>>>> ---
>>>> ChangeLog:
>>>> v3 -> v4:
>>>>     - remove link training process in hibmc_dp_detect(), suggested by Dmitry Baryshkov.
>>>>     - remove if (dev->registered), suggested by Dmitry Baryshkov.
>>>> ---
>>>>    drivers/gpu/drm/hisilicon/hibmc/dp/dp_hw.h    |  1 +
>>>>    .../gpu/drm/hisilicon/hibmc/hibmc_drm_dp.c    | 19 ++++++++++++-------
>>>>    2 files changed, 13 insertions(+), 7 deletions(-)
>>>>
>>>> diff --git a/drivers/gpu/drm/hisilicon/hibmc/dp/dp_hw.h b/drivers/gpu/drm/hisilicon/hibmc/dp/dp_hw.h
>>>> index 665f5b166dfb..68867475508c 100644
>>>> --- a/drivers/gpu/drm/hisilicon/hibmc/dp/dp_hw.h
>>>> +++ b/drivers/gpu/drm/hisilicon/hibmc/dp/dp_hw.h
>>>> @@ -50,6 +50,7 @@ struct hibmc_dp {
>>>>    	struct drm_dp_aux aux;
>>>>    	struct hibmc_dp_cbar_cfg cfg;
>>>>    	u32 irq_status;
>>>> +	int hpd_status;
>>>>    };
>>>>    int hibmc_dp_hw_init(struct hibmc_dp *dp);
>>>> diff --git a/drivers/gpu/drm/hisilicon/hibmc/hibmc_drm_dp.c b/drivers/gpu/drm/hisilicon/hibmc/hibmc_drm_dp.c
>>>> index d06832e62e96..ded38530ecda 100644
>>>> --- a/drivers/gpu/drm/hisilicon/hibmc/hibmc_drm_dp.c
>>>> +++ b/drivers/gpu/drm/hisilicon/hibmc/hibmc_drm_dp.c
>>>> @@ -34,9 +34,12 @@ static int hibmc_dp_connector_get_modes(struct drm_connector *connector)
>>>>    static int hibmc_dp_detect(struct drm_connector *connector,
>>>>    			   struct drm_modeset_acquire_ctx *ctx, bool force)
>>>>    {
>>>> -	mdelay(200);
>>>> +	struct hibmc_dp *dp = to_hibmc_dp(connector);
>>>> -	return drm_connector_helper_detect_from_ddc(connector, ctx, force);
>>>> +	if (dp->hpd_status)
>>>> +		return connector_status_connected;
>>>> +	else
>>>> +		return connector_status_disconnected;
>>>>    }
>>>>    static const struct drm_connector_helper_funcs hibmc_dp_conn_helper_funcs = {
>>>> @@ -115,21 +118,23 @@ irqreturn_t hibmc_dp_hpd_isr(int irq, void *arg)
>>>>    {
>>>>    	struct drm_device *dev = (struct drm_device *)arg;
>>>>    	struct hibmc_drm_private *priv = to_hibmc_drm_private(dev);
>>>> +	struct hibmc_dp *dp = &priv->dp;
>>>>    	int idx;
>>>>    	if (!drm_dev_enter(dev, &idx))
>>>>    		return -ENODEV;
>>>> -	if (priv->dp.irq_status & DP_MASKED_SINK_HPD_PLUG_INT) {
>>>> +	if (((dp->irq_status & DP_MASKED_SINK_HPD_PLUG_INT) && !dp->hpd_status)) {
>>>>    		drm_dbg_dp(&priv->dev, "HPD IN isr occur!\n");
>>>> -		hibmc_dp_hpd_cfg(&priv->dp);
>>>> +		hibmc_dp_hpd_cfg(dp);
>>>> +		dp->hpd_status = 1;
>>>>    	} else {
>>>>    		drm_dbg_dp(&priv->dev, "HPD OUT isr occur!\n");
>>>> -		hibmc_dp_reset_link(&priv->dp);
>>>> +		hibmc_dp_reset_link(dp);
>>>> +		dp->hpd_status = 0;
>>>>    	}
>>>> -	if (dev->registered)
>>>> -		drm_connector_helper_hpd_irq_event(&priv->dp.connector);
>>>> +	drm_connector_helper_hpd_irq_event(&priv->dp.connector);
>>>>    	drm_dev_exit(idx);
>>>> -- 
>>>> 2.33.0
>>>>
