Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 13B32961439
	for <lists+dri-devel@lfdr.de>; Tue, 27 Aug 2024 18:39:38 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 8984110E38A;
	Tue, 27 Aug 2024 16:39:36 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (1024-bit key; unprotected) header.d=collabora.com header.i=derek.foreman@collabora.com header.b="BnGj81Zd";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from sender4-pp-f112.zoho.com (sender4-pp-f112.zoho.com
 [136.143.188.112])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 742D310E38A
 for <dri-devel@lists.freedesktop.org>; Tue, 27 Aug 2024 16:39:35 +0000 (UTC)
Delivered-To: kernel@collabora.com
ARC-Seal: i=1; a=rsa-sha256; t=1724776770; cv=none; 
 d=zohomail.com; s=zohoarc; 
 b=ms4VjhhhQLSp/cOdSmmB9m0GI2z2Mf38RQZ+jjR9wIVM11hoXjGCbE8su/J7DWcoH+Wu1Ed1HCpTOotLfbNXoQBnC+LWcFDht9il6kVk6WP19yysS5iQaIxdIKWSbjaYmBV1IVTJPN7w/AaAJJELwJ3m3iKkk8PSVEG4eZwrgpo=
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=zohomail.com;
 s=zohoarc; t=1724776770;
 h=Content-Transfer-Encoding:Cc:Cc:Date:Date:From:From:MIME-Version:Message-ID:Subject:Subject:To:To:Message-Id:Reply-To;
 bh=PysjLYYTobfjpCkNvp5rpF4+UHOJO/yIh0Yk4ecR/F0=; 
 b=dsJGXNF7ZW4tI6Vu3PJCNWihoVvhK9Jqjn5CNYb+HwWOQbMkuufc7RULJ9U9vFfS4dOh5TOsrFe5XzXggvrHRrQ4MUTpaXXRzcPNWAx0B29PJPFCPM/ey0Xf4a+ola3G7bka0s+bTe4Tr4uzQGguYGqyLvbk6vs6JOQtsdSI18c=
ARC-Authentication-Results: i=1; mx.zohomail.com;
 dkim=pass  header.i=collabora.com;
 spf=pass  smtp.mailfrom=derek.foreman@collabora.com;
 dmarc=pass header.from=<derek.foreman@collabora.com>
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; t=1724776770; 
 s=zohomail; d=collabora.com; i=derek.foreman@collabora.com;
 h=From:From:To:To:Cc:Cc:Subject:Subject:Date:Date:Message-ID:MIME-Version:Content-Transfer-Encoding:Message-Id:Reply-To;
 bh=PysjLYYTobfjpCkNvp5rpF4+UHOJO/yIh0Yk4ecR/F0=;
 b=BnGj81Zd1mDeGLMYPor5iRYrWmA50jHjHGhNHtswin7e6FAgFPA/ODbaT2Lqw+Ew
 BKDMC7fnqNF8CQYhPC1Ef2ql6NGFpAJ7jh4+Sms2xrZwx/ibU+mGfpCfXeV5BHJ4zwZ
 hhKsLZOny9xwac0oFrfLuWMs3vFjVfRMOvTuJ5Ms=
Received: by mx.zohomail.com with SMTPS id 1724776769491557.6911820771234;
 Tue, 27 Aug 2024 09:39:29 -0700 (PDT)
From: Derek Foreman <derek.foreman@collabora.com>
To: dri-devel@lists.freedesktop.org
Cc: Maxime Ripard <mripard@kernel.org>, kernel@collabora.com,
 Jani Nikula <jani.nikula@linux.intel.com>, Helge Deller <deller@gmx.de>,
 linux-fbdev@vger.kernel.org, Derek Foreman <derek.foreman@collabora.com>
Subject: [PATCH v4] drm/connector: hdmi: Fix writing Dynamic Range Mastering
 infoframes
Date: Tue, 27 Aug 2024 11:39:04 -0500
Message-ID: <20240827163918.48160-1-derek.foreman@collabora.com>
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
MAX 27 bytes - which is defined by the HDMI specification to be the
largest infoframe payload.

Fixes: f378b77227bc ("drm/connector: hdmi: Add Infoframes generation")
Fixes: c602e4959a0c ("drm/connector: hdmi: Create Infoframe DebugFS entries")

Signed-off-by: Derek Foreman <derek.foreman@collabora.com>
---
 drivers/gpu/drm/display/drm_hdmi_state_helper.c | 4 +---
 drivers/gpu/drm/drm_debugfs.c                   | 4 +---
 include/linux/hdmi.h                            | 9 +++++++++
 3 files changed, 11 insertions(+), 6 deletions(-)

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
index 3bb87bf6bc65..455f855bc084 100644
--- a/include/linux/hdmi.h
+++ b/include/linux/hdmi.h
@@ -59,6 +59,15 @@ enum hdmi_infoframe_type {
 #define HDMI_DRM_INFOFRAME_SIZE    26
 #define HDMI_VENDOR_INFOFRAME_SIZE  4
 
+/*
+ * HDMI 1.3a table 5-14 states that the largest InfoFrame_length is 27,
+ * not including the packet header or checksum byte. We include the
+ * checksum byte in HDMI_INFOFRAME_HEADER_SIZE, so this should allow
+ * HDMI_INFOFRAME_SIZE(MAX) to be the largest buffer we could ever need
+ * for any HDMI infoframe.
+ */
+#define HDMI_MAX_INFOFRAME_SIZE    27
+
 #define HDMI_INFOFRAME_SIZE(type)	\
 	(HDMI_INFOFRAME_HEADER_SIZE + HDMI_ ## type ## _INFOFRAME_SIZE)
 
-- 
2.45.2

