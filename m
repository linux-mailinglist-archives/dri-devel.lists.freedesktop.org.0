Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id D5F2A1E8181
	for <lists+dri-devel@lfdr.de>; Fri, 29 May 2020 17:19:44 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id EE7E46E92D;
	Fri, 29 May 2020 15:19:41 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-wr1-x443.google.com (mail-wr1-x443.google.com
 [IPv6:2a00:1450:4864:20::443])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 9C7DE6E92D
 for <dri-devel@lists.freedesktop.org>; Fri, 29 May 2020 15:19:40 +0000 (UTC)
Received: by mail-wr1-x443.google.com with SMTP id q11so4120827wrp.3
 for <dri-devel@lists.freedesktop.org>; Fri, 29 May 2020 08:19:40 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=baylibre-com.20150623.gappssmtp.com; s=20150623;
 h=from:to:cc:subject:date:message-id:mime-version
 :content-transfer-encoding;
 bh=a1VA2cI3luBKl+1A9IqPQvaPilBfCEdbV/wVG2oiOog=;
 b=EXNwcZV8afVOfwzR4c0U8MUyODazMaEzwEvIGyp3wVLivLkT1MDmIj4zdnjkv+V4gc
 YaVyk8iluliw3t6wieJTWQp7lWEPezY0040mBRcatrwpxJLKHMbNeAth47OtzPlHExME
 gDTHrm6QR/aBITo4qcv10f+0aYIg9heADIMrw4UyWU8E1WlcFtjSLuZPRAOLFs66gwZy
 rqCL2eMvJnXWAkAoAkBK1e3cLmGsj42oZd0o60FE9FxP+BdWYyo+4SlC0pB0zu7Pmwqr
 LT/AGulEftv1BEHhCHFHR4JSzXv/1JjLJXMn6LLE7qTjxQsza7a32LZuW/L6T7sz9GFc
 xd3Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:mime-version
 :content-transfer-encoding;
 bh=a1VA2cI3luBKl+1A9IqPQvaPilBfCEdbV/wVG2oiOog=;
 b=IDcqB4O7rFDCfoSb6G96Fp+duJJc1uQuPKHA5zo8uyyxq/1bFlt9MZgTPpRgccxm6q
 GP/KzkcrejyhV9QBjxahKLeUVeKkVhqKe5ARLOBu34Tm6zLLatRcOhYLoDUO/Zw95HcY
 HCAjKKtB9cq/1sV4AVB9sVuCNuYwNvHi/cT52fyoPjYQ4U+Yc1CmSfDsLsjbOxjwbQYA
 shn8YOZ0uON38jO2WSUhfIjtuI3ryxaNPXEkyVA8TqP3aFLzI6+t8SKdbZZ3XS12SrUV
 0JwllJrIcx8foP+xk73Chs1yfkKHV1oNo3WeYasrBZ2caHFppqnhdUrtoNXrevVN/f9a
 uChw==
X-Gm-Message-State: AOAM531A4nh2i8shw5gSeWXURqQOM628yDeyghfBnk/BfnRWt9MEhq3f
 9v+q+hoZk7vSiU5lw6tIcagPpg==
X-Google-Smtp-Source: ABdhPJzQPebNNU06xppIc8ZCSKYkvgk6OTr93lLpMRDtFo/HVqX1vFcPCRezXTfa9vkCVSmurfLytQ==
X-Received: by 2002:a5d:4cd1:: with SMTP id c17mr9093962wrt.199.1590765579103; 
 Fri, 29 May 2020 08:19:39 -0700 (PDT)
Received: from localhost.localdomain ([2a01:e35:2ec0:82b0:acf8:18a8:b3a5:a17b])
 by smtp.gmail.com with ESMTPSA id x66sm9220421wmb.40.2020.05.29.08.19.37
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Fri, 29 May 2020 08:19:38 -0700 (PDT)
From: Neil Armstrong <narmstrong@baylibre.com>
To: daniel@ffwll.ch,
	dri-devel@lists.freedesktop.org
