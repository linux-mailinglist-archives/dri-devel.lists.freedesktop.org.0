Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id E5840175FC5
	for <lists+dri-devel@lfdr.de>; Mon,  2 Mar 2020 17:33:38 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id E83846E57A;
	Mon,  2 Mar 2020 16:33:36 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mga14.intel.com (mga14.intel.com [192.55.52.115])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 7A7D56E57A;
 Mon,  2 Mar 2020 16:33:35 +0000 (UTC)
X-Amp-Result: SKIPPED(no attachment in message)
X-Amp-File-Uploaded: False
Received: from fmsmga001.fm.intel.com ([10.253.24.23])
 by fmsmga103.fm.intel.com with ESMTP/TLS/DHE-RSA-AES256-GCM-SHA384;
 02 Mar 2020 08:33:34 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.70,507,1574150400"; d="scan'208";a="351575186"
Received: from pktinlab.iind.intel.com ([10.66.253.121])
 by fmsmga001.fm.intel.com with ESMTP; 02 Mar 2020 08:33:31 -0800
From: Pankaj Bharadiya <pankaj.laxminarayan.bharadiya@intel.com>
To: jani.nikula@linux.intel.com, daniel@ffwll.ch,
 intel-gfx@lists.freedesktop.org, dri-devel@lists.freedesktop.org,
 Joonas Lahtinen <joonas.lahtinen@linux.intel.com>,
 Rodrigo Vivi <rodrigo.vivi@intel.com>, David Airlie <airlied@linux.ie>,
 =?UTF-8?q?Ville=20Syrj=C3=A4l=C3=A4?= <ville.syrjala@linux.intel.com>,
 =?UTF-8?q?Jos=C3=A9=20Roberto=20de=20Souza?= <jose.souza@intel.com>,
 Chris Wilson <chris@chris-wilson.co.uk>,
 Lucas De Marchi <lucas.demarchi@intel.com>,
 Maarten Lankhorst <maarten.lankhorst@linux.intel.com>
Subject: [PATCH v2 4/7] drm/i915/display: Remove drm_fb_helper_{add,
 remove}_one_connector calls
Date: Mon,  2 Mar 2020 21:51:47 +0530
Message-Id: <20200302162151.52349-5-pankaj.laxminarayan.bharadiya@intel.com>
X-Mailer: git-send-email 2.20.1
In-Reply-To: <20200302162151.52349-1-pankaj.laxminarayan.bharadiya@intel.com>
References: <20200302162151.52349-1-pankaj.laxminarayan.bharadiya@intel.com>
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
Cc: pankaj.laxminarayan.bharadiya@intel.com
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

drm_fb_helper_{add,remove}_one_connector() are dummy functions now
and serve no purpose. Hence remove their calls.

This is the preparatory step for removing the
drm_fb_helper_{add,remove}_one_connector() functions from
drm_fb_helper.h

Signed-off-by: Pankaj Bharadiya <pankaj.laxminarayan.bharadiya@intel.com>
---
 drivers/gpu/drm/i915/display/intel_dp_mst.c | 12 ------------
 1 file changed, 12 deletions(-)

diff --git a/drivers/gpu/drm/i915/display/intel_dp_mst.c b/drivers/gpu/drm/i915/display/intel_dp_mst.c
index d7bfa7c350e9..b15404a3b1ca 100644
--- a/drivers/gpu/drm/i915/display/intel_dp_mst.c
+++ b/drivers/gpu/drm/i915/display/intel_dp_mst.c
@@ -721,27 +721,15 @@ static struct drm_connector *intel_dp_add_mst_connector(struct drm_dp_mst_topolo
 
 static void intel_dp_register_mst_connector(struct drm_connector *connector)
 {
-	struct drm_i915_private *dev_priv = to_i915(connector->dev);
-
-	if (dev_priv->fbdev)
-		drm_fb_helper_add_one_connector(&dev_priv->fbdev->helper,
-						connector);
-
 	drm_connector_register(connector);
 }
 
 static void intel_dp_destroy_mst_connector(struct drm_dp_mst_topology_mgr *mgr,
 					   struct drm_connector *connector)
 {
-	struct drm_i915_private *dev_priv = to_i915(connector->dev);
-
 	DRM_DEBUG_KMS("[CONNECTOR:%d:%s]\n", connector->base.id, connector->name);
 	drm_connector_unregister(connector);
 
-	if (dev_priv->fbdev)
-		drm_fb_helper_remove_one_connector(&dev_priv->fbdev->helper,
-						   connector);
-
 	drm_connector_put(connector);
 }
 
-- 
2.20.1

_______________________________________________
dri-devel mailing list
dri-devel@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/dri-devel
