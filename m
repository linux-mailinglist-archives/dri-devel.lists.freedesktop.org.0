Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id F0E88A9C681
	for <lists+dri-devel@lfdr.de>; Fri, 25 Apr 2025 13:01:59 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 93B7E10E0E2;
	Fri, 25 Apr 2025 11:01:56 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (1024-bit key; unprotected) header.d=ideasonboard.com header.i=@ideasonboard.com header.b="QNCinfPf";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from perceval.ideasonboard.com (perceval.ideasonboard.com
 [213.167.242.64])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 5133310E0E2
 for <dri-devel@lists.freedesktop.org>; Fri, 25 Apr 2025 11:01:52 +0000 (UTC)
Received: from [127.0.1.1] (91-158-153-178.elisa-laajakaista.fi
 [91.158.153.178])
 by perceval.ideasonboard.com (Postfix) with ESMTPSA id A317682E;
 Fri, 25 Apr 2025 13:01:47 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=ideasonboard.com;
 s=mail; t=1745578908;
 bh=nqJMvcO51ziKQ3M0gQlpcJDtsciBV888CuxSXQPMuTs=;
 h=From:Subject:Date:To:Cc:From;
 b=QNCinfPfgRh8Ksc8lW0XEfZ0J8V0SZJnEGBYnBOsnf1GoAXmd7fhyHxKCT5b/5jVE
 wpJvVx4NVFnngduhyLScL8VwML84WtiVjror+N2jCg88VGRZP1wYcWOULXrAjneaQf
 gpOTpn4lf18TF6M0kVt9Cg+3/s4hh4ZR+rnTaMQY=
From: Tomi Valkeinen <tomi.valkeinen@ideasonboard.com>
Subject: [PATCH v5 00/11] drm: Add new pixel formats for Xilinx Zynqmp
Date: Fri, 25 Apr 2025 14:01:20 +0300
Message-Id: <20250425-xilinx-formats-v5-0-c74263231630@ideasonboard.com>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
X-B4-Tracking: v=1; b=H4sIAIFrC2gC/3XMy2rDMBCF4VcJWldhZnRx3VXfo2Qh69IMNFaRg
 nEIfvcqKSEQJ8v/wPnOosbCsYqPzVmUOHHlPLYwbxvh9278jpJDa0FAGpFAzvzD4yxTLgd3rDJ
 12ANawnelRDv9lph4voJfu9Z7rsdcTld/wsv6TxHoR2pCCRKGRN6g7sKAnxyiq3kcsith6/NBX
 MSJbooBRLNSqCloQVHnnTXkXijqrhDSSlFN6SFAigi2780LRd8VRXal6KYoIqcAvA0dPVGWZfk
 DpitQ/IUBAAA=
X-Change-ID: 20241120-xilinx-formats-f71901621833
To: Vishal Sagar <vishal.sagar@amd.com>, 
 Anatoliy Klymenko <anatoliy.klymenko@amd.com>, 
 Maarten Lankhorst <maarten.lankhorst@linux.intel.com>, 
 Maxime Ripard <mripard@kernel.org>, Thomas Zimmermann <tzimmermann@suse.de>, 
 David Airlie <airlied@gmail.com>, Simona Vetter <simona@ffwll.ch>, 
 Laurent Pinchart <laurent.pinchart@ideasonboard.com>, 
 Michal Simek <michal.simek@amd.com>
Cc: dri-devel@lists.freedesktop.org, linux-kernel@vger.kernel.org, 
 linux-arm-kernel@lists.infradead.org, 
 Geert Uytterhoeven <geert@linux-m68k.org>, 
 Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>, 
 Pekka Paalanen <ppaalanen@gmail.com>, 
 Tomi Valkeinen <tomi.valkeinen@ideasonboard.com>, 
 Dmitry Baryshkov <lumag@kernel.org>
