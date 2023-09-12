Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 29AE979D6D3
	for <lists+dri-devel@lfdr.de>; Tue, 12 Sep 2023 18:52:47 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 5271F10E444;
	Tue, 12 Sep 2023 16:52:45 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from us-smtp-delivery-124.mimecast.com
 (us-smtp-delivery-124.mimecast.com [170.10.129.124])
 by gabe.freedesktop.org (Postfix) with ESMTPS id C904510E23E
 for <dri-devel@lists.freedesktop.org>; Tue, 12 Sep 2023 16:52:42 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1694537562;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=7zPLZB5PmMWR9I/7dDRtLQmWaAF03lmMzfEQ6taGyD4=;
 b=O4097l6MLjysrSZKq0yEnze2MiQhhSZq4juQAg7H60v40YgxdoOLCYfwxFnvgRLQCihgXo
 eacf88WnC3Il9rD1bgqTIPBc0QL3+W3Y33vGjq3jGJe36n1nZbFDjbPwxtk/MImGDmIQAY
 VHPOYReJaQt85a+b/24wcgNA0hxLHsE=
Received: from mail-ed1-f69.google.com (mail-ed1-f69.google.com
 [209.85.208.69]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_256_GCM_SHA384) id
 us-mta-529-K28yMngyMAe6qevIUknC3A-1; Tue, 12 Sep 2023 12:52:40 -0400
X-MC-Unique: K28yMngyMAe6qevIUknC3A-1
Received: by mail-ed1-f69.google.com with SMTP id
 4fb4d7f45d1cf-52310058f1eso49177a12.0
 for <dri-devel@lists.freedesktop.org>; Tue, 12 Sep 2023 09:52:39 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1694537558; x=1695142358;
 h=content-transfer-encoding:in-reply-to:organization:from:references
 :cc:to:content-language:subject:user-agent:mime-version:date
 :message-id:x-gm-message-state:from:to:cc:subject:date:message-id
 :reply-to;
 bh=7zPLZB5PmMWR9I/7dDRtLQmWaAF03lmMzfEQ6taGyD4=;
 b=OL7vwbIpXD+cM5/9rFkO5nSujjhMBDMS3MwjNZEygrgyQjd6jTfJNRUV3PBZx6bfSd
 FiZHuzpBmg8R8SpBqDJPgjFYKu2X9Dri/KP9WNXifQxhTA8EXEdi9+byL9icITrBTa1c
 LTdROhc5hcU8rhdEbIOFYRkwm1Qtdz2z4ZU3/kqQWQYZBBEGUrmUN9he10yAsq3c2K2i
 aRQke+f59wK5+BG6+X0tWs/BWu+aqvqBSVUGIAD42zawCdJabVScZD8pNbBSM38uY43d
 8cZym6nQsOvse1tNvew4VevfuYVHZHSobZjVxKwys6z1ht0rMpxq7+0lgxZFncVMcZdT
 1Klg==
X-Gm-Message-State: AOJu0Yw4zh7uqGZK3/ZL/HpiKxpnWryfJ+3SGnh25nNtV/i16U1NgM/3
 r1HAR5sjUBepuwMdA0ARj9vah71fLOPH2Xn38kbp+Zs4NGHBYsdNpfVwELBqSlpqC0IN+zo9vrP
 tI815WBKW0TDlIJNv3u/C2EiBzI4F
X-Received: by 2002:aa7:d94e:0:b0:523:100b:70da with SMTP id
 l14-20020aa7d94e000000b00523100b70damr321311eds.4.1694537558748; 
 Tue, 12 Sep 2023 09:52:38 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IF/fKwHHtaf3bLzcsJ/fWWK9WZEL+c4ZJMKlVWzRqfsmLvJ3IcymQbwU6J8H4V6UsKPXl7UMQ==
X-Received: by 2002:aa7:d94e:0:b0:523:100b:70da with SMTP id
 l14-20020aa7d94e000000b00523100b70damr321272eds.4.1694537558409; 
 Tue, 12 Sep 2023 09:52:38 -0700 (PDT)
Received: from ?IPV6:2a02:810d:4b3f:de9c:642:1aff:fe31:a15c?
 ([2a02:810d:4b3f:de9c:642:1aff:fe31:a15c])
 by smtp.gmail.com with ESMTPSA id
 r25-20020aa7d599000000b005256d80cdaesm6088570edq.65.2023.09.12.09.52.36
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Tue, 12 Sep 2023 09:52:37 -0700 (PDT)
Message-ID: <2982d2c1-99e2-03a4-7b54-e57471394bd3@redhat.com>
Date: Tue, 12 Sep 2023 18:52:36 +0200
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.13.0
Subject: Re: [PATCH v2 1/9] drm/sched: Convert drm scheduler to use a work
 queue rather than kthread
