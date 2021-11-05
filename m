Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 269A4446941
	for <lists+dri-devel@lfdr.de>; Fri,  5 Nov 2021 20:41:02 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 2433E6E550;
	Fri,  5 Nov 2021 19:40:49 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from EX13-EDG-OU-002.vmware.com (ex13-edg-ou-002.vmware.com
 [208.91.0.190])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 42FAB6ECD1
 for <dri-devel@lists.freedesktop.org>; Fri,  5 Nov 2021 19:40:45 +0000 (UTC)
Received: from sc9-mailhost1.vmware.com (10.113.161.71) by
 EX13-EDG-OU-002.vmware.com (10.113.208.156) with Microsoft SMTP Server id
 15.0.1156.6; Fri, 5 Nov 2021 12:40:36 -0700
Received: from vmware.com (unknown [10.21.244.23])
 by sc9-mailhost1.vmware.com (Postfix) with ESMTP id 47AE7205B3;
 Fri,  5 Nov 2021 12:40:44 -0700 (PDT)
From: Zack Rusin <zackr@vmware.com>
To: <dri-devel@lists.freedesktop.org>
Subject: [PATCH v2 3/6] drm/vmwgfx: Fail to initialize on broken configs
Date: Fri, 5 Nov 2021 15:38:44 -0400
Message-ID: <20211105193845.258816-4-zackr@vmware.com>
X-Mailer: git-send-email 2.32.0
In-Reply-To: <20211105193845.258816-1-zackr@vmware.com>
References: <20211105193845.258816-1-zackr@vmware.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
Received-SPF: None (EX13-EDG-OU-002.vmware.com: zackr@vmware.com does not
 designate permitted sender hosts)
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
Cc: Martin Krastev <krastevm@vmware.com>
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

Some of our hosts have a bug where rescaning a pci bus results in stale
fifo memory being mapped on the host. This makes any fifo communication
impossible resulting in various kernel crashes.

Instead of unexpectedly crashing, predictably fail to load the driver
which will preserve the system.

Fixes: fb1d9738ca05 ("drm/vmwgfx: Add DRM driver for VMware Virtual GPU")
Signed-off-by: Zack Rusin <zackr@vmware.com>
Reviewed-by: Martin Krastev <krastevm@vmware.com>
---
 drivers/gpu/drm/vmwgfx/vmwgfx_cmd.c | 7 +++++++
 1 file changed, 7 insertions(+)

diff --git a/drivers/gpu/drm/vmwgfx/vmwgfx_cmd.c b/drivers/gpu/drm/vmwgfx/vmwgfx_cmd.c
index 67db472d3493..a3bfbb6c3e14 100644
--- a/drivers/gpu/drm/vmwgfx/vmwgfx_cmd.c
+++ b/drivers/gpu/drm/vmwgfx/vmwgfx_cmd.c
@@ -145,6 +145,13 @@ struct vmw_fifo_state *vmw_fifo_create(struct vmw_private *dev_priv)
 		 (unsigned int) max,
 		 (unsigned int) min,
 		 (unsigned int) fifo->capabilities);
+
+	if (unlikely(min >= max)) {
+		drm_warn(&dev_priv->drm,
+			 "FIFO memory is not usable. Driver failed to initialize.");
+		return ERR_PTR(-ENXIO);
+	}
+
 	return fifo;
 }
 
-- 
2.32.0

