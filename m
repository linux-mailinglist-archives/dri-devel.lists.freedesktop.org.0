Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 6CBACD1E941
	for <lists+dri-devel@lfdr.de>; Wed, 14 Jan 2026 12:55:52 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 2168610E5FE;
	Wed, 14 Jan 2026 11:55:50 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="QttuxlRO";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.15])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 7A63210E1AA;
 Wed, 14 Jan 2026 11:55:48 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1768391749; x=1799927749;
 h=from:to:cc:subject:in-reply-to:references:date:
 message-id:mime-version;
 bh=p6wmP82La1AltMd+68urVK/bizq90Gs307bg/gwPLyo=;
 b=QttuxlROErHE/jgZcpS9aG85Q1IZjMrQ1ULBfn2rTh3JL5gYQUDjeTmP
 g/s7Yd0Zrqv8ZjWI6kYP4k29ThLVih9s7HgkrMErZsv7h4PXx47djbQC0
 tkn53uvuJtcF2ymd6x97Tp/J5sqJBUTk+rXacc4H6MDUIlAo149FDA/WM
 J9Ybe/MjPqYBA0bhFqxVhSsyFcPxy4BeRCUhrvQkBLgID/QyPZegtuATO
 5kfvDTaDNEyaSNTit2PNYWFosOm/lHt3Ucm4rrddEV61IMeUAGrRbCkT1
 6OfyQtKvTKrukhnI/hanuFLW9xbxUkaZEIXwLxmraBDJJJhxbcN/WqRkf A==;
X-CSE-ConnectionGUID: eZLK86lgQCGxKmVeW4mqjA==
X-CSE-MsgGUID: ezSjxiMMSsi8NYHWfnDI8w==
X-IronPort-AV: E=McAfee;i="6800,10657,11670"; a="69771885"
X-IronPort-AV: E=Sophos;i="6.21,225,1763452800"; d="scan'208";a="69771885"
Received: from orviesa002.jf.intel.com ([10.64.159.142])
 by fmvoesa109.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 14 Jan 2026 03:55:48 -0800
X-CSE-ConnectionGUID: IbkfbYjmQFCFzuO1f3G/yA==
X-CSE-MsgGUID: CS7Y4SjMT76VQncXgUfs3w==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.21,225,1763452800"; d="scan'208";a="235377270"
Received: from klitkey1-mobl1.ger.corp.intel.com (HELO localhost)
 ([10.245.246.94])
 by orviesa002-auth.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 14 Jan 2026 03:55:44 -0800
From: Jani Nikula <jani.nikula@linux.intel.com>
To: Kaushlendra Kumar <kaushlendra.kumar@intel.com>, rodrigo.vivi@intel.com,
 joonas.lahtinen@linux.intel.com, tursulin@ursulin.net, airlied@gmail.com,
 simona@ffwll.ch
Cc: intel-gfx@lists.freedesktop.org, intel-xe@lists.freedesktop.org,
 dri-devel@lists.freedesktop.org, Kaushlendra Kumar
 <kaushlendra.kumar@intel.com>
Subject: Re: [PATCH v3] drm/i915/bios: Use get_unaligned_* for VBT block size
In-Reply-To: <20260114030145.3039094-1-kaushlendra.kumar@intel.com>
Organization: Intel Finland Oy - BIC 0357606-4 - c/o Alberga Business Park,
 6 krs Bertel Jungin Aukio 5, 02600 Espoo, Finland
References: <20260114030145.3039094-1-kaushlendra.kumar@intel.com>
Date: Wed, 14 Jan 2026 13:55:41 +0200
Message-ID: <b0555ac8dec0e8e8fb0870cfc1cd05f4746dde0e@intel.com>
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

On Wed, 14 Jan 2026, Kaushlendra Kumar <kaushlendra.kumar@intel.com> wrote:
> Replace pointer casts with get_unaligned_* helpers for VBT
> block size reads. This ensures endianness and alignment
> correctness in VBT parsing.
>
> Signed-off-by: Kaushlendra Kumar <kaushlendra.kumar@intel.com>

Reviewed-by: Jani Nikula <jani.nikula@intel.com>

> ---
> v2: Fix include ordering, as per review
> v3: Update all instances in file, not just _get_blocksize
>
>  drivers/gpu/drm/i915/display/intel_bios.c | 13 +++++++------
>  1 file changed, 7 insertions(+), 6 deletions(-)
>
> diff --git a/drivers/gpu/drm/i915/display/intel_bios.c b/drivers/gpu/drm/i915/display/intel_bios.c
> index 4b41068e9e35..91286fafa52b 100644
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
> @@ -1791,9 +1792,9 @@ find_panel_sequence_block(struct intel_display *display,
>  
>  		current_id = *(data + index);
>  		if (sequence->version >= 3)
> -			current_size = *((const u32 *)(data + index + 1));
> +			current_size = get_unaligned_le32(data + index + 1);
>  		else
> -			current_size = *((const u16 *)(data + index + 1));
> +			current_size = get_unaligned_le16(data + index + 1);
>  
>  		index += header_size;
>  
> @@ -1833,7 +1834,7 @@ static int goto_next_sequence(struct intel_display *display,
>  			if (index + 4 > total)
>  				return 0;
>  
> -			len = *((const u16 *)(data + index + 2)) + 4;
> +			len = get_unaligned_le16(data + index + 2) + 4;
>  			break;
>  		case MIPI_SEQ_ELEM_DELAY:
>  			len = 4;
> @@ -1879,7 +1880,7 @@ static int goto_next_sequence_v3(struct intel_display *display,
>  	 * includes MIPI_SEQ_ELEM_END byte, excludes the final MIPI_SEQ_END
>  	 * byte.
>  	 */
> -	size_of_sequence = *((const u32 *)(data + index));
> +	size_of_sequence = get_unaligned_le32(data + index);
>  	index += 4;
>  
>  	seq_end = index + size_of_sequence;

-- 
Jani Nikula, Intel
