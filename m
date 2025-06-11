Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 1AA06AD5614
	for <lists+dri-devel@lfdr.de>; Wed, 11 Jun 2025 14:55:02 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 3C13D10E37A;
	Wed, 11 Jun 2025 12:55:00 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from szxga02-in.huawei.com (szxga02-in.huawei.com [45.249.212.188])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 1AA4C10E37A
 for <dri-devel@lists.freedesktop.org>; Wed, 11 Jun 2025 12:54:58 +0000 (UTC)
Received: from mail.maildlp.com (unknown [172.19.163.252])
 by szxga02-in.huawei.com (SkyGuard) with ESMTP id 4bHQW662QszRk36;
 Wed, 11 Jun 2025 20:50:42 +0800 (CST)
Received: from dggemv706-chm.china.huawei.com (unknown [10.3.19.33])
 by mail.maildlp.com (Postfix) with ESMTPS id 24A2A180B64;
 Wed, 11 Jun 2025 20:54:56 +0800 (CST)
Received: from kwepemq100007.china.huawei.com (7.202.195.175) by
 dggemv706-chm.china.huawei.com (10.3.19.33) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.1544.11; Wed, 11 Jun 2025 20:54:55 +0800
Received: from [10.159.166.136] (10.159.166.136) by
 kwepemq100007.china.huawei.com (7.202.195.175) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.1544.11; Wed, 11 Jun 2025 20:54:55 +0800
Message-ID: <1de56e48-2104-4181-8b94-20c97001a81c@huawei.com>
Date: Wed, 11 Jun 2025 20:54:53 +0800
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH drm-dp 09/10] drm/hisilicon/hibmc: fix HPD no showing with
 VGA para of GRUB
To: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
CC: <xinliang.liu@linaro.org>, <tiantao6@hisilicon.com>,
 <maarten.lankhorst@linux.intel.com>, <mripard@kernel.org>,
 <tzimmermann@suse.de>, <airlied@gmail.com>, <daniel@ffwll.ch>,
 <kong.kongxinwei@hisilicon.com>, <liangjian010@huawei.com>,
 <chenjianmin@huawei.com>, <lidongming5@huawei.com>, <libaihan@huawei.com>,
 <shenjian15@huawei.com>, <shaojijie@huawei.com>,
 <jani.nikula@linux.intel.com>, <dri-devel@lists.freedesktop.org>,
 <linux-kernel@vger.kernel.org>, <shiyongbang@huawei.com>
References: <20250530095432.1206966-1-shiyongbang@huawei.com>
 <20250530095432.1206966-10-shiyongbang@huawei.com>
 <5nansqkys4d3wlsefql6itgnpdoxhgjo7kkmovpm3gfbphxcs6@4anxx7hzoimh>
From: Yongbang Shi <shiyongbang@huawei.com>
In-Reply-To: <5nansqkys4d3wlsefql6itgnpdoxhgjo7kkmovpm3gfbphxcs6@4anxx7hzoimh>
Content-Type: text/plain; charset="UTF-8"; format=flowed
Content-Transfer-Encoding: 8bit
X-Originating-IP: [10.159.166.136]
X-ClientProxiedBy: kwepems100002.china.huawei.com (7.221.188.206) To
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


> On Fri, May 30, 2025 at 05:54:31PM +0800, Yongbang Shi wrote:
>> From: Baihan Li <libaihan@huawei.com>
>>
>> In early OS versions， there is a bug in hibmc-drm driver previously,
> Which OS? What does that mean? Why do we need to workaround userspace
> issues in the kernel?

We use OpenEuler 22.03, there is a VGA cfg(video=VGA-1:640x480-32@60me) in GRUB args.
If it exists, it will affect DP HPD.


>> so some OS add a VGA parameter in GRUB(video=VGA-1:640x480-32@60me) to
>> fix the bug, that will config a force VGA mode to drm driver. However, the
>> HPD problem exists that mentioned in previous patch, so change VGA's status
>> in force() to compatible with some older OS versions.
>>
>> Fixes: f9698f802e50 ("drm/hisilicon/hibmc: Restructuring the header dp_reg.h")
>> Signed-off-by: Baihan Li <libaihan@huawei.com>
>> ---
>>   drivers/gpu/drm/hisilicon/hibmc/hibmc_drm_vdac.c | 14 ++++++++++++++
>>   1 file changed, 14 insertions(+)
>>
>> diff --git a/drivers/gpu/drm/hisilicon/hibmc/hibmc_drm_vdac.c b/drivers/gpu/drm/hisilicon/hibmc/hibmc_drm_vdac.c
>> index 73dd3d5fc26c..d609ccda2f2a 100644
>> --- a/drivers/gpu/drm/hisilicon/hibmc/hibmc_drm_vdac.c
>> +++ b/drivers/gpu/drm/hisilicon/hibmc/hibmc_drm_vdac.c
>> @@ -61,6 +61,19 @@ static int hibmc_vdac_detect(struct drm_connector *connector, struct drm_modeset
>>   	return connector_status_connected;
>>   }
>>   
>> +static void hibmc_vdac_force(struct drm_connector *connector)
>> +{
>> +	struct hibmc_drm_private *priv = to_hibmc_drm_private(connector->dev);
>> +	struct hibmc_dp *dp = &priv->dp;
>> +
>> +	if (dp->hpd_status) {
>> +		connector->status = connector_status_disconnected;
>> +		return;
>> +	}
>> +
>> +	connector->status = connector_status_connected;
> You are again trying to tie VGA and DP status, so NAK.
>
>> +}
>> +
>>   static void hibmc_connector_destroy(struct drm_connector *connector)
>>   {
>>   	struct hibmc_vdac *vdac = to_hibmc_vdac(connector);
>> @@ -81,6 +94,7 @@ static const struct drm_connector_funcs hibmc_connector_funcs = {
>>   	.reset = drm_atomic_helper_connector_reset,
>>   	.atomic_duplicate_state = drm_atomic_helper_connector_duplicate_state,
>>   	.atomic_destroy_state = drm_atomic_helper_connector_destroy_state,
>> +	.force = hibmc_vdac_force,
>>   };
>>   
>>   static void hibmc_encoder_mode_set(struct drm_encoder *encoder,
>> -- 
>> 2.33.0
>>
