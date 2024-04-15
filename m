Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 349F48A4DF9
	for <lists+dri-devel@lfdr.de>; Mon, 15 Apr 2024 13:46:56 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 16F9D1124BA;
	Mon, 15 Apr 2024 11:46:53 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="HVLEgLt8";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.10])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 1C9C91124BA;
 Mon, 15 Apr 2024 11:46:51 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1713181611; x=1744717611;
 h=from:to:cc:subject:in-reply-to:references:date:
 message-id:mime-version;
 bh=8hD/zCo3dMc9sBj2DmxpWjSOBMUhpMW6TV26WBfRLkg=;
 b=HVLEgLt8uwvQfwycFAYZSoyg2il11hI+h0yxXEEqZF6eNkQq4xBQ+olu
 ILP+Z7Z8ZkGC1+9ECqhXIidIUvmSkjmgJjech8C7i6Hzbq70l8c7It/ew
 AnORVlINLBMeYKp0KmyUuPpIEwdrTN7iyntb2vS3l+ex2VCuHPnorK3hO
 dlx2uk0vNDAfMLqwttMeDOk9EH2LN+qa+m0d/L02rUPTUuS7LSksktFfH
 apZHnEKCzxcJbHLrhyiztO3+EUQ9pmDE5gezkQRKGZo5mwN0FQYR9syyB
 UtFV4+5xBW7ZOWqTB2u+6cCTpz0dYDH82RqfsIXZFGuyha5W9jJoTq3Pt w==;
X-CSE-ConnectionGUID: PhPhrFbfQci0JYUDpxj7pw==
X-CSE-MsgGUID: uAXou0e2RDabE6qBpA3b1g==
X-IronPort-AV: E=McAfee;i="6600,9927,11044"; a="26024767"
X-IronPort-AV: E=Sophos;i="6.07,203,1708416000"; d="scan'208";a="26024767"
Received: from fmviesa007.fm.intel.com ([10.60.135.147])
 by orvoesa102.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 15 Apr 2024 04:46:50 -0700
X-CSE-ConnectionGUID: sSbn3VjyQYiKOdmG0uK7Bg==
X-CSE-MsgGUID: /M2xHSOfSUKvnxzaj5oH9Q==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.07,203,1708416000"; d="scan'208";a="21982567"
Received: from lcariou-mobl.ger.corp.intel.com (HELO localhost)
 ([10.252.61.121])
 by fmviesa007-auth.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 15 Apr 2024 04:46:48 -0700
From: Jani Nikula <jani.nikula@intel.com>
To: Animesh Manna <animesh.manna@intel.com>, intel-gfx@lists.freedesktop.org
Cc: dri-devel@lists.freedesktop.org, jouni.hogander@intel.com,
 arun.r.murthy@intel.com, Animesh Manna <animesh.manna@intel.com>
Subject: Re: [PATCH v2 2/6] drm/i915/alpm: Move alpm related code to a new file
In-Reply-To: <20240412155243.2891996-3-animesh.manna@intel.com>
Organization: Intel Finland Oy - BIC 0357606-4 - Westendinkatu 7, 02160 Espoo
References: <20240412155243.2891996-1-animesh.manna@intel.com>
 <20240412155243.2891996-3-animesh.manna@intel.com>
Date: Mon, 15 Apr 2024 14:46:37 +0300
Message-ID: <871q764zmq.fsf@intel.com>
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

On Fri, 12 Apr 2024, Animesh Manna <animesh.manna@intel.com> wrote:
> Move ALPM feature related code as it will be used for
> non-psr panel also thorugh LOBF feature.
>
> Signed-off-by: Animesh Manna <animesh.manna@intel.com>
> ---
>  drivers/gpu/drm/i915/Makefile             |   1 +
>  drivers/gpu/drm/i915/display/intel_alpm.c | 292 ++++++++++++++++++++++
>  drivers/gpu/drm/i915/display/intel_alpm.h |  18 ++
>  drivers/gpu/drm/i915/display/intel_psr.c  | 280 +--------------------
>  4 files changed, 314 insertions(+), 277 deletions(-)
>  create mode 100644 drivers/gpu/drm/i915/display/intel_alpm.c
>  create mode 100644 drivers/gpu/drm/i915/display/intel_alpm.h
>
> diff --git a/drivers/gpu/drm/i915/Makefile b/drivers/gpu/drm/i915/Makefile
> index af9e871daf1d..c12b7bd98320 100644
> --- a/drivers/gpu/drm/i915/Makefile
> +++ b/drivers/gpu/drm/i915/Makefile
> @@ -246,6 +246,7 @@ i915-y += \
>  	display/intel_atomic.o \
>  	display/intel_atomic_plane.o \
>  	display/intel_audio.o \
> +	display/intel_alpm.o \
>  	display/intel_bios.o \
>  	display/intel_bw.o \
>  	display/intel_cdclk.o \

That's not sorted.

BR,
Jani.


-- 
Jani Nikula, Intel
