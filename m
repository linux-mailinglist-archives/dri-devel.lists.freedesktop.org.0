Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id E117616C314
	for <lists+dri-devel@lfdr.de>; Tue, 25 Feb 2020 14:58:56 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id C0E2F6EADB;
	Tue, 25 Feb 2020 13:58:54 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mga04.intel.com (mga04.intel.com [192.55.52.120])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 866986EAD7;
 Tue, 25 Feb 2020 13:58:52 +0000 (UTC)
X-Amp-Result: SKIPPED(no attachment in message)
X-Amp-File-Uploaded: False
Received: from fmsmga001.fm.intel.com ([10.253.24.23])
 by fmsmga104.fm.intel.com with ESMTP/TLS/DHE-RSA-AES256-GCM-SHA384;
 25 Feb 2020 05:58:52 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.70,484,1574150400"; d="scan'208";a="350153146"
Received: from plaxmina-desktop.iind.intel.com ([10.145.162.62])
 by fmsmga001.fm.intel.com with ESMTP; 25 Feb 2020 05:58:48 -0800
From: Pankaj Bharadiya <pankaj.laxminarayan.bharadiya@intel.com>
To: jani.nikula@linux.intel.com, daniel@ffwll.ch,
 intel-gfx@lists.freedesktop.org, dri-devel@lists.freedesktop.org,
 Joonas Lahtinen <joonas.lahtinen@linux.intel.com>,
 Rodrigo Vivi <rodrigo.vivi@intel.com>, David Airlie <airlied@linux.ie>,
 Chris Wilson <chris@chris-wilson.co.uk>,
 Tvrtko Ursulin <tvrtko.ursulin@intel.com>,
 Mika Kuoppala <mika.kuoppala@linux.intel.com>,
 Lionel Landwerlin <lionel.g.landwerlin@intel.com>,
 John Harrison <John.C.Harrison@Intel.com>,
 Kenneth Graunke <kenneth@whitecape.org>
Subject: [Intel-gfx][PATCH 09/10] drm/i915/gt: Make MISSING_CASE backtrace
 i915 specific
Date: Tue, 25 Feb 2020 19:17:08 +0530
Message-Id: <20200225134709.6153-10-pankaj.laxminarayan.bharadiya@intel.com>
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
Cc: pankaj.laxminarayan.bharadiya@intel.com
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
 drivers/gpu/drm/i915/gt/intel_workarounds.c | 6 +++---
 1 file changed, 3 insertions(+), 3 deletions(-)

diff --git a/drivers/gpu/drm/i915/gt/intel_workarounds.c b/drivers/gpu/drm/i915/gt/intel_workarounds.c
index 887e0dc701f7..8a80a132f0fe 100644
--- a/drivers/gpu/drm/i915/gt/intel_workarounds.c
+++ b/drivers/gpu/drm/i915/gt/intel_workarounds.c
@@ -635,7 +635,7 @@ __intel_engine_init_ctx_wa(struct intel_engine_cs *engine,
 	else if (INTEL_GEN(i915) < 8)
 		return;
 	else
-		MISSING_CASE(INTEL_GEN(i915));
+		i915_MISSING_CASE(i915, INTEL_GEN(i915));
 
 	wa_init_finish(wal);
 }
@@ -965,7 +965,7 @@ gt_init_workarounds(struct drm_i915_private *i915, struct i915_wa_list *wal)
 	else if (INTEL_GEN(i915) <= 8)
 		return;
 	else
-		MISSING_CASE(INTEL_GEN(i915));
+		i915_MISSING_CASE(i915, INTEL_GEN(i915));
 }
 
 void intel_gt_init_workarounds(struct drm_i915_private *i915)
@@ -1296,7 +1296,7 @@ void intel_engine_init_whitelist(struct intel_engine_cs *engine)
 	else if (INTEL_GEN(i915) <= 8)
 		return;
 	else
-		MISSING_CASE(INTEL_GEN(i915));
+		i915_MISSING_CASE(i915, INTEL_GEN(i915));
 
 	wa_init_finish(w);
 }
-- 
2.23.0

_______________________________________________
dri-devel mailing list
dri-devel@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/dri-devel
