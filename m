Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 9ADAA9FE3EF
	for <lists+dri-devel@lfdr.de>; Mon, 30 Dec 2024 09:50:31 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 3B0A510E296;
	Mon, 30 Dec 2024 08:50:29 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (1024-bit key; unprotected) header.d=linux.alibaba.com header.i=@linux.alibaba.com header.b="YBncg1BH";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from out30-97.freemail.mail.aliyun.com
 (out30-97.freemail.mail.aliyun.com [115.124.30.97])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 71B1610E296;
 Mon, 30 Dec 2024 08:50:26 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=linux.alibaba.com; s=default;
 t=1735548624; h=Message-ID:Date:MIME-Version:Subject:To:From:Content-Type;
 bh=PccYO85rsZ4rdgiMx0mZC/d5kRnlpqB0eoGg1MbewiE=;
 b=YBncg1BHZE++ldN5HM5U76xhQzn0gi3izKjmn679CirvLqhlpcaOqKp49tz8UKYj+9I6x5S1VvGnxadM5ZnDTY1LNbwyrCKfJ7SGQucyzQCgz+2dQeTBCZ1vvuK+OWXcP+BsqlZw/14wG7gJ0lYLBL4Ji/1igA/LZDwh7YoKBAY=
Received: from 30.246.161.240(mailfrom:xueshuai@linux.alibaba.com
 fp:SMTPD_---0WMVdGax_1735548621 cluster:ay36) by smtp.aliyun-inc.com;
 Mon, 30 Dec 2024 16:50:23 +0800
Message-ID: <63938ba2-dcb5-456f-bf82-bd8c893549c0@linux.alibaba.com>
Date: Mon, 30 Dec 2024 16:50:21 +0800
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH] drm/amdgpu: Enable runtime modification of gpu_recovery
 parameter with validation
To: =?UTF-8?Q?Christian_K=C3=B6nig?= <christian.koenig@amd.com>,
 alexander.deucher@amd.com, Xinhui.Pan@amd.com, airlied@gmail.com,
 simona@ffwll.ch, lijo.lazar@amd.com, le.ma@amd.com, hamza.mahfooz@amd.com,
 tzimmermann@suse.de, shaoyun.liu@amd.com, Jun.Ma2@amd.com
Cc: amd-gfx@lists.freedesktop.org, dri-devel@lists.freedesktop.org,
 linux-kernel@vger.kernel.org, tianruidong@linux.alibaba.com
References: <20241228063245.61874-1-xueshuai@linux.alibaba.com>
 <563b1797-5524-44c5-89b0-754f245e6b8f@amd.com>
From: Shuai Xue <xueshuai@linux.alibaba.com>
In-Reply-To: <563b1797-5524-44c5-89b0-754f245e6b8f@amd.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
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



在 2024/12/30 04:11, Christian König 写道:
> Am 28.12.24 um 07:32 schrieb Shuai Xue:
>> It's observed that most GPU jobs utilize less than one server, typically
>> with each GPU being used by an independent job. If a job consumed poisoned
>> data, a SIGBUS signal will be sent to terminate it. Meanwhile, the
>> gpu_recovery parameter is set to -1 by default, the amdgpu driver resets
>> all GPUs on the server. As a result, all jobs are terminated. Setting
>> gpu_recovery to 0 provides an opportunity to preemptively evacuate other
>> jobs and subsequently manually reset all GPUs.
> 
> *BIG* NAK to this whole approach!
> 
> Setting gpu_recovery to 0 in a production environment is *NOT* supported at all and should never be done.
> 
> This is a pure debugging feature for JTAG debugging and can result in random crashes and/or compromised data.
> 
> Please don't tell me that you tried to use this in a production environment.
> 
> Regards,
> Christian.

Hi, Christian,

Thank you for your quick reply.

When an application encounters uncorrected error, it will be terminate by a
SIGBUS signal. The related bad pages are retired. I did not figure why
gpu_recovery=0 can result in random crashes and/or compromised data.

I test with error injection in my dev enviroment:

1. load driver with gpu_recovery=0
#cat /sys/bus/pci/drivers/amdgpu/module/parameters/gpu_recovery
0

2. inject a Uncorrectable ECC error to UMC
#sudo amdgpuras -d 0 -b 2 -t 8
Poison inject, logical addr:0x7f2b495f9000 physical addr:0x27f5d4b000 vmid:5
Bus error

3. GPU 0000:0a:00.0 reports error address with PA
#dmesg | grep 27f5
[424443.174154] amdgpu 0000:0a:00.0: amdgpu: Error Address(PA):0x27f5d43080 Row:0x1fd7 Col:0x0  Bank:0xa Channel:0x30
[424443.174156] amdgpu 0000:0a:00.0: amdgpu: Error Address(PA):0x27f5d4b080 Row:0x1fd7 Col:0x4  Bank:0xa Channel:0x30
[424443.174158] amdgpu 0000:0a:00.0: amdgpu: Error Address(PA):0x27f5d53080 Row:0x1fd7 Col:0x8  Bank:0xa Channel:0x30
[424443.174160] amdgpu 0000:0a:00.0: amdgpu: Error Address(PA):0x27f5d5b080 Row:0x1fd7 Col:0xc  Bank:0xa Channel:0x30
[424443.174162] amdgpu 0000:0a:00.0: amdgpu: Error Address(PA):0x27f5f43080 Row:0x1fd7 Col:0x10 Bank:0xa Channel:0x30
[424443.174169] amdgpu 0000:0a:00.0: amdgpu: Error Address(PA):0x27f5f4b080 Row:0x1fd7 Col:0x14 Bank:0xa Channel:0x30
[424443.174172] amdgpu 0000:0a:00.0: amdgpu: Error Address(PA):0x27f5f53080 Row:0x1fd7 Col:0x18 Bank:0xa Channel:0x30
[424443.174174] amdgpu 0000:0a:00.0: amdgpu: Error Address(PA):0x27f5f5b080 Row:0x1fd7 Col:0x1c Bank:0xa Channel:0x30
  
