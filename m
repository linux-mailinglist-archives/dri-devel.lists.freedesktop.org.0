Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id B5870B4A83A
	for <lists+dri-devel@lfdr.de>; Tue,  9 Sep 2025 11:38:04 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 0691610E66D;
	Tue,  9 Sep 2025 09:38:01 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="BgL6+bpu";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.20])
 by gabe.freedesktop.org (Postfix) with ESMTPS id E5E9E10E14B;
 Tue,  9 Sep 2025 09:37:59 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1757410680; x=1788946680;
 h=from:to:cc:subject:in-reply-to:references:date:
 message-id:mime-version;
 bh=2dxrR/13GPtFm/zHXt3HnYGnUU5I47Y1DHLimwhq4RA=;
 b=BgL6+bpuxV9bGJRuH/7jZXY0xSeSr4p0e7M3vbJHjNavn7j2QonpD9VV
 mI8naWerlTkDPIyGlvRcxxwUruJHQ74W9M4WNRJv4zMVrHwkq4dLUP0Xo
 7J9yDC2ex2hXBQ/X56z50R1accXzKTGmqFfJtJCiDJj6Iw+5x3oVuhGAG
 ltritZUJl4GB5U1LfcfZ27rwSKNg98wsITbdFHoxg+veeNxU8m9auqWvH
 zNU8GZRZR7krpbIi4OpJud0devAQ5KgAAQsXg8Uyde6jAC/Pgdp5jfk7j
 PYXNzGMovYwTx9tHoCIEvZ5R7BLe19r3NM1iDWRWuy8giHheqmiuYKB7T w==;
X-CSE-ConnectionGUID: Zjy27giPSQC+XbjoVZROlQ==
X-CSE-MsgGUID: 2zOE8M9LTeOav6Hqw2VCVQ==
X-IronPort-AV: E=McAfee;i="6800,10657,11547"; a="59382791"
X-IronPort-AV: E=Sophos;i="6.18,251,1751266800"; d="scan'208";a="59382791"
Received: from orviesa009.jf.intel.com ([10.64.159.149])
 by orvoesa112.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 09 Sep 2025 02:38:00 -0700
X-CSE-ConnectionGUID: wnV99jvDTH2ivMVyY8oc8Q==
X-CSE-MsgGUID: Yvc0720kQdKG33v+u49SnQ==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.18,251,1751266800"; d="scan'208";a="172612349"
Received: from mjarzebo-mobl1.ger.corp.intel.com (HELO localhost)
 ([10.245.246.25])
 by orviesa009-auth.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 09 Sep 2025 02:37:57 -0700
From: Jani Nikula <jani.nikula@linux.intel.com>
To: S Sebinraj <s.sebinraj@intel.com>, intel-gfx@lists.freedesktop.org,
 dri-devel@lists.freedesktop.org
Cc: jeevaka.badrappan@intel.com, S Sebinraj <s.sebinraj@intel.com>
Subject: Re: [PATCH v2 2/2] drm/xe: Add DRM GPU frequency tracepoint to Xe
In-Reply-To: <20250909085919.168658-3-s.sebinraj@intel.com>
Organization: Intel Finland Oy - BIC 0357606-4 - Westendinkatu 7, 02160 Espoo
References: <20250909085919.168658-1-s.sebinraj@intel.com>
 <20250909085919.168658-3-s.sebinraj@intel.com>
Date: Tue, 09 Sep 2025 12:37:54 +0300
Message-ID: <36d9a9fa950f695a17f28ed48085626092583858@intel.com>
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

On Tue, 09 Sep 2025, S Sebinraj <s.sebinraj@intel.com> wrote:
> diff --git a/drivers/gpu/drm/xe/xe_gpu_freq_trace.h b/drivers/gpu/drm/xe/xe_gpu_freq_trace.h
> new file mode 100644
> index 000000000000..f188d529ae60
> --- /dev/null
> +++ b/drivers/gpu/drm/xe/xe_gpu_freq_trace.h
> @@ -0,0 +1,14 @@
> +/* SPDX-License-Identifier: GPL-2.0 */
> +/*
> + * GPU frequency trace wrapper for xe_pmu.c
> + * This header provides access to the gpu_frequency tracepoint
> + */
> +#ifndef _XE_GPU_FREQ_TRACE_H_
> +#define _XE_GPU_FREQ_TRACE_H_
> +
> +#include "../drm_gpu_frequency_trace.h"

This is a no go. You can't include drm headers with relative paths like
this. Basically none of the drm headers inside drivers/gpu/drm/ are for
drivers, they're internal. Indeed, they usually have _internal.h suffix
to emphasize that.

Headers for drivers need to be placed under include/drm/

BR,
Jani.


-- 
Jani Nikula, Intel
