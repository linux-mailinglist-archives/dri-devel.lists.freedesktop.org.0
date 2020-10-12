Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 0D50A28C526
	for <lists+dri-devel@lfdr.de>; Tue, 13 Oct 2020 01:29:40 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 03C0E6E84D;
	Mon, 12 Oct 2020 23:29:35 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from perceval.ideasonboard.com (perceval.ideasonboard.com
 [213.167.242.64])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 1B7B36E84E
 for <dri-devel@lists.freedesktop.org>; Mon, 12 Oct 2020 23:29:34 +0000 (UTC)
Received: from pendragon.lan (62-78-145-57.bb.dnainternet.fi [62.78.145.57])
 by perceval.ideasonboard.com (Postfix) with ESMTPSA id D52061A51;
 Tue, 13 Oct 2020 01:29:30 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=ideasonboard.com;
 s=mail; t=1602545371;
 bh=1gYOsQgLI1kXGsp6YcA9DssdcpvUUYgyQjbTxGHA7sM=;
 h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
 b=EYMaWT8cgyOpfSB6ih5PqG24mFuzuO8FjltL6VY2TcUoQSc+dkI+KlrW3KE+stcKw
 BsaUanXuhe6u8vBSii+26Psjtlg6jpaHKXlF/aG3mvf4SmzAV+Ax4d8S2i3/TIT1Bp
 CrKI9V8bwv0jOPQSxb6U0LMzfma4wv/m2V7o7fSw=
From: Laurent Pinchart <laurent.pinchart@ideasonboard.com>
To: dri-devel@lists.freedesktop.org
Subject: [PATCH 2/2] drm: mxsfb: Add RGB888 support on the primary plane
Date: Tue, 13 Oct 2020 02:28:40 +0300
Message-Id: <20201012232840.15680-3-laurent.pinchart@ideasonboard.com>
X-Mailer: git-send-email 2.27.0
In-Reply-To: <20201012232840.15680-1-laurent.pinchart@ideasonboard.com>
References: <20201012232840.15680-1-laurent.pinchart@ideasonboard.com>
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
Cc: Marek Vasut <marex@denx.de>, kernel@pengutronix.de, linux-imx@nxp.com
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

The primary plane can support the packed 24-bit RGB888 format. Enable
it.

Signed-off-by: Laurent Pinchart <laurent.pinchart@ideasonboard.com>
---
 drivers/gpu/drm/mxsfb/mxsfb_drv.c | 5 +++++
 drivers/gpu/drm/mxsfb/mxsfb_kms.c | 7 +++++++
 2 files changed, 12 insertions(+)

diff --git a/drivers/gpu/drm/mxsfb/mxsfb_drv.c b/drivers/gpu/drm/mxsfb/mxsfb_drv.c
index d52cf8a506a5..5ec10f0f6508 100644
--- a/drivers/gpu/drm/mxsfb/mxsfb_drv.c
+++ b/drivers/gpu/drm/mxsfb/mxsfb_drv.c
@@ -97,6 +97,11 @@ mxsfb_fb_create(struct drm_device *dev, struct drm_file *file_priv,
 		return ERR_PTR(-EINVAL);
 	}
 
+	if (info->cpp[0] == 3 && mode_cmd->width % 4) {
+		dev_dbg(dev->dev, "24-bit RGB format requires a width aligned to 4\n");
+		return ERR_PTR(-EINVAL);
+	}
+
 	return drm_gem_fb_create(dev, file_priv, mode_cmd);
 }
 
diff --git a/drivers/gpu/drm/mxsfb/mxsfb_kms.c b/drivers/gpu/drm/mxsfb/mxsfb_kms.c
index 7a69d9f3a875..7a0d6bc58be0 100644
--- a/drivers/gpu/drm/mxsfb/mxsfb_kms.c
+++ b/drivers/gpu/drm/mxsfb/mxsfb_kms.c
@@ -75,6 +75,12 @@ static void mxsfb_set_formats(struct mxsfb_drm_private *mxsfb)
 		ctrl |= CTRL_WORD_LENGTH_16;
 		ctrl1 |= CTRL1_SET_BYTE_PACKAGING(0xf);
 		break;
+	case DRM_FORMAT_RGB888:
+		dev_dbg(drm->dev, "Setting up RGB888 mode\n");
+		ctrl |= CTRL_WORD_LENGTH_24;
+		/* Enable pixel packing, 4 pixels in 3 bytes. */
+		ctrl1 |= CTRL1_SET_BYTE_PACKAGING(0xf);
+		break;
 	case DRM_FORMAT_XRGB8888:
 		dev_dbg(drm->dev, "Setting up XRGB8888 mode\n");
 		ctrl |= CTRL_WORD_LENGTH_24;
@@ -523,6 +529,7 @@ static const struct drm_plane_funcs mxsfb_plane_funcs = {
 
 static const uint32_t mxsfb_primary_plane_formats[] = {
 	DRM_FORMAT_RGB565,
+	DRM_FORMAT_RGB888,
 	DRM_FORMAT_XRGB8888,
 };
 
-- 
Regards,

Laurent Pinchart

_______________________________________________
dri-devel mailing list
dri-devel@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/dri-devel
