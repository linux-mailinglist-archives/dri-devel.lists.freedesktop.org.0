Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 3599732A5CF
	for <lists+dri-devel@lfdr.de>; Tue,  2 Mar 2021 17:24:28 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 863B66E202;
	Tue,  2 Mar 2021 16:24:18 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from lb3-smtp-cloud7.xs4all.net (lb3-smtp-cloud7.xs4all.net
 [194.109.24.31])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 566296E1F7
 for <dri-devel@lists.freedesktop.org>; Tue,  2 Mar 2021 16:24:15 +0000 (UTC)
Received: from cust-b5b5937f ([IPv6:fc0c:c16d:66b8:757f:c639:739b:9d66:799d])
 by smtp-cloud7.xs4all.net with ESMTPA
 id H7oZlNjwSOruFH7ojlAWNd; Tue, 02 Mar 2021 17:24:13 +0100
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=xs4all.nl; s=s2;
 t=1614702253; bh=nigcAZjwRtlVmPsFqbCkWkaOp6C34x3F16TTh+8uIO4=;
 h=From:To:Subject:Date:Message-Id:MIME-Version:From:Subject;
 b=k2tC4ZzjYuZ3M0eQX93PHBSoxyT/nxCbsPt213yTueDgHbJJCACgu0wvuao64Ayvk
 u3rp2CmLK/aL34CjXSQr1LwIt3kHhNcDKlyKo8heo99ubVi2j6MGY7bapkNy4ls/TL
 lna9h6FUptmQuEIllQc9SqW28dTEwIBg5J7TAFOwlTbUX9ji5jIkdSXFqJhTLq/Yf3
 cHItGrfnA2j5BXljNFQ362DQQEEIoOMGWD2uKPEAiZms7nuCZVWJxvxlw/sR7o/9j7
 F4n0TdblLm+1ACEOn17TDSQF5oMdzOXBnZTKQ/4Bv9OfMN8l1LRGZRevUuGFPxdRp8
 xzLCQ2iOAF35w==
From: Hans Verkuil <hverkuil-cisco@xs4all.nl>
To: linux-media@vger.kernel.org
Subject: [PATCHv2 1/6] drm: drm_bridge: add connector_attach/detach bridge ops
Date: Tue,  2 Mar 2021 17:23:58 +0100
Message-Id: <20210302162403.983585-2-hverkuil-cisco@xs4all.nl>
X-Mailer: git-send-email 2.30.1
In-Reply-To: <20210302162403.983585-1-hverkuil-cisco@xs4all.nl>
References: <20210302162403.983585-1-hverkuil-cisco@xs4all.nl>
MIME-Version: 1.0
X-CMAE-Envelope: MS4xfH1WztQd5puTGwx9jr7Qnb4a6LSVKsuJG9LXZaF/19eoi/zr0o+zEmykIrlunj4rGbDj3oLAAcpap3fmA4yi700pShKgsJ36UmKM8zK0vFiMwowA0McA
 p0X7zcRF1f0Bt+0TiMwZV69oE5p+edWDprPpFmNQSTufy0OnE/pQhC92xNtsLnqWVDfoZxiFtpAEvcC7/+KkUrstDwDV/M1SeLECy7LVFrVhs5vUwU4KnGGZ
 wNPMe4tXVnFU+jl0wKuYsOHJ7Cuozz3/FIm0BZtB3U74UIwhzitCO3SxTmRI7KJ8IlGcpVvNqtsjY3Gker1BwIfleBPvbm+oBjKwM97ip75SiLhsR/j6wuoy
 FSuLKjGs6uTuwyNBnpk965gvV2ayGJirHEoBuzo3qRK4kJPO50FFGWqbcWHauP12Of9frF5+Uq6vUeXHjagZry7XZKFS7H5XgG5IlIqkKWNVaiwNc7MO1hyj
 LVjo6Z5G+y/8Rv+pCmMoSJaVlYfFnG5ksHrCQHLCcaG8Rp/bCtrjct65LZc=
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
Cc: devicetree@vger.kernel.org, Tony Lindgren <tony@atomide.com>,
 Tomi Valkeinen <tomi.valkeinen@ideasonboard.com>, Sekhar Nori <nsekhar@ti.com>,
 dri-devel@lists.freedesktop.org,
 Laurent Pinchart <laurent.pinchart@ideasonboard.com>,
 Hans Verkuil <hverkuil-cisco@xs4all.nl>, linux-omap@vger.kernel.org
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

