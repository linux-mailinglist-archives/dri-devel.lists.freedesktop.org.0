Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 4C225133CE1
	for <lists+dri-devel@lfdr.de>; Wed,  8 Jan 2020 09:13:39 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id DF8D56E865;
	Wed,  8 Jan 2020 08:12:55 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-wm1-x342.google.com (mail-wm1-x342.google.com
 [IPv6:2a00:1450:4864:20::342])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 0DBF96E0D2;
 Tue,  7 Jan 2020 15:13:43 +0000 (UTC)
Received: by mail-wm1-x342.google.com with SMTP id 20so19774070wmj.4;
 Tue, 07 Jan 2020 07:13:42 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=dUC/fsfwwgbxjgLgWHravnHWgOXA+EYPU9iBkkWyBGM=;
 b=UC87yx9THmfIPYx9+ugAuCyFYPHlwAFtQzEgRXhkkX/68aX1qv3nDxkwL+sq0GsCby
 cKFSv5PoNl7hWqcBIP51e7mgRKnm0koOM9iXi1Ys/YkcfjeNaBLtvAdIUzEcV/Ctl2n2
 abNEhABTc0bKvHI4vor1SxGhOxB6/ugFnfAjBCKztxT6VYNP/VOcpHHATm+CCp9EUZxg
 bSwAAOtdK/Ae69PEO6FWfLwipEHUNpkfPE/Y7uv9e1zHeSGSirgNWxlVlmjLBPXW675f
 TGtOffMrVC8ya/muEqywnEpz910lm+FuwMHojyQabxC/UUPE5QZSf00GI7ZCOAR9eyEq
 dFhQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=dUC/fsfwwgbxjgLgWHravnHWgOXA+EYPU9iBkkWyBGM=;
 b=mnYtuIcUu9SKznBQKGJB3H9KBB4cenO6p+niA2Udxag9xG6zXrRu9EjzdHLYki4SBB
 /9eGd6Kkr+dMbSFs2egoV+wlW7Mlq57OTZM54515ZF3hVCyInwK1FLOIav0H2qF6I2Hg
 4j6jwfuXdVJiqOpWGiyDCDCcSqStiUm/dYrgO8vy8ljO1UUpUZla+q+urFic/Ep/uDJi
 CMy6zRmIdDKZlZFxGnzoMP3FbLHjhTyXyikcNY7uBvyYcs+q1LNAZS657IXNmC8dcXjN
 HGD4qVElVy4PnyhFgdlx37AejAqSj6Zl3iVZjmGt8n8tx6wWKYw3eTgUNf3+2llJV3c0
 8a8A==
X-Gm-Message-State: APjAAAVYUJjgL0sadwTAEA8/Bx5kVQYRN+hChvty5YhRT/vY1aVDt5Y+
 MH4uYTx8j+CC6JrVWkVsYM0=
X-Google-Smtp-Source: APXvYqzXZ/xcJ/Cn17qh3k/3m9+klThM8BzVIdAL7VD5pePoozt8LSwrksWjppjGIhe8KiwvfiqKUQ==
X-Received: by 2002:a1c:f30e:: with SMTP id q14mr40768119wmq.65.1578410021725; 
 Tue, 07 Jan 2020 07:13:41 -0800 (PST)
Received: from wambui.zuku.co.ke ([197.237.61.225])
 by smtp.googlemail.com with ESMTPSA id c4sm27076664wml.7.2020.01.07.07.13.39
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Tue, 07 Jan 2020 07:13:41 -0800 (PST)
From: Wambui Karuga <wambui.karugax@gmail.com>
To: jani.nikula@linux.intel.com, joonas.lahtinen@linux.intel.com,
 rodrigo.vivi@intel.com, airlied@linux.ie, daniel@ffwll.ch
Subject: [PATCH 1/5] drm/i915: convert to using the drm_dbg_kms() macro.
Date: Tue,  7 Jan 2020 18:13:29 +0300
Message-Id: <b79ee0f6efbf8358cbb4f2e163fa6b5bb04db794.1578409433.git.wambui.karugax@gmail.com>
X-Mailer: git-send-email 2.24.1
In-Reply-To: <cover.1578409433.git.wambui.karugax@gmail.com>
References: <cover.1578409433.git.wambui.karugax@gmail.com>
MIME-Version: 1.0
X-Mailman-Approved-At: Wed, 08 Jan 2020 08:12:31 +0000
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
Cc: intel-gfx@lists.freedesktop.org, seanpaul@chromium.org,
 linux-kernel@vger.kernel.org, dri-devel@lists.freedesktop.org
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

Convert the use of the DRM_DEBUG_KMS() logging macro to the new struct
drm_device based drm_dbg_kms() logging macro in i915/intel_pch.c.

Signed-off-by: Wambui Karuga <wambui.karugax@gmail.com>
---
 drivers/gpu/drm/i915/intel_pch.c | 46 +++++++++++++++++---------------
 1 file changed, 24 insertions(+), 22 deletions(-)

