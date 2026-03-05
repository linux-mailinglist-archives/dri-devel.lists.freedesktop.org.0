Return-Path: <dri-devel-bounces@lists.freedesktop.org>
Delivered-To: lists+dri-devel@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id UNQiJ3x6qWl77wAAu9opvQ
	(envelope-from <dri-devel-bounces@lists.freedesktop.org>)
	for <lists+dri-devel@lfdr.de>; Thu, 05 Mar 2026 13:43:40 +0100
X-Original-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 4BAEB211E76
	for <lists+dri-devel@lfdr.de>; Thu, 05 Mar 2026 13:43:40 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id BC59310EB0B;
	Thu,  5 Mar 2026 12:43:34 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=collabora.com header.i=@collabora.com header.b="DVI+mIR5";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from bali.collaboradmins.com (bali.collaboradmins.com
 [148.251.105.195])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 98ADB10EAED
 for <dri-devel@lists.freedesktop.org>; Thu,  5 Mar 2026 12:43:31 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=collabora.com;
 s=mail; t=1772714610;
 bh=iddwyCslhRMrVDBtQA10/VGuWIWtjMFGaNW5lRmSjug=;
 h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
 b=DVI+mIR55jZ1sR4nMUgZY1QLED/sh9K7V91O0DL0iAtxik7miw/343uAfAPak+zXo
 X6SyledFAbVP6OhD0r6jV2g0y7OqzFDSk9jdg4My8nQq8WrEqwttG2nk5jDykyNBQp
 zK5Es5YOxcYoBChdz0LT4RfNba1Mdu7VL4WZ44QUYzA+SHejl/7a5YuC8TFHEd+n1z
 ecQJ/OTxVfbHJYdyM6kvdbXY+Ev62bB5fNM9iAMi2FpkamnZ7R0ZbJOorWuhaD+iZA
 KYVnjyki3h+ZoSx2yRPUx2mGNjZ+jCflehlkT7GVDE+tkjLhlkxAYB5mWcMLBsOuMM
 LVy3Y6MEBlbrg==
Received: from fedora (unknown [IPv6:2a01:e0a:2c:6930:a2a7:f53:ebb0:945e])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
 (No client certificate requested) (Authenticated sender: bbrezillon)
 by bali.collaboradmins.com (Postfix) with ESMTPSA id 9D19817E04D6;
 Thu,  5 Mar 2026 13:43:29 +0100 (CET)
From: Boris Brezillon <boris.brezillon@collabora.com>
To: Boris Brezillon <boris.brezillon@collabora.com>,
 Steven Price <steven.price@arm.com>, Liviu Dudau <liviu.dudau@arm.com>,
 =?UTF-8?q?Adri=C3=A1n=20Larumbe?= <adrian.larumbe@collabora.com>
Cc: dri-devel@lists.freedesktop.org, David Airlie <airlied@gmail.com>,
 Simona Vetter <simona@ffwll.ch>, Akash Goel <akash.goel@arm.com>,
 Rob Clark <robin.clark@oss.qualcomm.com>, Sean Paul <sean@poorly.run>,
 Konrad Dybcio <konradybcio@kernel.org>,
 Akhil P Oommen <akhilpo@oss.qualcomm.com>,
 Maarten Lankhorst <maarten.lankhorst@linux.intel.com>,
 Maxime Ripard <mripard@kernel.org>,
 Thomas Zimmermann <tzimmermann@suse.de>,
 Dmitry Osipenko <dmitry.osipenko@collabora.com>,
 Chris Diamand <chris.diamand@arm.com>, Danilo Krummrich <dakr@kernel.org>,
 Matthew Brost <matthew.brost@intel.com>,
 =?UTF-8?q?Thomas=20Hellstr=C3=B6m?= <thomas.hellstrom@linux.intel.com>,
 Alice Ryhl <aliceryhl@google.com>, Chia-I Wu <olvaffe@gmail.com>,
 kernel@collabora.com
Subject: [PATCH v4 2/9] drm/panthor: Move panthor_gems_debugfs_init() to
 panthor_gem.c
