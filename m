Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id D205A8D2E41
	for <lists+dri-devel@lfdr.de>; Wed, 29 May 2024 09:30:38 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id EEF3E10E4A1;
	Wed, 29 May 2024 07:30:35 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="dUaLrWXg";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.19])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 008A210E4A1
 for <dri-devel@lists.freedesktop.org>; Wed, 29 May 2024 07:30:31 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1716967832; x=1748503832;
 h=from:to:cc:subject:in-reply-to:references:date:
 message-id:mime-version:content-transfer-encoding;
 bh=HhJt1HONsIjlD0Q+6x/PridWqQe6ezeXYzhlVv+oYFg=;
 b=dUaLrWXghZnFtaMfzkCzOG2R54BfN33/vjHh+wi2r3d/tnFAa4Cpuqis
 GT1fhfpib2/OH9WNaXuXw3VEi+sZoT9oL8QQhguwVe6coJ9v1T0/NzVxN
 27lBnYpH5K/PW6ijFIPkaSDuvEu4Djnr16v23zAXmBS82ybJ2llV0OPP0
 MAsbVtYTuNfdVZX3JTYp8hPSsuhhqG71upPS4hjGoob2Vm+Jr0yARu07I
 0W9wttWLme4iBeI0KY0gXg1b3EhSNNvIrF7fDd3mfX0GFVwMlZ7uzqjcC
 qUHbKwEsw05lYE2Tg/L4Sba4F1bzR6YsWLWvQY3F8QojuO/HpotGzdDjm A==;
X-CSE-ConnectionGUID: Dl895CjxTmSDQJYlV6+9XQ==
X-CSE-MsgGUID: VcjeuQ14R/yhuhmXKZQ2EQ==
X-IronPort-AV: E=McAfee;i="6600,9927,11085"; a="13177670"
X-IronPort-AV: E=Sophos;i="6.08,197,1712646000"; d="scan'208";a="13177670"
Received: from orviesa003.jf.intel.com ([10.64.159.143])
 by fmvoesa113.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 29 May 2024 00:30:31 -0700
X-CSE-ConnectionGUID: 7v2p8jTuTGKxBJElG4OnWA==
X-CSE-MsgGUID: Ov1u2DCLRRyLUb/rtwzgbQ==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.08,197,1712646000"; d="scan'208";a="40174031"
Received: from ncintean-mobl1.ger.corp.intel.com (HELO localhost)
 ([10.245.246.86])
 by ORVIESA003-auth.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 29 May 2024 00:30:28 -0700
From: Jani Nikula <jani.nikula@linux.intel.com>
To: =?utf-8?Q?Ma=C3=ADra?= Canal <mcanal@igalia.com>, Melissa Wen
 <mwen@igalia.com>, Iago
 Toral <itoral@igalia.com>, Jose Maria Casanova Crespo
 <jmcasanova@igalia.com>, =?utf-8?Q?Juan_A_=2E_Su=C3=A1rez?=
 <jasuarez@igalia.com>, Maarten
 Lankhorst <maarten.lankhorst@linux.intel.com>, Maxime Ripard
 <mripard@kernel.org>, Thomas Zimmermann <tzimmermann@suse.de>, David
 Airlie <airlied@gmail.com>, Daniel Vetter <daniel@ffwll.ch>
Cc: dri-devel@lists.freedesktop.org, kernel-dev@igalia.com
Subject: Re: [PATCH v2 0/6] drm/v3d: Improve Performance Counters handling
In-Reply-To: <8a86f1a3-f59e-41f9-a6ea-17526944e0ac@igalia.com>
Organization: Intel Finland Oy - BIC 0357606-4 - Westendinkatu 7, 02160 Espoo
References: <20240512222655.2792754-1-mcanal@igalia.com>
 <8702e7f7-0f3f-4ee6-b2f3-e44217dbed36@igalia.com>
 <87msojqv89.fsf@intel.com>
 <8a86f1a3-f59e-41f9-a6ea-17526944e0ac@igalia.com>
Date: Wed, 29 May 2024 10:30:24 +0300
Message-ID: <87ed9lkrcf.fsf@intel.com>
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

On Tue, 21 May 2024, Ma=C3=ADra Canal <mcanal@igalia.com> wrote:
> Hi Jani,
>
> On 5/21/24 08:07, Jani Nikula wrote:
>> On Mon, 20 May 2024, Ma=C3=ADra Canal <mcanal@igalia.com> wrote:
>>> On 5/12/24 19:23, Ma=C3=ADra Canal wrote:>
>>>> Ma=C3=ADra Canal (6):
>>>>     drm/v3d: Add Performance Counters descriptions for V3D 4.2 and 7.1
>>>>     drm/v3d: Different V3D versions can have different number of perfc=
nt
>>>>     drm/v3d: Create a new V3D parameter for the maximum number of perf=
cnt
>>>>     drm/v3d: Create new IOCTL to expose performance counters informati=
on
>>>>     drm/v3d: Use V3D_MAX_COUNTERS instead of V3D_PERFCNT_NUM
>>>>     drm/v3d: Deprecate the use of the Performance Counters enum >
>>>>    drivers/gpu/drm/v3d/v3d_drv.c                 |  11 +
>>>>    drivers/gpu/drm/v3d/v3d_drv.h                 |  14 +-
>>>>    drivers/gpu/drm/v3d/v3d_perfmon.c             |  36 ++-
>>>>    .../gpu/drm/v3d/v3d_performance_counters.h    | 208 +++++++++++++++=
+++
>>>>    drivers/gpu/drm/v3d/v3d_sched.c               |   2 +-
>>>>    include/uapi/drm/v3d_drm.h                    |  48 ++++
>>>>    6 files changed, 316 insertions(+), 3 deletions(-)
>>>>    create mode 100644 drivers/gpu/drm/v3d/v3d_performance_counters.h
>>>>
>>>
>>> Applied to drm-misc/drm-misc-next!
>>=20
>> What compiler do you use? I'm hitting the same as kernel test robot [1]
>> with arm-linux-gnueabihf-gcc 12.2.0.
>
> I use clang version 17.0.6.
>
>>=20
>> In general, I don't think it's a great idea to put arrays in headers,
>> and then include it everywhere via v3d_drv.h. You're not just relying on
>> the compiler to optimize it away in compilation units where its not
>> referenced (likely to happen), but also for the linker to deduplicate
>> rodata (possible, but I'm not sure that it will happen).
>>=20
>> I think you need to move the arrays to a .c file, and then either a) add
>> interfaces to access the arrays, or b) declare the arrays and make them
>> global. For the latter you also need to figure out how to expose the
>> size.
>
> I'll write a patch to fix it. Sorry for the disturbance, I didn't notice
> it with clang.

Another report [1].


BR,
Jani.

[1] https://lore.kernel.org/all/20240529122955.4cc16889@canb.auug.org.au



--=20
Jani Nikula, Intel
