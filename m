Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id A142EB317E1
	for <lists+dri-devel@lfdr.de>; Fri, 22 Aug 2025 14:33:19 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 0C8F110EAE1;
	Fri, 22 Aug 2025 12:33:18 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="TWQbTRGI";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.13])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 4265F10EAE2
 for <dri-devel@lists.freedesktop.org>; Fri, 22 Aug 2025 12:33:17 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1755865997; x=1787401997;
 h=from:to:cc:subject:in-reply-to:references:date:
 message-id:mime-version;
 bh=Kvnel9XyEbfV5QjKOr536zHuHkDHJiMkaAOEXL1llWg=;
 b=TWQbTRGIZ/Leygj91FwSiTQySasbrXf7Adp4nTPV8ShzQKRVIKXXPEns
 a5aA+cwlwdD7gEFnkukzB0mT/CMldTGvLIUKhaIzJ+ivSCNmr/ewUVhY6
 VUtAQKoZPwd/zPpsMA+/qJ8hyr6ZmWQLXAnwRF0BL27sGCwoz1XZJoHnz
 9mV+tVMLUIumQJzryH/UWDJ9jOkAx+UCyEYE4yMQTUD5xQmLichopEKyd
 sxRJuT1hlwtx7KHfBgA7WgusCOok+nupDdNux73JFr9FQMLTYBb5zL0BA
 GpR3KgwBEflTmWkI2mgoE4Lpmd6NUlz8n8iXpKkC/fZd/L6vFgJ7bWEkR g==;
X-CSE-ConnectionGUID: RnJdAeIPRpuppwYWIyCZmw==
X-CSE-MsgGUID: ggnwULrnTfeVyz3IJaptCw==
X-IronPort-AV: E=McAfee;i="6800,10657,11529"; a="60798370"
X-IronPort-AV: E=Sophos;i="6.17,309,1747724400"; d="scan'208";a="60798370"
Received: from fmviesa010.fm.intel.com ([10.60.135.150])
 by fmvoesa107.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 22 Aug 2025 05:33:16 -0700
X-CSE-ConnectionGUID: UcW83+0/SL23tcU+MEOH0g==
X-CSE-MsgGUID: JP9eDJpESMabFyaoW6Ya4Q==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.17,309,1747724400"; d="scan'208";a="169520920"
Received: from hrotuna-mobl2.ger.corp.intel.com (HELO localhost)
 ([10.245.246.190])
 by fmviesa010-auth.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 22 Aug 2025 05:33:13 -0700
From: Jani Nikula <jani.nikula@linux.intel.com>
To: Sidhartha Kumar <sidhartha.kumar@oracle.com>,
 linux-kernel@vger.kernel.org, dri-devel@lists.freedesktop.org
Cc: maarten.lankhorst@linux.intel.com, mripard@kernel.org,
 tzimmermann@suse.de, airlied@gmail.com, simona@ffwll.ch,
 willy@infradead.org, sidhartha.kumar@oracle.com
Subject: Re: [PATCH v2 0/6] DRM IDR to Xarray conversions
In-Reply-To: <20250821145429.305526-1-sidhartha.kumar@oracle.com>
Organization: Intel Finland Oy - BIC 0357606-4 - Westendinkatu 7, 02160 Espoo
References: <20250821145429.305526-1-sidhartha.kumar@oracle.com>
Date: Fri, 22 Aug 2025 15:33:10 +0300
Message-ID: <f69669c873dbb99c239e9f2ddf154e983baa61e3@intel.com>
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

On Thu, 21 Aug 2025, Sidhartha Kumar <sidhartha.kumar@oracle.com> wrote:
> From: Sidhartha <sidhartha.kumar@oracle.com>
>
> v1[1] -> v2:
>   - rebase onto latest mainline v6.17-rc2
>   - fix build error in patch 1 per Intel Test Robot
>
> This series is part of a project to depcrecate the IDR in favor
> of the Xarray. This simplifies the code as locking is handled by
> the Xarray internally and removes the need for a seperate mutex to
> proect the IDR.

It would be great if the commit messages mentioned whether the
identifiers are expected to remain the same in the conversion.

BR,
Jani.

>
> The patches are from this tree and have been rebased to v6.17-rc2
> https://git.infradead.org/?p=users/willy/xarray.git;a=shortlog;h=refs/heads/xarray-conv
>
>
> The series has been compiled and tested with drivers/gpu/drm/tests/.kunitconfig
> and passes all tests.
>
> [15:22:04] Testing complete. Ran 608 tests: passed: 608
> [15:22:04] Elapsed time: 34.792s total, 3.086s configuring, 31.541s building, 0.141s running
>
> [1]: https://lore.kernel.org/dri-devel/20250818190046.157962-1-sidhartha.kumar@oracle.com/
>
> Matthew Wilcox (6):
>   drm: Convert aux_idr to XArray
>   drm: Convert object_name_idr to XArray
>   drm: Convert syncobj_idr to XArray
>   drm: Convert magic_map to XArray
>   drm: Convert lessee_idr to XArray
>   drm: Convert tile_idr to XArray
>
>  drivers/gpu/drm/display/drm_dp_aux_dev.c | 38 ++++++--------
>  drivers/gpu/drm/drm_auth.c               | 22 ++++----
>  drivers/gpu/drm/drm_connector.c          | 26 ++++------
>  drivers/gpu/drm/drm_debugfs.c            | 19 +++----
>  drivers/gpu/drm/drm_gem.c                | 11 ++--
>  drivers/gpu/drm/drm_lease.c              | 15 +++---
>  drivers/gpu/drm/drm_mode_config.c        |  3 +-
>  drivers/gpu/drm/drm_syncobj.c            | 64 ++++++++----------------
>  include/drm/drm_auth.h                   |  9 ++--
>  include/drm/drm_device.h                 |  4 +-
>  include/drm/drm_file.h                   |  6 +--
>  include/drm/drm_mode_config.h            | 12 ++---
>  12 files changed, 86 insertions(+), 143 deletions(-)

-- 
Jani Nikula, Intel
