Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 214E56E4A43
	for <lists+dri-devel@lfdr.de>; Mon, 17 Apr 2023 15:45:12 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 5562A10E4FF;
	Mon, 17 Apr 2023 13:45:10 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from xavier.telenet-ops.be (xavier.telenet-ops.be
 [IPv6:2a02:1800:120:4::f00:14])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 983A110E4FF
 for <dri-devel@lists.freedesktop.org>; Mon, 17 Apr 2023 13:44:52 +0000 (UTC)
Received: from ramsan.of.borg ([84.195.187.55])
 by xavier.telenet-ops.be with bizsmtp
 id lpko2900u1C8whw01pkomm; Mon, 17 Apr 2023 15:44:49 +0200
Received: from rox.of.borg ([192.168.97.57])
 by ramsan.of.borg with esmtp (Exim 4.95)
 (envelope-from <geert@linux-m68k.org>) id 1poP4u-00H0Vz-0L;
 Mon, 17 Apr 2023 15:40:27 +0200
Received: from geert by rox.of.borg with local (Exim 4.95)
 (envelope-from <geert@linux-m68k.org>) id 1poP5n-007zAM-LL;
 Mon, 17 Apr 2023 15:40:27 +0200
From: Geert Uytterhoeven <geert+renesas@glider.be>
To: Laurent Pinchart <laurent.pinchart@ideasonboard.com>,
 Kieran Bingham <kieran.bingham+renesas@ideasonboard.com>,
 David Airlie <airlied@gmail.com>,
 Maarten Lankhorst <maarten.lankhorst@linux.intel.com>,
 Maxime Ripard <mripard@kernel.org>,
 Thomas Zimmermann <tzimmermann@suse.de>, Daniel Vetter <daniel@ffwll.ch>
Subject: [PATCH v2 2/5] drm: shmobile: Add support for DRM_FORMAT_XRGB8888
Date: Mon, 17 Apr 2023 15:40:22 +0200
Message-Id: <9107cdda83234cf09fc8a93609a66ace1a55aba3.1681734821.git.geert+renesas@glider.be>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <cover.1681734821.git.geert+renesas@glider.be>
References: <cover.1681734821.git.geert+renesas@glider.be>
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
Cc: linux-renesas-soc@vger.kernel.org,
 Geert Uytterhoeven <geert+renesas@glider.be>, dri-devel@lists.freedesktop.org
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

DRM_FORMAT_XRGB8888 aka XR24 is the modus francus of DRM, and should be
supported by all drivers.

The handling for DRM_FORMAT_XRGB8888 is similar to DRM_FORMAT_ARGB8888,
just ignore the alpha channel.

Signed-off-by: Geert Uytterhoeven <geert+renesas@glider.be>
Reviewed-by: Thomas Zimmermann <tzimmermann@suse.de>
Reviewed-by: Laurent Pinchart <laurent.pinchart@ideasonboard.com>
---
v2:
  - Add Reviewed-by.
---
 drivers/gpu/drm/shmobile/shmob_drm_crtc.c  | 1 +
 drivers/gpu/drm/shmobile/shmob_drm_kms.c   | 5 +++++
 drivers/gpu/drm/shmobile/shmob_drm_plane.c | 5 +++++
 3 files changed, 11 insertions(+)

diff --git a/drivers/gpu/drm/shmobile/shmob_drm_crtc.c b/drivers/gpu/drm/shmobile/shmob_drm_crtc.c
index 713a7612244c647a..08dc1428aa16caf0 100644
--- a/drivers/gpu/drm/shmobile/shmob_drm_crtc.c
+++ b/drivers/gpu/drm/shmobile/shmob_drm_crtc.c
@@ -232,6 +232,7 @@ static void shmob_drm_crtc_start(struct shmob_drm_crtc *scrtc)
 		value = LDDDSR_LS | LDDDSR_WS | LDDDSR_BS;
 		break;
 	case DRM_FORMAT_ARGB8888:
+	case DRM_FORMAT_XRGB8888:
 	default:
 		value = LDDDSR_LS;
 		break;
diff --git a/drivers/gpu/drm/shmobile/shmob_drm_kms.c b/drivers/gpu/drm/shmobile/shmob_drm_kms.c
index 3c5fe3bc183c7c13..99381cc0abf3ae1f 100644
--- a/drivers/gpu/drm/shmobile/shmob_drm_kms.c
+++ b/drivers/gpu/drm/shmobile/shmob_drm_kms.c
@@ -39,6 +39,11 @@ static const struct shmob_drm_format_info shmob_drm_format_infos[] = {
 		.bpp = 32,
 		.yuv = false,
 		.lddfr = LDDFR_PKF_ARGB32,
+	}, {
+		.fourcc = DRM_FORMAT_XRGB8888,
+		.bpp = 32,
+		.yuv = false,
+		.lddfr = LDDFR_PKF_ARGB32,
 	}, {
 		.fourcc = DRM_FORMAT_NV12,
 		.bpp = 12,
diff --git a/drivers/gpu/drm/shmobile/shmob_drm_plane.c b/drivers/gpu/drm/shmobile/shmob_drm_plane.c
index 604ae23825daaafd..850986cee848226a 100644
--- a/drivers/gpu/drm/shmobile/shmob_drm_plane.c
+++ b/drivers/gpu/drm/shmobile/shmob_drm_plane.c
@@ -80,6 +80,7 @@ static void __shmob_drm_plane_setup(struct shmob_drm_plane *splane,
 		format |= LDBBSIFR_SWPL | LDBBSIFR_SWPW | LDBBSIFR_SWPB;
 		break;
 	case DRM_FORMAT_ARGB8888:
+	case DRM_FORMAT_XRGB8888:
 	default:
 		format |= LDBBSIFR_SWPL;
 		break;
@@ -95,6 +96,9 @@ static void __shmob_drm_plane_setup(struct shmob_drm_plane *splane,
 	case DRM_FORMAT_ARGB8888:
 		format |= LDBBSIFR_AL_PK | LDBBSIFR_RY | LDDFR_PKF_ARGB32;
 		break;
+	case DRM_FORMAT_XRGB8888:
+		format |= LDBBSIFR_AL_1 | LDBBSIFR_RY | LDDFR_PKF_ARGB32;
+		break;
 	case DRM_FORMAT_NV12:
 	case DRM_FORMAT_NV21:
 		format |= LDBBSIFR_AL_1 | LDBBSIFR_CHRR_420;
@@ -231,6 +235,7 @@ static const uint32_t formats[] = {
 	DRM_FORMAT_RGB565,
 	DRM_FORMAT_RGB888,
 	DRM_FORMAT_ARGB8888,
+	DRM_FORMAT_XRGB8888,
 	DRM_FORMAT_NV12,
 	DRM_FORMAT_NV21,
 	DRM_FORMAT_NV16,
-- 
2.34.1

