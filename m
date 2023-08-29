Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 6073A78C379
	for <lists+dri-devel@lfdr.de>; Tue, 29 Aug 2023 13:40:08 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 85BAD10E2CB;
	Tue, 29 Aug 2023 11:40:05 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mgamail.intel.com (mgamail.intel.com [134.134.136.24])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 5271610E27E;
 Tue, 29 Aug 2023 11:39:53 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1693309193; x=1724845193;
 h=from:to:cc:subject:date:message-id:in-reply-to:
 references:mime-version:content-transfer-encoding;
 bh=aUVcxP6gkQBY3ZAeJRgiv+sTDv6CEU1AMMz8+dceLOw=;
 b=lXRC9/liEANVCBC0fk53pLCrm1mS3mvSE+jSepGYoH8fXnwpYdXO5YBE
 IvjqER+iTlMdb73xPlT5JnjizPraxkYBF+SsXUw4S35zhRUi11Yw2TOtH
 P4HxElNpRoo8RrpZ2ucYLGgsT8yANsogSoUTQ4r7+Lj57QPSZMD+F0Q7N
 aUITQNaAZImY3Es6Lt7cRVhR/ZoAINq8ojrfAw9s+MJaAkjm0XmK90zEr
 r5mMIiSl2+fzmokVv9syy+fDiuXBrbQpuljgQbpDU2/M2ozuOAS7MTxYJ
 l9/Gf38NUKHx+CWv5GjVqohYmvWEfpoUMOstfR7Pn4Zw+/P9ZG+L3+XEG A==;
X-IronPort-AV: E=McAfee;i="6600,9927,10816"; a="378063949"
X-IronPort-AV: E=Sophos;i="6.02,210,1688454000"; d="scan'208";a="378063949"
Received: from orsmga002.jf.intel.com ([10.7.209.21])
 by orsmga102.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 29 Aug 2023 04:39:53 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6600,9927,10816"; a="738669082"
X-IronPort-AV: E=Sophos;i="6.02,210,1688454000"; d="scan'208";a="738669082"
Received: from stinkpipe.fi.intel.com (HELO stinkbox) ([10.237.72.153])
 by orsmga002.jf.intel.com with SMTP; 29 Aug 2023 04:39:50 -0700
Received: by stinkbox (sSMTP sendmail emulation);
 Tue, 29 Aug 2023 14:39:50 +0300
From: Ville Syrjala <ville.syrjala@linux.intel.com>
To: intel-gfx@lists.freedesktop.org
Subject: [PATCH 08/12] drm/i915/mst: Populate connector->ddc
Date: Tue, 29 Aug 2023 14:39:16 +0300
Message-ID: <20230829113920.13713-9-ville.syrjala@linux.intel.com>
X-Mailer: git-send-email 2.41.0
In-Reply-To: <20230829113920.13713-1-ville.syrjala@linux.intel.com>
References: <20230829113920.13713-1-ville.syrjala@linux.intel.com>
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

From: Ville Syrjälä <ville.syrjala@linux.intel.com>

Populate connector->ddc, and thus create the "ddc" symlink
in sysfs for DP MST connectors.

TODO: test that this actually works

References: https://gitlab.freedesktop.org/drm/intel/-/issues/3605
Signed-off-by: Ville Syrjälä <ville.syrjala@linux.intel.com>
---
 drivers/gpu/drm/i915/display/intel_dp_mst.c | 6 ++++--
 1 file changed, 4 insertions(+), 2 deletions(-)

diff --git a/drivers/gpu/drm/i915/display/intel_dp_mst.c b/drivers/gpu/drm/i915/display/intel_dp_mst.c
index 2d1c42a5e684..0bf02a29e371 100644
--- a/drivers/gpu/drm/i915/display/intel_dp_mst.c
+++ b/drivers/gpu/drm/i915/display/intel_dp_mst.c
@@ -1104,8 +1104,10 @@ static struct drm_connector *intel_dp_add_mst_connector(struct drm_dp_mst_topolo
 	drm_dp_mst_get_port_malloc(port);
 
 	connector = &intel_connector->base;
-	ret = drm_connector_init(dev, connector, &intel_dp_mst_connector_funcs,
-				 DRM_MODE_CONNECTOR_DisplayPort);
+	ret = drm_connector_init_with_ddc(dev, connector,
+					  &intel_dp_mst_connector_funcs,
+					  DRM_MODE_CONNECTOR_DisplayPort,
+					  &port->aux.ddc);
 	if (ret) {
 		drm_dp_mst_put_port_malloc(port);
 		intel_connector_free(intel_connector);
-- 
2.41.0

