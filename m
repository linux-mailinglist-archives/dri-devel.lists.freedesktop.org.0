Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id F24BEA1B4F9
	for <lists+dri-devel@lfdr.de>; Fri, 24 Jan 2025 12:46:17 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id DA23910E953;
	Fri, 24 Jan 2025 11:46:14 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="Zm0GXWib";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.15])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 7914110E953;
 Fri, 24 Jan 2025 11:46:14 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1737719175; x=1769255175;
 h=from:to:cc:subject:in-reply-to:references:date:
 message-id:mime-version:content-transfer-encoding;
 bh=iV9HctNf/07u8VBRg7NP4rNexDlTY8VnUhsNByLQRfo=;
 b=Zm0GXWibGXK1TsBrtQXB12JsSrP3lofGfpGCGDsTpnfyVHNE8hTVM7ZA
 PRO4TcLqo9f8iWeFLaULPUwTzHUuXl0Zew3E8LTVfsRLLd4lld0CJwe+C
 w9+fA8xy6zLNKPR33i9HlwVmiJVIw3pEmwLl7muKkcP0LDxEw7oj5ZnSA
 rZpSLxC9ah7gC5lKI5xsupulWhq8XT3B2xv1/DKpWrWzgELgb8JvFw+PU
 mTwa7TolLBTpYb9M8qXTo2tzGlRtbcTcl7AMmFkuOyibhuylF667TKK8V
 FRY1N09R4ot90G6ppDwOCewaOPcuyNE97bTRU82/j7paw0dBZ8WGzFmwN Q==;
X-CSE-ConnectionGUID: fcftv1L0Sr6KOPkb7CZUTA==
X-CSE-MsgGUID: Uhl5Fu+NTRK1NjwM5GniCA==
X-IronPort-AV: E=McAfee;i="6700,10204,11325"; a="41915271"
X-IronPort-AV: E=Sophos;i="6.13,231,1732608000"; d="scan'208";a="41915271"
Received: from fmviesa001.fm.intel.com ([10.60.135.141])
 by orvoesa107.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 24 Jan 2025 03:46:14 -0800
X-CSE-ConnectionGUID: 0Eo7W7IsSsyXjINls6jYRA==
X-CSE-MsgGUID: 26T8HXecR4+GyX66Y87mIA==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.12,224,1728975600"; d="scan'208";a="138625347"
Received: from dprybysh-mobl.ger.corp.intel.com (HELO localhost)
 ([10.245.246.170])
 by smtpauth.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 24 Jan 2025 03:46:11 -0800
From: Jani Nikula <jani.nikula@intel.com>
To: Simona Vetter <simona.vetter@ffwll.ch>
Cc: dri-devel@lists.freedesktop.org, intel-gfx@lists.freedesktop.org,
 Matthew Brost <matthew.brost@intel.com>, Danilo Krummrich
 <dakr@kernel.org>, Philipp Stanner <phasta@kernel.org>, Christian
 =?utf-8?Q?K=C3=B6nig?= <ckoenig.leichtzumerken@gmail.com>
Subject: Re: [PATCH 3/5] drm/sched: stop passing non struct drm_device to
 drm_err() and friends
In-Reply-To: <Z5KeZnJ4HOxs1wuk@phenom.ffwll.local>
Organization: Intel Finland Oy - BIC 0357606-4 - Westendinkatu 7, 02160 Espoo
References: <cover.1737644530.git.jani.nikula@intel.com>
 <fe441dd1469d2b03e6b2ff247078bdde2011c6e3.1737644530.git.jani.nikula@intel.com>
 <Z5KeZnJ4HOxs1wuk@phenom.ffwll.local>
Date: Fri, 24 Jan 2025 13:46:08 +0200
Message-ID: <87msfgbfjz.fsf@intel.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable
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

On Thu, 23 Jan 2025, Simona Vetter <simona.vetter@ffwll.ch> wrote:
> On Thu, Jan 23, 2025 at 05:09:10PM +0200, Jani Nikula wrote:
>> The expectation is that the struct drm_device based logging helpers get
>> passed an actual struct drm_device pointer rather than some random
>> struct pointer where you can dereference the ->dev member.
>>=20
>> Convert drm_err(sched, ...) to dev_err(sched->dev, ...) and
>> similar. This matches current usage, as struct drm_device is not
>> available, but drops "[drm]" or "[drm] *ERROR*" prefix from logging.
>>=20
>> Unfortunately, there's no dev_WARN_ON(), so the conversion is not
>> exactly the same.
>>=20
>> Signed-off-by: Jani Nikula <jani.nikula@intel.com>
>
> For the two previous patches just dev_ makes sense since they're just
> platform drivers, but for drm/sched I wonder whether it wouldn't be better
> to switch from struct device * to struct drm_device * instead. I guess
> might be best to leave that decision to scheduler folks.

I had a very brief look, and it seemed like struct drm_device isn't
passed around in sched. If use of struct drm_device is preferred, I'm
not the best person to figure out how to do that. But the abuse of the
drm_err() and friends macros needs to stop.

> Anyway on the series and with that caveat:
>
> Reviewed-by: Simona Vetter <simona.vetter@ffwll.ch>

Thanks,
Jani.

