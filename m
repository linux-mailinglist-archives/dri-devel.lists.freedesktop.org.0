Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 5DCF7678FED
	for <lists+dri-devel@lfdr.de>; Tue, 24 Jan 2023 06:32:20 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 0A58210E604;
	Tue, 24 Jan 2023 05:32:05 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mga04.intel.com (mga04.intel.com [192.55.52.120])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 9A88F10E5F2;
 Tue, 24 Jan 2023 05:31:54 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1674538314; x=1706074314;
 h=from:to:cc:subject:date:message-id:in-reply-to:
 references:mime-version:content-transfer-encoding;
 bh=PWSaarp+gJiYxiUazy/QldNB8/URqx6jVXQgUFiJSVo=;
 b=M5LOaZIFMgab5tUmv+GyyQm1ZyrIbP5pVbuNR4qwSVOUXSIkk+1eWcs4
 SUMnz3rkePKUa1ZR02JdIWRBv+RuFKFltbdTwA61mefW91JFWZ+18vI4Z
 3OR3esw8lExl2sotq324ZaCbHW9OZpgOZU48uToxBCmMJ94Bk2dc/Jv5i
 Wo5sss6jmI8qIlK969AfhgTVpfjS8uYLSJgrK3XiuS6uA3QSAkekE0HgL
 /yR819h4FYJz/RRs1AEsdSooGl8EdFCHvuBhygEALDUUzhbdf+nJA0f9c
 ZiJ3nF+M6cFQDuKxNBZCRWehm87XI4MoW06DMMb+aoynBT5ITLUu86BwV g==;
X-IronPort-AV: E=McAfee;i="6500,9779,10599"; a="324906430"
X-IronPort-AV: E=Sophos;i="5.97,241,1669104000"; d="scan'208";a="324906430"
Received: from orsmga003.jf.intel.com ([10.7.209.27])
 by fmsmga104.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 23 Jan 2023 21:31:53 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6500,9779,10599"; a="611921446"
X-IronPort-AV: E=Sophos;i="5.97,241,1669104000"; d="scan'208";a="611921446"
Received: from aalteres-desk.fm.intel.com ([10.80.57.53])
 by orsmga003.jf.intel.com with ESMTP; 23 Jan 2023 21:31:53 -0800
From: Alan Previn <alan.previn.teres.alexis@intel.com>
To: intel-gfx@lists.freedesktop.org
Subject: [PATCH v6 2/6] drm/i915/pxp: add device link between i915 and mei_pxp
Date: Mon, 23 Jan 2023 21:31:46 -0800
Message-Id: <20230124053150.3543928-3-alan.previn.teres.alexis@intel.com>
X-Mailer: git-send-email 2.39.0
In-Reply-To: <20230124053150.3543928-1-alan.previn.teres.alexis@intel.com>
References: <20230124053150.3543928-1-alan.previn.teres.alexis@intel.com>
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
---
 drivers/gpu/drm/i915/pxp/intel_pxp_tee.c   | 11 +++++++++++
 drivers/gpu/drm/i915/pxp/intel_pxp_types.h |  6 ++++++
 2 files changed, 17 insertions(+)

diff --git a/drivers/gpu/drm/i915/pxp/intel_pxp_tee.c b/drivers/gpu/drm/i915/pxp/intel_pxp_tee.c
index 73aa8015f828..cd5b86216506 100644
--- a/drivers/gpu/drm/i915/pxp/intel_pxp_tee.c
+++ b/drivers/gpu/drm/i915/pxp/intel_pxp_tee.c
@@ -127,6 +127,12 @@ static int i915_pxp_tee_component_bind(struct device *i915_kdev,
 	intel_wakeref_t wakeref;
 	int ret = 0;
 
+	if (!HAS_HECI_PXP(i915)) {
+		pxp->component_dev_link = device_link_add(i915_kdev, tee_kdev, DL_FLAG_STATELESS);
+		if (drm_WARN_ON(&i915->drm, !pxp->component_dev_link))
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
+	if (pxp->component_dev_link) {
+		device_link_remove(i915_kdev, tee_kdev);
+		pxp->component_dev_link = NULL;
+	}
 }
 
 static const struct component_ops i915_pxp_tee_component_ops = {
diff --git a/drivers/gpu/drm/i915/pxp/intel_pxp_types.h b/drivers/gpu/drm/i915/pxp/intel_pxp_types.h
index 7dc5f08d1583..efd2f3915abe 100644
--- a/drivers/gpu/drm/i915/pxp/intel_pxp_types.h
+++ b/drivers/gpu/drm/i915/pxp/intel_pxp_types.h
@@ -32,6 +32,12 @@ struct intel_pxp {
 	 * which are protected by &tee_mutex.
 	 */
 	struct i915_pxp_component *pxp_component;
+
+	/**
+	 * @component_dev_link: device link of the pxp-component enforcing i915 as the
+	 * consumer. This is needed for legacy platform (TGL/ADL) full-feature usage.
+	 */
+	struct device_link *component_dev_link;
 	/**
 	 * @pxp_component_added: track if the pxp component has been added.
 	 * Set and cleared in tee init and fini functions respectively.
-- 
2.39.0

