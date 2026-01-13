Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 1321AD1774A
	for <lists+dri-devel@lfdr.de>; Tue, 13 Jan 2026 10:03:13 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 494F710E47C;
	Tue, 13 Jan 2026 09:03:10 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="VShFRP5Y";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.21])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 66C5510E477;
 Tue, 13 Jan 2026 09:03:08 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1768294989; x=1799830989;
 h=from:to:cc:subject:in-reply-to:references:date:
 message-id:mime-version;
 bh=F+RBgp89UrZQ95lkqzylh88BsrT3lQFaONj7YLfxHyw=;
 b=VShFRP5YcxaL7ehd3MvXsIDf5GbfYLH06QJ+S1L/R51hbNx3dohkfXGD
 qzVSAjPovdW8sUs0twLUuTaEbo3owxkcvp0zVTZCZ2r+Ya0P44GLyrIpH
 VEpnAMvSpKImleaqcX0/TZm0yUgiv/XuW5yTu+fqPMC9yxxUmLARHC/Mb
 ccGI/At3Ly5+nBVz6RfePIaoMaVLknsWAUadzDTt3pMqgjE2SK/M1079N
 b+t6FwZeU0lW3a1lhSIenNfVeLOMDN/OQRbzf0R38zvLmIjaMV1mz37RV
 vru+Lic7xOJkh8hCK0AceEibJZHXWZx9rrKp/fCkaLqIS614OrtyqCmR2 A==;
X-CSE-ConnectionGUID: 5GV+WJlvR7iiTua3QSPhaA==
X-CSE-MsgGUID: cxcjMyhxSJGJAmYrFaTu1Q==
X-IronPort-AV: E=McAfee;i="6800,10657,11669"; a="69497602"
X-IronPort-AV: E=Sophos;i="6.21,222,1763452800"; d="scan'208";a="69497602"
Received: from fmviesa007.fm.intel.com ([10.60.135.147])
 by orvoesa113.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 13 Jan 2026 01:03:09 -0800
X-CSE-ConnectionGUID: hShWtEyQRCK+mpavPkG4rg==
X-CSE-MsgGUID: cYStHHdCQ5WOjB2xp6FKQw==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.21,222,1763452800"; d="scan'208";a="203969515"
Received: from jkrzyszt-mobl2.ger.corp.intel.com (HELO localhost)
 ([10.245.246.36])
 by fmviesa007-auth.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 13 Jan 2026 01:03:05 -0800
From: Jani Nikula <jani.nikula@linux.intel.com>
To: Kaushlendra Kumar <kaushlendra.kumar@intel.com>, rodrigo.vivi@intel.com,
 joonas.lahtinen@linux.intel.com, tursulin@ursulin.net, airlied@gmail.com,
 simona@ffwll.ch
Cc: intel-gfx@lists.freedesktop.org, intel-xe@lists.freedesktop.org,
 dri-devel@lists.freedesktop.org, Kaushlendra Kumar
 <kaushlendra.kumar@intel.com>
Subject: Re: [PATCH v2] drm/i915/bios: Use get_unaligned_* for VBT block size
In-Reply-To: <20260113085553.2736470-1-kaushlendra.kumar@intel.com>
Organization: Intel Finland Oy - BIC 0357606-4 - c/o Alberga Business Park,
 6 krs Bertel Jungin Aukio 5, 02600 Espoo, Finland
References: <20260113085553.2736470-1-kaushlendra.kumar@intel.com>
Date: Tue, 13 Jan 2026 11:03:02 +0200
Message-ID: <a5360c7a7d3804e9a99eb2eac74a8250a56b08d5@intel.com>
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

On Tue, 13 Jan 2026, Kaushlendra Kumar <kaushlendra.kumar@intel.com> wrote:
> Replace pointer casts with get_unaligned_* helpers for VBT
> block size reads. This ensures endianness and alignment
> correctness in VBT parsing.
>
> Signed-off-by: Kaushlendra Kumar <kaushlendra.kumar@intel.com>
> ---
> v2: Fix include ordering, as per review

And what about the other *((const u32 *)(...)) etc. usages?

BR,
Jani.

>
>  drivers/gpu/drm/i915/display/intel_bios.c | 5 +++--
>  1 file changed, 3 insertions(+), 2 deletions(-)
>
> diff --git a/drivers/gpu/drm/i915/display/intel_bios.c b/drivers/gpu/drm/i915/display/intel_bios.c
> index 4b41068e9e35..a4c0f8a605c4 100644
> --- a/drivers/gpu/drm/i915/display/intel_bios.c
> +++ b/drivers/gpu/drm/i915/display/intel_bios.c
> @@ -27,6 +27,7 @@
>  
>  #include <linux/debugfs.h>
>  #include <linux/firmware.h>
> +#include <linux/unaligned.h>
>  
>  #include <drm/display/drm_dp_helper.h>
>  #include <drm/display/drm_dsc_helper.h>
> @@ -85,9 +86,9 @@ static u32 _get_blocksize(const u8 *block_base)
>  {
>  	/* The MIPI Sequence Block v3+ has a separate size field. */
>  	if (*block_base == BDB_MIPI_SEQUENCE && *(block_base + 3) >= 3)
> -		return *((const u32 *)(block_base + 4));
> +		return get_unaligned_le32(block_base + 4);
>  	else
> -		return *((const u16 *)(block_base + 1));
> +		return get_unaligned_le16(block_base + 1);
>  }
>  
>  /* Get BDB block size give a pointer to data after Block ID and Block Size. */

-- 
Jani Nikula, Intel
