Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 2D73195F0BE
	for <lists+dri-devel@lfdr.de>; Mon, 26 Aug 2024 14:10:49 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 0A34E10E1A6;
	Mon, 26 Aug 2024 12:10:47 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (1024-bit key; unprotected) header.d=collabora.com header.i=derek.foreman@collabora.com header.b="aRMxw+21";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from sender4-pp-f112.zoho.com (sender4-pp-f112.zoho.com
 [136.143.188.112])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 070D910E1F1
 for <dri-devel@lists.freedesktop.org>; Mon, 26 Aug 2024 12:10:46 +0000 (UTC)
Delivered-To: kernel@collabora.com
ARC-Seal: i=1; a=rsa-sha256; t=1724674241; cv=none; 
 d=zohomail.com; s=zohoarc; 
 b=EAUsKNyqKov3bWO2Y4vrCOp3EuI2TGWFfJeUizNLEh6Q8jB9N4UumLPRB1+5/Vb5sMqwRe6YTd97QZaGGntv6zTQZBbuT8dZJAfVmAixGjt6IejBRWHjM0g4TLkcOR5VkmUHEdEV1LQ/HSperL/woHE6oakoNSyrBtjQhC4dZMk=
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=zohomail.com;
 s=zohoarc; t=1724674241;
 h=Content-Transfer-Encoding:Cc:Cc:Date:Date:From:From:MIME-Version:Message-ID:Subject:Subject:To:To:Message-Id:Reply-To;
 bh=pODErlrOUASEjJfWNMDWaePCRUBu3A2ZbDFOcTvotKU=; 
 b=RVSD9EV1wpSGdsYSND1wsYLWJjXMGLGnJsVrFuqNF2GXom/xWeYw1W09hSRbREGZw0r2nies7XI6QsSDb3ReHYz+xZYbcZI5lycug272Syl1Xt1XUCuTgZYYNtzr7hYx7DocvPq46qU4qAFCVpbgg2gO3kLUhPjLCfY94Zp8S4U=
ARC-Authentication-Results: i=1; mx.zohomail.com;
 dkim=pass  header.i=collabora.com;
 spf=pass  smtp.mailfrom=derek.foreman@collabora.com;
 dmarc=pass header.from=<derek.foreman@collabora.com>
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; t=1724674241; 
 s=zohomail; d=collabora.com; i=derek.foreman@collabora.com;
 h=From:From:To:To:Cc:Cc:Subject:Subject:Date:Date:Message-ID:MIME-Version:Content-Transfer-Encoding:Message-Id:Reply-To;
 bh=pODErlrOUASEjJfWNMDWaePCRUBu3A2ZbDFOcTvotKU=;
 b=aRMxw+21OIClJOS3jQg24FUSwtTPRMgy/ZFnyOVirvM0cPltK5pzxRTGrJjyP614
 VI57XzY4JHhADwFvKJpoUvpuixsdIZhmRWUaX7s3BDLIc/oBaDTyAWwVt5A+QVKCK2O
 IT8Cmgq2EzHnznSAxfVU7ECfls+oQN84CQsrh0lU=
Received: by mx.zohomail.com with SMTPS id 1724674240232641.1359051986846;
 Mon, 26 Aug 2024 05:10:40 -0700 (PDT)
From: Derek Foreman <derek.foreman@collabora.com>
To: dri-devel@lists.freedesktop.org
Cc: Maxime Ripard <mripard@kernel.org>, kernel@collabora.com,
 Jani Nikula <jani.nikula@linux.intel.com>,
 Derek Foreman <derek.foreman@collabora.com>
Subject: [PATCH v3] drm/connector: hdmi: Fix writing Dynamic Range Mastering
 infoframes
Date: Mon, 26 Aug 2024 07:10:11 -0500
Message-ID: <20240826121029.491976-1-derek.foreman@collabora.com>
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

Instead of having HDMI_MAX_INFOFRAME_SIZE defined in two places,
replace HDMI_MAX_INFOFRAME_SIZE with HDMI_INFOFRAME_SIZE(MAX) and make
MAX the same size as the DRM infoframe.

Signed-off-by: Derek Foreman <derek.foreman@collabora.com>
---
 drivers/gpu/drm/display/drm_hdmi_state_helper.c | 4 +---
 drivers/gpu/drm/drm_debugfs.c                   | 4 +---
 include/linux/hdmi.h                            | 3 +++
 3 files changed, 5 insertions(+), 6 deletions(-)

diff --git a/drivers/gpu/drm/display/drm_hdmi_state_helper.c b/drivers/gpu/drm/display/drm_hdmi_state_helper.c
index 7854820089ec..feb7a3a75981 100644
--- a/drivers/gpu/drm/display/drm_hdmi_state_helper.c
+++ b/drivers/gpu/drm/display/drm_hdmi_state_helper.c
@@ -521,8 +521,6 @@ int drm_atomic_helper_connector_hdmi_check(struct drm_connector *connector,
 }
 EXPORT_SYMBOL(drm_atomic_helper_connector_hdmi_check);
 
-#define HDMI_MAX_INFOFRAME_SIZE		29
-
 static int clear_device_infoframe(struct drm_connector *connector,
 				  enum hdmi_infoframe_type type)
 {
@@ -563,7 +561,7 @@ static int write_device_infoframe(struct drm_connector *connector,
 {
 	const struct drm_connector_hdmi_funcs *funcs = connector->hdmi.funcs;
 	struct drm_device *dev = connector->dev;
-	u8 buffer[HDMI_MAX_INFOFRAME_SIZE];
+	u8 buffer[HDMI_INFOFRAME_SIZE(MAX)];
 	int ret;
 	int len;
 
diff --git a/drivers/gpu/drm/drm_debugfs.c b/drivers/gpu/drm/drm_debugfs.c
index 6b239a24f1df..9d3e6dd68810 100644
--- a/drivers/gpu/drm/drm_debugfs.c
+++ b/drivers/gpu/drm/drm_debugfs.c
@@ -520,8 +520,6 @@ static const struct file_operations drm_connector_fops = {
 	.write = connector_write
 };
 
-#define HDMI_MAX_INFOFRAME_SIZE		29
-
 static ssize_t
 audio_infoframe_read(struct file *filp, char __user *ubuf, size_t count, loff_t *ppos)
 {
@@ -579,7 +577,7 @@ static ssize_t _f##_read_infoframe(struct file *filp, \
 	struct drm_connector *connector; \
 	union hdmi_infoframe *frame; \
 	struct drm_device *dev; \
-	u8 buf[HDMI_MAX_INFOFRAME_SIZE]; \
+	u8 buf[HDMI_INFOFRAME_SIZE(MAX)]; \
 	ssize_t len = 0; \
 	\
 	connector = filp->private_data; \
diff --git a/include/linux/hdmi.h b/include/linux/hdmi.h
index 3bb87bf6bc65..3a442a59919e 100644
--- a/include/linux/hdmi.h
+++ b/include/linux/hdmi.h
@@ -59,6 +59,9 @@ enum hdmi_infoframe_type {
 #define HDMI_DRM_INFOFRAME_SIZE    26
 #define HDMI_VENDOR_INFOFRAME_SIZE  4
 
+/* The biggest infoframe size */
+#define HDMI_MAX_INFOFRAME_SIZE		HDMI_DRM_INFOFRAME_SIZE
+
 #define HDMI_INFOFRAME_SIZE(type)	\
 	(HDMI_INFOFRAME_HEADER_SIZE + HDMI_ ## type ## _INFOFRAME_SIZE)
 
-- 
2.45.2

