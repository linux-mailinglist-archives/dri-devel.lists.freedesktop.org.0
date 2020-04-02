Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id E8C2A19BB7B
	for <lists+dri-devel@lfdr.de>; Thu,  2 Apr 2020 08:01:57 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 70B796E9CB;
	Thu,  2 Apr 2020 06:01:55 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mga01.intel.com (mga01.intel.com [192.55.52.88])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 4C2C16E9CA;
 Thu,  2 Apr 2020 06:01:53 +0000 (UTC)
IronPort-SDR: sZ+csKx1ytyrK0qBC/Ewi/eIK2XFGZFivR4DHN+m1JozlxPtPWXD/C0CYvOHBlG9PG9nvHiYKq
 RdUdENEBzoWQ==
X-Amp-Result: SKIPPED(no attachment in message)
X-Amp-File-Uploaded: False
Received: from orsmga004.jf.intel.com ([10.7.209.38])
 by fmsmga101.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 01 Apr 2020 23:01:52 -0700
IronPort-SDR: dGtdmNKf36kD0SkAQIOEkZHkZfutH300yy/ixymEKJAThGoTMYv92x9f7iyvRktnZPGHQExDZw
 YL/MlIR5XXIA==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.72,334,1580803200"; d="scan'208";a="396242491"
Received: from plaxmina-desktop.iind.intel.com ([10.145.162.62])
 by orsmga004.jf.intel.com with ESMTP; 01 Apr 2020 23:01:49 -0700
From: Pankaj Bharadiya <pankaj.laxminarayan.bharadiya@intel.com>
To: jani.nikula@linux.intel.com, daniel@ffwll.ch,
 intel-gfx@lists.freedesktop.org, dri-devel@lists.freedesktop.org,
 Joonas Lahtinen <joonas.lahtinen@linux.intel.com>,
 Rodrigo Vivi <rodrigo.vivi@intel.com>, David Airlie <airlied@linux.ie>
Subject: [PATCH] drm/i915: Remove WARN_ON and WARN_ON_ONCE overrides.
Date: Thu,  2 Apr 2020 11:22:41 +0530
Message-Id: <20200402055241.24789-1-pankaj.laxminarayan.bharadiya@intel.com>
X-Mailer: git-send-email 2.23.0
MIME-Version: 1.0
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
Cc: pankaj.laxminarayan.bharadiya@intel.com
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

Now we have new struct drm_device based drm_WARN* macros. These are
preferred over the regular WARN* macros.

Remove WARN_ON and WARN_ON_ONCE overriedes to avoid any temptations to
use them in the future.

Suggested-by: Jani Nikula <jani.nikula@intel.com>
Signed-off-by: Pankaj Bharadiya <pankaj.laxminarayan.bharadiya@intel.com>
---
 drivers/gpu/drm/i915/i915_utils.h | 15 ---------------
 1 file changed, 15 deletions(-)

diff --git a/drivers/gpu/drm/i915/i915_utils.h b/drivers/gpu/drm/i915/i915_utils.h
index 03a73d2bd50d..c666a64375d9 100644
--- a/drivers/gpu/drm/i915/i915_utils.h
+++ b/drivers/gpu/drm/i915/i915_utils.h
@@ -36,21 +36,6 @@ struct timer_list;
 
 #define FDO_BUG_URL "https://gitlab.freedesktop.org/drm/intel/-/wikis/How-to-file-i915-bugs"
 
-#undef WARN_ON
-/* Many gcc seem to no see through this and fall over :( */
-#if 0
-#define WARN_ON(x) ({ \
-	bool __i915_warn_cond = (x); \
-	if (__builtin_constant_p(__i915_warn_cond)) \
-		BUILD_BUG_ON(__i915_warn_cond); \
-	WARN(__i915_warn_cond, "WARN_ON(" #x ")"); })
-#else
-#define WARN_ON(x) WARN((x), "%s", "WARN_ON(" __stringify(x) ")")
-#endif
-
-#undef WARN_ON_ONCE
-#define WARN_ON_ONCE(x) WARN_ONCE((x), "%s", "WARN_ON_ONCE(" __stringify(x) ")")
-
 #define MISSING_CASE(x) WARN(1, "Missing case (%s == %ld)\n", \
 			     __stringify(x), (long)(x))
 
-- 
2.23.0

_______________________________________________
dri-devel mailing list
dri-devel@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/dri-devel
