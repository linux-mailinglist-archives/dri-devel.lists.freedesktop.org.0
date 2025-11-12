Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id C83EAC5166B
	for <lists+dri-devel@lfdr.de>; Wed, 12 Nov 2025 10:42:19 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id C0B2C10E1C2;
	Wed, 12 Nov 2025 09:42:17 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=ursulin.net header.i=@ursulin.net header.b="CEKxbElq";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-wm1-f44.google.com (mail-wm1-f44.google.com
 [209.85.128.44])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 16EB810E1C2
 for <dri-devel@lists.freedesktop.org>; Wed, 12 Nov 2025 09:42:16 +0000 (UTC)
Received: by mail-wm1-f44.google.com with SMTP id
 5b1f17b1804b1-471191ac79dso5724575e9.3
 for <dri-devel@lists.freedesktop.org>; Wed, 12 Nov 2025 01:42:16 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=ursulin.net; s=google; t=1762940534; x=1763545334; darn=lists.freedesktop.org;
 h=content-transfer-encoding:in-reply-to:from:content-language
 :references:cc:to:subject:user-agent:mime-version:date:message-id
 :from:to:cc:subject:date:message-id:reply-to;
 bh=non7jFyDgpV9ioaJdY/PWd6esrFFlJ4jS7hnF3MLWcI=;
 b=CEKxbElqAmSm+xujM2W4vQzD/ipCAuXvY7WRoqVgE/fFmeRnUaMO0TDZCZ3wCDSx9n
 IULc1mRp8KBI6JRKuJ3UkVE95NPBBJST5tHiXPpY8NIl+hRaWzWXhDRTk8VQrZI9e1cz
 NsL9YZ9V/NxvF+yF8N65x7kWxnsgvIOJ5C+lHkeLjtBYo7DR6XTJrcn/bIuXZDLVS9Y/
 m7RAcbFqrcxh+k+GVsNOrX4r7fP5tDG/onkSVdehg70mH7iuKHgCEIXLxsPz3mZl/ESD
 b5G4VRDMHJjKiam8MXN3+vM4Anq4r7xvSIMsrOrRhrdX4hv6+aw2N0xpYWISFmMpfeb7
 jwcg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1762940534; x=1763545334;
 h=content-transfer-encoding:in-reply-to:from:content-language
 :references:cc:to:subject:user-agent:mime-version:date:message-id
 :x-gm-gg:x-gm-message-state:from:to:cc:subject:date:message-id
 :reply-to;
 bh=non7jFyDgpV9ioaJdY/PWd6esrFFlJ4jS7hnF3MLWcI=;
 b=Rxh/7FXjRs36hklBG4C6mU+d9aYBtX3nBn6wSover0fKk/yY53OWKYX7tzUCprFA5T
 CxQZRZZ4rgkrkXHs6V92mntnh6gZ6L6rqDb5KG2GkHeH3U5nFQANBkcKWgS94MwGwpeh
 nOyHNRjH97/znzo60UiZ9d6WH9NJ7caPr72G8IpM+99gORBVUH9JIhZC+zQh0Y8d8RHp
 U7A3U/5M76OAKdzyRZxdl2zqH4G1RGzT5YDjTLCVC3uwZj4/3WkgnDib/LSvEcahhzFt
 TvbGPxScNzYDEHIz7zVsHCS9K7XdVRAwQj22PoQ2GpY6dBFnmkbjK5U57Y8jysfm412D
 VYKQ==
X-Gm-Message-State: AOJu0YySgzViRGTz3qMVqrX55vLCvB+eYXuv8fpQKsrtGkn/G5gJz8ir
 o0ttC9NcqJVPZXSxcKKS1UNP9aPBHCSVDA7Hbv1xL4szKOZn6dVZlTT1I6CWT3Wpw2A=
X-Gm-Gg: ASbGncv/ZRPMU1+Q2nrW740TmtGh+sKr5iDD+Yd4K5/S+nnmpbA3I0cWeirz6gbBXc+
 jAm1KN0CmUSiYDXu1DlU47ezDIApcwy+qaCArXCFCy83sKlnVWvSlrJSXzGYXzuaxRRE34sNCaf
 3gxJwXGEphhw0pistwJ9B9u6fKkBS5iT9O+QEfW5RZMZNilgkfBKKY0DISi/9jXipvvibB62rqh
 hP4zfGGmpMlWFgd4nq21+NtfMBOVId6VQoz18LOCgtsZpezuJdhXBj06B3/RkPr9jqdhkFM2Guh
 pj37i23Vz5/4rS2gpMdwkMJ3WMnjSFgnUXzHlZP692DHcdZafxRto1wjevEAyKaRD4tV4UQv/Da
 9twQ/a4RlhgTgtoMUGSO4MrAiVBN4EsKNSN1DceBMUc+iHGaSZfi8/dNUEaoS5ju6JzCULwrkI3
 UNZ+vzrcAYGBlSoeVUTY4nozcZpzkOoJr2