X-Mailer: b4 0.15-dev-c25d1
X-Developer-Signature: v=1; a=openpgp-sha256; l=7004;
 i=tomi.valkeinen@ideasonboard.com; h=from:subject:message-id;
 bh=nqJMvcO51ziKQ3M0gQlpcJDtsciBV888CuxSXQPMuTs=;
 b=owEBbQKS/ZANAwAIAfo9qoy8lh71AcsmYgBoC2uW08B8vtftkmRupN9ZYmSAM6PMDDsOSBZGG
 be5SFvlDCqJAjMEAAEIAB0WIQTEOAw+ll79gQef86f6PaqMvJYe9QUCaAtrlgAKCRD6PaqMvJYe
 9XRtD/0Vlt0RZF3SZ4a0IoiOVh5MGJUjMfa6J5J0CtZfMjycoPZDgIMpXY2IjOL3O0mtJAxkqyr
 LGK2gpQDaygcz1YGJ1LLlkWewKckS/6MlI+BRK+9wvNko4ajEUx5udJWWFP72CjNw9yT9xacU7p
 pM+bBMqkAV6AHfZfxH8MzWkopo2KCQ4EgdsSuiK+S5nDPwiFfHcwUgwAAlIc7AT3zVoGFyv6fiv
 heipb0UH+t2z1IJOGES+kVxtP1vg3ADvS/Cs8jwdxwR1a9nziMKHPXghdTUtp++fwDVMv1gWu13
 SZFgcaEhMSZ6w831iHIxg1PXOujP7asP/98b50uVrujvV1ZaoPh6yGTsnFwk1XeOh4ZS814/5xE
 74GkFe0suv0b34IDeppqL6VpDvoypAgrQJ7xaR2Tqb9gFWuI2/g+xmyIpO6tG9B8vLQ2Su6gWRG
 W3qMkJKhrVTSxxM0IZ8fBef1O498qiFlu2D18jALs2cC3tVAip6pIJ9fdbF6K8hM5QvTYZfspsW
 uZPZvLoq2xxe76qHG8SX2HgzDd/HFTKDGBdODdR5Zl5RG+neP2SP/Dz1LzU/L5TXZDJaGnN0Uca
 O/A6/DQqxW0S3kzifyrzFLQ8Ap07Y8OG1/CKH3VvlLcc9JU7eDvPyYtxY93SiHUSW2SeHXgSKKI
 slCQ0lGEvucGxOg==
X-Developer-Key: i=tomi.valkeinen@ideasonboard.com; a=openpgp;
 fpr=C4380C3E965EFD81079FF3A7FA3DAA8CBC961EF5
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

Add new DRM pixel formats and add support for those in the Xilinx zynqmp
display driver.

All other formats except XVUY2101010 are already supported in upstream
gstreamer, but gstreamer's kmssink does not have the support yet, as it
obviously cannot support the formats without kernel having the formats.

Xilinx has support for these formats in their BSP kernel, and Xilinx has
a branch here, adding the support to gstreamer kmssink:

https://github.com/Xilinx/gst-plugins-bad.git xlnx-rebase-v1.18.5

New formats added:

DRM_FORMAT_Y8
- 8-bit Y-only
- fourcc: "GREY"
- gstreamer: GRAY8

DRM_FORMAT_Y10_P32
- 10-bit Y-only, three pixels packed into 32-bits
- fourcc: "YPA4"
- gstreamer: GRAY10_LE32

DRM_FORMAT_XV15
- Like NV12, but with 10-bit components
- fourcc: "XV15"
- gstreamer: NV12_10LE32

DRM_FORMAT_XV20
- Like NV16, but with 10-bit components
- fourcc: "XV20"
- gstreamer: NV16_10LE32

DRM_FORMAT_X403
- 10-bit planar 4:4:4, with three samples packed into 32-bits
- fourcc: "X403"
- gstreamer: Y444_10LE32

XVUY2101010
- 10-bit 4:4:4, one pixel in 32 bits
- fourcc: "XY30"

Some notes:

I know the 8-bit greyscale format has been discussed before, and the
guidance was to use DRM_FORMAT_R8. While I'm not totally against that, I
would argue that adding DRM_FORMAT_Y8 makes sense, as:

1) We can mark it as 'is_yuv' in the drm_format_info, and this can help
   the drivers handle e.g. full/limited range. Probably some hardware
   handles grayscale as a value used for all RGB components, in which case
   R8 makes sense, but when the hardware handles the Y-only pixels as YCbCr,
   where Cb and Cr are "neutral", it makes more sense to consider the
   format as an YUV format rather than RGB.

2) We can have the same fourcc as in v4l2. While not strictly necessary,
   it's a constant source of confusion when the fourccs differ.

3) It (possibly) makes more sense for the user to use Y8/GREY format
   instead of R8, as, in my experience, the documentation usually refers
   to gray(scale) format or Y-only format.

As we add new Y-only formats, it makes sense to have similar terms, so
we need to adjust the Y10_P32 format name accordingly.

I have made some adjustments to the formats compared to the Xilinx's
branch. E.g. The DRM_FORMAT_Y10_P32 format in Xilinx's kmssink uses
fourcc "Y10 ", and DRM_FORMAT_Y10. I didn't like those, as the format is
a packed format, three 10-bit pixels in a 32-bit container, and I think
Y10 means a 10-bit pixel in a 16-bit container.

Generally speaking, if someone has good ideas for the format define
names or fourccs, speak up, as it's not easy to invent good names =).
That said, keeping them the same as in the Xilinx trees will, of course,
be slightly easier for the users of Xilinx platforms.

