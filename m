Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id E90ADD17591
	for <lists+dri-devel@lfdr.de>; Tue, 13 Jan 2026 09:43:48 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id D254D10E472;
	Tue, 13 Jan 2026 08:43:46 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="Xa+e3/4Y";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.14])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 7521510E470;
 Tue, 13 Jan 2026 08:43:44 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1768293825; x=1799829825;
 h=from:to:cc:subject:in-reply-to:references:date:
 message-id:mime-version;
 bh=vU6HbpGBDh1oeOphbmzlkf3FTt5EpLymMNLwQFj5r3E=;
 b=Xa+e3/4Y/su/RjO4PXw/47Fyr+fJ7MKwoLeaz1JdWiPBAVeD0FOCYxTd
 GyVRDSWvtqbg6jqL3IvFf3TxIA/1/pipdPTggzgy6JIGtkbvQJ9c8VYGX
 cI0ghj65ebbw6RF120eVeKgSy9w+tmRRemLtM7dsT7ZQma5qBrs/1EXI6
 9lmGuAfdMyP9+x4iINYfiIoSCCbzk13dZwGke9gJUo438uSDSZDNLqI0K
 g/RT1olUSL5BvccZyt1id5V32d3BBdZuROnVioNtiJpZh+9oP53+u7OI6
 L+Ivs5kKiPr2gysn1148tSxg0/Zjf3Mxe8tXUsy/olcN/xCrwynBMYJms Q==;
X-CSE-ConnectionGUID: fSL6DlLgQDyh24TY/pXKcg==
X-CSE-MsgGUID: ACB+be5XQ7+jFkVlfGS6DQ==
X-IronPort-AV: E=McAfee;i="6800,10657,11669"; a="69627224"
X-IronPort-AV: E=Sophos;i="6.21,222,1763452800"; d="scan'208";a="69627224"
Received: from fmviesa003.fm.intel.com ([10.60.135.143])
 by fmvoesa108.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 13 Jan 2026 00:43:44 -0800
X-CSE-ConnectionGUID: dPmuvJA1RyaW1ayXqbsZSQ==
X-CSE-MsgGUID: MtDRQywjSHinMpTz/Fs5qA==
X-ExtLoop1: 1
Received: from jkrzyszt-mobl2.ger.corp.intel.com (HELO localhost)
 ([10.245.246.36])
 by fmviesa003-auth.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 13 Jan 2026 00:43:41 -0800
From: Jani Nikula <jani.nikula@linux.intel.com>
To: Kaushlendra Kumar <kaushlendra.kumar@intel.com>, rodrigo.vivi@intel.com,
 joonas.lahtinen@linux.intel.com, tursulin@ursulin.net, airlied@gmail.com,
 simona@ffwll.ch
Cc: intel-gfx@lists.freedesktop.org, intel-xe@lists.freedesktop.org,
 dri-devel@lists.freedesktop.org, Kaushlendra Kumar
 <kaushlendra.kumar@intel.com>
Subject: Re: [PATCH] drm/i915/bios: Use get_unaligned_* for VBT block size
In-Reply-To: <20260113031210.330128-1-kaushlendra.kumar@intel.com>
Organization: Intel Finland Oy - BIC 0357606-4 - c/o Alberga Business Park,
 6 krs Bertel Jungin Aukio 5, 02600 Espoo, Finland
References: <20260113031210.330128-1-kaushlendra.kumar@intel.com>
Date: Tue, 13 Jan 2026 10:43:38 +0200
Message-ID: <a15f6e8a6ab43f2dbaa2b33c606ee001f6ed38cd@intel.com>
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
>  drivers/gpu/drm/i915/display/intel_bios.c | 5 +++--
>  1 file changed, 3 insertions(+), 2 deletions(-)
>
> diff --git a/drivers/gpu/drm/i915/display/intel_bios.c b/drivers/gpu/drm/i915/display/intel_bios.c
> index 4b41068e9e35..dd1b3f629428 100644
> --- a/drivers/gpu/drm/i915/display/intel_bios.c
> +++ b/drivers/gpu/drm/i915/display/intel_bios.c
> @@ -45,6 +45,7 @@
>  
>  #define _INTEL_BIOS_PRIVATE
>  #include "intel_vbt_defs.h"
> +#include <linux/unaligned.h>

Please put the include next to other linux/ includes, sorted.

>  
>  /**
>   * DOC: Video BIOS Table (VBT)
> @@ -85,9 +86,9 @@ static u32 _get_blocksize(const u8 *block_base)
>  {
>  	/* The MIPI Sequence Block v3+ has a separate size field. */
>  	if (*block_base == BDB_MIPI_SEQUENCE && *(block_base + 3) >= 3)
> -		return *((const u32 *)(block_base + 4));
> +		return get_unaligned_le32(block_base + 4);
>  	else
> -		return *((const u16 *)(block_base + 1));
> +		return get_unaligned_le16(block_base + 1);

There's a handful of other places in the file that could use the same
treatment.

BR,
Jani.

>  }
>  
>  /* Get BDB block size give a pointer to data after Block ID and Block Size. */

-- 
Jani Nikula, Intel
