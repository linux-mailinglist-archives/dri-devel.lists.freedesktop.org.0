Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 50487634442
	for <lists+dri-devel@lfdr.de>; Tue, 22 Nov 2022 20:05:28 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 10D8810E44B;
	Tue, 22 Nov 2022 19:05:25 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from fanzine2.igalia.com (fanzine2.igalia.com [213.97.179.56])
 by gabe.freedesktop.org (Postfix) with ESMTPS id C00C610E449
 for <dri-devel@lists.freedesktop.org>; Tue, 22 Nov 2022 19:05:07 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=igalia.com; 
 s=20170329;
 h=Content-Transfer-Encoding:Content-Type:MIME-Version:References:
 In-Reply-To:Message-Id:Date:Subject:Cc:To:From:Sender:Reply-To:Content-ID:
 Content-Description:Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc
 :Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:List-Subscribe:
 List-Post:List-Owner:List-Archive;
 bh=TG1xpqHfdwRk7lbJjh3WdyMI9E3juJpQZYPXiE72gtY=; b=m6MkMiW5+UuvKm78vy4V2mYh2t
 pAfnBOgdG+4SC0OhzrliiB90lvyK15F0nK5XFCLJSlJ8WdrqOrrtra0KhMlyk3n2kCSZBlnvKP1x0
 n3Z83ZEFC7cv076EQ89octdZP0Bcd/hJ0m8F7pTg2MofGDFZRWY83u6gTbGdOmnPIAcgOxxhetKUE
 9Qilqtl3/JtQknt7o0uNoJRjq5JOtcqZfRjL+F9KPOdxmWIAybs6cNWE9bLimGqQEv/a7j2E8GRLK
 lTL/I2iDvBHzPUUmbGJJsV9KxHq8gKtuqo1gSeMDKKdvw1sLKu51nuk0LPr8J8vhw+VidlARF9mUh
 zvHliwjg==;
Received: from [177.34.169.227] (helo=bowie..)
 by fanzine2.igalia.com with esmtpsa 
 (Cipher TLS1.3:ECDHE_X25519__RSA_PSS_RSAE_SHA256__AES_256_GCM:256) (Exim)
 id 1oxYZn-007AP3-I5; Tue, 22 Nov 2022 20:05:00 +0100
From: =?UTF-8?q?Ma=C3=ADra=20Canal?= <mcanal@igalia.com>
To: Maarten Lankhorst <maarten.lankhorst@linux.intel.com>,
 Maxime Ripard <mripard@kernel.org>,
 Thomas Zimmermann <tzimmermann@suse.de>, David Airlie <airlied@gmail.com>,
 Daniel Vetter <daniel@ffwll.ch>, Oded Gabbay <ogabbay@kernel.org>
Subject: [PATCH 4/6] drm/v3d: use new debugfs device-centered functions
Date: Tue, 22 Nov 2022 16:03:12 -0300
Message-Id: <20221122190314.185015-5-mcanal@igalia.com>
X-Mailer: git-send-email 2.38.1
In-Reply-To: <20221122190314.185015-1-mcanal@igalia.com>
References: <20221122190314.185015-1-mcanal@igalia.com>
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
Cc: =?UTF-8?q?Andr=C3=A9=20Almeida?= <andrealmeid@igalia.com>,
 Emma Anholt <emma@anholt.net>,
 Rodrigo Siqueira <rodrigosiqueiramelo@gmail.com>,
 =?UTF-8?q?Ma=C3=ADra=20Canal?= <mcanal@igalia.com>,
 linux-kernel@vger.kernel.org, dri-devel@lists.freedesktop.org,
 Wambui Karuga <wambui@karuga.org>, Melissa Wen <mwen@igalia.com>
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

Replace the use of drm_debugfs_create_files() with the new
drm_debugfs_add_files() function, which centers the debugfs files
management on the drm_device instead of drm_minor.

