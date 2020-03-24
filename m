Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 6BDB81912AC
	for <lists+dri-devel@lfdr.de>; Tue, 24 Mar 2020 15:20:31 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 7218C895E7;
	Tue, 24 Mar 2020 14:20:26 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-wr1-x443.google.com (mail-wr1-x443.google.com
 [IPv6:2a00:1450:4864:20::443])
 by gabe.freedesktop.org (Postfix) with ESMTPS id D437A895E7
 for <dri-devel@lists.freedesktop.org>; Tue, 24 Mar 2020 14:20:24 +0000 (UTC)
Received: by mail-wr1-x443.google.com with SMTP id 31so15640114wrs.3
 for <dri-devel@lists.freedesktop.org>; Tue, 24 Mar 2020 07:20:24 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=baylibre-com.20150623.gappssmtp.com; s=20150623;
 h=from:to:cc:subject:date:message-id:mime-version
 :content-transfer-encoding;
 bh=Pb0nOXTsvfnsHlBe6h+96Sc/Y2vhw/oF3Rb7LgSL9sA=;
 b=rsqJnKuHuJQAYKkoP4MLaf+A11zN64qwqgkLFd3IWiVck21lSHX1ysKm/r30C/khku
 OVyPTf6lqP9Qpei8+lcLVc5pah1ULccIygs7LUSwT1020WvjwlGCYQYBU+BtX0whmHed
 ujnq4xAzQk4jzQCvis3sCQtC7fadrvw4lUtVS2YjRcPjDwnrLOOAYAxGXVJatcl2n98V
 CML/eF/8FdwfbJSZFfG6OPXKHNqgAhdGz3gRS3+wLmbXFKl7tnD4+C22jcgOk7YHFnSD
 DqpB+nqm/M+YwkBzyeq8Slsg2EsuiwS96qjd7ey4QJDLDPmstzzjkrnNLx8NkstHD2S/
 YdGA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:mime-version
 :content-transfer-encoding;
 bh=Pb0nOXTsvfnsHlBe6h+96Sc/Y2vhw/oF3Rb7LgSL9sA=;
 b=AuyuCQexVfPUUYTfSmuTu7Air749te/svja4LEC3Ny4YJe0UxUT3Hbin12u0I2KUUE
 r8He02DZNc8IzorlDdvglUHDsfFUuiXMTNr9MO++yE5W52Y8ZTewKCB67QiHZcaVY/4+
 0T9xANyVllHQ4uvC5BlX/QHoSEH6z6HLMihUO87eTdKyUfGZKsUqrbgebe5ZM08lhIG6
 zIVgH2aazpj4o6NzQAI+zr9gacvI6vgnZZEz6+MWHF3G7GYXe9ewvngL5dnP2MawZvSe
 ek6NeVCw0YCqcHrxHNNe9t0cmbGkIB6z5lLxIigG8v0QBeRUG8cNob7Br/si7j8g58Up
 TQHw==
X-Gm-Message-State: ANhLgQ3n6OzuOEp5ZNBvI+uPJkOfyhsOzE1siwuQKqJqf/e3Fz1ZQ1bv
 3ashIVQlSnEgiqH2+7K8yeZZmg==
X-Google-Smtp-Source: ADFU+vtcO35jlay/gxVcEpkyIV7bq9dlC30QrfhSlVYiFA9hMEECf/zlJKLj8mUQKhkft+409j05Jw==
X-Received: by 2002:adf:fe4c:: with SMTP id m12mr37764304wrs.96.1585059623310; 
 Tue, 24 Mar 2020 07:20:23 -0700 (PDT)
Received: from bender.baylibre.local ([2a01:e35:2ec0:82b0:5c5f:613e:f775:b6a2])
 by smtp.gmail.com with ESMTPSA id o4sm28688472wrp.84.2020.03.24.07.20.22
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Tue, 24 Mar 2020 07:20:22 -0700 (PDT)
From: Neil Armstrong <narmstrong@baylibre.com>
To: daniel@ffwll.ch,
	dri-devel@lists.freedesktop.org
Subject: [PATCH v3 0/7] drm/meson: add support for Amlogic Video FBC
Date: Tue, 24 Mar 2020 15:20:09 +0100
Message-Id: <20200324142016.31824-1-narmstrong@baylibre.com>
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

Neil Armstrong (7):
  drm/fourcc: Add modifier definitions for describing Amlogic Video
    Framebuffer Compression
  drm/meson: add Amlogic Video FBC registers
  drm/meson: overlay: setup overlay for Amlogic FBC
  drm/meson: crtc: handle commit of Amlogic FBC frames
  drm/fourcc: amlogic: Add modifier definitions for Memory Saving option
  drm/meson: overlay: setup overlay for Amlogic FBC Memory Saving mode
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
