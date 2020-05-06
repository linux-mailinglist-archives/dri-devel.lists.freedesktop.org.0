Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 17C171C6FFA
	for <lists+dri-devel@lfdr.de>; Wed,  6 May 2020 14:08:37 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id D10E96E235;
	Wed,  6 May 2020 12:08:33 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mga18.intel.com (mga18.intel.com [134.134.136.126])
 by gabe.freedesktop.org (Postfix) with ESMTPS id CFAA66E235
 for <dri-devel@lists.freedesktop.org>; Wed,  6 May 2020 12:08:31 +0000 (UTC)
IronPort-SDR: zoOwOq0vqiKrRLtus1wfqxCH1S8UJbVWIphbx6GYq2tbQz4GQZkmwUZshzDy4jK8bSGYJC6Otu
 VBo1mp943/JA==
X-Amp-Result: SKIPPED(no attachment in message)
X-Amp-File-Uploaded: False
Received: from fmsmga006.fm.intel.com ([10.253.24.20])
 by orsmga106.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 06 May 2020 05:08:31 -0700
IronPort-SDR: oImVXxH9FGjN8b2v5+FsHmo15Y2a5QQWUKSle7wFia1H7r6OXLV3tRSRRCRJYCjsGDi9ad9lsY
 t6qzd1qpuptg==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.73,358,1583222400"; d="scan'208";a="461743115"
Received: from sorvi.fi.intel.com ([10.237.72.159])
 by fmsmga006.fm.intel.com with ESMTP; 06 May 2020 05:08:29 -0700
From: Mika Kahola <mika.kahola@intel.com>
To: dri-devel@lists.freedesktop.org
Subject: [PATCH v2] uapi/drm/drm_fourcc.h: Note on platform specificity for
 format modifiers
Date: Wed,  6 May 2020 15:08:27 +0300
Message-Id: <20200506120827.12250-1-mika.kahola@intel.com>
X-Mailer: git-send-email 2.20.1
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
Cc: Mika Kahola <mika.kahola@intel.com>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

Make an additional note on DRM format modifiers for x and y tiling. These
format modifiers are defined for BDW+ platforms and therefore definition
is not valid for older gens. This is due to address swizzling for tiled
surfaces is no longer used. For newer platforms main memory controller has
a more effective address swizzling algorithm.

v2: Rephrase comment (Daniel)

Signed-off-by: Mika Kahola <mika.kahola@intel.com>
---
 include/uapi/drm/drm_fourcc.h | 18 ++++++++++++------
 1 file changed, 12 insertions(+), 6 deletions(-)

diff --git a/include/uapi/drm/drm_fourcc.h b/include/uapi/drm/drm_fourcc.h
index 8bc0b31597d8..9e488d10f8b4 100644
--- a/include/uapi/drm/drm_fourcc.h
+++ b/include/uapi/drm/drm_fourcc.h
@@ -354,9 +354,12 @@ extern "C" {
  * a platform-dependent stride. On top of that the memory can apply
  * platform-depending swizzling of some higher address bits into bit6.
  *
- * This format is highly platforms specific and not useful for cross-driver
- * sharing. It exists since on a given platform it does uniquely identify the
- * layout in a simple way for i915-specific userspace.
+ * Note that this layout is only accurate on intel gen 8+ or valleyview chipsets.
+ * On earlier platforms the is highly platforms specific and not useful for
+ * cross-driver sharing. It exists since on a given platform it does uniquely
+ * identify the layout in a simple way for i915-specific userspace, which
+ * facilitated conversion of userspace to modifiers. Additionally the exact
+ * format on some really old platforms is not known.
  */
 #define I915_FORMAT_MOD_X_TILED	fourcc_mod_code(INTEL, 1)
 
@@ -369,9 +372,12 @@ extern "C" {
  * memory can apply platform-depending swizzling of some higher address bits
  * into bit6.
  *
- * This format is highly platforms specific and not useful for cross-driver
- * sharing. It exists since on a given platform it does uniquely identify the
- * layout in a simple way for i915-specific userspace.
+ * Note that this layout is only accurate on intel gen 8+ or valleyview chipsets.
+ * On earlier platforms the is highly platforms specific and not useful for
+ * cross-driver sharing. It exists since on a given platform it does uniquely
+ * identify the layout in a simple way for i915-specific userspace, which
+ * facilitated conversion of userspace to modifiers. Additionally the exact
+ * format on some really old platforms is not known.
  */
 #define I915_FORMAT_MOD_Y_TILED	fourcc_mod_code(INTEL, 2)
 
-- 
2.20.1

_______________________________________________
dri-devel mailing list
dri-devel@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/dri-devel
