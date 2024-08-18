Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 2DDDB955C2F
	for <lists+dri-devel@lfdr.de>; Sun, 18 Aug 2024 12:43:58 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id BA81710E060;
	Sun, 18 Aug 2024 10:43:54 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (1024-bit key; unprotected) header.d=weissschuh.net header.i=@weissschuh.net header.b="gjSqJwH1";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from todd.t-8ch.de (todd.t-8ch.de [159.69.126.157])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 0D70010E031;
 Sun, 18 Aug 2024 10:43:46 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=weissschuh.net;
 s=mail; t=1723977821;
 bh=zNpawsVFRDk6vrSECsGfQPnlXBxT3clIu57tYxQtJTA=;
 h=From:Date:Subject:References:In-Reply-To:To:Cc:From;
 b=gjSqJwH1l3YisR4wu4uoMTnT4VyqZ32lmXhUjRNH/HAKopGorWiO3lKf6+CBFj2Md
 kiclCPNQShJaichlb3I5dsxf86EqTtfX8xKquCumfJU8CwDaCiWnMzlulCJ2VXq3xN
 m+iVpg+Z8gVFPs8cXdfCyDfgadk65qI7XgPGBVp4=
From: =?utf-8?q?Thomas_Wei=C3=9Fschuh?= <linux@weissschuh.net>
Date: Sun, 18 Aug 2024 12:43:34 +0200
Subject: [PATCH 10/12] drm/edid: add a helper to compare two EDIDs
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit
Message-Id: <20240818-amdgpu-drm_edid-v1-10-aea66c1f7cf4@weissschuh.net>
References: <20240818-amdgpu-drm_edid-v1-0-aea66c1f7cf4@weissschuh.net>
In-Reply-To: <20240818-amdgpu-drm_edid-v1-0-aea66c1f7cf4@weissschuh.net>
To: Harry Wentland <harry.wentland@amd.com>, Leo Li <sunpeng.li@amd.com>, 
 Rodrigo Siqueira <Rodrigo.Siqueira@amd.com>, 
 Alex Deucher <alexander.deucher@amd.com>, 
 =?utf-8?q?Christian_K=C3=B6nig?= <christian.koenig@amd.com>, 
 Xinhui Pan <Xinhui.Pan@amd.com>, David Airlie <airlied@gmail.com>, 
 Daniel Vetter <daniel@ffwll.ch>, jinzh <jinzh@github.amd.com>, 
 Aric Cyr <Aric.Cyr@amd.com>, Alan Liu <HaoPing.Liu@amd.com>, 
 Tony Cheng <Tony.Cheng@amd.com>, 
 Andrey Grodzovsky <Andrey.Grodzovsky@amd.com>, 
 Maarten Lankhorst <maarten.lankhorst@linux.intel.com>, 
 Maxime Ripard <mripard@kernel.org>, Thomas Zimmermann <tzimmermann@suse.de>
Cc: amd-gfx@lists.freedesktop.org, dri-devel@lists.freedesktop.org, 
 linux-kernel@vger.kernel.org, Harry Wentland <Harry.Wentland@amd.com>, 
 =?utf-8?q?Thomas_Wei=C3=9Fschuh?= <linux@weissschuh.net>
X-Mailer: b4 0.14.1
X-Developer-Signature: v=1; a=ed25519-sha256; t=1723977820; l=1920;
 i=linux@weissschuh.net; s=20221212; h=from:subject:message-id;
 bh=zNpawsVFRDk6vrSECsGfQPnlXBxT3clIu57tYxQtJTA=;
 b=LhDAhouDFnqt2Qjronm11swSH/altKLu1DfmQcdZo7y7dhXuRu1xxeREPmyIR1vaiy9f7GKjP
 7YJxlXRJaQNDRkpUIhH7V5gANCsX9m1W8wm6itHksC6oDy9ILKRD3Ff
X-Developer-Key: i=linux@weissschuh.net; a=ed25519;
 pk=KcycQgFPX2wGR5azS7RhpBqedglOZVgRPfdFSPB1LNw=
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

As struct drm_edid is opaque, drivers can't directly memcmp() the
contained data. Add a helper to provide this functionality.

Signed-off-by: Thomas Weißschuh <linux@weissschuh.net>
---
 drivers/gpu/drm/drm_edid.c | 18 ++++++++++++++++++
 include/drm/drm_edid.h     |  1 +
 2 files changed, 19 insertions(+)

diff --git a/drivers/gpu/drm/drm_edid.c b/drivers/gpu/drm/drm_edid.c
index 69fb11741abd..c2493c983a64 100644
--- a/drivers/gpu/drm/drm_edid.c
+++ b/drivers/gpu/drm/drm_edid.c
@@ -1840,6 +1840,24 @@ static bool drm_edid_eq(const struct drm_edid *drm_edid,
 	return true;
 }
 
+/**
+ * drm_edid_equal - compare two EDID
+ * @drm_edid_a: First EDID data
+ * @drm_edid_b: Second EDID data
+ *
+ * Compare two EDIDs for equality (including extensions)
+ *
+ * Return: True if the EDIDs are equal, false otherwise.
+ */
+bool drm_edid_equal(const struct drm_edid *drm_edid_a, const struct drm_edid *drm_edid_b)
+{
+	if (!drm_edid_b)
+		return !drm_edid_a;
+
+	return drm_edid_eq(drm_edid_a, drm_edid_b->edid, drm_edid_b->size);
+}
+EXPORT_SYMBOL(drm_edid_equal);
+
 enum edid_block_status {
 	EDID_BLOCK_OK = 0,
 	EDID_BLOCK_READ_FAIL,
diff --git a/include/drm/drm_edid.h b/include/drm/drm_edid.h
index a5b377c4a342..35b40a9d3350 100644
--- a/include/drm/drm_edid.h
+++ b/include/drm/drm_edid.h
@@ -456,6 +456,7 @@ drm_display_mode_from_cea_vic(struct drm_device *dev,
 const struct drm_edid *drm_edid_alloc(const void *edid, size_t size);
 const struct drm_edid *drm_edid_dup(const struct drm_edid *drm_edid);
 void drm_edid_free(const struct drm_edid *drm_edid);
+bool drm_edid_equal(const struct drm_edid *drm_edid_a, const struct drm_edid *drm_edid_b);
 bool drm_edid_valid(const struct drm_edid *drm_edid);
 const struct edid *drm_edid_raw(const struct drm_edid *drm_edid);
 const struct drm_edid *drm_edid_read(struct drm_connector *connector);

-- 
2.46.0