Signed-off-by: Maíra Canal <mcanal@igalia.com>
---
 drivers/gpu/drm/v3d/v3d_debugfs.c | 22 ++++++++++------------
 1 file changed, 10 insertions(+), 12 deletions(-)

diff --git a/drivers/gpu/drm/v3d/v3d_debugfs.c b/drivers/gpu/drm/v3d/v3d_debugfs.c
index efbde124c296..330669f51fa7 100644
--- a/drivers/gpu/drm/v3d/v3d_debugfs.c
+++ b/drivers/gpu/drm/v3d/v3d_debugfs.c
@@ -79,8 +79,8 @@ static const struct v3d_reg_def v3d_csd_reg_defs[] = {
 
 static int v3d_v3d_debugfs_regs(struct seq_file *m, void *unused)
 {
-	struct drm_info_node *node = (struct drm_info_node *)m->private;
-	struct drm_device *dev = node->minor->dev;
+	struct drm_debugfs_entry *entry = m->private;
+	struct drm_device *dev = entry->dev;
 	struct v3d_dev *v3d = to_v3d_dev(dev);
 	int i, core;
 
@@ -126,8 +126,8 @@ static int v3d_v3d_debugfs_regs(struct seq_file *m, void *unused)
 
 static int v3d_v3d_debugfs_ident(struct seq_file *m, void *unused)
 {
-	struct drm_info_node *node = (struct drm_info_node *)m->private;
-	struct drm_device *dev = node->minor->dev;
+	struct drm_debugfs_entry *entry = m->private;
+	struct drm_device *dev = entry->dev;
 	struct v3d_dev *v3d = to_v3d_dev(dev);
 	u32 ident0, ident1, ident2, ident3, cores;
 	int core;
@@ -188,8 +188,8 @@ static int v3d_v3d_debugfs_ident(struct seq_file *m, void *unused)
 
 static int v3d_debugfs_bo_stats(struct seq_file *m, void *unused)
 {
-	struct drm_info_node *node = (struct drm_info_node *)m->private;
-	struct drm_device *dev = node->minor->dev;
+	struct drm_debugfs_entry *entry = m->private;
+	struct drm_device *dev = entry->dev;
 	struct v3d_dev *v3d = to_v3d_dev(dev);
 
 	mutex_lock(&v3d->bo_lock);
@@ -204,8 +204,8 @@ static int v3d_debugfs_bo_stats(struct seq_file *m, void *unused)
 
 static int v3d_measure_clock(struct seq_file *m, void *unused)
 {
-	struct drm_info_node *node = (struct drm_info_node *)m->private;
-	struct drm_device *dev = node->minor->dev;
+	struct drm_debugfs_entry *entry = m->private;
+	struct drm_device *dev = entry->dev;
 	struct v3d_dev *v3d = to_v3d_dev(dev);
 	uint32_t cycles;
 	int core = 0;
@@ -236,7 +236,7 @@ static int v3d_measure_clock(struct seq_file *m, void *unused)
 	return 0;
 }
 
-static const struct drm_info_list v3d_debugfs_list[] = {
+static const struct drm_debugfs_info v3d_debugfs_list[] = {
 	{"v3d_ident", v3d_v3d_debugfs_ident, 0},
 	{"v3d_regs", v3d_v3d_debugfs_regs, 0},
 	{"measure_clock", v3d_measure_clock, 0},
@@ -246,7 +246,5 @@ static const struct drm_info_list v3d_debugfs_list[] = {
 void
 v3d_debugfs_init(struct drm_minor *minor)
 {
-	drm_debugfs_create_files(v3d_debugfs_list,
-				 ARRAY_SIZE(v3d_debugfs_list),
-				 minor->debugfs_root, minor);
+	drm_debugfs_add_files(minor->dev, v3d_debugfs_list, ARRAY_SIZE(v3d_debugfs_list));
 }
-- 
2.38.1

