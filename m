Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 5EB63A91ACE
	for <lists+dri-devel@lfdr.de>; Thu, 17 Apr 2025 13:27:58 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id BA77D10EACB;
	Thu, 17 Apr 2025 11:27:54 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=fail reason="signature verification failed" (2048-bit key; unprotected) header.d=igalia.com header.i=@igalia.com header.b="K47WesQY";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from fanzine2.igalia.com (fanzine.igalia.com [178.60.130.6])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 5521110EABD;
 Thu, 17 Apr 2025 11:27:49 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=igalia.com; 
 s=20170329;
 h=Content-Transfer-Encoding:Content-Type:In-Reply-To:From:
 References:Cc:To:Subject:MIME-Version:Date:Message-ID:Sender:Reply-To:
 Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
 Resent-To:Resent-Cc:Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:
 List-Subscribe:List-Post:List-Owner:List-Archive;
 bh=m/7PFydCEc2cZqSSU1AuQ2J36xZLv3+FkoNbKaaeGj4=; b=K47WesQYhwNtLulRh8JWWEZpT3
 p543PrdOuRmvUtpC5s4B/QylNakqkKZFYzenYDKgzg7UfwspTCXs6+3lZUEqw8gfr4t+g1eD4bQm+
 tmiskSzxz//9oj1DZfIlBpgmWLCwU+7GGtx6MxUfsarejvkYq4aKdhYN3q1alix4r3DD6TZReDc/h
 NFkyfdwKvrKy4m/hVqA1RiFJ0xncu+b8I9x2PJD7j5+einpRpvmwpDh5BiAyjZh9jLRZhPY7UUlZJ
 0JE9JAuuiS1aLQNhg3YvtFSB9rJLgpMcqnPiJP9q1M3U3nwlpKs+4MNERjpWJbG8niAVAhD29OMHE
 R1HNyBaw==;
Received: from [90.241.98.187] (helo=[192.168.0.101])
 by fanzine2.igalia.com with esmtpsa 
 (Cipher TLS1.3:ECDHE_X25519__RSA_PSS_RSAE_SHA256__AES_128_GCM:128) (Exim)
 id 1u5NP0-000mgU-4r; Thu, 17 Apr 2025 13:27:30 +0200
Message-ID: <3ac34c84-fd84-4598-96e1-239418b7109f@igalia.com>
Date: Thu, 17 Apr 2025 12:27:29 +0100
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH 3/5] drm/sched: Warn if pending list is not empty
To: phasta@kernel.org, Lyude Paul <lyude@redhat.com>,
 Danilo Krummrich <dakr@kernel.org>, David Airlie <airlied@gmail.com>,
 Simona Vetter <simona@ffwll.ch>, Matthew Brost <matthew.brost@intel.com>,
 =?UTF-8?Q?Christian_K=C3=B6nig?= <ckoenig.leichtzumerken@gmail.com>,
 Maarten Lankhorst <maarten.lankhorst@linux.intel.com>,
 Maxime Ripard <mripard@kernel.org>, Thomas Zimmermann <tzimmermann@suse.de>
Cc: dri-devel@lists.freedesktop.org, nouveau@lists.freedesktop.org,
 linux-kernel@vger.kernel.org
References: <20250407152239.34429-2-phasta@kernel.org>
 <20250407152239.34429-5-phasta@kernel.org>
 <9607e5a54b8c5041dc7fc134425cc36c0c70b5f3.camel@mailbox.org>
Content-Language: en-GB
From: Tvrtko Ursulin <tvrtko.ursulin@igalia.com>
In-Reply-To: <9607e5a54b8c5041dc7fc134425cc36c0c70b5f3.camel@mailbox.org>
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


