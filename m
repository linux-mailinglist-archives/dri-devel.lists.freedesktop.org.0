Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 9F34F320094
	for <lists+dri-devel@lfdr.de>; Fri, 19 Feb 2021 22:54:44 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 75A9F6EC35;
	Fri, 19 Feb 2021 21:54:24 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from us-smtp-delivery-124.mimecast.com
 (us-smtp-delivery-124.mimecast.com [216.205.24.124])
 by gabe.freedesktop.org (Postfix) with ESMTPS id B88ED6EC3B
 for <dri-devel@lists.freedesktop.org>; Fri, 19 Feb 2021 21:54:22 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1613771661;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=oCCyEyE/y3zObvu+bRfJb2l/VIGWvI14fJQfmx2ackQ=;
 b=TRAfss++XWAiQu4+AqDIP773/IId5pMd16xi/H7l1bohQtb7kewUj3xhB5BL5dGfrvyrfT
 yoLfiY0ri2gznIZ4sVrTRcXip3SA2yE8F8+ZGx8GlW8g9Pf/a91+j8cYVfL6ZWr9shp9J8
 OPYOy6bw86t5gLg/8f7lC34ZhirHBIw=
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-373-TPQDW13xPke2YSCoktMa_g-1; Fri, 19 Feb 2021 16:54:06 -0500
X-MC-Unique: TPQDW13xPke2YSCoktMa_g-1
Received: from smtp.corp.redhat.com (int-mx03.intmail.prod.int.phx2.redhat.com
 [10.5.11.13])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx01.redhat.com (Postfix) with ESMTPS id 75645100B3B3;
 Fri, 19 Feb 2021 21:54:03 +0000 (UTC)
Received: from Whitewolf.redhat.com (ovpn-118-5.rdu2.redhat.com [10.10.118.5])
 by smtp.corp.redhat.com (Postfix) with ESMTP id B80496A03C;
 Fri, 19 Feb 2021 21:54:01 +0000 (UTC)
From: Lyude Paul <lyude@redhat.com>
To: intel-gfx@lists.freedesktop.org, dri-devel@lists.freedesktop.org,
 amd-gfx@lists.freedesktop.org, nouveau@lists.freedesktop.org,
 =?UTF-8?q?Ville=20Syrj=C3=A4l=C3=A4?= <ville.syrjala@linux.intel.com>,
 Jani Nikula <jani.nikula@linux.intel.com>,
 Rodrigo Vivi <rodrigo.vivi@intel.com>,
 Thomas Zimmermann <tzimmermann@suse.de>
Subject: [PATCH 06/30] drm/bridge/ti-sn65dsi86: (Un)register aux device on
 bridge attach/detach
Date: Fri, 19 Feb 2021 16:53:02 -0500
Message-Id: <20210219215326.2227596-7-lyude@redhat.com>
In-Reply-To: <20210219215326.2227596-1-lyude@redhat.com>
References: <20210219215326.2227596-1-lyude@redhat.com>
MIME-Version: 1.0
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.13
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
Cc: Jernej Skrabec <jernej.skrabec@siol.net>, Jonas Karlman <jonas@kwiboo.se>,
 David Airlie <airlied@linux.ie>, Neil Armstrong <narmstrong@baylibre.com>,
 open list <linux-kernel@vger.kernel.org>, Andrzej Hajda <a.hajda@samsung.com>,
 Laurent Pinchart <Laurent.pinchart@ideasonboard.com>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

Since we're about to add a back-pointer to drm_dev in drm_dp_aux, let's
move the AUX adapter registration to the first point where we know which
DRM device we'll be working with - when the drm_bridge is attached.
Likewise, we unregister the AUX adapter on bridge detachment by adding a
ti_sn_bridge_detach() callback.

Signed-off-by: Lyude Paul <lyude@redhat.com>
---
 drivers/gpu/drm/bridge/ti-sn65dsi86.c | 18 ++++++++++++++++--
 1 file changed, 16 insertions(+), 2 deletions(-)

diff --git a/drivers/gpu/drm/bridge/ti-sn65dsi86.c b/drivers/gpu/drm/bridge/ti-sn65dsi86.c
index f27306c51e4d..88df4dd0f39d 100644
--- a/drivers/gpu/drm/bridge/ti-sn65dsi86.c
+++ b/drivers/gpu/drm/bridge/ti-sn65dsi86.c
@@ -362,12 +362,18 @@ static int ti_sn_bridge_attach(struct drm_bridge *bridge,
 		return -EINVAL;
 	}
 
+	ret = drm_dp_aux_register(&pdata->aux);
+	if (ret < 0) {
+		drm_err(bridge->dev, "Failed to register DP AUX channel: %d\n", ret);
+		return ret;
+	}
+
 	ret = drm_connector_init(bridge->dev, &pdata->connector,
 				 &ti_sn_bridge_connector_funcs,
 				 DRM_MODE_CONNECTOR_eDP);
 	if (ret) {
 		DRM_ERROR("Failed to initialize connector with drm\n");
-		return ret;
+		goto err_conn_init;
 	}
 
 	drm_connector_helper_add(&pdata->connector,
@@ -424,9 +430,16 @@ static int ti_sn_bridge_attach(struct drm_bridge *bridge,
 	mipi_dsi_device_unregister(dsi);
 err_dsi_host:
 	drm_connector_cleanup(&pdata->connector);
+err_conn_init:
+	drm_dp_aux_unregister(&pdata->aux);
 	return ret;
 }
 
+static void ti_sn_bridge_detach(struct drm_bridge *bridge)
+{
+	drm_dp_aux_unregister(&bridge_to_ti_sn_bridge(bridge)->aux);
+}
+
 static void ti_sn_bridge_disable(struct drm_bridge *bridge)
 {
 	struct ti_sn_bridge *pdata = bridge_to_ti_sn_bridge(bridge);
@@ -863,6 +876,7 @@ static void ti_sn_bridge_post_disable(struct drm_bridge *bridge)
 
 static const struct drm_bridge_funcs ti_sn_bridge_funcs = {
 	.attach = ti_sn_bridge_attach,
+	.detach = ti_sn_bridge_detach,
 	.pre_enable = ti_sn_bridge_pre_enable,
 	.enable = ti_sn_bridge_enable,
 	.disable = ti_sn_bridge_disable,
@@ -1287,7 +1301,7 @@ static int ti_sn_bridge_probe(struct i2c_client *client,
 	pdata->aux.name = "ti-sn65dsi86-aux";
 	pdata->aux.dev = pdata->dev;
 	pdata->aux.transfer = ti_sn_aux_transfer;
-	drm_dp_aux_register(&pdata->aux);
+	drm_dp_aux_init(&pdata->aux);
 
 	pdata->bridge.funcs = &ti_sn_bridge_funcs;
 	pdata->bridge.of_node = client->dev.of_node;
-- 
2.29.2

_______________________________________________
dri-devel mailing list
dri-devel@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/dri-devel
