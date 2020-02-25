Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id DD45716C310
	for <lists+dri-devel@lfdr.de>; Tue, 25 Feb 2020 14:58:48 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 54AEF6EAD5;
	Tue, 25 Feb 2020 13:58:46 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mga09.intel.com (mga09.intel.com [134.134.136.24])
 by gabe.freedesktop.org (Postfix) with ESMTPS id D40746EAD5;
 Tue, 25 Feb 2020 13:58:44 +0000 (UTC)
X-Amp-Result: SKIPPED(no attachment in message)
X-Amp-File-Uploaded: False
Received: from fmsmga001.fm.intel.com ([10.253.24.23])
 by orsmga102.jf.intel.com with ESMTP/TLS/DHE-RSA-AES256-GCM-SHA384;
 25 Feb 2020 05:58:44 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.70,484,1574150400"; d="scan'208";a="350153138"
Received: from plaxmina-desktop.iind.intel.com ([10.145.162.62])
 by fmsmga001.fm.intel.com with ESMTP; 25 Feb 2020 05:58:40 -0800
From: Pankaj Bharadiya <pankaj.laxminarayan.bharadiya@intel.com>
To: jani.nikula@linux.intel.com, daniel@ffwll.ch,
 intel-gfx@lists.freedesktop.org, dri-devel@lists.freedesktop.org,
 Joonas Lahtinen <joonas.lahtinen@linux.intel.com>,
 Rodrigo Vivi <rodrigo.vivi@intel.com>, David Airlie <airlied@linux.ie>,
 Chris Wilson <chris@chris-wilson.co.uk>,
 Matthew Auld <matthew.auld@intel.com>,
 Tvrtko Ursulin <tvrtko.ursulin@intel.com>,
 Pankaj Bharadiya <pankaj.laxminarayan.bharadiya@intel.com>
Subject: [Intel-gfx][PATCH 08/10] drm/i915/gem: Make MISSING_CASE backtrace
 i915 specific
Date: Tue, 25 Feb 2020 19:17:07 +0530
Message-Id: <20200225134709.6153-9-pankaj.laxminarayan.bharadiya@intel.com>
X-Mailer: git-send-email 2.23.0
In-Reply-To: <20200225134709.6153-1-pankaj.laxminarayan.bharadiya@intel.com>
References: <20200225134709.6153-1-pankaj.laxminarayan.bharadiya@intel.com>
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
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

i915_MISSING_CASE macro includes the device information in the
backtrace, so we know what device the warnings originate from.

Covert MISSING_CASE calls with i915 specific i915_MISSING_CASE variant
in functions where drm_i915_private struct pointer is readily
available.

The conversion was done automatically with below coccinelle semantic
patch.

@rule1@
identifier func, T;
@@
func(...) {
...
struct drm_i915_private *T = ...;
<...
-MISSING_CASE(
+i915_MISSING_CASE(T,
...)
...>
}

@rule2@
identifier func, T;
@@
func(struct drm_i915_private *T,...) {
<...
-MISSING_CASE(
+i915_MISSING_CASE(T,
...)
...>

}

Signed-off-by: Pankaj Bharadiya <pankaj.laxminarayan.bharadiya@intel.com>
---
 drivers/gpu/drm/i915/gem/i915_gem_stolen.c | 17 +++++++++++------
 1 file changed, 11 insertions(+), 6 deletions(-)

diff --git a/drivers/gpu/drm/i915/gem/i915_gem_stolen.c b/drivers/gpu/drm/i915/gem/i915_gem_stolen.c
index 491cfbaaa330..58757f529841 100644
--- a/drivers/gpu/drm/i915/gem/i915_gem_stolen.c
+++ b/drivers/gpu/drm/i915/gem/i915_gem_stolen.c
@@ -228,7 +228,8 @@ static void gen6_get_stolen_reserved(struct drm_i915_private *i915,
 		break;
 	default:
 		*size = 1024 * 1024;
-		MISSING_CASE(reg_val & GEN6_STOLEN_RESERVED_SIZE_MASK);
+		i915_MISSING_CASE(i915,
+				  reg_val & GEN6_STOLEN_RESERVED_SIZE_MASK);
 	}
 }
 
@@ -247,7 +248,8 @@ static void vlv_get_stolen_reserved(struct drm_i915_private *i915,
 
 	switch (reg_val & GEN7_STOLEN_RESERVED_SIZE_MASK) {
 	default:
-		MISSING_CASE(reg_val & GEN7_STOLEN_RESERVED_SIZE_MASK);
+		i915_MISSING_CASE(i915,
+				  reg_val & GEN7_STOLEN_RESERVED_SIZE_MASK);
 		/* fall through */
 	case GEN7_STOLEN_RESERVED_1M:
 		*size = 1024 * 1024;
@@ -284,7 +286,8 @@ static void gen7_get_stolen_reserved(struct drm_i915_private *i915,
 		break;
 	default:
 		*size = 1024 * 1024;
-		MISSING_CASE(reg_val & GEN7_STOLEN_RESERVED_SIZE_MASK);
+		i915_MISSING_CASE(i915,
+				  reg_val & GEN7_STOLEN_RESERVED_SIZE_MASK);
 	}
 }
 
@@ -317,7 +320,8 @@ static void chv_get_stolen_reserved(struct drm_i915_private *i915,
 		break;
 	default:
 		*size = 8 * 1024 * 1024;
-		MISSING_CASE(reg_val & GEN8_STOLEN_RESERVED_SIZE_MASK);
+		i915_MISSING_CASE(i915,
+				  reg_val & GEN8_STOLEN_RESERVED_SIZE_MASK);
 	}
 }
 
@@ -367,7 +371,8 @@ static void icl_get_stolen_reserved(struct drm_i915_private *i915,
 		break;
 	default:
 		*size = 8 * 1024 * 1024;
-		MISSING_CASE(reg_val & GEN8_STOLEN_RESERVED_SIZE_MASK);
+		i915_MISSING_CASE(i915,
+				  reg_val & GEN8_STOLEN_RESERVED_SIZE_MASK);
 	}
 }
 
@@ -443,7 +448,7 @@ static int i915_gem_init_stolen(struct drm_i915_private *i915)
 						&reserved_base, &reserved_size);
 		break;
 	default:
-		MISSING_CASE(INTEL_GEN(i915));
+		i915_MISSING_CASE(i915, INTEL_GEN(i915));
 		/* fall-through */
 	case 11:
 	case 12:
-- 
2.23.0

_______________________________________________
dri-devel mailing list
dri-devel@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/dri-devel
