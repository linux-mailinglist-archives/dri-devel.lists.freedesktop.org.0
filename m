Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 896C3A4076E
	for <lists+dri-devel@lfdr.de>; Sat, 22 Feb 2025 11:33:23 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id F348710E321;
	Sat, 22 Feb 2025 10:33:21 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from szxga05-in.huawei.com (szxga05-in.huawei.com [45.249.212.191])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 647C110E262
 for <dri-devel@lists.freedesktop.org>; Sat, 22 Feb 2025 10:33:20 +0000 (UTC)
Received: from mail.maildlp.com (unknown [172.19.88.234])
 by szxga05-in.huawei.com (SkyGuard) with ESMTP id 4Z0Nb42xpQz1HJ03;
 Sat, 22 Feb 2025 18:31:44 +0800 (CST)
Received: from kwepemd500013.china.huawei.com (unknown [7.221.188.12])
 by mail.maildlp.com (Postfix) with ESMTPS id 95820140155;
 Sat, 22 Feb 2025 18:33:17 +0800 (CST)
Received: from [10.159.166.136] (10.159.166.136) by
 kwepemd500013.china.huawei.com (7.221.188.12) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.1258.34; Sat, 22 Feb 2025 18:33:16 +0800
Message-ID: <6fd6510b-dfbd-417e-9f64-6c6265fd1a64@huawei.com>
Date: Sat, 22 Feb 2025 18:33:15 +0800
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v3 drm-dp 6/8] drm/hisilicon/hibmc: Add colorbar-cfg
 feature and its debugfs file
To: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
CC: <xinliang.liu@linaro.org>, <tiantao6@hisilicon.com>,
 <maarten.lankhorst@linux.intel.com>, <mripard@kernel.org>,
 <tzimmermann@suse.de>, <airlied@gmail.com>, <daniel@ffwll.ch>,
 <kong.kongxinwei@hisilicon.com>, <liangjian010@huawei.com>,
 <chenjianmin@huawei.com>, <lidongming5@huawei.com>, <libaihan@huawei.com>,
 <shenjian15@huawei.com>, <shaojijie@huawei.com>,
 <dri-devel@lists.freedesktop.org>, <linux-kernel@vger.kernel.org>,
 <shiyongbang@huawei.com>
References: <20250222025102.1519798-1-shiyongbang@huawei.com>
 <20250222025102.1519798-7-shiyongbang@huawei.com>
 <gv62rn7uqxplvpe6dqmfg7bypykmekdgv3abwngjcntmb7onhi@bgyfpwzx5kae>
From: Yongbang Shi <shiyongbang@huawei.com>
In-Reply-To: <gv62rn7uqxplvpe6dqmfg7bypykmekdgv3abwngjcntmb7onhi@bgyfpwzx5kae>
Content-Type: text/plain; charset="UTF-8"; format=flowed
Content-Transfer-Encoding: 7bit
X-Originating-IP: [10.159.166.136]
X-ClientProxiedBy: dggems705-chm.china.huawei.com (10.3.19.182) To
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

