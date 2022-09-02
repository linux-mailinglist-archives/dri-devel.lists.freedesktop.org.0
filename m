Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 52BA05ABB2A
	for <lists+dri-devel@lfdr.de>; Sat,  3 Sep 2022 01:33:41 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id DA3FC10E93C;
	Fri,  2 Sep 2022 23:33:18 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mga07.intel.com (mga07.intel.com [134.134.136.100])
 by gabe.freedesktop.org (Postfix) with ESMTPS id D94DF10E93F;
 Fri,  2 Sep 2022 23:33:13 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1662161593; x=1693697593;
 h=from:to:cc:subject:date:message-id:in-reply-to:
 references:mime-version:content-transfer-encoding;
 bh=BLoe0laufTTGLfAxSX6n2K8Sdet26QJIDBOeliX5q+4=;
 b=EhEfJuIhoZ2ScTnrdDYMLHAYURiEobmotrAS4wFd4glJTGiBKFYBeR8+
 w2hKwf7HtbIjN3kJxCsSjmAMUnbrI5uECi2mkJyPXrbYEW82AWphBCwA8
 oUDlOj9sSenNFd5vhZihyPIXzKdPK/f+0aUvHeegCvufCVGhiRM8+sWTC
 wX2MKi+sFYwuP0TFMF4PjgMV8XBWGLuaGlqOvlvPiHLb82FmPOrMBG7oS
 3qicF1bOiBilyQrgG6nVqqCZGG7vUdjbZfWfSJLNShubk/IEhfFU2XEYS
 jxCp1DNEevgzAyyEwTJR6xMl3OoxU/RzR+mc/5FvRsMxskdO+m+bBBwKr g==;
X-IronPort-AV: E=McAfee;i="6500,9779,10458"; a="360064665"
X-IronPort-AV: E=Sophos;i="5.93,285,1654585200"; d="scan'208";a="360064665"
Received: from fmsmga005.fm.intel.com ([10.253.24.32])
 by orsmga105.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 02 Sep 2022 16:33:12 -0700
X-IronPort-AV: E=Sophos;i="5.93,285,1654585200"; d="scan'208";a="941464198"
Received: from mdroper-desk1.fm.intel.com ([10.1.27.134])
 by fmsmga005-auth.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 02 Sep 2022 16:33:11 -0700
From: Matt Roper <matthew.d.roper@intel.com>
To: intel-gfx@lists.freedesktop.org
Subject: [PATCH v2 06/12] drm/i915: Use a DRM-managed action to release the
 PCI bridge device
Date: Fri,  2 Sep 2022 16:32:51 -0700
Message-Id: <20220902233257.3088492-7-matthew.d.roper@intel.com>
X-Mailer: git-send-email 2.37.2
In-Reply-To: <20220902233257.3088492-1-matthew.d.roper@intel.com>
References: <20220902233257.3088492-1-matthew.d.roper@intel.com>
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
Cc: dri-devel@lists.freedesktop.org
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

As we start supporting multiple uncore structures in future patches, the
MMIO cleanup (which make also get called mid-init if there's a failure)
will become more complicated.  Moving to DRM-managed actions will help
keep things simple.

Signed-off-by: Matt Roper <matthew.d.roper@intel.com>
---
 drivers/gpu/drm/i915/i915_driver.c | 12 +++++++++---
 1 file changed, 9 insertions(+), 3 deletions(-)

diff --git a/drivers/gpu/drm/i915/i915_driver.c b/drivers/gpu/drm/i915/i915_driver.c
index 18acba1bc3b0..1f46dd1ffaf7 100644
--- a/drivers/gpu/drm/i915/i915_driver.c
+++ b/drivers/gpu/drm/i915/i915_driver.c
@@ -105,6 +105,12 @@ static const char irst_name[] = "INT3392";
 
 static const struct drm_driver i915_drm_driver;
 
+static void i915_release_bridge_dev(struct drm_device *dev,
+				    void *bridge)
+{
+	pci_dev_put(bridge);
+}
+
 static int i915_get_bridge_dev(struct drm_i915_private *dev_priv)
 {
 	int domain = pci_domain_nr(to_pci_dev(dev_priv->drm.dev)->bus);
@@ -115,7 +121,9 @@ static int i915_get_bridge_dev(struct drm_i915_private *dev_priv)
 		drm_err(&dev_priv->drm, "bridge device not found\n");
 		return -EIO;
 	}
-	return 0;
+
+	return drmm_add_action_or_reset(&dev_priv->drm, i915_release_bridge_dev,
+					dev_priv->bridge_dev);
 }
 
 /* Allocate space for the MCH regs if needed, return nonzero on error */
@@ -452,7 +460,6 @@ static int i915_driver_mmio_probe(struct drm_i915_private *dev_priv)
 err_uncore:
 	intel_teardown_mchbar(dev_priv);
 	intel_uncore_fini_mmio(&dev_priv->uncore);
-	pci_dev_put(dev_priv->bridge_dev);
 
 	return ret;
 }
@@ -465,7 +472,6 @@ static void i915_driver_mmio_release(struct drm_i915_private *dev_priv)
 {
 	intel_teardown_mchbar(dev_priv);
 	intel_uncore_fini_mmio(&dev_priv->uncore);
-	pci_dev_put(dev_priv->bridge_dev);
 }
 
 /**
-- 
2.37.2

