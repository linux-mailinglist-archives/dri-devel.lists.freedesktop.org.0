Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 30272A9EFA6
	for <lists+dri-devel@lfdr.de>; Mon, 28 Apr 2025 13:50:00 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 7DF5110E209;
	Mon, 28 Apr 2025 11:49:56 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="N8uBGkXH";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.9])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 4FB2410E208;
 Mon, 28 Apr 2025 11:49:51 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1745840992; x=1777376992;
 h=from:to:cc:subject:in-reply-to:references:date:
 message-id:mime-version:content-transfer-encoding;
 bh=zB1R+3nPlS8YyDEXUjEpyTUCdVXfQYrcqgAxtPVk+1k=;
 b=N8uBGkXH9wGm+bShxbHcIFVtghxS60ouPyHLOBRW+inemXyK4YMZ1uDY
 engKYotrn/6OrNRSsPB2T/KhIjdUYSWZ9CpbkkLklFaRM2t7E+nJ55VDH
 XUqhl1BUcmpdaDD+MkVn9cP6D1N0NL5056sE0gsa+suCf/Ab8tx5kZq+z
 NQCfVgcl0lVNa4PFVORJK4nkJZTN3S7DT+AqFNPKIbbN5a3MS/+VWvnSq
 M7trg4vIEUFn2CV5J8xIi05oxDJBEeGhuKxbLGxuRFnwIMNhtq7f1+XuE
 CM57hVyKekdH5mEdXdZi/t1uP+nYQ0KcxpU6ABerNGzQ6TbWY9Yj5wIzs w==;
X-CSE-ConnectionGUID: 52CkJ0M9TRScZXof2GP6Ng==
X-CSE-MsgGUID: /JOkh4ySQK+iDb4ahCycUA==
X-IronPort-AV: E=McAfee;i="6700,10204,11416"; a="69926560"
X-IronPort-AV: E=Sophos;i="6.15,246,1739865600"; d="scan'208";a="69926560"
Received: from orviesa001.jf.intel.com ([10.64.159.141])
 by orvoesa101.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 28 Apr 2025 04:49:50 -0700
X-CSE-ConnectionGUID: hAhgMd9+Q3CW5CF12QndgQ==
X-CSE-MsgGUID: XleMqfvhSTuB77eYrfOvdQ==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.15,246,1739865600"; d="scan'208";a="170721583"
Received: from slindbla-desk.ger.corp.intel.com (HELO localhost)
 ([10.245.246.174])
 by smtpauth.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 28 Apr 2025 04:49:46 -0700
From: Jani Nikula <jani.nikula@linux.intel.com>
To: "Khatri, Sunil" <sukhatri@amd.com>, Christian =?utf-8?Q?K=C3=B6nig?=
 <christian.koenig@amd.com>, Sunil Khatri <sunil.khatri@amd.com>,
 dri-devel@lists.freedesktop.org, amd-gfx@lists.freedesktop.org, David
 Airlie <airlied@linux.ie>, Simona Vetter <simona@ffwll.ch>, Maxime Ripard
 <mripard@kernel.org>, Maarten Lankhorst
 <maarten.lankhorst@linux.intel.com>, Thomas Zimmermann
 <tzimmermann@suse.de>
Cc: Alex Deucher <alexander.deucher@amd.com>, Tvrtko Ursulin
 <tvrtko.ursulin@igalia.com>, Pierre-Eric Pelloux-Prayer
 <pierre-eric.pelloux-prayer@amd.com>
Subject: Re: [PATCH V8 1/5] drm: add drm_file_err function to add process info
In-Reply-To: <f9c5edeb-ffc8-4a25-a80b-3ae8de9b62da@amd.com>
Organization: Intel Finland Oy - BIC 0357606-4 - Westendinkatu 7, 02160 Espoo
References: <20250417161042.120981-1-sunil.khatri@amd.com>
 <4b7a7016-7ad5-4d08-919e-9876f7da1ef2@amd.com>
 <f9c5edeb-ffc8-4a25-a80b-3ae8de9b62da@amd.com>
Date: Mon, 28 Apr 2025 14:49:42 +0300
Message-ID: <871ptcy089.fsf@intel.com>
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

