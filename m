Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 01D8D8BB3F9
	for <lists+dri-devel@lfdr.de>; Fri,  3 May 2024 21:29:37 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id C1D2E10E325;
	Fri,  3 May 2024 19:29:33 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (1024-bit key; unprotected) header.d=linux.dev header.i=@linux.dev header.b="ox4P8tfi";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from out-187.mta1.migadu.com (out-187.mta1.migadu.com
 [95.215.58.187])
 by gabe.freedesktop.org (Postfix) with ESMTPS id D7D1B10EB3C
 for <dri-devel@lists.freedesktop.org>; Fri,  3 May 2024 19:29:32 +0000 (UTC)
X-Report-Abuse: Please report any abuse attempt to abuse@migadu.com and
 include these headers.
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linux.dev; s=key1;
 t=1714764571;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=cQ2e8hgiGDZBXEW1L5MiD7LSuS/VPNYQnMQFa72oN6c=;
 b=ox4P8tfisHwN1tQ6Q/03B6cky9MCK1VFIh6qZjp1uggchco53uKdIr3RxIB4GnJSRDjen8
 g+NgWLVuHX2kgEegdW8767YapfzGdPLJbJV/b48B+NhhlcUVLRpM4t/vcVPIX4OYCVRNSX
 tQ5z+2V8oBStQHHd7l0vbnPFsyaVpTc=
From: Sean Anderson <sean.anderson@linux.dev>
To: Laurent Pinchart <laurent.pinchart@ideasonboard.com>,
 Maarten Lankhorst <maarten.lankhorst@linux.intel.com>,
 Maxime Ripard <mripard@kernel.org>,
 Thomas Zimmermann <tzimmermann@suse.de>, dri-devel@lists.freedesktop.org
Cc: linux-arm-kernel@lists.infradead.org, David Airlie <airlied@gmail.com>,
 linux-kernel@vger.kernel.org, Daniel Vetter <daniel@ffwll.ch>,
 Tomi Valkeinen <tomi.valkeinen@ideasonboard.com>,
 Michal Simek <michal.simek@amd.com>,
 Sean Anderson <sean.anderson@linux.dev>
Subject: [PATCH v5 01/10] drm: zynqmp_kms: Fix AUX bus not getting unregistered
Date: Fri,  3 May 2024 15:29:13 -0400
Message-Id: <20240503192922.2172314-2-sean.anderson@linux.dev>
In-Reply-To: <20240503192922.2172314-1-sean.anderson@linux.dev>
References: <20240503192922.2172314-1-sean.anderson@linux.dev>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Migadu-Flow: FLOW_OUT
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
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

drm_encoder_cleanup is responsible for calling drm_bridge_detach for
each bridge attached to the encoder. zynqmp_dp_bridge_detach is in turn
responsible for unregistering the AUX bus. However, we never ended up
calling drm_encoder_cleanup in the remove or error paths, so the AUX bus
would stick around after the rest of the driver had been removed.

I don't really understand why drm_mode_config_cleanup doesn't call
drm_encoder_cleanup for us. It will call destroy (which for
simple_encoder is drm_encoder_cleanup) on encoders in the mode_config's
encoder_list.

Should drm_encoder_cleanup get called before or after
drm_atomic_helper_shutdown?

Fixes: 2dfd045c8435 ("drm: xlnx: zynqmp_dpsub: Register AUX bus at bridge attach time")
Signed-off-by: Sean Anderson <sean.anderson@linux.dev>
---

Changes in v5:
- New

 drivers/gpu/drm/xlnx/zynqmp_kms.c | 12 +++++++++---
 1 file changed, 9 insertions(+), 3 deletions(-)

diff --git a/drivers/gpu/drm/xlnx/zynqmp_kms.c b/drivers/gpu/drm/xlnx/zynqmp_kms.c
index 43bf416b33d5..f25583ce92e6 100644
--- a/drivers/gpu/drm/xlnx/zynqmp_kms.c
+++ b/drivers/gpu/drm/xlnx/zynqmp_kms.c
@@ -433,23 +433,28 @@ static int zynqmp_dpsub_kms_init(struct zynqmp_dpsub *dpsub)
 				DRM_BRIDGE_ATTACH_NO_CONNECTOR);
 	if (ret) {
 		dev_err(dpsub->dev, "failed to attach bridge to encoder\n");
-		return ret;
+		goto err_encoder;
 	}
 
 	/* Create the connector for the chain of bridges. */
 	connector = drm_bridge_connector_init(&dpsub->drm->dev, encoder);
 	if (IS_ERR(connector)) {
 		dev_err(dpsub->dev, "failed to created connector\n");
-		return PTR_ERR(connector);
+		ret = PTR_ERR(connector);
+		goto err_encoder;
 	}
 
 	ret = drm_connector_attach_encoder(connector, encoder);
 	if (ret < 0) {
 		dev_err(dpsub->dev, "failed to attach connector to encoder\n");
-		return ret;
+		goto err_encoder;
 	}
 
 	return 0;
+
+err_encoder:
+	drm_encoder_cleanup(encoder);
+	return ret;
 }
 
 static void zynqmp_dpsub_drm_release(struct drm_device *drm, void *res)
@@ -529,5 +534,6 @@ void zynqmp_dpsub_drm_cleanup(struct zynqmp_dpsub *dpsub)
 
 	drm_dev_unregister(drm);
 	drm_atomic_helper_shutdown(drm);
+	drm_encoder_cleanup(&dpsub->drm->encoder);
 	drm_kms_helper_poll_fini(drm);
 }
-- 
2.35.1.1320.gc452695387.dirty

