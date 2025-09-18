Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id DB4BEB8326B
	for <lists+dri-devel@lfdr.de>; Thu, 18 Sep 2025 08:34:39 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id E609510E087;
	Thu, 18 Sep 2025 06:34:36 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="Ixof8ZDG";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.13])
 by gabe.freedesktop.org (Postfix) with ESMTPS id A4AE410E087
 for <dri-devel@lists.freedesktop.org>; Thu, 18 Sep 2025 06:34:35 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1758177276; x=1789713276;
 h=message-id:date:mime-version:subject:to:cc:references:
 from:in-reply-to:content-transfer-encoding;
 bh=1UH9AfXWLSomUFoW9Bx5BezO319EA/nKg8kPubc3csg=;
 b=Ixof8ZDGcj3JLz8YNjg4Uk9cI8Ed3oF7Jo0XWqUdxjzhLsfxrjj8Pj4x
 +NU+w21926RAQ2X1bYxNg/t0X/IlmHbUk6T0Q40yvgHcydbb3SXu+lOWq
 Rc5d20wuKK5sz5eOF/3sK0c/hAb/YJwninh3kXM0MC0aasJ8RiOgnfvyh
 xxzst4GZYzAENtksCb1M2vcsTAHskBI4t+7l8qwbHYU6BPAKZuYrQpChs
 bHmSeMeIMXLn/mh1CTY2reKF4Npxu6s3O98kjdyinb0IkoJH2/dPZXJAd
 xTNZtr8MKGcezF4EAzDXGBD8+JosXN1cZJyhGAyJxCKrEUpOltHo2OLbu g==;
X-CSE-ConnectionGUID: 1iDoVLBPTIeRWZMODjY2Gg==
X-CSE-MsgGUID: 5mbt/J1+Q9KiBZRdAUYNPA==
X-IronPort-AV: E=McAfee;i="6800,10657,11556"; a="71600008"
X-IronPort-AV: E=Sophos;i="6.18,274,1751266800"; d="scan'208";a="71600008"
Received: from orviesa003.jf.intel.com ([10.64.159.143])
 by orvoesa105.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 17 Sep 2025 23:34:36 -0700
X-CSE-ConnectionGUID: dLiINjtPTTaZ7TNKI+BFmQ==
X-CSE-MsgGUID: 5I7Vv8KMQg63U7u43TttFg==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.18,274,1751266800"; d="scan'208";a="179455336"
Received: from kwachows-mobl.ger.corp.intel.com (HELO [10.245.255.10])
 ([10.245.255.10])
 by ORVIESA003-auth.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 17 Sep 2025 23:34:34 -0700
Message-ID: <18af5cde-1a4c-4879-bcc2-b3d117f8a4ce@linux.intel.com>
Date: Thu, 18 Sep 2025 08:34:31 +0200
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v1] accel/ivpu: Ensure rpm_runtime_put in case of engine
 reset/resume fail
To: Lizhi Hou <lizhi.hou@amd.com>, dri-devel@lists.freedesktop.org
Cc: oded.gabbay@gmail.com, jeff.hugo@oss.qualcomm.com,
 maciej.falkowski@linux.intel.com
References: <20250916084809.850073-1-karol.wachowski@linux.intel.com>
 <fc2bacc5-4cc8-bfc0-dc26-449da5a28c6e@amd.com>
Content-Language: en-US
From: Karol Wachowski <karol.wachowski@linux.intel.com>
Organization: Intel Technology Poland sp. z o.o. - ul. Slowackiego 173, 80-298
 Gdansk - KRS 101882 - NIP 957-07-52-316
In-Reply-To: <fc2bacc5-4cc8-bfc0-dc26-449da5a28c6e@amd.com>
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

Applied to drm-misc-next

On 9/16/2025 5:22 PM, Lizhi Hou wrote:
> Reviewed-by: Lizhi Hou <lizhi.hou@amd.com>
>
> On 9/16/25 01:48, Karol Wachowski wrote:
>> Previously, aborting work could return early after engine reset or
>> resume
>> failure, skipping the necessary runtime_put cleanup leaving the device
>> with incorrect reference count breaking runtime power management state.
>>
>> Replace early returns with goto statements to ensure runtime_put is
>> always
>> executed.
>>
>> Fixes: a47e36dc5d90 ("accel/ivpu: Trigger device recovery on engine
>> reset/resume failure")
>> Signed-off-by: Karol Wachowski <karol.wachowski@linux.intel.com>
>> ---
>> v0 -> v1:
>> Added 'Fixes:' tag.
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
