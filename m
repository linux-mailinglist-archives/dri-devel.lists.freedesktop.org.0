Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 1FF289D9004
	for <lists+dri-devel@lfdr.de>; Tue, 26 Nov 2024 02:38:13 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 7198D10E0F9;
	Tue, 26 Nov 2024 01:38:10 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from szxga02-in.huawei.com (szxga02-in.huawei.com [45.249.212.188])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 59F2A10E0F9
 for <dri-devel@lists.freedesktop.org>; Tue, 26 Nov 2024 01:38:08 +0000 (UTC)
Received: from mail.maildlp.com (unknown [172.19.163.252])
 by szxga02-in.huawei.com (SkyGuard) with ESMTP id 4Xy4rj2LgGzPpn4;
 Tue, 26 Nov 2024 09:35:17 +0800 (CST)
Received: from kwepemd500013.china.huawei.com (unknown [7.221.188.12])
 by mail.maildlp.com (Postfix) with ESMTPS id 4D2F21800A2;
 Tue, 26 Nov 2024 09:38:03 +0800 (CST)
Received: from [10.159.166.136] (10.159.166.136) by
 kwepemd500013.china.huawei.com (7.221.188.12) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.1258.34; Tue, 26 Nov 2024 09:38:01 +0800
Message-ID: <bb603875-dc3f-4e3c-88eb-fdd9c7217383@huawei.com>
Date: Tue, 26 Nov 2024 09:38:00 +0800
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v5 drm-dp 1/5] drm/hisilicon/hibmc: add dp aux in hibmc
To: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
CC: <xinliang.liu@linaro.org>, <tiantao6@hisilicon.com>,
 <maarten.lankhorst@linux.intel.com>, <mripard@kernel.org>,
 <tzimmermann@suse.de>, <airlied@gmail.com>, <daniel@ffwll.ch>,
 <kong.kongxinwei@hisilicon.com>, <liangjian010@huawei.com>,
 <chenjianmin@huawei.com>, <lidongming5@huawei.com>, <libaihan@huawei.com>,
 <shenjian15@huawei.com>, <shaojijie@huawei.com>,
 <dri-devel@lists.freedesktop.org>, <linux-kernel@vger.kernel.org>,
 <shiyongbang@huawei.com>
References: <20241118142805.3326443-1-shiyongbang@huawei.com>
 <20241118142805.3326443-2-shiyongbang@huawei.com>
 <augqwu7iv42ges4x53ysulbfv43x6hadku7rgwjlscelsx5iwk@xmpeutszvjev>
From: Yongbang Shi <shiyongbang@huawei.com>
In-Reply-To: <augqwu7iv42ges4x53ysulbfv43x6hadku7rgwjlscelsx5iwk@xmpeutszvjev>
Content-Type: text/plain; charset="UTF-8"; format=flowed
Content-Transfer-Encoding: 8bit
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


