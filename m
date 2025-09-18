Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 3D5D1B17F24
	for <lists+dri-devel@lfdr.de>; Fri,  1 Aug 2025 11:22:08 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 9D23B10E81A;
	Fri,  1 Aug 2025 09:22:06 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from szxga05-in.huawei.com (szxga05-in.huawei.com [45.249.212.191])
 by gabe.freedesktop.org (Postfix) with ESMTPS id D703610E81A
 for <dri-devel@lists.freedesktop.org>; Fri,  1 Aug 2025 09:22:04 +0000 (UTC)
Received: from mail.maildlp.com (unknown [172.19.88.163])
 by szxga05-in.huawei.com (SkyGuard) with ESMTP id 4btgPd5tFfz1R6MD;
 Fri,  1 Aug 2025 17:19:17 +0800 (CST)
Received: from dggemv706-chm.china.huawei.com (unknown [10.3.19.33])
 by mail.maildlp.com (Postfix) with ESMTPS id 5D707180042;
 Fri,  1 Aug 2025 17:22:02 +0800 (CST)
Received: from kwepemq100007.china.huawei.com (7.202.195.175) by
 dggemv706-chm.china.huawei.com (10.3.19.33) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.1544.11; Fri, 1 Aug 2025 17:22:02 +0800
Received: from [10.159.166.136] (10.159.166.136) by
 kwepemq100007.china.huawei.com (7.202.195.175) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.1544.11; Fri, 1 Aug 2025 17:22:01 +0800
Message-ID: <38025cee-fad5-4ce7-9646-d061e91c5226@huawei.com>
Date: Fri, 1 Aug 2025 17:22:00 +0800
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v3 drm-dp 05/11] drm/hisilicon/hibmc: fix rare monitors
 cannot display problem
To: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
CC: <xinliang.liu@linaro.org>, <tiantao6@hisilicon.com>,
 <maarten.lankhorst@linux.intel.com>, <mripard@kernel.org>,
 <tzimmermann@suse.de>, <airlied@gmail.com>, <daniel@ffwll.ch>,
 <kong.kongxinwei@hisilicon.com>, <liangjian010@huawei.com>,
 <chenjianmin@huawei.com>, <fengsheng5@huawei.com>, <libaihan@huawei.com>,
 <shenjian15@huawei.com>, <shaojijie@huawei.com>,
 <jani.nikula@linux.intel.com>, <dri-devel@lists.freedesktop.org>,
 <linux-kernel@vger.kernel.org>, <shiyongbang@huawei.com>
References: <20250718065125.2892404-1-shiyongbang@huawei.com>
 <20250718065125.2892404-6-shiyongbang@huawei.com>
 <hx6dx2xxkdjyrhjz24bnnomywsvup532bk3jo3oswzftid6yyw@gu2bjjk4ahrm>
From: Yongbang Shi <shiyongbang@huawei.com>
In-Reply-To: <hx6dx2xxkdjyrhjz24bnnomywsvup532bk3jo3oswzftid6yyw@gu2bjjk4ahrm>
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


> On Fri, Jul 18, 2025 at 02:51:19PM +0800, Yongbang Shi wrote:
>> From: Baihan Li <libaihan@huawei.com>
>>
>> In some case, the dp link training success at 8.1Gbps, but the sink's
>> maximum supported rate is less than 8.1G.  So change the default 8.1Gbps
>> link rate to the rate that reads from devices' capabilities.
> You are doing more than changing default link rate. Please split away
> non-related changes. This is especially imporant for Fixes commits.

OKay! I got it. I will move these to the next feature series。


