Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id B3841BD9370
	for <lists+dri-devel@lfdr.de>; Tue, 14 Oct 2025 14:05:50 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id DD1A710E5D6;
	Tue, 14 Oct 2025 12:05:48 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=ursulin-net.20230601.gappssmtp.com header.i=@ursulin-net.20230601.gappssmtp.com header.b="pQ4BZb4F";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-wm1-f49.google.com (mail-wm1-f49.google.com
 [209.85.128.49])
 by gabe.freedesktop.org (Postfix) with ESMTPS id A2E1A10E5D6
 for <dri-devel@lists.freedesktop.org>; Tue, 14 Oct 2025 12:05:47 +0000 (UTC)
Received: by mail-wm1-f49.google.com with SMTP id
 5b1f17b1804b1-46e48d6b95fso46149265e9.3
 for <dri-devel@lists.freedesktop.org>; Tue, 14 Oct 2025 05:05:47 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=ursulin-net.20230601.gappssmtp.com; s=20230601; t=1760443546; x=1761048346;
 darn=lists.freedesktop.org; 
 h=content-transfer-encoding:in-reply-to:from:content-language
 :references:cc:to:subject:user-agent:mime-version:date:message-id
 :from:to:cc:subject:date:message-id:reply-to;
 bh=6/oH008OmOSILGStPOvECv9JZ5uFtkPz/y1ZNR7iEvs=;
 b=pQ4BZb4FM2Q3G7QA0VUnNmhNYlpaM9uWJsWzpYT0oYx7CD0OzgcAaLXtORcoDlAbgw
 Lx9l7GTlg/oufYNzCYvpRBYGzTRs3lD9+BCdOEUgGwpHzJB+9LjYZpp+ZhgUsNc+F1g9
 k2vZ0MWVlYG6N8lI1S3LclBOtdIIFQX+dgWNl2fpP2ESGAb0uT/b2P7K0HlTI9fK+Df9
 OXqexrTIppBch4s1wX0Stdwu/qVQy0zhoTHKXK46Y5lOxpFldLlARIBcWMEr/mltR63n
 plJDx2irwSXlHLZgrYU5IjodmsIjV5NSBzak9U0n2CQVccSrixy3x+++kSW7b8P40DVC
 /Xsg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1760443546; x=1761048346;
 h=content-transfer-encoding:in-reply-to:from:content-language
 :references:cc:to:subject:user-agent:mime-version:date:message-id
 :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
 bh=6/oH008OmOSILGStPOvECv9JZ5uFtkPz/y1ZNR7iEvs=;
 b=eQvy58QZUi2kLslvELRCgOntMovaNvEaMLJw2pfI2ybCWpS1eXwN76/lpgYLZXBUS/
 TUFKEEHIBRWFfPDEHIfeIhw5ZaK9quuCK5H74PVC6roS+2LlmqXyakSQHz7x62uZmRM4
 7ASrBZx8Ohn8u25O1Cqt06YMJANbU6HVdZhkg56oTpFknq5nUa4vesiYGikevcIOtOlA
 tOIilkmCXqQLd/F8o3/zS6HLE39x5JPpt5QBvgmtCtZWoF02J/N84dFK+SjvDtahS+9d
 EkCvSlRjhgh06R6BCOslTPed7OhvuO90SiI6v7ZGNIfkiW/1dbKFMQe1k/z3G4M/WboO
 HNhw==
X-Gm-Message-State: AOJu0Ywi5pwvm5zFkVLck6XgEeY8Ibbar51Db0Ls+A9MLl9LDiKcDEZt
 3t+35RZuLuXJbMWaPbvhx+x/REUGn0GUC7xv8o97MfyxpMmANdbUB5Eb2FT6OvFg/yY=
X-Gm-Gg: ASbGncu4sXX6+Wy1y3y+bZoxDfcO6FSal4kKS3RQh87flqaZJFjGLodBXv5hZxR9sNM
 ZPIShxTtRMHs0TsjWmCvy6f8cCstzqr8ZFwRFwgN7EEuje1MytDYkniVGvoXJjaoI4cJUEztMmR
 iZAke1Cuyo/Vf7eYqGJQ434aey/Nt0S8+e/x0+bnfkhwiMffjBxom1zWKJX43gr0w+j6CjcXgxn
 ChQhG/18uIjUOu2Repj4NYRozhZAUJOo7fnjgxIs2HEDd7qQQ/JbEh11qa6eg6sxYru5AWPqCIF
 jXSORnul386WsKzgb1SfNikzSj2NAUBXpoYXSFoX6xQm8aqncJiZcou+uHBywgTJVSTQNDMOThq
 8eNTNBmyQ1sOumR84yxeSp140G+alwHUWlJI6bl8dJcBe4prK9+IyrIFG
X-Google-Smtp-Source: AGHT+IG+ox4uHFRDU2PjORRa/c0JlDTsp8OFc8jbQP/kBh/MC7IhgPjotuh6KpbBz03C2S8qtojjLQ==
X-Received: by 2002:a5d:5c8a:0:b0:3eb:a237:a051 with SMTP id
 ffacd0b85a97d-4267b3395acmr16245681f8f.58.1760443545906; 
 Tue, 14 Oct 2025 05:05:45 -0700 (PDT)
