Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 46CDA87530F
	for <lists+dri-devel@lfdr.de>; Thu,  7 Mar 2024 16:24:01 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id BA5D410F1AE;
	Thu,  7 Mar 2024 15:23:57 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="iHhnfrIi";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.16])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 9E8ED10EFEF;
 Thu,  7 Mar 2024 15:23:56 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1709825037; x=1741361037;
 h=from:to:cc:subject:in-reply-to:references:date:
 message-id:mime-version;
 bh=DJ4MDze7UG129N0M+CeGyYEtIqX0377xcid4t3zAslQ=;
 b=iHhnfrIirfo5NM8FSOxbZgP5Gct6w4ISt7HL/mTuuApnrIiT4w4UgluB
 QcPqw6QCx5PHC3kVkYWUwUmlM4R3xD1IYcOaHiqoVLZFNOQ2X1oy0+Zfs
 EM5eLtELIk3XAqJgPqVxxb4FTprzvE/Xb6wFQxXA0QYbUx36+cgj8N2vh
 GGpIOpqXeDuquC48kYIw7OLjOoSX3FKNu4nsRksr0CkYhdYqRyMNgCyCW
 uE8coNeguCGviIQ/zZTcDo7mOm5L6AiJFKwkph4JIpJz84DW+YEWsPueP
 SE38zB/S3BtRnQQ0SDhjYnKxPtWaLmxqRRKPzTfdXwL4/BTAa8QASrxZ8 Q==;
X-IronPort-AV: E=McAfee;i="6600,9927,11006"; a="4617746"
X-IronPort-AV: E=Sophos;i="6.07,211,1708416000"; 
   d="scan'208";a="4617746"
Received: from orviesa004.jf.intel.com ([10.64.159.144])
 by orvoesa108.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 07 Mar 2024 07:23:56 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.07,211,1708416000"; d="scan'208";a="14798571"
Received: from unknown (HELO localhost) ([10.237.66.160])
 by orviesa004-auth.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 07 Mar 2024 07:23:52 -0800
From: Jani Nikula <jani.nikula@intel.com>
To: Thomas Zimmermann <tzimmermann@suse.de>,
 dri-devel@lists.freedesktop.org, Alex Deucher <alexdeucher@gmail.com>
Cc: intel-gfx@lists.freedesktop.org, intel-xe@lists.freedesktop.org, David
 Airlie <airlied@gmail.com>, Daniel Vetter <daniel@ffwll.ch>, Maarten
 Lankhorst <maarten.lankhorst@linux.intel.com>, Maxime Ripard
 <mripard@kernel.org>, Masahiro Yamada <masahiroy@kernel.org>
Subject: Re: [PATCH 00/22] drm: fix headers, add header test facility
In-Reply-To: <5642828f-28a5-4f79-a96f-5ca4411163c7@suse.de>
Organization: Intel Finland Oy - BIC 0357606-4 - Westendinkatu 7, 02160 Espoo
References: <cover.1709749576.git.jani.nikula@intel.com>
 <5642828f-28a5-4f79-a96f-5ca4411163c7@suse.de>
Date: Thu, 07 Mar 2024 17:23:49 +0200
Message-ID: <87a5navzei.fsf@intel.com>
MIME-Version: 1.0
Content-Type: text/plain
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

On Thu, 07 Mar 2024, Thomas Zimmermann <tzimmermann@suse.de> wrote:
> Hi
>
> Am 06.03.24 um 19:31 schrieb Jani Nikula:
>> First, fix a bunch of issues in drm headers, uncovered with the last
>> patch. A few kernel-doc warnings are just brushed under the carpet for
>> now, with a FIXME comment. Otherwise, pretty straightforward stuff.
>
> Nice, thanks a lot. For the FIXME comments, maybe maintainers can 
> provide the docs to include in your patchset. But that wouldn't be a 
> blocker IMHO. The /* private: */ comments make kernel-doc ignore the 
> rest of the structure, right?
>
> With the required fixes applied, for patches 1 to 14:
>
> Reviewed-by: Thomas Zimmermann <tzimmermann@suse.de>

Thanks for the review, I started off with pushing patches 1-7, 9-12, and
14 to drm-misc-next, with Alex's ack on patch 4.

Patches 8 and 13 have fixmes, so skipped those for now.

BR,
Jani.



