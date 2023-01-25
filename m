Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 005D567ABA4
	for <lists+dri-devel@lfdr.de>; Wed, 25 Jan 2023 09:27:12 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 2134B10E750;
	Wed, 25 Jan 2023 08:26:59 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mga04.intel.com (mga04.intel.com [192.55.52.120])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 6161189CAD;
 Wed, 25 Jan 2023 08:26:45 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1674635205; x=1706171205;
 h=from:to:cc:subject:date:message-id:in-reply-to:
 references:mime-version:content-transfer-encoding;
 bh=ADl1Dyc7Bojb3o0IedOIXx9G8UyKYnFQ+XdrZ3GNPls=;
 b=hg3+wFOz920oZ+OeYzwZOofYMao5s2aayy1rwhli8/BVnzleltSwyF8S
 aoiRAoGIGb5nu6Ncktd4psdGSk/mrNX9TCvwiX+73GNzSkv3lE1BxFxAx
 XYTPX5Ul6gpr7Nk5JNMM0DDCQ/xQ26VUi/sukSBJ97CGbYdNIMBvN4Z5O
 j+jtv7Es9WxCFNkqcH73/Jclx0mv3zrRYvFMhGahzn3SUormwR++O8NhV
 dfHNTYYU7W/eO1w7CvVbqpRnmi32HYzMBngz2MsVFwCXZUKcFABgLycL0
 1LqdqOa7eG7ftCGEPEL3E8ROQUd5rdGKr2XJpHdf8PWZX0/cXCXRQn1KG g==;
X-IronPort-AV: E=McAfee;i="6500,9779,10600"; a="325180413"
X-IronPort-AV: E=Sophos;i="5.97,244,1669104000"; d="scan'208";a="325180413"
Received: from orsmga002.jf.intel.com ([10.7.209.21])
 by fmsmga104.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 25 Jan 2023 00:26:42 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6500,9779,10600"; a="662426112"
X-IronPort-AV: E=Sophos;i="5.97,244,1669104000"; d="scan'208";a="662426112"
Received: from aalteres-desk.fm.intel.com ([10.80.57.53])
 by orsmga002.jf.intel.com with ESMTP; 25 Jan 2023 00:26:38 -0800
From: Alan Previn <alan.previn.teres.alexis@intel.com>
To: intel-gfx@lists.freedesktop.org
Subject: [PATCH v7 2/6] drm/i915/pxp: add device link between i915 and mei_pxp
Date: Wed, 25 Jan 2023 00:26:33 -0800
Message-Id: <20230125082637.118970-3-alan.previn.teres.alexis@intel.com>
X-Mailer: git-send-email 2.39.0
In-Reply-To: <20230125082637.118970-1-alan.previn.teres.alexis@intel.com>
References: <20230125082637.118970-1-alan.previn.teres.alexis@intel.com>
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
Cc: Alan Previn <alan.previn.teres.alexis@intel.com>,
	Vivi@freedesktop.org,
	Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
	Rodrigo <rodrigo.vivi@intel.com>,
	Alexander Usyskin <alexander.usyskin@intel.com>,
	dri-devel@lists.freedesktop.org,
	Daniele Ceraolo Spurio <daniele.ceraolospurio@intel.com>,
	Juston Li <justonli@chromium.org>,
	Tomas Winkler <tomas.winkler@intel.com>
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

From: Alexander Usyskin <alexander.usyskin@intel.com>

Add device link with i915 as consumer and mei_pxp as supplier
to ensure proper ordering of power flows.

V2: condition on absence of heci_pxp to filter out DG

Signed-off-by: Alexander Usyskin <alexander.usyskin@intel.com>
Signed-off-by: Alan Previn <alan.previn.teres.alexis@intel.com>
---
 drivers/gpu/drm/i915/pxp/intel_pxp_tee.c   | 11 +++++++++++
 drivers/gpu/drm/i915/pxp/intel_pxp_types.h |  3 +++
 2 files changed, 14 insertions(+)

diff --git a/drivers/gpu/drm/i915/pxp/intel_pxp_tee.c b/drivers/gpu/drm/i915/pxp/intel_pxp_tee.c
index 73aa8015f828..b5bc0b87a1d0 100644
--- a/drivers/gpu/drm/i915/pxp/intel_pxp_tee.c
+++ b/drivers/gpu/drm/i915/pxp/intel_pxp_tee.c
@@ -127,6 +127,12 @@ static int i915_pxp_tee_component_bind(struct device *i915_kdev,
 	intel_wakeref_t wakeref;
 	int ret = 0;
 
+	if (!HAS_HECI_PXP(i915)) {
+		pxp->dev_link = device_link_add(i915_kdev, tee_kdev, DL_FLAG_STATELESS);
+		if (drm_WARN_ON(&i915->drm, !pxp->dev_link))
+			return -ENODEV;
+	}
+
 	mutex_lock(&pxp->tee_mutex);
 	pxp->pxp_component = data;
 	pxp->pxp_component->tee_dev = tee_kdev;
@@ -169,6 +175,11 @@ static void i915_pxp_tee_component_unbind(struct device *i915_kdev,
 	mutex_lock(&pxp->tee_mutex);
 	pxp->pxp_component = NULL;
 	mutex_unlock(&pxp->tee_mutex);
+
+	if (pxp->dev_link) {
+		device_link_del(pxp->dev_link);
+		pxp->dev_link = NULL;
+	}
 }
 
 static const struct component_ops i915_pxp_tee_component_ops = {
diff --git a/drivers/gpu/drm/i915/pxp/intel_pxp_types.h b/drivers/gpu/drm/i915/pxp/intel_pxp_types.h
index 7dc5f08d1583..007de49e1ea4 100644
--- a/drivers/gpu/drm/i915/pxp/intel_pxp_types.h
+++ b/drivers/gpu/drm/i915/pxp/intel_pxp_types.h
@@ -32,6 +32,9 @@ struct intel_pxp {
 	 * which are protected by &tee_mutex.
 	 */
 	struct i915_pxp_component *pxp_component;
+
+	/* @dev_link: Enforce module relationship for power management ordering. */
+	struct device_link *dev_link;
 	/**
 	 * @pxp_component_added: track if the pxp component has been added.
 	 * Set and cleared in tee init and fini functions respectively.
-- 
2.39.0

