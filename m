Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 9FED9A89701
	for <lists+dri-devel@lfdr.de>; Tue, 15 Apr 2025 10:44:20 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id E948C10E689;
	Tue, 15 Apr 2025 08:44:16 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=fail reason="signature verification failed" (2048-bit key; unprotected) header.d=igalia.com header.i=@igalia.com header.b="GZwqCPWM";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from fanzine2.igalia.com (fanzine.igalia.com [178.60.130.6])
 by gabe.freedesktop.org (Postfix) with ESMTPS id AF57910E076;
 Tue, 15 Apr 2025 08:44:10 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=igalia.com; 
 s=20170329;
 h=Content-Transfer-Encoding:Content-Type:In-Reply-To:From:
 References:Cc:To:Subject:MIME-Version:Date:Message-ID:Sender:Reply-To:
 Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
 Resent-To:Resent-Cc:Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:
 List-Subscribe:List-Post:List-Owner:List-Archive;
 bh=l2S0bNLk64fpyNdRacO3mK4fN0FK/r0bnJp9wU8JNTw=; b=GZwqCPWMUu6gBaA1sKmOvXW7Ki
 1srppt+s0LYaX1NqsEPdEImkiJyEu2Av9prr4oqGs9w3HOt14zePh8NxVHpVnkKfcYhQgl7LwKOe6
 ThoLPiXXWDAtBTVth9m6KPNMHkD9zacjlPu9l4bsUlhKjTYAQImw2EsM6BC1HrmGfY3TrfqwCmSJv
 LXaQfEUQjLISH5It0BY6b/KGYQlee9wUn4t4JfAOItKJo5IqVXylb+w85ABPU5UP/YD3h7NDJbmo5
 PYEEk7jyqD0+8V9QfwtVGTeiz9Nhm6uhybAM+zq6dKP+3Cs418yNfpq7Agx+f7Pfdu50x0SxazptX
 tx8qCNIg==;
Received: from [90.241.98.187] (helo=[192.168.0.101])
 by fanzine2.igalia.com with esmtpsa 
 (Cipher TLS1.3:ECDHE_X25519__RSA_PSS_RSAE_SHA256__AES_128_GCM:128) (Exim)
 id 1u4btk-00Grgd-Is; Tue, 15 Apr 2025 10:44:04 +0200
Message-ID: <7b3fe17a-3446-462d-8614-c31a1d47a67f@igalia.com>
Date: Tue, 15 Apr 2025 09:44:03 +0100
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v1 1/3] drm: function to get process name and pid
To: =?UTF-8?Q?Christian_K=C3=B6nig?= <ckoenig.leichtzumerken@gmail.com>,
 Sunil Khatri <sunil.khatri@amd.com>, dri-devel@lists.freedesktop.org,
 amd-gfx@lists.freedesktop.org,
 "Pelloux-prayer, Pierre-eric" <Pierre-eric.Pelloux-prayer@amd.com>
Cc: Alex Deucher <alexander.deucher@amd.com>,
 =?UTF-8?Q?Christian_K=C3=B6nig?= <christian.koenig@amd.com>
References: <20250411130428.4104957-1-sunil.khatri@amd.com>
 <c2ef0925-14ad-4eff-9972-53406ec01f0a@gmail.com>
Content-Language: en-GB
From: Tvrtko Ursulin <tvrtko.ursulin@igalia.com>
In-Reply-To: <c2ef0925-14ad-4eff-9972-53406ec01f0a@gmail.com>
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


On 14/04/2025 18:58, Christian König wrote:
> Adding Pierre-eric and Tvrtko as well.

Thanks!

> Am 11.04.25 um 15:04 schrieb Sunil Khatri:
>> Add helper function which get the process information for
>> the drm_file and updates the user provided character buffer
>> with the information of process name and pid as a string.
>>
>> Signed-off-by: Sunil Khatri <sunil.khatri@amd.com>
>> ---
>>   drivers/gpu/drm/drm_file.c | 30 ++++++++++++++++++++++++++++++
>>   include/drm/drm_file.h     |  1 +
>>   2 files changed, 31 insertions(+)
>>
>> diff --git a/drivers/gpu/drm/drm_file.c b/drivers/gpu/drm/drm_file.c
>> index cb5f22f5bbb6..4434258d21b5 100644
>> --- a/drivers/gpu/drm/drm_file.c
>> +++ b/drivers/gpu/drm/drm_file.c
>> @@ -965,6 +965,36 @@ void drm_show_fdinfo(struct seq_file *m, struct file *f)
>>   }
>>   EXPORT_SYMBOL(drm_show_fdinfo);
>>   
>> +/**
>> + * drm_process_info - Fill info string with process name and pid
>> + * @file_priv: context of interest for process name and pid
>> + * @proc_info: user char ptr to write the string to
>> + * @buff_size: size of the buffer passed for the string
>> + *
>> + * This update the user provided buffer with process
>> + * name and pid information for @file_priv
>> + */
>> +void drm_process_info(struct drm_file *file_priv, char *proc_info, size_t buff_size)
>> +{
>> +	struct task_struct *task;
>> +	struct pid *pid;
>> +	struct drm_device *dev = file_priv->minor->dev;
>> +
>> +	if (!proc_info) {
>> +		drm_err(dev, "Invalid user buffer\n");

I'd replace this with drm_WARN_ON_ONCE.

Another thing I would consider is avoiding the need for stack space by 
exporting a logging helper instead. Something like (from patch 3/3):

drm_file_err(uq_mgr->file, "Timed out waiting for fence %p\n", f);

Which would output the client name info as a prefix or something.

Especially attractive if you add client name.

Also while here, is %p for the fence is useful? FWIW in the tracing 
series we are going for %llu:%llu (context:seqno).

Regards,

Tvrtko

>> +		return;
>> +	}
>> +
>> +	rcu_read_lock();
>> +	pid = rcu_dereference(file_priv->pid);
>> +	task = pid_task(pid, PIDTYPE_TGID);
>> +	if (task)
>> +		snprintf(proc_info, buff_size, "comm:%s pid:%d", task->comm, task->pid);
> 
> Looks good in general, but I think people would like to see the optional client name here as well.
> 
> It's rather useful to have for native context.
> 
> Regards,
> Christian.
> 
>> +
>> +	rcu_read_unlock();
>> +}
>> +EXPORT_SYMBOL(drm_process_info);
>> +
>>   /**
>>    * mock_drm_getfile - Create a new struct file for the drm device
>>    * @minor: drm minor to wrap (e.g. #drm_device.primary)
>> diff --git a/include/drm/drm_file.h b/include/drm/drm_file.h
>> index f0ef32e9fa5e..c01b34936968 100644
>> --- a/include/drm/drm_file.h
>> +++ b/include/drm/drm_file.h
>> @@ -501,6 +501,7 @@ void drm_print_memory_stats(struct drm_printer *p,
>>   
>>   void drm_show_memory_stats(struct drm_printer *p, struct drm_file *file);
>>   void drm_show_fdinfo(struct seq_file *m, struct file *f);
>> +void drm_process_info(struct drm_file *file_priv, char *proc_info, size_t buff_size);
>>   
>>   struct file *mock_drm_getfile(struct drm_minor *minor, unsigned int flags);
>>   
> 

