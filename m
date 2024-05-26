Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 5D9158CF522
	for <lists+dri-devel@lfdr.de>; Sun, 26 May 2024 19:57:26 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id DB57410E2A7;
	Sun, 26 May 2024 17:57:20 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (1024-bit key; unprotected) header.d=ti.com header.i=@ti.com header.b="yVTvSE13";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from fllv0016.ext.ti.com (fllv0016.ext.ti.com [198.47.19.142])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 92D3C10E2A7
 for <dri-devel@lists.freedesktop.org>; Sun, 26 May 2024 17:57:18 +0000 (UTC)
Received: from lelv0265.itg.ti.com ([10.180.67.224])
 by fllv0016.ext.ti.com (8.15.2/8.15.2) with ESMTP id 44QHuvZ3055262;
 Sun, 26 May 2024 12:56:57 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ti.com;
 s=ti-com-17Q1; t=1716746217;
 bh=7x5QJeZY2rdnnAQKrhfcOhJcGH4F2nkBoyn9SE/tYGU=;
 h=From:To:CC:Subject:Date;
 b=yVTvSE13f5Gn+8FQHGaopajGzuJ8BkEOII4wjIXU636N0nSJnJysNshFtii/rJ6ti
 3okVf9u6eMF0pHQfmK486oEnWGt779WMhcc31qH3M2D0Me2UGRjUi+bBZfhqKyW1Ih
 4LeOVQFCWmN6s5QHHt9Eewz2SUqp5mMgeRKMUac8=
Received: from DLEE101.ent.ti.com (dlee101.ent.ti.com [157.170.170.31])
 by lelv0265.itg.ti.com (8.15.2/8.15.2) with ESMTPS id 44QHuvCL009621
 (version=TLSv1.2 cipher=AES256-GCM-SHA384 bits=256 verify=FAIL);
 Sun, 26 May 2024 12:56:57 -0500
Received: from DLEE112.ent.ti.com (157.170.170.23) by DLEE101.ent.ti.com
 (157.170.170.31) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id 15.1.2507.23; Sun, 26
 May 2024 12:56:56 -0500
Received: from lelvsmtp5.itg.ti.com (10.180.75.250) by DLEE112.ent.ti.com
 (157.170.170.23) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id 15.1.2507.23 via
 Frontend Transport; Sun, 26 May 2024 12:56:56 -0500
Received: from localhost (ti.dhcp.ti.com [172.24.227.95] (may be forged))
 by lelvsmtp5.itg.ti.com (8.15.2/8.15.2) with ESMTP id 44QHuteW077438;
 Sun, 26 May 2024 12:56:56 -0500
From: Devarsh Thakkar <devarsht@ti.com>
To: <mchehab@kernel.org>, <robh@kernel.org>,
 <krzysztof.kozlowski+dt@linaro.org>, <conor+dt@kernel.org>,
 <hverkuil-cisco@xs4all.nl>, <linux-media@vger.kernel.org>,
 <devicetree@vger.kernel.org>, <linux-kernel@vger.kernel.org>,
 <benjamin.gaignard@collabora.com>, <sebastian.fricke@collabora.com>
CC: <laurent.pinchart@ideasonboard.com>, <praneeth@ti.com>, <nm@ti.com>,
 <vigneshr@ti.com>, <a-bhatia1@ti.com>, <j-luthra@ti.com>,
 <b-brnich@ti.com>, <detheridge@ti.com>, <p-mantena@ti.com>,
 <vijayp@ti.com>, <devarsht@ti.com>, <andrzej.p@collabora.com>,
 <nicolas@ndufresne.ca>, <akpm@linux-foundation.org>,
 <gregkh@linuxfoundation.org>, <andriy.shevchenko@linux.intel.com>,
 <adobriyan@gmail.com>, <p.zabel@pengutronix.de>, <airlied@gmail.com>,
 <daniel@ffwll.ch>, <jani.nikula@intel.com>,
 <dri-devel@lists.freedesktop.org>,
 <linux-rockchip@lists.infradead.org>, <davidgow@google.com>,
 <dlatypov@google.com>
Subject: [PATCH v9 00/10] Add V4L2 M2M Driver for E5010 JPEG Encoder
Date: Sun, 26 May 2024 23:26:55 +0530
Message-ID: <20240526175655.1093707-1-devarsht@ti.com>
X-Mailer: git-send-email 2.39.1
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-EXCLAIMER-MD-CONFIG: e1e8a2fd-e40a-4ac6-ac9b-f7e9cc9ee180
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