在 2024/11/22 9:42, Dmitry Baryshkov 写道:
> On Mon, Nov 18, 2024 at 10:28:01PM +0800, Yongbang Shi wrote:
>> From: baihan li <libaihan@huawei.com>
>>
>> Add dp aux read/write functions. They are basic functions
>> and will be used later.
>>
>> Signed-off-by: Baihan Li <libaihan@huawei.com>
>> Signed-off-by: Yongbang Shi <shiyongbang@huawei.com>
>> ---
>> ChangeLog:
>> v4 -> v5:
>>    - fixing build errors reported by kernel test robot <lkp@intel.com>
>>      Closes: https://lore.kernel.org/oe-kbuild-all/202411131438.RZWYrWTE-lkp@intel.com/
>> v3 -> v4:
>>    - retun error codes in  result incorrect branch, suggested by Dmitry Baryshkov.
>>    - replacing all ret= with returns, suggested by Dmitry Baryshkov.
>>    - moving the comment below the judgment statement, suggested by Dmitry Baryshkov.
>>    - moving definations to the source file and clearing headers, suggested by Dmitry Baryshkov.
>>    - reanaming dp_prefix to hibmc_dp_prefix, suggested by Dmitry Baryshkov.
>>    - changing hibmc_dp_reg_write_field to static inline and lock, suggested by Dmitry Baryshkov.
>>    - moving some structs to later patch, suggested by Dmitry Baryshkov.
>> v2 -> v3:
>>    - put the macro definations in latter patch where they are actually used, suggested by Dmitry Baryshkov.
>>    - rename some macro definations to make them sensible, suggested by Dmitry Baryshkov.
>>    - using FIELD_PREP and FIELD_GET, suggested by Dmitry Baryshkov.
>>    - using DP_DPCD_REV_foo, suggested by Dmitry Baryshkov.
>>    - fix build errors reported by kernel test robot <lkp@intel.com>
>>      Closes: https://lore.kernel.org/oe-kbuild-all/202410250305.UHKDhtxy-lkp@intel.com/
>> v1 -> v2:
>>    - using drm_dp_aux frame implement dp aux read and write functions, suggested by Jani Nikula.
>>    - using drm dp header files' dp macros instead, suggested by Andy Yan.
>>    v1:https://lore.kernel.org/all/20240930100610.782363-1-shiyongbang@huawei.com/
>> ---
>>   drivers/gpu/drm/hisilicon/hibmc/Makefile     |   3 +-
>>   drivers/gpu/drm/hisilicon/hibmc/dp/dp_aux.c  | 164 +++++++++++++++++++
>>   drivers/gpu/drm/hisilicon/hibmc/dp/dp_comm.h |  38 +++++
>>   drivers/gpu/drm/hisilicon/hibmc/dp/dp_reg.h  |  27 +++
>>   4 files changed, 231 insertions(+), 1 deletion(-)
>>   create mode 100644 drivers/gpu/drm/hisilicon/hibmc/dp/dp_aux.c
>>   create mode 100644 drivers/gpu/drm/hisilicon/hibmc/dp/dp_comm.h
>>   create mode 100644 drivers/gpu/drm/hisilicon/hibmc/dp/dp_reg.h
>>
>> diff --git a/drivers/gpu/drm/hisilicon/hibmc/Makefile b/drivers/gpu/drm/hisilicon/hibmc/Makefile
>> index d25c75e60d3d..8770ec6dfffd 100644
>> --- a/drivers/gpu/drm/hisilicon/hibmc/Makefile
>> +++ b/drivers/gpu/drm/hisilicon/hibmc/Makefile
>> @@ -1,4 +1,5 @@
>>   # SPDX-License-Identifier: GPL-2.0-only
>> -hibmc-drm-y := hibmc_drm_drv.o hibmc_drm_de.o hibmc_drm_vdac.o hibmc_drm_i2c.o
>> +hibmc-drm-y := hibmc_drm_drv.o hibmc_drm_de.o hibmc_drm_vdac.o hibmc_drm_i2c.o \
>> +	       dp/dp_aux.o
>>   
>>   obj-$(CONFIG_DRM_HISI_HIBMC) += hibmc-drm.o
>> diff --git a/drivers/gpu/drm/hisilicon/hibmc/dp/dp_aux.c b/drivers/gpu/drm/hisilicon/hibmc/dp/dp_aux.c
>> new file mode 100644
>> index 000000000000..16bdfefbf255
>> --- /dev/null
>> +++ b/drivers/gpu/drm/hisilicon/hibmc/dp/dp_aux.c
>> @@ -0,0 +1,164 @@
>> +// SPDX-License-Identifier: GPL-2.0-or-laterHIBMC_BYTES_IN_U32
>> +// Copyright (c) 2024 Hisilicon Limited.
>> +
>> +#include <linux/io.h>
>> +#include <linux/iopoll.h>
>> +#include <linux/minmax.h>
>> +#include <drm/drm_device.h>
>> +#include <drm/drm_print.h>
>> +#include "dp_comm.h"
>> +#include "dp_reg.h"
>> +
>> +#define HIBMC_AUX_CMD_REQ_LEN		GENMASK(7, 4)
>> +#define HIBMC_AUX_CMD_ADDR		GENMASK(27, 8)
>> +#define HIBMC_AUX_CMD_I2C_ADDR_ONLY	BIT(28)
>> +#define HIBMC_BYTES_IN_U32		4
>> +#define HIBMC_AUX_I2C_WRITE_SUCCESS	0x1
>> +#define HIBMC_DP_MIN_PULSE_NUM		0x9
>> +#define BITS_IN_U8			8
>> +
>> +static inline void hibmc_dp_aux_reset(struct hibmc_dp_dev *dp)
>> +{
>> +	hibmc_dp_reg_write_field(dp, HIBMC_DP_DPTX_RST_CTRL, HIBMC_DP_CFG_AUX_RST_N, 0x0);
>> +	usleep_range(10, 15);
>> +	hibmc_dp_reg_write_field(dp, HIBMC_DP_DPTX_RST_CTRL, HIBMC_DP_CFG_AUX_RST_N, 0x1);
>> +}
>> +
>> +static void hibmc_dp_aux_read_data(struct hibmc_dp_dev *dp, u8 *buf, u8 size)
>> +{
>> +	u32 reg_num;
>> +	u32 value;
>> +	u32 num;
>> +	u8 i, j;
>> +
>> +	reg_num = DIV_ROUND_UP(size, HIBMC_BYTES_IN_U32);
>> +	for (i = 0; i < reg_num; i++) {
>> +		/* number of bytes read from a single register */
>> +		num = min(size - i * HIBMC_BYTES_IN_U32, HIBMC_BYTES_IN_U32);
>> +		value = readl(dp->base + HIBMC_DP_AUX_RD_DATA0 + i * HIBMC_BYTES_IN_U32);
>> +		/* convert the 32-bit value of the register to the buffer. */
>> +		for (j = 0; j < num; j++)
>> +			buf[i * HIBMC_BYTES_IN_U32 + j] = value >> (j * BITS_IN_U8);
>> +	}
>> +}
>> +
>> +static void hibmc_dp_aux_write_data(struct hibmc_dp_dev *dp, u8 *buf, u8 size)
>> +{
>> +	u32 reg_num;
>> +	u32 value;
>> +	u32 num;
>> +	u8 i, j;
>> +
>> +	reg_num = DIV_ROUND_UP(size, HIBMC_BYTES_IN_U32);
>> +	for (i = 0; i < reg_num; i++) {
>> +		/* number of bytes written to a single register */
>> +		num = min_t(u8, size - i * HIBMC_BYTES_IN_U32, HIBMC_BYTES_IN_U32);
>> +		value = 0;
>> +		/* obtain the 32-bit value written to a single register. */
>> +		for (j = 0; j < num; j++)
>> +			value |= buf[i * HIBMC_BYTES_IN_U32 + j] << (j * BITS_IN_U8);
>> +		/* writing data to a single register */
>> +		writel(value, dp->base + HIBMC_DP_AUX_WR_DATA0 + i * HIBMC_BYTES_IN_U32);
>> +	}
>> +}
>> +
>> +static u32 hibmc_dp_aux_build_cmd(const struct drm_dp_aux_msg *msg)
>> +{
>> +	u32 aux_cmd = msg->request;
>> +
>> +	if (msg->size)
>> +		aux_cmd |= FIELD_PREP(HIBMC_AUX_CMD_REQ_LEN, (msg->size - 1));
>> +	else
>> +		aux_cmd |= FIELD_PREP(HIBMC_AUX_CMD_I2C_ADDR_ONLY, 1);
>> +
>> +	aux_cmd |= FIELD_PREP(HIBMC_AUX_CMD_ADDR, msg->address);
>> +
>> +	return aux_cmd;
>> +}
>> +
>> +/* ret >= 0, ret is size; ret < 0, ret is err code */
>> +static int hibmc_dp_aux_parse_xfer(struct hibmc_dp_dev *dp, struct drm_dp_aux_msg *msg)
>> +{
>> +	u32 buf_data_cnt;
>> +	u32 aux_status;
>> +
>> +	aux_status = readl(dp->base + HIBMC_DP_AUX_STATUS);
>> +	msg->reply = FIELD_GET(HIBMC_DP_CFG_AUX_STATUS, aux_status);
>> +
>> +	if (aux_status & HIBMC_DP_CFG_AUX_TIMEOUT)
>> +		return -ETIMEDOUT;
>> +
>> +	/* only address */
>> +	if (!msg->size)
>> +		return 0;
>> +
>> +	if (msg->reply != DP_AUX_NATIVE_REPLY_ACK)
>> +		return -EIO;
>> +
>> +	buf_data_cnt = FIELD_GET(HIBMC_DP_CFG_AUX_READY_DATA_BYTE, aux_status);
>> +
>> +	switch (msg->request) {
>> +	case DP_AUX_NATIVE_WRITE:
>> +		return msg->size;
>> +	case DP_AUX_I2C_WRITE | DP_AUX_I2C_MOT:
>> +		if (buf_data_cnt == HIBMC_AUX_I2C_WRITE_SUCCESS)
>> +			return msg->size;
>> +		else
>> +			return FIELD_GET(HIBMC_DP_CFG_AUX, aux_status);
>> +	case DP_AUX_NATIVE_READ:
>> +	case DP_AUX_I2C_READ | DP_AUX_I2C_MOT:
>> +		buf_data_cnt--;
>> +		if (buf_data_cnt != msg->size) {
>> +			/* only the successful part of data is read */
>> +			return -EBUSY;
>> +		}
>> +
>> +		/* all data is successfully read */
>> +		hibmc_dp_aux_read_data(dp, msg->buffer, msg->size);
>> +		return msg->size;
>> +	default:
>> +		return -EINVAL;
>> +	}
>> +}
>> +
>> +/* ret >= 0 ,ret is size; ret < 0, ret is err code */
>> +static ssize_t hibmc_dp_aux_xfer(struct drm_dp_aux *aux, struct drm_dp_aux_msg *msg)
>> +{
>> +	struct hibmc_dp_dev *dp = container_of(aux, struct hibmc_dp_dev, aux);
>> +	u32 aux_cmd;
>> +	int ret;
>> +	u32 val; /* val will be assigned at the beginning of readl_poll_timeout function */
>> +
>> +	writel(0, dp->base + HIBMC_DP_AUX_WR_DATA0);
>> +	writel(0, dp->base + HIBMC_DP_AUX_WR_DATA1);
>> +	writel(0, dp->base + HIBMC_DP_AUX_WR_DATA2);
>> +	writel(0, dp->base + HIBMC_DP_AUX_WR_DATA3);
>> +
>> +	hibmc_dp_aux_write_data(dp, msg->buffer, msg->size);
>> +
>> +	aux_cmd = hibmc_dp_aux_build_cmd(msg);
>> +	writel(aux_cmd, dp->base + HIBMC_DP_AUX_CMD_ADDR);
>> +
>> +	/* enable aux transfer */
>> +	hibmc_dp_reg_write_field(dp, HIBMC_DP_AUX_REQ, HIBMC_DP_CFG_AUX_REQ, 0x1);
>> +	ret = readl_poll_timeout(dp->base + HIBMC_DP_AUX_REQ, val,
>> +				 !(val & HIBMC_DP_CFG_AUX_REQ), 50, 5000);
>> +	if (ret) {
>> +		hibmc_dp_aux_reset(dp);
>> +		return ret;
>> +	}
>> +
>> +	return hibmc_dp_aux_parse_xfer(dp, msg);
>> +}
>> +
>> +void hibmc_dp_aux_init(struct hibmc_dp_dev *dp)
>> +{
>> +	hibmc_dp_reg_write_field(dp, HIBMC_DP_AUX_REQ, HIBMC_DP_CFG_AUX_SYNC_LEN_SEL, 0x0);
>> +	hibmc_dp_reg_write_field(dp, HIBMC_DP_AUX_REQ, HIBMC_DP_CFG_AUX_TIMER_TIMEOUT, 0x1);
>> +	hibmc_dp_reg_write_field(dp, HIBMC_DP_AUX_REQ, HIBMC_DP_CFG_AUX_MIN_PULSE_NUM,
>> +				 HIBMC_DP_MIN_PULSE_NUM);
>> +
>> +	dp->aux.transfer = hibmc_dp_aux_xfer;
>> +	dp->aux.is_remote = 0;
>> +	drm_dp_aux_init(&dp->aux);
>> +}
>> diff --git a/drivers/gpu/drm/hisilicon/hibmc/dp/dp_comm.h b/drivers/gpu/drm/hisilicon/hibmc/dp/dp_comm.h
>> new file mode 100644
>> index 000000000000..ce3b6fa4ea9e
>> --- /dev/null
>> +++ b/drivers/gpu/drm/hisilicon/hibmc/dp/dp_comm.h
>> @@ -0,0 +1,38 @@
>> +/* SPDX-License-Identifier: GPL-2.0-or-later */
>> +/* Copyright (c) 2024 Hisilicon Limited. */
>> +
>> +#ifndef DP_COMM_H
>> +#define DP_COMM_H
>> +
>> +#include <linux/types.h>
>> +#include <linux/bitops.h>
>> +#include <linux/errno.h>
>> +#include <linux/mutex.h>
>> +#include <linux/kernel.h>
>> +#include <linux/bitfield.h>
>> +#include <linux/io.h>
>> +#include <drm/display/drm_dp_helper.h>
>> +
>> +struct hibmc_dp_dev {
>> +	struct drm_dp_aux aux;
>> +	struct drm_device *dev;
>> +	void __iomem *base;
>> +	struct mutex lock; /* protects concurrent RW in hibmc_dp_reg_write_field() */
>> +};
>> +
>> +#define dp_field_modify(reg_value, mask, val) ({		\
>> +	(reg_value) &= ~(mask);					\
>> +	(reg_value) |= FIELD_PREP(mask, val); })
> do { ... } while (0) or static inline. Or just inline into the calling
> function, if there is just one place where it is used.
>
>> +
>> +#define hibmc_dp_reg_write_field(dp, offset, mask, val) ({	\
>> +	typeof(dp) _dp = dp;					\
>> +	typeof(_dp->base) addr = (_dp->base + (offset));	\
>> +	mutex_lock(&_dp->lock);					\
>> +	u32 reg_value = readl(addr);				\
>> +	dp_field_modify(reg_value, mask, val);			\
>> +	writel(reg_value, addr);				\
>> +	mutex_unlock(&_dp->lock); })
> I'd prefer a static inline function. Other than that:

