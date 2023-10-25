Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id B3D617D6CC5
	for <lists+dri-devel@lfdr.de>; Wed, 25 Oct 2023 15:10:56 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 1411D10E5AE;
	Wed, 25 Oct 2023 13:10:53 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from relay5-d.mail.gandi.net (relay5-d.mail.gandi.net
 [217.70.183.197])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 5CB1D10E655
 for <dri-devel@lists.freedesktop.org>; Wed, 25 Oct 2023 13:10:50 +0000 (UTC)
Received: by mail.gandi.net (Postfix) with ESMTPSA id EBCA11C000D;
 Wed, 25 Oct 2023 13:10:47 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=bootlin.com; s=gm1;
 t=1698239448;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:
 content-transfer-encoding:content-transfer-encoding;
 bh=sq/7jbI//tPSUdJ8eoGURH5pS4j1r+AIB4XYpbcVvmU=;
 b=cZvK9ybagNGJ5x27CZPb5DKTSJsJ1Gfn/y1eO8ofA5QCvz7vY5PfiPr9dcxyvQuaBq3QZf
 BuGiailwe4f+lxc7K2yfuXEZlfLhLZyLLKR1yljcxxF7PFp3gfK4ixinp7xELv4luvrkpp
 hlijvM3HcgbzhprIoT+Jcpgx6MfnN5KBcdPqHfWxDBreDiAXFq0Oct8/oW2MYcDIGaK75x
 B77omtU7lf9bRzW8ortwSy+fH9mE64XREkFokLyY5zp3YuH43hGfX2Bk+rMilinSSMVIyP
 Jx1vpB/WzGQrf5EtE8TOjDG/4osdygMNIYGEsn/CfSt7THXeaB3kLmqRA4Jpog==
From: Paul Kocialkowski <paul.kocialkowski@bootlin.com>
To: dri-devel@lists.freedesktop.org,
	linux-kernel@vger.kernel.org
Subject: [PATCH 1/2] drm/logicvc: Avoid possible overflow in layer buffer
 setup variables
Date: Wed, 25 Oct 2023 15:09:45 +0200
Message-ID: <20231025130946.119957-1-paul.kocialkowski@bootlin.com>
X-Mailer: git-send-email 2.42.0
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-GND-Sasl: paul.kocialkowski@bootlin.com
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
Cc: Paul Kocialkowski <paul.kocialkowski@bootlin.com>,
 Dan Carpenter <dan.carpenter@oracle.com>, Maxime Ripard <mripard@kernel.org>
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

The buffer_sel, voffset and hoffset values are calculated from u32
values and might overflow under certain conditions.

Move them to u32 definitions instead of u8/u16 to avoid the issue.

Signed-off-by: Paul Kocialkowski <paul.kocialkowski@bootlin.com>
Reported-by: Dan Carpenter <dan.carpenter@oracle.com>
Fixes: efeeaefe9be5 ("drm: Add support for the LogiCVC display controller")
---
 drivers/gpu/drm/logicvc/logicvc_layer.c | 6 +++---
 drivers/gpu/drm/logicvc/logicvc_layer.h | 6 +++---
 2 files changed, 6 insertions(+), 6 deletions(-)

diff --git a/drivers/gpu/drm/logicvc/logicvc_layer.c b/drivers/gpu/drm/logicvc/logicvc_layer.c
index 464000aea765..eea22379d042 100644
--- a/drivers/gpu/drm/logicvc/logicvc_layer.c
+++ b/drivers/gpu/drm/logicvc/logicvc_layer.c
@@ -268,9 +268,9 @@ int logicvc_layer_buffer_find_setup(struct logicvc_drm *logicvc,
 	u32 layer_stride = layer_bytespp * logicvc->config.row_stride;
 	u32 base_offset = layer->config.base_offset * layer_stride;
 	u32 buffer_offset = layer->config.buffer_offset * layer_stride;
-	u8 buffer_sel = 0;
-	u16 voffset = 0;
-	u16 hoffset = 0;
+	u32 buffer_sel = 0;
+	u32 voffset = 0;
+	u32 hoffset = 0;
 	phys_addr_t fb_addr;
 	u32 fb_offset;
 	u32 gap;
diff --git a/drivers/gpu/drm/logicvc/logicvc_layer.h b/drivers/gpu/drm/logicvc/logicvc_layer.h
index 4a4b02e9b819..a06feeda3abf 100644
--- a/drivers/gpu/drm/logicvc/logicvc_layer.h
+++ b/drivers/gpu/drm/logicvc/logicvc_layer.h
@@ -18,9 +18,9 @@
 #define LOGICVC_LAYER_ALPHA_PIXEL		1
 
 struct logicvc_layer_buffer_setup {
-	u8 buffer_sel;
-	u16 voffset;
-	u16 hoffset;
+	u32 buffer_sel;
+	u32 voffset;
+	u32 hoffset;
 };
 
 struct logicvc_layer_config {
-- 
2.42.0

