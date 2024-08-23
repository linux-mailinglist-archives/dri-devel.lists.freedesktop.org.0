Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id A8A3A95D3B4
	for <lists+dri-devel@lfdr.de>; Fri, 23 Aug 2024 18:46:40 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 6B16010EC83;
	Fri, 23 Aug 2024 16:46:38 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (1024-bit key; unprotected) header.d=collabora.com header.i=derek.foreman@collabora.com header.b="LiOvBnam";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from sender4-pp-f112.zoho.com (sender4-pp-f112.zoho.com
 [136.143.188.112])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 178E710EC83
 for <dri-devel@lists.freedesktop.org>; Fri, 23 Aug 2024 16:46:37 +0000 (UTC)
Delivered-To: kernel@collabora.com
ARC-Seal: i=1; a=rsa-sha256; t=1724431587; cv=none; 
 d=zohomail.com; s=zohoarc; 
 b=f3xaocYxR+V/8SoPe8/engp4s0U2nHiU3CE9WovzWSHpp2fuofwUxl+B5a50jke4fCJcTXjHbsaVrIG3Gvdg6ExtiGUrOwBtziXXPk0C2y7sWvPpkA0Puu4FVNIJPs9meZBSdIhqpv3IPN/ReYmWcprsSfmfv8dfOtqDH+QQRHM=
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=zohomail.com;
 s=zohoarc; t=1724431587;
 h=Content-Transfer-Encoding:Cc:Cc:Date:Date:From:From:MIME-Version:Message-ID:Subject:Subject:To:To:Message-Id:Reply-To;
 bh=2qLxNE3aVs6ZbxBaXE30HOxE4cu/X802VrItN4Wpxfo=; 
 b=Z0dY8Xj2N8rm4RTO5IyXpdEOgsfOCiU4C8pgZk+19fNcTFl6TLso2izchFIf0bfzzLllH4p2LSM81XDywhrTJq3RMDunk/HTsdVPk3xJZUKb2viFmbO0WB/QpA2jMsAdWbmGpYWyHW81iZHK1REHZ1sLWbLtv4RELYW1IhF2Eug=
ARC-Authentication-Results: i=1; mx.zohomail.com;
 dkim=pass  header.i=collabora.com;
 spf=pass  smtp.mailfrom=derek.foreman@collabora.com;
 dmarc=pass header.from=<derek.foreman@collabora.com>
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; t=1724431587; 
 s=zohomail; d=collabora.com; i=derek.foreman@collabora.com;
 h=From:From:To:To:Cc:Cc:Subject:Subject:Date:Date:Message-ID:MIME-Version:Content-Transfer-Encoding:Message-Id:Reply-To;
 bh=2qLxNE3aVs6ZbxBaXE30HOxE4cu/X802VrItN4Wpxfo=;
 b=LiOvBnamGNG6YmAhj+wok0Ze+L6oXpwlhqFRFdBu8F9rRXABdEGEHTQgnfhfNN5N
 r3f77hksJ5G5I77oHobry63A2lR8qQ7+e8hwsC2XEwJSeYYdkMRpU+otfy4AJsrWfC2
 GgSv0V9Un6r1xXxAgREeEengPzJEgBR/IUXEEimE=
Received: by mx.zohomail.com with SMTPS id 17244315842886.5106027280679655;
 Fri, 23 Aug 2024 09:46:24 -0700 (PDT)
From: Derek Foreman <derek.foreman@collabora.com>
To: dri-devel@lists.freedesktop.org
Cc: Maxime Ripard <mripard@kernel.org>, kernel@collabora.com,
 Jani Nikula <jani.nikula@linux.intel.com>,
 Derek Foreman <derek.foreman@collabora.com>
Subject: [PATCH v2] drm/connector: hdmi: Increase HDMI_MAX_INFOFRAME_SIZE to 30
Date: Fri, 23 Aug 2024 11:46:21 -0500
Message-ID: <20240823164621.385651-1-derek.foreman@collabora.com>
X-Mailer: git-send-email 2.45.2
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-ZohoMailClient: External
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

The largest infoframe we create is the DRM (Dynamic Range Mastering)
infoframe which is 26 bytes + a 4 byte header, for a total of 30
bytes.

With HDMI_MAX_INFOFRAME_SIZE set to 29 bytes, as it is now, we
allocate too little space to pack a DRM infoframe in
write_device_infoframe(), leading to an ENOSPC return from
hdmi_infoframe_pack(), and never calling the connector's
write_infoframe() vfunc.

Increase HDMI_MAX_INFOFRAME_SIZE to 30 so we can successfully
write DRM infoframes.

The drm_debugfs code is similarly updated.

Signed-off-by: Derek Foreman <derek.foreman@collabora.com>
---
 drivers/gpu/drm/display/drm_hdmi_state_helper.c | 2 +-
 drivers/gpu/drm/drm_debugfs.c                   | 2 +-
 2 files changed, 2 insertions(+), 2 deletions(-)

diff --git a/drivers/gpu/drm/display/drm_hdmi_state_helper.c b/drivers/gpu/drm/display/drm_hdmi_state_helper.c
index 7854820089ec..cc7747d33fdf 100644
--- a/drivers/gpu/drm/display/drm_hdmi_state_helper.c
+++ b/drivers/gpu/drm/display/drm_hdmi_state_helper.c
@@ -521,7 +521,7 @@ int drm_atomic_helper_connector_hdmi_check(struct drm_connector *connector,
 }
 EXPORT_SYMBOL(drm_atomic_helper_connector_hdmi_check);
 
-#define HDMI_MAX_INFOFRAME_SIZE		29
+#define HDMI_MAX_INFOFRAME_SIZE		30
 
 static int clear_device_infoframe(struct drm_connector *connector,
 				  enum hdmi_infoframe_type type)
diff --git a/drivers/gpu/drm/drm_debugfs.c b/drivers/gpu/drm/drm_debugfs.c
index 6b239a24f1df..3439fd65275a 100644
--- a/drivers/gpu/drm/drm_debugfs.c
+++ b/drivers/gpu/drm/drm_debugfs.c
@@ -520,7 +520,7 @@ static const struct file_operations drm_connector_fops = {
 	.write = connector_write
 };
 
-#define HDMI_MAX_INFOFRAME_SIZE		29
+#define HDMI_MAX_INFOFRAME_SIZE		30
 
 static ssize_t
 audio_infoframe_read(struct file *filp, char __user *ubuf, size_t count, loff_t *ppos)
-- 
2.45.2

