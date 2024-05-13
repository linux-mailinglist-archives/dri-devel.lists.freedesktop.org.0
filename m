Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id EE64B8C409C
	for <lists+dri-devel@lfdr.de>; Mon, 13 May 2024 14:20:16 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 8F5DD10E741;
	Mon, 13 May 2024 12:20:14 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="DBFlmtUX";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.17])
 by gabe.freedesktop.org (Postfix) with ESMTPS id DDAD610E740;
 Mon, 13 May 2024 12:20:12 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1715602813; x=1747138813;
 h=from:to:cc:subject:in-reply-to:references:date:
 message-id:mime-version:content-transfer-encoding;
 bh=2nFpx+vTbJrDTOzTWLXDVBEKycJX5+ow8doVwhKDhmY=;
 b=DBFlmtUXLB9fKils4iRW8BGjsJi7bRe4em5aPQi1QGqGBJziFT2b/L3/
 QLVhQTSIUJ0QgOqd2gHxWh9XMsNPXkPejeJeu6VZaqEAXA56tXAUgcJe+
 9XuQOffu0MEEg+04AN85U7IArSX+ERVzv0B7HW7kZUjVrtHmLDyCTk1Jy
 YD64oJW+OQoCltOL8+UYRWjqUClUx4MR1nWTct9tE6eZ+qgiVAACOhviM
 /UZIWbTEZWeaj4/RaFVCMKirK+P/+YDas7OAIP+sIa2KKGOhEKP5pqXj9
 kjIRNErP9cZ/+YtTbS0o02zskUdNWVNrRv1wZCUV7TVvyfuLQaLkzh0Oo Q==;
X-CSE-ConnectionGUID: Xz0hVv0lQ3y30tmWs53EoQ==
X-CSE-MsgGUID: tZx8PXL/SOGlvxeAcJzB4A==
X-IronPort-AV: E=McAfee;i="6600,9927,11071"; a="11408499"
X-IronPort-AV: E=Sophos;i="6.08,158,1712646000"; d="scan'208";a="11408499"
Received: from orviesa007.jf.intel.com ([10.64.159.147])
 by fmvoesa111.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 13 May 2024 05:19:48 -0700
X-CSE-ConnectionGUID: QFGCY9HWTyyC03iwufcXBg==
X-CSE-MsgGUID: U1ZLZgtuTkGLaiZOWAGGIA==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.08,158,1712646000"; d="scan'208";a="30888534"
Received: from fdefranc-mobl3.ger.corp.intel.com (HELO localhost)
 ([10.245.246.7])
 by orviesa007-auth.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 13 May 2024 05:19:45 -0700
From: Jani Nikula <jani.nikula@intel.com>
To: Alex Deucher <alexdeucher@gmail.com>
Cc: dri-devel@lists.freedesktop.org, amd-gfx@lists.freedesktop.org,
 nouveau@lists.freedesktop.org, intel-gfx@lists.freedesktop.org
Subject: Re: [RESEND 0/6] drm, nouveau/radeon/amdpgu: edid_blob_ptr cleanups
In-Reply-To: <CADnq5_OMOuz_T-OUZ4jVELEAL1FfFdqoFukKdvZA0eSoPQExLg@mail.gmail.com>
Organization: Intel Finland Oy - BIC 0357606-4 - Westendinkatu 7, 02160 Espoo
References: <cover.1715353572.git.jani.nikula@intel.com>
 <CADnq5_OMOuz_T-OUZ4jVELEAL1FfFdqoFukKdvZA0eSoPQExLg@mail.gmail.com>
Date: Mon, 13 May 2024 15:19:42 +0300
Message-ID: <87seylewf5.fsf@intel.com>
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

On Fri, 10 May 2024, Alex Deucher <alexdeucher@gmail.com> wrote:
> On Fri, May 10, 2024 at 11:17=E2=80=AFAM Jani Nikula <jani.nikula@intel.c=
om> wrote:
>>
>> I've sent this some moths ago, let's try again...
>>
>> BR,
>> Jani.
>>
>> Jani Nikula (6):
>>   drm/nouveau: convert to using is_hdmi and has_audio from display info
>>   drm/radeon: convert to using is_hdmi and has_audio from display info
>>   drm/radeon: remove radeon_connector_edid() and stop using
>>     edid_blob_ptr
>>   drm/amdgpu: remove amdgpu_connector_edid() and stop using
>>     edid_blob_ptr
>>   drm/edid: add a helper for EDID sysfs property show
>>   drm/connector: update edid_blob_ptr documentation
>
> Series is:
> Acked-by: Alex Deucher <alexander.deucher@amd.com>

Thanks, do you want to pick these up via your tree? And do you expect a
proper R-b before merging?

BR,
Jani.


>
>>
>>  .../gpu/drm/amd/amdgpu/amdgpu_connectors.c    | 16 ---------
>>  .../gpu/drm/amd/amdgpu/amdgpu_connectors.h    |  1 -
>>  drivers/gpu/drm/amd/amdgpu/dce_v10_0.c        |  4 +--
>>  drivers/gpu/drm/amd/amdgpu/dce_v11_0.c        |  4 +--
>>  drivers/gpu/drm/amd/amdgpu/dce_v6_0.c         |  4 +--
>>  drivers/gpu/drm/amd/amdgpu/dce_v8_0.c         |  4 +--
>>  drivers/gpu/drm/drm_crtc_internal.h           |  2 ++
>>  drivers/gpu/drm/drm_edid.c                    | 33 +++++++++++++++++++
>>  drivers/gpu/drm/drm_sysfs.c                   | 24 ++------------
>>  drivers/gpu/drm/nouveau/dispnv50/disp.c       |  8 ++---
>>  drivers/gpu/drm/nouveau/dispnv50/head.c       |  8 +----
>>  drivers/gpu/drm/nouveau/nouveau_connector.c   |  2 +-
>>  drivers/gpu/drm/radeon/atombios_encoders.c    | 10 +++---
>>  drivers/gpu/drm/radeon/evergreen_hdmi.c       |  5 ++-
>>  drivers/gpu/drm/radeon/radeon_audio.c         | 13 ++++----
>>  drivers/gpu/drm/radeon/radeon_connectors.c    | 27 ++++-----------
>>  drivers/gpu/drm/radeon/radeon_display.c       |  2 +-
>>  drivers/gpu/drm/radeon/radeon_encoders.c      |  4 +--
>>  drivers/gpu/drm/radeon/radeon_mode.h          |  2 --
>>  include/drm/drm_connector.h                   |  6 +++-
>>  20 files changed, 79 insertions(+), 100 deletions(-)
>>
>> --
>> 2.39.2
>>

--=20
Jani Nikula, Intel
