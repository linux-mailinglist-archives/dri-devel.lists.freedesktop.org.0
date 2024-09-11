Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 918D6975C93
	for <lists+dri-devel@lfdr.de>; Wed, 11 Sep 2024 23:36:16 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id CECB210EAC3;
	Wed, 11 Sep 2024 21:36:08 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=kernel.org header.i=@kernel.org header.b="R0JZyRAU";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from dfw.source.kernel.org (dfw.source.kernel.org [139.178.84.217])
 by gabe.freedesktop.org (Postfix) with ESMTPS id A7D0E10EABD;
 Wed, 11 Sep 2024 21:36:06 +0000 (UTC)
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
 by dfw.source.kernel.org (Postfix) with ESMTP id 8A1475C0776;
 Wed, 11 Sep 2024 21:36:02 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id CBFA0C4CECF;
 Wed, 11 Sep 2024 21:36:04 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=k20201202; t=1726090565;
 bh=vPifgjQo5kfkxp7/usZZ/zXq5MkQ4YXB2TR4R9P+6to=;
 h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
 b=R0JZyRAUd9vdZ2yTuOJxD1dbMuKqHFF0wqAjuI8uMUS6y6vz3ILJK7vHXgaUduyhr
 flAkDRoLLFQYczu45Yp+PsCbst+qK04Mdo8UJxe5Sl54ikn4B0wD3EG8O/50l1dt7z
 g2121TUgq2ZLittrqfNLDpOZ2IuPrgngbPSqjPlRPyFdsNdX/Ck/JXNJckLDNqwLRh
 oYf//9wviCQNA6R9GBzaUS0NkRZ0jwvwx+1RlDps3/HZCLdcpzmO4mVpZ13FXwMQmf
 wB6RHl+Ew62hDdpN7bnZDFtG0XfxYISbexzqjgSvW08vCVBXG6/oCUrW4gHLIiZpqs
 z+viwonWwbAAQ==
From: Mario Limonciello <superm1@kernel.org>
To: Alex Hung <alex.hung@amd.com>,
 Alexander Deucher <alexander.deucher@amd.com>,
 Melissa Wen <mwen@igalia.com>
Cc: kernel-dev@igalia.com, Mario Limonciello <mario.limonciello@amd.com>,
 amd-gfx@lists.freedesktop.org, dri-devel@lists.freedesktop.org,
 harry.wentland@amd.com, sunpeng.li@amd.com,
 Mark Pearson <mpearson-lenovo@squebb.ca>
Subject: [PATCH v6 10/10] drm/amd: Fetch the EDID from _DDC if available for
 eDP
Date: Wed, 11 Sep 2024 16:35:37 -0500
Message-ID: <20240911213537.2338164-12-superm1@kernel.org>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20240911213537.2338164-1-superm1@kernel.org>
References: <20240911213537.2338164-1-superm1@kernel.org>
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

From: Mario Limonciello <mario.limonciello@amd.com>

Some manufacturers have intentionally put an EDID that differs from
the EDID on the internal panel on laptops.

Attempt to fetch this EDID if it exists and prefer it over the EDID
that is provided by the panel. If a user prefers to use the EDID from
the panel, offer a DC debugging parameter that would disable this.

Signed-off-by: Mario Limonciello <mario.limonciello@amd.com>
---
 .../amd/display/amdgpu_dm/amdgpu_dm_helpers.c | 63 ++++++++++++++++++-
 drivers/gpu/drm/amd/include/amd_shared.h      |  1 +
 2 files changed, 63 insertions(+), 1 deletion(-)

diff --git a/drivers/gpu/drm/amd/display/amdgpu_dm/amdgpu_dm_helpers.c b/drivers/gpu/drm/amd/display/amdgpu_dm/amdgpu_dm_helpers.c
index 1118986bb3e2..26d5fff6e185 100644
--- a/drivers/gpu/drm/amd/display/amdgpu_dm/amdgpu_dm_helpers.c
+++ b/drivers/gpu/drm/amd/display/amdgpu_dm/amdgpu_dm_helpers.c
@@ -23,6 +23,8 @@
  *
  */
 
+#include <acpi/video.h>
+
 #include <linux/string.h>
 #include <linux/acpi.h>
 #include <linux/i2c.h>
@@ -874,6 +876,61 @@ bool dm_helpers_is_dp_sink_present(struct dc_link *link)
 	return dp_sink_present;
 }
 
+static int
+dm_helpers_probe_acpi_edid(void *data, u8 *buf, unsigned int block, size_t len)
+{
+	struct drm_connector *connector = data;
+	struct drm_device *ddev = connector->dev;
+	struct acpi_device *acpidev = ACPI_COMPANION(ddev->dev);
+	unsigned char start = block * EDID_LENGTH;
+	void *edid;
+	int r;
+
+	if (!acpidev)
+		return -ENODEV;
+
+	/* fetch the entire edid from BIOS */
+	r = acpi_video_get_edid(acpidev, ACPI_VIDEO_DISPLAY_LCD, -1, &edid);
+	if (r < 0) {
+		DRM_DEBUG_KMS("Failed to get EDID from ACPI: %d\n", r);
+		return r;
+	}
+	if (len > r || start > r || start + len > r) {
+		r = -EINVAL;
+		goto cleanup;
+	}
+
+	memcpy(buf, edid + start, len);
+	r = 0;
+
+cleanup:
+	kfree(edid);
+
+	return r;
+}
+
+static const struct drm_edid *
+dm_helpers_read_acpi_edid(struct amdgpu_dm_connector *aconnector)
+{
+	struct drm_connector *connector = &aconnector->base;
+
+	if (amdgpu_dc_debug_mask & DC_DISABLE_ACPI_EDID)
+		return NULL;
+
+	switch (connector->connector_type) {
+	case DRM_MODE_CONNECTOR_LVDS:
+	case DRM_MODE_CONNECTOR_eDP:
+		break;
+	default:
+		return NULL;
+	}
+
+	if (connector->force == DRM_FORCE_OFF)
+		return NULL;
+
+	return drm_edid_read_custom(connector, dm_helpers_probe_acpi_edid, connector);
+}
+
 enum dc_edid_status dm_helpers_read_local_edid(
 		struct dc_context *ctx,
 		struct dc_link *link,
@@ -896,7 +953,11 @@ enum dc_edid_status dm_helpers_read_local_edid(
 	 * do check sum and retry to make sure read correct edid.
 	 */
 	do {
-		drm_edid = drm_edid_read_ddc(connector, ddc);
+		drm_edid = dm_helpers_read_acpi_edid(aconnector);
+		if (drm_edid)
+			DRM_DEBUG_KMS("Using ACPI provided EDID for %s\n", connector->name);
+		else
+			drm_edid = drm_edid_read_ddc(connector, ddc);
 		drm_edid_connector_update(connector, drm_edid);
 		aconnector->drm_edid = drm_edid;
 
diff --git a/drivers/gpu/drm/amd/include/amd_shared.h b/drivers/gpu/drm/amd/include/amd_shared.h
index f5b725f10a7c..9702eba767f9 100644
--- a/drivers/gpu/drm/amd/include/amd_shared.h
+++ b/drivers/gpu/drm/amd/include/amd_shared.h
@@ -264,6 +264,7 @@ enum DC_DEBUG_MASK {
 	DC_DISABLE_PSR_SU = 0x200,
 	DC_DISABLE_REPLAY = 0x400,
 	DC_DISABLE_IPS = 0x800,
+	DC_DISABLE_ACPI_EDID = 0x1000,
 };
 
 enum amd_dpm_forced_level;
-- 
2.43.0

