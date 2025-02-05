Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 291EEA28546
	for <lists+dri-devel@lfdr.de>; Wed,  5 Feb 2025 09:05:04 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 0F7B310E188;
	Wed,  5 Feb 2025 08:05:01 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from szxga05-in.huawei.com (szxga05-in.huawei.com [45.249.212.191])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 414A010E188
 for <dri-devel@lists.freedesktop.org>; Wed,  5 Feb 2025 08:04:59 +0000 (UTC)
Received: from mail.maildlp.com (unknown [172.19.88.234])
 by szxga05-in.huawei.com (SkyGuard) with ESMTP id 4Ynt3M3T1Nz1l0fQ;
 Wed,  5 Feb 2025 16:01:19 +0800 (CST)
Received: from kwepemd500013.china.huawei.com (unknown [7.221.188.12])
 by mail.maildlp.com (Postfix) with ESMTPS id 1C0E11400CF;
 Wed,  5 Feb 2025 16:04:56 +0800 (CST)
Received: from [10.159.166.136] (10.159.166.136) by
 kwepemd500013.china.huawei.com (7.221.188.12) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.1258.34; Wed, 5 Feb 2025 16:04:54 +0800
Message-ID: <67b7fa6a-ca27-407d-81a6-81bcea205080@huawei.com>
Date: Wed, 5 Feb 2025 16:04:53 +0800
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v1 drm-dp 1/4] drm/hisilicon/hibmc: Add dp phy cfg to
 adjust serdes rate, voltage and pre-emphasis
To: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
CC: <xinliang.liu@linaro.org>, <tiantao6@hisilicon.com>,
 <maarten.lankhorst@linux.intel.com>, <mripard@kernel.org>,
 <tzimmermann@suse.de>, <airlied@gmail.com>, <daniel@ffwll.ch>,
 <kong.kongxinwei@hisilicon.com>, <liangjian010@huawei.com>,
 <chenjianmin@huawei.com>, <lidongming5@huawei.com>, <libaihan@huawei.com>,
 <shenjian15@huawei.com>, <shaojijie@huawei.com>,
 <dri-devel@lists.freedesktop.org>, <linux-kernel@vger.kernel.org>,
 <shiyongbang@huawei.com>
References: <20250127032024.1542219-1-shiyongbang@huawei.com>
 <20250127032024.1542219-2-shiyongbang@huawei.com>
 <jtv3dfirk6nyj5rzbotx6ps24e6bm2aeylnuex5quq66cnmhka@b6zjaw3cmd6p>
From: Yongbang Shi <shiyongbang@huawei.com>
In-Reply-To: <jtv3dfirk6nyj5rzbotx6ps24e6bm2aeylnuex5quq66cnmhka@b6zjaw3cmd6p>
Content-Type: text/plain; charset="UTF-8"; format=flowed
Content-Transfer-Encoding: 7bit
X-Originating-IP: [10.159.166.136]
X-ClientProxiedBy: dggems702-chm.china.huawei.com (10.3.19.179) To
 kwepemd500013.china.huawei.com (7.221.188.12)
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

> On Mon, Jan 27, 2025 at 11:20:21AM +0800, Yongbang Shi wrote:
>> From: Baihan Li <libaihan@huawei.com>
>>
>> This phy is inited and configured for dp, and integrating them into dp init
>> and dp link training process.
> My feeling is that this patch has too many changes. They might seem
> related to you, but not to the reviewers. Please try splittting the
> patch _and_ explaining the changes in the commit message. E.g. you are
> adding a PHY. We have a generic PHY framework, but it is unsuitable,
> because .... The rates are changed because... etc. But first please
> comsider splitting the patch.

Hi Dmitry,

Thanks for your advice, I will split this patch to 2 and add more
detailed comments here.