Date: Thu,  5 Mar 2026 13:43:13 +0100
Message-ID: <20260305124320.156606-3-boris.brezillon@collabora.com>
X-Mailer: git-send-email 2.53.0
In-Reply-To: <20260305124320.156606-1-boris.brezillon@collabora.com>
References: <20260305124320.156606-1-boris.brezillon@collabora.com>
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
X-Rspamd-Queue-Id: 4BAEB211E76
X-Rspamd-Server: lfdr
X-Spamd-Result: default: False [0.19 / 15.00];
	MID_CONTAINS_FROM(1.00)[];
	R_MISSING_CHARSET(0.50)[];
	DMARC_POLICY_ALLOW(-0.50)[collabora.com,none];
	MAILLIST(-0.20)[mailman];
	R_DKIM_ALLOW(-0.20)[collabora.com:s=mail];
	R_SPF_ALLOW(-0.20)[+ip4:131.252.210.177:c];
	RWL_MAILSPIKE_GOOD(-0.10)[131.252.210.177:from];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	RCVD_TLS_LAST(0.00)[];
	FREEMAIL_CC(0.00)[lists.freedesktop.org,gmail.com,ffwll.ch,arm.com,oss.qualcomm.com,poorly.run,kernel.org,linux.intel.com,suse.de,collabora.com,intel.com,google.com];
	RCVD_COUNT_THREE(0.00)[3];
	FORGED_RECIPIENTS(0.00)[m:boris.brezillon@collabora.com,m:steven.price@arm.com,m:liviu.dudau@arm.com,m:adrian.larumbe@collabora.com,m:airlied@gmail.com,m:simona@ffwll.ch,m:akash.goel@arm.com,m:robin.clark@oss.qualcomm.com,m:sean@poorly.run,m:konradybcio@kernel.org,m:akhilpo@oss.qualcomm.com,m:maarten.lankhorst@linux.intel.com,m:mripard@kernel.org,m:tzimmermann@suse.de,m:dmitry.osipenko@collabora.com,m:chris.diamand@arm.com,m:dakr@kernel.org,m:matthew.brost@intel.com,m:thomas.hellstrom@linux.intel.com,m:aliceryhl@google.com,m:olvaffe@gmail.com,m:kernel@collabora.com,s:lists@lfdr.de];
	RCPT_COUNT_TWELVE(0.00)[23];
	MIME_TRACE(0.00)[0:+];
	ARC_NA(0.00)[];
	FORGED_SENDER(0.00)[boris.brezillon@collabora.com,dri-devel-bounces@lists.freedesktop.org];
	FORWARDED(0.00)[dri-devel@lists.freedesktop.org];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	TO_DN_SOME(0.00)[];
	FORGED_SENDER_FORWARDING(0.00)[];
	FORGED_SENDER_MAILLIST(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[boris.brezillon@collabora.com,dri-devel-bounces@lists.freedesktop.org];
	FROM_HAS_DN(0.00)[];
	DKIM_TRACE(0.00)[collabora.com:+];
	PREVIOUSLY_DELIVERED(0.00)[dri-devel@lists.freedesktop.org];
	FORGED_RECIPIENTS_FORWARDING(0.00)[];
	ASN(0.00)[asn:6366, ipnet:131.252.0.0/16, country:US];
	NEURAL_HAM(-0.00)[-1.000];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	TAGGED_RCPT(0.00)[dri-devel];
	DBL_BLOCKED_OPENRESOLVER(0.00)[gabe.freedesktop.org:rdns,gabe.freedesktop.org:helo,collabora.com:dkim,collabora.com:email,collabora.com:mid,arm.com:email]
X-Rspamd-Action: no action

There's no reason for panthor_drv to know about panthor_gem.c internals,
so let's move the GEM debugfs init logic to panthor_gem.c.

v2:
- Collect R-bs

v3:
-No changes

v4:
- No changes

Signed-off-by: Boris Brezillon <boris.brezillon@collabora.com>
Reviewed-by: Liviu Dudau <liviu.dudau@arm.com>
Reviewed-by: Steven Price <steven.price@arm.com>
---
 drivers/gpu/drm/panthor/panthor_drv.c | 26 +-----------------------
 drivers/gpu/drm/panthor/panthor_gem.c | 29 +++++++++++++++++++++++++--
 drivers/gpu/drm/panthor/panthor_gem.h |  3 +--
 3 files changed, 29 insertions(+), 29 deletions(-)

diff --git a/drivers/gpu/drm/panthor/panthor_drv.c b/drivers/gpu/drm/panthor/panthor_drv.c
index 1bcec6a2e3e0..c77190bb357c 100644
--- a/drivers/gpu/drm/panthor/panthor_drv.c
+++ b/drivers/gpu/drm/panthor/panthor_drv.c
@@ -1635,34 +1635,10 @@ static const struct file_operations panthor_drm_driver_fops = {
 };
 
 #ifdef CONFIG_DEBUG_FS
-static int panthor_gems_show(struct seq_file *m, void *data)
-{
-	struct drm_info_node *node = m->private;
-	struct drm_device *dev = node->minor->dev;
-	struct panthor_device *ptdev = container_of(dev, struct panthor_device, base);
-
-	panthor_gem_debugfs_print_bos(ptdev, m);
-
-	return 0;
-}
-
-static struct drm_info_list panthor_debugfs_list[] = {
-	{"gems", panthor_gems_show, 0, NULL},
-};
-
-static int panthor_gems_debugfs_init(struct drm_minor *minor)
-{
-	drm_debugfs_create_files(panthor_debugfs_list,
-				 ARRAY_SIZE(panthor_debugfs_list),
-				 minor->debugfs_root, minor);
-
-	return 0;
-}
-
 static void panthor_debugfs_init(struct drm_minor *minor)
 {
 	panthor_mmu_debugfs_init(minor);
-	panthor_gems_debugfs_init(minor);
+	panthor_gem_debugfs_init(minor);
 }
 #endif
 
diff --git a/drivers/gpu/drm/panthor/panthor_gem.c b/drivers/gpu/drm/panthor/panthor_gem.c
index 6d14b0269574..c7b8b84a8f8b 100644
--- a/drivers/gpu/drm/panthor/panthor_gem.c
+++ b/drivers/gpu/drm/panthor/panthor_gem.c
@@ -9,6 +9,8 @@
 #include <linux/err.h>
 #include <linux/slab.h>
 
+#include <drm/drm_debugfs.h>
+#include <drm/drm_file.h>
 #include <drm/drm_print.h>
 #include <drm/panthor_drm.h>
 
@@ -683,8 +685,8 @@ static void panthor_gem_debugfs_bo_print(struct panthor_gem_object *bo,
 		totals->reclaimable += resident_size;
 }
 
-void panthor_gem_debugfs_print_bos(struct panthor_device *ptdev,
-				   struct seq_file *m)
+static void panthor_gem_debugfs_print_bos(struct panthor_device *ptdev,
+					  struct seq_file *m)
 {
 	struct gem_size_totals totals = {0};
 	struct panthor_gem_object *bo;
@@ -704,4 +706,27 @@ void panthor_gem_debugfs_print_bos(struct panthor_device *ptdev,
 	seq_printf(m, "Total size: %zd, Total resident: %zd, Total reclaimable: %zd\n",
 		   totals.size, totals.resident, totals.reclaimable);
 }
+
+static int panthor_gem_show_bos(struct seq_file *m, void *data)
+{
+	struct drm_info_node *node = m->private;
+	struct drm_device *dev = node->minor->dev;
+	struct panthor_device *ptdev =
+		container_of(dev, struct panthor_device, base);
+
+	panthor_gem_debugfs_print_bos(ptdev, m);
+
+	return 0;
+}
+
+static struct drm_info_list panthor_gem_debugfs_list[] = {
+	{ "gems", panthor_gem_show_bos, 0, NULL },
+};
+
+void panthor_gem_debugfs_init(struct drm_minor *minor)
+{
+	drm_debugfs_create_files(panthor_gem_debugfs_list,
+				 ARRAY_SIZE(panthor_gem_debugfs_list),
+				 minor->debugfs_root, minor);
+}
 #endif
diff --git a/drivers/gpu/drm/panthor/panthor_gem.h b/drivers/gpu/drm/panthor/panthor_gem.h
index 22519c570b5a..94b2d17cf032 100644
--- a/drivers/gpu/drm/panthor/panthor_gem.h
+++ b/drivers/gpu/drm/panthor/panthor_gem.h
@@ -203,8 +203,7 @@ panthor_kernel_bo_create(struct panthor_device *ptdev, struct panthor_vm *vm,
 void panthor_kernel_bo_destroy(struct panthor_kernel_bo *bo);
 
 #ifdef CONFIG_DEBUG_FS
-void panthor_gem_debugfs_print_bos(struct panthor_device *pfdev,
-				   struct seq_file *m);
+void panthor_gem_debugfs_init(struct drm_minor *minor);
 #endif
 
 #endif /* __PANTHOR_GEM_H__ */
-- 
2.53.0

