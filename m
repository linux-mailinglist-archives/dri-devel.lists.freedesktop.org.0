Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id BDF702CAD5F
	for <lists+dri-devel@lfdr.de>; Tue,  1 Dec 2020 21:33:38 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id E98686E8D0;
	Tue,  1 Dec 2020 20:33:36 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from EX13-EDG-OU-001.vmware.com (ex13-edg-ou-001.vmware.com
 [208.91.0.189])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 2ABAD6E8D0
 for <dri-devel@lists.freedesktop.org>; Tue,  1 Dec 2020 20:33:36 +0000 (UTC)
Received: from sc9-mailhost3.vmware.com (10.113.161.73) by
 EX13-EDG-OU-001.vmware.com (10.113.208.155) with Microsoft SMTP Server id
 15.0.1156.6; Tue, 1 Dec 2020 12:18:31 -0800
Received: from vertex.vmware.com (unknown [10.21.244.133])
 by sc9-mailhost3.vmware.com (Postfix) with ESMTP id BF54B20AB9;
 Tue,  1 Dec 2020 12:18:33 -0800 (PST)
From: Zack Rusin <zackr@vmware.com>
To: <dri-devel@lists.freedesktop.org>
Subject: [PATCH 8/8] drm/vmwgfx: Fix display register usage for some older
 configs
Date: Tue, 1 Dec 2020 15:18:28 -0500
Message-ID: <20201201201828.808888-8-zackr@vmware.com>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20201201201828.808888-1-zackr@vmware.com>
References: <20201201201828.808888-1-zackr@vmware.com>
MIME-Version: 1.0
Received-SPF: None (EX13-EDG-OU-001.vmware.com: zackr@vmware.com does not
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
Cc: Martin Krastev <krastevm@vmware.com>,
 Roland Scheidegger <sroland@vmware.com>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

We can't be setting the display_id register to an invalid value
because that makes our device reset the fb which causes nasty
flicker (due to destruction and creation of a new fb).
Also we can't be using the BITS_PER_PIXEL register if the
8BIT_EMULATION is not supported.

Signed-off-by: Zack Rusin <zackr@vmware.com>
Reviewed-by: Martin Krastev <krastevm@vmware.com>
Reviewed-by: Roland Scheidegger <sroland@vmware.com>
---
 drivers/gpu/drm/vmwgfx/vmwgfx_kms.c | 3 ++-
 drivers/gpu/drm/vmwgfx/vmwgfx_ldu.c | 1 -
 2 files changed, 2 insertions(+), 2 deletions(-)

diff --git a/drivers/gpu/drm/vmwgfx/vmwgfx_kms.c b/drivers/gpu/drm/vmwgfx/vmwgfx_kms.c
index 551070fa87a3..31218bf6db51 100644
--- a/drivers/gpu/drm/vmwgfx/vmwgfx_kms.c
+++ b/drivers/gpu/drm/vmwgfx/vmwgfx_kms.c
@@ -1873,7 +1873,8 @@ int vmw_kms_write_svga(struct vmw_private *vmw_priv,
 		vmw_fifo_mem_write(vmw_priv, SVGA_FIFO_PITCHLOCK, pitch);
 	vmw_write(vmw_priv, SVGA_REG_WIDTH, width);
 	vmw_write(vmw_priv, SVGA_REG_HEIGHT, height);
-	vmw_write(vmw_priv, SVGA_REG_BITS_PER_PIXEL, bpp);
+	if ((vmw_priv->capabilities & SVGA_CAP_8BIT_EMULATION) != 0)
+		vmw_write(vmw_priv, SVGA_REG_BITS_PER_PIXEL, bpp);
 
 	if (vmw_read(vmw_priv, SVGA_REG_DEPTH) != depth) {
 		DRM_ERROR("Invalid depth %u for %u bpp, host expects %u\n",
diff --git a/drivers/gpu/drm/vmwgfx/vmwgfx_ldu.c b/drivers/gpu/drm/vmwgfx/vmwgfx_ldu.c
index 4a4ae14d9b9b..fa8ce1b9de13 100644
--- a/drivers/gpu/drm/vmwgfx/vmwgfx_ldu.c
+++ b/drivers/gpu/drm/vmwgfx/vmwgfx_ldu.c
@@ -125,7 +125,6 @@ static int vmw_ldu_commit_list(struct vmw_private *dev_priv)
 		vmw_write(dev_priv, SVGA_REG_DISPLAY_POSITION_Y, crtc->y);
 		vmw_write(dev_priv, SVGA_REG_DISPLAY_WIDTH, crtc->mode.hdisplay);
 		vmw_write(dev_priv, SVGA_REG_DISPLAY_HEIGHT, crtc->mode.vdisplay);
-		vmw_write(dev_priv, SVGA_REG_DISPLAY_ID, SVGA_ID_INVALID);
 
 		i++;
 	}
-- 
2.25.1

_______________________________________________
dri-devel mailing list
dri-devel@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/dri-devel