>
>
>>=20
>> ---
>>=20
>> Cc: Matthew Brost <matthew.brost@intel.com>
>> Cc: Danilo Krummrich <dakr@kernel.org>
>> Cc: Philipp Stanner <phasta@kernel.org>
>> Cc: "Christian K=C3=B6nig" <ckoenig.leichtzumerken@gmail.com>
>> Cc: dri-devel@lists.freedesktop.org
>> ---
>>  drivers/gpu/drm/scheduler/sched_entity.c |  2 +-
>>  drivers/gpu/drm/scheduler/sched_main.c   | 20 +++++++++++---------
>>  2 files changed, 12 insertions(+), 10 deletions(-)
>>=20
>> diff --git a/drivers/gpu/drm/scheduler/sched_entity.c b/drivers/gpu/drm/=
scheduler/sched_entity.c
>> index 69bcf0e99d57..e29af71d4b5c 100644
>> --- a/drivers/gpu/drm/scheduler/sched_entity.c
>> +++ b/drivers/gpu/drm/scheduler/sched_entity.c
>> @@ -92,7 +92,7 @@ int drm_sched_entity_init(struct drm_sched_entity *ent=
ity,
>>  		 * the lowest priority available.
>>  		 */
>>  		if (entity->priority >=3D sched_list[0]->num_rqs) {
>> -			drm_err(sched_list[0], "entity with out-of-bounds priority:%u num_rq=
s:%u\n",
>> +			dev_err(sched_list[0]->dev, "entity with out-of-bounds priority:%u n=
um_rqs:%u\n",
>>  				entity->priority, sched_list[0]->num_rqs);
>>  			entity->priority =3D max_t(s32, (s32) sched_list[0]->num_rqs - 1,
>>  						 (s32) DRM_SCHED_PRIORITY_KERNEL);
>> diff --git a/drivers/gpu/drm/scheduler/sched_main.c b/drivers/gpu/drm/sc=
heduler/sched_main.c
>> index a48be16ab84f..d1c1f22fd1db 100644
>> --- a/drivers/gpu/drm/scheduler/sched_main.c
>> +++ b/drivers/gpu/drm/scheduler/sched_main.c
>> @@ -103,9 +103,9 @@ static u32 drm_sched_available_credits(struct drm_gp=
u_scheduler *sched)
>>  {
>>  	u32 credits;
>>=20=20
>> -	drm_WARN_ON(sched, check_sub_overflow(sched->credit_limit,
>> -					      atomic_read(&sched->credit_count),
>> -					      &credits));
>> +	WARN_ON(check_sub_overflow(sched->credit_limit,
>> +				   atomic_read(&sched->credit_count),
>> +				   &credits));
>>=20=20
>>  	return credits;
>>  }
>> @@ -130,9 +130,11 @@ static bool drm_sched_can_queue(struct drm_gpu_sche=
duler *sched,
>>  	/* If a job exceeds the credit limit, truncate it to the credit limit
>>  	 * itself to guarantee forward progress.
>>  	 */
>> -	if (drm_WARN(sched, s_job->credits > sched->credit_limit,
>> -		     "Jobs may not exceed the credit limit, truncate.\n"))
>> +	if (s_job->credits > sched->credit_limit) {
>> +		dev_WARN(sched->dev,
>> +			 "Jobs may not exceed the credit limit, truncate.\n");
>>  		s_job->credits =3D sched->credit_limit;
>> +	}
>>=20=20
>>  	return drm_sched_available_credits(sched) >=3D s_job->credits;
>>  }
>> @@ -790,7 +792,7 @@ int drm_sched_job_init(struct drm_sched_job *job,
>>  		 * or worse--a blank screen--leave a trail in the
>>  		 * logs, so this can be debugged easier.
>>  		 */
>> -		drm_err(job->sched, "%s: entity has no rq!\n", __func__);
>> +		dev_err(job->sched->dev, "%s: entity has no rq!\n", __func__);
>>  		return -ENOENT;
>>  	}
>>=20=20
>> @@ -1280,7 +1282,7 @@ int drm_sched_init(struct drm_gpu_scheduler *sched,
>>  	if (num_rqs > DRM_SCHED_PRIORITY_COUNT) {
>>  		/* This is a gross violation--tell drivers what the  problem is.
>>  		 */
>> -		drm_err(sched, "%s: num_rqs cannot be greater than DRM_SCHED_PRIORITY=
_COUNT\n",
>> +		dev_err(sched->dev, "%s: num_rqs cannot be greater than DRM_SCHED_PRI=
ORITY_COUNT\n",
>>  			__func__);
>>  		return -EINVAL;
>>  	} else if (sched->sched_rq) {
>> @@ -1288,7 +1290,7 @@ int drm_sched_init(struct drm_gpu_scheduler *sched,
>>  		 * fine-tune their DRM calling order, and return all
>>  		 * is good.
>>  		 */
>> -		drm_warn(sched, "%s: scheduler already initialized!\n", __func__);
>> +		dev_warn(sched->dev, "%s: scheduler already initialized!\n", __func__=
);
>>  		return 0;
>>  	}
>>=20=20
>> @@ -1343,7 +1345,7 @@ int drm_sched_init(struct drm_gpu_scheduler *sched,
>>  Out_check_own:
>>  	if (sched->own_submit_wq)
>>  		destroy_workqueue(sched->submit_wq);
>> -	drm_err(sched, "%s: Failed to setup GPU scheduler--out of memory\n", _=
_func__);
>> +	dev_err(sched->dev, "%s: Failed to setup GPU scheduler--out of memory\=
n", __func__);
>>  	return -ENOMEM;
>>  }
>>  EXPORT_SYMBOL(drm_sched_init);
>> --=20
>> 2.39.5
>>=20

--=20
Jani Nikula, Intel
