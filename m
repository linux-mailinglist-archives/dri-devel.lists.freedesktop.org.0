Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 579596204B2
	for <lists+dri-devel@lfdr.de>; Tue,  8 Nov 2022 01:31:33 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id A1B2210E373;
	Tue,  8 Nov 2022 00:31:24 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mga18.intel.com (mga18.intel.com [134.134.136.126])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 4F3CF10E373;
 Tue,  8 Nov 2022 00:31:23 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1667867483; x=1699403483;
 h=from:to:cc:subject:date:message-id:mime-version:
 content-transfer-encoding;
 bh=b+y0+xlXqJwk+x4mfR2x2ahxzwE7ATpARJ71IAjbhfw=;
 b=M3NXy3zXSdXuPpHOg9BRUqmp8SQlDdnCA1Zda9xrYlU10sK2iC05/SFg
 ymvMBaEfTk/JJPqo57sp+ZAkJq78KohMhnXS8lza2D12RpX2UTxAezfQ1
 r1ym3SgjmOE8bMH20kJ4As3U2xOH6lt44eSalUXg37GkWjGsisp1vUZs5
 RTk6aaFSd6OLGIrgImjlTEVf2kYd6QBIU3vkyiFu4MCaUKjlWOGuxyHM2
 kY7SdAvuVEb4/MGGIOOEIhrQRonzAPKCaAJCS9uBAs59ESjmYcSKkciyI
 +Is/HfVUjg3Z/UwmIk4x4XNLLvXZUdo00f4VQUZ1T4FKINyQjlydFkVsm A==;
X-IronPort-AV: E=McAfee;i="6500,9779,10524"; a="293928426"
X-IronPort-AV: E=Sophos;i="5.96,145,1665471600"; d="scan'208";a="293928426"
Received: from fmsmga005.fm.intel.com ([10.253.24.32])
 by orsmga106.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 07 Nov 2022 16:31:22 -0800
X-IronPort-AV: E=McAfee;i="6500,9779,10524"; a="965374959"
X-IronPort-AV: E=Sophos;i="5.96,145,1665471600"; d="scan'208";a="965374959"
Received: from lucas-s2600cw.jf.intel.com ([10.165.21.143])
 by fmsmga005-auth.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 07 Nov 2022 16:31:22 -0800
From: Lucas De Marchi <lucas.demarchi@intel.com>
To: intel-gfx@lists.freedesktop.org
Subject: [PATCH] drm/i915: Update workaround documentation
Date: Mon,  7 Nov 2022 16:30:28 -0800
Message-Id: <20221108003028.2350143-1-lucas.demarchi@intel.com>
X-Mailer: git-send-email 2.38.1
MIME-Version: 1.0
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
Cc: Lucas De Marchi <lucas.demarchi@intel.com>, dri-devel@lists.freedesktop.org
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

There were several updates in the driver on how the workarounds are
handled since its documentation was written. Update the documentation to
reflect the current reality.

Signed-off-by: Lucas De Marchi <lucas.demarchi@intel.com>
---
 drivers/gpu/drm/i915/gt/intel_workarounds.c | 87 +++++++++++++--------
 1 file changed, 56 insertions(+), 31 deletions(-)

