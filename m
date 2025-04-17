Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 7A435A91A42
	for <lists+dri-devel@lfdr.de>; Thu, 17 Apr 2025 13:13:54 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id B9B1A10EAB7;
	Thu, 17 Apr 2025 11:13:52 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="IDX41WZ3";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.21])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 5752289561;
 Thu, 17 Apr 2025 11:13:51 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1744888432; x=1776424432;
 h=from:to:cc:subject:in-reply-to:references:date:
 message-id:mime-version:content-transfer-encoding;
 bh=7mY1oDuryG5y47OJmbiO/a4gF6YKJB/+dShqhOIZ+04=;
 b=IDX41WZ3haXXHJOvNLiSuT/Fa0w4kkg1671kJiyToAAE8qW1quBesH7E
 MEc3GTuojqclC+zG5nNs2isUr3s1zL37wq56ukL+f3zwZlj2BTaOoHXzb
 dyXbTlL0dMi1VMc3Djz1uJJwAAWHi86Ozyao0rO3GqnGZ2ugd/dJmCDTp
 q7YZGmAekxmmtKp8inQJniFzlvi6GRLfohH/2MUZTSyOVs48CQibB8f2p
 IZDq3sRPdOQ+8qkdhu8FHl+DpHi1E+/oLbsdEIZpeYldJn3+UBEspqi1j
 XJ7KltVww4sSEwbf59s+MSdcf5VYucHnS4kfaFqq5HIDW/NPaxve63Vgh g==;
X-CSE-ConnectionGUID: 6u2ukQA7QQS+FINsEXGSoQ==
X-CSE-MsgGUID: x7oWcGCvTXCgvZ78DN4ZMQ==
X-IronPort-AV: E=McAfee;i="6700,10204,11405"; a="46393551"
X-IronPort-AV: E=Sophos;i="6.15,218,1739865600"; d="scan'208";a="46393551"
Received: from fmviesa003.fm.intel.com ([10.60.135.143])
 by orvoesa113.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 17 Apr 2025 04:13:51 -0700
X-CSE-ConnectionGUID: WCgtyayWRhOVR5zzkd6Z6A==
X-CSE-MsgGUID: 43uBXVQ6TXmcpIKpDhkunQ==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.15,218,1739865600"; d="scan'208";a="134874272"
Received: from unknown (HELO localhost) ([10.237.66.160])
 by fmviesa003-auth.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 17 Apr 2025 04:13:48 -0700
From: Jani Nikula <jani.nikula@linux.intel.com>
To: "Khatri, Sunil" <sukhatri@amd.com>, Sunil Khatri <sunil.khatri@amd.com>,
 dri-devel@lists.freedesktop.org, amd-gfx@lists.freedesktop.org
Cc: Alex Deucher <alexander.deucher@amd.com>, Christian =?utf-8?Q?K=C3=B6n?=
 =?utf-8?Q?ig?=
 <christian.koenig@amd.com>, Tvrtko Ursulin <tvrtko.ursulin@igalia.com>,
 Pierre-Eric Pelloux-Prayer <pierre-eric.pelloux-prayer@amd.com>
Subject: Re: [PATCH v4 1/5] drm: add macro drm_file_err to print process info
In-Reply-To: <d239b8bb-c154-482c-b37e-0cdaeb6ca7ab@amd.com>
Organization: Intel Finland Oy - BIC 0357606-4 - Westendinkatu 7, 02160 Espoo
References: <20250416133144.862023-1-sunil.khatri@amd.com>
 <87lds0p4jh.fsf@intel.com> <d239b8bb-c154-482c-b37e-0cdaeb6ca7ab@amd.com>
Date: Thu, 17 Apr 2025 14:13:45 +0300
Message-ID: <87y0vzniqe.fsf@intel.com>
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

