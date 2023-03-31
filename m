Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 9C61D6D230E
	for <lists+dri-devel@lfdr.de>; Fri, 31 Mar 2023 16:52:50 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 8C9C610F287;
	Fri, 31 Mar 2023 14:52:43 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from albert.telenet-ops.be (albert.telenet-ops.be
 [IPv6:2a02:1800:110:4::f00:1a])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 7E36110F289
 for <dri-devel@lists.freedesktop.org>; Fri, 31 Mar 2023 14:52:41 +0000 (UTC)
Received: from ramsan.of.borg ([84.195.187.55])
 by albert.telenet-ops.be with bizsmtp
 id f2se2900Q1C8whw062sej3; Fri, 31 Mar 2023 16:52:39 +0200
Received: from rox.of.borg ([192.168.97.57])
 by ramsan.of.borg with esmtp (Exim 4.95)
 (envelope-from <geert@linux-m68k.org>) id 1piG2N-00FUgc-4c;
 Fri, 31 Mar 2023 16:48:16 +0200
Received: from geert by rox.of.borg with local (Exim 4.95)
 (envelope-from <geert@linux-m68k.org>) id 1piG36-008fIV-IQ;
 Fri, 31 Mar 2023 16:48:16 +0200
From: Geert Uytterhoeven <geert+renesas@glider.be>
To: Laurent Pinchart <laurent.pinchart@ideasonboard.com>,
 Kieran Bingham <kieran.bingham+renesas@ideasonboard.com>,
 David Airlie <airlied@gmail.com>, Daniel Vetter <daniel@ffwll.ch>
Subject: [PATCH 2/5] drm: shmobile: Add support for DRM_FORMAT_XRGB8888
Date: Fri, 31 Mar 2023 16:48:08 +0200
Message-Id: <34ad1c1798b37a68ce08cffa8402be497ac2162e.1680273039.git.geert+renesas@glider.be>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <cover.1680273039.git.geert+renesas@glider.be>
References: <cover.1680273039.git.geert+renesas@glider.be>
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
 Geert Uytterhoeven <geert+renesas@glider.be>, linux-kernel@vger.kernel.org,
 dri-devel@lists.freedesktop.org
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

DRM_FORMAT_XRGB8888 aka XR24 is the modus francus of DRM, and should be
supported by all drivers.

The handling for DRM_FORMAT_XRGB8888 is similar to DRM_FORMAT_ARGB8888,
just ignore the alpha channel.

Signed-off-by: Geert Uytterhoeven <geert+renesas@glider.be>
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

