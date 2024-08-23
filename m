Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 032EA95CEB6
	for <lists+dri-devel@lfdr.de>; Fri, 23 Aug 2024 16:03:57 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 6223A10EB0B;
	Fri, 23 Aug 2024 14:03:55 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (1024-bit key; unprotected) header.d=collabora.com header.i=derek.foreman@collabora.com header.b="fGnUGnuH";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from sender4-pp-f112.zoho.com (sender4-pp-f112.zoho.com
 [136.143.188.112])
 by gabe.freedesktop.org (Postfix) with ESMTPS id B133A10EB0B
 for <dri-devel@lists.freedesktop.org>; Fri, 23 Aug 2024 14:03:54 +0000 (UTC)
Delivered-To: kernel@collabora.com
ARC-Seal: i=1; a=rsa-sha256; t=1724421828; cv=none; 
 d=zohomail.com; s=zohoarc; 
 b=Lgbd7TWElCTiryd8Abu5bf4nAVRzvwbvu0m527C6zFTpTe/p7ccPSpnwb1/FvWl5wLY/u/n5U9LWMv0XLagUCdX4tNkpRLvGBz8IgB8yEByh2/VxuDChhSLF5wtj4Xm2H6so8bSwKDuIMVJ89OpCOLYUAXxGYwuQIBQT/dmYM80=
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=zohomail.com;
 s=zohoarc; t=1724421828;
 h=Content-Transfer-Encoding:Cc:Cc:Date:Date:From:From:MIME-Version:Message-ID:Subject:Subject:To:To:Message-Id:Reply-To;
 bh=37CeN0ICvs5L4be4WOC77B+hz/Rupy2ZbnKndUOz9jw=; 
 b=KSHDOIdyWvSlzHpZqRiENUhj1Gs1BS5HLaful/Xx6yp957sEWZF+0gRnUNqOU7Xe5YlSWkYWeYDaP2aiBFn/YwACq7bPUIT4jrS1Ty1TfI3V7kPj0TgauFjud6ZaPsN9NGWpatbxxLl8TNxzegjIv3pa59X1fIanbCwX14zHuJ4=
ARC-Authentication-Results: i=1; mx.zohomail.com;
 dkim=pass  header.i=collabora.com;
 spf=pass  smtp.mailfrom=derek.foreman@collabora.com;
 dmarc=pass header.from=<derek.foreman@collabora.com>
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; t=1724421828; 
 s=zohomail; d=collabora.com; i=derek.foreman@collabora.com;
 h=From:From:To:To:Cc:Cc:Subject:Subject:Date:Date:Message-ID:MIME-Version:Content-Transfer-Encoding:Message-Id:Reply-To;
 bh=37CeN0ICvs5L4be4WOC77B+hz/Rupy2ZbnKndUOz9jw=;
 b=fGnUGnuHYvZ3hkg6JC3YkCW8HS6p4aXsk5faxV5qSDwTgZ5ZyageJxCih8J3zwCb
 KREcDkl3lB475qQVMBLLwrT2qPJRMLmhPYOqUl/K4HLMrbGQIdvcWKwbaIxefjUfGTS
 OK82ED9WnrtMs8p40J0k8YTS/MVjNSX5P7v93RLg=
Received: by mx.zohomail.com with SMTPS id 1724421827746867.6932800558988;
 Fri, 23 Aug 2024 07:03:47 -0700 (PDT)
From: Derek Foreman <derek.foreman@collabora.com>
To: dri-devel@lists.freedesktop.org
Cc: Maxime Ripard <mripard@kernel.org>, kernel@collabora.com,
 Derek Foreman <derek.foreman@collabora.com>
Subject: [PATCH] drm/connector: hdmi: Increase HDMI_MAX_INFOFRAME_SIZE to 30
Date: Fri, 23 Aug 2024 09:03:08 -0500
Message-ID: <20240823140308.384988-1-derek.foreman@collabora.com>
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

The DRM infoframe is 26 bytes, with a 4 byte header this gives us 30. The
current limit of 29 prevents us from writing DRM infoframes.

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

