Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id CD0CEB940C9
	for <lists+dri-devel@lfdr.de>; Tue, 23 Sep 2025 04:58:05 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 0A4CB10E02F;
	Tue, 23 Sep 2025 02:58:02 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from szxga05-in.huawei.com (szxga05-in.huawei.com [45.249.212.191])
 by gabe.freedesktop.org (Postfix) with ESMTPS id DAC5710E02F
 for <dri-devel@lists.freedesktop.org>; Tue, 23 Sep 2025 02:58:00 +0000 (UTC)
Received: from mail.maildlp.com (unknown [172.19.163.44])
 by szxga05-in.huawei.com (SkyGuard) with ESMTP id 4cW4M60rJJz24hvM;
 Tue, 23 Sep 2025 10:54:26 +0800 (CST)
Received: from dggemv712-chm.china.huawei.com (unknown [10.1.198.32])
 by mail.maildlp.com (Postfix) with ESMTPS id E93F314010D;
 Tue, 23 Sep 2025 10:57:57 +0800 (CST)
Received: from kwepemq100007.china.huawei.com (7.202.195.175) by
 dggemv712-chm.china.huawei.com (10.1.198.32) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.1544.11; Tue, 23 Sep 2025 10:57:57 +0800
Received: from [10.159.166.136] (10.159.166.136) by
 kwepemq100007.china.huawei.com (7.202.195.175) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.1544.11; Tue, 23 Sep 2025 10:57:57 +0800
Message-ID: <5e9aad79-fef1-4258-83c4-6938ceafbaa5@huawei.com>
Date: Tue, 23 Sep 2025 10:57:56 +0800
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v6 drm-dp 1/4] drm/hisilicon/hibmc: fix dp probabilistical
 detect errors after HPD irq
To: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
CC: <xinliang.liu@linaro.org>, <tiantao6@hisilicon.com>,
 <maarten.lankhorst@linux.intel.com>, <mripard@kernel.org>,
 <tzimmermann@suse.de>, <airlied@gmail.com>, <daniel@ffwll.ch>,
 <kong.kongxinwei@hisilicon.com>, <liangjian010@huawei.com>,
 <chenjianmin@huawei.com>, <fengsheng5@huawei.com>, <libaihan@huawei.com>,
 <shenjian15@huawei.com>, <shaojijie@huawei.com>,
 <dri-devel@lists.freedesktop.org>, <linux-kernel@vger.kernel.org>,
 <shiyongbang@huawei.com>
References: <20250922024943.311947-1-shiyongbang@huawei.com>
 <20250922024943.311947-2-shiyongbang@huawei.com>
 <4vtis3tmlxhmxjmzhi4jdfriexidtr5u2jdcpmfegyyc5gkznu@mpzganc4k5gp>
From: Yongbang Shi <shiyongbang@huawei.com>
In-Reply-To: <4vtis3tmlxhmxjmzhi4jdfriexidtr5u2jdcpmfegyyc5gkznu@mpzganc4k5gp>
Content-Type: text/plain; charset="UTF-8"; format=flowed
Content-Transfer-Encoding: 8bit
X-Originating-IP: [10.159.166.136]
X-ClientProxiedBy: kwepems200002.china.huawei.com (7.221.188.68) To
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

> On Mon, Sep 22, 2025 at 10:49:40AM +0800, Yongbang Shi wrote:
>> From: Baihan Li <libaihan@huawei.com>
>>
>> The issue is that drm_connector_helper_detect_from_ddc() returns wrong
>> status when plugging or unplugging the monitor. Use HPD pin status in
>> DP's detect_ctx() for real physcal monitor in/out, and keep using
>> detect_frome_ddc() if it's the first time to call detect because of
>> insmoding driver.
> If I understand correct, this is not quite right. Consider DP-to-HDMI or
> DP-to-DVI dongle being plugged without an actual monitor and then the
> monitor being plugged later on.

