Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id DB1A7A9E881
	for <lists+dri-devel@lfdr.de>; Mon, 28 Apr 2025 08:47:21 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 1314410E39F;
	Mon, 28 Apr 2025 06:47:20 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="Lw4LBAUe";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.16])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 3E84110E39F
 for <dri-devel@lists.freedesktop.org>; Mon, 28 Apr 2025 06:47:18 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1745822839; x=1777358839;
 h=message-id:date:mime-version:subject:to:cc:references:
 from:in-reply-to:content-transfer-encoding;
 bh=293dJiETy/MLYM2bKoXlmW2We/RInDpdUcocnMlVns4=;
 b=Lw4LBAUevd7XG8nPXli6YsExQy+zM/LZ9IchXEI9CsWHX/E7PGLMiojs
 mBj/BMOsSO5h9/LoPTWlQpWhmb2vgImmLjHzLwRUhK00MZwLODBs+riz4
 /wCVhzk2RdIVEP7OlDN9dMYcNMIHlVn8VQLRHHj76pzmCZq8HvrzS41VU
 jx5RR2SZ1eteWaixUNxaT2BiExtukf2TsYKdb0m6MOL6iPpcb7fhHYDX5
 pR+kgsAzSwVssZ3uzxXp/mJ2z0VORQXUJMgWS2iV39x4HNHEOvbbXOHOU
 Q45tjT+QO94yyD7nqtO/1/D6cHAutAuogIMU8RJs9fCA/6Hi1QTpxYH6j w==;
X-CSE-ConnectionGUID: pmUqi7j7RFK7I2DFdAazMg==
X-CSE-MsgGUID: sf13RAPZTIWlTqi0GNYygA==
X-IronPort-AV: E=McAfee;i="6700,10204,11416"; a="47487797"
X-IronPort-AV: E=Sophos;i="6.15,245,1739865600"; d="scan'208";a="47487797"
Received: from orviesa001.jf.intel.com ([10.64.159.141])
 by orvoesa108.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 27 Apr 2025 23:47:18 -0700
X-CSE-ConnectionGUID: C9qrGzPAQHykJbPtJKNSig==
X-CSE-MsgGUID: sZBKJVuOQ1KX6r7KJxXlhQ==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.15,245,1739865600"; d="scan'208";a="170652759"
Received: from smorozov-mobl1.ger.corp.intel.com (HELO [10.245.80.157])
 ([10.245.80.157])
 by smtpauth.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 27 Apr 2025 23:47:17 -0700
Message-ID: <92d4a66e-8df7-4852-b1b4-c42f167856b0@linux.intel.com>
Date: Mon, 28 Apr 2025 08:47:14 +0200
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH] accel/ivpu: Correct mutex unlock order in job submission
To: Jeff Hugo <jeff.hugo@oss.qualcomm.com>, dri-devel@lists.freedesktop.org
Cc: lizhi.hou@amd.com, Karol Wachowski <karol.wachowski@intel.com>
References: <20250425093656.2228168-1-jacek.lawrynowicz@linux.intel.com>
 <087563ac-bf33-4c80-a5fe-b4f2d155d9d1@oss.qualcomm.com>
Content-Language: en-US
From: Jacek Lawrynowicz <jacek.lawrynowicz@linux.intel.com>
Organization: Intel Technology Poland sp. z o.o. - ul. Slowackiego 173, 80-298
 Gdansk - KRS 101882 - NIP 957-07-52-316
In-Reply-To: <087563ac-bf33-4c80-a5fe-b4f2d155d9d1@oss.qualcomm.com>
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

Hi,

On 4/25/2025 7:22 PM, Jeff Hugo wrote:
> On 4/25/2025 3:36 AM, Jacek Lawrynowicz wrote:
>> From: Karol Wachowski <karol.wachowski@intel.com>
>>
>> The mutex unlock for vdev->submitted_jobs_lock was incorrectly placed
>> after unlocking file_priv->lock. Change order of unlocks to avoid potential
> 
> This should read "before unlocking", right?

Yes, I will correct the commit message after submitting this patch :)

>> race conditions.
>>
>> Fixes: 5bbccadaf33e ("accel/ivpu: Abort all jobs after command queue unregister")
>> Signed-off-by: Karol Wachowski <karol.wachowski@intel.com>
>> Signed-off-by: Jacek Lawrynowicz <jacek.lawrynowicz@linux.intel.com>
>> ---
>>   drivers/accel/ivpu/ivpu_job.c | 2 +-
>>   1 file changed, 1 insertion(+), 1 deletion(-)
>>
>> diff --git a/drivers/accel/ivpu/ivpu_job.c b/drivers/accel/ivpu/ivpu_job.c
>> index 863e3cd6ace51..540923ffcbf8d 100644
>> --- a/drivers/accel/ivpu/ivpu_job.c
>> +++ b/drivers/accel/ivpu/ivpu_job.c
>> @@ -681,8 +681,8 @@ static int ivpu_job_submit(struct ivpu_job *job, u8 priority, u32 cmdq_id)
>>   err_erase_xa:
>>       xa_erase(&vdev->submitted_jobs_xa, job->job_id);
>>   err_unlock:
>> -    mutex_unlock(&vdev->submitted_jobs_lock);
>>       mutex_unlock(&file_priv->lock);
>> +    mutex_unlock(&vdev->submitted_jobs_lock);
>>       ivpu_rpm_put(vdev);
>>       return ret;
>>   }
> 