> On Sat, Feb 22, 2025 at 10:50:59AM +0800, Yongbang Shi wrote:
>> From: Baihan Li <libaihan@huawei.com>
>>
>> DP controller can support generating a color bar signal over the
>> DisplayPort interface. This can be useful to check for possible DDR
>> or GPU problems, as the signal generator resides completely in the DP
>> block. Add debugfs file that controls colorbar generator.
>>
>> echo: config the color bar register to display
>> cat: print the color bar configuration
>>
>> Signed-off-by: Baihan Li <libaihan@huawei.com>
>> Signed-off-by: Yongbang Shi <shiyongbang@huawei.com>
>> ---
>> ChangeLog:
>> v2 -> v3:
>>    - rewrite the commit log, suggested by Dmitry Baryshkov.
>>    - move colorbar debugfs entry to this patch, suggested by Dmitry Baryshkov.
>>    - change binary format to integer format, suggested by Dmitry Baryshkov.
>> v1 -> v2:
>>    - add colorbar introduction in commit, suggested by Dmitry Baryshkov.
>>    - splittting colorbar and debugfs in different patches, suggested by Dmitry Baryshkov.
>>    - deleting edid decoder and its debugfs, suggested by Dmitry Baryshkov.
>>    - using debugfs_init() callback, suggested by Dmitry Baryshkov.
>> ---
>>   drivers/gpu/drm/hisilicon/hibmc/Makefile      |   3 +-
>>   drivers/gpu/drm/hisilicon/hibmc/dp/dp_hw.c    |  43 ++++++++
>>   drivers/gpu/drm/hisilicon/hibmc/dp/dp_hw.h    |  29 +++++
>>   drivers/gpu/drm/hisilicon/hibmc/dp/dp_reg.h   |   3 +
>>   .../drm/hisilicon/hibmc/hibmc_drm_debugfs.c   | 100 ++++++++++++++++++
>>   .../gpu/drm/hisilicon/hibmc/hibmc_drm_dp.c    |   1 +
>>   .../gpu/drm/hisilicon/hibmc/hibmc_drm_drv.h   |   2 +
>>   7 files changed, 180 insertions(+), 1 deletion(-)
>>   create mode 100644 drivers/gpu/drm/hisilicon/hibmc/hibmc_drm_debugfs.c
>>
>> diff --git a/drivers/gpu/drm/hisilicon/hibmc/Makefile b/drivers/gpu/drm/hisilicon/hibmc/Makefile
>> index 43de077d6769..1f65c683282f 100644
>> --- a/drivers/gpu/drm/hisilicon/hibmc/Makefile
>> +++ b/drivers/gpu/drm/hisilicon/hibmc/Makefile
>> @@ -1,5 +1,6 @@
>>   # SPDX-License-Identifier: GPL-2.0-only
>>   hibmc-drm-y := hibmc_drm_drv.o hibmc_drm_de.o hibmc_drm_vdac.o hibmc_drm_i2c.o \
>> -	       dp/dp_aux.o dp/dp_link.o dp/dp_hw.o dp/dp_serdes.o hibmc_drm_dp.o
>> +	       dp/dp_aux.o dp/dp_link.o dp/dp_hw.o dp/dp_serdes.o hibmc_drm_dp.o \
>> +	       hibmc_drm_debugfs.o
>>   
>>   obj-$(CONFIG_DRM_HISI_HIBMC) += hibmc-drm.o
>> diff --git a/drivers/gpu/drm/hisilicon/hibmc/dp/dp_hw.c b/drivers/gpu/drm/hisilicon/hibmc/dp/dp_hw.c
>> index 9d673f431a0e..a921b98dbf50 100644
>> --- a/drivers/gpu/drm/hisilicon/hibmc/dp/dp_hw.c
>> +++ b/drivers/gpu/drm/hisilicon/hibmc/dp/dp_hw.c
>> @@ -227,3 +227,46 @@ int hibmc_dp_mode_set(struct hibmc_dp *dp, struct drm_display_mode *mode)
>>   
>>   	return 0;
>>   }
>> +
>> +static const struct hibmc_dp_color_raw g_rgb_raw[] = {
>> +	{CBAR_COLOR_BAR, 0x000, 0x000, 0x000},
>> +	{CBAR_WHITE,     0xfff, 0xfff, 0xfff},
>> +	{CBAR_RED,       0xfff, 0x000, 0x000},
>> +	{CBAR_ORANGE,    0xfff, 0x800, 0x000},
>> +	{CBAR_YELLOW,    0xfff, 0xfff, 0x000},
>> +	{CBAR_GREEN,     0x000, 0xfff, 0x000},
>> +	{CBAR_CYAN,      0x000, 0x800, 0x800},
>> +	{CBAR_BLUE,      0x000, 0x000, 0xfff},
>> +	{CBAR_PURPLE,    0x800, 0x000, 0x800},
>> +	{CBAR_BLACK,     0x000, 0x000, 0x000},
>> +};
>> +
>> +void hibmc_dp_set_cbar(struct hibmc_dp *dp, const struct hibmc_dp_cbar_cfg *cfg)
>> +{
>> +	struct hibmc_dp_dev *dp_dev = dp->dp_dev;
>> +	struct hibmc_dp_color_raw raw_data;
>> +
>> +	if (cfg->enable) {
>> +		hibmc_dp_reg_write_field(dp_dev, HIBMC_DP_COLOR_BAR_CTRL, BIT(9),
>> +					 cfg->self_timing);
>> +		hibmc_dp_reg_write_field(dp_dev, HIBMC_DP_COLOR_BAR_CTRL, GENMASK(8, 1),
>> +					 cfg->dynamic_rate);
>> +		if (cfg->pattern == CBAR_COLOR_BAR) {
>> +			hibmc_dp_reg_write_field(dp_dev, HIBMC_DP_COLOR_BAR_CTRL, BIT(10), 0);
>> +		} else {
>> +			raw_data = g_rgb_raw[cfg->pattern];
>> +			drm_dbg_dp(dp->drm_dev, "r:%x g:%x b:%x\n", raw_data.r_value,
>> +				   raw_data.g_value, raw_data.b_value);
>> +			hibmc_dp_reg_write_field(dp_dev, HIBMC_DP_COLOR_BAR_CTRL, BIT(10), 1);
>> +			hibmc_dp_reg_write_field(dp_dev, HIBMC_DP_COLOR_BAR_CTRL, GENMASK(23, 12),
>> +						 raw_data.r_value);
>> +			hibmc_dp_reg_write_field(dp_dev, HIBMC_DP_COLOR_BAR_CTRL1, GENMASK(23, 12),
>> +						 raw_data.g_value);
>> +			hibmc_dp_reg_write_field(dp_dev, HIBMC_DP_COLOR_BAR_CTRL1, GENMASK(11, 0),
>> +						 raw_data.b_value);
>> +		}
>> +	}
>> +
>> +	hibmc_dp_reg_write_field(dp_dev, HIBMC_DP_COLOR_BAR_CTRL, BIT(0), cfg->enable);
>> +	writel(HIBMC_DP_SYNC_EN_MASK, dp_dev->base + HIBMC_DP_TIMING_SYNC_CTRL);
>> +}
>> diff --git a/drivers/gpu/drm/hisilicon/hibmc/dp/dp_hw.h b/drivers/gpu/drm/hisilicon/hibmc/dp/dp_hw.h
>> index 53b6d0beecea..83a53dae8012 100644
>> --- a/drivers/gpu/drm/hisilicon/hibmc/dp/dp_hw.h
>> +++ b/drivers/gpu/drm/hisilicon/hibmc/dp/dp_hw.h
>> @@ -14,6 +14,33 @@
>>   
>>   struct hibmc_dp_dev;
>>   
>> +enum hibmc_dp_cbar_pattern {
>> +	CBAR_COLOR_BAR,
>> +	CBAR_WHITE,
>> +	CBAR_RED,
>> +	CBAR_ORANGE,
>> +	CBAR_YELLOW,
>> +	CBAR_GREEN,
>> +	CBAR_CYAN,
>> +	CBAR_BLUE,
>> +	CBAR_PURPLE,
>> +	CBAR_BLACK,
>> +};
>> +
>> +struct hibmc_dp_color_raw {
>> +	enum hibmc_dp_cbar_pattern pattern;
>> +	u32 r_value;
>> +	u32 g_value;
>> +	u32 b_value;
>> +};
>> +
>> +struct hibmc_dp_cbar_cfg {
>> +	u8 enable;
>> +	u8 self_timing;
>> +	u8 dynamic_rate; /* 0:static, 1-255(frame):dynamic */
>> +	enum hibmc_dp_cbar_pattern pattern;
>> +};
>> +
>>   struct hibmc_dp {
>>   	struct hibmc_dp_dev *dp_dev;
>>   	struct drm_device *drm_dev;
>> @@ -21,10 +48,12 @@ struct hibmc_dp {
>>   	struct drm_connector connector;
>>   	void __iomem *mmio;
>>   	struct drm_dp_aux aux;
>> +	struct hibmc_dp_cbar_cfg cfg;
>>   };
>>   
>>   int hibmc_dp_hw_init(struct hibmc_dp *dp);
>>   int hibmc_dp_mode_set(struct hibmc_dp *dp, struct drm_display_mode *mode);
>>   void hibmc_dp_display_en(struct hibmc_dp *dp, bool enable);
>> +void hibmc_dp_set_cbar(struct hibmc_dp *dp, const struct hibmc_dp_cbar_cfg *cfg);
>>   
>>   #endif
>> diff --git a/drivers/gpu/drm/hisilicon/hibmc/dp/dp_reg.h b/drivers/gpu/drm/hisilicon/hibmc/dp/dp_reg.h
>> index b75ac13a5ead..4c388f633081 100644
>> --- a/drivers/gpu/drm/hisilicon/hibmc/dp/dp_reg.h
>> +++ b/drivers/gpu/drm/hisilicon/hibmc/dp/dp_reg.h
>> @@ -67,6 +67,9 @@
>>   #define HIBMC_DP_CFG_STREAM_HTOTAL_SIZE		GENMASK(31, 16)
>>   #define HIBMC_DP_CFG_STREAM_HBLANK_SIZE		GENMASK(15, 0)
>>   
>> +#define HIBMC_DP_COLOR_BAR_CTRL			0x260
>> +#define HIBMC_DP_COLOR_BAR_CTRL1		0x264
>> +
>>   #define HIBMC_DP_TIMING_GEN_CONFIG0		0x26c
>>   #define HIBMC_DP_CFG_TIMING_GEN0_HACTIVE	GENMASK(31, 16)
>>   #define HIBMC_DP_CFG_TIMING_GEN0_HBLANK		GENMASK(15, 0)
>> diff --git a/drivers/gpu/drm/hisilicon/hibmc/hibmc_drm_debugfs.c b/drivers/gpu/drm/hisilicon/hibmc/hibmc_drm_debugfs.c
>> new file mode 100644
>> index 000000000000..8d050a36946e
>> --- /dev/null
>> +++ b/drivers/gpu/drm/hisilicon/hibmc/hibmc_drm_debugfs.c
>> @@ -0,0 +1,100 @@
>> +// SPDX-License-Identifier: GPL-2.0-or-later
>> +// Copyright (c) 2024 Hisilicon Limited.
>> +
>> +#include <linux/debugfs.h>
>> +#include <linux/device.h>
>> +#include <linux/seq_file.h>
>> +#include <linux/pci.h>
>> +
>> +#include <drm/drm_drv.h>
>> +#include <drm/drm_file.h>
>> +#include <drm/drm_debugfs.h>
>> +#include <drm/drm_edid.h>
>> +
>> +#include "hibmc_drm_drv.h"
>> +
>> +#define MAX_BUF_SIZE 12
>> +
>> +static ssize_t hibmc_control_write(struct file *file, const char __user *user_buf,
>> +				   size_t count, loff_t *ppos)
>> +{
>> +	struct hibmc_drm_private *priv = file_inode(file)->i_private;
>> +	struct hibmc_dp_cbar_cfg *cfg = &priv->dp.cfg;
>> +	int ret, idx;
>> +	u8 buf[MAX_BUF_SIZE];
>> +
>> +	if (count >= MAX_BUF_SIZE)
>> +		return -EINVAL;
>> +
>> +	if (copy_from_user(buf, user_buf, count))
>> +		return -EFAULT;
>> +
>> +	buf[count] = '\0';
>> +
> There should be at least some documentation on the written values.

Okay!


>> +	if (sscanf(buf, "%hhu %hhu %hhu %u", &cfg->enable, &cfg->self_timing,
>> +		   &cfg->dynamic_rate, &cfg->pattern) != 4) {
>> +		return -EINVAL;
>> +	}
>> +
>> +	if (cfg->pattern > 9 || cfg->enable > 1 || cfg->self_timing > 1)
>> +		return -EINVAL;
>> +
>> +	ret = drm_dev_enter(&priv->dev, &idx);
>> +	if (!ret)
>> +		return -ENODEV;
>> +
>> +	hibmc_dp_set_cbar(&priv->dp, cfg);
>> +
>> +	drm_dev_exit(idx);
>> +
>> +	return count;
>> +}
