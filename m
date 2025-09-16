Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 4FFD0B59145
	for <lists+dri-devel@lfdr.de>; Tue, 16 Sep 2025 10:49:00 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 9C0EE10E723;
	Tue, 16 Sep 2025 08:48:58 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="ai+j8Fu5";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.14])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 42AF010E73D
 for <dri-devel@lists.freedesktop.org>; Tue, 16 Sep 2025 08:48:57 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1758012537; x=1789548537;
 h=message-id:date:mime-version:subject:to:cc:references:
 from:in-reply-to:content-transfer-encoding;
 bh=CajnTN1NXZJbzAfxAKDhMU5BdDomG6vRVHM5zkSh94c=;
 b=ai+j8Fu5YCsEKNleJcifTbFHCsHIhi2JHlLmKVTIZ5miYBfx6GXcoRNj
 IwbTp67RiEF50ty1501sk8nhJaKSuxQy4I4dRhNAhOW2hRfbQaQWv2dQ6
 zJhxctF3DIQuciuIqYjtshJdfCy80mdg8aP7lqTbgslK6IcfuZbFjt8vE
 vR/Lo1HkhTppA9MIqsY7LTljhxAiY9C6IlRSzqOC+jK8gcmnA2NcZdnQl
 XhTgSOCjf0hfTNUrFVLjoc37C6+/9CnNlDSoZPcyZjcO3gzw0NEmjB77l
 vV8VFXybSh6JpxcER4KawlKS7VwfCIJuumi6k+tZ/sXzpHGQJwIxQ2x38 Q==;
X-CSE-ConnectionGUID: cEe90BGtRXWo648znQx8pg==
X-CSE-MsgGUID: u0Hp1tO4QEeiLEKyTqbG5g==
X-IronPort-AV: E=McAfee;i="6800,10657,11531"; a="64091718"
X-IronPort-AV: E=Sophos;i="6.17,312,1747724400"; d="scan'208";a="64091718"
Received: from orviesa009.jf.intel.com ([10.64.159.149])
 by orvoesa106.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 16 Sep 2025 01:48:57 -0700
X-CSE-ConnectionGUID: uM378LG+TF+AHzV9loSSIg==
X-CSE-MsgGUID: eG7pt7t6SLax2JlXpf3EzA==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.18,268,1751266800"; d="scan'208";a="174431792"
Received: from unknown (HELO [10.102.88.152]) ([10.102.88.152])
 by orviesa009-auth.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 16 Sep 2025 01:48:56 -0700
Message-ID: <f1a2ba49-edb3-4336-a07e-750c7fa2bb3b@linux.intel.com>
Date: Tue, 16 Sep 2025 10:48:53 +0200
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH] accel/ivpu: Ensure rpm_runtime_put in case of engine
 reset/resume fail
To: Lizhi Hou <lizhi.hou@amd.com>, dri-devel@lists.freedesktop.org
Cc: oded.gabbay@gmail.com, jeff.hugo@oss.qualcomm.com,
 maciej.falkowski@linux.intel.com
References: <20250915103526.830130-1-karol.wachowski@linux.intel.com>
 <b0f6a51f-5a83-79d2-7046-3dada6bb61b8@amd.com>
Content-Language: en-US
From: Karol Wachowski <karol.wachowski@linux.intel.com>
Organization: Intel Technology Poland sp. z o.o. - ul. Slowackiego 173, 80-298
 Gdansk - KRS 101882 - NIP 957-07-52-316
In-Reply-To: <b0f6a51f-5a83-79d2-7046-3dada6bb61b8@amd.com>
Content-Type: text/plain; charset=UTF-8
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

Thanks, I've sent v1 version with added fixes tag.

Karol

On 9/15/2025 10:15 PM, Lizhi Hou wrote:
> This looks a bug fix. Is adding 'Fixes:' tag better?
>
> On 9/15/25 03:35, Karol Wachowski wrote:
>> Previously, aborting work could return early after engine reset or
>> resume
>> failure, skipping the necessary runtime_put cleanup leaving the device
>> with incorrect reference count breaking runtime power management state.
>>
>> Replace early returns with goto statements to ensure runtime_put is
>> always
>> executed.
>>
>> Signed-off-by: Karol Wachowski <karol.wachowski@linux.intel.com>
>> ---
>>   drivers/accel/ivpu/ivpu_job.c | 4 ++--
>>   1 file changed, 2 insertions(+), 2 deletions(-)
>>
>> diff --git a/drivers/accel/ivpu/ivpu_job.c
>> b/drivers/accel/ivpu/ivpu_job.c
>> index 521b7ac6e35e..044268d0fc87 100644
>> --- a/drivers/accel/ivpu/ivpu_job.c
>> +++ b/drivers/accel/ivpu/ivpu_job.c
>> @@ -1050,7 +1050,7 @@ void ivpu_context_abort_work_fn(struct
>> work_struct *work)
>>         if (vdev->fw->sched_mode == VPU_SCHEDULING_MODE_HW)
>>           if (ivpu_jsm_reset_engine(vdev, 0))
>> -            return;
>> +            goto runtime_put;
>>         mutex_lock(&vdev->context_list_lock);
>>       xa_for_each(&vdev->context_xa, ctx_id, file_priv) {
>> @@ -1074,7 +1074,7 @@ void ivpu_context_abort_work_fn(struct
>> work_struct *work)
>>           goto runtime_put;
>>         if (ivpu_jsm_hws_resume_engine(vdev, 0))
>> -        return;
>> +        goto runtime_put;
>>       /*
>>        * In hardware scheduling mode NPU already has stopped
>> processing jobs
>>        * and won't send us any further notifications, thus we have to
>> free job related resources
