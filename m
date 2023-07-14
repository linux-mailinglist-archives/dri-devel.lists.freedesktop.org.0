Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id AE0A8753A96
	for <lists+dri-devel@lfdr.de>; Fri, 14 Jul 2023 14:18:53 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 227B010E887;
	Fri, 14 Jul 2023 12:18:48 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from fanzine2.igalia.com (fanzine2.igalia.com [213.97.179.56])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 6AE9E10E87B;
 Fri, 14 Jul 2023 12:18:45 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=igalia.com; 
 s=20170329;
 h=Content-Transfer-Encoding:Content-Type:In-Reply-To:From:
 References:Cc:To:Subject:MIME-Version:Date:Message-ID:Sender:Reply-To:
 Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
 Resent-To:Resent-Cc:Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:
 List-Subscribe:List-Post:List-Owner:List-Archive;
 bh=50OTjCdoe04eHZJMPt74za6C1P/cUdEzGRPeJlapH2Q=; b=MxX8/RLrkeair/1GtCYaQNguEu
 b1cjVO2v6bXacIX4QeE29DSl4kT5+V1LNYpETw3XujL7MzBtKeyxyocpfIrlBQf97IRJrJbCoxZP1
 eEe2nydPZFoA4OioPQOxOypfJPqTXPShLskR1OQurWfbeLfF1DMrlRg/Xm20U3pSmu1ncicVcihMj
 i3qwH5rNHg9Z/gZeMfL8U58/NM9qi/EgJpqj3hCQo09Ajere9NPbWw788uFWktRynSuCtPezp4KhO
 KAnllc7hfz2YeD3VcuFDXrWTPdz/zWZpqaHwKvl1jp7FQcFAB8Mcp1i96R/dlNOv+O3UYhQA6DmEa
 RuqEUjAQ==;
Received: from [187.74.70.209] (helo=[192.168.1.111])
 by fanzine2.igalia.com with esmtpsa 
 (Cipher TLS1.3:ECDHE_X25519__RSA_PSS_RSAE_SHA256__AES_128_GCM:128) (Exim)
 id 1qKHkq-00EVJh-PB; Fri, 14 Jul 2023 14:18:37 +0200
Message-ID: <e4a29b97-2f82-f776-3898-98b0813fcaf0@igalia.com>
Date: Fri, 14 Jul 2023 09:18:30 -0300
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.12.0
Subject: Re: [PATCH v2 4/6] drm/amdgpu: Limit info in coredump for kernel
 threads
To: =?UTF-8?Q?Christian_K=c3=b6nig?= <ckoenig.leichtzumerken@gmail.com>
References: <20230713213242.680944-1-andrealmeid@igalia.com>
 <20230713213242.680944-5-andrealmeid@igalia.com>
 <72a40172-86a8-64c0-0c06-cbc670503370@gmail.com>
Content-Language: en-US
From: =?UTF-8?Q?Andr=c3=a9_Almeida?= <andrealmeid@igalia.com>
In-Reply-To: <72a40172-86a8-64c0-0c06-cbc670503370@gmail.com>
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
Cc: pierre-eric.pelloux-prayer@amd.com,
 Samuel Pitoiset <samuel.pitoiset@gmail.com>,
 =?UTF-8?B?J01hcmVrIE9sxaHDoWsn?= <maraeo@gmail.com>,
 =?UTF-8?Q?Timur_Krist=c3=b3f?= <timur.kristof@gmail.com>,
 michel.daenzer@mailbox.org, linux-kernel@vger.kernel.org,
 dri-devel@lists.freedesktop.org, amd-gfx@lists.freedesktop.org,
 kernel-dev@igalia.com, alexander.deucher@amd.com, christian.koenig@amd.com
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

Em 14/07/2023 04:52, Christian König escreveu:
> 
> 
> Am 13.07.23 um 23:32 schrieb André Almeida:
>> If a kernel thread caused the reset, the information available to be
>> logged will be limited, so return early in the dump function.
> 
> Why? The register values and vram lost state should still be valid.
> 

Fair enough, I was thinking about the new added information, such as 
ring and job, that won't be around for this type of thread. I'll drop 
this patch for the next version.

> Christian.
> 
>>
>> Signed-off-by: André Almeida <andrealmeid@igalia.com>
>> ---
>>   drivers/gpu/drm/amd/amdgpu/amdgpu_device.c | 6 +++++-
>>   1 file changed, 5 insertions(+), 1 deletion(-)
>>
>> diff --git a/drivers/gpu/drm/amd/amdgpu/amdgpu_device.c 
>> b/drivers/gpu/drm/amd/amdgpu/amdgpu_device.c
>> index e80670420586..07546781b8b8 100644
>> --- a/drivers/gpu/drm/amd/amdgpu/amdgpu_device.c
>> +++ b/drivers/gpu/drm/amd/amdgpu/amdgpu_device.c
>> @@ -4988,10 +4988,14 @@ static ssize_t amdgpu_devcoredump_read(char 
>> *buffer, loff_t offset,
>>       drm_printf(&p, "kernel: " UTS_RELEASE "\n");
>>       drm_printf(&p, "module: " KBUILD_MODNAME "\n");
>>       drm_printf(&p, "time: %lld.%09ld\n", 
>> coredump->reset_time.tv_sec, coredump->reset_time.tv_nsec);
>> -    if (coredump->reset_task_info.pid)
>> +    if (coredump->reset_task_info.pid) {
>>           drm_printf(&p, "process_name: %s PID: %d\n",
>>                  coredump->reset_task_info.process_name,
>>                  coredump->reset_task_info.pid);
>> +    } else {
>> +        drm_printf(&p, "GPU reset caused by a kernel thread\n");
>> +        return count - iter.remain;
>> +    }
>>       if (coredump->reset_vram_lost)
>>           drm_printf(&p, "VRAM is lost due to GPU reset!\n");
> 
