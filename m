Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 933AC988CDA
	for <lists+dri-devel@lfdr.de>; Sat, 28 Sep 2024 01:06:31 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id D2F0A10ED41;
	Fri, 27 Sep 2024 23:06:29 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=kernel.org header.i=@kernel.org header.b="TzDTyW7z";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from dfw.source.kernel.org (dfw.source.kernel.org [139.178.84.217])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 9FDAD10ED3C;
 Fri, 27 Sep 2024 23:06:19 +0000 (UTC)
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
 by dfw.source.kernel.org (Postfix) with ESMTP id 0A4845C479C;
 Fri, 27 Sep 2024 23:06:15 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 9D492C4CECE;
 Fri, 27 Sep 2024 23:06:17 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=k20201202; t=1727478378;
 bh=e69DCfIRrx1HCBMhyuWL56YP8dt8rtB8OVAtl08htIY=;
 h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
 b=TzDTyW7zZ8W9KYTI3s+nZAY9y/8eMyqQvW9YkHAgcp31RzIflvVCrSB5ze8q5JWfx
 s9TXcIZU9MH2/szsAP9qiNlI3xz28l7sMkjdf0jWaeioOPPtrey+ZPOzFVmXBdT2NF
 1tALQ2aTwLfeZUhwlwonoWfWgijjW0yIcFCuuTqRBNAH/3PA+4XFro+Y+LwyzdJy9V
 jHQwWjwatzmjOZd5M3+6Dq4qBNEcwaf9HlrXIWgyGPaBEnSxJqubWhHj0lxPQLkyDr
 2AF9EppKCFvAaWJZISEI7M9114HCta37o7wzsbWNth8lmHBeyR+9a3NR7rxZBSy4SF
 jsA251cECxLRQ==
From: Mario Limonciello <superm1@kernel.org>
To: Alex Hung <alex.hung@amd.com>,
 Alexander Deucher <alexander.deucher@amd.com>,
 Melissa Wen <mwen@igalia.com>
Cc: kernel-dev@igalia.com, Mario Limonciello <mario.limonciello@amd.com>,
 amd-gfx@lists.freedesktop.org, dri-devel@lists.freedesktop.org,
 harry.wentland@amd.com, sunpeng.li@amd.com,
 Mark Pearson <mpearson-lenovo@squebb.ca>
Subject: [PATCH v8 5/5] drm/amd/display: Fetch the EDID from _DDC if available
 for eDP
Date: Fri, 27 Sep 2024 18:06:00 -0500
Message-ID: <20240927230600.2619844-6-superm1@kernel.org>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20240927230600.2619844-1-superm1@kernel.org>
References: <20240927230600.2619844-1-superm1@kernel.org>
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

Reviewed-by: Alex Hung <alex.hung@amd.com>
Signed-off-by: Mario Limonciello <mario.limonciello@amd.com>
---
v3:
 * Change message to INFO when using ACPI EDID
 * rebase
---
 .../amd/display/amdgpu_dm/amdgpu_dm_helpers.c | 65 ++++++++++++++++++-
 drivers/gpu/drm/amd/include/amd_shared.h      |  5 ++
 2 files changed, 67 insertions(+), 3 deletions(-)

diff --git a/drivers/gpu/drm/amd/display/amdgpu_dm/amdgpu_dm_helpers.c b/drivers/gpu/drm/amd/display/amdgpu_dm/amdgpu_dm_helpers.c
index b8004ccdcc33..7534e1624e4f 100644
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
@@ -887,6 +889,60 @@ bool dm_helpers_is_dp_sink_present(struct dc_link *link)
 	return dp_sink_present;
 }
 
+static int
+dm_helpers_probe_acpi_edid(void *data, u8 *buf, unsigned int block, size_t len)
+{
+	struct drm_connector *connector = data;
+	struct acpi_device *acpidev = ACPI_COMPANION(connector->dev->dev);
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
+		drm_dbg(connector->dev, "Failed to get EDID from ACPI: %d\n", r);
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
@@ -909,8 +965,11 @@ enum dc_edid_status dm_helpers_read_local_edid(
 	 * do check sum and retry to make sure read correct edid.
 	 */
 	do {
-
-		drm_edid = drm_edid_read_ddc(connector, ddc);
+		drm_edid = dm_helpers_read_acpi_edid(aconnector);
+		if (drm_edid)
+			drm_info(connector->dev, "Using ACPI provided EDID for %s\n", connector->name);
+		else
+			drm_edid = drm_edid_read_ddc(connector, ddc);
 		drm_edid_connector_update(connector, drm_edid);
 
 		/* DP Compliance Test 4.2.2.6 */
@@ -1300,4 +1359,4 @@ bool dm_helpers_is_hdr_on(struct dc_context *ctx, struct dc_stream_state *stream
 {
 	// TODO
 	return false;
-}
\ No newline at end of file
+}
diff --git a/drivers/gpu/drm/amd/include/amd_shared.h b/drivers/gpu/drm/amd/include/amd_shared.h
index 3f91926a50e9..1ec7c5e5249e 100644
--- a/drivers/gpu/drm/amd/include/amd_shared.h
+++ b/drivers/gpu/drm/amd/include/amd_shared.h
@@ -337,6 +337,11 @@ enum DC_DEBUG_MASK {
 	 * @DC_FORCE_IPS_ENABLE: If set, force enable all IPS, all the time.
 	 */
 	DC_FORCE_IPS_ENABLE = 0x4000,
+	/**
+	 * @DC_DISABLE_ACPI_EDID: If set, don't attempt to fetch EDID for
+	 * eDP display from ACPI _DDC method.
+	 */
+	DC_DISABLE_ACPI_EDID = 0x8000,
 };
 
 enum amd_dpm_forced_level;
-- 
2.43.0

