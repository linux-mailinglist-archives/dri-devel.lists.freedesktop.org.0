Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 4C7BAAAD22C
	for <lists+dri-devel@lfdr.de>; Wed,  7 May 2025 02:18:36 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 8154C10E710;
	Wed,  7 May 2025 00:18:34 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=fail reason="signature verification failed" (2048-bit key; unprotected) header.d=igalia.com header.i=@igalia.com header.b="WZF5zS4i";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from fanzine2.igalia.com (fanzine2.igalia.com [213.97.179.56])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 011F910E710;
 Wed,  7 May 2025 00:18:33 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=igalia.com; 
 s=20170329;
 h=Content-Transfer-Encoding:Content-Type:MIME-Version:References:
 In-Reply-To:Message-ID:Date:Subject:Cc:To:From:Sender:Reply-To:Content-ID:
 Content-Description:Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc
 :Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:List-Subscribe:
 List-Post:List-Owner:List-Archive;
 bh=RGglnO5f4I8XsEDNoP/d0h/buT7gOXY7EzVSTerynYA=; b=WZF5zS4ikPVfTLWH+RWuwsrOXB
 ifKZjosZSocUDGs+MOEwQJkKEoQmEZCS0BSsULVSuyKOs29PvENbWEuISHMirOwAWVEjnQPoJ1yWU
 Tb+skhlrLJbzCR3e8a5x9ob1ZAMEjlyRuH6vD6Bo/4YaBGfUhBhPlTj/8C+O+bGxtd5POzqz20DrT
 pdTZdcoQdhvYsaluGVqmiC+KBtiQg2BDySPiJty40M0QC0NWSN6uWYTpW3PSRvDQFkrXB0FJBHr+p
 8h96cQUkkSwWEpPZWyalQpcba1+Mauc6l2g7yJuFkDUU6KtfwLIC2pLwb7+dPixm6vnvMGPU7pEUc
 P6+8ke1A==;
Received: from [189.6.16.79] (helo=killbill.home)
 by fanzine2.igalia.com with esmtpsa 
 (Cipher TLS1.3:ECDHE_X25519__RSA_PSS_RSAE_SHA256__AES_256_GCM:256) (Exim)
 id 1uCSQq-004SNM-3J; Wed, 07 May 2025 02:18:25 +0200
From: Melissa Wen <mwen@igalia.com>
To: maarten.lankhorst@linux.intel.com, mripard@kernel.org, tzimmermann@suse.de,
 airlied@gmail.com, simona@ffwll.ch
Cc: Jani Nikula <jani.nikula@linux.intel.com>, amd-gfx@lists.freedesktop.org,
 Alex Hung <alex.hung@amd.com>,
 Mario Limonciello <mario.limonciello@amd.com>,
 Rodrigo Siqueira <siqueira@igalia.com>,
 Michel Daenzer <michel.daenzer@mailbox.org>,
 dri-devel@lists.freedesktop.org, kernel-dev@igalia.com
Subject: [PATCH v2 12/14] drm/edid: introduce a helper that compares edid data
 from two drm_edid
Date: Tue,  6 May 2025 21:04:06 -0300
Message-ID: <20250507001712.120215-13-mwen@igalia.com>
X-Mailer: git-send-email 2.47.2
In-Reply-To: <20250507001712.120215-1-mwen@igalia.com>
References: <20250507001712.120215-1-mwen@igalia.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
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

AMD driver has a function used to compare if two edid are the same; this
is useful to some of the link detection algorithms implemented by
amdgpu. Since the amdgpu function can be helpful for other drivers, this
commit abstracts the AMD function to make it available at the DRM level
by wrapping existent drm_edid_eq().

v2:
- rename drm_edid_eq to drm_edid_eq_buf (jani)
- add NULL checks (jani)

Co-developed-by: Rodrigo Siqueira <siqueira@igalia.com>
Signed-off-by: Rodrigo Siqueira <siqueira@igalia.com>
Signed-off-by: Melissa Wen <mwen@igalia.com>
---
 drivers/gpu/drm/drm_edid.c | 24 +++++++++++++++++++++---
 include/drm/drm_edid.h     |  2 ++
 2 files changed, 23 insertions(+), 3 deletions(-)

diff --git a/drivers/gpu/drm/drm_edid.c b/drivers/gpu/drm/drm_edid.c
index 6e4cffd467f1..079042ccbc41 100644
--- a/drivers/gpu/drm/drm_edid.c
+++ b/drivers/gpu/drm/drm_edid.c
@@ -1820,8 +1820,8 @@ static bool edid_block_is_zero(const void *edid)
 	return mem_is_zero(edid, EDID_LENGTH);
 }
 
-static bool drm_edid_eq(const struct drm_edid *drm_edid,
-			const void *raw_edid, size_t raw_edid_size)
+static bool drm_edid_eq_buf(const struct drm_edid *drm_edid,
+			    const void *raw_edid, size_t raw_edid_size)
 {
 	bool edid1_present = drm_edid && drm_edid->edid && drm_edid->size;
 	bool edid2_present = raw_edid && raw_edid_size;
@@ -6918,7 +6918,7 @@ static int _drm_edid_connector_property_update(struct drm_connector *connector,
 		const void *old_edid = connector->edid_blob_ptr->data;
 		size_t old_edid_size = connector->edid_blob_ptr->length;
 
-		if (old_edid && !drm_edid_eq(drm_edid, old_edid, old_edid_size)) {
+		if (old_edid && !drm_edid_eq_buf(drm_edid, old_edid, old_edid_size)) {
 			connector->epoch_counter++;
 			drm_dbg_kms(dev, "[CONNECTOR:%d:%s] EDID changed, epoch counter %llu\n",
 				    connector->base.id, connector->name,
@@ -7523,3 +7523,21 @@ bool drm_edid_is_digital(const struct drm_edid *drm_edid)
 		drm_edid->edid->input & DRM_EDID_INPUT_DIGITAL;
 }
 EXPORT_SYMBOL(drm_edid_is_digital);
+
+/**
+ * drm_edid_edid_eq - Check if EDIDs are equal
+ *
+ * @drm_edid_old: old drm_edid to compare edid
+ * @drm_edid_new: new drm_edid to compare edid
+ *
+ * Return true if EDIDs are equal.
+ */
+bool drm_edid_eq(const struct drm_edid *drm_edid_1,
+		 const struct drm_edid *drm_edid_2)
+{
+	const void *edid_1 = drm_edid_1 ? drm_edid_1->edid : NULL;
+	size_t edid_1_size = drm_edid_1 ? drm_edid_1->size : 0;
+
+	return drm_edid_eq_buf(drm_edid_2, edid_1, edid_1_size);
+}
+EXPORT_SYMBOL(drm_edid_eq);
diff --git a/include/drm/drm_edid.h b/include/drm/drm_edid.h
index ceb522c4f4c2..c0e49c4a32e9 100644
--- a/include/drm/drm_edid.h
+++ b/include/drm/drm_edid.h
@@ -472,6 +472,8 @@ int drm_edid_connector_update(struct drm_connector *connector,
 			      const struct drm_edid *edid);
 int drm_edid_connector_add_modes(struct drm_connector *connector);
 bool drm_edid_is_digital(const struct drm_edid *drm_edid);
+bool drm_edid_eq(const struct drm_edid *drm_edid_first,
+			 const struct drm_edid *drm_edid_second);
 void drm_edid_get_product_id(const struct drm_edid *drm_edid,
 			     struct drm_edid_product_id *id);
 void drm_edid_print_product_id(struct drm_printer *p,
-- 
2.47.2