Hi Dmitry,
Thanks for your correction. So your point is that if the HPD comes in from a dongle.
Is that okay to add those checks at the end?

         ret = drm_dp_read_dpcd_caps(dp_dev->aux, dp_dev->dpcd);
	if (ret)
		return connector_status_disconnected;

	if (!drm_dp_is_branch(dpcd))
		return connector_status_connected;

	if (drm_dp_read_sink_count_cap(connector, dp_dev->dpcd, &dp_dev->desc) &&
	    dp_dev->dpcd[DP_DOWNSTREAM_PORT_0] & DP_DS_PORT_HPD) {
		ret = drm_dp_read_sink_count(dp_dev->dpcd);
		if (ret > 0)
			return connector_status_connected;
	}

Thanks，
Baihan


>> Fixes: 3c7623fb5bb6 ("drm/hisilicon/hibmc: Enable this hot plug detect of irq feature")
>> Signed-off-by: Baihan Li <libaihan@huawei.com>
>> Signed-off-by: Yongbang Shi <shiyongbang@huawei.com>
>> ---
>> ChangeLog:
>> v5 -> v6:
>>    - use HPD status in DP detect_ctx(), suggested by Dmitry Baryshkov.
>> v4 -> v5:
>>    - fix the commit message and DP detect_ctx(), suggested by Dmitry Baryshkov.
>> ---
>>   drivers/gpu/drm/hisilicon/hibmc/dp/dp_hw.c     | 12 ++++++++++++
>>   drivers/gpu/drm/hisilicon/hibmc/dp/dp_hw.h     |  7 +++++++
>>   drivers/gpu/drm/hisilicon/hibmc/dp/dp_reg.h    |  3 +++
>>   drivers/gpu/drm/hisilicon/hibmc/hibmc_drm_dp.c | 13 +++++++++++--
>>   4 files changed, 33 insertions(+), 2 deletions(-)
>>
>> diff --git a/drivers/gpu/drm/hisilicon/hibmc/dp/dp_hw.c b/drivers/gpu/drm/hisilicon/hibmc/dp/dp_hw.c
>> index 8f0daec7d174..4d8d3e4d4f84 100644
>> --- a/drivers/gpu/drm/hisilicon/hibmc/dp/dp_hw.c
>> +++ b/drivers/gpu/drm/hisilicon/hibmc/dp/dp_hw.c
>> @@ -2,6 +2,7 @@
>>   // Copyright (c) 2024 Hisilicon Limited.
>>   
>>   #include <linux/io.h>
>> +#include <linux/iopoll.h>
>>   #include <linux/delay.h>
>>   #include "dp_config.h"
>>   #include "dp_comm.h"
>> @@ -305,3 +306,14 @@ void hibmc_dp_set_cbar(struct hibmc_dp *dp, const struct hibmc_dp_cbar_cfg *cfg)
>>   	hibmc_dp_reg_write_field(dp_dev, HIBMC_DP_COLOR_BAR_CTRL, BIT(0), cfg->enable);
>>   	writel(HIBMC_DP_SYNC_EN_MASK, dp_dev->base + HIBMC_DP_TIMING_SYNC_CTRL);
>>   }
>> +
>> +void hibmc_dp_update_hpd_status(struct hibmc_dp *dp)
>> +{
>> +	int status;
>> +
>> +	readl_poll_timeout(dp->dp_dev->base + HIBMC_DP_HPD_STATUS, status,
>> +			   FIELD_GET(HIBMC_DP_HPD_CUR_STATE, status) != dp->hpd_status,
>> +			   1000, 100000); /* DP spec says 100ms */
>> +
>> +	dp->hpd_status = FIELD_GET(HIBMC_DP_HPD_CUR_STATE, status);
>> +}
>> diff --git a/drivers/gpu/drm/hisilicon/hibmc/dp/dp_hw.h b/drivers/gpu/drm/hisilicon/hibmc/dp/dp_hw.h
>> index 665f5b166dfb..8348ad9e34a8 100644
>> --- a/drivers/gpu/drm/hisilicon/hibmc/dp/dp_hw.h
>> +++ b/drivers/gpu/drm/hisilicon/hibmc/dp/dp_hw.h
>> @@ -14,6 +14,11 @@
>>   
>>   struct hibmc_dp_dev;
>>   
>> +enum hibmc_hpd_status {
>> +	HIBMC_HPD_OUT,
>> +	HIBMC_HPD_IN,
>> +};
>> +
>>   enum hibmc_dp_cbar_pattern {
>>   	CBAR_COLOR_BAR,
>>   	CBAR_WHITE,
>> @@ -50,6 +55,7 @@ struct hibmc_dp {
>>   	struct drm_dp_aux aux;
>>   	struct hibmc_dp_cbar_cfg cfg;
>>   	u32 irq_status;
>> +	int hpd_status;
>>   };
>>   
>>   int hibmc_dp_hw_init(struct hibmc_dp *dp);
>> @@ -60,5 +66,6 @@ void hibmc_dp_reset_link(struct hibmc_dp *dp);
>>   void hibmc_dp_hpd_cfg(struct hibmc_dp *dp);
>>   void hibmc_dp_enable_int(struct hibmc_dp *dp);
>>   void hibmc_dp_disable_int(struct hibmc_dp *dp);
>> +void hibmc_dp_update_hpd_status(struct hibmc_dp *dp);
>>   
>>   #endif
>> diff --git a/drivers/gpu/drm/hisilicon/hibmc/dp/dp_reg.h b/drivers/gpu/drm/hisilicon/hibmc/dp/dp_reg.h
>> index 394b1e933c3a..64306abcd986 100644
>> --- a/drivers/gpu/drm/hisilicon/hibmc/dp/dp_reg.h
>> +++ b/drivers/gpu/drm/hisilicon/hibmc/dp/dp_reg.h
>> @@ -24,6 +24,9 @@
>>   #define HIBMC_DP_CFG_AUX_READY_DATA_BYTE	GENMASK(16, 12)
>>   #define HIBMC_DP_CFG_AUX			GENMASK(24, 17)
>>   
>> +#define HIBMC_DP_HPD_STATUS			0x98
>> +#define HIBMC_DP_HPD_CUR_STATE		GENMASK(7, 4)
>> +
>>   #define HIBMC_DP_PHYIF_CTRL0			0xa0
>>   #define HIBMC_DP_CFG_SCRAMBLE_EN		BIT(0)
>>   #define HIBMC_DP_CFG_PAT_SEL			GENMASK(7, 4)
>> diff --git a/drivers/gpu/drm/hisilicon/hibmc/hibmc_drm_dp.c b/drivers/gpu/drm/hisilicon/hibmc/hibmc_drm_dp.c
>> index d06832e62e96..48c9c97eef0e 100644
>> --- a/drivers/gpu/drm/hisilicon/hibmc/hibmc_drm_dp.c
>> +++ b/drivers/gpu/drm/hisilicon/hibmc/hibmc_drm_dp.c
>> @@ -34,9 +34,16 @@ static int hibmc_dp_connector_get_modes(struct drm_connector *connector)
>>   static int hibmc_dp_detect(struct drm_connector *connector,
>>   			   struct drm_modeset_acquire_ctx *ctx, bool force)
>>   {
>> -	mdelay(200);
>> +	struct hibmc_dp *dp = to_hibmc_dp(connector);
>> +
>> +	/* if no HPD just probe DDC */
>> +	if (!dp->irq_status)
>> +		return drm_connector_helper_detect_from_ddc(connector, ctx, force);
>>   
>> -	return drm_connector_helper_detect_from_ddc(connector, ctx, force);
>> +	if (dp->hpd_status == HIBMC_HPD_IN)
>> +		return connector_status_connected;
>> +
>> +	return connector_status_disconnected;
>>   }
>>   
>>   static const struct drm_connector_helper_funcs hibmc_dp_conn_helper_funcs = {
>> @@ -128,6 +135,8 @@ irqreturn_t hibmc_dp_hpd_isr(int irq, void *arg)
>>   		hibmc_dp_reset_link(&priv->dp);
>>   	}
>>   
>> +	hibmc_dp_update_hpd_status(&priv->dp);
>> +
>>   	if (dev->registered)
>>   		drm_connector_helper_hpd_irq_event(&priv->dp.connector);
>>   
>> -- 
>> 2.33.0
>>
