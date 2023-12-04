Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 8CFA7802C14
	for <lists+dri-devel@lfdr.de>; Mon,  4 Dec 2023 08:32:46 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 8725089AC3;
	Mon,  4 Dec 2023 07:32:44 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from sin.source.kernel.org (sin.source.kernel.org [145.40.73.55])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 0D68C10E1E9
 for <dri-devel@lists.freedesktop.org>; Mon,  4 Dec 2023 07:32:41 +0000 (UTC)
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
 by sin.source.kernel.org (Postfix) with ESMTP id AEF98CE0E54;
 Mon,  4 Dec 2023 07:32:38 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 592E1C433C8;
 Mon,  4 Dec 2023 07:32:35 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=k20201202; t=1701675158;
 bh=9hl2sop5ZT4amnXOtIjTHzdm3Zn4QZwIyXAyL/yWEsQ=;
 h=From:To:Cc:Subject:Date:From;
 b=FFsiU+7oMtiyy5BCm6J9eBs/i2GCEb1D7k4bvpF/43a78mGeagTz8grpZVEQoZYz5
 TSj9Y1fNQmGIEtXtGpa4txjCgiSgmrewKFzpLD5QMJCra+uaHUsf0Fqu3BNNqPfAM9
 OoEust+e7v++8M2pn8lSpSCzDdnuJ4/dViJdhqhk4OI1OFdulyegEV/exAjlGkbb6v
 e1yJqX8994rgQQqtoGA3vXp0Iv1+XGXR9+hhVbBeBNNPxUDgL1D5enYWvQcy4BNuS8
 J4EbCxXngweR9Z+KjkksznfzjnpQ6UqfaIXwnqXF3h/u3VLPUXItqgSUxz2GXyHM3I
 ogZzxkUL1PXHA==
From: Arnd Bergmann <arnd@kernel.org>
To: Frank Binns <frank.binns@imgtec.com>,
 Donald Robson <donald.robson@imgtec.com>,
 Matt Coster <matt.coster@imgtec.com>,
 Maarten Lankhorst <maarten.lankhorst@linux.intel.com>,
 Maxime Ripard <mripard@kernel.org>, Sarah Walker <sarah.walker@imgtec.com>
Subject: [PATCH] drm/imagination: move update_logtype() into ifdef section
Date: Mon,  4 Dec 2023 08:32:10 +0100
Message-Id: <20231204073231.1164163-1-arnd@kernel.org>
X-Mailer: git-send-email 2.39.2
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
Cc: Thomas Zimmermann <tzimmermann@suse.de>, Arnd Bergmann <arnd@arndb.de>,
 linux-kernel@vger.kernel.org, dri-devel@lists.freedesktop.org
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

From: Arnd Bergmann <arnd@arndb.de>

This function is only used when debugfs is enabled, and otherwise
causes a build warning:

drivers/gpu/drm/imagination/pvr_fw_trace.c:135:1: error: 'update_logtype' defined but not used [-Werror=unused-function]

Move the #ifdef check to include this function as well.

Fixes: cb56cd610866 ("drm/imagination: Add firmware trace to debugfs")
Signed-off-by: Arnd Bergmann <arnd@arndb.de>
---
 drivers/gpu/drm/imagination/pvr_fw_trace.c | 4 ++--
 1 file changed, 2 insertions(+), 2 deletions(-)

diff --git a/drivers/gpu/drm/imagination/pvr_fw_trace.c b/drivers/gpu/drm/imagination/pvr_fw_trace.c
index 87a42fb6ace6..8261fa4f7f83 100644
--- a/drivers/gpu/drm/imagination/pvr_fw_trace.c
+++ b/drivers/gpu/drm/imagination/pvr_fw_trace.c
@@ -121,6 +121,8 @@ void pvr_fw_trace_fini(struct pvr_device *pvr_dev)
 	pvr_fw_object_unmap_and_destroy(fw_trace->tracebuf_ctrl_obj);
 }
 
+#if defined(CONFIG_DEBUG_FS)
+
 /**
  * update_logtype() - Send KCCB command to trigger FW to update logtype
  * @pvr_dev: Target PowerVR device
@@ -165,8 +167,6 @@ update_logtype(struct pvr_device *pvr_dev, u32 group_mask)
 	return err;
 }
 
-#if defined(CONFIG_DEBUG_FS)
-
 static int fw_trace_group_mask_show(struct seq_file *m, void *data)
 {
 	struct pvr_device *pvr_dev = m->private;
-- 
2.39.2

