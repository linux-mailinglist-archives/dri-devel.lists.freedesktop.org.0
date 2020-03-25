Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 3A988192320
	for <lists+dri-devel@lfdr.de>; Wed, 25 Mar 2020 09:50:34 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 5B3578954A;
	Wed, 25 Mar 2020 08:50:31 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-wr1-x441.google.com (mail-wr1-x441.google.com
 [IPv6:2a00:1450:4864:20::441])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 8AE148954A
 for <dri-devel@lists.freedesktop.org>; Wed, 25 Mar 2020 08:50:30 +0000 (UTC)
Received: by mail-wr1-x441.google.com with SMTP id w10so1832105wrm.4
 for <dri-devel@lists.freedesktop.org>; Wed, 25 Mar 2020 01:50:30 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=baylibre-com.20150623.gappssmtp.com; s=20150623;
 h=from:to:cc:subject:date:message-id:mime-version
 :content-transfer-encoding;
 bh=WoXHfuXYzc7+p6uA7OR0OLG4JPoyNaGh9u2qRQoG7QA=;
 b=klP7C+QxkpkwvekqXQb/Ju4yyTjbf+2WirsTFD+RvppuVSgw8RLF4oDkiJV5Vk4lMd
 xqXSWWCekWRsLvvY6YJd8ek781hrgVRUnrwPML6G++2ZxVBfd7aiFZY/dnxdJCZ1Alz/
 C3xF4AHS7bnfY5t5mSinwvd8ZGuwTBNPL142jGG5FwxBD6S0Mj0AhGVekurjgwDehbwx
 wTAti/zk4YsU/j2wJHyfzaT8sKWSpFa4nF0dUBGhV5rwRSVH34qF7ROPfO/SZrYiB+Wj
 SpjhV6zueQA3Spsi+OJoE82nK0zOOYF9+7m+1eEFFf6hIXTT0bQHCmzUzl3wcxdSVZEm
 rQtA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:mime-version
 :content-transfer-encoding;
 bh=WoXHfuXYzc7+p6uA7OR0OLG4JPoyNaGh9u2qRQoG7QA=;
 b=WFlz5ApYHJzfNDpYI6Fb5P8HZNX2OH4ZeCfpXS54nR4OxWCKES0O00kZmsyrP5ttXD
 ke3Ly/KJ4JrVoJe9rqS7Lau/Tn1nCfLR3KjvfM1SLHbiFIP0hbDfxiiwJ2CnEXUj9aJS
 AYXt0zI9jQT6hkM0Db2ixZK118PfqyBsw6i7YQhYMkfi2Sz6L18Ml2mAeBN4jr3q99l0
 nyWT9AiyzU9ysXYHyhnyKAa1/IwQE6UQohNZv00KAuIffheZa8M9qab5z6Vej32wQhzh
 +Pm6fziy/vrHIqfCqpxuIXGgOZxKq8sUbgtT9wUphMFUTAVU8cmD4QcYFpuZ9ZuIfOeG
 MUTg==
X-Gm-Message-State: ANhLgQ0ifew8z2LdQmUH0QsKP4VBZwPsxwF5GldgmzSxd1LnMNoZ1TWu
 aDpkKt3JixXOtjzCPNpa6S7B2g==
X-Google-Smtp-Source: ADFU+vvN8eNsV/lG7CyAMfmUF+xPvxc5unukjUQek0cvYyrrZYY7nWzlFjHzEeIz6hgWFSoiPKW9XA==
X-Received: by 2002:a5d:630e:: with SMTP id i14mr2218077wru.260.1585126229049; 
 Wed, 25 Mar 2020 01:50:29 -0700 (PDT)
Received: from bender.baylibre.local ([2a01:e35:2ec0:82b0:5c5f:613e:f775:b6a2])
 by smtp.gmail.com with ESMTPSA id o16sm33892229wrs.44.2020.03.25.01.50.27
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Wed, 25 Mar 2020 01:50:28 -0700 (PDT)
From: Neil Armstrong <narmstrong@baylibre.com>
To: daniel@ffwll.ch,
	dri-devel@lists.freedesktop.org
Subject: [PATCH v4 0/8] drm/meson: add support for Amlogic Video FBC
Date: Wed, 25 Mar 2020 09:50:17 +0100
Message-Id: <20200325085025.30631-1-narmstrong@baylibre.com>
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
Cc: mjourdan@baylibre.com, Neil Armstrong <narmstrong@baylibre.com>,
 linux-kernel@vger.kernel.org, linux-amlogic@lists.infradead.org,
 linux-arm-kernel@lists.infradead.org
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

Neil Armstrong (8):
  drm/fourcc: Add modifier definitions for describing Amlogic Video
    Framebuffer Compression
  drm/meson: add Amlogic Video FBC registers
  drm/meson: overlay: setup overlay for Amlogic FBC
  drm/meson: crtc: handle commit of Amlogic FBC frames
  drm/fourcc: amlogic: Add modifier definitions for Memory Saving option
  drm/meson: overlay: setup overlay for Amlogic FBC Memory Saving mode
  drm/fourcc: amlogic: Add modifier definitions for the Scatter layout
  drm/meson: overlay: setup overlay for Amlogic FBC Scatter Memory
    layout

 drivers/gpu/drm/meson/meson_crtc.c      | 118 ++++++++---
 drivers/gpu/drm/meson/meson_drv.h       |  16 ++
 drivers/gpu/drm/meson/meson_overlay.c   | 257 +++++++++++++++++++++++-
 drivers/gpu/drm/meson/meson_registers.h |  22 ++
 include/uapi/drm/drm_fourcc.h           |  66 ++++++
 5 files changed, 441 insertions(+), 38 deletions(-)

-- 
2.22.0

_______________________________________________
dri-devel mailing list
dri-devel@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/dri-devel
