Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id C7E2C6B820F
	for <lists+dri-devel@lfdr.de>; Mon, 13 Mar 2023 21:01:44 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 1600810E54F;
	Mon, 13 Mar 2023 20:01:41 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mga05.intel.com (mga05.intel.com [192.55.52.43])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 9A92010E146;
 Mon, 13 Mar 2023 20:01:39 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1678737699; x=1710273699;
 h=from:to:cc:subject:in-reply-to:references:date:
 message-id:mime-version:content-transfer-encoding;
 bh=ZpNRgOXI8hiJ2Mp/vVBmbvy/JRn5KojiUa4rTj9DDDk=;
 b=KQ2hBUQM0gIAZuW4YXilMwU8hWHWKw2vfQ2JQ9VanTnkZ+KqkwWK5SG9
 v1S2/aHBUpvNij1jxDZKHeP/PwZkGGs9jPloH53VfcYPxAZDEj9XpRo1C
 9h+fHuKJgyY8OFWbDLVnSa1t3d2iAkYlhv0ZJwKwCdzvk+rlcZ8/0BZSm
 QYn0TSnkStUa9xTpyyTThbbvfaA8tqFBEt2npO8AuKnKUgs5E30Fk3zui
 Y/0OiyOhM9h2CxfIkq86HPIHfR7R/WSwYIXvlhiImxFlrNsT3/JdHgdE7
 uFvcfeHy8SDbiIo0QaQJZDodajYfkyaEAVT9zPIW46IoLBdmeVaFGyBXv Q==;
X-IronPort-AV: E=McAfee;i="6500,9779,10648"; a="423518627"
X-IronPort-AV: E=Sophos;i="5.98,257,1673942400"; d="scan'208";a="423518627"
Received: from orsmga007.jf.intel.com ([10.7.209.58])
 by fmsmga105.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 13 Mar 2023 13:01:39 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6500,9779,10648"; a="672036223"
X-IronPort-AV: E=Sophos;i="5.98,257,1673942400"; d="scan'208";a="672036223"
Received: from jjohanss-mobl.ger.corp.intel.com (HELO localhost)
 ([10.252.60.50])
 by orsmga007-auth.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 13 Mar 2023 13:01:37 -0700
From: Jani Nikula <jani.nikula@linux.intel.com>
To: Lucas De Marchi <lucas.demarchi@intel.com>, Michal Wajdeczko
 <michal.wajdeczko@intel.com>
Subject: Re: [Intel-xe] [PATCH 1/2] drm/xe: Introduce GT oriented log messages
In-Reply-To: <20230313165134.q5zvcriqd6p6i7vo@ldmartin-desk2.lan>
Organization: Intel Finland Oy - BIC 0357606-4 - Westendinkatu 7, 02160 Espoo
References: <20230313080357.2364-1-michal.wajdeczko@intel.com>
 <20230313165134.q5zvcriqd6p6i7vo@ldmartin-desk2.lan>
Date: Mon, 13 Mar 2023 22:01:32 +0200
Message-ID: <87v8j4774z.fsf@intel.com>
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
Cc: intel-xe@lists.freedesktop.org, dri-devel@lists.freedesktop.org
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

On Mon, 13 Mar 2023, Lucas De Marchi <lucas.demarchi@intel.com> wrote:
> +dri-devel
>
> On Mon, Mar 13, 2023 at 09:03:56AM +0100, Michal Wajdeczko wrote:
>>While debugging GT related problems, it's good to know which GT was
>>reporting problems. Introduce helper macros to allow prefix GT logs
>>with GT idetifier. We will use them in upcoming patches.
>>
>>Signed-off-by: Michal Wajdeczko <michal.wajdeczko@intel.com>
>>---
>> drivers/gpu/drm/xe/xe_gt_printk.h | 45 +++++++++++++++++++++++++++++++
>> 1 file changed, 45 insertions(+)
>> create mode 100644 drivers/gpu/drm/xe/xe_gt_printk.h
>>
>>diff --git a/drivers/gpu/drm/xe/xe_gt_printk.h b/drivers/gpu/drm/xe/xe_gt=
_printk.h
>>new file mode 100644
>>index 000000000000..b12a92024126
>>--- /dev/null
>>+++ b/drivers/gpu/drm/xe/xe_gt_printk.h
>>@@ -0,0 +1,45 @@
>>+/* SPDX-License-Identifier: MIT */
>>+/*
>>+ * Copyright =C2=A9 2023 Intel Corporation
>>+ */
>>+
>>+#ifndef _XE_GT_PRINTK_H_
>>+#define _XE_GT_PRINTK_H_
>>+
>>+#include <drm/drm_print.h>
>
> missing blank line
>
>>+#include "xe_gt_types.h"
>>+
>>+#define gt_printk(_gt, _level, _fmt, ...) \
>
> any exposed interface in headers should have xe_
> prefix.
>
> I myself find it odd to have these macros that are wrappers over
> wrappers and create a silo with xe-speficic debugging macros.
> The DRM ones at least are shared across drivers.  The pr_dbg(), just
> reusing a local define is nice as it's still the same call used
> everywhere... but it wouldn't work very well here as we need the extra
> parm.

