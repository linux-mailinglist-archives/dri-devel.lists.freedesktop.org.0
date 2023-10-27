Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id E6F197D9B86
	for <lists+dri-devel@lfdr.de>; Fri, 27 Oct 2023 16:34:34 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 2A6D710E9BE;
	Fri, 27 Oct 2023 14:34:33 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from us-smtp-delivery-124.mimecast.com
 (us-smtp-delivery-124.mimecast.com [170.10.129.124])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 645A410E9BE
 for <dri-devel@lists.freedesktop.org>; Fri, 27 Oct 2023 14:34:31 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1698417270;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=K5sokQZCAq452GDyZ2Dqlvt2GWiPurBujB1LiUqRJs0=;
 b=LzwmUa3pu5YRWDa5gGoJlUGpPw219tCNKXfsRlxWeiuZOxl9Qt1j0yXTYAzgvyLcHMiAGq
 XVy1ZUX4A/Unkt4JHbDUrENvIbYEc9Hwlb/hTU7Qktr/vHajhtuSwIRhFoycj6bl+RgeKy
 GUtCS6l7jeA3C3yRlewt1XXjlkHg3KU=
Received: from mail-wr1-f72.google.com (mail-wr1-f72.google.com
 [209.85.221.72]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_256_GCM_SHA384) id
 us-mta-117-F_5kn27bPXKPx69fiqUZLQ-1; Fri, 27 Oct 2023 10:34:29 -0400
X-MC-Unique: F_5kn27bPXKPx69fiqUZLQ-1
Received: by mail-wr1-f72.google.com with SMTP id
 ffacd0b85a97d-32cef5f8af5so2208410f8f.1
 for <dri-devel@lists.freedesktop.org>; Fri, 27 Oct 2023 07:34:29 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1698417268; x=1699022068;
 h=content-transfer-encoding:in-reply-to:organization:from:references
 :cc:to:content-language:subject:user-agent:mime-version:date
 :message-id:x-gm-message-state:from:to:cc:subject:date:message-id
 :reply-to;
 bh=K5sokQZCAq452GDyZ2Dqlvt2GWiPurBujB1LiUqRJs0=;
 b=NxFdsr5cizZEaJgN+ryXlx5sDTjctMq7buIMOL/0HofeA8cJEQWHFLGplni3Q8ho+8
 Cg2K8IPl0ygGMOuV0IHXO05kXdo8t7myvo48UspdKRLMpoZmDjkzAkAFz6HZz8bEIZyN
 Gs7qOgEv21cn7tqiZWBHYIYdb4HD2+PWFLj7AkqmqxtDv+xWToFFbARqYL+UB8HeKgdo
 v3HxotsUfkayt11jq+O6JDwUkEMqa33IiYLWf2vUNujldGGBxHFeSq9fTzy8Fr0d91E0
 qFzBiUCYxJp8stZc8gw3xz3kdXRQSWSqlryka707SrzV4UwK4F8b0HgdmaTRSGgRppqY
 R/SA==
X-Gm-Message-State: AOJu0YynqDphVKlgLJuWps4K90OIA8rBo0eUeBHjVZd9j68I+jgN3UZa
 chdewl8QNBOkd29rRJCSsPm0sLpBMmuTN8PqBLihShq3tU0m0p2uMbMEAitMfQnzyZ3dcpRQwxX
 qN58aeYx6c0VVTP3fCnkP0aYOwe+PiARP6n5t
X-Received: by 2002:a5d:588f:0:b0:32f:7159:c5a with SMTP id
 n15-20020a5d588f000000b0032f71590c5amr2390256wrf.3.1698417267852; 
 Fri, 27 Oct 2023 07:34:27 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IGJL8QPnW6lUOAA5iB5kBnMmw4h1OwKHuUzPfK0GLI3XMENVubhIB2jpyXUy23cBmNfrvDAUg==
X-Received: by 2002:a5d:588f:0:b0:32f:7159:c5a with SMTP id
 n15-20020a5d588f000000b0032f71590c5amr2390205wrf.3.1698417267417; 
 Fri, 27 Oct 2023 07:34:27 -0700 (PDT)
Received: from ?IPV6:2a02:810d:4b3f:de9c:abf:b8ff:feee:998b?
 ([2a02:810d:4b3f:de9c:abf:b8ff:feee:998b])
 by smtp.gmail.com with ESMTPSA id
 i21-20020a05600c355500b00405959469afsm1799979wmq.3.2023.10.27.07.34.26
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Fri, 27 Oct 2023 07:34:27 -0700 (PDT)
Message-ID: <794f9b45-db0d-4261-aefe-7da2ad0ed3b7@redhat.com>
Date: Fri, 27 Oct 2023 16:34:26 +0200
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH drm-misc-next v3] drm/sched: implement dynamic job-flow
 control
To: Boris Brezillon <boris.brezillon@collabora.com>
References: <20231026161431.5934-1-dakr@redhat.com>
 <20231027091755.3635be36@collabora.com>
From: Danilo Krummrich <dakr@redhat.com>
Organization: RedHat
In-Reply-To: <20231027091755.3635be36@collabora.com>
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Language: en-US
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
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
Cc: matthew.brost@intel.com, linux-kernel@vger.kernel.org,
 dri-devel@lists.freedesktop.org, faith@gfxstrand.net, luben.tuikov@amd.com,
 christian.koenig@amd.com
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

On 10/27/23 09:17, Boris Brezillon wrote:
> Hi Danilo,
> 
> On Thu, 26 Oct 2023 18:13:00 +0200
> Danilo Krummrich <dakr@redhat.com> wrote:
> 
>> +
>> +	/**
>> +	 * @update_job_credits: Called once the scheduler is considering this
>> +	 * job for execution.
>> +	 *
>> +	 * Drivers may use this to update the job's submission credits, which is
>> +	 * useful to e.g. deduct the number of native fences which have been
>> +	 * signaled meanwhile.
>> +	 *
>> +	 * The callback must either return the new number of submission credits
>> +	 * for the given job, or zero if no update is required.
>> +	 *
>> +	 * This callback is optional.
>> +	 */
>> +	u32 (*update_job_credits)(struct drm_sched_job *sched_job);
> 
> I'm copying my late reply to v2 here so it doesn't get lost:
> 
> I keep thinking it'd be simpler to make this a void function that
> updates s_job->submission_credits directly. I also don't see the
> problem with doing a sanity check on job->submission_credits. I mean,
> if the driver is doing something silly, you can't do much to prevent it
> anyway, except warn the user that something wrong has happened. If you
> want to
> 
> 	WARN_ON(job->submission_credits == 0 ||
> 		job->submission_credits > job_old_submission_credits);
> 
> that's fine. But none of this sanity checking has to do with the
> function prototype/semantics, and I'm still not comfortable with this 0
> => no-change. If there's no change, we should just leave
> job->submission_credits unchanged (or return job->submission_credits)
> instead of inventing a new special case.

If we can avoid letting drivers change fields of generic structures directly
without any drawbacks I think we should avoid it. Currently, drivers shouldn't
have the need to mess with job->credits directly. The initial value is set
through drm_sched_job_init() and is updated through the return value of
update_job_credits().

I'm fine getting rid of the 0 => no-change semantics though. Instead we can just
WARN() on 0. However, if we do that I'd also want to change it for
drm_sched_job_init() (where 0 currently defaults to 1) such that we accept 0, but
WARN() accordingly.

I think it's consequent to either consistently give 0 a different meaning or just
accept it but WARN() on it.

> 
> Regards,
> 
> Boris
> 

