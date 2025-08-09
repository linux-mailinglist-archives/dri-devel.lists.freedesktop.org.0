Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id C8EDBB20014
	for <lists+dri-devel@lfdr.de>; Mon, 11 Aug 2025 09:13:05 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id F277810E37A;
	Mon, 11 Aug 2025 07:12:57 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=listout.xyz header.i=@listout.xyz header.b="ALKSNHEQ";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mout-p-101.mailbox.org (mout-p-101.mailbox.org [80.241.56.151])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 90AB610E1DF
 for <dri-devel@lists.freedesktop.org>; Sat,  9 Aug 2025 12:55:13 +0000 (UTC)
Received: from smtp102.mailbox.org (smtp102.mailbox.org [10.196.197.102])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
 (No client certificate requested)
 by mout-p-101.mailbox.org (Postfix) with ESMTPS id 4bzgq22BtXz9syH;
 Sat,  9 Aug 2025 14:55:10 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=listout.xyz; s=MBO0001;
 t=1754744110;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:
 content-transfer-encoding:content-transfer-encoding;
 bh=q46Zx2RFVQHBDUuhL7yZ0QAx1YbsPYpQ8L8DATmnhcI=;
 b=ALKSNHEQlDZis9Wy/+VxKB/1CWmp9tp2k0i6OZFJo95Lc968aLZtVzZAoMvbYtyr+XkWLD
 70iBS1kTgE9LXirQxFxczD/btGCm/D3LiWlz929MbasBMrIb397Ich4XVYzEWNgHhaS00G
 WqlHJ8SkxD4DuYLn7Ylb84rMvm170YC6+wNkirdGcW8NudWDrUgROVLQljAWnTukFpwUR2
 0KnIEExrywbo5dgkUKAxk1Rp5LJHZJknE3VV31Q/n9ldLoH3O8wOK6YERtJY9mwiDYovce
 95YM6c0uLKwtEmft4E9XgXxmswNcRSItmugGXqOfarE5aFq8tWpRxmPkwDxFJg==
From: Brahmajit Das <listout@listout.xyz>
To: airlied@redhat.com, kraxel@redhat.com, dmitry.osipenko@collabora.com,
 gurchetansingh@chromium.org, olvaffe@gmail.com, simona@ffwll.ch
Cc: linux-next@vger.kernel.org, virtualization@lists.linux.dev,
 dri-devel@lists.freedesktop.org
Subject: [PATCH] drm/virtio: use new debugfs device-centered functions
Date: Sat,  9 Aug 2025 18:24:43 +0530
Message-ID: <20250809125443.4011734-1-listout@listout.xyz>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Mailman-Approved-At: Mon, 11 Aug 2025 07:12:55 +0000
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

Replace the use of drm_debugfs_create_files() with the new
drm_debugfs_add_files() function, which centers the debugfs files
management on the drm_device instead of drm_minor.

Signed-off-by: Brahmajit Das <listout@listout.xyz>
---
 drivers/gpu/drm/virtio/virtgpu_debugfs.c | 7 +++----
 1 file changed, 3 insertions(+), 4 deletions(-)

diff --git a/drivers/gpu/drm/virtio/virtgpu_debugfs.c b/drivers/gpu/drm/virtio/virtgpu_debugfs.c
index 853dd9aa397e..b7c895fe5ddc 100644
--- a/drivers/gpu/drm/virtio/virtgpu_debugfs.c
+++ b/drivers/gpu/drm/virtio/virtgpu_debugfs.c
@@ -94,7 +94,7 @@ virtio_gpu_debugfs_host_visible_mm(struct seq_file *m, void *data)
 	return 0;
 }
 
-static struct drm_info_list virtio_gpu_debugfs_list[] = {
+static struct drm_debugfs_info virtio_gpu_debugfs_list[] = {
 	{ "virtio-gpu-features", virtio_gpu_features },
 	{ "virtio-gpu-irq-fence", virtio_gpu_debugfs_irq_info, 0, NULL },
 	{ "virtio-gpu-host-visible-mm", virtio_gpu_debugfs_host_visible_mm },
@@ -105,7 +105,6 @@ static struct drm_info_list virtio_gpu_debugfs_list[] = {
 void
 virtio_gpu_debugfs_init(struct drm_minor *minor)
 {
-	drm_debugfs_create_files(virtio_gpu_debugfs_list,
-				 VIRTIO_GPU_DEBUGFS_ENTRIES,
-				 minor->debugfs_root, minor);
+	drm_debugfs_add_files(minor->dev, virtio_gpu_debugfs_list,
+			      VIRTIO_GPU_DEBUGFS_ENTRIES);
 }
-- 
2.50.1

