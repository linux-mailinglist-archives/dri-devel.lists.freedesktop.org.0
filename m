Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 0924A885636
	for <lists+dri-devel@lfdr.de>; Thu, 21 Mar 2024 10:09:11 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id EA84910E3F9;
	Thu, 21 Mar 2024 09:09:00 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from szxga01-in.huawei.com (szxga01-in.huawei.com [45.249.212.187])
 by gabe.freedesktop.org (Postfix) with ESMTPS id CC0B610E19C
 for <dri-devel@lists.freedesktop.org>; Thu, 21 Mar 2024 07:55:41 +0000 (UTC)
Received: from mail.maildlp.com (unknown [172.19.163.174])
 by szxga01-in.huawei.com (SkyGuard) with ESMTP id 4V0d4K1bgYztQbP;
 Thu, 21 Mar 2024 15:53:21 +0800 (CST)
Received: from kwepemm600013.china.huawei.com (unknown [7.193.23.68])
 by mail.maildlp.com (Postfix) with ESMTPS id 8A1EF140FEA;
 Thu, 21 Mar 2024 15:55:38 +0800 (CST)
Received: from [10.174.178.156] (10.174.178.156) by
 kwepemm600013.china.huawei.com (7.193.23.68) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.1.2507.35; Thu, 21 Mar 2024 15:55:37 +0800
Message-ID: <747ff93d-1d05-aabb-0fa2-5a7810f41c85@huawei.com>
Date: Thu, 21 Mar 2024 15:55:37 +0800
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:91.0) Gecko/20100101
 Thunderbird/91.3.2
Subject: Re: [PATCH] drm/vkms: call drm_atomic_helper_shutdown before
 drm_dev_put()
To: Greg KH <gregkh@linuxfoundation.org>
CC: <stable@vger.kernel.org>, <airlied@linux.ie>,
 <dri-devel@lists.freedesktop.org>, <xuqiang36@huawei.com>
References: <20240321070752.81405-1-guomengqi3@huawei.com>
 <2024032130-dripping-possum-7528@gregkh>
From: "guomengqi (A)" <guomengqi3@huawei.com>
In-Reply-To: <2024032130-dripping-possum-7528@gregkh>
Content-Type: text/plain; charset="UTF-8"; format=flowed
Content-Transfer-Encoding: 8bit
X-Originating-IP: [10.174.178.156]
X-ClientProxiedBy: dggems706-chm.china.huawei.com (10.3.19.183) To
 kwepemm600013.china.huawei.com (7.193.23.68)
X-Mailman-Approved-At: Thu, 21 Mar 2024 09:08:59 +0000
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


