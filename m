Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id B2C74343E70
	for <lists+dri-devel@lfdr.de>; Mon, 22 Mar 2021 11:53:22 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 0675389EAE;
	Mon, 22 Mar 2021 10:53:21 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
 by gabe.freedesktop.org (Postfix) with ESMTPS id AB9FC89EAC
 for <dri-devel@lists.freedesktop.org>; Mon, 22 Mar 2021 10:53:20 +0000 (UTC)
Received: by mail.kernel.org (Postfix) with ESMTPSA id B135861585;
 Mon, 22 Mar 2021 10:53:18 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=k20201202; t=1616410400;
 bh=dgFzVnRh0FbIORkPoqNN87sf585VX/uTn2y5kQW8Hro=;
 h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
 b=jCiV//so53WUOq7dRrF8KK3IJ4Lpd9GKJ8HbUGEsYSesGyXSRjqhwVzVCwranxQ7r
 VM9b4tNbRwXFCRHmZUQEqcQL6vVhOXjXDcbO5T1LrcYp8AMH+FuQXQbjX+o2ZspSy2
 qxmOK1A1aJhvQt8H70vzrL7bM/yAVUyB4hRuABBIukZkAnPZnV2FcfzMr5yodk9iZP
 y7fQywTeomlVUGK8LIiT9C8/cqI9CnpaRhCkvqLpQhZpYZW+ljo1sP8OmIgXtteBfD
 sSt5McPUvfdHshGgD6WIf+DWHyOMTCFGSt6CyRdDyaW5Y2eiS9jn5+5T0nBNTPiP0z
 DqrnwpU7et9Eg==
From: Arnd Bergmann <arnd@kernel.org>
To: dri-devel@lists.freedesktop.org,
 Maarten Lankhorst <maarten.lankhorst@linux.intel.com>,
 Maxime Ripard <mripard@kernel.org>,
 Thomas Zimmermann <tzimmermann@suse.de>, David Airlie <airlied@linux.ie>,
 Daniel Vetter <daniel@ffwll.ch>
Subject: [PATCH 2/2] vgaarb: avoid -Wempty-body warnings
Date: Mon, 22 Mar 2021 11:53:00 +0100
Message-Id: <20210322105307.1291840-2-arnd@kernel.org>
X-Mailer: git-send-email 2.29.2
In-Reply-To: <20210322105307.1291840-1-arnd@kernel.org>
References: <20210322105307.1291840-1-arnd@kernel.org>
MIME-Version: 1.0
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
Cc: linux-fbdev@vger.kernel.org, Yue Zou <zouyue3@huawei.com>,
 linux-kernel@vger.kernel.org, Arnd Bergmann <arnd@arndb.de>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

From: Arnd Bergmann <arnd@arndb.de>

Building with W=1 shows a few warnings for an empty macro:

drivers/gpu/drm/qxl/qxl_drv.c: In function 'qxl_pci_probe':
drivers/gpu/drm/qxl/qxl_drv.c:131:50: error: suggest braces around empty body in an 'if' statement [-Werror=empty-body]
  131 |                 vga_put(pdev, VGA_RSRC_LEGACY_IO);
      |                                                  ^
drivers/gpu/drm/qxl/qxl_drv.c: In function 'qxl_pci_remove':
drivers/gpu/drm/qxl/qxl_drv.c:159:50: error: suggest braces around empty body in an 'if' statement [-Werror=empty-body]
  159 |                 vga_put(pdev, VGA_RSRC_LEGACY_IO);

Change this to an inline function to make it more robust and avoid
the warning.

Signed-off-by: Arnd Bergmann <arnd@arndb.de>
---
 include/linux/vgaarb.h | 4 +++-
 1 file changed, 3 insertions(+), 1 deletion(-)

diff --git a/include/linux/vgaarb.h b/include/linux/vgaarb.h
index fc6dfeba04a5..dc6ddce92066 100644
--- a/include/linux/vgaarb.h
+++ b/include/linux/vgaarb.h
@@ -112,7 +112,9 @@ static inline int vga_get_uninterruptible(struct pci_dev *pdev,
 #if defined(CONFIG_VGA_ARB)
 extern void vga_put(struct pci_dev *pdev, unsigned int rsrc);
 #else
-#define vga_put(pdev, rsrc)
+static inline void vga_put(struct pci_dev *pdev, unsigned int rsrc)
+{
+}
 #endif
 
 
-- 
2.29.2

_______________________________________________
dri-devel mailing list
dri-devel@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/dri-devel