Dear Dmitry,
Thanks for your all advice and your very carefully reviewing! I will take your all other suggestion.
For this function, it will be used in multiple files. If we static inline it in header, there
will be kernel test robot's build error becuase FIELD_PREP()'s parameter is a variable.
Here's the error's link: https://lore.kernel.org/oe-kbuild-all/202411131438.RZWYrWTE-lkp@intel.com/

Thanks,
Baihan


>
> Reviewed-by: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
>
>
>> +
>> +void hibmc_dp_aux_init(struct hibmc_dp_dev *dp);
>> +
>> +#endif
>> diff --git a/drivers/gpu/drm/hisilicon/hibmc/dp/dp_reg.h b/drivers/gpu/drm/hisilicon/hibmc/dp/dp_reg.h
>> new file mode 100644
>> index 000000000000..f3e6781e111a
>> --- /dev/null
>> +++ b/drivers/gpu/drm/hisilicon/hibmc/dp/dp_reg.h
>> @@ -0,0 +1,27 @@
>> +/* SPDX-License-Identifier: GPL-2.0-or-later */
>> +/* Copyright (c) 2024 Hisilicon Limited. */
>> +
>> +#ifndef DP_REG_H
>> +#define DP_REG_H
>> +
>> +#define HIBMC_DP_AUX_CMD_ADDR			0x50
>> +#define HIBMC_DP_AUX_WR_DATA0			0x54
>> +#define HIBMC_DP_AUX_WR_DATA1			0x58
>> +#define HIBMC_DP_AUX_WR_DATA2			0x5c
>> +#define HIBMC_DP_AUX_WR_DATA3			0x60
>> +#define HIBMC_DP_AUX_RD_DATA0			0x64
>> +#define HIBMC_DP_AUX_REQ			0x74
>> +#define HIBMC_DP_AUX_STATUS			0x78
>> +#define HIBMC_DP_DPTX_RST_CTRL			0x700
>> +
>> +#define HIBMC_DP_CFG_AUX_SYNC_LEN_SEL		BIT(1)
>> +#define HIBMC_DP_CFG_AUX_TIMER_TIMEOUT		BIT(2)
>> +#define HIBMC_DP_CFG_AUX_MIN_PULSE_NUM		GENMASK(13, 9)
>> +#define HIBMC_DP_CFG_AUX_REQ			BIT(0)
>> +#define HIBMC_DP_CFG_AUX_RST_N			BIT(4)
>> +#define HIBMC_DP_CFG_AUX_TIMEOUT		BIT(0)
>> +#define HIBMC_DP_CFG_AUX_READY_DATA_BYTE	GENMASK(16, 12)
>> +#define HIBMC_DP_CFG_AUX			GENMASK(24, 17)
>> +#define HIBMC_DP_CFG_AUX_STATUS			GENMASK(11, 4)
>> +
>> +#endif
>> -- 
>> 2.33.0
>>