On 17/04/2025 08:45, Philipp Stanner wrote:
> On Mon, 2025-04-07 at 17:22 +0200, Philipp Stanner wrote:
>> drm_sched_fini() can leak jobs under certain circumstances.
>>
>> Warn if that happens.
>>
>> Signed-off-by: Philipp Stanner <phasta@kernel.org>
>> ---
>>   drivers/gpu/drm/scheduler/sched_main.c | 4 ++++
> 
> I hear a lot of amazed silence for this series ^_^
> 
> If there's no major pushback, my intention is to pull this in once the
> blocking Nouveau-bug has been fixed (by pulling my patch).

It was on my todo list to read it but failed to get to it due various 
reasons.

I only managed to skim over it it and am not quite convinced. But 
because I did not have time to think about it very much my feedback at 
this point is not very deep.

On the high level I understand for nouveau the series is "net zero", 
right? No leaks before, no leaks after. What about other drivers? Which 
ones have known leaks which could be addressed by them implementing this 
new callback?

Presumably you would document the callback should only be implemented by 
drivers which are 100% sure the clean up can always reliably done? 
Otherwise unkillable process on stuck hardware or drivers with not good 
enough reset support can still happen. (Which would be worse than a leak 
on shutdown.)

Have you thought about any observable effects from the userspace point 
of view? For example something if which now works, such as submitting a 
job which writes to a shared buffer and then exiting could stop working 
after the callback is implemented? I don't see it, because it would be 
unreliable even today (timing dependent whether job is in the queue or 
scheduled at exit time) so just thinking out loud.

Also, since the cover letter mentions job reference counting was one 
idea that was discarded another related problem is about the lifetimes. 
I think it would be good to discuss potentially reference counting 
"everything" because for instance today I can crash the kernel trivially 
with the xe driver*. Probably other drivers too.

Problem exactly is that jobs can outlive the entities and the scheduler, 
while some userspace may have a dma fence reference to the job via sync 
file. This new callback would not solve it for xe, but if everything 
required was reference counted it would.

Back to the series.

On the design level it feels like it adds too much state machine and 
makes things hard to follow/maintain. It would be nice to find a 
solutiuon where we end up with less state machine and not more.

On the low level there are some patch ordering and naming, spelling and 
other small improvements to be made.

But as said at the start, I would need to set aside more time to provide 
better comments and/or ideas.

*)
https://patchwork.freedesktop.org/patch/642709/?series=146211&rev=2

> In the mean time, let me review my own stuff:
> 
>>   1 file changed, 4 insertions(+)
>>
>> diff --git a/drivers/gpu/drm/scheduler/sched_main.c
>> b/drivers/gpu/drm/scheduler/sched_main.c
>> index 6b72278c4b72..ae3152beca14 100644
>> --- a/drivers/gpu/drm/scheduler/sched_main.c
>> +++ b/drivers/gpu/drm/scheduler/sched_main.c
>> @@ -1465,6 +1465,10 @@ void drm_sched_fini(struct drm_gpu_scheduler
>> *sched)
>>   	sched->ready = false;
>>   	kfree(sched->sched_rq);
>>   	sched->sched_rq = NULL;
>> +
>> +	if (!list_empty(&sched->pending_list))
>> +		dev_err(sched->dev, "%s: Tearing down scheduler
>> while jobs are pending!\n",
>> +			__func__);

It isn't fair to add this error since it would out of the blue start 
firing for everyone expect nouveau, no? Regardless if there is a leak or 
not.

> 
> The "%s" here will be removed since dev_err() alreday prints the
> function name.

It does? But anyway, function name is redundant and irrelevant and 
should not be logged IMO. I would rather prefer we replaced sched->dev 
with sched->drm so could use drm loggers for clarity throughout.

> I find this dev_err() print more useful than the stack a WARN_ON prints
> (telling you about invalid_asm_exec_op or stuff like that).
> 
> Plus, I guess the places where drivers call drm_sched_fini() are very
> well defined and known, so a callstack wouldn't really be useful in the
> first place.

Agreed.

Regards,

Tvrtko

> 
> P.
> 
>>   }
>>   EXPORT_SYMBOL(drm_sched_fini);
>>   
> 