在 2024/3/21 15:39, Greg KH 写道:
> On Thu, Mar 21, 2024 at 03:07:52PM +0800, Guo Mengqi wrote:
>> commit 73a82b22963d ("drm/atomic: Fix potential use-after-free
>> in nonblocking commits") introduced drm_dev_get/put() to
>> drm_atomic_helper_shutdown(). And this cause problem in vkms driver exit
>> process.
>>
>> vkms_exit()
>>    drm_dev_put()
>>      vkms_release()
>>        drm_atomic_helper_shutdown()
>>          drm_dev_get()
>>          drm_dev_put()
>>            vkms_release()    ------ null pointer access
>>
>> Using 4.19 stable x86 image on qemu, below stacktrace can be triggered by
>> load and unload vkms.ko.
>>
>> root:~ # insmod vkms.ko
>> [  142.135449] [drm] Supports vblank timestamp caching Rev 2 (21.10.2013).
>> [  142.138713] [drm] Driver supports precise vblank timestamp query.
>> [  142.142390] [drm] Initialized vkms 1.0.0 20180514 for virtual device on minor 0
>> root:~ # rmmod vkms.ko
>> [  144.093710] BUG: unable to handle kernel NULL pointer dereference at 00000000000000a0
>> [  144.097491] PGD 800000023624e067 P4D 800000023624e067 PUD 22ab59067 PMD 0
>> [  144.100802] Oops: 0000 [#1] SMP PTI
>> [  144.102502] CPU: 0 PID: 3615 Comm: rmmod Not tainted 4.19.310 #1
>> [  144.104452] Hardware name: QEMU Standard PC (i440FX + PIIX, 1996), BIOS rel-1.13.0-0-gf21b5a4aeb02-prebuilt.qemu.org 04/01/2014
>> [  144.107238] RIP: 0010:device_del+0x34/0x3a0
>> ...
>> [  144.131323] Call Trace:
>> [  144.131962]  ? __die+0x7d/0xc0
>> [  144.132711]  ? no_context+0x152/0x3b0
>> [  144.133605]  ? wake_up_q+0x70/0x70
>> [  144.134436]  ? __do_page_fault+0x342/0x4b0
>> [  144.135445]  ? __switch_to_asm+0x41/0x70
>> [  144.136416]  ? __switch_to_asm+0x35/0x70
>> [  144.137366]  ? page_fault+0x1e/0x30
>> [  144.138214]  ? __drm_atomic_state_free+0x51/0x60
>> [  144.139331]  ? device_del+0x34/0x3a0
>> [  144.140197]  platform_device_del.part.14+0x19/0x70
>> [  144.141348]  platform_device_unregister+0xe/0x20
>> [  144.142458]  vkms_release+0x10/0x30 [vkms]
>> [  144.143449]  __drm_atomic_helper_disable_all.constprop.31+0x13b/0x150
>> [  144.144980]  drm_atomic_helper_shutdown+0x4b/0x90
>> [  144.146102]  vkms_release+0x18/0x30 [vkms]
>> [  144.147107]  vkms_exit+0x29/0x8ec [vkms]
>> [  144.148053]  __x64_sys_delete_module+0x155/0x220
>> [  144.149168]  do_syscall_64+0x43/0x100
>> [  144.150056]  entry_SYSCALL_64_after_hwframe+0x5c/0xc1
>>
>> It seems that the proper unload sequence is:
>> 	drm_atomic_helper_shutdown();
>> 	drm_dev_put();
>>
>> Just put drm_atomic_helper_shutdown() before drm_dev_put()
>> should solve the problem.
>>
>> Fixes: 73a82b22963d ("drm/atomic: Fix potential use-after-free in nonblocking commits")
>> Signed-off-by: Guo Mengqi <guomengqi3@huawei.com>
>> ---
>>   drivers/gpu/drm/vkms/vkms_drv.c | 2 +-
>>   1 file changed, 1 insertion(+), 1 deletion(-)
>>
>> diff --git a/drivers/gpu/drm/vkms/vkms_drv.c b/drivers/gpu/drm/vkms/vkms_drv.c
>> index b1201c18d3eb..d32e08f17427 100644
>> --- a/drivers/gpu/drm/vkms/vkms_drv.c
>> +++ b/drivers/gpu/drm/vkms/vkms_drv.c
>> @@ -39,7 +39,6 @@ static void vkms_release(struct drm_device *dev)
>>   	struct vkms_device *vkms = container_of(dev, struct vkms_device, drm);
>>   
>>   	platform_device_unregister(vkms->platform);
>> -	drm_atomic_helper_shutdown(&vkms->drm);
>>   	drm_mode_config_cleanup(&vkms->drm);
>>   	drm_dev_fini(&vkms->drm);
>>   }
>> @@ -137,6 +136,7 @@ static void __exit vkms_exit(void)
>>   	}
>>   
>>   	drm_dev_unregister(&vkms_device->drm);
>> +	drm_atomic_helper_shutdown(&vkms_device->drm);
>>   	drm_dev_put(&vkms_device->drm);
>>   
>>   	kfree(vkms_device);
>> -- 
>> 2.17.1
>>
>>
> What is the commit id of this change in Linus's tree?

Hi,

Do you mean this patch? I only send it to stable tree, mainline does not 
have this bug.

vkms exit code is refactored by 53d77aaa3f76 ("drm/vkms: Use 
devm_drm_dev_alloc") in tags/v5.10-rc1.

So this bug only exists on 4.19 and 5.4.

> thanks,
>
> greg k-h
> .
