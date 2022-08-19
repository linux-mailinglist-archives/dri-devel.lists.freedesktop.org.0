Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 9C432599378
	for <lists+dri-devel@lfdr.de>; Fri, 19 Aug 2022 05:34:37 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 0EFF310E3BA;
	Fri, 19 Aug 2022 03:34:31 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
X-Greylist: delayed 911 seconds by postgrey-1.36 at gabe;
 Fri, 19 Aug 2022 03:34:17 UTC
Received: from m12-14.163.com (m12-14.163.com [220.181.12.14])
 by gabe.freedesktop.org (Postfix) with ESMTP id 292AC10E30E
 for <dri-devel@lists.freedesktop.org>; Fri, 19 Aug 2022 03:34:16 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=163.com;
 s=s110527; h=Message-ID:Date:MIME-Version:Subject:From; bh=ew+Ne
 YMoBADJpb80VnNrRr5jAttukcVCK3ls3Sm05J0=; b=kqmsSnjFuiK8LnrWxMAXC
 ta3zXKHLLWlC7ZX/nMkxpTFXJ2HK592L70vNs2pgb6ISIrcuyq/wYx9s49TOa5He
 PhIT29wxq1YK+pphf0bOCLksHRBKuYhXqd+I3FKObamvijd7NyJIYvEKXnPO2+4o
 0AkV02FHkrhwP7anCD0GJs=
Received: from [172.20.4.109] (unknown [1.203.159.130])
 by smtp10 (Coremail) with SMTP id DsCowADX+qEbAf9iOi9OCQ--.7290S2;
 Fri, 19 Aug 2022 11:18:51 +0800 (CST)
Message-ID: <ac6c3b76-a3bd-2e80-9dbb-ecb9f43aa041@163.com>
Date: Fri, 19 Aug 2022 11:18:50 +0800
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:91.0) Gecko/20100101
 Thunderbird/91.12.0
Subject: Re: [PATCH v1 1/1] kfd: fixed memleak about release topology
To: Felix Kuehling <felix.kuehling@amd.com>, dri-devel@lists.freedesktop.org, 
 Daniel Vetter <daniel@ffwll.ch>, David Airlie <airlied@linux.ie>,
 Xinhui.Pan@amd.com, alexander.deucher@amd.com, christian.koenig@amd.com
References: <20220715080721.1477324-1-botton_zhang@163.com>
 <e87dac11-a4fc-82b8-017e-2ae4e429d57d@amd.com>
From: "ZhiJie.Zhang" <botton_zhang@163.com>
In-Reply-To: <e87dac11-a4fc-82b8-017e-2ae4e429d57d@amd.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
X-CM-TRANSID: DsCowADX+qEbAf9iOi9OCQ--.7290S2
X-Coremail-Antispam: 1Uf129KBjvJXoW7AF15Ar47tw4kAryxZF4Dtwb_yoW8Gr43pF
 s5trWYyrW8XFZ7Ka9F9aykuryY9w4kXayIkrWUuwsrurW5AryUGF4qyryFgFyDurW8tF4f
 tw4UKw1fJFnFvFJanT9S1TB71UUUUUUqnTZGkaVYY2UrUUUUjbIjqfuFe4nvWSU5nxnvy2
 9KBjDUYxBIdaVFxhVjvjDU0xZFpf9x07Uq9aPUUUUU=
X-Originating-IP: [1.203.159.130]
X-CM-SenderInfo: xerw30xqb2xtlqj6il2tof0z/1tbiTwpimFsGcXwAuQAAsW
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



在 2022/8/18 6:31, Felix Kuehling 写道:
> Am 2022-07-15 um 04:07 schrieb ZhiJie.zhang:
>> memleak will happend that reload module due to ignore kfree when 
>> release topology
>>
>> Signed-off-by: ZhiJie.zhang <botton_zhang@163.com>
>> ---
>>   drivers/gpu/drm/amd/amdkfd/kfd_topology.c | 1 +
>>   1 file changed, 1 insertion(+)
>>
>> diff --git a/drivers/gpu/drm/amd/amdkfd/kfd_topology.c 
>> b/drivers/gpu/drm/amd/amdkfd/kfd_topology.c
>> index 8d50d207cf66..8b86f56bd50c 100644
>> --- a/drivers/gpu/drm/amd/amdkfd/kfd_topology.c
>> +++ b/drivers/gpu/drm/amd/amdkfd/kfd_topology.c
>> @@ -872,6 +872,7 @@ static void kfd_topology_release_sysfs(void)
>>           }
>>           kobject_del(sys_props.kobj_topology);
>>           kobject_put(sys_props.kobj_topology);
>> +        kfree(sys_props.kobj_topology);
> 
> Sorry for the late response. This looks incorrect. kobjects are 
> reference counted. The underlying memory should be freed by a callback 
> when the reference count reaches 0 in kobject_put. Freeing the object 
> here explicitly would lead to a double-free.
> 
> The callback in this case is kfd_topology_kobj_release, which calls 
> kfree. Am I missing anything?
> 
Yes, Your are right, this is my misstake, please ignore this patch
> Regards,
>    Felix
> 
> 
>>           sys_props.kobj_topology = NULL;
>>       }
>>   }

Regards.
Zhijie

