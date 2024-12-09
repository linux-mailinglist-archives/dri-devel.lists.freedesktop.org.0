Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 1182A9E913F
	for <lists+dri-devel@lfdr.de>; Mon,  9 Dec 2024 12:03:00 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 1E55310E6BD;
	Mon,  9 Dec 2024 11:02:56 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="SQx8Uvzz";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.15])
 by gabe.freedesktop.org (Postfix) with ESMTPS id A83E010E6BD;
 Mon,  9 Dec 2024 11:02:54 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1733742174; x=1765278174;
 h=from:to:subject:in-reply-to:references:date:message-id:
 mime-version; bh=q2D1LX0udl2c+ATjj5IMgqtnJCdMO26UOIRx1T7bJnk=;
 b=SQx8Uvzzf+rNHLQhpt9I8PAn02yb0ws4v5HAKYsZytN4iWLKIJXwf/f8
 JUEmj/+sGsnwHSO24HN1ckUJwygPIoPN5bA0BUUiEaV1Asfuv5Da/Kt/T
 1pX19/b80fPTxQofGmJmN2/K0nVj7skWU4sVKl52Qt7ZGt2+OeOmBM5qr
 PM/TNWv7frQO501VPb5F8xeCCy2OVZd+8Yc/gsQJkWCboqZRl/6A8IxEt
 EtvLPOUUwvhmUPPMZns3Vr4al5R4WqlB/gX+4Hf7hv6VRMmEalI+l6rir
 XYvctyz4N7z8d8gz79AEQ3+bLok1Ofv7s+ztX//KWDPcUFhYfsEpI3yhk A==;
X-CSE-ConnectionGUID: ALf1p4z3RcKj13x2x7Yy/Q==
X-CSE-MsgGUID: BSy6b1VGQL+lelhUZOpl3g==
X-IronPort-AV: E=McAfee;i="6700,10204,11280"; a="37710550"
X-IronPort-AV: E=Sophos;i="6.12,219,1728975600"; d="scan'208";a="37710550"
Received: from fmviesa009.fm.intel.com ([10.60.135.149])
 by orvoesa107.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 09 Dec 2024 03:02:54 -0800
X-CSE-ConnectionGUID: 6Jy8THfGT/ezf1vWZUbQqQ==
X-CSE-MsgGUID: c1jc7O5NRqygZ33CFxi+5g==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.12,219,1728975600"; d="scan'208";a="95499131"
Received: from mklonows-mobl1.ger.corp.intel.com (HELO localhost)
 ([10.245.246.194])
 by fmviesa009-auth.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 09 Dec 2024 03:02:51 -0800
From: Jani Nikula <jani.nikula@intel.com>
To: dri-devel@lists.freedesktop.org, intel-gfx@lists.freedesktop.org,
 intel-xe@lists.freedesktop.org, Thomas Zimmermann <tzimmermann@suse.de>,
 Maxime Ripard <mripard@kernel.org>, Maarten Lankhorst
 <maarten.lankhorst@linux.intel.com>
Subject: Re: [PATCH 1/3] drm/print: add drm_print_hex_dump()
In-Reply-To: <f650fe1ed3e3bb74760426fa7461c3b028d661fb.1733392101.git.jani.nikula@intel.com>
Organization: Intel Finland Oy - BIC 0357606-4 - Westendinkatu 7, 02160 Espoo
References: <cover.1733392101.git.jani.nikula@intel.com>
 <f650fe1ed3e3bb74760426fa7461c3b028d661fb.1733392101.git.jani.nikula@intel.com>
Date: Mon, 09 Dec 2024 13:02:49 +0200
Message-ID: <87y10pyv8m.fsf@intel.com>
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

On Thu, 05 Dec 2024, Jani Nikula <jani.nikula@intel.com> wrote:
> Add a helper to print a hex dump to a struct drm_printer. There's no
> fancy formatting stuff, just 16 space-separated bytes per line, with an
> optional prefix.

drm-misc maintainers, ack for merging this via drm-intel-next?

BR,
Jani.


>
> Signed-off-by: Jani Nikula <jani.nikula@intel.com>
> ---
>  drivers/gpu/drm/drm_print.c | 23 +++++++++++++++++++++++
>  include/drm/drm_print.h     |  2 ++
>  2 files changed, 25 insertions(+)
>
> diff --git a/drivers/gpu/drm/drm_print.c b/drivers/gpu/drm/drm_print.c
> index 08cfea04e22b..79517bd4418f 100644
> --- a/drivers/gpu/drm/drm_print.c
> +++ b/drivers/gpu/drm/drm_print.c
> @@ -390,3 +390,26 @@ void drm_print_regset32(struct drm_printer *p, struct debugfs_regset32 *regset)
>  	}
>  }
>  EXPORT_SYMBOL(drm_print_regset32);
> +
> +/**
> + * drm_print_hex_dump - print a hex dump to a &drm_printer stream
> + * @p: The &drm_printer
> + * @prefix: Prefix for each line, may be NULL for no prefix
> + * @buf: Buffer to dump
> + * @len: Length of buffer
> + *
> + * Print hex dump to &drm_printer, with 16 space-separated hex bytes per line,
> + * optionally with a prefix on each line. No separator is added after prefix.
> + */
> +void drm_print_hex_dump(struct drm_printer *p, const char *prefix,
> +			const u8 *buf, size_t len)
> +{
> +	int i;
> +
> +	for (i = 0; i < len; i += 16) {
> +		int bytes_per_line = min(16, len - i);
> +
> +		drm_printf(p, "%s%*ph\n", prefix ?: "", bytes_per_line, buf + i);
> +	}
> +}
> +EXPORT_SYMBOL(drm_print_hex_dump);
> diff --git a/include/drm/drm_print.h b/include/drm/drm_print.h
> index b3906dc04388..f77fe1531cf8 100644
> --- a/include/drm/drm_print.h
> +++ b/include/drm/drm_print.h
> @@ -199,6 +199,8 @@ void drm_puts(struct drm_printer *p, const char *str);
>  void drm_print_regset32(struct drm_printer *p, struct debugfs_regset32 *regset);
>  void drm_print_bits(struct drm_printer *p, unsigned long value,
>  		    const char * const bits[], unsigned int nbits);
> +void drm_print_hex_dump(struct drm_printer *p, const char *prefix,
> +			const u8 *buf, size_t len);
>  
>  __printf(2, 0)
>  /**

-- 
Jani Nikula, Intel