I made WIP additions to modetest to support most of these formats,
partially based on Xilinx's code:

https://github.com/tomba/libdrm.git xilinx

A few thoughts about that:

modetest uses bo_create_dumb(), and as highlighted in recent discussions
in the kernel list [1], dumb buffers are only for RGB formats. They may
work for non-RGB formats, but that's platform specific. None of the
formats I add here are RGB formats. Do we want to go this way with
modetest?

I also feel that the current structure of modetest is not well suited to
more complicated formats. Both the buffer allocation is a bit more
difficult (see "Add virtual_width and pixels_per_container"), and the
drawing is complicated (see, e.g., "Add support for DRM_FORMAT_XV15 &
DRM_FORMAT_XV20").

I have recently added support for these Xilinx formats to both kms++ [2] and
pykms/pixutils [3][4] (WIP), and it's not been easy... But I have to say I
think I like the template based version in kms++. That won't work in
modetest, of course, but a non-templated version might be implementable,
but probably much slower.

In any case, I slighly feel it's not worth merging the modetest patches
I have for these formats: they complicate the code quite a bit, break
the RGB-only rule, and I'm not sure if there really are (m)any users. If
we want to add support to modetest, I think a bigger rewrite of the test
pattern code might be in order.

[1] https://lore.kernel.org/all/20250109150310.219442-26-tzimmermann%40suse.de/
[2] git@github.com:tomba/kmsxx.git xilinx
[3] git@github.com:tomba/pykms.git xilinx
[4] git@github.com:tomba/pixutils.git xilinx

Signed-off-by: Tomi Valkeinen <tomi.valkeinen@ideasonboard.com>
---
Changes in v5:
- Add comment about Y-only formats, clarifying how the display pipeline
  handles them (they're handled as YCbCr, with Cb and Cr as "neutral")
- Clarify X403 format in the patch description
- Set unused Y-only CSC offsets to 0 (instead of 0x1800).
- Add R-bs
- Link to v4: https://lore.kernel.org/r/20250326-xilinx-formats-v4-0-322a300c6d72@ideasonboard.com

Changes in v4:
- Reformat the drm_format_info entries a bit
- Calculate block size only once in drm_format_info_bpp()
- Declare local variables in separate lines
- Add review tags
- Fix commit message referring to Y10_LE32 (should be Y10_P32)
- Link to v3: https://lore.kernel.org/r/20250212-xilinx-formats-v3-0-90d0fe106995@ideasonboard.com

Changes in v3:
- Drop "drm: xlnx: zynqmp: Fix max dma segment size". It is already
  pushed.
- Add XVUY2101010 format.
- Rename DRM_FORMAT_Y10_LE32 to DRM_FORMAT_Y10_P32.
- Link to v2: https://lore.kernel.org/r/20250115-xilinx-formats-v2-0-160327ca652a@ideasonboard.com

Changes in v2:
- I noticed V4L2 already has fourcc Y10P, referring to MIPI-style packed
  Y10 format. So I changed Y10_LE32 fourcc to YPA4. If logic has any
  relevance here, P means packed, A means 10, 4 means "in 4 bytes".
- Added tags to "Fix max dma segment size" patch
- Updated description for "Add warning for bad bpp"
- Link to v1: https://lore.kernel.org/r/20241204-xilinx-formats-v1-0-0bf2c5147db1@ideasonboard.com

---
Tomi Valkeinen (11):
      drm/fourcc: Add warning for bad bpp
      drm/fourcc: Add DRM_FORMAT_XV15/XV20
      drm/fourcc: Add DRM_FORMAT_Y8
      drm/fourcc: Add DRM_FORMAT_Y10_P32
      drm/fourcc: Add DRM_FORMAT_X403
      drm/fourcc: Add DRM_FORMAT_XVUY2101010
      drm: xlnx: zynqmp: Use drm helpers when calculating buffer sizes
      drm: xlnx: zynqmp: Add support for XV15 & XV20
      drm: xlnx: zynqmp: Add support for Y8 and Y10_P32
      drm: xlnx: zynqmp: Add support for X403
      drm: xlnx: zynqmp: Add support for XVUY2101010

 drivers/gpu/drm/drm_fourcc.c       | 28 ++++++++++++++++---
 drivers/gpu/drm/xlnx/zynqmp_disp.c | 55 +++++++++++++++++++++++++++++++++++---
 include/uapi/drm/drm_fourcc.h      | 29 ++++++++++++++++++++
 3 files changed, 105 insertions(+), 7 deletions(-)
---
base-commit: ef6517ac5cf971cfeaccea4238d9da7e2425b8b1
change-id: 20241120-xilinx-formats-f71901621833

Best regards,
-- 
Tomi Valkeinen <tomi.valkeinen@ideasonboard.com>

