Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id CF078964028
	for <lists+dri-devel@lfdr.de>; Thu, 29 Aug 2024 11:32:17 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 5B4F810E679;
	Thu, 29 Aug 2024 09:32:15 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="QT7EmqZs";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.16])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 0759A10E674;
 Thu, 29 Aug 2024 09:32:13 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1724923934; x=1756459934;
 h=from:to:cc:subject:in-reply-to:references:date:
 message-id:mime-version:content-transfer-encoding;
 bh=NT9bgQbTZvXZ0OFjDOL9/9E+C+ry75Gq7DWyQBRQvv4=;
 b=QT7EmqZsK2ufj8dx64U0agGKHa1qnIDm0YcxMO7gj69U8OsUpxl3oldC
 DZ3RFVnDx8MgNXXsjN3p5Z1LS5xxotwywRoMPSO3rG5FKUch4lm4+F3xU
 p0NXd+Jbt6nsfQ5y+rIqX5WGjWh2dyXn9jItWj8QQffE41VdFgrSX7dq9
 tL6vaJ1bwMaguaTDYIw7OTKte5rIeeBFm5+bG2Xxj5WXEjyST6M1OOHe7
 yh9XXZmIvtwmQFjN1js8ZEXRkGi8X+NSZhLZ1NZTFnqVeuBFqXpDtErTT
 /kEwTVNNvOoI4AVRFTXghVHur7IufSHm5wKKZ0r3YEbh+8uO+gJu4kPJr w==;
X-CSE-ConnectionGUID: COjr+5IJRAq4K10PLxsoIQ==
X-CSE-MsgGUID: oHgL6/OaSUa5budH8iTJyg==
X-IronPort-AV: E=McAfee;i="6700,10204,11178"; a="23632894"
X-IronPort-AV: E=Sophos;i="6.10,185,1719903600"; d="scan'208";a="23632894"
Received: from orviesa007.jf.intel.com ([10.64.159.147])
 by orvoesa108.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 29 Aug 2024 02:32:14 -0700
X-CSE-ConnectionGUID: TlQk900AT2aRfZEHg4aCAw==
X-CSE-MsgGUID: tKwFtxc9QtCu4kg+UWGmDg==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.10,185,1719903600"; d="scan'208";a="64004846"
Received: from mjarzebo-mobl1.ger.corp.intel.com (HELO localhost)
 ([10.245.246.242])
 by orviesa007-auth.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 29 Aug 2024 02:32:10 -0700
From: Jani Nikula <jani.nikula@intel.com>
To: Harry Wentland <harry.wentland@amd.com>, Alex Deucher
 <alexdeucher@gmail.com>
Cc: Daniel Vetter <daniel.vetter@ffwll.ch>, dri-devel@lists.freedesktop.org,
 amd-gfx@lists.freedesktop.org, intel-gfx@lists.freedesktop.org, Leo Li
 <sunpeng.li@amd.com>, Rodrigo Siqueira <Rodrigo.Siqueira@amd.com>, Alex
 Deucher <alexander.deucher@amd.com>, Hamza Mahfooz <hamza.mahfooz@amd.com>
Subject: Re: [RESEND 3/3] drm/amd/display: switch to guid_gen() to generate
 valid GUIDs
In-Reply-To: <26c9f07b-f2fc-4ab1-9e1d-5825615b0dc6@amd.com>
Organization: Intel Finland Oy - BIC 0357606-4 - Westendinkatu 7, 02160 Espoo
References: <20240812122312.1567046-1-jani.nikula@intel.com>
 <20240812122312.1567046-3-jani.nikula@intel.com>
 <Zs8kJOC2pH7gSfET@phenom.ffwll.local> <87plpsydda.fsf@intel.com>
 <CADnq5_OoY-Wt56=_XHjZGgZk2LrgXB5U34TOcjWqyO-+Ou9W8Q@mail.gmail.com>
 <26c9f07b-f2fc-4ab1-9e1d-5825615b0dc6@amd.com>
Date: Thu, 29 Aug 2024 12:32:06 +0300
Message-ID: <8734mny8rt.fsf@intel.com>
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

On Wed, 28 Aug 2024, Harry Wentland <harry.wentland@amd.com> wrote:
> On 2024-08-28 09:58, Alex Deucher wrote:
>> On Wed, Aug 28, 2024 at 9:53=E2=80=AFAM Jani Nikula <jani.nikula@intel.c=
om> wrote:
>>>
>>> On Wed, 28 Aug 2024, Daniel Vetter <daniel.vetter@ffwll.ch> wrote:
>>>> On Mon, Aug 12, 2024 at 03:23:12PM +0300, Jani Nikula wrote:
>>>>> Instead of just smashing jiffies into a GUID, use guid_gen() to gener=
ate
>>>>> RFC 4122 compliant GUIDs.
>>>>>
>>>>> Signed-off-by: Jani Nikula <jani.nikula@intel.com>
>>>>>
>>>>> ---
>>>>>
>>>>> Side note, it baffles me why amdgpu has a copy of this instead of
>>>>> plumbing it into drm mst code.
>>>>
>>>> Yeah ec5fa9fcdeca ("drm/amd/display: Adjust the MST resume flow") prom=
ised
>>>> a follow-up, but that seems to have never materialized. Really should
>>>> materialize though. Patch lgtm
>>>>
>>>> Reviewed-by: Daniel Vetter <daniel.vetter@ffwll.ch>
>>>
>>> Thanks!
>>>
>>> Cc: AMD folks, ack for merging the series via drm-misc-next?
>>=20
>> Unless Harry has any objections,
>> Acked-by: Alex Deucher <alexander.deucher@amd.com>
>>=20
>
> Acked-by: Harry Wentland <harry.wentland@amd.com>

Thanks for the reviews and acks, pushed the series to drm-misc-next.

BR,
Jani.


--=20
Jani Nikula, Intel
