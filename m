Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 3736B603A37
	for <lists+dri-devel@lfdr.de>; Wed, 19 Oct 2022 08:58:19 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id D15F310E42D;
	Wed, 19 Oct 2022 06:58:06 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from szxga01-in.huawei.com (szxga01-in.huawei.com [45.249.212.187])
 by gabe.freedesktop.org (Postfix) with ESMTPS id A101B10E42D;
 Wed, 19 Oct 2022 06:58:03 +0000 (UTC)
Received: from dggpemm500020.china.huawei.com (unknown [172.30.72.56])
 by szxga01-in.huawei.com (SkyGuard) with ESMTP id 4MshJY2qFvzmVFP;
 Wed, 19 Oct 2022 14:53:17 +0800 (CST)
Received: from dggpemm500007.china.huawei.com (7.185.36.183) by
 dggpemm500020.china.huawei.com (7.185.36.49) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2375.31; Wed, 19 Oct 2022 14:57:54 +0800
Received: from [10.174.178.174] (10.174.178.174) by
 dggpemm500007.china.huawei.com (7.185.36.183) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2375.31; Wed, 19 Oct 2022 14:57:54 +0800
Subject: Re: [PATCH] drm/amdgpu/discovery: fix possible memory leak
To: Luben Tuikov <luben.tuikov@amd.com>, <dri-devel@lists.freedesktop.org>,
 <amd-gfx@lists.freedesktop.org>
References: <20221018080557.765786-1-yangyingliang@huawei.com>
 <a14b4921-2cc2-3812-5514-e6573388451c@amd.com>
From: Yang Yingliang <yangyingliang@huawei.com>
Message-ID: <0b60149b-3d5b-9bc6-5951-590ed8a8bf7e@huawei.com>
Date: Wed, 19 Oct 2022 14:57:53 +0800
User-Agent: Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:68.0) Gecko/20100101
 Thunderbird/68.7.0
MIME-Version: 1.0
In-Reply-To: <a14b4921-2cc2-3812-5514-e6573388451c@amd.com>
Content-Type: text/plain; charset="utf-8"; format=flowed
Content-Transfer-Encoding: 7bit
Content-Language: en-US
X-Originating-IP: [10.174.178.174]
X-ClientProxiedBy: dggems701-chm.china.huawei.com (10.3.19.178) To
 dggpemm500007.china.huawei.com (7.185.36.183)
X-CFilter-Loop: Reflected
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
Cc: alexander.deucher@amd.com, yangyingliang@huawei.com
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

Hi,

On 2022/10/19 11:37, Luben Tuikov wrote:
> On 2022-10-18 04:05, Yang Yingliang wrote:
>> If kset_register() fails, the refcount of device is not 0, the name allocated
>> in dev_set_name() is leaked. Fix this by calling kset_put(), so that it will
>> be freed in callback function kobject_cleanup().
>>
> Good catch, but looking at the code it seems that what is being
> leaked is the memory pointed to by kset.kobj.name which is allocated
> in kobject_set_name(&kset.kobj, ...), which is called right
> before the call to kset_register().

Ah, I forgot to use format-patch to generate new patch after updating commit

message in my local tree and sent a old one. Thanks for point out.
>
> Modify the description with this explanation and repost the patch and I'll R-B it then.
> Something like:
>
>> If kset_register() fails, the refcount of the device is not 0, and the name allocated
>> in kobject_set_name(&kset.kobj, ...) is leaked. Fix this by calling kset_put(),
>> so that kset.kobj.name is freed in the callback function kobject_cleanup().
> Now, if there's a leak of dev_set_name(), then that would be something
> else/another patch.
>
> The rest below looks good.
>
> Since this patch touches only files under drm/amd/amdgpu/ and for a highly AMD-specific
> feature, you didn't need to spam the dri-dev ML--amdgfx ML should be plenty enough.
OK.

Thanks,
Yang
>
> Regards,
> Luben
>
>> Fixes: a6c40b178092 ("drm/amdgpu: Show IP discovery in sysfs")
>> Signed-off-by: Yang Yingliang <yangyingliang@huawei.com>
>> ---
>>   drivers/gpu/drm/amd/amdgpu/amdgpu_discovery.c | 5 +++--
>>   1 file changed, 3 insertions(+), 2 deletions(-)
>>
>> diff --git a/drivers/gpu/drm/amd/amdgpu/amdgpu_discovery.c b/drivers/gpu/drm/amd/amdgpu/amdgpu_discovery.c
>> index 3993e6134914..638edcf70227 100644
>> --- a/drivers/gpu/drm/amd/amdgpu/amdgpu_discovery.c
>> +++ b/drivers/gpu/drm/amd/amdgpu/amdgpu_discovery.c
>> @@ -863,7 +863,7 @@ static int amdgpu_discovery_sysfs_ips(struct amdgpu_device *adev,
>>   				res = kset_register(&ip_hw_id->hw_id_kset);
>>   				if (res) {
>>   					DRM_ERROR("Couldn't register ip_hw_id kset");
>> -					kfree(ip_hw_id);
>> +					kset_put(&ip_hw_id->hw_id_kset);
>>   					return res;
>>   				}
>>   				if (hw_id_names[ii]) {
>> @@ -954,7 +954,7 @@ static int amdgpu_discovery_sysfs_recurse(struct amdgpu_device *adev)
>>   		res = kset_register(&ip_die_entry->ip_kset);
>>   		if (res) {
>>   			DRM_ERROR("Couldn't register ip_die_entry kset");
>> -			kfree(ip_die_entry);
>> +			kset_put(&ip_die_entry->ip_kset);
>>   			return res;
>>   		}
>>   
>> @@ -989,6 +989,7 @@ static int amdgpu_discovery_sysfs_init(struct amdgpu_device *adev)
>>   	res = kset_register(&adev->ip_top->die_kset);
>>   	if (res) {
>>   		DRM_ERROR("Couldn't register die_kset");
>> +		kset_put(&adev->ip_top->die_kset);
>>   		goto Err;
>>   	}
>>   
> .
