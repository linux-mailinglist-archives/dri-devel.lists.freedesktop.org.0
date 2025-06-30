Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 5D39FAEE968
	for <lists+dri-devel@lfdr.de>; Mon, 30 Jun 2025 23:21:39 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id AAF0C10E239;
	Mon, 30 Jun 2025 21:21:35 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (1024-bit key; unprotected) header.d=ispras.ru header.i=@ispras.ru header.b="OsY4xs8h";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail.ispras.ru (mail.ispras.ru [83.149.199.84])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 3EB0010E239
 for <dri-devel@lists.freedesktop.org>; Mon, 30 Jun 2025 21:21:35 +0000 (UTC)
Received: from fedora.intra.ispras.ru (unknown [10.10.165.24])
 by mail.ispras.ru (Postfix) with ESMTPSA id 2C19D407618E;
 Mon, 30 Jun 2025 21:21:33 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 mail.ispras.ru 2C19D407618E
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ispras.ru;
 s=default; t=1751318493;
 bh=2F3EogwDEnJvzuxBQjf9S7/RInXYPKivFjLuSHo7src=;
 h=From:To:Cc:Subject:Date:From;
 b=OsY4xs8h1hebKF3JZOF1/HL7iaxomDsxU5ZzMwq9dn7B9uRnlLa7WjfRturDZstoO
 aaiQujlHzl1075mQtDV6WTeJIyjCwvGPYBuc0oSYfYFE/gexMoZ8U819UqvviCzr8c
 gHY83VWQRNNxqgrhcQq6KP9H+3ozFty05hEypTIc=
From: Fedor Pchelkin <pchelkin@ispras.ru>
To: Zack Rusin <zack.rusin@broadcom.com>, Ian Forbes <ian.forbes@broadcom.com>
Cc: Fedor Pchelkin <pchelkin@ispras.ru>,
 Broadcom internal kernel review list <bcm-kernel-feedback-list@broadcom.com>, 
 Maarten Lankhorst <maarten.lankhorst@linux.intel.com>,
 Maxime Ripard <mripard@kernel.org>,
 Thomas Zimmermann <tzimmermann@suse.de>, dri-devel@lists.freedesktop.org,
 linux-kernel@vger.kernel.org, lvc-project@linuxtesting.org,
 stable@vger.kernel.org
Subject: [PATCH] drm/vmwgfx: handle allocation failure of waiter context
Date: Tue,  1 Jul 2025 00:19:47 +0300
Message-ID: <20250630211948.1556524-1-pchelkin@ispras.ru>
X-Mailer: git-send-email 2.50.0
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

Handle result of kmalloc() to prevent possible NULL pointer dereference.
For the sake of not introducing additional layer of indentation, extract
seqno_waiter_rm_context creating code into a separate helper function.

Judging by commit 0039a3b35b10 ("drm/vmwgfx: Add seqno waiter for
sync_files"), possible errors in seqno waiting aren't fatal, thus just
skip this block if an allocation failure occurs - no need to propagate
upwards.

Found by Linux Verification Center (linuxtesting.org) with Svace static
analysis tool.

Fixes: 0039a3b35b10 ("drm/vmwgfx: Add seqno waiter for sync_files")
Cc: stable@vger.kernel.org
Signed-off-by: Fedor Pchelkin <pchelkin@ispras.ru>
---
 drivers/gpu/drm/vmwgfx/vmwgfx_execbuf.c | 27 ++++++++++++++++---------
 1 file changed, 18 insertions(+), 9 deletions(-)

diff --git a/drivers/gpu/drm/vmwgfx/vmwgfx_execbuf.c b/drivers/gpu/drm/vmwgfx/vmwgfx_execbuf.c
index e831e324e737..12d897eca410 100644
--- a/drivers/gpu/drm/vmwgfx/vmwgfx_execbuf.c
+++ b/drivers/gpu/drm/vmwgfx/vmwgfx_execbuf.c
@@ -4085,6 +4085,23 @@ static void seqno_waiter_rm_cb(struct dma_fence *f, struct dma_fence_cb *cb)
 	kfree(ctx);
 }
 
+static void seqno_waiter_create(struct dma_fence *f,
+				struct vmw_private *dev_priv)
+{
+	struct seqno_waiter_rm_context *ctx;
+
+	ctx = kmalloc(sizeof(*ctx), GFP_KERNEL);
+	if (!ctx)
+		return;
+
+	ctx->dev_priv = dev_priv;
+	vmw_seqno_waiter_add(dev_priv);
+	if (dma_fence_add_callback(f, &ctx->base, seqno_waiter_rm_cb) < 0) {
+		vmw_seqno_waiter_remove(dev_priv);
+		kfree(ctx);
+	}
+}
+
 int vmw_execbuf_process(struct drm_file *file_priv,
 			struct vmw_private *dev_priv,
 			void __user *user_commands, void *kernel_commands,
@@ -4265,15 +4282,7 @@ int vmw_execbuf_process(struct drm_file *file_priv,
 		} else {
 			/* Link the fence with the FD created earlier */
 			fd_install(out_fence_fd, sync_file->file);
-			struct seqno_waiter_rm_context *ctx =
-				kmalloc(sizeof(*ctx), GFP_KERNEL);
-			ctx->dev_priv = dev_priv;
-			vmw_seqno_waiter_add(dev_priv);
-			if (dma_fence_add_callback(&fence->base, &ctx->base,
-						   seqno_waiter_rm_cb) < 0) {
-				vmw_seqno_waiter_remove(dev_priv);
-				kfree(ctx);
-			}
+			seqno_waiter_create(&fence->base, dev_priv);
 		}
 	}
 
-- 
2.50.0