On Mon, 28 Apr 2025, "Khatri, Sunil" <sukhatri@amd.com> wrote:
> On 4/22/2025 2:33 PM, Christian K=C3=B6nig wrote:
>> Am 17.04.25 um 18:10 schrieb Sunil Khatri:
>>> Add a drm helper function which appends the process information for
>>> the drm_file over drm_err formatted output.
>>>
>>> v5: change to macro from function (Christian Koenig)
>>>      add helper functions for lock/unlock (Christian Koenig)
>>>
>>> v6: remove __maybe_unused and make function inline (Jani Nikula)
>>>      remove drm_print.h
>>>
>>> v7: Use va_format and %pV to concatenate fmt and vargs (Jani Nikula)
>>>
>>> v8: Code formatting and typos (Ursulin tvrtko)
>>>
>>> Signed-off-by: Sunil Khatri <sunil.khatri@amd.com>
>>> Reviewed-by: Tvrtko Ursulin <tvrtko.ursulin@igalia.com>
>> Any objections to merge this through amd-staging-drm-next?
> Gentle reminder here folks ??

It might help to Cc the drm-misc maintainers, though even that doesn't
always guarantee a reply. ;D

Done now.

Anyway, since I commented on an earlier version, and my feedback was
addressed,

Acked-by: Jani Nikula <jani.nikula@intel.com>

even though that does not help you merge via the amd tree.


BR,
Jani.


>> The follow up amdgpu patches all depend on stuff in there which is not y=
et merged to drm-misc-next.
>>
>> Thanks,
>> Christian.
>>
>>> ---
>>>   drivers/gpu/drm/drm_file.c | 34 ++++++++++++++++++++++++++++++++++
>>>   include/drm/drm_file.h     |  3 +++
>>>   2 files changed, 37 insertions(+)
>>>
>>> diff --git a/drivers/gpu/drm/drm_file.c b/drivers/gpu/drm/drm_file.c
>>> index c299cd94d3f7..dd351f601acd 100644
>>> --- a/drivers/gpu/drm/drm_file.c
>>> +++ b/drivers/gpu/drm/drm_file.c
>>> @@ -986,6 +986,40 @@ void drm_show_fdinfo(struct seq_file *m, struct fi=
le *f)
>>>   }
>>>   EXPORT_SYMBOL(drm_show_fdinfo);
>>>=20=20=20
>>> +/**
>>> + * drm_file_err - log process name, pid and client_name associated wit=
h a drm_file
>>> + * @file_priv: context of interest for process name and pid
>>> + * @fmt: printf() like format string
>>> + *
>>> + * Helper function for clients which needs to log process details such
>>> + * as name and pid etc along with user logs.
>>> + */
>>> +void drm_file_err(struct drm_file *file_priv, const char *fmt, ...)
>>> +{
>>> +	va_list args;
>>> +	struct va_format vaf;
>>> +	struct pid *pid;
>>> +	struct task_struct *task;
>>> +	struct drm_device *dev =3D file_priv->minor->dev;
>>> +
>>> +	va_start(args, fmt);
>>> +	vaf.fmt =3D fmt;
>>> +	vaf.va =3D &args;
>>> +
>>> +	mutex_lock(&file_priv->client_name_lock);
>>> +	rcu_read_lock();
>>> +	pid =3D rcu_dereference(file_priv->pid);
>>> +	task =3D pid_task(pid, PIDTYPE_TGID);
>>> +
>>> +	drm_err(dev, "comm: %s pid: %d client: %s ... %pV", task ? task->comm=
 : "Unset",
>>> +		task ? task->pid : 0, file_priv->client_name ?: "Unset", &vaf);
>>> +
>>> +	va_end(args);
>>> +	rcu_read_unlock();
>>> +	mutex_unlock(&file_priv->client_name_lock);
>>> +}
>>> +EXPORT_SYMBOL(drm_file_err);
>>> +
>>>   /**
>>>    * mock_drm_getfile - Create a new struct file for the drm device
>>>    * @minor: drm minor to wrap (e.g. #drm_device.primary)
>>> diff --git a/include/drm/drm_file.h b/include/drm/drm_file.h
>>> index 94d365b22505..5c3b2aa3e69d 100644
>>> --- a/include/drm/drm_file.h
>>> +++ b/include/drm/drm_file.h
>>> @@ -446,6 +446,9 @@ static inline bool drm_is_accel_client(const struct=
 drm_file *file_priv)
>>>   	return file_priv->minor->type =3D=3D DRM_MINOR_ACCEL;
>>>   }
>>>=20=20=20
>>> +__printf(2, 3)
>>> +void drm_file_err(struct drm_file *file_priv, const char *fmt, ...);
>>> +
>>>   void drm_file_update_pid(struct drm_file *);
>>>=20=20=20
>>>   struct drm_minor *drm_minor_acquire(struct xarray *minors_xa, unsigne=
d int minor_id);

--=20
Jani Nikula, Intel
