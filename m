Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 581049874F5
	for <lists+dri-devel@lfdr.de>; Thu, 26 Sep 2024 15:59:33 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 1D13289317;
	Thu, 26 Sep 2024 13:59:07 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="g5TChJV5";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.12])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 669B189317
 for <dri-devel@lists.freedesktop.org>; Thu, 26 Sep 2024 13:59:05 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1727359145; x=1758895145;
 h=from:to:cc:subject:in-reply-to:references:date:
 message-id:mime-version;
 bh=AFGLViuEZzwurRST5kRMHb6lWGfPVbnGmn8w007sXQI=;
 b=g5TChJV5U61suJk++FIKLZF1uMTMgNAUqWpGyFTQbKhGOlSOzrov8zux
 PxDwOG0WQ1fQySmwlDkH1vBZNH7INZt3Q95uzoURkfPQ7TuO4czey4tfq
 MyPhG8fvoLDG4DreCDWbL5iZ30zK8JqmpWn34AgtyWhSIZwq5Sbu30Fzk
 DA7HpOlaUJ/lmi9qA8EN3VYloQj/MO4Cc043iQ+U4Yty+3Q1AKPAROCKi
 OAHcGDKi9Axk30zrqAbl+7V+tlan1w2cj32buv/+bm2YhKwWZyei0wq7b
 NtZOarAMr/o8cd8gzlpUFkncOY67ePgTuyoBQNdgVs+z+q1zkJ8dDDZI0 g==;
X-CSE-ConnectionGUID: dhJf158YTIi1virJniqipw==
X-CSE-MsgGUID: JGMM/mvdTJeGRqc7eUlRgg==
X-IronPort-AV: E=McAfee;i="6700,10204,11207"; a="37834904"
X-IronPort-AV: E=Sophos;i="6.11,155,1725346800"; d="scan'208";a="37834904"
Received: from fmviesa003.fm.intel.com ([10.60.135.143])
 by orvoesa104.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 26 Sep 2024 06:59:05 -0700
X-CSE-ConnectionGUID: Zbv3BZWVSxaMkLdF90MYlg==
X-CSE-MsgGUID: lFSWm2lRQPyBVk+BlIocPQ==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.11,155,1725346800"; d="scan'208";a="76247123"
Received: from jnikula-mobl4.fi.intel.com (HELO localhost) ([10.237.66.160])
 by fmviesa003-auth.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 26 Sep 2024 06:59:02 -0700
From: Jani Nikula <jani.nikula@linux.intel.com>
To: Andi Kleen <ak@linux.intel.com>, maarten.lankhorst@linux.intel.com
Cc: mripard@kernel.org, tzimmermann@suse.de, airlied@gmail.com,
 simona@ffwll.ch, dri-devel@lists.freedesktop.org, Andi Kleen
 <ak@linux.intel.com>
Subject: Re: [PATCH] drm: Print bad EDID notices only once
In-Reply-To: <20240926133253.2623342-1-ak@linux.intel.com>
Organization: Intel Finland Oy - BIC 0357606-4 - Westendinkatu 7, 02160 Espoo
References: <20240926133253.2623342-1-ak@linux.intel.com>
Date: Thu, 26 Sep 2024 16:59:00 +0300
Message-ID: <878qve1pp7.fsf@intel.com>
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

On Thu, 26 Sep 2024, Andi Kleen <ak@linux.intel.com> wrote:
> I have an old monitor that reports a zero EDID block, which results in a
> warning message. This happens on every screen save cycle, and maybe in
> some other situations, and over time the whole kernel log gets filled
> with these redundant messages. Printing it only once should be
> sufficient.
>
> Mark all the bad EDID notices as _once.

I'm afraid this is too big of a hammer. If it was possible to make this
once per display, fine, but this silences all same type warnings for all
EDID blocks for all subsequently plugged in displays.

For example, you try to plug in a display, get errors, try another
display because of that, and you no longer see warnings for the other
display.

But I hear you. I'll try to think of alternatives.

BR,
Jani.


>
> Signed-off-by: Andi Kleen <ak@linux.intel.com>
> ---
>  drivers/gpu/drm/drm_edid.c | 8 ++++----
>  1 file changed, 4 insertions(+), 4 deletions(-)
>
> diff --git a/drivers/gpu/drm/drm_edid.c b/drivers/gpu/drm/drm_edid.c
> index 855beafb76ff..d6b47bdcd5d7 100644
> --- a/drivers/gpu/drm/drm_edid.c
> +++ b/drivers/gpu/drm/drm_edid.c
> @@ -1916,10 +1916,10 @@ static void edid_block_status_print(enum edid_block_status status,
>  		pr_debug("EDID block %d pointer is NULL\n", block_num);
>  		break;
>  	case EDID_BLOCK_ZERO:
> -		pr_notice("EDID block %d is all zeroes\n", block_num);
> +		pr_notice_once("EDID block %d is all zeroes\n", block_num);
>  		break;
>  	case EDID_BLOCK_HEADER_CORRUPT:
> -		pr_notice("EDID has corrupt header\n");
> +		pr_notice_once("EDID has corrupt header\n");
>  		break;
>  	case EDID_BLOCK_HEADER_REPAIR:
>  		pr_debug("EDID corrupt header needs repair\n");
> @@ -1933,13 +1933,13 @@ static void edid_block_status_print(enum edid_block_status status,
>  				 block_num, edid_block_tag(block),
>  				 edid_block_compute_checksum(block));
>  		} else {
> -			pr_notice("EDID block %d (tag 0x%02x) checksum is invalid, remainder is %d\n",
> +			pr_notice_once("EDID block %d (tag 0x%02x) checksum is invalid, remainder is %d\n",
>  				  block_num, edid_block_tag(block),
>  				  edid_block_compute_checksum(block));
>  		}
>  		break;
>  	case EDID_BLOCK_VERSION:
> -		pr_notice("EDID has major version %d, instead of 1\n",
> +		pr_notice_once("EDID has major version %d, instead of 1\n",
>  			  block->version);
>  		break;
>  	default:

-- 
Jani Nikula, Intel
