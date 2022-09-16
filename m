Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 268055BA422
	for <lists+dri-devel@lfdr.de>; Fri, 16 Sep 2022 03:48:03 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 89C4C10E382;
	Fri, 16 Sep 2022 01:47:33 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mga04.intel.com (mga04.intel.com [192.55.52.120])
 by gabe.freedesktop.org (Postfix) with ESMTPS id EE24610E371;
 Fri, 16 Sep 2022 01:47:18 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1663292839; x=1694828839;
 h=from:to:cc:subject:date:message-id:in-reply-to:
 references:mime-version:content-transfer-encoding;
 bh=Gz1YT9nl04UGH7g1XmVcMla1wmDUL/rwLYJb3K/OeRA=;
 b=Kxm+tmYPZQrUuAy72UaijScjvmdYtCcIGaD8FMhjEAvB+XRjBvfBusyE
 xFhUUYL3p07dffyR+IjGcFRDhKtkqruQs/cd9Qo6KY40TnznaFB2KBMOe
 A+uqlF/NSHFx2IUcGgdTWvz414+YyERBmjH9quJg0JPt0OupoF5KdlGmq
 Vey/NuZb+A/u4kh5rUXCP4m0+sq0nTq0yBQO3oiuMsrjkRGcw5tm8RnbF
 gRIgKdNQg3wYK6wNlRZxYqr0yj0x/orDqRrQfmMY+S8fO78pqpzOP9/Es
 AVQy6CbfhvZFOlHM8AtSxjwC+OAjLXSVsdCJW5F/Z6azSGJJNcjoiMSQ5 A==;
X-IronPort-AV: E=McAfee;i="6500,9779,10471"; a="297609202"
X-IronPort-AV: E=Sophos;i="5.93,319,1654585200"; d="scan'208";a="297609202"
Received: from orsmga007.jf.intel.com ([10.7.209.58])
 by fmsmga104.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 15 Sep 2022 18:47:18 -0700
X-IronPort-AV: E=Sophos;i="5.93,319,1654585200"; d="scan'208";a="613101380"
Received: from invictus.jf.intel.com ([10.165.21.134])
 by orsmga007-auth.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 15 Sep 2022 18:47:18 -0700
From: Radhakrishna Sripada <radhakrishna.sripada@intel.com>
To: intel-gfx@lists.freedesktop.org
Subject: [PATCH v6 2/3] drm/i915: Parse and set stepping for platforms with GMD
Date: Thu, 15 Sep 2022 18:46:47 -0700
Message-Id: <20220916014648.1310346-3-radhakrishna.sripada@intel.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20220916014648.1310346-1-radhakrishna.sripada@intel.com>
References: <20220916014648.1310346-1-radhakrishna.sripada@intel.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
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
Cc: dri-devel@lists.freedesktop.org
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

From: José Roberto de Souza <jose.souza@intel.com>

Expand the current stepping convention to accommodate the GMD
stepping info. Typically GMD step maps to letter stepping
by "A + step %4" and number to "A + step /4" i.e, GMD step
0 maps to STEP_A0, 1 to _A1, 2 to _A2, 3 to _A3, 4 to STEP_B0...

Future platforms might break this formulae and may require a table
mapping to decode GMD step compatible with the convention.

v2:
 - Pass the updated ip version structure
v3:
 - Skip using GMD to step table(MattR)

Cc: Balasubramani Vivekanandan <balasubramani.vivekanandan@intel.com>
Cc: Matt Roper <matthew.d.roper@intel.com>
Signed-off-by: Radhakrishna Sripada <radhakrishna.sripada@intel.com>
Signed-off-by: José Roberto de Souza <jose.souza@intel.com>
---
 drivers/gpu/drm/i915/intel_step.c | 25 +++++++++++++++++++++++++
 drivers/gpu/drm/i915/intel_step.h | 24 +++++++++++++++++++++++-
 2 files changed, 48 insertions(+), 1 deletion(-)

diff --git a/drivers/gpu/drm/i915/intel_step.c b/drivers/gpu/drm/i915/intel_step.c
index 42b3133d8387..91e7c51991b0 100644
--- a/drivers/gpu/drm/i915/intel_step.c
+++ b/drivers/gpu/drm/i915/intel_step.c
@@ -135,6 +135,19 @@ static const struct intel_step_info adlp_n_revids[] = {
 	[0x0] = { COMMON_GT_MEDIA_STEP(A0), .display_step = STEP_D0 },
 };
 
+static u8 gmd_to_intel_step(struct drm_i915_private *i915,
+			    struct ip_version *gmd)
+{
+	u8 step = gmd->step + STEP_A0;
+
+	if (step >= STEP_FUTURE) {
+		drm_dbg(&i915->drm, "Using future steppings\n");
+		return STEP_FUTURE;
+	}
+
+	return step;
+}
+
 static void pvc_step_init(struct drm_i915_private *i915, int pci_revid);
 
 void intel_step_init(struct drm_i915_private *i915)
@@ -144,6 +157,18 @@ void intel_step_init(struct drm_i915_private *i915)
 	int revid = INTEL_REVID(i915);
 	struct intel_step_info step = {};
 
+	if (HAS_GMD_ID(i915)) {
+		step.graphics_step = gmd_to_intel_step(i915,
+						       &RUNTIME_INFO(i915)->graphics.ip);
+		step.media_step = gmd_to_intel_step(i915,
+						    &RUNTIME_INFO(i915)->media.ip);
+		step.display_step = gmd_to_intel_step(i915,
+						      &RUNTIME_INFO(i915)->display.ip);
+		RUNTIME_INFO(i915)->step = step;
+
+		return;
+	}
+
 	if (IS_PONTEVECCHIO(i915)) {
 		pvc_step_init(i915, revid);
 		return;
diff --git a/drivers/gpu/drm/i915/intel_step.h b/drivers/gpu/drm/i915/intel_step.h
index a6b12bfa9744..57b9928ddca6 100644
--- a/drivers/gpu/drm/i915/intel_step.h
+++ b/drivers/gpu/drm/i915/intel_step.h
@@ -23,21 +23,43 @@ struct intel_step_info {
 	func(A0)			\
 	func(A1)			\
 	func(A2)			\
+	func(A3)			\
 	func(B0)			\
 	func(B1)			\
 	func(B2)			\
 	func(B3)			\
 	func(C0)			\
 	func(C1)			\
+	func(C2)			\
+	func(C3)			\
 	func(D0)			\
 	func(D1)			\
+	func(D2)			\
+	func(D3)			\
 	func(E0)			\
+	func(E1)			\
+	func(E2)			\
+	func(E3)			\
 	func(F0)			\
+	func(F1)			\
+	func(F2)			\
+	func(F3)			\
 	func(G0)			\
+	func(G1)			\
+	func(G2)			\
+	func(G3)			\
 	func(H0)			\
+	func(H1)			\
+	func(H2)			\
+	func(H3)			\
 	func(I0)			\
 	func(I1)			\
-	func(J0)
+	func(I2)			\
+	func(I3)			\
+	func(J0)			\
+	func(J1)			\
+	func(J2)			\
+	func(J3)
 
 /*
  * Symbolic steppings that do not match the hardware. These are valid both as gt
-- 
2.34.1