diff --git a/drivers/gpu/drm/i915/gt/intel_workarounds.c b/drivers/gpu/drm/i915/gt/intel_workarounds.c
index 3cdf5c24dbc5..0db3713c1beb 100644
--- a/drivers/gpu/drm/i915/gt/intel_workarounds.c
+++ b/drivers/gpu/drm/i915/gt/intel_workarounds.c
@@ -17,43 +17,68 @@
 /**
  * DOC: Hardware workarounds
  *
- * This file is intended as a central place to implement most [1]_ of the
- * required workarounds for hardware to work as originally intended. They fall
- * in five basic categories depending on how/when they are applied:
+ * This is intended as a central place to implement most [1]_ of the
+ * required workarounds for hardware to work as originally intended. Hardware
+ * workarounds are register programming documented to be executed in the driver
+ * that fall outside of the normal programming sequences for a platform. There
+ * are some basic categories of workarounds, depending on how/when they are
+ * applied:
  *
- * - Workarounds that touch registers that are saved/restored to/from the HW
- *   context image. The list is emitted (via Load Register Immediate commands)
- *   everytime a new context is created.
- * - GT workarounds. The list of these WAs is applied whenever these registers
- *   revert to default values (on GPU reset, suspend/resume [2]_, etc..).
- * - Display workarounds. The list is applied during display clock-gating
- *   initialization.
- * - Workarounds that whitelist a privileged register, so that UMDs can manage
- *   them directly. This is just a special case of a MMMIO workaround (as we
- *   write the list of these to/be-whitelisted registers to some special HW
- *   registers).
- * - Workaround batchbuffers, that get executed automatically by the hardware
- *   on every HW context restore.
+ * - Context workarounds: workarounds that touch registers that are
+ *   saved/restored to/from the HW context image. The list is emitted (via Load
+ *   Register Immediate commands) once when initializing the device and saved in
+ *   the default context. That default context is then used on every context
+ *   creation to have a "primed golden context", i.e. a context image that
+ *   already contains the changes needed to all the registers.
  *
- * .. [1] Please notice that there are other WAs that, due to their nature,
- *    cannot be applied from a central place. Those are peppered around the rest
- *    of the code, as needed.
+ * - Engine workarounds: the list of these WAs is applied whenever the specific
+ *   engine is reset. It's also possible that a set of engine classes share a
+ *   common power domain and they are reset together. This happens on some
+ *   platforms with render and compute engines. In this case (at least) one of
+ *   them need to keeep the workaround programming: the approach taken in the
+ *   driver is to tie those workarounds to the first compute/render engine that
+ *   is registered.  When executing with GuC submission, engine resets are
+ *   outside of kernel driver control, hence the list of registers involved in
+ *   written once, on engine initialization, and then passed to GuC, that
+ *   saves/restores their values before/after the reset takes place. See
+ *   ``drivers/gpu/drm/i915/gt/uc/intel_guc_ads.c`` for reference.
  *
- * .. [2] Technically, some registers are powercontext saved & restored, so they
- *    survive a suspend/resume. In practice, writing them again is not too
- *    costly and simplifies things. We can revisit this in the future.
+ * - GT workarounds: the list of these WAs is applied whenever these registers
+ *   revert to their default values: on GPU reset, suspend/resume, etc.
  *
- * Layout
- * ~~~~~~
+ * - Register whitelist: some workarounds need to be implemented in userspace,
+ *   but need to touch privileged registers. The whitelist in the kernel
+ *   instructs the hardware to allow the access to happen. From the kernel side,
+ *   this is just a special case of a MMIO workaround (as we write the list of
+ *   these to/be-whitelisted registers to some special HW registers).
  *
- * Keep things in this file ordered by WA type, as per the above (context, GT,
- * display, register whitelist, batchbuffer). Then, inside each type, keep the
- * following order:
+ * - Workaround batchbuffers: buffers that get executed automatically by the
+ *   hardware on every HW context restore. These buffers are created and
+ *   programmed in the default context so the hardware always go through those
+ *   programming sequences when switching contexts. The support for workaround
+ *   batchbuffers is enabled these hardware mechanisms:
  *
- * - Infrastructure functions and macros
- * - WAs per platform in standard gen/chrono order
- * - Public functions to init or apply the given workaround type.
- */
+ *   #. INDIRECT_CTX: A batchbuffer and an offset are provided in the default
+ *      context, pointing the hardware to jump to that location when that offset
+ *      is reached in the context restore. Workaround batchbuffer in the driver
+ *      currently uses this mechanism for all platforms.
+ *
+ *   #. BB_PER_CTX_PTR: A batchbuffer is provided in the default context,
+ *      pointing the hardware to a buffer to continue executing after the
+ *      engine registers are restored in a context restore sequence. This is
+ *      currently not used in the driver.
+ *
+ * - Display workarounds. The list is applied during display clock-gating
+ *   initialization. However most of the display workarounds may be considered
+ *   to fall under the "Others" category below.
+ *
+ * - Other:  There are WAs that, due to their nature, cannot be applied from a central
+ *   place. Those are peppered around the rest of the code, as needed.
+ *
+ * .. [1] Technically, some registers are powercontext saved & restored, so they
+ *    survive a suspend/resume. In practice, writing them again is not too
+ *    costly and simplifies things, so it's the approach taken in the driver.
+  */
 
 static void wa_init_start(struct i915_wa_list *wal, const char *name, const char *engine_name)
 {
-- 
2.38.1

