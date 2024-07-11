Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id BC9C392E2BA
	for <lists+dri-devel@lfdr.de>; Thu, 11 Jul 2024 10:51:09 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 8FDAE10E9A5;
	Thu, 11 Jul 2024 08:51:07 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=fail reason="signature verification failed" (2048-bit key; unprotected) header.d=igalia.com header.i=@igalia.com header.b="A6K+ZKXq";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from fanzine2.igalia.com (fanzine.igalia.com [178.60.130.6])
 by gabe.freedesktop.org (Postfix) with ESMTPS id D70AF10E9A5
 for <dri-devel@lists.freedesktop.org>; Thu, 11 Jul 2024 08:51:05 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=igalia.com; 
 s=20170329;
 h=Content-Transfer-Encoding:Content-Type:In-Reply-To:From:
 References:Cc:To:Subject:MIME-Version:Date:Message-ID:Sender:Reply-To:
 Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
 Resent-To:Resent-Cc:Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:
 List-Subscribe:List-Post:List-Owner:List-Archive;
 bh=TD+6al8ce2H5BBBxJ+FQ1i/d3K1MOtEzoW9hOCI7t6k=; b=A6K+ZKXq8uAsq0cVR2RV+8nG7x
 4g/vSonQeYm9lQ7TlWhLZ7GjpQqYG22hyn3dcF/zsrsOYO6SPH8pcIL1b8xEQZULwSJL/Tr3au4YN
 zUIL3WOEo5ZUD3pFKG0RYEisIRVHngAH6rExtZO6wiSbT4/CzVYHrxaGyM8gBTws90y1UwusENmuE
 +lU9aZo0lhIO+1ZUZ+awcq9X2o9/uQfzrWMIVmqzxbfZXFvKsoFKSm1lbxlJrt92vJk2NALlcmSyJ
 Vk+7ly8i9gEfdJUCTYvt59heFkijGXhFlLrSrqxj+HyJf101AdXKiiqVHsCjhrHFF+YD1JLir8U6d
 o/CIue/g==;
Received: from [84.69.19.168] (helo=[192.168.0.101])
 by fanzine2.igalia.com with esmtpsa 
 (Cipher TLS1.3:ECDHE_X25519__RSA_PSS_RSAE_SHA256__AES_128_GCM:128) (Exim)
 id 1sRpW4-00Dbnq-0L; Thu, 11 Jul 2024 10:51:04 +0200
Message-ID: <504bfca3-a8cf-4c42-9b04-41e696a2ad0f@igalia.com>
Date: Thu, 11 Jul 2024 09:51:02 +0100
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH 04/12] drm/v3d: Validate passed in drm syncobj handles in
 the timestamp extension
To: =?UTF-8?Q?Ma=C3=ADra_Canal?= <mcanal@igalia.com>,
 Tvrtko Ursulin <tursulin@igalia.com>, dri-devel@lists.freedesktop.org
Cc: kernel-dev@igalia.com, Iago Toral Quiroga <itoral@igalia.com>,
 stable@vger.kernel.org
References: <20240710134130.17292-1-tursulin@igalia.com>
 <20240710134130.17292-5-tursulin@igalia.com>
 <6c4a6268-6e0a-476b-adca-b1c35ea71abc@igalia.com>
Content-Language: en-GB
From: Tvrtko Ursulin <tvrtko.ursulin@igalia.com>
In-Reply-To: <6c4a6268-6e0a-476b-adca-b1c35ea71abc@igalia.com>
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


On 10/07/2024 18:06, Maíra Canal wrote:
> On 7/10/24 10:41, Tvrtko Ursulin wrote:
>> From: Tvrtko Ursulin <tvrtko.ursulin@igalia.com>
>>
>> If userspace provides an unknown or invalid handle anywhere in the handle
>> array the rest of the driver will not handle that well.
>>
>> Fix it by checking handle was looked up successfuly or otherwise fail the
> 
> I believe you mean "Fix it by checking if the handle..."
> 
> Also s/successfuly/successfully

Oops, thank you!

> 
>> extension by jumping into the existing unwind.
>>
>> Signed-off-by: Tvrtko Ursulin <tvrtko.ursulin@igalia.com>
>> Fixes: 9ba0ff3e083f ("drm/v3d: Create a CPU job extension for the 
>> timestamp query job")
>> Cc: Maíra Canal <mcanal@igalia.com>
>> Cc: Iago Toral Quiroga <itoral@igalia.com>
>> Cc: <stable@vger.kernel.org> # v6.8+
>> ---
>>   drivers/gpu/drm/v3d/v3d_submit.c | 12 ++++++++++++
>>   1 file changed, 12 insertions(+)
>>
>> diff --git a/drivers/gpu/drm/v3d/v3d_submit.c 
>> b/drivers/gpu/drm/v3d/v3d_submit.c
>> index ca1b1ad0a75c..3313423080e7 100644
>> --- a/drivers/gpu/drm/v3d/v3d_submit.c
>> +++ b/drivers/gpu/drm/v3d/v3d_submit.c
>> @@ -497,6 +497,10 @@ v3d_get_cpu_timestamp_query_params(struct 
>> drm_file *file_priv,
>>           }
>>           job->timestamp_query.queries[i].syncobj = 
>> drm_syncobj_find(file_priv, sync);
>> +        if (!job->timestamp_query.queries[i].syncobj) {
>> +            err = -ENOENT;
> 
> I'm not sure if err should be -ENOENT or -EINVAL, but based on other 
> drivers, I believe it should be -EINVAL.

After a quick grep I am inclined to think ENOENT is correct. DRM core 
uses that, and drivers seem generally confused (split between ENOENT and 
EINVAL). With one even going for ENODEV!

Regards,

Tvrtko
>> +            goto error;
>> +        }
>>       }
>>       job->timestamp_query.count = timestamp.count;
>> @@ -550,6 +554,10 @@ v3d_get_cpu_reset_timestamp_params(struct 
>> drm_file *file_priv,
>>           }
>>           job->timestamp_query.queries[i].syncobj = 
>> drm_syncobj_find(file_priv, sync);
>> +        if (!job->timestamp_query.queries[i].syncobj) {
>> +            err = -ENOENT;
>> +            goto error;
>> +        }
>>       }
>>       job->timestamp_query.count = reset.count;
>> @@ -613,6 +621,10 @@ v3d_get_cpu_copy_query_results_params(struct 
>> drm_file *file_priv,
>>           }
>>           job->timestamp_query.queries[i].syncobj = 
>> drm_syncobj_find(file_priv, sync);
>> +        if (!job->timestamp_query.queries[i].syncobj) {
>> +            err = -ENOENT;
>> +            goto error;
>> +        }
>>       }
>>       job->timestamp_query.count = copy.count;
