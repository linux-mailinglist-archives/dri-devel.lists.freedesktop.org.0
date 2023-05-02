Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id CD8D46F4641
	for <lists+dri-devel@lfdr.de>; Tue,  2 May 2023 16:39:58 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id F075F10E596;
	Tue,  2 May 2023 14:39:56 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mga03.intel.com (mga03.intel.com [134.134.136.65])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 8A1B610E595;
 Tue,  2 May 2023 14:39:52 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1683038392; x=1714574392;
 h=from:to:cc:subject:date:message-id:in-reply-to:
 references:mime-version:content-transfer-encoding;
 bh=bUknhqy/2r1kXb94zXaRIlk1AnnhDyf++v87ibb/fUs=;
 b=LV5msKIB9p5OlmsP4nq/urP7V0oFdomPWmQJOUffPkGcjdSn71vZB5JM
 F1Qebeepr0RwT6UUsGAgstLToRAm3g5eEaqeGZ34KRjfisZft2rSAP57v
 g+0GbtjS5ZU9ZRApP3mfk2VztW7q0xRuDrvlW9MvVBuaPMWVfcAWcsJj4
 JtluCKjr0rTMw2GkJxC83IJj96WbxyYL9fieULvsxiJdMYhHnhuYTPUr2
 3H0G1Rnjg7QzNPSY4ILFvPAorBKwFEqkUW9d186kZICcFjmoFf/KqrldT
 ih37sbqjuuhwq5cmtbZ4SqnyBmYQ6umVuX7hMtx5u2XjXcat7K6KWLkrs g==;
X-IronPort-AV: E=McAfee;i="6600,9927,10698"; a="351397000"
X-IronPort-AV: E=Sophos;i="5.99,244,1677571200"; d="scan'208";a="351397000"
Received: from fmsmga007.fm.intel.com ([10.253.24.52])
 by orsmga103.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 02 May 2023 07:39:52 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6600,9927,10698"; a="698991912"
X-IronPort-AV: E=Sophos;i="5.99,244,1677571200"; d="scan'208";a="698991912"
Received: from stinkpipe.fi.intel.com (HELO stinkbox) ([10.237.72.70])
 by fmsmga007.fm.intel.com with SMTP; 02 May 2023 07:39:50 -0700
Received: by stinkbox (sSMTP sendmail emulation);
 Tue, 02 May 2023 17:39:49 +0300
From: Ville Syrjala <ville.syrjala@linux.intel.com>
To: dri-devel@lists.freedesktop.org
Subject: [PATCH 11/11] drm/i915: Reduce combo PHY log spam
Date: Tue,  2 May 2023 17:39:06 +0300
Message-Id: <20230502143906.2401-12-ville.syrjala@linux.intel.com>
X-Mailer: git-send-email 2.39.2
In-Reply-To: <20230502143906.2401-1-ville.syrjala@linux.intel.com>
References: <20230502143906.2401-1-ville.syrjala@linux.intel.com>
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
Cc: intel-gfx@lists.freedesktop.org
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

From: Ville Syrjälä <ville.syrjala@linux.intel.com>

We always check whether combo PHYs need to be re-initialized
after disabling DC states, which leads to log spam. Switch things
around so that we only log something when we actually have to
re-initialized a PHY.

The log spam was exacerbated by commit 41b4c7fe72b6 ("drm/i915:
Disable DC states for all commits") since we now disable DC
states far more often.

Signed-off-by: Ville Syrjälä <ville.syrjala@linux.intel.com>
---
 drivers/gpu/drm/i915/display/intel_combo_phy.c | 17 ++++++++---------
 1 file changed, 8 insertions(+), 9 deletions(-)

diff --git a/drivers/gpu/drm/i915/display/intel_combo_phy.c b/drivers/gpu/drm/i915/display/intel_combo_phy.c
index 922a6d87b553..ee843f2b1af1 100644
--- a/drivers/gpu/drm/i915/display/intel_combo_phy.c
+++ b/drivers/gpu/drm/i915/display/intel_combo_phy.c
@@ -114,10 +114,6 @@ static bool icl_verify_procmon_ref_values(struct drm_i915_private *dev_priv,
 
 	procmon = icl_get_procmon_ref_values(dev_priv, phy);
 
-	drm_dbg_kms(&dev_priv->drm,
-		    "Combo PHY %c Voltage/Process Info : %s\n",
-		    phy_name(phy), procmon->name);
-
 	ret = check_phy_reg(dev_priv, phy, ICL_PORT_COMP_DW1(phy),
 			    (0xff << 16) | 0xff, procmon->dw1);
 	ret &= check_phy_reg(dev_priv, phy, ICL_PORT_COMP_DW9(phy),
@@ -312,14 +308,17 @@ static void icl_combo_phys_init(struct drm_i915_private *dev_priv)
 	enum phy phy;
 
 	for_each_combo_phy(dev_priv, phy) {
+		const struct icl_procmon *procmon;
 		u32 val;
 
-		if (icl_combo_phy_verify_state(dev_priv, phy)) {
-			drm_dbg(&dev_priv->drm,
-				"Combo PHY %c already enabled, won't reprogram it.\n",
-				phy_name(phy));
+		if (icl_combo_phy_verify_state(dev_priv, phy))
 			continue;
-		}
+
+		procmon = icl_get_procmon_ref_values(dev_priv, phy);
+
+		drm_dbg(&dev_priv->drm,
+			"Initializing combo PHY %c (Voltage/Process Info : %s)\n",
+			phy_name(phy), procmon->name);
 
 		if (!has_phy_misc(dev_priv, phy))
 			goto skip_phy_misc;
-- 
2.39.2

