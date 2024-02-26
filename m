Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 13740867A70
	for <lists+dri-devel@lfdr.de>; Mon, 26 Feb 2024 16:39:22 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 0F4E010E77A;
	Mon, 26 Feb 2024 15:39:19 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (1024-bit key; unprotected) header.d=ideasonboard.com header.i=@ideasonboard.com header.b="FDtchzjr";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from perceval.ideasonboard.com (perceval.ideasonboard.com
 [213.167.242.64])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 0D9F110E777
 for <dri-devel@lists.freedesktop.org>; Mon, 26 Feb 2024 15:39:16 +0000 (UTC)
Received: from localhost.localdomain (93-61-96-190.ip145.fastwebnet.it
 [93.61.96.190])
 by perceval.ideasonboard.com (Postfix) with ESMTPSA id 40DB8673;
 Mon, 26 Feb 2024 16:39:03 +0100 (CET)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=ideasonboard.com;
 s=mail; t=1708961943;
 bh=it1/wFCrtpA8WF6VMSYJ7atoGY0tvgQDb2l4BKHt8i0=;
 h=From:To:Cc:Subject:Date:From;
 b=FDtchzjr3p1v5ic0ucCN23wDZyA8Teqa6rxs9VHeMmaSuOUtx74fm+giVSHqH795i
 FzOJmaF/cEPJ4A1GurI2oBgYNmHYhcr0tSyhiPNEx1Ez3Kh93muN8a5EDPey3cgHAO
 F+9OPx1MsXqNNwqOgBe/XSZFVsW+DWba12hx3+qk=
From: Jacopo Mondi <jacopo.mondi@ideasonboard.com>
To: David Airlie <airlied@gmail.com>, Daniel Vetter <daniel@ffwll.ch>,
 Maarten Lankhorst <maarten.lankhorst@linux.intel.com>,
 Maxime Ripard <mripard@kernel.org>,
 Thomas Zimmermann <tzimmermann@suse.de>,
 Naushir Patuck <naush@raspberrypi.com>,
 Laurent Pinchart <laurent.pinchart@ideasonboard.com>
Cc: Jacopo Mondi <jacopo.mondi@ideasonboard.com>,
 dri-devel@lists.freedesktop.org, libcamera-devel@lists.libcamera.org
Subject: [RFC] drm/fourcc: Add RPI modifiers
Date: Mon, 26 Feb 2024 16:38:50 +0100
Message-ID: <20240226153854.99471-1-jacopo.mondi@ideasonboard.com>
X-Mailer: git-send-email 2.43.0
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

Add modifiers for the Raspberry Pi PiSP compressed formats.

The compressed formats are documented at:
Documentation/userspace-api/media/v4l/pixfmt-pisp-comp-rggb.rst

and in the PiSP datasheet:
https://datasheets.raspberrypi.com/camera/raspberry-pi-image-signal-processor-specification.pdf

Signed-off-by: Jacopo Mondi <jacopo.mondi@ideasonboard.com>
---

Background:
-----------

The Raspberry Pi PiSP camera subsystem is on its way to upstream through the
Video4Linux2 subsystem:
https://patchwork.linuxtv.org/project/linux-media/list/?series=12310

The PiSP camera system is composed by a "Front End" and a "Back End".
The FrontEnd part is a MIPI CSI-2 receiver that store frames to memory and
produce statistics, and the BackEnd is a memory-to-memory ISP that converts
images in a format usable by application.

The "FrontEnd" is capable of encoding RAW Bayer images as received by the
image sensor in a 'compressed' format defined by Raspberry Pi and fully
documented in the PiSP manual:
https://datasheets.raspberrypi.com/camera/raspberry-pi-image-signal-processor-specification.pdf

The compression scheme is documented in the in-review patch series for the BE
support at:
https://patchwork.linuxtv.org/project/linux-media/patch/20240223163012.300763-7-jacopo.mondi@ideasonboard.com/

The "BackEnd" is capable of consuming images in the compressed format and
optionally user application might want to inspect those images for debugging
purposes.

Why a DRM modifier
------------------

The PiSP support is entirely implemented in libcamera, with the support of an
hw-specific library called 'libpisp'.

libcamera uses the fourcc codes defined by DRM to define its formats:
https://git.libcamera.org/libcamera/libcamera.git/tree/src/libcamera/formats.yaml

And to define a new libcamera format for the Raspberry Pi compressed ones we
need to associate the above proposed modifiers with a RAW Bayer format
identifier.

In example:

  - RGGB16_PISP_COMP1:
      fourcc: DRM_FORMAT_SRGGB16
      mod: PISP_FORMAT_MOD_COMPRESS_MODE1
  - GRBG16_PISP_COMP1:
      fourcc: DRM_FORMAT_SGRBG16
      mod: PISP_FORMAT_MOD_COMPRESS_MODE1
  - GBRG16_PISP_COMP1:
      fourcc: DRM_FORMAT_SGBRG16
      mod: PISP_FORMAT_MOD_COMPRESS_MODE1
  - BGGR16_PISP_COMP1:
      fourcc: DRM_FORMAT_SBGGR16
      mod: PISP_FORMAT_MOD_COMPRESS_MODE1
  - MONO_PISP_COMP1:
      fourcc: DRM_FORMAT_R16
      mod: PISP_FORMAT_MOD_COMPRESS_MODE1

See
https://patchwork.libcamera.org/patch/19503/

Would if be acceptable for DRM to include the above proposed modifiers for the
purpose of defining the above presented libcamera formats ? There will be no
graphic format associated with these modifiers as their purpose it not
displaying images but rather exchange them between the components of the
camera subsystem (and possibly be inspected by specialized test applications).

---
 include/uapi/drm/drm_fourcc.h | 5 +++++
 1 file changed, 5 insertions(+)

diff --git a/include/uapi/drm/drm_fourcc.h b/include/uapi/drm/drm_fourcc.h
index 00db00083175..09b182a959ad 100644
--- a/include/uapi/drm/drm_fourcc.h
+++ b/include/uapi/drm/drm_fourcc.h
@@ -425,6 +425,7 @@ extern "C" {
 #define DRM_FORMAT_MOD_VENDOR_ARM     0x08
 #define DRM_FORMAT_MOD_VENDOR_ALLWINNER 0x09
 #define DRM_FORMAT_MOD_VENDOR_AMLOGIC 0x0a
+#define DRM_FORMAT_MOD_VENDOR_RPI 0x0b

 /* add more to the end as needed */

@@ -1568,6 +1569,10 @@ drm_fourcc_canonicalize_nvidia_format_mod(__u64 modifier)
 #define AMD_FMT_MOD_CLEAR(field) \
 	(~((__u64)AMD_FMT_MOD_##field##_MASK << AMD_FMT_MOD_##field##_SHIFT))

+/* RPI (Raspberry Pi) modifiers */
+#define PISP_FORMAT_MOD_COMPRESS_MODE1 fourcc_mod_code(RPI, 1)
+#define PISP_FORMAT_MOD_COMPRESS_MODE2 fourcc_mod_code(RPI, 2)
+
 #if defined(__cplusplus)
 }
 #endif
--
2.43.0

