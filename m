Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id E9BDEB1800E
	for <lists+dri-devel@lfdr.de>; Fri,  1 Aug 2025 12:17:57 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 69CC910E82F;
	Fri,  1 Aug 2025 10:17:54 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=collabora.com header.i=@collabora.com header.b="FivWP6az";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from bali.collaboradmins.com (bali.collaboradmins.com
 [148.251.105.195])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 8786A10E2F2
 for <dri-devel@lists.freedesktop.org>; Fri,  1 Aug 2025 10:17:52 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=collabora.com;
 s=mail; t=1754043471;
 bh=UAp6q2HQaFYkT+WsKR0VJrmtEOmsyqfDvFnOxQ/Geno=;
 h=From:To:Cc:Subject:Date:From;
 b=FivWP6az2Khv5TZ1cWLV2uEa5zcsLnXBMJnN6BAC2VnzPwy/dd9u4NGmUNWG6UCwd
 hz0xPux14D0DBjcEhIpuyENkuALop5co+B1eN67iPun01dHC2WNsWG6u1ctsGcBCu7
 b9+2mXOWVZ7wi709RobAdiCYHUuENMXYoJFpCbUnRSddw5zZW0GhRsL7Ym757MF3RM
 nEjXV6FhbFQ1Xclhby0Vn+EtU3Hi7vhRHIJr5vaexscKPqJnl0j4951YHMvkYCLRVw
 hmvX+03zU0U2fM81Lr2xaO/TL345baE01W848eu9ru9z7P3vMwMIMuHX+E1ntOM1na
 vvYP3pmtHmzhA==
Received: from localhost.localdomain (unknown
 [IPv6:2a02:2f08:e802:5400:c944:7b00:6281:94b5])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
 (No client certificate requested) (Authenticated sender: mvlad)
 by bali.collaboradmins.com (Postfix) with ESMTPSA id C8B5217E1293;
 Fri,  1 Aug 2025 12:17:50 +0200 (CEST)
From: Marius Vlad <marius.vlad@collabora.com>
To: dri-devel@lists.freedesktop.org
Cc: daniel.stone@collabora.com, jani.nikula@linux.intel.com,
 tzimmermann@suse.de, simona.vetter@ffwll.ch, marius.vlad@collabora.com,
 derek.foreman@collabora.com
Subject: [PATCH] drm/connector: hdmi: Add a link bpc property
Date: Fri,  1 Aug 2025 13:17:50 +0300
Message-ID: <20250801101750.1726-1-marius.vlad@collabora.com>
X-Mailer: git-send-email 2.47.2
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
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

From: Derek Foreman <derek.foreman@collabora.com>

Add a way to know the actual bpc of a running link.

Drivers might change the current bpc link value due to changes in mode
line or refresh rates. For example when enabling VRR the underlying
hardware might not be able sustain the same bandwidth for a particular
mode line, and it might attempt to lower the bpc. Another example can be
found when switching the color output format, part of YUV420 fallback.

This means we might be displaying a stale bpc value although it was
modified for different reasons -- like a refresh rate or an output
color format.

This patch introduces a new property 'link bpc' that user-space can
use to get the current bpc value of a running link. In the same
time this would allow user-space set up bpc using 'max_bpc' property.

Signed-off-by: Derek Foreman <derek.foreman@collabora.com>
Signed-off-by: Marius Vlad <marius.vlad@collabora.com>
---
 drivers/gpu/drm/drm_atomic_uapi.c |  5 +++++
 drivers/gpu/drm/drm_connector.c   | 26 ++++++++++++++++++++++++++
 include/drm/drm_connector.h       |  8 ++++++++
 3 files changed, 39 insertions(+)

diff --git a/drivers/gpu/drm/drm_atomic_uapi.c b/drivers/gpu/drm/drm_atomic_uapi.c
index ecc73d52bfae..3a2ffb957ade 100644
--- a/drivers/gpu/drm/drm_atomic_uapi.c
+++ b/drivers/gpu/drm/drm_atomic_uapi.c
@@ -776,6 +776,9 @@ static int drm_atomic_connector_set_property(struct drm_connector *connector,
 						   fence_ptr);
 	} else if (property == connector->max_bpc_property) {
 		state->max_requested_bpc = val;
+	} else if (property == connector->link_bpc_property) {
+		drm_dbg_kms(dev, "only drivers can set link bpc property. Use max_bpc instead\n");
+		return -EINVAL;
 	} else if (property == connector->privacy_screen_sw_state_property) {
 		state->privacy_screen_sw_state = val;
 	} else if (property == connector->broadcast_rgb_property) {
@@ -861,6 +864,8 @@ drm_atomic_connector_get_property(struct drm_connector *connector,
 		*val = 0;
 	} else if (property == connector->max_bpc_property) {
 		*val = state->max_requested_bpc;
+	} else if (property == connector->link_bpc_property) {
+		*val = state->hdmi.output_bpc;
 	} else if (property == connector->privacy_screen_sw_state_property) {
 		*val = state->privacy_screen_sw_state;
 	} else if (property == connector->broadcast_rgb_property) {
diff --git a/drivers/gpu/drm/drm_connector.c b/drivers/gpu/drm/drm_connector.c
index 272d6254ea47..7ed27aec0ccc 100644
--- a/drivers/gpu/drm/drm_connector.c
+++ b/drivers/gpu/drm/drm_connector.c
@@ -542,6 +542,28 @@ int drmm_connector_init(struct drm_device *dev,
 }
 EXPORT_SYMBOL(drmm_connector_init);
 
+static int
+drm_connector_attach_link_bpc_property(struct drm_connector *connector,
+				       int min, int max)
+{
+	struct drm_device *dev = connector->dev;
+	struct drm_property *prop;
+
+	prop = connector->link_bpc_property;
+	if (prop)
+		return 0;
+
+	prop = drm_property_create_range(dev, 0, "link bpc", min, max);
+	if (!prop)
+		return -ENOMEM;
+
+	connector->link_bpc_property = prop;
+
+	drm_object_attach_property(&connector->base, prop, max);
+
+	return 0;
+}
+
 /**
  * drmm_connector_hdmi_init - Init a preallocated HDMI connector
  * @dev: DRM device
@@ -618,6 +640,10 @@ int drmm_connector_hdmi_init(struct drm_device *dev,
 	drm_connector_attach_max_bpc_property(connector, 8, max_bpc);
 	connector->max_bpc = max_bpc;
 
+	ret = drm_connector_attach_link_bpc_property(connector, 8, max_bpc);
+	if (ret)
+		return ret;
+
 	if (max_bpc > 8)
 		drm_connector_attach_hdr_output_metadata_property(connector);
 
diff --git a/include/drm/drm_connector.h b/include/drm/drm_connector.h
index 8f34f4b8183d..4a50198aa7c0 100644
--- a/include/drm/drm_connector.h
+++ b/include/drm/drm_connector.h
@@ -2079,6 +2079,14 @@ struct drm_connector {
 	 */
 	struct drm_property *max_bpc_property;
 
+	/**
+	 * @link_bpc_property: Current connector link bpc set by the driver
+	 *
+	 * This property can be used to retrieve the current link bpc from
+	 * connector_state::hdmi:output_bpc
+	 */
+	struct drm_property *link_bpc_property;
+
 	/** @privacy_screen: drm_privacy_screen for this connector, or NULL. */
 	struct drm_privacy_screen *privacy_screen;
 
-- 
2.47.2