Subject: [PATCH v7 0/6] drm/meson: add support for Amlogic Video FBC
Date: Fri, 29 May 2020 17:19:29 +0200
Message-Id: <20200529151935.13418-1-narmstrong@baylibre.com>
X-Mailer: git-send-email 2.22.0
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
Cc: linux-amlogic@lists.infradead.org, linux-kernel@vger.kernel.org,
 linux-arm-kernel@lists.infradead.org, Neil Armstrong <narmstrong@baylibre.com>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

Amlogic uses a proprietary lossless image compression protocol and format
for their hardware video codec accelerators, either video decoders or
video input encoders.

It considerably reduces memory bandwidth while writing and reading
frames in memory.

The underlying storage is considered to be 3 components, 8bit or 10-bit
per component, YCbCr 420, single plane :
- DRM_FORMAT_YUV420_8BIT
- DRM_FORMAT_YUV420_10BIT

This modifier will be notably added to DMA-BUF frames imported from the V4L2
Amlogic VDEC decoder.

At least two layout are supported :
- Basic: composed of a body and a header
- Scatter: the buffer is filled with a IOMMU scatter table referring
  to the encoder current memory layout. This mode if more efficient in terms
  of memory allocation but frames are not dumpable and only valid during until
  the buffer is freed and back in control of the encoder

At least two options are supported :
- Memory saving: when the pixel bpp is 8b, the size of the superblock can
  be reduced, thus saving memory.

This serie adds the missing register, updated the FBC decoder registers
content to be committed by the crtc code.

The Amlogic FBC has been tested with compressed content from the Amlogic
HW VP9 decoder on S905X (GXL), S905D2 (G12A) and S905X3 (SM1) in 8bit
(Scatter+Mem Saving on G12A/SM1, Mem Saving on GXL) and 10bit
(Scatter on G12A/SM1, default on GXL).

It's expected to work as-is on GXM and G12B SoCs.

Changes since v6 at [6]:
- rebased on drm-misc-next (after drm-misc-next-2020-05-14)
- updated patch 1 commit log for completion

Changes since v5 at [5]:
- merged all fourcc patches in 1
- fixed fourcc definition to have only a single DRM_MOD_
- fixed 2 checkpatch issues

Changes since v4 at [4]:
- added layout and options mask
- cosmetic changes in fourcc.h
- fixed mod check using the masks
- fixed plane apply using the masks

Changes since v3 at [3]:
- added dropped fourcc patch for scatter
- fixed build of last patch

Changes since v2 at [2]:
- Added "BASIC" layout and moved the SCATTER mode as layout, making
  BASIC and SCATTER layout exclusives
- Moved the Memory Saving at bit 8 for options fields
- Split fourcc and overlay patch to introduce basic, mem saving and then
  scatter in separate patches
- Added comment about "transferability" of the buffers

Changes since v1 at [1]:
- s/VD1_AXI_SEL_AFB/VD1_AXI_SEL_AFBC/ into meson_registers.h

[1] https://patchwork.freedesktop.org/series/73722/#rev1
[2] https://patchwork.freedesktop.org/series/73722/#rev2
[3] https://patchwork.freedesktop.org/series/73722/#rev3
[4] https://patchwork.freedesktop.org/series/73722/#rev4
[5] https://patchwork.freedesktop.org/series/73722/#rev5
[6] https://patchwork.freedesktop.org/series/73722/#rev6

Neil Armstrong (6):
  drm/fourcc: Add modifier definitions for describing Amlogic Video
    Framebuffer Compression
  drm/meson: add Amlogic Video FBC registers
  drm/meson: overlay: setup overlay for Amlogic FBC
  drm/meson: overlay: setup overlay for Amlogic FBC Memory Saving mode
  drm/meson: overlay: setup overlay for Amlogic FBC Scatter Memory
    layout
  drm/meson: crtc: handle commit of Amlogic FBC frames

 drivers/gpu/drm/meson/meson_crtc.c      | 118 +++++++---
 drivers/gpu/drm/meson/meson_drv.h       |  16 ++
 drivers/gpu/drm/meson/meson_overlay.c   | 290 +++++++++++++++++++++++-
 drivers/gpu/drm/meson/meson_registers.h |  22 ++
 include/uapi/drm/drm_fourcc.h           |  74 ++++++
 5 files changed, 482 insertions(+), 38 deletions(-)

-- 
2.22.0

_______________________________________________
dri-devel mailing list
dri-devel@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/dri-devel
