Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 407179E98B4
	for <lists+dri-devel@lfdr.de>; Mon,  9 Dec 2024 15:24:55 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 15AB810E746;
	Mon,  9 Dec 2024 14:24:49 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from szxga01-in.huawei.com (szxga01-in.huawei.com [45.249.212.187])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 5986010E746
 for <dri-devel@lists.freedesktop.org>; Mon,  9 Dec 2024 14:24:47 +0000 (UTC)
Received: from mail.maildlp.com (unknown [172.19.163.48])
 by szxga01-in.huawei.com (SkyGuard) with ESMTP id 4Y6PFn5lT4zhZV8;
 Mon,  9 Dec 2024 22:22:21 +0800 (CST)
Received: from kwepemd500013.china.huawei.com (unknown [7.221.188.12])
 by mail.maildlp.com (Postfix) with ESMTPS id 6CC90180064;
 Mon,  9 Dec 2024 22:24:44 +0800 (CST)
Received: from [10.159.166.136] (10.159.166.136) by
 kwepemd500013.china.huawei.com (7.221.188.12) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.1258.34; Mon, 9 Dec 2024 22:24:42 +0800
Message-ID: <bca38499-5479-4edc-9cea-217f3164258b@huawei.com>
Date: Mon, 9 Dec 2024 22:24:41 +0800
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v6 drm-dp 2/5] drm/hisilicon/hibmc: add dp link moduel in
 hibmc
To: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
CC: <xinliang.liu@linaro.org>, <tiantao6@hisilicon.com>,
 <maarten.lankhorst@linux.intel.com>, <mripard@kernel.org>,
 <tzimmermann@suse.de>, <airlied@gmail.com>, <daniel@ffwll.ch>,
 <kong.kongxinwei@hisilicon.com>, <liangjian010@huawei.com>,
 <chenjianmin@huawei.com>, <lidongming5@huawei.com>, <libaihan@huawei.com>,
 <shenjian15@huawei.com>, <shaojijie@huawei.com>,
 <dri-devel@lists.freedesktop.org>, <linux-kernel@vger.kernel.org>,
 <shiyongbang@huawei.com>
References: <20241202131322.1847078-1-shiyongbang@huawei.com>
 <20241202131322.1847078-3-shiyongbang@huawei.com>
 <yyunb5oxzlmrrcxlsrub4j7iwwpaptbvubbtxr3omjftietc5b@3tfg2ldxeaoa>
From: Yongbang Shi <shiyongbang@huawei.com>
In-Reply-To: <yyunb5oxzlmrrcxlsrub4j7iwwpaptbvubbtxr3omjftietc5b@3tfg2ldxeaoa>
Content-Type: text/plain; charset="UTF-8"; format=flowed
Content-Transfer-Encoding: 8bit
X-Originating-IP: [10.159.166.136]
X-ClientProxiedBy: dggems704-chm.china.huawei.com (10.3.19.181) To
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