X-Google-Smtp-Source: AGHT+IEUD7F/bL8359XxwqylO1O60OBLZSd4tmhEK3pFqGhIuhFA3c+ouW/g75Uh+RBAA2Oa4hCSZA==
X-Received: by 2002:a05:600c:1c08:b0:475:df91:de03 with SMTP id
 5b1f17b1804b1-477870b67d1mr22341115e9.39.1762940534598; 
 Wed, 12 Nov 2025 01:42:14 -0800 (PST)
Received: from [192.168.0.101] ([90.240.106.137])
 by smtp.gmail.com with ESMTPSA id
 5b1f17b1804b1-47787e486fbsm25160545e9.5.2025.11.12.01.42.14
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Wed, 12 Nov 2025 01:42:14 -0800 (PST)
Message-ID: <e9c02871-fa80-46c7-8b96-bad3a6a2c5b9@ursulin.net>
Date: Wed, 12 Nov 2025 09:42:13 +0000
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH] drm/sched: Document racy behavior of
 drm_sched_entity_push_job()
To: Philipp Stanner <phasta@kernel.org>,
 Matthew Brost <matthew.brost@intel.com>,
 =?UTF-8?Q?Christian_K=C3=B6nig?= <ckoenig.leichtzumerken@gmail.com>,
 Maarten Lankhorst <maarten.lankhorst@linux.intel.com>
Cc: dri-devel@lists.freedesktop.org, linux-kernel@vger.kernel.org
References: <20251112073138.93355-2-phasta@kernel.org>
Content-Language: en-GB
From: Tvrtko Ursulin <tursulin@ursulin.net>
In-Reply-To: <20251112073138.93355-2-phasta@kernel.org>
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
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>


On 12/11/2025 07:31, Philipp Stanner wrote:
> drm_sched_entity_push_job() uses the unlocked spsc_queue. It takes a
> reference to that queue's tip at the start, and some time later removes
> that entry from that list, without locking or protection against
> preemption.

I couldn't figure out what you refer to by tip reference at the start, 
and later removes it. Are you talking about the top level view from 
drm_sched_entity_push_job() or where exactly?
> This is by design, since the spsc_queue demands single producer and
> single consumer. It was, however, never documented.
> 
> Document that you must not call drm_sched_entity_push_job() in parallel
> for the same entity.
> 
> Signed-off-by: Philipp Stanner <phasta@kernel.org>
> ---
>   drivers/gpu/drm/scheduler/sched_entity.c | 3 +++
>   1 file changed, 3 insertions(+)
> 
> diff --git a/drivers/gpu/drm/scheduler/sched_entity.c b/drivers/gpu/drm/scheduler/sched_entity.c
> index 5a4697f636f2..b31e8d14aa20 100644
> --- a/drivers/gpu/drm/scheduler/sched_entity.c
> +++ b/drivers/gpu/drm/scheduler/sched_entity.c
> @@ -562,6 +562,9 @@ void drm_sched_entity_select_rq(struct drm_sched_entity *entity)
>    * drm_sched_entity_push_job - Submit a job to the entity's job queue
>    * @sched_job: job to submit
>    *
> + * It is illegal to call this function in parallel, at least for jobs belonging
> + * to the same entity. Doing so leads to undefined behavior.

One thing that is documented in the very next paragraph is that the 
design implies a lock held between arm and push. At least to ensure 
seqno order matches the queue order.

I did not get what other breakage you found, but I also previously did 
find something other than that. Hm.. if I could only remember what it 
was. Probably mine was something involving drm_sched_entity_select_rq(), 
drm_sched_entity_modify_sched() and (theoretical) multi-threaded 
userspace submit on the same entity. Luckily it seems no one does that.

The issue you found is separate and not theoretically fixed by this 
hypothetical common lock held over arm and push?

Regards,

Tvrtko

> + *
>    * Note: To guarantee that the order of insertion to queue matches the job's
>    * fence sequence number this function should be called with drm_sched_job_arm()
>    * under common lock for the struct drm_sched_entity that was set up for