This adds support for V4L2 M2M based driver for E5010 JPEG Encoder
which is a stateful JPEG encoder from Imagination technologies
and is present in TI AM62A SoC.

While adding support for it, following additional framework changes were
made:
 - Moved reference quantization and huffman tables provided in
   ITU-T-REC-T.81 to v4l2-jpeg.c as suggested in mailing list [1].
 - Add macros to round to closest integer (either higher or lower) while
   rounding in order of 2.
 - Add KUnit tests for math functions.

v4l2-compliance test :
Link: https://gist.github.com/devarsht/1f039c631ca953a57f405cfce1b69e49

E5010 JPEG Encoder Manual tests :

Performance:
Link: https://gist.github.com/devarsht/c40672944fd71c9a53ab55adbfd9e28b

Functionality:
Link: https://gist.github.com/devarsht/8e88fcaabff016bb2bac83d89c9d23ce

Compression Quality:
Link: https://gist.github.com/devarsht/cbcc7cd97e8c48ba1486caa2b7884655

Multi Instance:
Link: https://gist.github.com/devarsht/22c2fca08cd3441fb40f2c7a4cebc95a

Crop support:
Link: https://gist.github.com/devarsht/de6f5142f678bb1a5338abfd9f814abd

Runtime PM:
Link: https://gist.github.com/devarsht/70cd95d4440ddc678489d93885ddd4dd

Math lib KUnit tests:
Link: https://gist.github.com/devarsht/3f9042825be3da4e133b8f4eda067876

[1]: 
https://lore.kernel.org/all/de46aefe-36da-4e1a-b4fa-b375b2749181@xs4all.nl/

Changelog:
V8->V9:
 - Remove kernel.h header file
 - Remove stale filler data on jpeg header in E5010 jpeg driver

V7->V8:
 - Add KUnit tests for math functions
 - Add roundclosest() for supporting rounding for non-multiple of 2
 - Update commit message as suggested
 - Add Reviewed-by and Acked-by tags to patches as received

V6->V7:
 - Fix cropping support
 - Move reference huffman and quantization tables to v4l2-jpeg.c
 - Fix suspend/resume use-case
 - Add Reviewed-by

V5->V6:
 - Fix sparse warnings

V4->V5:
 - Sort the #includes in driver file alphabetically
 - Rename huffman and quantization tables to not use '_'
 - Add Reviewed-by tag

V3->V4:
- Use ti-specific compatible ti,am62a-jpeg-enc as secondary one in
  dt-binding
- Remove clock-names as only single clock in dt-binding
- Fix issue with default params setting
- Correct v4l2 error prints
- Simplify register write functions with single statement return values
- Remove unrequired error checks from get_queue()
- Drop explicit device_caps setting as it is already taken care by v4l2
  core
- Remove unrequired multiplanar checks and memset from s_fmt, g_fmt
  callback functions
- Fix try_fmt callback to not update the queues
- Remove unrequired contiguous format attribute from queue_init
- Use dynamic allocation for video_device and remove unrequired
  assignments in probe()
- Remove unrequired checks from queue_setup function
- Return queued buffers back if start_streaming fails
- Use ARRAY_SIZE in place of hard-coding
- Use huffman and quantization tables from reference header file

V2->V3:
- Add DONOTMERGE patches for dts and defconfig
- Update driver with below changes :
  - Correct license headers
  - Use more generic name core instead of jasper for base registers
  - Add Comment for forward declarations
  - Simplify quantization table calculations
  - Use v4l2_apply_frmsize_constraints for updating framesize and remove
    unrequired functions
  - Place TODO at top of file and in commit message too
  - Use dev_err_probe helper in probe function
  - Fix return value checking for failure scenarios in probe function
  - Use v4l2_err/info/warn helpers instead of dev_err/info/warn helpers
  - Fix unexpected indentation
  - Correct commit message
- Update dt-bindings with below changes :
  - Add vendor specific compatible 
  - Fix commit title and message
  - Update reg names
  - Update clocks to 1
  - Fix dts example with proper naming

V1->V2:
 - Send dt-bindings and driver together

Patch-Diff between the series :
V8->V9 Range diff :
https://gist.github.com/devarsht/3fd6c4e8031ab114248f93d01c8dfc74

