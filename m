Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id A80407E1FD9
	for <lists+dri-devel@lfdr.de>; Mon,  6 Nov 2023 12:23:28 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 6703A10E2CF;
	Mon,  6 Nov 2023 11:23:25 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mgamail.intel.com (mgamail.intel.com [134.134.136.65])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 8F3F410E02C;
 Mon,  6 Nov 2023 11:23:22 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1699269802; x=1730805802;
 h=from:to:cc:subject:in-reply-to:references:date:
 message-id:mime-version;
 bh=mHD5i5vDa1OTKSAAbvoZP2HSropGa5tKX66nmBUNaYk=;
 b=OZ230BlHYihfIpX7OHqE6UVevqcB8WkfUqi1QWVX1yXWp+msxzEHrQu7
 xZZC3UV1nm+ZJgsTKlmLlubi7tZHVOb4tlxi0RkUnFtc44AduZpg9Co4/
 YM1A5+pz/NVrDj8UTLm3lYWHqm4+jCchwJhiSNxxahabxt3oHCRalOPfl
 sSvEwmIr0UQ/D+DHSJKeEx1Pi16Y9dFnyPc4oEUAnnTvkMC3oiWFMkLpE
 K6XjaHAhYtbEdO0IETZP9VmgYuiuPTyFmmksw6RbU7EB5OzZLkDfecwwq
 RoIaGfVTX7JrIw6MLSYVWNFcpGldlL8NMr/UbHiP/81K0YKEh0ILAgXko A==;
X-IronPort-AV: E=McAfee;i="6600,9927,10885"; a="393150981"
X-IronPort-AV: E=Sophos;i="6.03,281,1694761200"; d="scan'208";a="393150981"
Received: from fmviesa002.fm.intel.com ([10.60.135.142])
 by orsmga103.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 06 Nov 2023 03:23:21 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.03,281,1694761200"; 
   d="scan'208";a="3597494"
Received: from lpilolli-mobl.ger.corp.intel.com (HELO localhost)
 ([10.252.36.222])
 by fmviesa002-auth.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 06 Nov 2023 03:23:17 -0800
From: Jani Nikula <jani.nikula@linux.intel.com>
To: Abhinav Singh <singhabhinav9051571833@gmail.com>,
 alexander.deucher@amd.com, christian.koenig@amd.com, Xinhui.Pan@amd.com,
 airlied@gmail.com, daniel@ffwll.ch
Subject: Re: [PATCH] drivers: gpu: Fix warning using plain integer as NULL
In-Reply-To: <20231103155013.332367-1-singhabhinav9051571833@gmail.com>
Organization: Intel Finland Oy - BIC 0357606-4 - Westendinkatu 7, 02160 Espoo
References: <20231103155013.332367-1-singhabhinav9051571833@gmail.com>
Date: Mon, 06 Nov 2023 13:23:14 +0200
Message-ID: <87sf5jyvkt.fsf@intel.com>
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
Cc: Abhinav Singh <singhabhinav9051571833@gmail.com>,
 linux-kernel-mentees@lists.linuxfoundation.org, amd-gfx@lists.freedesktop.org,
 dri-devel@lists.freedesktop.org, linux-kernel@vger.kernel.org
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

On Fri, 03 Nov 2023, Abhinav Singh <singhabhinav9051571833@gmail.com> wrote:
> sparse static analysis tools generate a warning with this message
> "Using plain integer as NULL pointer". In this case this warning is
> being shown because we are trying to intialize a pointer to NULL using
> integer value 0.
>
> Signed-off-by: Abhinav Singh <singhabhinav9051571833@gmail.com>
> ---
>  drivers/gpu/drm/radeon/clearstate_evergreen.h | 8 ++++----
>  1 file changed, 4 insertions(+), 4 deletions(-)
>
> diff --git a/drivers/gpu/drm/radeon/clearstate_evergreen.h b/drivers/gpu/drm/radeon/clearstate_evergreen.h
> index 63a1ffbb3ced..3b645558f133 100644
> --- a/drivers/gpu/drm/radeon/clearstate_evergreen.h
> +++ b/drivers/gpu/drm/radeon/clearstate_evergreen.h
> @@ -1049,7 +1049,7 @@ static const struct cs_extent_def SECT_CONTEXT_defs[] =
>      {SECT_CONTEXT_def_5, 0x0000a29e, 5 },
>      {SECT_CONTEXT_def_6, 0x0000a2a5, 56 },
>      {SECT_CONTEXT_def_7, 0x0000a2de, 290 },
> -    { 0, 0, 0 }
> +    { NULL, 0, 0 }

Random drive-by comment:

I'd just use {} as the sentinel.

BR,
Jani.

>  };
>  static const u32 SECT_CLEAR_def_1[] =
>  {
> @@ -1060,7 +1060,7 @@ static const u32 SECT_CLEAR_def_1[] =
>  static const struct cs_extent_def SECT_CLEAR_defs[] =
>  {
>      {SECT_CLEAR_def_1, 0x0000ffc0, 3 },
> -    { 0, 0, 0 }
> +    { NULL, 0, 0 }
>  };
>  static const u32 SECT_CTRLCONST_def_1[] =
>  {
> @@ -1070,11 +1070,11 @@ static const u32 SECT_CTRLCONST_def_1[] =
>  static const struct cs_extent_def SECT_CTRLCONST_defs[] =
>  {
>      {SECT_CTRLCONST_def_1, 0x0000f3fc, 2 },
> -    { 0, 0, 0 }
> +    { NULL, 0, 0 }
>  };
>  static const struct cs_section_def evergreen_cs_data[] = {
>      { SECT_CONTEXT_defs, SECT_CONTEXT },
>      { SECT_CLEAR_defs, SECT_CLEAR },
>      { SECT_CTRLCONST_defs, SECT_CTRLCONST },
> -    { 0, SECT_NONE }
> +    { NULL, SECT_NONE }
>  };
> --
> 2.39.2
>

-- 
Jani Nikula, Intel
