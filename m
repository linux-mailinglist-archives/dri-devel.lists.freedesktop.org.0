Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 30EDC2F52FC
	for <lists+dri-devel@lfdr.de>; Wed, 13 Jan 2021 20:03:57 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 963436EC02;
	Wed, 13 Jan 2021 19:03:49 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from EX13-EDG-OU-002.vmware.com (ex13-edg-ou-002.vmware.com
 [208.91.0.190])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 54EBC6EC08
 for <dri-devel@lists.freedesktop.org>; Wed, 13 Jan 2021 19:03:45 +0000 (UTC)
Received: from sc9-mailhost1.vmware.com (10.113.161.71) by
 EX13-EDG-OU-002.vmware.com (10.113.208.156) with Microsoft SMTP Server id
 15.0.1156.6; Wed, 13 Jan 2021 11:03:41 -0800
Received: from vertex.vmware.com (unknown [10.21.245.145])
 by sc9-mailhost1.vmware.com (Postfix) with ESMTP id 53CB5202ED;
 Wed, 13 Jan 2021 11:03:44 -0800 (PST)
From: Zack Rusin <zackr@vmware.com>
To: <dri-devel@lists.freedesktop.org>
Subject: [PATCH v3 8/8] drm/vmwgfx: Fix display register usage for some older
 configs
Date: Wed, 13 Jan 2021 14:03:38 -0500
Message-ID: <20210113190338.292507-9-zackr@vmware.com>
X-Mailer: git-send-email 2.27.0
In-Reply-To: <20210113190338.292507-1-zackr@vmware.com>
References: <20210113190338.292507-1-zackr@vmware.com>
MIME-Version: 1.0
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
index f2a9188d0b7d..9a89f658e501 100644
--- a/drivers/gpu/drm/vmwgfx/vmwgfx_kms.c
+++ b/drivers/gpu/drm/vmwgfx/vmwgfx_kms.c
@@ -1875,7 +1875,8 @@ int vmw_kms_write_svga(struct vmw_private *vmw_priv,
 		vmw_fifo_mem_write(vmw_priv, SVGA_FIFO_PITCHLOCK, pitch);
 	vmw_write(vmw_priv, SVGA_REG_WIDTH, width);
 	vmw_write(vmw_priv, SVGA_REG_HEIGHT, height);
-	vmw_write(vmw_priv, SVGA_REG_BITS_PER_PIXEL, bpp);
+	if ((vmw_priv->capabilities & SVGA_CAP_8BIT_EMULATION) != 0)
+		vmw_write(vmw_priv, SVGA_REG_BITS_PER_PIXEL, bpp);
 
 	if (vmw_read(vmw_priv, SVGA_REG_DEPTH) != depth) {
 		DRM_ERROR("Invalid depth %u for %u bpp, host expects %u\n",
diff --git a/drivers/gpu/drm/vmwgfx/vmwgfx_ldu.c b/drivers/gpu/drm/vmwgfx/vmwgfx_ldu.c
index ac806ae78894..9a9508edbc9e 100644
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
2.27.0

_______________________________________________
dri-devel mailing list
dri-devel@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/dri-devel
