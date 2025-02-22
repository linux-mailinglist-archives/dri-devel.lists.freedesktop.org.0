Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 7A90DA40775
	for <lists+dri-devel@lfdr.de>; Sat, 22 Feb 2025 11:35:56 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id A4FF110E310;
	Sat, 22 Feb 2025 10:35:54 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from szxga05-in.huawei.com (szxga05-in.huawei.com [45.249.212.191])
 by gabe.freedesktop.org (Postfix) with ESMTPS id A412B10E310
 for <dri-devel@lists.freedesktop.org>; Sat, 22 Feb 2025 10:35:53 +0000 (UTC)
Received: from mail.maildlp.com (unknown [172.19.88.234])
 by szxga05-in.huawei.com (SkyGuard) with ESMTP id 4Z0NbD4fspz1ltY8;
 Sat, 22 Feb 2025 18:31:52 +0800 (CST)
Received: from kwepemd500013.china.huawei.com (unknown [7.221.188.12])
 by mail.maildlp.com (Postfix) with ESMTPS id 132A6140155;
 Sat, 22 Feb 2025 18:35:51 +0800 (CST)
Received: from [10.159.166.136] (10.159.166.136) by
 kwepemd500013.china.huawei.com (7.221.188.12) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.1258.34; Sat, 22 Feb 2025 18:35:49 +0800
Message-ID: <eef68fc7-30f4-4246-a82e-4f90cd6a665d@huawei.com>
Date: Sat, 22 Feb 2025 18:35:48 +0800
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v3 drm-dp 7/8] drm/hisilicon/hibmc: Enable this hot plug
 detect of irq feature
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
 <20250222025102.1519798-8-shiyongbang@huawei.com>
 <reqpxlbvlz5qssgy6gbjuou33h4zevo4xeztqbsr4keehplyhx@utv22a5ihohx>
From: Yongbang Shi <shiyongbang@huawei.com>
In-Reply-To: <reqpxlbvlz5qssgy6gbjuou33h4zevo4xeztqbsr4keehplyhx@utv22a5ihohx>
Content-Type: text/plain; charset="UTF-8"; format=flowed
Content-Transfer-Encoding: 7bit
X-Originating-IP: [10.159.166.136]
X-ClientProxiedBy: dggems703-chm.china.huawei.com (10.3.19.180) To
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

>> +static int hibmc_dp_hpd_event(struct drm_client_dev *client)
>> +{
>> +	struct hibmc_dp *dp = container_of(client, struct hibmc_dp, client);
>> +	struct hibmc_drm_private *priv = to_hibmc_drm_private(dp->drm_dev);
>> +	struct drm_display_mode *mode = &priv->crtc.state->adjusted_mode;
>> +	int ret;
>> +
>> +	if (dp->hpd_status) {
>> +		hibmc_dp_hpd_cfg(&priv->dp);
>> +		ret = hibmc_dp_prepare(dp, mode);
>> +		if (ret)
>> +			return ret;
>> +
>> +		hibmc_dp_display_en(dp, true);
>> +	} else {
>> +		hibmc_dp_display_en(dp, false);
>> +		hibmc_dp_reset_link(&priv->dp);
>> +	}
> If I understand this correctly, you are using a separate drm_client to
> enable and disable the link & display. Why is it necessary? Existing
> drm_clients and userspace compositors use drm framework, they should be
> able to turn the display on and off as required.
>
Thanks for your asking, there are cfg/reset process when the connector 's pluging in/out.
We want to cfg DP registers again when the connector changes. Not only dp link training, but also cfg
the different video modes into DP registers.


>> +
>> +	return 0;
>> +}
>> +
>> +static const struct drm_client_funcs hibmc_dp_client_funcs = {
>> +	.hotplug = hibmc_dp_hpd_event,
>> +	.unregister = drm_client_release,
>> +};
>> +
>>   int hibmc_dp_init(struct hibmc_drm_private *priv)
>>   {
>>   	struct drm_device *dev = &priv->dev;
>> @@ -138,5 +193,11 @@ int hibmc_dp_init(struct hibmc_drm_private *priv)
>>   
>>   	drm_connector_attach_encoder(connector, encoder);
>>   
>> +	ret = drm_client_init(dev, &dp->client, "hibmc-DP-HPD", &hibmc_dp_client_funcs);
>> +	if (ret)
>> +		return ret;
>> +
>> +	drm_client_register(&dp->client);
>> +
>>   	return 0;
>>   }
>> diff --git a/drivers/gpu/drm/hisilicon/hibmc/hibmc_drm_drv.h b/drivers/gpu/drm/hisilicon/hibmc/hibmc_drm_drv.h
>> index bc89e4b9f4e3..daed1330b961 100644
>> --- a/drivers/gpu/drm/hisilicon/hibmc/hibmc_drm_drv.h
>> +++ b/drivers/gpu/drm/hisilicon/hibmc/hibmc_drm_drv.h
>> @@ -71,4 +71,6 @@ int hibmc_dp_init(struct hibmc_drm_private *priv);
>>   
>>   void hibmc_debugfs_init(struct drm_connector *connector, struct dentry *root);
>>   
>> +irqreturn_t hibmc_dp_hpd_isr(int irq, void *arg);
>> +
>>   #endif
>> -- 
>> 2.33.0
>>
