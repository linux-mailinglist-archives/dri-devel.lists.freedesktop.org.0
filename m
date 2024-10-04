Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id DDC2A9910E0
	for <lists+dri-devel@lfdr.de>; Fri,  4 Oct 2024 22:51:02 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 17D8B10EAAF;
	Fri,  4 Oct 2024 20:51:01 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=kernel.org header.i=@kernel.org header.b="ssunGc54";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from dfw.source.kernel.org (dfw.source.kernel.org [139.178.84.217])
 by gabe.freedesktop.org (Postfix) with ESMTPS id D5DA510EAAF
 for <dri-devel@lists.freedesktop.org>; Fri,  4 Oct 2024 20:50:59 +0000 (UTC)
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
 by dfw.source.kernel.org (Postfix) with ESMTP id D68B45C58E6;
 Fri,  4 Oct 2024 20:50:54 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id AF0C9C4CEC6;
 Fri,  4 Oct 2024 20:50:55 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=k20201202; t=1728075058;
 bh=UBMO/CJwcVxp6gwu2q8OsQBUbBql585BseXSfGZoxWw=;
 h=From:To:Cc:Subject:Date:From;
 b=ssunGc54RTKxmty38LstRzYO8SrL34yq9GlQOuRgtYnO7KdBDinrJnzM/tbp0jnSN
 ddbAnDU3WkrPUmp6iTiXKUmNEpEz7OxqOOhca0MYvDN3Qs+E5v4dohk2xKJFUWkRPp
 +UaL7ablghfMXdKy0C0OyB7hhUI2cL6ixFosdyRB+heZrXM7XV5N1ri8x/u16/cnGv
 ga2p40GiZ1O2KT5zEVJFBTmj/4u5HIQc3Sj6m9SzvxnrUTf7B+c+kGI+EqQ9JM6nIW
 ZhXYQLbR4ru3ayRVARUAFbz/mZVfccprOS2oB9sy0bI/B/EUG6neIwf/k6Q71TQPff
 zmDnK75+uLDoA==
From: Arnd Bergmann <arnd@kernel.org>
To: Zack Rusin <zack.rusin@broadcom.com>,
 Maarten Lankhorst <maarten.lankhorst@linux.intel.com>,
 Maxime Ripard <mripard@kernel.org>,
 Thomas Zimmermann <tzimmermann@suse.de>, David Airlie <airlied@gmail.com>,
 Simona Vetter <simona@ffwll.ch>
Cc: Niklas Schnelle <schnelle@linux.ibm.com>, Arnd Bergmann <arnd@arndb.de>,
 Broadcom internal kernel review list <bcm-kernel-feedback-list@broadcom.com>, 
 Martin Krastev <martin.krastev@broadcom.com>,
 Javier Martinez Canillas <javierm@redhat.com>,
 Ian Forbes <ian.forbes@broadcom.com>, dri-devel@lists.freedesktop.org,
 linux-kernel@vger.kernel.org
Subject: [PATCH] vmwgfx: allow building with CONFIG_HAS_IOPORT disabled
Date: Fri,  4 Oct 2024 20:50:34 +0000
Message-Id: <20241004205053.1068629-1-arnd@kernel.org>
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
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

From: Arnd Bergmann <arnd@arndb.de>

The older version of the vmwgfx driver requires port I/O in order to work:

In file included from arch/arm64/include/asm/io.h:298,
                 from drivers/gpu/drm/vmwgfx/vmwgfx_kms.c:28:
drivers/gpu/drm/vmwgfx/vmwgfx_drv.h: In function 'vmw_read':
include/asm-generic/io.h:626:15: error: call to '_outl' declared with attribute error: outl() requires CONFIG_HAS_IOPORT
  626 | #define _outl _outl
include/asm-generic/io.h:663:14: note: in expansion of macro '_outl'
  663 | #define outl _outl
      |              ^~~~~
drivers/gpu/drm/vmwgfx/vmwgfx_drv.h:692:17: note: in expansion of macro 'outl'
  692 |                 outl(offset, dev_priv->io_start + SVGA_INDEX_PORT);
      |                 ^~~~

Change the version check to hardcode the v3 version and remove the PCI
ID for v2 in configurations that only support v3.

Signed-off-by: Arnd Bergmann <arnd@arndb.de>
---
 drivers/gpu/drm/vmwgfx/vmwgfx_drv.c | 2 ++
 drivers/gpu/drm/vmwgfx/vmwgfx_drv.h | 5 ++++-
 2 files changed, 6 insertions(+), 1 deletion(-)

diff --git a/drivers/gpu/drm/vmwgfx/vmwgfx_drv.c b/drivers/gpu/drm/vmwgfx/vmwgfx_drv.c
index 2825dd3149ed..dfb4b2ba23c6 100644
--- a/drivers/gpu/drm/vmwgfx/vmwgfx_drv.c
+++ b/drivers/gpu/drm/vmwgfx/vmwgfx_drv.c
@@ -262,7 +262,9 @@ static const struct drm_ioctl_desc vmw_ioctls[] = {
 };
 
 static const struct pci_device_id vmw_pci_id_list[] = {
+#ifdef CONFIG_HAS_IOPORT
 	{ PCI_DEVICE(PCI_VENDOR_ID_VMWARE, VMWGFX_PCI_ID_SVGA2) },
+#endif
 	{ PCI_DEVICE(PCI_VENDOR_ID_VMWARE, VMWGFX_PCI_ID_SVGA3) },
 	{ }
 };
diff --git a/drivers/gpu/drm/vmwgfx/vmwgfx_drv.h b/drivers/gpu/drm/vmwgfx/vmwgfx_drv.h
index 3f4719b3c268..a2fda4d43b4e 100644
--- a/drivers/gpu/drm/vmwgfx/vmwgfx_drv.h
+++ b/drivers/gpu/drm/vmwgfx/vmwgfx_drv.h
@@ -655,8 +655,11 @@ static inline struct vmw_fpriv *vmw_fpriv(struct drm_file *file_priv)
 /*
  * SVGA v3 has mmio register access and lacks fifo cmds
  */
-static inline bool vmw_is_svga_v3(const struct vmw_private *dev)
+static __always_inline bool vmw_is_svga_v3(const struct vmw_private *dev)
 {
+	if (!IS_ENABLED(CONFIG_HAS_IOPORT))
+		return true;
+
 	return dev->pci_id == VMWGFX_PCI_ID_SVGA3;
 }
 
-- 
2.39.2

