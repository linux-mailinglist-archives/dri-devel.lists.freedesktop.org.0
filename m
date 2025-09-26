Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 7A07BBA45DA
	for <lists+dri-devel@lfdr.de>; Fri, 26 Sep 2025 17:11:51 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 3CB7D10EA81;
	Fri, 26 Sep 2025 15:11:48 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="m1vgq2P6";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.19])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 2239C10EA81;
 Fri, 26 Sep 2025 15:11:47 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1758899507; x=1790435507;
 h=from:to:cc:subject:in-reply-to:references:date:
 message-id:mime-version:content-transfer-encoding;
 bh=Y89khyRpiYDOLDHm1ECbQ9RMnt3cKWk6rerOlVT/LZg=;
 b=m1vgq2P6SZrhfNvYGjJQz3hlQNMk9U4JDW/2Dzn9NY83fHc10Vxi5mPp
 sXkP+iz0BNUXuOAE0fk6/fJzOW3twnZxUr5ZKsd6s+8DcXUBUUDnLME5d
 AapArbXrKDdueEaLePZkKyX5M1wXKRNzqbhSldcFuj5IzeqXWVlgMI2UT
 9+id9kTQLhzwxIjiyQ52jT3vfau7pr4hP1UEJESMd0GcOnZQZlKGAhz3P
 ztZ5cXJQGWPaow3Ax412dq/tDhTBKGkSlTqlT4nU/+5TJOdEUwnSIgRog
 tk1Qta1zHzc5954iq17pZMmqKXfNmYbxncdkd8tOMqqkpoOmH48/Br8tJ w==;
X-CSE-ConnectionGUID: Y7afIr5CTPiX1Wl1oV/nvQ==
X-CSE-MsgGUID: SwCAQ3KKSDuiSLanf4mebw==
X-IronPort-AV: E=McAfee;i="6800,10657,11565"; a="61124226"
X-IronPort-AV: E=Sophos;i="6.18,295,1751266800"; d="scan'208";a="61124226"
Received: from orviesa005.jf.intel.com ([10.64.159.145])
 by orvoesa111.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 26 Sep 2025 08:11:47 -0700
X-CSE-ConnectionGUID: HJ0vRCy2SK+DrvnqxBWWog==
X-CSE-MsgGUID: UB7oUsVvT3i/l/nFJgJ3FA==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.18,295,1751266800"; d="scan'208";a="182801103"
Received: from hrotuna-mobl2.ger.corp.intel.com (HELO localhost)
 ([10.245.246.10])
 by orviesa005-auth.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 26 Sep 2025 08:11:43 -0700
From: Jani Nikula <jani.nikula@intel.com>
To: Lucas De Marchi <lucas.demarchi@intel.com>
Cc: intel-gfx@lists.freedesktop.org, intel-xe@lists.freedesktop.org,
 dri-devel@lists.freedesktop.org, Rodrigo Vivi <rodrigo.vivi@intel.com>,
 Ville Syrjala <ville.syrjala@linux.intel.com>, Simona Vetter
 <simona.vetter@ffwll.ch>
Subject: Re: [PATCH] drm/{i915,xe}: driver agnostic drm to display pointer
 chase
In-Reply-To: <vxxrpnasd5qfoof4coi3rw4pu3pbnau42u3lywc5dd52nma5sx@r5coda25idn4>
Organization: Intel Finland Oy - BIC 0357606-4 - Westendinkatu 7, 02160 Espoo
References: <20250926111032.1188876-1-jani.nikula@intel.com>
 <vxxrpnasd5qfoof4coi3rw4pu3pbnau42u3lywc5dd52nma5sx@r5coda25idn4>
Date: Fri, 26 Sep 2025 18:11:41 +0300
Message-ID: <20562bfd487f43278df768822cc44317f0ca6f79@intel.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable
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

On Fri, 26 Sep 2025, Lucas De Marchi <lucas.demarchi@intel.com> wrote:
> On Fri, Sep 26, 2025 at 02:10:32PM +0300, Jani Nikula wrote:
>>diff --git a/drivers/gpu/drm/i915/display/intel_display_conversion.c b/dr=
ivers/gpu/drm/i915/display/intel_display_conversion.c
>>index d56065f22655..9a47aa38cf82 100644
>>--- a/drivers/gpu/drm/i915/display/intel_display_conversion.c
>>+++ b/drivers/gpu/drm/i915/display/intel_display_conversion.c
>>@@ -1,15 +1,21 @@
>> // SPDX-License-Identifier: MIT
>> /* Copyright =C2=A9 2024 Intel Corporation */
>>
>>-#include "i915_drv.h"
>>-#include "intel_display_conversion.h"
>>+#include <drm/intel/display_member.h>
>>
>>-static struct intel_display *__i915_to_display(struct drm_i915_private *=
i915)
>>-{
>>-	return i915->display;
>>-}
>>+#include "intel_display_conversion.h"
>>
>> struct intel_display *__drm_to_display(struct drm_device *drm)
>
> it seems like this could be inline in drm/intel/display_member.h
>
> Although it doesn't seem we have many calls to convert from drm to
> intel_display, so lgtm as is.

We actually do, lots and lots, via to_intel_display().

I thought about inlining, but decided to leave that for follow-up.

> Reviewed-by: Lucas De Marchi <lucas.demarchi@intel.com>

Thanks,
Jani.



--=20
Jani Nikula, Intel
