Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 32C31668908
	for <lists+dri-devel@lfdr.de>; Fri, 13 Jan 2023 02:19:17 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 9E7A710E978;
	Fri, 13 Jan 2023 01:18:57 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mga14.intel.com (mga14.intel.com [192.55.52.115])
 by gabe.freedesktop.org (Postfix) with ESMTPS id BACD210E1C4;
 Fri, 13 Jan 2023 01:18:52 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1673572732; x=1705108732;
 h=from:to:cc:subject:date:message-id:in-reply-to:
 references:mime-version:content-transfer-encoding;
 bh=j+mkL5K1cfdTcTY3q3jasf0ic8q8wUSIm4/DghnhMJ4=;
 b=lnKvWbLTLlmPX9remg+OmfCuUaAkqDO9ZYqbnqN6Zd/4+nvuIi4xUZ3J
 4CJYmS10H1Mtcha8HyHvSvSMhI9gM6GbjBaxRVj7jwic9HhP4R7JesfzB
 auNV+EelZLegLJlZ+PS/Ze6J+vbGwuessuM5IF3HUm8o+ZmzKhXN85TO5
 iXmMPMFhrYWYGIZSl9FrI0bGHtw5AYfPfDs9i2cwJqTkIB3U2uGR1ZPkJ
 0g4CErtAEGRGXRO1iEKy5/grsczwJN4WThYlE0rauS7OybTcIyJDiPrX2
 lCu4OjfvdFJQyaJY18n+9tAVlw3D1fnGu2Wv7KnAL9C1yt2w4UlywIwgZ Q==;
X-IronPort-AV: E=McAfee;i="6500,9779,10588"; a="323941578"
X-IronPort-AV: E=Sophos;i="5.97,212,1669104000"; d="scan'208";a="323941578"
Received: from fmsmga003.fm.intel.com ([10.253.24.29])
 by fmsmga103.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 12 Jan 2023 17:18:52 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6500,9779,10588"; a="746761022"
X-IronPort-AV: E=Sophos;i="5.97,212,1669104000"; d="scan'208";a="746761022"
Received: from aalteres-desk.fm.intel.com ([10.80.57.53])
 by FMSMGA003.fm.intel.com with ESMTP; 12 Jan 2023 17:18:52 -0800
From: Alan Previn <alan.previn.teres.alexis@intel.com>
To: intel-gfx@lists.freedesktop.org
Subject: [PATCH v5 2/6] drm/i915/pxp: add device link between i915 and mei_pxp
Date: Thu, 12 Jan 2023 17:18:46 -0800
Message-Id: <20230113011850.1463965-3-alan.previn.teres.alexis@intel.com>
X-Mailer: git-send-email 2.39.0
In-Reply-To: <20230113011850.1463965-1-alan.previn.teres.alexis@intel.com>
References: <20230113011850.1463965-1-alan.previn.teres.alexis@intel.com>
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
2.39.0