Add bridge connector_attach/detach ops. These ops are called when a
bridge is attached or detached to a drm_connector. These ops can be
used to register and unregister an HDMI CEC adapter for a bridge that
supports CEC.

Signed-off-by: Hans Verkuil <hverkuil-cisco@xs4all.nl>
---
 drivers/gpu/drm/drm_bridge_connector.c |  9 +++++++++
 include/drm/drm_bridge.h               | 27 ++++++++++++++++++++++++++
 2 files changed, 36 insertions(+)

diff --git a/drivers/gpu/drm/drm_bridge_connector.c b/drivers/gpu/drm/drm_bridge_connector.c
index 791379816837..07db71d4f5b3 100644
--- a/drivers/gpu/drm/drm_bridge_connector.c
+++ b/drivers/gpu/drm/drm_bridge_connector.c
@@ -203,6 +203,11 @@ static void drm_bridge_connector_destroy(struct drm_connector *connector)
 {
 	struct drm_bridge_connector *bridge_connector =
 		to_drm_bridge_connector(connector);
+	struct drm_bridge *bridge;
+
+	drm_for_each_bridge_in_chain(bridge_connector->encoder, bridge)
+		if (bridge->funcs->connector_detach)
+			bridge->funcs->connector_detach(bridge, connector);
 
 	if (bridge_connector->bridge_hpd) {
 		struct drm_bridge *hpd = bridge_connector->bridge_hpd;
@@ -375,6 +380,10 @@ struct drm_connector *drm_bridge_connector_init(struct drm_device *drm,
 		connector->polled = DRM_CONNECTOR_POLL_CONNECT
 				  | DRM_CONNECTOR_POLL_DISCONNECT;
 
+	drm_for_each_bridge_in_chain(encoder, bridge)
+		if (bridge->funcs->connector_attach)
+			bridge->funcs->connector_attach(bridge, connector);
+
 	return connector;
 }
 EXPORT_SYMBOL_GPL(drm_bridge_connector_init);
diff --git a/include/drm/drm_bridge.h b/include/drm/drm_bridge.h
index 2195daa289d2..3320a6ebd253 100644
--- a/include/drm/drm_bridge.h
+++ b/include/drm/drm_bridge.h
@@ -629,6 +629,33 @@ struct drm_bridge_funcs {
 	 * the DRM_BRIDGE_OP_HPD flag in their &drm_bridge->ops.
 	 */
 	void (*hpd_disable)(struct drm_bridge *bridge);
+
+	/**
+	 * @connector_attach:
+	 *
+	 * This callback is invoked whenever our bridge is being attached to a
+	 * &drm_connector. This is where an HDMI CEC adapter can be registered.
+	 * Note that this callback expects that this op always succeeds. Since
+	 * HDMI CEC support is an optional feature, any failure to register a
+	 * CEC adapter must be ignored since video output will still work
+	 * without CEC.
+	 *
+	 * The @connector_attach callback is optional.
+	 */
+	void (*connector_attach)(struct drm_bridge *bridge,
+				 struct drm_connector *conn);
+
+	/**
+	 * @connector_detach:
+	 *
+	 * This callback is invoked whenever our bridge is being detached from a
+	 * &drm_connector. This is where an HDMI CEC adapter can be
+	 * unregistered.
+	 *
+	 * The @connector_detach callback is optional.
+	 */
+	void (*connector_detach)(struct drm_bridge *bridge,
+				 struct drm_connector *conn);
 };
 
 /**
-- 
2.30.1

_______________________________________________
dri-devel mailing list
dri-devel@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/dri-devel
