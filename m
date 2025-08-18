Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 052E6B29B02
	for <lists+dri-devel@lfdr.de>; Mon, 18 Aug 2025 09:44:29 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 6B93C10E1C3;
	Mon, 18 Aug 2025 07:44:27 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from szxga06-in.huawei.com (szxga06-in.huawei.com [45.249.212.32])
 by gabe.freedesktop.org (Postfix) with ESMTPS id C312910E1C3
 for <dri-devel@lists.freedesktop.org>; Mon, 18 Aug 2025 07:44:25 +0000 (UTC)
Received: from mail.maildlp.com (unknown [172.19.163.44])
 by szxga06-in.huawei.com (SkyGuard) with ESMTP id 4c54WX0spjz3TqYW;
 Mon, 18 Aug 2025 15:45:28 +0800 (CST)
Received: from dggemv712-chm.china.huawei.com (unknown [10.1.198.32])
 by mail.maildlp.com (Postfix) with ESMTPS id 2E67F1402CC;
 Mon, 18 Aug 2025 15:44:23 +0800 (CST)
Received: from kwepemq100007.china.huawei.com (7.202.195.175) by
 dggemv712-chm.china.huawei.com (10.1.198.32) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.1544.11; Mon, 18 Aug 2025 15:44:22 +0800
Received: from [10.159.166.136] (10.159.166.136) by
 kwepemq100007.china.huawei.com (7.202.195.175) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.1544.11; Mon, 18 Aug 2025 15:44:22 +0800
Message-ID: <048a04e8-2589-48c4-9754-5217adb5f385@huawei.com>
Date: Mon, 18 Aug 2025 15:44:21 +0800
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v4 drm-dp 08/11] drm/hisilicon/hibmc: fix no showing when
 no connectors connected
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
 <20250813094238.3722345-9-shiyongbang@huawei.com>
 <slyapb5axqt5kw2l3da6k2iwkrqllame5bqz6hzjsqgi5j6lnh@obhd3xluk4te>
From: Yongbang Shi <shiyongbang@huawei.com>
In-Reply-To: <slyapb5axqt5kw2l3da6k2iwkrqllame5bqz6hzjsqgi5j6lnh@obhd3xluk4te>
Content-Type: text/plain; charset="UTF-8"; format=flowed
Content-Transfer-Encoding: 7bit
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


> On Wed, Aug 13, 2025 at 05:42:35PM +0800, Yongbang Shi wrote:
>> From: Baihan Li <libaihan@huawei.com>
>>
>> Our chip support KVM over IP feature, so hibmc driver need to support
>> displaying without any connectors plugged in. If no connectors connected,
>> set the vdac connector status to 'connected' to handle BMC KVM. Use
>> is_connected to check all physical outputs.
>> For get_modes: using BMC modes for connector if no display is attached to
>> phys VGA cable, otherwise use EDID modes by drm_connector_helper_get_modes,
>> because KVM doesn't provide EDID reads.
>>
>> Fixes: 4c962bc929f1 ("drm/hisilicon/hibmc: Add vga connector detect functions")
> It feels like being too big for a fix...

Okay, how about I move this change to next series as a KVM feature?