On Thu, 17 Apr 2025, "Khatri, Sunil" <sukhatri@amd.com> wrote:
> On 4/16/2025 7:55 PM, Jani Nikula wrote:
>> On Wed, 16 Apr 2025, Sunil Khatri<sunil.khatri@amd.com> wrote:
>>> Add a drm helper macro which append the process information for
>>> the drm_file over drm_err.
>>>
>>> Signed-off-by: Sunil Khatri<sunil.khatri@amd.com>
>>> ---
>>>   include/drm/drm_file.h | 41 +++++++++++++++++++++++++++++++++++++++++
>>>   1 file changed, 41 insertions(+)
>>>
>>> diff --git a/include/drm/drm_file.h b/include/drm/drm_file.h
>>> index 94d365b22505..5ae5ad1048fb 100644
>>> --- a/include/drm/drm_file.h
>>> +++ b/include/drm/drm_file.h
>>> @@ -37,6 +37,7 @@
>>>   #include <uapi/drm/drm.h>
>>>=20=20=20
>>>   #include <drm/drm_prime.h>
>>> +#include <drm/drm_print.h>
>> Not a fan of including drm_print.h everywhere that drm_file.h is
>> included. We've been trying to get rid of this, and go the other
>> way. It's really hard to manage dependencies when everything ends up
>> including everything.
>>
>>>=20=20=20
>>>   struct dma_fence;
>>>   struct drm_file;
>>> @@ -446,6 +447,46 @@ static inline bool drm_is_accel_client(const struc=
t drm_file *file_priv)
>>>   	return file_priv->minor->type =3D=3D DRM_MINOR_ACCEL;
>>>   }
>>>=20=20=20
>>> +static struct task_struct *drm_task_lock(struct drm_file *file_priv)
>>> +					__attribute__((__maybe_unused));
>> inline is the keyword you're missing here, and that's why you've had to
>> add maybe unused...
>>
>>> +static struct task_struct *drm_task_lock(struct drm_file *file_priv)
>>> +{
>>> +	struct task_struct *task;
>>> +	struct pid *pid;
>>> +
>>> +	mutex_lock(&file_priv->client_name_lock);
>>> +	rcu_read_lock();
>>> +	pid =3D rcu_dereference(file_priv->pid);
>>> +	task =3D pid_task(pid, PIDTYPE_TGID);
>>> +	return task;
>>> +}
>>> +
>>> +static void drm_task_unlock(struct drm_file *file_priv) __attribute__(=
(__maybe_unused));
>>> +static void drm_task_unlock(struct drm_file *file_priv)
>>> +{
>>> +	rcu_read_unlock();
>>> +	mutex_unlock(&file_priv->client_name_lock);
>>> +}
>> ...but *why* are you inlining these? To make this header self-contained,
>> I think you'd need to add maybe sched.h, pid.h, rcupdate.h, mutex.h, or
>> something. I consider static inlines actively harmful if they force you
>> to pull in a lot of other headers.
>
> Code readability and easy maintenance is the key to make these as=20
> inline.

Oh, quite the opposite. Static inlines are a maintenance nightmare.

BR,
Jani.


> Also we are=C2=A0 keeping the logic function which gets the task with=20
> locks in separate function then actually
>
> passing that in the drm_err as string.
>
>>
>>> +/**
>>> + * drm_file_err - Fill info string with process name and pid
>>> + * @file_priv: context of interest for process name and pid
>>> + * @fmt: prinf() like format string
>>> + *
>>> + * This update the user provided buffer with process
>>> + * name and pid information for @file_priv
>>> + */
>>> +#define drm_file_err(file_priv, fmt, ...)						\
>>> +	do {										\
>>> +		struct task_struct *task;						\
>>> +		struct drm_device *dev =3D file_priv->minor->dev;				\
>>> +											\
>>> +		task =3D drm_task_lock(file_priv);					\
>>> +		drm_err(dev, "comm: %s pid: %d client: %s " fmt,			\
>>> +			task ? task->comm : "", task ? task->pid : 0,			\
>>> +			file_priv->client_name ?: "Unset", ##__VA_ARGS__);		\
>>> +		drm_task_unlock(file_priv);						\
>>> +	} while (0)
>>> +
>> For that matter, why is *this* inline? For debugs it makes a little more
>> sense when it adds the function, but drm_err() doesn't.
>>
>> Make all of these real functions, no need to include drm_print.h, and
>> everything is better.
>>
> Only reason of hacing drm_file_err as a macro as the variadic fmt and=20
> args are not possible to pass without using local variables to make=20
> strings of fmt and args separately and with macro to macro they Are=20
> passed cleanly and no local variables needed. you can check V3 i guess=20
> where this whole was an function only.
>
> Regards Sunil Khatri
>
>> BR,
>> Jani.
>>
>>>   void drm_file_update_pid(struct drm_file *);
>>>=20=20=20
>>>   struct drm_minor *drm_minor_acquire(struct xarray *minors_xa, unsigne=
d int minor_id);

--=20
Jani Nikula, Intel
