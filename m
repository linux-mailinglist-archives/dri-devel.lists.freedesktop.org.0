Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 75DB4B3F88A
	for <lists+dri-devel@lfdr.de>; Tue,  2 Sep 2025 10:33:55 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 9ED3110E5E9;
	Tue,  2 Sep 2025 08:33:53 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=kernel.org header.i=@kernel.org header.b="f3MwPS61";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from sea.source.kernel.org (sea.source.kernel.org [172.234.252.31])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 9933110E5EF
 for <dri-devel@lists.freedesktop.org>; Tue,  2 Sep 2025 08:33:52 +0000 (UTC)
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
 by sea.source.kernel.org (Postfix) with ESMTP id 800B5449ED;
 Tue,  2 Sep 2025 08:33:52 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 132B0C4CEED;
 Tue,  2 Sep 2025 08:33:51 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=k20201202; t=1756802032;
 bh=nznIDz/RwyFHB64jOttfdGvwW1sYq0eP//HxxKXRQ1Q=;
 h=From:Date:Subject:References:In-Reply-To:To:Cc:From;
 b=f3MwPS61atv4CneDzwNdPsGDTWICZmy+kSOteSJ4gd9jV0Zt+HnoBVbKsI4pcV4Af
 TEIpiDCZJZhKPDdFESBOcWux1nz53tz5y5hIF9nDHxw22pz3ydUDgVrwNoHhySXfCL
 wn9Je/Cv/CsVPWY3FekjcLBOd0CHOXn6CsOWEH/HWpd7suAa2qba51LZZvx8mzTToC
 22M7GtaGEDWaXBqaONNDun5BsyckydSFiHz/y+9XzbPUKJ11JxP8GtnDbJD+MysY0q
 5EKRSTAzE+Xl3HTa96YQSQVE3Drx183QpIN9GQH/TB+enFphcjF//QzhAPtq3iAnRG
 z9fi7nVcV8hvQ==
From: Maxime Ripard <mripard@kernel.org>
Date: Tue, 02 Sep 2025 10:32:44 +0200
Subject: [PATCH 16/29] drm/encoder: Create get_current_crtc hook
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20250902-drm-state-readout-v1-16-14ad5315da3f@kernel.org>
References: <20250902-drm-state-readout-v1-0-14ad5315da3f@kernel.org>
In-Reply-To: <20250902-drm-state-readout-v1-0-14ad5315da3f@kernel.org>
To: Maarten Lankhorst <maarten.lankhorst@linux.intel.com>, 
 Thomas Zimmermann <tzimmermann@suse.de>, David Airlie <airlied@gmail.com>, 
 Simona Vetter <simona@ffwll.ch>, Andrzej Hajda <andrzej.hajda@intel.com>, 
 Neil Armstrong <neil.armstrong@linaro.org>, Robert Foss <rfoss@kernel.org>, 
 Laurent Pinchart <Laurent.pinchart@ideasonboard.com>, 
 Jonas Karlman <jonas@kwiboo.se>, Jernej Skrabec <jernej.skrabec@gmail.com>, 
 Jyri Sarha <jyri.sarha@iki.fi>, 
 Tomi Valkeinen <tomi.valkeinen@ideasonboard.com>
Cc: Devarsh Thakkar <devarsht@ti.com>, dri-devel@lists.freedesktop.org, 
 linux-kernel@vger.kernel.org, Maxime Ripard <mripard@kernel.org>
X-Mailer: b4 0.14.2
X-Developer-Signature: v=1; a=openpgp-sha256; l=1801; i=mripard@kernel.org;
 h=from:subject:message-id; bh=nznIDz/RwyFHB64jOttfdGvwW1sYq0eP//HxxKXRQ1Q=;
 b=owGbwMvMwCmsHn9OcpHtvjLG02pJDBnbVu8WzHvutvnvcvMtkSs+bgqcvGdK8Lk3Ajtk/7782
 fWRmU1aomMqC4MwJ4OsmCLLE5mw08vbF1c52K/8ATOHlQlkCAMXpwBM5KQPYzXb/eSUrSWhCppq
 MWldXF9LD0zdf+nx9I5zHS+z9mc6u9+NMDp4fNfufq7ldw7tnsk65x1jw1yGrYYnNjBY6s3cpjb
 9pfPDyNLspSuurP96rGLVNQZ2x98Li5QWyChOZDrDxCmrUj39AwA=
X-Developer-Key: i=mripard@kernel.org; a=openpgp;
 fpr=BE5675C37E818C8B5764241C254BCFC56BF6CE8D
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

In order for drivers to implement drm_connectors atomic_state_readout
hooks, they need to query the hardware and lookup the CRTC to set
drm_connector_state.crtc.

It should be easy enough for drivers that are tightly integrated from
the CRTC to the connectors, but if the driver uses bridges, there's no
coupling between the CRTC and encoder, and the bridge driver.

The only thing the bridge has access to is the encoder, but the
relationship between a CRTC and an encoder isn't a fixed mapping at the
framework level, and thus the bridge can't deduce which CRTC is feeding
its encoder.

Thus, let's create a new hook for encoders to implement to return the
CRTC they are currently connected to.

Signed-off-by: Maxime Ripard <mripard@kernel.org>
---
 include/drm/drm_encoder.h | 13 +++++++++++++
 1 file changed, 13 insertions(+)

diff --git a/include/drm/drm_encoder.h b/include/drm/drm_encoder.h
index 977a9381c8ba943b4d3e021635ea14856df8a17d..7abb5e35ac950c941b56fc311a52789bbc427df6 100644
--- a/include/drm/drm_encoder.h
+++ b/include/drm/drm_encoder.h
@@ -86,10 +86,23 @@ struct drm_encoder_funcs {
 	 * @debugfs_init:
 	 *
 	 * Allows encoders to create encoder-specific debugfs files.
 	 */
 	void (*debugfs_init)(struct drm_encoder *encoder, struct dentry *root);
+
+	/**
+	 * @get_current_crtc:
+	 *
+	 * This optional hook is used during initialization to read out
+	 * the initial state by connectors that support atomic state
+	 * hardware readout.
+	 *
+	 * Returns:
+	 *
+	 * The CRTC currently associated with the encoder if enabled, NULL otherwise.
+	 */
+	struct drm_crtc *(*get_current_crtc)(struct drm_encoder *encoder);
 };
 
 /**
  * struct drm_encoder - central DRM encoder structure
  * @dev: parent DRM device

-- 
2.50.1

