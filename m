Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 2462B2135CA
	for <lists+dri-devel@lfdr.de>; Fri,  3 Jul 2020 10:07:44 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id EDE516EA0E;
	Fri,  3 Jul 2020 08:07:39 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-wr1-x441.google.com (mail-wr1-x441.google.com
 [IPv6:2a00:1450:4864:20::441])
 by gabe.freedesktop.org (Postfix) with ESMTPS id F10D46EA12
 for <dri-devel@lists.freedesktop.org>; Fri,  3 Jul 2020 08:07:38 +0000 (UTC)
Received: by mail-wr1-x441.google.com with SMTP id s10so31647862wrw.12
 for <dri-devel@lists.freedesktop.org>; Fri, 03 Jul 2020 01:07:38 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=baylibre-com.20150623.gappssmtp.com; s=20150623;
 h=from:to:cc:subject:date:message-id:mime-version
 :content-transfer-encoding;
 bh=c1TNzycKuUCG/Lpw8LCZ7YtLXjAvDFp2TFsGPUACq2s=;
 b=s0Mz/Wdq8iqu3dPfohf7u7IAcdckwYBi+DxKcwrRE4abFYeLQqdL+pBXBr4ow5g9cq
 3n8fkCLWPAbRJ/wTcif1Iv8lrF2TD7HwYVov6GvAh3CNLk39Sme8m26ckcqGhUnkn6Bn
 VZF4v5m3IpLhAUmGAoBdpDq2DdhnkWO5x2+R/s4xz68MmnHXJ1yDy2Jb9U+wKO+SX+7g
 SXMozQhnUH5lOON2n3f2IlmKZNCC16CkEW7qxClyJ6/zaUmnUJ/yBIM2fXaUru47gjyV
 vwSuqsxqUeNitO+JKHdCp2N2h8vZ292KsnBh+XdsYxhz4KSX//OyJzLvbOzJMAGHP8mq
 Oc+Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:mime-version
 :content-transfer-encoding;
 bh=c1TNzycKuUCG/Lpw8LCZ7YtLXjAvDFp2TFsGPUACq2s=;
 b=rrtIYrg8+hcsKVa08OsZ9vi0Vg8IvdACCLZ6zsgHSIdAY6U2HdYoNK6XDHtzYqzAs+
 AQVL9MqF28/F226xqpeSECYW4+PnZkxFEHRK42QLdudbbMhbESCYpA6ZpW5Gc1SQLq2O
 ZDhF74JoLPbOpToVJMsJ5ZWv0xG8VvNXG9HjsnPZdRgdNdyGgH3lTQh2iSKx6eUZ4RGN
 rLWrZGTOfwEI93daCVpFeWPcQPi/726QGn52Hjp3/JEjf9QBB/Y2Q4TCFGGT+J8t9OVW
 PKWWjCXWc9aNiR2WTIMVbvg0dB4bXPLvW+OAKCRk4mfrNTPg53J48/MTkuvlAWX1nBxu
 +kSg==
X-Gm-Message-State: AOAM5325Gu26qs7zT4q0AgKrvuPgJbdx1iQu9l6jz/NGUtGjc52EqfY/
 nHS9F/NxyB7HwtTj58+ibPVQfw==
X-Google-Smtp-Source: ABdhPJyg7KEBrWbXbNhkwuxhamaT+87wYHYXZdWBW6ZFOSDlt0fJRgbFVLhpqyvx5pqYzjUvi5GUlQ==
X-Received: by 2002:adf:e40e:: with SMTP id g14mr38512820wrm.271.1593763657349; 
 Fri, 03 Jul 2020 01:07:37 -0700 (PDT)
Received: from bender.baylibre.local ([2a01:e35:2ec0:82b0:6959:e617:6562:cabf])
 by smtp.gmail.com with ESMTPSA id 1sm12682403wmf.0.2020.07.03.01.07.36
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Fri, 03 Jul 2020 01:07:36 -0700 (PDT)
From: Neil Armstrong <narmstrong@baylibre.com>
To: daniel@ffwll.ch,
	dri-devel@lists.freedesktop.org
Subject: [PATCH v9 0/6] drm/meson: add support for Amlogic Video FBC
Date: Fri,  3 Jul 2020 10:07:22 +0200
Message-Id: <20200703080728.25207-1-narmstrong@baylibre.com>
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
 linux-arm-kernel@lists.infradead.org, jianxin.pan@amlogic.com,
 Neil Armstrong <narmstrong@baylibre.com>
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

Changes since v8 at [8]:
- added clarification of scatter mmap behavior as suggested by daniel
- added ack and review tags

Changes since v7 at [7]:
- rebased on drm-misc-next
- removed spurious DEBUG in drivers/gpu/drm/meson/meson_overlay.c

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
[7] https://patchwork.freedesktop.org/series/73722/#rev7
[7] https://patchwork.freedesktop.org/series/73722/#rev8

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
 drivers/gpu/drm/meson/meson_overlay.c   | 289 +++++++++++++++++++++++-
 drivers/gpu/drm/meson/meson_registers.h |  22 ++
 include/uapi/drm/drm_fourcc.h           |  81 +++++++
 5 files changed, 488 insertions(+), 38 deletions(-)

-- 
2.22.0

_______________________________________________
dri-devel mailing list
dri-devel@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/dri-devel
