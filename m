Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 9272E9FC7A5
	for <lists+dri-devel@lfdr.de>; Thu, 26 Dec 2024 03:30:20 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 0A9CE10E681;
	Thu, 26 Dec 2024 02:30:14 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=treblig.org header.i=@treblig.org header.b="WYfQSZgV";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mx.treblig.org (mx.treblig.org [46.235.229.95])
 by gabe.freedesktop.org (Postfix) with ESMTPS id EC58C10E683
 for <dri-devel@lists.freedesktop.org>; Thu, 26 Dec 2024 02:30:11 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=treblig.org
 ; s=bytemarkmx;
 h=MIME-Version:Message-ID:Date:Subject:From:Content-Type:From
 :Subject; bh=m4Osx6Hdy9KSW372q7wGp80UoBpNogxBOIxeaPz8X+M=; b=WYfQSZgV7n/+3+Pd
 KmWCyewhwvPkrUihSLAvKQe6lvM5B+2jwmuShNU77PeeE0hgZSF3OeHuJ54E0apajjhoLnm7eiYHa
 FkY9DIDWmnbx4OlniJqZzQl5xFAxI4G4cNiSq5duToEDjjuSJxlyKiBc2KDIpZkxb+SofwKJR29hl
 E0l6PLzOvuyHHvCnEJZFphJ3LKWgA250kg//KiIvnZkRu/uTdNUazkWjDR8vJZM4p8AkWgLZtxo/o
 Ue5eJeslQo3MHPwoXsQ6lSqq0QOIsJUBBangZzu+Yk/Q4EOgjg/9Q1lDLkuPhN2vFe9K1DsKb3Xzk
 ISzCMPjbVwpE/PO5BQ==;
Received: from localhost ([127.0.0.1] helo=dalek.home.treblig.org)
 by mx.treblig.org with esmtp (Exim 4.96)
 (envelope-from <linux@treblig.org>) id 1tQdbP-007F0L-0G;
 Thu, 26 Dec 2024 02:27:55 +0000
From: linux@treblig.org
To: p.zabel@pengutronix.de, airlied@gmail.com, simona@ffwll.ch, deller@gmx.de,
 shawnguo@kernel.org, s.hauer@pengutronix.de, kernel@pengutronix.de,
 festevam@gmail.com
Cc: dri-devel@lists.freedesktop.org, linux-fbdev@vger.kernel.org,
 imx@lists.linux.dev, linux-arm-kernel@lists.infradead.org,
 linux-kernel@vger.kernel.org, "Dr. David Alan Gilbert" <linux@treblig.org>
Subject: [PATCH 2/7] gpu: ipu-v3: Remove unused ipu_rot_mode_to_degrees
Date: Thu, 26 Dec 2024 02:27:47 +0000
Message-ID: <20241226022752.219399-3-linux@treblig.org>
X-Mailer: git-send-email 2.47.1
In-Reply-To: <20241226022752.219399-1-linux@treblig.org>
References: <20241226022752.219399-1-linux@treblig.org>
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

From: "Dr. David Alan Gilbert" <linux@treblig.org>

ipu_rot_mode_to_degrees() was added in 2014 by
commit f835f386a119 ("gpu: ipu-v3: Add rotation mode conversion utilities")
but has remained unused.

Remove it.

Signed-off-by: Dr. David Alan Gilbert <linux@treblig.org>
---
 drivers/gpu/ipu-v3/ipu-common.c | 32 --------------------------------
 include/video/imx-ipu-v3.h      |  2 --
 2 files changed, 34 deletions(-)

diff --git a/drivers/gpu/ipu-v3/ipu-common.c b/drivers/gpu/ipu-v3/ipu-common.c
index 947323f4a234..a8570e1bdf28 100644
--- a/drivers/gpu/ipu-v3/ipu-common.c
+++ b/drivers/gpu/ipu-v3/ipu-common.c
@@ -165,38 +165,6 @@ int ipu_degrees_to_rot_mode(enum ipu_rotate_mode *mode, int degrees,
 }
 EXPORT_SYMBOL_GPL(ipu_degrees_to_rot_mode);
 
-int ipu_rot_mode_to_degrees(int *degrees, enum ipu_rotate_mode mode,
-			    bool hflip, bool vflip)
-{
-	u32 r90, vf, hf;
-
-	r90 = ((u32)mode >> 2) & 0x1;
-	hf = ((u32)mode >> 1) & 0x1;
-	vf = ((u32)mode >> 0) & 0x1;
-	hf ^= (u32)hflip;
-	vf ^= (u32)vflip;
-
-	switch ((enum ipu_rotate_mode)((r90 << 2) | (hf << 1) | vf)) {
-	case IPU_ROTATE_NONE:
-		*degrees = 0;
-		break;
-	case IPU_ROTATE_90_RIGHT:
-		*degrees = 90;
-		break;
-	case IPU_ROTATE_180:
-		*degrees = 180;
-		break;
-	case IPU_ROTATE_90_LEFT:
-		*degrees = 270;
-		break;
-	default:
-		return -EINVAL;
-	}
-
-	return 0;
-}
-EXPORT_SYMBOL_GPL(ipu_rot_mode_to_degrees);
-
 struct ipuv3_channel *ipu_idmac_get(struct ipu_soc *ipu, unsigned num)
 {
 	struct ipuv3_channel *channel;
diff --git a/include/video/imx-ipu-v3.h b/include/video/imx-ipu-v3.h
index 0bb1d714cbf5..8870f65c9a8b 100644
--- a/include/video/imx-ipu-v3.h
+++ b/include/video/imx-ipu-v3.h
@@ -484,8 +484,6 @@ enum ipu_color_space ipu_drm_fourcc_to_colorspace(u32 drm_fourcc);
 enum ipu_color_space ipu_pixelformat_to_colorspace(u32 pixelformat);
 int ipu_degrees_to_rot_mode(enum ipu_rotate_mode *mode, int degrees,
 			    bool hflip, bool vflip);
-int ipu_rot_mode_to_degrees(int *degrees, enum ipu_rotate_mode mode,
-			    bool hflip, bool vflip);
 
 struct ipu_client_platformdata {
 	int csi;
-- 
2.47.1

