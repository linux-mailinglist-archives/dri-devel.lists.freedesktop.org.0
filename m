Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 0978FA2E13E
	for <lists+dri-devel@lfdr.de>; Sun,  9 Feb 2025 23:59:03 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 7C24B10E0CD;
	Sun,  9 Feb 2025 22:58:59 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=fail reason="signature verification failed" (2048-bit key; unprotected) header.d=igalia.com header.i=@igalia.com header.b="jzAM+wMu";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from fanzine2.igalia.com (fanzine.igalia.com [178.60.130.6])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 111CB10E0C4;
 Sun,  9 Feb 2025 22:58:55 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=igalia.com; 
 s=20170329;
 h=Content-Transfer-Encoding:MIME-Version:Message-ID:Date:Subject:
 Cc:To:From:Sender:Reply-To:Content-Type:Content-ID:Content-Description:
 Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
 In-Reply-To:References:List-Id:List-Help:List-Unsubscribe:List-Subscribe:
 List-Post:List-Owner:List-Archive;
 bh=QAgZZwUbKWKXub7+/d5PBfJ+sYXb2kHK1HvyreUsZ6c=; b=jzAM+wMuQrU9LIxPHpsRBKEU+b
 9gidJtJafF8YypX0w+YbXMA9niZuM3nZzyrQbNzT9hxyvtryooQDkoZW/yok2h6n2Xnj9Fs5hZOll
 0rpDSmhNqK8Bkd9S65kELZWrV5FDgole4uewGKKMNgBJq7AkBIQVMx6EPVKFRJm23VzX+cJe9jQ4s
 Uy5vie4mFaOaeKHgb7DirYD5IaWLtJE61tfZTo+GJ2m3hSSuhuy7pkgNIoprmuT9ri+/+hMq8zFPB
 5YwOgLaUxME9xMuJWj3emvpAggvuAChIDkwDy0GabtirutRBL5o7bJTIqGqsbdkVzdV4T6E6xvVNl
 oC7jt/HA==;
Received: from [179.214.71.67] (helo=killbill.home)
 by fanzine2.igalia.com with esmtpsa 
 (Cipher TLS1.3:ECDHE_X25519__RSA_PSS_RSAE_SHA256__AES_256_GCM:256) (Exim)
 id 1thGGC-006wal-Fv; Sun, 09 Feb 2025 23:58:50 +0100
From: Melissa Wen <mwen@igalia.com>
To: harry.wentland@amd.com, sunpeng.li@amd.com, Rodrigo.Siqueira@amd.com,
 alexander.deucher@amd.com, christian.koenig@amd.com, Xinhui.Pan@amd.com,
 airlied@gmail.com, simona@ffwll.ch, alex.hung@amd.com, mwen@igalia.com,
 mario.limonciello@amd.com
Cc: amd-gfx@lists.freedesktop.org, dri-devel@lists.freedesktop.org,
 kernel-dev@igalia.com
Subject: [PATCH] drm/amd/display: restore edid reading from a given i2c adapter
Date: Sun,  9 Feb 2025 19:50:22 -0300
Message-ID: <20250209225843.7412-1-mwen@igalia.com>
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

When switching to drm_edid, we slightly changed how to get edid by
removing the possibility of getting them from dc_link when in aux
transaction mode. As MST doesn't initialize the connector with
`drm_connector_init_with_ddc()`, restore the original behavior to avoid
functional changes.

Fixes: 48edb2a4256e ("drm/amd/display: switch amdgpu_dm_connector to use struct drm_edid")
Signed-off-by: Melissa Wen <mwen@igalia.com>
---


Hi,

So far, there is no reports about an issue related to this but I noticed
this potential functional change when investigating the previous
freesync problem. I'm not 100% clear if MST takes this path without
initializating connector->ddc, but I propose here to restore the
original behavior to avoid regressions.

Melissa


 .../gpu/drm/amd/display/amdgpu_dm/amdgpu_dm.c   | 17 +++++++++++++++--
 1 file changed, 15 insertions(+), 2 deletions(-)

diff --git a/drivers/gpu/drm/amd/display/amdgpu_dm/amdgpu_dm.c b/drivers/gpu/drm/amd/display/amdgpu_dm/amdgpu_dm.c
index a8421c07b160..0cd22a6686a3 100644
--- a/drivers/gpu/drm/amd/display/amdgpu_dm/amdgpu_dm.c
+++ b/drivers/gpu/drm/amd/display/amdgpu_dm/amdgpu_dm.c
@@ -7269,8 +7269,14 @@ static void amdgpu_dm_connector_funcs_force(struct drm_connector *connector)
 	struct dc_link *dc_link = aconnector->dc_link;
 	struct dc_sink *dc_em_sink = aconnector->dc_em_sink;
 	const struct drm_edid *drm_edid;
+	struct i2c_adapter *ddc;
 
-	drm_edid = drm_edid_read(connector);
+	if (dc_link->aux_mode)
+		ddc = &aconnector->dm_dp_aux.aux.ddc;
+	else
+		ddc = &aconnector->i2c->base;
+
+	drm_edid = drm_edid_read_ddc(connector, ddc);
 	drm_edid_connector_update(connector, drm_edid);
 	if (!drm_edid) {
 		DRM_ERROR("No EDID found on connector: %s.\n", connector->name);
@@ -7315,14 +7321,21 @@ static int get_modes(struct drm_connector *connector)
 static void create_eml_sink(struct amdgpu_dm_connector *aconnector)
 {
 	struct drm_connector *connector = &aconnector->base;
+	struct dc_link *dc_link = aconnector->dc_link;
 	struct dc_sink_init_data init_params = {
 			.link = aconnector->dc_link,
 			.sink_signal = SIGNAL_TYPE_VIRTUAL
 	};
 	const struct drm_edid *drm_edid;
 	const struct edid *edid;
+	struct i2c_adapter *ddc;
 
-	drm_edid = drm_edid_read(connector);
+	if (dc_link->aux_mode)
+		ddc = &aconnector->dm_dp_aux.aux.ddc;
+	else
+		ddc = &aconnector->i2c->base;
+
+	drm_edid = drm_edid_read_ddc(connector, ddc);
 	drm_edid_connector_update(connector, drm_edid);
 	if (!drm_edid) {
 		DRM_ERROR("No EDID found on connector: %s.\n", connector->name);
-- 
2.47.2