> On Mon, Dec 02, 2024 at 09:13:19PM +0800, Yongbang Shi wrote:
>> From: baihan li <libaihan@huawei.com>
>>
>> Add link training process functions in this moduel.
>>
>> Signed-off-by: Baihan Li <libaihan@huawei.com>
>> Signed-off-by: Yongbang Shi <shiyongbang@huawei.com>
>> ---
>> Changelog:
>> v5 -> v6:
>>    - using drm_dbg_dp() to print debug info instead of drm_info(), suggested by Dmitry Baryshkov.
>> v3 -> v4:
>>    - optimizing hibmc_dp_link_get_adjust_train() to delete for loop, suggested by Dmitry Baryshkov.
>>    - changing ELNRNG to EIO error code, suggested by Dmitry Baryshkov.
>>    - deleting meaningless macro, suggested by Dmitry Baryshkov.
>>    - fixing build errors reported by kernel test robot <lkp@intel.com>
>>      Closes: https://lore.kernel.org/oe-kbuild-all/202411041559.WIfxRN6n-lkp@intel.com/
>> v2 -> v3:
>>    - using switchcase in dp_link_reduce_lane, suggested by Dmitry Baryshkov.
>>    - deleting dp_link_pattern2dpcd function and using macros directly, suggested by Dmitry Baryshkov.
>>    - deleting EFAULT error codes, suggested by Dmitry Baryshkov.
>> v1 -> v2:
>>    - using drm_dp_* functions implement dp link training process, suggested by Jani Nikula.
>>    - fix build errors reported by kernel test robot <lkp@intel.com>
>>      Closes: https://lore.kernel.org/oe-kbuild-all/202410031735.8iRZZR6T-lkp@intel.com/
>>    v1:https://lore.kernel.org/all/20240930100610.782363-1-shiyongbang@huawei.com/
>> ---
>>   drivers/gpu/drm/hisilicon/hibmc/Makefile     |   2 +-
>>   drivers/gpu/drm/hisilicon/hibmc/dp/dp_comm.h |  24 ++
>>   drivers/gpu/drm/hisilicon/hibmc/dp/dp_link.c | 339 +++++++++++++++++++
>>   drivers/gpu/drm/hisilicon/hibmc/dp/dp_reg.h  |   8 +
>>   4 files changed, 372 insertions(+), 1 deletion(-)
>>   create mode 100644 drivers/gpu/drm/hisilicon/hibmc/dp/dp_link.c
>>
>> diff --git a/drivers/gpu/drm/hisilicon/hibmc/Makefile b/drivers/gpu/drm/hisilicon/hibmc/Makefile
>> index 8770ec6dfffd..94d77da88bbf 100644
>> --- a/drivers/gpu/drm/hisilicon/hibmc/Makefile
>> +++ b/drivers/gpu/drm/hisilicon/hibmc/Makefile
>> @@ -1,5 +1,5 @@
>>   # SPDX-License-Identifier: GPL-2.0-only
>>   hibmc-drm-y := hibmc_drm_drv.o hibmc_drm_de.o hibmc_drm_vdac.o hibmc_drm_i2c.o \
>> -	       dp/dp_aux.o
>> +	       dp/dp_aux.o dp/dp_link.o
>>   
>>   obj-$(CONFIG_DRM_HISI_HIBMC) += hibmc-drm.o
>> diff --git a/drivers/gpu/drm/hisilicon/hibmc/dp/dp_comm.h b/drivers/gpu/drm/hisilicon/hibmc/dp/dp_comm.h
>> index 7d3cd32393c0..8422999acbf0 100644
>> --- a/drivers/gpu/drm/hisilicon/hibmc/dp/dp_comm.h
>> +++ b/drivers/gpu/drm/hisilicon/hibmc/dp/dp_comm.h
>> @@ -13,11 +13,34 @@
>>   #include <linux/io.h>
>>   #include <drm/display/drm_dp_helper.h>
>>   
>> +#define HIBMC_DP_LANE_NUM_MAX 2
>> +
>> +struct hibmc_link_status {
>> +	bool clock_recovered;
>> +	bool channel_equalized;
>> +};
>> +
>> +struct hibmc_link_cap {
>> +	int rx_dpcd_revision;
>> +	u8 link_rate;
>> +	u8 lanes;
>> +	bool is_tps3;
>> +	bool is_tps4;
> These two fields are set neither in this patch nor in any of the
> following patches.

Hi Dmitry,
Thanks for your carefully and patiently reviewing. These two will be assigned when edid is acquired,
so I accept and delete them in this patch, and I will add them in next series.

Sincerely，
Baihan Li


>> +};
>> +
> [...]
>
>> +static int hibmc_dp_link_training_configure(struct hibmc_dp_dev *dp)
>> +{
>> +	u8 buf[2];
>> +	int ret;
>> +
>> +	/* DP 2 lane */
>> +	hibmc_dp_reg_write_field(dp, HIBMC_DP_PHYIF_CTRL0, HIBMC_DP_CFG_LANE_DATA_EN,
>> +				 dp->link.cap.lanes == 0x2 ? 0x3 : 0x1);
>> +	hibmc_dp_reg_write_field(dp, HIBMC_DP_DPTX_GCTL0, HIBMC_DP_CFG_PHY_LANE_NUM,
>> +				 dp->link.cap.lanes == 0x2 ? 0x1 : 0);
>> +
>> +	/* enhanced frame */
>> +	hibmc_dp_reg_write_field(dp, HIBMC_DP_VIDEO_CTRL, HIBMC_DP_CFG_STREAM_FRAME_MODE, 0x1);
>> +
>> +	/* set rate and lane count */
>> +	buf[0] = dp->link.cap.link_rate;
>> +	buf[1] = DP_LANE_COUNT_ENHANCED_FRAME_EN | dp->link.cap.lanes;
>> +	ret = drm_dp_dpcd_write(&dp->aux, DP_LINK_BW_SET, buf, sizeof(buf));
>> +	if (ret != sizeof(buf)) {
>> +		drm_dbg_dp(dp->dev, "dp aux write link rate and lanes failed, ret: %d\n", ret);
>> +		return ret >= 0 ? -EIO : ret;
>> +	}
>> +
>> +	/* set 8b/10b and downspread */
>> +	buf[0] = 0x10;
> DP_SPREAD_AMP_0_5
>
>> +	buf[1] = 0x1;
> DP_SET_ANSI_8B10B
>
>> +	ret = drm_dp_dpcd_write(&dp->aux, DP_DOWNSPREAD_CTRL, buf, sizeof(buf));
>> +	if (ret != sizeof(buf)) {
>> +		drm_dbg_dp(dp->dev, "dp aux write 8b/10b and downspread failed, ret: %d\n", ret);
>> +		return ret >= 0 ? -EIO : ret;
>> +	}
>> +
>> +	ret = drm_dp_read_dpcd_caps(&dp->aux, dp->dpcd);
>> +	if (ret)
>> +		drm_err(dp->dev, "dp aux read dpcd failed, ret: %d\n", ret);
>> +
>> +	return ret;
>> +}
>> +