>
> For patches 15 to 22:
>
> Acked-by: Thomas Zimmermann <tzimmermann@suse.de>
>
> Best regards
> Thomas
>
>>
>> Second, add a header test facility to catch issues at build time when
>> CONFIG_DRM_HEADER_TEST=y. This is the last patch, and I think needs
>> Masahiro's ack.
>>
>> BR,
>> Jani.
>>
>>
>> Cc: David Airlie <airlied@gmail.com>
>> Cc: Daniel Vetter <daniel@ffwll.ch>
>> Cc: Maarten Lankhorst <maarten.lankhorst@linux.intel.com>
>> Cc: Maxime Ripard <mripard@kernel.org>
>> Cc: Thomas Zimmermann <tzimmermann@suse.de>
>> Cc: Masahiro Yamada <masahiroy@kernel.org>
>>
>> Jani Nikula (22):
>>    drm/crtc: make drm_crtc_internal.h self-contained
>>    drm: add missing header guards to drm_internal.h
>>    drm/kunit: fix drm_kunit_helpers.h kernel-doc
>>    drm/amdgpu: make amd_asic_type.h self-contained
>>    drm: bridge: samsung-dsim: make samsung-dsim.h self-contained
>>    drm/dp_mst: fix drm_dp_mst_helper.h kernel-doc
>>    drm/crc: make drm_debugfs_crc.h self-contained and fix kernel-doc
>>    drm/encoder: silence drm_encoder_slave.h kernel-doc
>>    drm: fix drm_format_helper.h kernel-doc warnings
>>    drm/lease: make drm_lease.h self-contained
>>    drm: fix drm_gem_vram_helper.h kernel-doc
>>    drm/of: make drm_of.h self-contained
>>    drm/i2c: silence ch7006.h and sil164.h kernel-doc warnings
>>    drm/suballoc: fix drm_suballoc.h kernel-doc
>>    drm/i915: fix i915_gsc_proxy_mei_interface.h kernel-doc
>>    drm/i915/hdcp: fix i915_hdcp_interface.h kernel-doc warnings
>>    drm/i915/pxp: fix i915_pxp_tee_interface.h kernel-doc warnings
>>    drm/ttm: fix ttm_bo.h kernel-doc warnings
>>    drm/ttm: make ttm_caching.h self-contained
>>    drm/ttm: fix ttm_execbuf_util.h kernel-doc warnings
>>    drm/ttm: fix ttm_kmap_iter.h kernel-doc warnings
>>    drm: ensure drm headers are self-contained and pass kernel-doc
>>
>>   Kbuild                                     |  1 +
>>   drivers/gpu/drm/Kconfig                    | 11 +++++++++++
>>   drivers/gpu/drm/Makefile                   | 18 ++++++++++++++++++
>>   drivers/gpu/drm/drm_crtc_internal.h        |  1 +
>>   drivers/gpu/drm/drm_internal.h             |  5 +++++
>>   include/Kbuild                             |  1 +
>>   include/drm/Makefile                       | 18 ++++++++++++++++++
>>   include/drm/amd_asic_type.h                |  3 +++
>>   include/drm/bridge/samsung-dsim.h          |  4 +++-
>>   include/drm/display/drm_dp_mst_helper.h    |  1 -
>>   include/drm/drm_debugfs_crc.h              |  8 +++++++-
>>   include/drm/drm_encoder_slave.h            |  3 +++
>>   include/drm/drm_format_helper.h            |  1 +
>>   include/drm/drm_gem_vram_helper.h          |  1 -
>>   include/drm/drm_kunit_helpers.h            |  2 +-
>>   include/drm/drm_lease.h                    |  2 ++
>>   include/drm/drm_of.h                       |  1 +
>>   include/drm/drm_suballoc.h                 |  2 +-
>>   include/drm/i2c/ch7006.h                   |  1 +
>>   include/drm/i2c/sil164.h                   |  1 +
>>   include/drm/i915_gsc_proxy_mei_interface.h |  4 ++--
>>   include/drm/i915_hdcp_interface.h          | 18 +++++++++++++-----
>>   include/drm/i915_pxp_tee_interface.h       | 19 ++++++++++++-------
>>   include/drm/ttm/ttm_bo.h                   | 18 ++++++++++++------
>>   include/drm/ttm/ttm_caching.h              |  2 ++
>>   include/drm/ttm/ttm_execbuf_util.h         |  7 +++----
>>   include/drm/ttm/ttm_kmap_iter.h            |  4 ++--
>>   27 files changed, 125 insertions(+), 32 deletions(-)
>>   create mode 100644 include/Kbuild
>>   create mode 100644 include/drm/Makefile
>>

-- 
Jani Nikula, Intel
