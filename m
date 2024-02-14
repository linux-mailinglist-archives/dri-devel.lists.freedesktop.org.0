Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 87F4A854F09
	for <lists+dri-devel@lfdr.de>; Wed, 14 Feb 2024 17:48:33 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 47CC110E346;
	Wed, 14 Feb 2024 16:48:31 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; secure) header.d=damsy.net header.i=@damsy.net header.b="gljod815";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
X-Greylist: delayed 600 seconds by postgrey-1.36 at gabe;
 Wed, 14 Feb 2024 16:48:27 UTC
Received: from mail.damsy.net (mail.damsy.net [85.90.245.9])
 by gabe.freedesktop.org (Postfix) with ESMTPS id F327810E346;
 Wed, 14 Feb 2024 16:48:27 +0000 (UTC)
Message-ID: <37984611-fe53-4088-be32-0a2d825ff47a@damsy.net>
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=damsy.net; s=201803;
 t=1707928704;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=a5zubDY98X+TX50Yu/vbLG7DhE8XYQA2aDFd8gxtg2Q=;
 b=gljod815VpL2iekXxaZRiKkNpfWckp7OU3jvQGSZsaFHyBnTW3Wbi/oxShJlj7ItB0Dj45
 MIzQaoXHoDwh7uNhPW7WbIzaa/mf58G1MFuqrt5xVq7ZW34BFVARYB2tJWNnl7jwOmxyg5
 J5LbAiXs30dMJdPU8xlt3zsM7D96zBlWgbdXkNemyGGpxuqa8HT3Y8cpWpAL4xurZEdLlk
 ATt2DPSNsP8LiN/5fwOKhisT8GTFK4vrXdYdVxomKqnLvrJtpdbQShNaCAF12tQWSGbbkg
 KV0/gNszohR2PPpjwZPdyAtCPgKnbzYYpWfJsQtEr053I8GkOlg1fE/qyoABSA==
Date: Wed, 14 Feb 2024 17:38:23 +0100
MIME-Version: 1.0
Subject: Re: [PATCH v2 5/6] drm/amdgpu: add a amdgpu_cs_ioctl2 event
To: =?UTF-8?Q?Christian_K=C3=B6nig?= <christian.koenig@amd.com>,
 Pierre-Eric Pelloux-Prayer <pierre-eric.pelloux-prayer@amd.com>,
 Sumit Semwal <sumit.semwal@linaro.org>, Gustavo Padovan
 <gustavo@padovan.org>, Steven Rostedt <rostedt@goodmis.org>,
 Masami Hiramatsu <mhiramat@kernel.org>,
 Mathieu Desnoyers <mathieu.desnoyers@efficios.com>,
 dri-devel@lists.freedesktop.org, linux-media@vger.kernel.org,
 linux-trace-kernel@vger.kernel.org, Alex Deucher
 <alexander.deucher@amd.com>, amd-gfx@lists.freedesktop.org
References: <20240117184329.479554-1-pierre-eric.pelloux-prayer@amd.com>
 <20240213155112.156537-1-pierre-eric.pelloux-prayer@amd.com>
 <20240213155112.156537-6-pierre-eric.pelloux-prayer@amd.com>
 <2a6a473a-3e87-4838-83eb-400bde712e91@amd.com>
Content-Language: fr
From: Pierre-Eric Pelloux-Prayer <pierre-eric@damsy.net>
In-Reply-To: <2a6a473a-3e87-4838-83eb-400bde712e91@amd.com>
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



Le 14/02/2024 à 13:09, Christian König a écrit :
> Am 13.02.24 um 16:50 schrieb Pierre-Eric Pelloux-Prayer:
>> amdgpu_cs_ioctl already exists but serves a different
>> purpose.
>>
>> amdgpu_cs_ioctl2 marks the beginning of the kernel processing of
>> the ioctl which is useful for tools to map which events belong to
>> the same submission (without this, the first event would be the
>> amdgpu_bo_set_list ones).
> 
> That's not necessary a good justification for the naming. What exactly was the original trace_amdgpu_cs_ioctl() doing?
> 

trace_amdgpu_cs_ioctl is used right before drm_sched_entity_push_job is called so in a sense it's a duplicate
of trace_drm_sched_job.

That being said, it's used by gpuvis so I chose to not modify it.

As for the new event: initially I named it "amdgpu_cs_parser_init", but since the intent is to mark the
beginning of the amdgpu_cs_submit I've renamed it.

Any suggestion for a better name?

Thanks,
Pierre-Eric



> Regards,
> Christian.
> 
>>
>> Signed-off-by: Pierre-Eric Pelloux-Prayer <pierre-eric.pelloux-prayer@amd.com>
>> ---
>>   drivers/gpu/drm/amd/amdgpu/amdgpu_cs.c    |  2 ++
>>   drivers/gpu/drm/amd/amdgpu/amdgpu_trace.h | 12 ++++++++++++
>>   2 files changed, 14 insertions(+)
>>
>> diff --git a/drivers/gpu/drm/amd/amdgpu/amdgpu_cs.c b/drivers/gpu/drm/amd/amdgpu/amdgpu_cs.c
>> index 6830892383c3..29e43a66d0d6 100644
>> --- a/drivers/gpu/drm/amd/amdgpu/amdgpu_cs.c
>> +++ b/drivers/gpu/drm/amd/amdgpu/amdgpu_cs.c
>> @@ -1402,6 +1402,8 @@ int amdgpu_cs_ioctl(struct drm_device *dev, void *data, struct drm_file *filp)
>>           return r;
>>       }
>> +    trace_amdgpu_cs_ioctl2(data);
>> +
>>       r = amdgpu_cs_pass1(&parser, data);
>>       if (r)
>>           goto error_fini;
>> diff --git a/drivers/gpu/drm/amd/amdgpu/amdgpu_trace.h b/drivers/gpu/drm/amd/amdgpu/amdgpu_trace.h
>> index e8ea1cfe7027..24e95560ede5 100644
>> --- a/drivers/gpu/drm/amd/amdgpu/amdgpu_trace.h
>> +++ b/drivers/gpu/drm/amd/amdgpu/amdgpu_trace.h
>> @@ -189,6 +189,18 @@ TRACE_EVENT(amdgpu_cs_ioctl,
>>                 __entry->seqno, __get_str(ring), __entry->num_ibs)
>>   );
>> +TRACE_EVENT(amdgpu_cs_ioctl2,
>> +        TP_PROTO(union drm_amdgpu_cs *cs),
>> +        TP_ARGS(cs),
>> +        TP_STRUCT__entry(
>> +                 __field(uint32_t, ctx_id)
>> +        ),
>> +        TP_fast_assign(
>> +               __entry->ctx_id = cs->in.ctx_id;
>> +        ),
>> +        TP_printk("context=%u", __entry->ctx_id)
>> +);
>> +
>>   TRACE_EVENT(amdgpu_sched_run_job,
>>           TP_PROTO(struct amdgpu_job *job),
>>           TP_ARGS(job),
> 