>> Fixes: 54063d86e036 ("drm/hisilicon/hibmc: add dp link moduel in hibmc drivers")
>> Signed-off-by: Baihan Li <libaihan@huawei.com>
>> Signed-off-by: Yongbang Shi <shiyongbang@huawei.com>
>> ---
>>   drivers/gpu/drm/hisilicon/hibmc/dp/dp_comm.h  |  4 ++-
>>   drivers/gpu/drm/hisilicon/hibmc/dp/dp_hw.c    |  6 +---
>>   drivers/gpu/drm/hisilicon/hibmc/dp/dp_link.c  | 33 +++++++++++++------
>>   .../gpu/drm/hisilicon/hibmc/dp/dp_serdes.c    | 12 -------
>>   4 files changed, 27 insertions(+), 28 deletions(-)
>>
>> diff --git a/drivers/gpu/drm/hisilicon/hibmc/dp/dp_comm.h b/drivers/gpu/drm/hisilicon/hibmc/dp/dp_comm.h
>> index 4add05c7f161..18a961466ff0 100644
>> --- a/drivers/gpu/drm/hisilicon/hibmc/dp/dp_comm.h
>> +++ b/drivers/gpu/drm/hisilicon/hibmc/dp/dp_comm.h
>> @@ -25,6 +25,9 @@ struct hibmc_link_status {
>>   struct hibmc_link_cap {
>>   	u8 link_rate;
>>   	u8 lanes;
>> +	int rx_dpcd_revision;
>> +	bool is_tps3;
>> +	bool is_tps4;
>>   };
>>   
>>   struct hibmc_dp_link {
>> @@ -62,7 +65,6 @@ struct hibmc_dp_dev {
>>   
>>   void hibmc_dp_aux_init(struct hibmc_dp *dp);
>>   int hibmc_dp_link_training(struct hibmc_dp_dev *dp);
>> -int hibmc_dp_serdes_init(struct hibmc_dp_dev *dp);
>>   int hibmc_dp_serdes_rate_switch(u8 rate, struct hibmc_dp_dev *dp);
>>   int hibmc_dp_serdes_set_tx_cfg(struct hibmc_dp_dev *dp, u8 train_set[HIBMC_DP_LANE_NUM_MAX]);
>>   
>> diff --git a/drivers/gpu/drm/hisilicon/hibmc/dp/dp_hw.c b/drivers/gpu/drm/hisilicon/hibmc/dp/dp_hw.c
>> index 2d2fb6e759c3..b4d612047f36 100644
>> --- a/drivers/gpu/drm/hisilicon/hibmc/dp/dp_hw.c
>> +++ b/drivers/gpu/drm/hisilicon/hibmc/dp/dp_hw.c
>> @@ -155,7 +155,6 @@ int hibmc_dp_hw_init(struct hibmc_dp *dp)
>>   {
>>   	struct drm_device *drm_dev = dp->drm_dev;
>>   	struct hibmc_dp_dev *dp_dev;
>> -	int ret;
>>   
>>   	dp_dev = devm_kzalloc(drm_dev->dev, sizeof(struct hibmc_dp_dev), GFP_KERNEL);
>>   	if (!dp_dev)
>> @@ -169,13 +168,10 @@ int hibmc_dp_hw_init(struct hibmc_dp *dp)
>>   
>>   	dp_dev->dev = drm_dev;
>>   	dp_dev->base = dp->mmio + HIBMC_DP_OFFSET;
>> +	dp_dev->serdes_base = dp_dev->base + HIBMC_DP_HOST_OFFSET;
>>   
>>   	hibmc_dp_aux_init(dp);
>>   
>> -	ret = hibmc_dp_serdes_init(dp_dev);
>> -	if (ret)
>> -		return ret;
>> -
>>   	dp_dev->link.cap.lanes = 0x2;
>>   	dp_dev->link.cap.link_rate = DP_LINK_BW_8_1;
>>   
>> diff --git a/drivers/gpu/drm/hisilicon/hibmc/dp/dp_link.c b/drivers/gpu/drm/hisilicon/hibmc/dp/dp_link.c
>> index 74f7832ea53e..6c69fa2ae9cf 100644
>> --- a/drivers/gpu/drm/hisilicon/hibmc/dp/dp_link.c
>> +++ b/drivers/gpu/drm/hisilicon/hibmc/dp/dp_link.c
>> @@ -39,6 +39,14 @@ static int hibmc_dp_link_training_configure(struct hibmc_dp_dev *dp)
>>   	/* enhanced frame */
>>   	hibmc_dp_reg_write_field(dp, HIBMC_DP_VIDEO_CTRL, HIBMC_DP_CFG_STREAM_FRAME_MODE, 0x1);
>>   
>> +	ret = hibmc_dp_get_serdes_rate_cfg(dp);
>> +	if (ret < 0)
>> +		return ret;
>> +
>> +	ret = hibmc_dp_serdes_rate_switch(ret, dp);
>> +	if (ret)
>> +		return ret;
>> +
>>   	/* set rate and lane count */
>>   	buf[0] = dp->link.cap.link_rate;
>>   	buf[1] = DP_LANE_COUNT_ENHANCED_FRAME_EN | dp->link.cap.lanes;
>> @@ -325,6 +333,20 @@ static int hibmc_dp_link_downgrade_training_eq(struct hibmc_dp_dev *dp)
>>   	return hibmc_dp_link_reduce_rate(dp);
>>   }
>>   
>> +static void hibmc_dp_update_caps(struct hibmc_dp_dev *dp)
>> +{
>> +	dp->link.cap.rx_dpcd_revision = dp->dpcd[DP_DPCD_REV];
>> +
>> +	dp->link.cap.is_tps3 = (dp->dpcd[DP_DPCD_REV] >= DP_DPCD_REV_13) &&
>> +			       (dp->dpcd[DP_MAX_LANE_COUNT] & DP_TPS3_SUPPORTED);
>> +	dp->link.cap.is_tps4 = (dp->dpcd[DP_DPCD_REV] >= DP_DPCD_REV_14) &&
>> +			       (dp->dpcd[DP_MAX_DOWNSPREAD] & DP_TPS4_SUPPORTED);
>> +	dp->link.cap.link_rate = dp->dpcd[DP_MAX_LINK_RATE];
>> +	dp->link.cap.lanes = dp->dpcd[DP_MAX_LANE_COUNT] & DP_MAX_LANE_COUNT_MASK;
>> +	if (dp->link.cap.lanes > HIBMC_DP_LANE_NUM_MAX)
>> +		dp->link.cap.lanes = HIBMC_DP_LANE_NUM_MAX;
>> +}
>> +
>>   int hibmc_dp_link_training(struct hibmc_dp_dev *dp)
>>   {
>>   	struct hibmc_dp_link *link = &dp->link;
>> @@ -334,16 +356,7 @@ int hibmc_dp_link_training(struct hibmc_dp_dev *dp)
>>   	if (ret)
>>   		drm_err(dp->dev, "dp aux read dpcd failed, ret: %d\n", ret);
>>   
>> -	dp->link.cap.link_rate = dp->dpcd[DP_MAX_LINK_RATE];
>> -	dp->link.cap.lanes = 0x2;
>> -
>> -	ret = hibmc_dp_get_serdes_rate_cfg(dp);
>> -	if (ret < 0)
>> -		return ret;
>> -
>> -	ret = hibmc_dp_serdes_rate_switch(ret, dp);
>> -	if (ret)
>> -		return ret;
>> +	hibmc_dp_update_caps(dp);
>>   
>>   	while (true) {
>>   		ret = hibmc_dp_link_training_cr_pre(dp);
>> diff --git a/drivers/gpu/drm/hisilicon/hibmc/dp/dp_serdes.c b/drivers/gpu/drm/hisilicon/hibmc/dp/dp_serdes.c
>> index 676059d4c1e6..8191233aa965 100644
>> --- a/drivers/gpu/drm/hisilicon/hibmc/dp/dp_serdes.c
>> +++ b/drivers/gpu/drm/hisilicon/hibmc/dp/dp_serdes.c
>> @@ -57,15 +57,3 @@ int hibmc_dp_serdes_rate_switch(u8 rate, struct hibmc_dp_dev *dp)
>>   
>>   	return 0;
>>   }
>> -
>> -int hibmc_dp_serdes_init(struct hibmc_dp_dev *dp)
>> -{
>> -	dp->serdes_base = dp->base + HIBMC_DP_HOST_OFFSET;
>> -
>> -	writel(FIELD_PREP(HIBMC_DP_PMA_TXDEEMPH, DP_SERDES_VOL0_PRE0),
>> -	       dp->serdes_base + HIBMC_DP_PMA_LANE0_OFFSET);
>> -	writel(FIELD_PREP(HIBMC_DP_PMA_TXDEEMPH, DP_SERDES_VOL0_PRE0),
>> -	       dp->serdes_base + HIBMC_DP_PMA_LANE1_OFFSET);
>> -
>> -	return hibmc_dp_serdes_rate_switch(DP_SERDES_BW_8_1, dp);
>> -}
>> -- 
>> 2.33.0
>>
