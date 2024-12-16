Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 43CCA9F2F73
	for <lists+dri-devel@lfdr.de>; Mon, 16 Dec 2024 12:34:55 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id E783610E5BE;
	Mon, 16 Dec 2024 11:34:52 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (1024-bit key; unprotected) header.d=weissschuh.net header.i=@weissschuh.net header.b="N5W6GuU5";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from todd.t-8ch.de (todd.t-8ch.de [IPv6:2a01:4f8:c010:41de::1])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 3F54810E5AD
 for <dri-devel@lists.freedesktop.org>; Mon, 16 Dec 2024 11:34:52 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=weissschuh.net;
 s=mail; t=1734348890;
 bh=1qtbMa2oIpffo9qrfeElmnz139mrppvwu3zsjT10qrM=;
 h=From:Date:Subject:References:In-Reply-To:To:Cc:From;
 b=N5W6GuU506HNT67hwXsBzcHmTOnA3z9T530lNzo6ZAFFjhK4OuxHW/hT28vPUXRUe
 HxFFqadWxwc4SPCpP6eFLmSoFTcMlA8bB15EBXUpbmR7cdcRtfIUouR+vVKt9Uw2e0
 Rea2lK1bB6x6zC30dJQ1M2KZpt3Bi2wn3c2giG7g=
From: =?utf-8?q?Thomas_Wei=C3=9Fschuh?= <linux@weissschuh.net>
Date: Mon, 16 Dec 2024 12:34:48 +0100
Subject: [PATCH 2/5] drm/lima: Constify 'struct bin_attribute'
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit
Message-Id: <20241216-sysfs-const-bin_attr-drm-v1-2-210f2b36b9bf@weissschuh.net>
References: <20241216-sysfs-const-bin_attr-drm-v1-0-210f2b36b9bf@weissschuh.net>
In-Reply-To: <20241216-sysfs-const-bin_attr-drm-v1-0-210f2b36b9bf@weissschuh.net>
To: Maarten Lankhorst <maarten.lankhorst@linux.intel.com>, 
 Maxime Ripard <mripard@kernel.org>, Thomas Zimmermann <tzimmermann@suse.de>, 
 David Airlie <airlied@gmail.com>, Simona Vetter <simona@ffwll.ch>, 
 Qiang Yu <yuq825@gmail.com>, Jani Nikula <jani.nikula@linux.intel.com>, 
 Joonas Lahtinen <joonas.lahtinen@linux.intel.com>, 
 Rodrigo Vivi <rodrigo.vivi@intel.com>, 
 Tvrtko Ursulin <tursulin@ursulin.net>, 
 Alex Deucher <alexander.deucher@amd.com>, 
 =?utf-8?q?Christian_K=C3=B6nig?= <christian.koenig@amd.com>, 
 Xinhui Pan <Xinhui.Pan@amd.com>, Harry Wentland <harry.wentland@amd.com>, 
 Leo Li <sunpeng.li@amd.com>, Rodrigo Siqueira <Rodrigo.Siqueira@amd.com>
Cc: dri-devel@lists.freedesktop.org, linux-kernel@vger.kernel.org, 
 lima@lists.freedesktop.org, intel-gfx@lists.freedesktop.org, 
 amd-gfx@lists.freedesktop.org, 
 =?utf-8?q?Thomas_Wei=C3=9Fschuh?= <linux@weissschuh.net>
X-Mailer: b4 0.14.2
X-Developer-Signature: v=1; a=ed25519-sha256; t=1734348889; l=1710;
 i=linux@weissschuh.net; s=20221212; h=from:subject:message-id;
 bh=1qtbMa2oIpffo9qrfeElmnz139mrppvwu3zsjT10qrM=;
 b=1WNI1ZkIE8rqLbERLmmdHNShe5o5cZbun/mqENhN73fwlitBkkCVqnSWtvKibM9ZtYm50iZQz
 jn1nSK2Tek2Du1yWr9Wxx1x0jCnSs6GepiyTnnI7BHf93+3qRL9WWgz
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

The sysfs core now allows instances of 'struct bin_attribute' to be
moved into read-only memory. Make use of that to protect them against
accidental or malicious modifications.

Signed-off-by: Thomas Weißschuh <linux@weissschuh.net>
---
 drivers/gpu/drm/lima/lima_drv.c | 8 ++++----
 1 file changed, 4 insertions(+), 4 deletions(-)

diff --git a/drivers/gpu/drm/lima/lima_drv.c b/drivers/gpu/drm/lima/lima_drv.c
index fb3062c872b317ef27cd321b2638944f8a5dc33a..b969bd3f28968304946c0bb629460e91622d5fbc 100644
--- a/drivers/gpu/drm/lima/lima_drv.c
+++ b/drivers/gpu/drm/lima/lima_drv.c
@@ -311,7 +311,7 @@ static bool lima_read_block(struct lima_block_reader *reader,
 }
 
 static ssize_t lima_error_state_read(struct file *filp, struct kobject *kobj,
-				     struct bin_attribute *attr, char *buf,
+				     const struct bin_attribute *attr, char *buf,
 				     loff_t off, size_t count)
 {
 	struct device *dev = kobj_to_dev(kobj);
@@ -337,7 +337,7 @@ static ssize_t lima_error_state_read(struct file *filp, struct kobject *kobj,
 }
 
 static ssize_t lima_error_state_write(struct file *file, struct kobject *kobj,
-				      struct bin_attribute *attr, char *buf,
+				      const struct bin_attribute *attr, char *buf,
 				      loff_t off, size_t count)
 {
 	struct device *dev = kobj_to_dev(kobj);
@@ -363,8 +363,8 @@ static const struct bin_attribute lima_error_state_attr = {
 	.attr.name = "error",
 	.attr.mode = 0600,
 	.size = 0,
-	.read = lima_error_state_read,
-	.write = lima_error_state_write,
+	.read_new = lima_error_state_read,
+	.write_new = lima_error_state_write,
 };
 
 static int lima_pdev_probe(struct platform_device *pdev)

-- 
2.47.1