To: Boris Brezillon <boris.brezillon@collabora.com>
References: <20230811023137.659037-1-matthew.brost@intel.com>
 <20230811023137.659037-2-matthew.brost@intel.com>
 <69b648f8-c6b3-5846-0d03-05a380d010d8@redhat.com>
 <069e6cd0-abd3-fdd9-217d-173e8f8e1d29@amd.com>
 <b9a6493c-243b-1078-afbc-d9270cac904a@redhat.com>
 <982800c1-e7d3-f276-51d0-1a431f92eacb@amd.com>
 <5fdf7d59-3323-24b5-a35a-bd60b06b4ce5@redhat.com>
 <0bf839df-db7f-41fa-8b34-59792d2ba8be@amd.com>
 <e8fa305a-0ac8-ece7-efeb-f9cec2892d44@redhat.com>
 <20230912162838.34135959@collabora.com>
 <ef8f493b-212a-3a97-bb37-28d6fb2623a4@redhat.com>
 <20230912164909.018d13c8@collabora.com>
From: Danilo Krummrich <dakr@redhat.com>
Organization: RedHat
In-Reply-To: <20230912164909.018d13c8@collabora.com>
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
Cc: Matthew Brost <matthew.brost@intel.com>, robdclark@chromium.org,
 sarah.walker@imgtec.com, thomas.hellstrom@linux.intel.com,
 ketil.johnsen@arm.com, lina@asahilina.net, Liviu.Dudau@arm.com,
 dri-devel@lists.freedesktop.org, intel-xe@lists.freedesktop.org,
 luben.tuikov@amd.com, donald.robson@imgtec.com,
 =?UTF-8?Q?Christian_K=c3=b6nig?= <christian.koenig@amd.com>,
 faith.ekstrand@collabora.com
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

On 9/12/23 16:49, Boris Brezillon wrote:
> On Tue, 12 Sep 2023 16:33:01 +0200
> Danilo Krummrich <dakr@redhat.com> wrote:
> 
>> On 9/12/23 16:28, Boris Brezillon wrote:
>>> On Thu, 17 Aug 2023 13:13:31 +0200
>>> Danilo Krummrich <dakr@redhat.com> wrote:
>>>    
>>>> I think that's a misunderstanding. I'm not trying to say that it is
>>>> *always* beneficial to fill up the ring as much as possible. But I think
>>>> it is under certain circumstances, exactly those circumstances I
>>>> described for Nouveau.
>>>>
>>>> As mentioned, in Nouveau the size of a job is only really limited by the
>>>> ring size, which means that one job can (but does not necessarily) fill
>>>> up the whole ring. We both agree that this is inefficient, because it
>>>> potentially results into the HW run dry due to hw_submission_limit == 1.
>>>>
>>>> I recognize you said that one should define hw_submission_limit and
>>>> adjust the other parts of the equation accordingly, the options I see are:
>>>>
>>>> (1) Increase the ring size while keeping the maximum job size.
>>>> (2) Decrease the maximum job size while keeping the ring size.
>>>> (3) Let the scheduler track the actual job size rather than the maximum
>>>> job size.
>>>>
>>>> (1) results into potentially wasted ring memory, because we're not
>>>> always reaching the maximum job size, but the scheduler assumes so.
>>>>
>>>> (2) results into more IOCTLs from userspace for the same amount of IBs
>>>> and more jobs result into more memory allocations and more work being
>>>> submitted to the workqueue (with Matt's patches).
>>>>
>>>> (3) doesn't seem to have any of those draw backs.
>>>>
>>>> What would be your take on that?
>>>>
>>>> Actually, if none of the other drivers is interested into a more precise
>>>> way of keeping track of the ring utilization, I'd be totally fine to do
>>>> it in a driver specific way. However, unfortunately I don't see how this
>>>> would be possible.
>>>
>>> I'm not entirely sure, but I think PowerVR is pretty close to your
>>> description: jobs size is dynamic size, and the ring buffer size is
>>> picked by the driver at queue initialization time. What we did was to
>>> set hw_submission_limit to an arbitrarily high value of 64k (we could
>>> have used something like ringbuf_size/min_job_size instead), and then
>>> have the control flow implemented with ->prepare_job() [1] (CCCB is the
>>> PowerVR ring buffer). This allows us to maximize ring buffer utilization
>>> while still allowing dynamic-size jobs.
>>
>> I guess this would work, but I think it would be better to bake this in,
>> especially if more drivers do have this need. I already have an
>> implementation [1] for doing that in the scheduler. My plan was to push
>> that as soon as Matt sends out V3.
>>
>> [1] https://gitlab.freedesktop.org/nouvelles/kernel/-/commit/269f05d6a2255384badff8b008b3c32d640d2d95
> 
> PowerVR's ->can_fit_in_ringbuf() logic is a bit more involved in that
> native fences waits are passed to the FW, and those add to the job size.
> When we know our job is ready for execution (all non-native deps are
> signaled), we evict already signaled native-deps (or native fences) to
> shrink the job size further more, but that's something we need to
> calculate late if we want the job size to be minimal. Of course, we can
> always over-estimate the job size, but if we go for a full-blown
> drm_sched integration, I wonder if it wouldn't be preferable to have a
> ->get_job_size() callback returning the number of units needed by job,
> and have the core pick 1 when the hook is not implemented.
> 

Sure, why not. Sounds reasonable to me.