V7->V8 Range diff :
https://gist.github.com/devarsht/3fd6c4e8031ab114248f93d01c8dfc74

V6->V7 Range diff :
https://gist.github.com/devarsht/1db185b1e187eaf397e9e4c37066777e

V5->V6 Range diff :
https://gist.github.com/devarsht/c89180ac2b0d2814614f2b59d0705c19

V4->V5 Range diff :
https://gist.github.com/devarsht/298790af819f299a0a05fec89371097b

V3->V4 Range diff :
https://gist.github.com/devarsht/22a744d999080de6e813bcfb5a596272

Previous patch series:
V8: https://lore.kernel.org/all/20240517171532.748684-1-devarsht@ti.com/
V7: https://lore.kernel.org/all/20240510082603.1263256-1-devarsht@ti.com/
V6: https://lore.kernel.org/all/20240228141140.3530612-1-devarsht@ti.com/
V5: https://lore.kernel.org/all/20240215134641.3381478-1-devarsht@ti.com/
V4: https://lore.kernel.org/all/20240205114239.924697-1-devarsht@ti.com/
V3: https://lore.kernel.org/all/20230816152210.4080779-1-devarsht@ti.com/
V2: https://lore.kernel.org/all/20230727112546.2201995-1-devarsht@ti.com/

Daniel Latypov (1):
  lib: add basic KUnit test for lib/math

Devarsh Thakkar (9):
  media: dt-bindings: Add Imagination E5010 JPEG Encoder
  media: imagination: Add E5010 JPEG Encoder driver
  media: v4l2-jpeg: Export reference quantization and huffman tables
  media: imagination: Use exported tables from v4l2-jpeg core
  media: verisilcon : Use exported tables from v4l2-jpeg for hantro
    codec
  math.h: Add macros for rounding to closest value
  lib: math_kunit: Add tests for new macros related to rounding to
    nearest value
  media: imagination: Round to closest multiple for cropping region
  gpu: ipu-v3: Use generic macro for rounding closest to specified value

 .../bindings/media/img,e5010-jpeg-enc.yaml    |   75 +
 MAINTAINERS                                   |    7 +
 drivers/gpu/ipu-v3/ipu-image-convert.c        |    4 +-
 drivers/media/platform/Kconfig                |    1 +
 drivers/media/platform/Makefile               |    1 +
 drivers/media/platform/imagination/Kconfig    |   12 +
 drivers/media/platform/imagination/Makefile   |    3 +
 .../platform/imagination/e5010-core-regs.h    |  585 ++++++
 .../platform/imagination/e5010-jpeg-enc-hw.c  |  267 +++
 .../platform/imagination/e5010-jpeg-enc-hw.h  |   42 +
 .../platform/imagination/e5010-jpeg-enc.c     | 1644 +++++++++++++++++
 .../platform/imagination/e5010-jpeg-enc.h     |  168 ++
 .../platform/imagination/e5010-mmu-regs.h     |  311 ++++
 .../media/platform/verisilicon/hantro_jpeg.c  |  128 +-
 drivers/media/v4l2-core/v4l2-jpeg.c           |  162 +-
 include/linux/math.h                          |   65 +
 include/media/v4l2-jpeg.h                     |   11 +
 lib/math/Kconfig                              |   11 +
 lib/math/Makefile                             |    1 +
 lib/math/math_kunit.c                         |  325 ++++
 20 files changed, 3705 insertions(+), 118 deletions(-)
 create mode 100644 Documentation/devicetree/bindings/media/img,e5010-jpeg-enc.yaml
 create mode 100644 drivers/media/platform/imagination/Kconfig
 create mode 100644 drivers/media/platform/imagination/Makefile
 create mode 100644 drivers/media/platform/imagination/e5010-core-regs.h
 create mode 100644 drivers/media/platform/imagination/e5010-jpeg-enc-hw.c
 create mode 100644 drivers/media/platform/imagination/e5010-jpeg-enc-hw.h
 create mode 100644 drivers/media/platform/imagination/e5010-jpeg-enc.c
 create mode 100644 drivers/media/platform/imagination/e5010-jpeg-enc.h
 create mode 100644 drivers/media/platform/imagination/e5010-mmu-regs.h
 create mode 100644 lib/math/math_kunit.c

-- 
2.39.1