diff --git a/drivers/gpu/drm/i915/intel_pch.c b/drivers/gpu/drm/i915/intel_pch.c
index 43b68b5fc562..4ed60e1f01db 100644
--- a/drivers/gpu/drm/i915/intel_pch.c
+++ b/drivers/gpu/drm/i915/intel_pch.c
@@ -12,90 +12,91 @@ intel_pch_type(const struct drm_i915_private *dev_priv, unsigned short id)
 {
 	switch (id) {
 	case INTEL_PCH_IBX_DEVICE_ID_TYPE:
-		DRM_DEBUG_KMS("Found Ibex Peak PCH\n");
+		drm_dbg_kms(&dev_priv->drm, "Found Ibex Peak PCH\n");
 		WARN_ON(!IS_GEN(dev_priv, 5));
 		return PCH_IBX;
 	case INTEL_PCH_CPT_DEVICE_ID_TYPE:
-		DRM_DEBUG_KMS("Found CougarPoint PCH\n");
+		drm_dbg_kms(&dev_priv->drm, "Found CougarPoint PCH\n");
 		WARN_ON(!IS_GEN(dev_priv, 6) && !IS_IVYBRIDGE(dev_priv));
 		return PCH_CPT;
 	case INTEL_PCH_PPT_DEVICE_ID_TYPE:
-		DRM_DEBUG_KMS("Found PantherPoint PCH\n");
+		drm_dbg_kms(&dev_priv->drm, "Found PantherPoint PCH\n");
 		WARN_ON(!IS_GEN(dev_priv, 6) && !IS_IVYBRIDGE(dev_priv));
 		/* PantherPoint is CPT compatible */
 		return PCH_CPT;
 	case INTEL_PCH_LPT_DEVICE_ID_TYPE:
-		DRM_DEBUG_KMS("Found LynxPoint PCH\n");
+		drm_dbg_kms(&dev_priv->drm, "Found LynxPoint PCH\n");
 		WARN_ON(!IS_HASWELL(dev_priv) && !IS_BROADWELL(dev_priv));
 		WARN_ON(IS_HSW_ULT(dev_priv) || IS_BDW_ULT(dev_priv));
 		return PCH_LPT;
 	case INTEL_PCH_LPT_LP_DEVICE_ID_TYPE:
-		DRM_DEBUG_KMS("Found LynxPoint LP PCH\n");
+		drm_dbg_kms(&dev_priv->drm, "Found LynxPoint LP PCH\n");
 		WARN_ON(!IS_HASWELL(dev_priv) && !IS_BROADWELL(dev_priv));
 		WARN_ON(!IS_HSW_ULT(dev_priv) && !IS_BDW_ULT(dev_priv));
 		return PCH_LPT;
 	case INTEL_PCH_WPT_DEVICE_ID_TYPE:
-		DRM_DEBUG_KMS("Found WildcatPoint PCH\n");
+		drm_dbg_kms(&dev_priv->drm, "Found WildcatPoint PCH\n");
 		WARN_ON(!IS_HASWELL(dev_priv) && !IS_BROADWELL(dev_priv));
 		WARN_ON(IS_HSW_ULT(dev_priv) || IS_BDW_ULT(dev_priv));
 		/* WildcatPoint is LPT compatible */
 		return PCH_LPT;
 	case INTEL_PCH_WPT_LP_DEVICE_ID_TYPE:
-		DRM_DEBUG_KMS("Found WildcatPoint LP PCH\n");
+		drm_dbg_kms(&dev_priv->drm, "Found WildcatPoint LP PCH\n");
 		WARN_ON(!IS_HASWELL(dev_priv) && !IS_BROADWELL(dev_priv));
 		WARN_ON(!IS_HSW_ULT(dev_priv) && !IS_BDW_ULT(dev_priv));
 		/* WildcatPoint is LPT compatible */
 		return PCH_LPT;
 	case INTEL_PCH_SPT_DEVICE_ID_TYPE:
-		DRM_DEBUG_KMS("Found SunrisePoint PCH\n");
+		drm_dbg_kms(&dev_priv->drm, "Found SunrisePoint PCH\n");
 		WARN_ON(!IS_SKYLAKE(dev_priv) && !IS_KABYLAKE(dev_priv));
 		return PCH_SPT;
 	case INTEL_PCH_SPT_LP_DEVICE_ID_TYPE:
-		DRM_DEBUG_KMS("Found SunrisePoint LP PCH\n");
+		drm_dbg_kms(&dev_priv->drm, "Found SunrisePoint LP PCH\n");
 		WARN_ON(!IS_SKYLAKE(dev_priv) && !IS_KABYLAKE(dev_priv) &&
 			!IS_COFFEELAKE(dev_priv));
 		return PCH_SPT;
 	case INTEL_PCH_KBP_DEVICE_ID_TYPE:
-		DRM_DEBUG_KMS("Found Kaby Lake PCH (KBP)\n");
+		drm_dbg_kms(&dev_priv->drm, "Found Kaby Lake PCH (KBP)\n");
 		WARN_ON(!IS_SKYLAKE(dev_priv) && !IS_KABYLAKE(dev_priv) &&
 			!IS_COFFEELAKE(dev_priv));
 		/* KBP is SPT compatible */
 		return PCH_SPT;
 	case INTEL_PCH_CNP_DEVICE_ID_TYPE:
-		DRM_DEBUG_KMS("Found Cannon Lake PCH (CNP)\n");
+		drm_dbg_kms(&dev_priv->drm, "Found Cannon Lake PCH (CNP)\n");
 		WARN_ON(!IS_CANNONLAKE(dev_priv) && !IS_COFFEELAKE(dev_priv));
 		return PCH_CNP;
 	case INTEL_PCH_CNP_LP_DEVICE_ID_TYPE:
-		DRM_DEBUG_KMS("Found Cannon Lake LP PCH (CNP-LP)\n");
+		drm_dbg_kms(&dev_priv->drm,
+			    "Found Cannon Lake LP PCH (CNP-LP)\n");
 		WARN_ON(!IS_CANNONLAKE(dev_priv) && !IS_COFFEELAKE(dev_priv));
 		return PCH_CNP;
 	case INTEL_PCH_CMP_DEVICE_ID_TYPE:
 	case INTEL_PCH_CMP2_DEVICE_ID_TYPE:
-		DRM_DEBUG_KMS("Found Comet Lake PCH (CMP)\n");
+		drm_dbg_kms(&dev_priv->drm, "Found Comet Lake PCH (CMP)\n");
 		WARN_ON(!IS_COFFEELAKE(dev_priv));
 		/* CometPoint is CNP Compatible */
 		return PCH_CNP;
 	case INTEL_PCH_CMP_V_DEVICE_ID_TYPE:
-		DRM_DEBUG_KMS("Found Comet Lake V PCH (CMP-V)\n");
+		drm_dbg_kms(&dev_priv->drm, "Found Comet Lake V PCH (CMP-V)\n");
 		WARN_ON(!IS_COFFEELAKE(dev_priv));
 		/* Comet Lake V PCH is based on KBP, which is SPT compatible */
 		return PCH_SPT;
 	case INTEL_PCH_ICP_DEVICE_ID_TYPE:
-		DRM_DEBUG_KMS("Found Ice Lake PCH\n");
+		drm_dbg_kms(&dev_priv->drm, "Found Ice Lake PCH\n");
 		WARN_ON(!IS_ICELAKE(dev_priv));
 		return PCH_ICP;
 	case INTEL_PCH_MCC_DEVICE_ID_TYPE:
-		DRM_DEBUG_KMS("Found Mule Creek Canyon PCH\n");
+		drm_dbg_kms(&dev_priv->drm, "Found Mule Creek Canyon PCH\n");
 		WARN_ON(!IS_ELKHARTLAKE(dev_priv));
 		return PCH_MCC;
 	case INTEL_PCH_TGP_DEVICE_ID_TYPE:
 	case INTEL_PCH_TGP2_DEVICE_ID_TYPE:
-		DRM_DEBUG_KMS("Found Tiger Lake LP PCH\n");
+		drm_dbg_kms(&dev_priv->drm, "Found Tiger Lake LP PCH\n");
 		WARN_ON(!IS_TIGERLAKE(dev_priv));
 		return PCH_TGP;
 	case INTEL_PCH_JSP_DEVICE_ID_TYPE:
 	case INTEL_PCH_JSP2_DEVICE_ID_TYPE:
-		DRM_DEBUG_KMS("Found Jasper Lake PCH\n");
+		drm_dbg_kms(&dev_priv->drm, "Found Jasper Lake PCH\n");
 		WARN_ON(!IS_ELKHARTLAKE(dev_priv));
 		return PCH_JSP;
 	default:
@@ -145,9 +146,9 @@ intel_virt_detect_pch(const struct drm_i915_private *dev_priv)
 		id = INTEL_PCH_IBX_DEVICE_ID_TYPE;
 
 	if (id)
-		DRM_DEBUG_KMS("Assuming PCH ID %04x\n", id);
+		drm_dbg_kms(&dev_priv->drm, "Assuming PCH ID %04x\n", id);
 	else
-		DRM_DEBUG_KMS("Assuming no PCH\n");
+		drm_dbg_kms(&dev_priv->drm, "Assuming no PCH\n");
 
 	return id;
 }
@@ -201,13 +202,14 @@ void intel_detect_pch(struct drm_i915_private *dev_priv)
 	 * display.
 	 */
 	if (pch && !HAS_DISPLAY(dev_priv)) {
-		DRM_DEBUG_KMS("Display disabled, reverting to NOP PCH\n");
+		drm_dbg_kms(&dev_priv->drm,
+			    "Display disabled, reverting to NOP PCH\n");
 		dev_priv->pch_type = PCH_NOP;
 		dev_priv->pch_id = 0;
 	}
 
 	if (!pch)
-		DRM_DEBUG_KMS("No PCH found.\n");
+		drm_dbg_kms(&dev_priv->drm, "No PCH found.\n");
 
 	pci_dev_put(pch);
 }
-- 
2.24.1

_______________________________________________
dri-devel mailing list
dri-devel@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/dri-devel
