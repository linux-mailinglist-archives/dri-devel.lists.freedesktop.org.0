Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 7BEE688FB1E
	for <lists+dri-devel@lfdr.de>; Thu, 28 Mar 2024 10:22:12 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 8FBBB11239B;
	Thu, 28 Mar 2024 09:22:07 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="hW8unag5";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.12])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 86637112394;
 Thu, 28 Mar 2024 09:22:05 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1711617726; x=1743153726;
 h=from:to:cc:subject:in-reply-to:references:date:
 message-id:mime-version;
 bh=56VzBJDdG09AgVdAdo0OY/Q8rNtLd83NBvcSoy3wW0Q=;
 b=hW8unag54yPsAd+GpqRzr6RP2/Iue8+u8s0ZUFDS/1ggDRCKmpbie35S
 v03abV1grhd5RN/ZNc05zQ1Gzlp7sNBzB9R8TyQ3LdLp9ogJrD7WSkAUj
 xo5+6X4Z8jsEyLnlalaUcLdVr4uP/9TkuPa2zsWJIvjuYGCqatvQdj8x2
 1J3sO4nwB8krP6Y/MldgEkCwhE9qPOm65qBuT9Zq3Y02PtWEOTcaNkXbW
 efQ4yYjgepa76/yKMqGyWG2OnB8gQ4WkO3vp37R48CnMvuJD0PIChnpUI
 hCRCO3+5LUh2KYZZp4BUIPml2xAjOS8uyh9O7fdhlNgncQLZjtnDmm5XK g==;
X-CSE-ConnectionGUID: LBHNdgc4Trujy3QyHO4QQw==
X-CSE-MsgGUID: FvoxkoebTGO1pWSZQ0m3dg==
X-IronPort-AV: E=McAfee;i="6600,9927,11026"; a="18193127"
X-IronPort-AV: E=Sophos;i="6.07,161,1708416000"; d="scan'208";a="18193127"
Received: from fmviesa009.fm.intel.com ([10.60.135.149])
 by orvoesa104.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 28 Mar 2024 02:21:35 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.07,161,1708416000"; d="scan'208";a="16615176"
Received: from abdulqaf-mobl2.amr.corp.intel.com (HELO localhost)
 ([10.252.57.138])
 by fmviesa009-auth.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 28 Mar 2024 02:21:30 -0700
From: Jani Nikula <jani.nikula@linux.intel.com>
To: Melissa Wen <mwen@igalia.com>, Harry Wentland <harry.wentland@amd.com>,
 Alex Deucher <alexander.deucher@amd.com>, Leo Li <sunpeng.li@amd.com>,
 Rodrigo Siqueira <Rodrigo.Siqueira@amd.com>, christian.koenig@amd.com,
 Xinhui.Pan@amd.com, Alex Hung <alex.hung@amd.com>, Mario Limonciello
 <mario.limonciello@amd.com>, airlied@gmail.com, daniel@ffwll.ch
Cc: amd-gfx@lists.freedesktop.org, kernel-dev@igalia.com,
 dri-devel@lists.freedesktop.org
Subject: Re: [RFC PATCH v3 0/6] drm/amd/display: switch amdgpu_dm_connector
 to use struct drm_edid
In-Reply-To: <20240327214953.367126-1-mwen@igalia.com>
Organization: Intel Finland Oy - BIC 0357606-4 - Westendinkatu 7, 02160 Espoo
References: <20240327214953.367126-1-mwen@igalia.com>
Date: Thu, 28 Mar 2024 11:21:26 +0200
Message-ID: <87zfuig19l.fsf@intel.com>
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

On Wed, 27 Mar 2024, Melissa Wen <mwen@igalia.com> wrote:
> 2. Most of the edid data handled by `dm_helpers_parse_edid_caps()` are
>    in drm_edid halpers, but there are still a few that are not managed by
>    them yet. For example:
>    ```
> 	edid_caps->serial_number = edid_buf->serial;
> 	edid_caps->manufacture_week = edid_buf->mfg_week;
> 	edid_caps->manufacture_year = edid_buf->mfg_year;
>    ```
>    AFAIU I see the same pending issue in i915/pnpid_get_panel_type() -
>    that still uses drm_edid_raw().

See https://lore.kernel.org/r/cover.1711015462.git.jani.nikula@intel.com

BR,
Jani.


-- 
Jani Nikula, Intel
