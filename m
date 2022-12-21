Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id F2B1E653995
	for <lists+dri-devel@lfdr.de>; Thu, 22 Dec 2022 00:04:45 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 69C7710E4E3;
	Wed, 21 Dec 2022 23:03:48 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mga03.intel.com (mga03.intel.com [134.134.136.65])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 7055510E04A;
 Wed, 21 Dec 2022 23:03:40 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1671663820; x=1703199820;
 h=from:to:cc:subject:date:message-id:in-reply-to:
 references:mime-version:content-transfer-encoding;
 bh=/YKkW1l4U7eduipxOO4rUMd2XB1phFWki053IcvBnSA=;
 b=AqtpwGi1bINi5spymbUkeO8kpP2y4AnUOOdiV009tIwAH4sETJtdzafw
 VkX9AF1oBPjkSyCMS45hk5CIPdlx6hZLHTh4KlE8wNu1iKvpGoUkWwsdh
 m3k+stqlTLoEhVsgdIqvRj+5aO2WJGrrwVi3NT+A/F6H9vBxZbfyq5Sw4
 iPoCvcmypvf8bIEKAIjwrUrl5rLQpOHi9/n8XCULbOF6Nmf7qFMJYj3j/
 C2uU/DJJZ6bmPFLuX81LG65yLoG18Erwe0kbZ9SiulE45RpAZFzKMoGao
 eH0WroZUGx7UQty+8fKsUk+FgHqfXOamuqCeE6QffY/v+36P2B5OvhMEK g==;
X-IronPort-AV: E=McAfee;i="6500,9779,10568"; a="321905526"
X-IronPort-AV: E=Sophos;i="5.96,263,1665471600"; d="scan'208";a="321905526"
Received: from fmsmga001.fm.intel.com ([10.253.24.23])
 by orsmga103.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 21 Dec 2022 15:03:40 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6500,9779,10568"; a="793864418"
X-IronPort-AV: E=Sophos;i="5.96,263,1665471600"; d="scan'208";a="793864418"
Received: from aalteres-desk.fm.intel.com ([10.80.57.53])
 by fmsmga001.fm.intel.com with ESMTP; 21 Dec 2022 15:03:39 -0800
From: Alan Previn <alan.previn.teres.alexis@intel.com>
To: intel-gfx@lists.freedesktop.org
Subject: [PATCH v3 2/7] drm/i915/pxp: add device link between i915 and mei_pxp
Date: Wed, 21 Dec 2022 15:06:23 -0800
Message-Id: <20221221230628.2715916-3-alan.previn.teres.alexis@intel.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20221221230628.2715916-1-alan.previn.teres.alexis@intel.com>
References: <20221221230628.2715916-1-alan.previn.teres.alexis@intel.com>
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
 drivers/gpu/drm/i915/pxp/intel_pxp_tee.c | 7 +++++++
 1 file changed, 7 insertions(+)

diff --git a/drivers/gpu/drm/i915/pxp/intel_pxp_tee.c b/drivers/gpu/drm/i915/pxp/intel_pxp_tee.c
index d50354bfb993..bef6d7f8ac55 100644
--- a/drivers/gpu/drm/i915/pxp/intel_pxp_tee.c
+++ b/drivers/gpu/drm/i915/pxp/intel_pxp_tee.c
@@ -127,6 +127,10 @@ static int i915_pxp_tee_component_bind(struct device *i915_kdev,
 	intel_wakeref_t wakeref;
 	int ret = 0;
 
+	if (!HAS_HECI_PXP(i915) &&
+	    drm_WARN_ON(&i915->drm, !device_link_add(i915_kdev, tee_kdev, DL_FLAG_STATELESS)))
+		return -ENOMEM;
+
 	mutex_lock(&pxp->tee_mutex);
 	pxp->pxp_component = data;
 	pxp->pxp_component->tee_dev = tee_kdev;
@@ -169,6 +173,9 @@ static void i915_pxp_tee_component_unbind(struct device *i915_kdev,
 	mutex_lock(&pxp->tee_mutex);
 	pxp->pxp_component = NULL;
 	mutex_unlock(&pxp->tee_mutex);
+
+	if (!HAS_HECI_PXP(i915))
+		device_link_remove(i915_kdev, tee_kdev);
 }
 
 static const struct component_ops i915_pxp_tee_component_ops = {
-- 
2.34.1