>> Signed-off-by: Baihan Li <libaihan@huawei.com>
>> Signed-off-by: Yongbang Shi <shiyongbang@huawei.com>
>> ---
>>   drivers/gpu/drm/hisilicon/hibmc/Makefile      |  2 +-
>>   drivers/gpu/drm/hisilicon/hibmc/dp/dp_comm.h  |  1 +
>>   .../gpu/drm/hisilicon/hibmc/dp/dp_config.h    |  1 +
>>   drivers/gpu/drm/hisilicon/hibmc/dp/dp_hw.c    |  9 ++-
>>   drivers/gpu/drm/hisilicon/hibmc/dp/dp_link.c  | 33 +++++++--
>>   drivers/gpu/drm/hisilicon/hibmc/dp/dp_phy.c   | 72 +++++++++++++++++++
>>   drivers/gpu/drm/hisilicon/hibmc/dp/dp_phy.h   | 38 ++++++++++
>>   drivers/gpu/drm/hisilicon/hibmc/dp/dp_reg.h   |  1 +
>>   .../gpu/drm/hisilicon/hibmc/hibmc_drm_drv.c   |  8 +--
>>   9 files changed, 153 insertions(+), 12 deletions(-)
>>   create mode 100644 drivers/gpu/drm/hisilicon/hibmc/dp/dp_phy.c
>>   create mode 100644 drivers/gpu/drm/hisilicon/hibmc/dp/dp_phy.h
>>
>> diff --git a/drivers/gpu/drm/hisilicon/hibmc/Makefile b/drivers/gpu/drm/hisilicon/hibmc/Makefile
>> index 95a4ed599d98..35a74cc10c80 100644
>> --- a/drivers/gpu/drm/hisilicon/hibmc/Makefile
>> +++ b/drivers/gpu/drm/hisilicon/hibmc/Makefile
>> @@ -1,5 +1,5 @@
>>   # SPDX-License-Identifier: GPL-2.0-only
>>   hibmc-drm-y := hibmc_drm_drv.o hibmc_drm_de.o hibmc_drm_vdac.o hibmc_drm_i2c.o \
>> -	       dp/dp_aux.o dp/dp_link.o dp/dp_hw.o hibmc_drm_dp.o
>> +	       dp/dp_aux.o dp/dp_link.o dp/dp_hw.o dp/dp_phy.o hibmc_drm_dp.o
>>   
>>   obj-$(CONFIG_DRM_HISI_HIBMC) += hibmc-drm.o
>> diff --git a/drivers/gpu/drm/hisilicon/hibmc/dp/dp_comm.h b/drivers/gpu/drm/hisilicon/hibmc/dp/dp_comm.h
>> index 2c52a4476c4d..00b23301d26e 100644
>> --- a/drivers/gpu/drm/hisilicon/hibmc/dp/dp_comm.h
>> +++ b/drivers/gpu/drm/hisilicon/hibmc/dp/dp_comm.h
>> @@ -38,6 +38,7 @@ struct hibmc_dp_dev {
>>   	struct mutex lock; /* protects concurrent RW in hibmc_dp_reg_write_field() */
>>   	struct hibmc_dp_link link;
>>   	u8 dpcd[DP_RECEIVER_CAP_SIZE];
>> +	void __iomem *phy_base;
>>   };
>>   
>>   #define dp_field_modify(reg_value, mask, val)				\
>> diff --git a/drivers/gpu/drm/hisilicon/hibmc/dp/dp_config.h b/drivers/gpu/drm/hisilicon/hibmc/dp/dp_config.h
>> index 74dd9956144e..c5feef8dc27d 100644
>> --- a/drivers/gpu/drm/hisilicon/hibmc/dp/dp_config.h
>> +++ b/drivers/gpu/drm/hisilicon/hibmc/dp/dp_config.h
>> @@ -15,5 +15,6 @@
>>   #define HIBMC_DP_CLK_EN			0x7
>>   #define HIBMC_DP_SYNC_EN_MASK		0x3
>>   #define HIBMC_DP_LINK_RATE_CAL		27
>> +#define HIBMC_DP_SYNC_DELAY(lanes)	((lanes) == 0x2 ? 86 : 46)
>>   
>>   #endif
>> diff --git a/drivers/gpu/drm/hisilicon/hibmc/dp/dp_hw.c b/drivers/gpu/drm/hisilicon/hibmc/dp/dp_hw.c
>> index a8d543881c09..0dac4cfdde7c 100644
>> --- a/drivers/gpu/drm/hisilicon/hibmc/dp/dp_hw.c
>> +++ b/drivers/gpu/drm/hisilicon/hibmc/dp/dp_hw.c
>> @@ -7,6 +7,7 @@
>>   #include "dp_comm.h"
>>   #include "dp_reg.h"
>>   #include "dp_hw.h"
>> +#include "dp_phy.h"
>>   
>>   static void hibmc_dp_set_tu(struct hibmc_dp_dev *dp, struct drm_display_mode *mode)
>>   {
>> @@ -72,6 +73,9 @@ static void hibmc_dp_set_sst(struct hibmc_dp_dev *dp, struct drm_display_mode *m
>>   				 HIBMC_DP_CFG_STREAM_HTOTAL_SIZE, htotal_size);
>>   	hibmc_dp_reg_write_field(dp, HIBMC_DP_VIDEO_HORIZONTAL_SIZE,
>>   				 HIBMC_DP_CFG_STREAM_HBLANK_SIZE, hblank_size);
>> +	hibmc_dp_reg_write_field(dp, HIBMC_DP_VIDEO_PACKET,
>> +				 HIBMC_DP_CFG_STREAM_SYNC_CALIBRATION,
>> +				 HIBMC_DP_SYNC_DELAY(dp->link.cap.lanes));
>>   }
>>   
>>   static void hibmc_dp_link_cfg(struct hibmc_dp_dev *dp, struct drm_display_mode *mode)
>> @@ -165,8 +169,11 @@ int hibmc_dp_hw_init(struct hibmc_dp *dp)
>>   
>>   	hibmc_dp_aux_init(dp_dev);
>>   
>> +	if (hibmc_dp_phy_init(dp_dev))
>> +		return -EAGAIN;
>> +
>>   	dp_dev->link.cap.lanes = 0x2;
>> -	dp_dev->link.cap.link_rate = DP_LINK_BW_2_7;
>> +	dp_dev->link.cap.link_rate = DP_LINK_BW_8_1;
>>   
>>   	/* hdcp data */
>>   	writel(HIBMC_DP_HDCP, dp_dev->base + HIBMC_DP_HDCP_CFG);
>> diff --git a/drivers/gpu/drm/hisilicon/hibmc/dp/dp_link.c b/drivers/gpu/drm/hisilicon/hibmc/dp/dp_link.c
>> index f6355c16cc0a..1124cd70c320 100644
>> --- a/drivers/gpu/drm/hisilicon/hibmc/dp/dp_link.c
>> +++ b/drivers/gpu/drm/hisilicon/hibmc/dp/dp_link.c
>> @@ -6,6 +6,7 @@
>>   #include <drm/drm_print.h>
>>   #include "dp_comm.h"
>>   #include "dp_reg.h"
>> +#include "dp_phy.h"
>>   
>>   #define HIBMC_EQ_MAX_RETRY 5
>>   
>> @@ -108,7 +109,11 @@ static int hibmc_dp_link_training_cr_pre(struct hibmc_dp_dev *dp)
>>   		return ret;
>>   
>>   	for (i = 0; i < dp->link.cap.lanes; i++)
>> -		train_set[i] = DP_TRAIN_VOLTAGE_SWING_LEVEL_2;
>> +		train_set[i] = DP_TRAIN_VOLTAGE_SWING_LEVEL_0;
>> +
>> +	ret = hibmc_dp_serdes_set_tx_cfg(dp, dp->link.train_set);
>> +	if (ret)
>> +		return ret;
>>   
>>   	ret = drm_dp_dpcd_write(&dp->aux, DP_TRAINING_LANE0_SET, train_set, dp->link.cap.lanes);
>>   	if (ret != dp->link.cap.lanes) {
>> @@ -137,21 +142,28 @@ static bool hibmc_dp_link_get_adjust_train(struct hibmc_dp_dev *dp,
>>   	return false;
>>   }
>>   
>> -static inline int hibmc_dp_link_reduce_rate(struct hibmc_dp_dev *dp)
>> +static int hibmc_dp_link_reduce_rate(struct hibmc_dp_dev *dp)
>>   {
>> +	u8 rate = 0;
>> +
>>   	switch (dp->link.cap.link_rate) {
>>   	case DP_LINK_BW_2_7:
>>   		dp->link.cap.link_rate = DP_LINK_BW_1_62;
>> -		return 0;
>> +		rate = DP_PHY_BW_1_62;
>> +		break;
>>   	case DP_LINK_BW_5_4:
>>   		dp->link.cap.link_rate = DP_LINK_BW_2_7;
>> -		return 0;
>> +		rate = DP_PHY_BW_2_7;
>> +		break;
>>   	case DP_LINK_BW_8_1:
>>   		dp->link.cap.link_rate = DP_LINK_BW_5_4;
>> -		return 0;
>> +		rate = DP_PHY_BW_5_4;
>> +		break;
>>   	default:
>>   		return -EINVAL;
>>   	}
>> +
>> +	return hibmc_dp_serdes_rate_switch(rate, dp);
>>   }
>>   
>>   static inline int hibmc_dp_link_reduce_lane(struct hibmc_dp_dev *dp)
>> @@ -159,6 +171,7 @@ static inline int hibmc_dp_link_reduce_lane(struct hibmc_dp_dev *dp)
>>   	switch (dp->link.cap.lanes) {
>>   	case 0x2:
>>   		dp->link.cap.lanes--;
>> +		drm_warn(dp->dev, "dp link training reduce to 1 lane\n");
>>   		break;
>>   	case 0x1:
>>   		drm_err(dp->dev, "dp link training reduce lane failed, already reach minimum\n");
>> @@ -206,6 +219,11 @@ static int hibmc_dp_link_training_cr(struct hibmc_dp_dev *dp)
>>   		}
>>   
>>   		level_changed = hibmc_dp_link_get_adjust_train(dp, lane_status);
>> +
>> +		ret = hibmc_dp_serdes_set_tx_cfg(dp, dp->link.train_set);
>> +		if (ret)
>> +			return ret;
>> +
>>   		ret = drm_dp_dpcd_write(&dp->aux, DP_TRAINING_LANE0_SET, dp->link.train_set,
>>   					dp->link.cap.lanes);
>>   		if (ret != dp->link.cap.lanes) {
>> @@ -255,6 +273,11 @@ static int hibmc_dp_link_training_channel_eq(struct hibmc_dp_dev *dp)
>>   		}
>>   
>>   		hibmc_dp_link_get_adjust_train(dp, lane_status);
>> +
>> +		ret = hibmc_dp_serdes_set_tx_cfg(dp, dp->link.train_set);
>> +		if (ret)
>> +			return ret;
>> +
>>   		ret = drm_dp_dpcd_write(&dp->aux, DP_TRAINING_LANE0_SET,
>>   					dp->link.train_set, dp->link.cap.lanes);
>>   		if (ret != dp->link.cap.lanes) {
>> diff --git a/drivers/gpu/drm/hisilicon/hibmc/dp/dp_phy.c b/drivers/gpu/drm/hisilicon/hibmc/dp/dp_phy.c
>> new file mode 100644
>> index 000000000000..07940b5baf29
>> --- /dev/null
>> +++ b/drivers/gpu/drm/hisilicon/hibmc/dp/dp_phy.c
>> @@ -0,0 +1,72 @@
>> +// SPDX-License-Identifier: GPL-2.0-or-later
>> +// Copyright (c) 2024 Hisilicon Limited.
>> +#include <linux/delay.h>
>> +#include <drm/drm_device.h>
>> +#include <drm/drm_print.h>
>> +#include "dp_comm.h"
>> +#include "dp_config.h"
>> +#include "dp_reg.h"
>> +#include "dp_phy.h"
>> +
>> +int hibmc_dp_serdes_set_tx_cfg(struct hibmc_dp_dev *dp, u8 train_set[HIBMC_DP_LANE_NUM_MAX])
>> +{
>> +	u32 serdes_tx_cfg[4][4] = { {DP_PHY_VOL0_PRE0, DP_PHY_VOL0_PRE1,
>> +				     DP_PHY_VOL0_PRE2, DP_PHY_VOL0_PRE3},
>> +				    {DP_PHY_VOL1_PRE0, DP_PHY_VOL1_PRE1, DP_PHY_VOL1_PRE2},
>> +				    {DP_PHY_VOL2_PRE0, DP_PHY_VOL2_PRE1}, {DP_PHY_VOL3_PRE0}};
>> +	int cfg[2];
>> +	int i;
>> +
>> +	for (i = 0; i < HIBMC_DP_LANE_NUM_MAX; i++) {
>> +		cfg[i] = serdes_tx_cfg[(train_set[i] & 0x3)]
>> +			 [(train_set[i] << DP_TRAIN_PRE_EMPHASIS_SHIFT & 0x3)];
>> +		if (!cfg[i]) {
>> +			cfg[i] = DP_PHY_VOL3_PRE0;
>> +			drm_warn(dp->dev, "dp serdes cfg beyonds the allowable range\n");
>> +		}
>> +
>> +		/* lane1 offset is 4 */
>> +		writel(FIELD_PREP(HIBMC_DP_PMA_TXDEEMPH, cfg[i]),
>> +		       dp->phy_base + HIBMC_DP_PMA_LANE0_OFFSET + i * 4);
>> +	}
>> +
>> +	usleep_range(300, 500);
>> +
>> +	if (readl(dp->phy_base + HIBMC_DP_LANE_STATUS_OFFSET) != DP_PHY_DONE) {
>> +		drm_err(dp->dev, "dp serdes cfg failed\n");
>> +		return -EAGAIN;
>> +	}
>> +
>> +	return 0;
>> +}
>> +
>> +int hibmc_dp_serdes_rate_switch(u8 rate, struct hibmc_dp_dev *dp)
>> +{
>> +	writel(rate, dp->phy_base + HIBMC_DP_LANE0_RATE_OFFSET);
>> +	writel(rate, dp->phy_base + HIBMC_DP_LANE1_RATE_OFFSET);
>> +
>> +	usleep_range(300, 500);
>> +
>> +	if (readl(dp->phy_base + HIBMC_DP_LANE_STATUS_OFFSET) != DP_PHY_DONE) {
>> +		drm_err(dp->dev, "dp serdes rate switching failed\n");
>> +		return -EAGAIN;
>> +	}
>> +
>> +	if (rate < DP_PHY_BW_8_1)
>> +		drm_warn(dp->dev, "reducing serdes rate to :%d\n",
>> +			 rate ? rate * HIBMC_DP_LINK_RATE_CAL * 10 : 162);
>> +
>> +	return 0;
>> +}
>> +
>> +int hibmc_dp_phy_init(struct hibmc_dp_dev *dp)
>> +{
>> +	dp->phy_base = dp->base + HIBMC_DP_HOST_OFFSET;
>> +
>> +	writel(FIELD_PREP(HIBMC_DP_PMA_TXDEEMPH, DP_PHY_VOL0_PRE0),
>> +	       dp->phy_base + HIBMC_DP_PMA_LANE0_OFFSET);
>> +	writel(FIELD_PREP(HIBMC_DP_PMA_TXDEEMPH, DP_PHY_VOL0_PRE0),
>> +	       dp->phy_base + HIBMC_DP_PMA_LANE1_OFFSET);
>> +
>> +	return hibmc_dp_serdes_rate_switch(DP_PHY_BW_8_1, dp);
>> +}
>> diff --git a/drivers/gpu/drm/hisilicon/hibmc/dp/dp_phy.h b/drivers/gpu/drm/hisilicon/hibmc/dp/dp_phy.h
>> new file mode 100644
>> index 000000000000..db9fddd24d0e
>> --- /dev/null
>> +++ b/drivers/gpu/drm/hisilicon/hibmc/dp/dp_phy.h
>> @@ -0,0 +1,38 @@
>> +/* SPDX-License-Identifier: GPL-2.0-or-later */
>> +/* Copyright (c) 2025 Hisilicon Limited. */
>> +
>> +#ifndef DP_PHY_H
>> +#define DP_PHY_H
>> +
>> +/* dp phy reg */
>> +#define HIBMC_DP_HOST_OFFSET		0x10000
>> +#define HIBMC_DP_LANE0_RATE_OFFSET	0x4
>> +#define HIBMC_DP_LANE1_RATE_OFFSET	0xc
>> +#define HIBMC_DP_LANE_STATUS_OFFSET	0x10
>> +#define HIBMC_DP_PMA_LANE0_OFFSET	0x18
>> +#define HIBMC_DP_PMA_LANE1_OFFSET	0x1c
>> +#define HIBMC_DP_PMA_TXDEEMPH		GENMASK(18, 1)
>> +
>> +/* dp phy cfg parameter */
>> +#define DP_PHY_VOL0_PRE0		0x280
>> +#define DP_PHY_VOL0_PRE1		0x2300
>> +#define DP_PHY_VOL0_PRE2		0x53c0
>> +#define DP_PHY_VOL0_PRE3		0x8400
>> +#define DP_PHY_VOL1_PRE0		0x380
>> +#define DP_PHY_VOL1_PRE1		0x3440
>> +#define DP_PHY_VOL1_PRE2		0x6480
>> +#define DP_PHY_VOL2_PRE0		0x500
>> +#define DP_PHY_VOL2_PRE1		0x4500
>> +#define DP_PHY_VOL3_PRE0		0x600
>> +#define DP_PHY_BW_8_1			0x3
>> +#define DP_PHY_BW_5_4			0x2
>> +#define DP_PHY_BW_2_7			0x1
>> +#define DP_PHY_BW_1_62			0x0
>> +
>> +#define DP_PHY_DONE			0x3
>> +
>> +int hibmc_dp_phy_init(struct hibmc_dp_dev *dp);
>> +int hibmc_dp_serdes_rate_switch(u8 rate, struct hibmc_dp_dev *dp);
>> +int hibmc_dp_serdes_set_tx_cfg(struct hibmc_dp_dev *dp, u8 train_set[HIBMC_DP_LANE_NUM_MAX]);
>> +
>> +#endif
>> diff --git a/drivers/gpu/drm/hisilicon/hibmc/dp/dp_reg.h b/drivers/gpu/drm/hisilicon/hibmc/dp/dp_reg.h
>> index 4a515c726d52..99ba9c951c41 100644
>> --- a/drivers/gpu/drm/hisilicon/hibmc/dp/dp_reg.h
>> +++ b/drivers/gpu/drm/hisilicon/hibmc/dp/dp_reg.h
>> @@ -72,5 +72,6 @@
>>   #define HIBMC_DP_CFG_STREAM_TU_SYMBOL_FRAC_SIZE	GENMASK(9, 6)
>>   #define HIBMC_DP_CFG_STREAM_HTOTAL_SIZE		GENMASK(31, 16)
>>   #define HIBMC_DP_CFG_STREAM_HBLANK_SIZE		GENMASK(15, 0)
>> +#define HIBMC_DP_CFG_STREAM_SYNC_CALIBRATION GENMASK(31, 20)
>>   
>>   #endif
>> diff --git a/drivers/gpu/drm/hisilicon/hibmc/hibmc_drm_drv.c b/drivers/gpu/drm/hisilicon/hibmc/hibmc_drm_drv.c
>> index e6de6d5edf6b..bade693d9730 100644
>> --- a/drivers/gpu/drm/hisilicon/hibmc/hibmc_drm_drv.c
>> +++ b/drivers/gpu/drm/hisilicon/hibmc/hibmc_drm_drv.c
>> @@ -28,9 +28,7 @@
>>   #include "hibmc_drm_drv.h"
>>   #include "hibmc_drm_regs.h"
>>   
>> -#define HIBMC_DP_HOST_SERDES_CTRL		0x1f001c
>> -#define HIBMC_DP_HOST_SERDES_CTRL_VAL		0x8a00
>> -#define HIBMC_DP_HOST_SERDES_CTRL_MASK		0x7ffff
>> +#define HIBMC_DP_HOST_SERDES_CTRL	0x1f001c
>>   
>>   DEFINE_DRM_GEM_FOPS(hibmc_fops);
>>   
>> @@ -122,8 +120,8 @@ static int hibmc_kms_init(struct hibmc_drm_private *priv)
>>   	}
>>   
>>   	/* if DP existed, init DP */
>> -	if ((readl(priv->mmio + HIBMC_DP_HOST_SERDES_CTRL) &
>> -	     HIBMC_DP_HOST_SERDES_CTRL_MASK) == HIBMC_DP_HOST_SERDES_CTRL_VAL) {
>> +	ret = readl(priv->mmio + HIBMC_DP_HOST_SERDES_CTRL);
>> +	if (ret) {
>>   		ret = hibmc_dp_init(priv);
>>   		if (ret)
>>   			drm_err(dev, "failed to init dp: %d\n", ret);
>> -- 
>> 2.33.0
>>