Received: from [192.168.0.101] ([90.242.12.242])
 by smtp.gmail.com with ESMTPSA id
 ffacd0b85a97d-426ce582a9csm23425448f8f.12.2025.10.14.05.05.45
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Tue, 14 Oct 2025 05:05:45 -0700 (PDT)
Message-ID: <dfda6c38-fcd2-4d94-b9cd-c51972f40106@ursulin.net>
Date: Tue, 14 Oct 2025 13:05:44 +0100
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH] drm/sched: Mandate usage of drm_sched_job_cleanup()
To: phasta@kernel.org, Matthew Brost <matthew.brost@intel.com>,
 Danilo Krummrich <dakr@kernel.org>,
 =?UTF-8?Q?Christian_K=C3=B6nig?= <ckoenig.leichtzumerken@gmail.com>
Cc: dri-devel@lists.freedesktop.org, linux-kernel@vger.kernel.org
References: <20250926123630.200920-2-phasta@kernel.org>
 <1490c292-c244-4dd9-80a6-3fecd0ffb422@ursulin.net>
 <87f93819aed4784b3e280af38bd7b447821873f5.camel@mailbox.org>
Content-Language: en-GB
From: Tvrtko Ursulin <tursulin@ursulin.net>
In-Reply-To: <87f93819aed4784b3e280af38bd7b447821873f5.camel@mailbox.org>
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


On 14/10/2025 12:56, Philipp Stanner wrote:
> On Mon, 2025-10-13 at 13:20 +0100, Tvrtko Ursulin wrote:
>>
>> On 26/09/2025 13:36, Philipp Stanner wrote:
>>> drm_sched_job_cleanup()'s documentation so far uses relatively soft
>>> language, only "recommending" usage of the function. To avoid memory
>>> leaks and, potentiall, other bugs, however, the function has to be used.
>>>
>>> Demand usage of the function explicitly.
>>>
>>> Signed-off-by: Philipp Stanner <phasta@kernel.org>
>>> ---
>>>    drivers/gpu/drm/scheduler/sched_main.c | 4 ++--
>>>    1 file changed, 2 insertions(+), 2 deletions(-)
>>>
>>> diff --git a/drivers/gpu/drm/scheduler/sched_main.c b/drivers/gpu/drm/scheduler/sched_main.c
>>> index 46119aacb809..0a9df9e61963 100644
>>> --- a/drivers/gpu/drm/scheduler/sched_main.c
>>> +++ b/drivers/gpu/drm/scheduler/sched_main.c
>>> @@ -1030,7 +1030,7 @@ EXPORT_SYMBOL(drm_sched_job_has_dependency);
>>>     *
>>>     * Cleans up the resources allocated with drm_sched_job_init().
>>>     *
>>> - * Drivers should call this from their error unwind code if @job is aborted
>>> + * Drivers need to call this from their error unwind code if @job is aborted
>>
>> Should is indeed wrong. I think it could be better to go with "shall" or
>> "must" though. Since those two are more standard language for this.
> 
> "need to" is standard UK(?) English for "must to" I think.
> 
> But I'm fine with "must"

Yeah will is standard English and IMO understandable. I was just 
thinking whether it would best to stick to the established "requirements 
language". For example:

https://www.nasa.gov/reference/appendix-c-how-to-write-a-good-requirement/

https://argondigital.com/blog/product-management/using-the-correct-terms-shall-will-should/

https://reqi.io/articles/shall-vs-should-vs-will-vs-must-whats-the-difference

But I am okay with need, your call.
>>>     * before drm_sched_job_arm() is called.
>>>     *
>>>     * drm_sched_job_arm() is a point of no return since it initializes the fences
>>> @@ -1038,7 +1038,7 @@ EXPORT_SYMBOL(drm_sched_job_has_dependency);
>>>     * submit it with drm_sched_entity_push_job() and cannot simply abort it by
>>>     * calling drm_sched_job_cleanup().
>>>     *
>>> - * This function should be called in the &drm_sched_backend_ops.free_job callback.
>>> + * This function must be called in the &drm_sched_backend_ops.free_job callback.
>>>     */
>>>    void drm_sched_job_cleanup(struct drm_sched_job *job)
>>>    {
>>
>> Hm, having read the thread so far the situation seems not so easy to
>> untangle.
>>
>> On one hand I see Matt's point that free_job callback is a bit
>> misleadingly named and that there isn't anything really requiring
>> drm_sched_job_cleanup() to be called exactly from there. Free_job
>> semantics seem to be "job is done, *scheduler* is done with it".
>>
>> Drm_sched_job_cleanup() already says it has to be called after the point
>> of no return (arm) so it could be left at drivers discretion (de facto
>> state today) to choose how and when to do it.
>>
>> What I did not get is what is actually the perceived problem with
>> letting this stay? (Ie. "should" indicating it is recommended, but not a
>> must/shall.)
> 
> I think the most correct formulation with our current mess would be
> "cleanup() must be called earliest in free_job(), or later (if there is
> a very good reason for that)."
> 
> Question would be how to document that.
> 
> I still have that big life time docu patch pending. Let me dig into how
> I could combine that..

Ok.

Regards,

Tvrtko