My biggest problem with this in i915 always was where to draw the line
for adding new macros. Add them for something, and you've set the
example that's okay to do.

And now we have gt_dbg, huc_dbg, guc_dbg, and all the variants. Many of
them single-use or unused, but added for completeness.

I display we could have drm subsystem wide variants for drm_crtc,
drm_connector, drm_encoder, but we've all just opted not to. It's more
verbose at the call sites, but it's obvious everywhere, to everyone.

I agree with Lucas, I think the wrappers on wrappers on wrappers on
wrappers is counter productive. Yes, that's where we are in i915:

	guc/huc -> gt -> drm -> dev -> printk

> I won't oppose them though since a lot of people seem to like the
> approach to help their debug and i915 went through similar discussion.

Yeah, well, that's what I said in i915 as well, and it wasn't in my
domain, really. And ditto here. But I'd totally block this direction in
i915 display code.


BR,
Jani.

>
> Lucas De Marchi
>
>>+	drm_##_level(&(_gt)->xe->drm, "GT%u: " _fmt, (_gt)->info.id, ##__VA_ARG=
S__)
>>+
>>+#define gt_err(_gt, _fmt, ...) \
>>+	gt_printk((_gt), err, _fmt, ##__VA_ARGS__)
>>+
>>+#define gt_warn(_gt, _fmt, ...) \
>>+	gt_printk((_gt), warn, _fmt, ##__VA_ARGS__)
>>+
>>+#define gt_notice(_gt, _fmt, ...) \
>>+	gt_printk((_gt), notice, _fmt, ##__VA_ARGS__)
>>+
>>+#define gt_info(_gt, _fmt, ...) \
>>+	gt_printk((_gt), info, _fmt, ##__VA_ARGS__)
>>+
>>+#define gt_dbg(_gt, _fmt, ...) \
>>+	gt_printk((_gt), dbg, _fmt, ##__VA_ARGS__)
>>+
>>+#define gt_err_ratelimited(_gt, _fmt, ...) \
>>+	gt_printk((_gt), err_ratelimited, _fmt, ##__VA_ARGS__)
>>+
>>+#define gt_WARN(_gt, _condition, _fmt, ...) \
>>+	drm_WARN(&(_gt)->xe->drm, _condition, "GT%u: " _fmt, (_gt)->info.id, ##=
__VA_ARGS__)
>>+
>>+#define gt_WARN_ONCE(_gt, _condition, _fmt, ...) \
>>+	drm_WARN_ONCE(&(_gt)->xe->drm, _condition, "GT%u: " _fmt, (_gt)->info.i=
d, ##__VA_ARGS__)
>>+
>>+#define gt_WARN_ON(_gt, _condition) \
>>+	gt_WARN((_gt), _condition, "%s(%s)", "gt_WARN_ON", __stringify(_conditi=
on))
>>+
>>+#define gt_WARN_ON_ONCE(_gt, _condition) \
>>+	gt_WARN_ONCE((_gt), _condition, "%s(%s)", "gt_WARN_ON_ONCE", __stringif=
y(_condition))
>>+
>>+#endif
>>--=20
>>2.25.1
>>

--=20
Jani Nikula, Intel Open Source Graphics Center