>> Signed-off-by: Baihan Li <libaihan@huawei.com>
>> Signed-off-by: Yongbang Shi <shiyongbang@huawei.com>
>> ---
>> ChangeLog:
>> v3 -> v4:
>>    - add KVM edid in commit message, suggested by Dmitry Baryshkov.
>>    - fix magic values, suggested by Dmitry Baryshkov.
>> v2 -> v3:
>>    - fix hibmc_connector_get_modes() and hibmc_vdac_detect() to realize BMC KVM, suggested by Dmitry Baryshkov.
>> ---
>>   .../gpu/drm/hisilicon/hibmc/hibmc_drm_dp.c    | 20 ++++--
>>   .../gpu/drm/hisilicon/hibmc/hibmc_drm_drv.c   |  2 +
>>   .../gpu/drm/hisilicon/hibmc/hibmc_drm_drv.h   |  7 +++
>>   .../gpu/drm/hisilicon/hibmc/hibmc_drm_vdac.c  | 62 +++++++++++++------
>>   4 files changed, 68 insertions(+), 23 deletions(-)
>>
>> diff --git a/drivers/gpu/drm/hisilicon/hibmc/hibmc_drm_dp.c b/drivers/gpu/drm/hisilicon/hibmc/hibmc_drm_dp.c
>> index 5cac04b7d4a4..9626c60a9115 100644
>> --- a/drivers/gpu/drm/hisilicon/hibmc/hibmc_drm_dp.c
>> +++ b/drivers/gpu/drm/hisilicon/hibmc/hibmc_drm_dp.c
>> @@ -35,12 +35,22 @@ static int hibmc_dp_connector_get_modes(struct drm_connector *connector)
>>   static int hibmc_dp_detect(struct drm_connector *connector,
>>   			   struct drm_modeset_acquire_ctx *ctx, bool force)
>>   {
>> -	struct hibmc_dp *dp = to_hibmc_dp(connector);
>> +	struct hibmc_drm_private *priv = to_hibmc_drm_private(connector->dev);
>> +	int ret;
>> +
>> +	mutex_lock(&priv->connect_lock);
>> +
>> +	if (priv->dp.hpd_status) {
>> +		priv->connect_status_map |= HIBMC_DP_STATUS;
>> +		ret = connector_status_connected;
>> +	} else {
>> +		priv->connect_status_map &= ~HIBMC_DP_STATUS;
>> +		ret = connector_status_disconnected;
>> +	}
>>   
>> -	if (dp->hpd_status)
>> -		return connector_status_connected;
>> -	else
>> -		return connector_status_disconnected;
>> +	mutex_unlock(&priv->connect_lock);
>> +
>> +	return ret;
>>   }
>>   
>>   static int hibmc_dp_mode_valid(struct drm_connector *connector,
>> diff --git a/drivers/gpu/drm/hisilicon/hibmc/hibmc_drm_drv.c b/drivers/gpu/drm/hisilicon/hibmc/hibmc_drm_drv.c
>> index 289304500ab0..bdf14ad52cd3 100644
>> --- a/drivers/gpu/drm/hisilicon/hibmc/hibmc_drm_drv.c
>> +++ b/drivers/gpu/drm/hisilicon/hibmc/hibmc_drm_drv.c
>> @@ -162,6 +162,8 @@ static int hibmc_kms_init(struct hibmc_drm_private *priv)
>>   	drm_for_each_encoder(encoder, dev)
>>   		encoder->possible_clones = clone_mask;
>>   
>> +	mutex_init(&priv->connect_lock);
>> +
>>   	return 0;
>>   }
>>   
>> diff --git a/drivers/gpu/drm/hisilicon/hibmc/hibmc_drm_drv.h b/drivers/gpu/drm/hisilicon/hibmc/hibmc_drm_drv.h
>> index ca8502e2760c..4eee33fbc1f4 100644
>> --- a/drivers/gpu/drm/hisilicon/hibmc/hibmc_drm_drv.h
>> +++ b/drivers/gpu/drm/hisilicon/hibmc/hibmc_drm_drv.h
>> @@ -24,6 +24,8 @@
>>   
>>   #define HIBMC_MIN_VECTORS	1
>>   #define HIBMC_MAX_VECTORS	2
>> +#define HIBMC_DP_STATUS		BIT(0)
>> +#define HIBMC_VGA_STATUS	BIT(1)
>>   
>>   struct hibmc_vdac {
>>   	struct drm_device *dev;
>> @@ -31,6 +33,7 @@ struct hibmc_vdac {
>>   	struct drm_connector connector;
>>   	struct i2c_adapter adapter;
>>   	struct i2c_algo_bit_data bit_data;
>> +	int phys_status;
>>   };
>>   
>>   struct hibmc_drm_private {
>> @@ -43,6 +46,10 @@ struct hibmc_drm_private {
>>   	struct drm_crtc crtc;
>>   	struct hibmc_vdac vdac;
>>   	struct hibmc_dp dp;
>> +
>> +	/* VGA and DP phys connect status, BIT(0) is DP, BIT(1) is VGA */
>> +	u32 connect_status_map;
>> +	struct mutex connect_lock; /* protect connect_status_map value */
>>   };
>>   
>>   static inline struct hibmc_vdac *to_hibmc_vdac(struct drm_connector *connector)
>> diff --git a/drivers/gpu/drm/hisilicon/hibmc/hibmc_drm_vdac.c b/drivers/gpu/drm/hisilicon/hibmc/hibmc_drm_vdac.c
>> index 841e81f47b68..922c0810723d 100644
>> --- a/drivers/gpu/drm/hisilicon/hibmc/hibmc_drm_vdac.c
>> +++ b/drivers/gpu/drm/hisilicon/hibmc/hibmc_drm_vdac.c
>> @@ -25,27 +25,18 @@
>>   static int hibmc_connector_get_modes(struct drm_connector *connector)
>>   {
>>   	struct hibmc_vdac *vdac = to_hibmc_vdac(connector);
>> -	const struct drm_edid *drm_edid;
>>   	int count;
>>   
>> -	drm_edid = drm_edid_read_ddc(connector, &vdac->adapter);
>> -
>> -	drm_edid_connector_update(connector, drm_edid);
>> -
>> -	if (drm_edid) {
>> -		count = drm_edid_connector_add_modes(connector);
>> -		if (count)
> Here you are refactoring to use drm_edid_connector_add_modes() and
> fixing the connector issue. Please don't mix those together.

Alright! I will separate them later.


>> -			goto out;
>> +	if (vdac->phys_status == connector_status_connected) {
>> +		count = drm_connector_helper_get_modes(connector);
>> +	} else {
>> +		drm_edid_connector_update(connector, NULL);
>> +		count = drm_add_modes_noedid(connector,
>> +					     connector->dev->mode_config.max_width,
>> +					     connector->dev->mode_config.max_height);
>> +		drm_set_preferred_mode(connector, 1024, 768);
>>   	}
>>   
>> -	count = drm_add_modes_noedid(connector,
>> -				     connector->dev->mode_config.max_width,
>> -				     connector->dev->mode_config.max_height);
>> -	drm_set_preferred_mode(connector, 1024, 768);
>> -
>> -out:
>> -	drm_edid_free(drm_edid);
>> -
>>   	return count;
>>   }
>>   
>> @@ -57,10 +48,45 @@ static void hibmc_connector_destroy(struct drm_connector *connector)
>>   	drm_connector_cleanup(connector);
>>   }
>>   
>> +static int hibmc_vdac_detect(struct drm_connector *connector,
>> +			     struct drm_modeset_acquire_ctx *ctx,
>> +			     bool force)
>> +{
>> +	struct hibmc_drm_private *priv = to_hibmc_drm_private(connector->dev);
>> +	struct hibmc_vdac *vdac = to_hibmc_vdac(connector);
>> +	int ret = connector_status_disconnected;
>> +	int status;
>> +
>> +	status = drm_connector_helper_detect_from_ddc(connector, ctx, force);
>> +
>> +	vdac->phys_status = status;
>> +
>> +	mutex_lock(&priv->connect_lock);
>> +
>> +	if (status == connector_status_connected) {
>> +		priv->connect_status_map |= HIBMC_VGA_STATUS;
>> +		ret = connector_status_connected;
>> +		goto exit;
>> +	}
>> +
>> +	priv->connect_status_map &= ~HIBMC_VGA_STATUS;
>> +
>> +	/* if all connectors are disconnected,
>> +	 * return connected to support BMC KVM display.
>> +	 */
>> +	if (!priv->connect_status_map)
>> +		ret = connector_status_connected;
>> +
>> +exit:
>> +	mutex_unlock(&priv->connect_lock);
>> +
>> +	return ret;
>> +}
>> +
>>   static const struct drm_connector_helper_funcs
>>   	hibmc_connector_helper_funcs = {
>>   	.get_modes = hibmc_connector_get_modes,
>> -	.detect_ctx = drm_connector_helper_detect_from_ddc,
>> +	.detect_ctx = hibmc_vdac_detect,
>>   };
>>   
>>   static const struct drm_connector_funcs hibmc_connector_funcs = {
>> -- 
>> 2.33.0
>>
