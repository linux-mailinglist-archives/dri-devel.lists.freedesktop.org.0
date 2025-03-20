Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 83D5FA69F2B
	for <lists+dri-devel@lfdr.de>; Thu, 20 Mar 2025 06:13:42 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id CFBC610E388;
	Thu, 20 Mar 2025 05:13:40 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from szxga08-in.huawei.com (szxga08-in.huawei.com [45.249.212.255])
 by gabe.freedesktop.org (Postfix) with ESMTPS id EBFCB10E388
 for <dri-devel@lists.freedesktop.org>; Thu, 20 Mar 2025 05:13:38 +0000 (UTC)
Received: from mail.maildlp.com (unknown [172.19.163.252])
 by szxga08-in.huawei.com (SkyGuard) with ESMTP id 4ZJDHf33pXz1d0bX;
 Thu, 20 Mar 2025 13:13:18 +0800 (CST)
Received: from kwepemd500013.china.huawei.com (unknown [7.221.188.12])
 by mail.maildlp.com (Postfix) with ESMTPS id 018A41800EC;
 Thu, 20 Mar 2025 13:13:33 +0800 (CST)
Received: from [10.159.166.136] (10.159.166.136) by
 kwepemd500013.china.huawei.com (7.221.188.12) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.1748.10; Thu, 20 Mar 2025 13:13:31 +0800
Message-ID: <f619aa56-d41b-4142-8274-51cc3704baf0@huawei.com>
Date: Thu, 20 Mar 2025 13:13:28 +0800
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v6 drm-dp 5/9] drm/hisilicon/hibmc: Getting connector info
 and EDID by using AUX channel
To: Jani Nikula <jani.nikula@linux.intel.com>, <xinliang.liu@linaro.org>,
 <tiantao6@hisilicon.com>, <maarten.lankhorst@linux.intel.com>,
 <mripard@kernel.org>, <tzimmermann@suse.de>, <airlied@gmail.com>,
 <daniel@ffwll.ch>, <kong.kongxinwei@hisilicon.com>
CC: <liangjian010@huawei.com>, <chenjianmin@huawei.com>,
 <lidongming5@huawei.com>, <libaihan@huawei.com>, <shenjian15@huawei.com>,
 <shaojijie@huawei.com>, <dri-devel@lists.freedesktop.org>,
 <linux-kernel@vger.kernel.org>, <shiyongbang@huawei.com>
References: <20250310040138.2025715-1-shiyongbang@huawei.com>
 <20250310040138.2025715-6-shiyongbang@huawei.com> <87o6xyd5nn.fsf@intel.com>
From: Yongbang Shi <shiyongbang@huawei.com>
In-Reply-To: <87o6xyd5nn.fsf@intel.com>
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


> On Mon, 10 Mar 2025, Yongbang Shi <shiyongbang@huawei.com> wrote:
>> @@ -15,11 +15,17 @@
>>   
>>   static int hibmc_dp_connector_get_modes(struct drm_connector *connector)
>>   {
>> +	struct hibmc_dp *dp = to_hibmc_dp(connector);
>> +	const struct drm_edid *drm_edid;
>>   	int count;
>>   
>> -	count = drm_add_modes_noedid(connector, connector->dev->mode_config.max_width,
>> -				     connector->dev->mode_config.max_height);
>> -	drm_set_preferred_mode(connector, 1024, 768); // temporary implementation
>> +	drm_edid = drm_edid_read_ddc(connector, &dp->aux.ddc);
> drm_edid_read() should cover this if connector->ddc is set properly...

Thanks, I got it. I will change it to drm_edid_read() in next patch. I misunderstood what you meant before.


>> @@ -103,8 +125,8 @@ int hibmc_dp_init(struct hibmc_drm_private *priv)
>>   
>>   	drm_encoder_helper_add(encoder, &hibmc_dp_encoder_helper_funcs);
>>   
>> -	ret = drm_connector_init(dev, connector, &hibmc_dp_conn_funcs,
>> -				 DRM_MODE_CONNECTOR_DisplayPort);
>> +	ret = drm_connector_init_with_ddc(dev, connector, &hibmc_dp_conn_funcs,
>> +					  DRM_MODE_CONNECTOR_DisplayPort, &dp->aux.ddc);
> ...which you seem to do here.
>
> BR,
> Jani.
>
>