4. All the related bad pages are AMDGPU_RAS_RETIRE_PAGE_RESERVED.
#cat /sys/devices/pci0000:05/0000:05:01.0/0000:06:00.0/0000:07:00.0/0000:08:00.0/0000:09:00.0/0000:0a:00.0/ras/gpu_vram_bad_pages | grep 27f5
0x027f5d43 : 0x00001000 : R
0x027f5d4b : 0x00001000 : R
0x027f5d53 : 0x00001000 : R
0x027f5d5b : 0x00001000 : R
0x027f5f43 : 0x00001000 : R
0x027f5f4b : 0x00001000 : R
0x027f5f53 : 0x00001000 : R
0x027f5f5b : 0x00001000 : R

AFAIK, the reserved bad pages will not be used any more.  Please correct me if
I missed anything.

DRAM ECC issues are the most common problems. When it occurs, the kernel will
attempt to hard-offline the page, by trying to unmap the page or killing any
owner, or triggering IO errors if needed.

ECC error is also common for HBM and error isolation from each user's job is a
basic requirement in public cloud. For NVIDIA GPU, a ECC error could be
contained to a process.

> XID 94: Contained ECC error
> XID 95: UnContained ECC error
> 
> For Xid 94, these errors are contained to one application, and the application
> that encountered this error must be restarted. All other applications running
> at the time of the Xid are unaffected. It is recommended to reset the GPU when
> convenient. Applications can continue to be run until the reset can be
> performed.
> 
> For Xid 95, these errors affect multiple applications, and the affected GPU
> must be reset before applications can restart.
>
> https://docs.nvidia.com/deploy/xid-errors/

Does AMD GPU provide a similar way to achieve error isolation requirement?

Best Regards,
Shuai

> 
>>   However, this parameter is
>> read-only, necessitating correct settings at driver load. And reloading the
>> GPU driver in a production environment can be challenging due to reference
>> counts maintained by various monitoring services.
>>
>> Set the gpu_recovery parameter with read-write permission to enable runtime
>> modification. It will enables users to dynamically manage GPU recovery
>> mechanisms based on real-time requirements or conditions.
>>
>> Signed-off-by: Shuai Xue <xueshuai@linux.alibaba.com>
>> ---
>>   drivers/gpu/drm/amd/amdgpu/amdgpu_drv.c | 26 ++++++++++++++++++++++++-
>>   1 file changed, 25 insertions(+), 1 deletion(-)
>>
>> diff --git a/drivers/gpu/drm/amd/amdgpu/amdgpu_drv.c b/drivers/gpu/drm/amd/amdgpu/amdgpu_drv.c
>> index 38686203bea6..03dd902e1cec 100644
>> --- a/drivers/gpu/drm/amd/amdgpu/amdgpu_drv.c
>> +++ b/drivers/gpu/drm/amd/amdgpu/amdgpu_drv.c
>> @@ -563,12 +563,36 @@ module_param_named(lbpw, amdgpu_lbpw, int, 0444);
>>   MODULE_PARM_DESC(compute_multipipe, "Force compute queues to be spread across pipes (1 = enable, 0 = disable, -1 = auto)");
>>   module_param_named(compute_multipipe, amdgpu_compute_multipipe, int, 0444);
>> +static int amdgpu_set_gpu_recovery(const char *buf,
>> +                   const struct kernel_param *kp)
>> +{
>> +    unsigned long val;
>> +    int ret;
>> +
>> +    ret = kstrtol(buf, 10, &val);
>> +    if (ret < 0)
>> +        return ret;
>> +
>> +    if (val != 1 && val != 0 && val != -1) {
>> +        pr_err("Invalid value for gpu_recovery: %ld, excepted 0,1,-1\n",
>> +               val);
>> +        return -EINVAL;
>> +    }
>> +
>> +    return param_set_int(buf, kp);
>> +}
>> +
>> +static const struct kernel_param_ops amdgpu_gpu_recovery_ops = {
>> +    .set = amdgpu_set_gpu_recovery,
>> +    .get = param_get_int,
>> +};
>> +
>>   /**
>>    * DOC: gpu_recovery (int)
>>    * Set to enable GPU recovery mechanism (1 = enable, 0 = disable). The default is -1 (auto, disabled except SRIOV).
>>    */
>>   MODULE_PARM_DESC(gpu_recovery, "Enable GPU recovery mechanism, (1 = enable, 0 = disable, -1 = auto)");
>> -module_param_named(gpu_recovery, amdgpu_gpu_recovery, int, 0444);
>> +module_param_cb(gpu_recovery, &amdgpu_gpu_recovery_ops, &amdgpu_gpu_recovery, 0644);
>>   /**
>>    * DOC: emu_mode (int)
