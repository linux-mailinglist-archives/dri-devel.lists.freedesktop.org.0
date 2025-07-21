Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 868DCB0BF4E
	for <lists+dri-devel@lfdr.de>; Mon, 21 Jul 2025 10:46:12 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 1451E10E4A4;
	Mon, 21 Jul 2025 08:46:03 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=gmail.com header.i=@gmail.com header.b="gHgC4z8v";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-pl1-f171.google.com (mail-pl1-f171.google.com
 [209.85.214.171])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 9B83210E248
 for <dri-devel@lists.freedesktop.org>; Mon, 21 Jul 2025 03:01:09 +0000 (UTC)
Received: by mail-pl1-f171.google.com with SMTP id
 d9443c01a7336-23636167b30so33649475ad.1
 for <dri-devel@lists.freedesktop.org>; Sun, 20 Jul 2025 20:01:09 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20230601; t=1753066869; x=1753671669; darn=lists.freedesktop.org;
 h=cc:to:content-transfer-encoding:mime-version:message-id:date
 :subject:from:from:to:cc:subject:date:message-id:reply-to;
 bh=kP6DtfLcjEFW0sJ0juaz2BmJKAUOX7mLl5N7KYvqwqQ=;
 b=gHgC4z8vmRgerpgE5hPmgLv0f2jSs4kTghL8azQb+zGfLAipg7Ab8yZHT8JRySnGWP
 yBE/otRMlW0SDTA0DAksWsl0k8d+kzYQj9946LaRbUzMwlat3niRbhhIIt9lmjqx3PS+
 yJX4n3VcVfTvAX4cqd6eD3mC+yhw+FLTqIhDBCTZKaeQkLM8O0xkakPD0qLfmGAcZvzs
 CrZ3idFw3i3iGiEfAsYYZRyUvfg/HwnQ7ldGFRi/vMMVBEf0IrjVbAM0N4OZW5xg+F23
 +gNr891WEMkemrFfIZvG/Ex2u/yUb9rnfEag41fJk6GQktRBPhNdTWdY6zjNATwf/dGB
 8B/Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1753066869; x=1753671669;
 h=cc:to:content-transfer-encoding:mime-version:message-id:date
 :subject:from:x-gm-message-state:from:to:cc:subject:date:message-id
 :reply-to;
 bh=kP6DtfLcjEFW0sJ0juaz2BmJKAUOX7mLl5N7KYvqwqQ=;
 b=nH55mARmOzkcW7Dw5GzwXe4q75ItlgmghF9ldhsoQyDjRXvtU6SuaBgOdBbCuVr28L
 RMQBhGr/zGNS6mZmh7dWg73M8GuvrHhBQPAyCcmogYgZuxw8iis6MiXKk2g3aIHsoew0
 zwjSkGEpbxnOXLwqtg+6pRHCOpJq7Upd+YYNrEcEEAT2Bbg8GMJJSaZC2pyFD9rxC8k7
 8WzYAnPmqmuoXk+RVm9bEa14DzjqJbh+rqm6Gnhb2Iz6VsUe7kIQ1aN0jVeIt6nSWITP
 GghtwIRr6rZ4iAgtY4YuDsavzKCPt0ClgSiEkWT7JO+rUMEG5eyS0rIRvh5iFmnra5R8
 tmWw==
X-Forwarded-Encrypted: i=1;
 AJvYcCVAk5QqGMAQTo7Qt6y5TRn4hKmhQoAUIiDyG4W1TQp/pbq4nOa+UxQeHkbxPoovhmXofPPML92FNWY=@lists.freedesktop.org
X-Gm-Message-State: AOJu0Yxs3tZHUcbzovAd2iGW/DBt382jxVn5GK83uvkOSPveA9d6kUua
 HNS4taSajO2gRHEtAGGJ9Ccn7CAY0ZKtQKWp7G6t29ox/t86ne01uD2D
X-Gm-Gg: ASbGncv6v5YrMKjMo3ByxQXz0Rpgs+1UFFW+mKPtdX2XPu3q2oC2R1BrxSgGOS+elfv
 dHGg1n25rzCVw0PcoP9NiJ6GbmsvdUvRzOn0s/k0H3oiqK9DboQekdJFbFSyYDt534croe0UaLx
 Pv63LwBsbVR7s0DL9LiwUGYH0yEUDfPvnrV2Fj1Gjr0kDKbq8SllkJZDqSnTnNIUWKDRvZEbfYQ
 a3LZQKlCklDD0XGmeI4G7X25l+jMnQqSKEjUMYX0ixzVCaZQVly33ZCz/rzCaVPY6j+Zua7Ksvq
 NF9vAB7QMYpLKVhxYsHS5bS0w39h+WE2MiyJ8Kf1FWaUR5Vts2LlnrE7lORZ4imQNJPZrAHl0An
 PyyhZCvBJNDM8HMEYduMAbFji6mHZmQMWdl39FU4Na4WixO5UCpY=
X-Google-Smtp-Source: AGHT+IHC5YpqSKWRri7rk5fu1QePjYKo2pweAe0uOj0zdiew0TvVAqes/0fbnU7iPkvxpGOm9Hcv+Q==
X-Received: by 2002:a17:903:1590:b0:237:f7f8:7453 with SMTP id
 d9443c01a7336-23e257915a1mr237719295ad.51.1753066869032; 
 Sun, 20 Jul 2025 20:01:09 -0700 (PDT)
Received: from [127.0.1.1] (211-23-39-77.hinet-ip.hinet.net. [211.23.39.77])
 by smtp.gmail.com with ESMTPSA id
 d9443c01a7336-23e3b6cfdbdsm48264795ad.150.2025.07.20.20.01.05
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Sun, 20 Jul 2025 20:01:08 -0700 (PDT)
From: LiangCheng Wang <zaq14760@gmail.com>
Subject: [PATCH v3 0/3] Add support for Mayqueen Pixpaper e-ink panel
Date: Mon, 21 Jul 2025 11:00:46 +0800
Message-Id: <20250721-drm-v3-0-e16c3cee7263@gmail.com>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit
X-B4-Tracking: v=1; b=H4sIAF6tfWgC/1XMQQ6CMBCF4auQWVszM1KKrryHcdG0BZoImNY0G
 tK7W3CDy38y31sguuBdhEu1QHDJRz9PJU6HCsygp94Jb0sDI0tU2AobRtEgk+1QkbQKyuczuM6
 /t5XbvfTg42sOn2000Xr994kEilqilJ3V1rT62o/aP45mHmH1iXeG6p/hYqQlzY5YnRuzNznnL
 wq2KjHKAAAA
X-Change-ID: 20250708-drm-6021df0715d7
To: Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>, 
 Conor Dooley <conor+dt@kernel.org>, 
 Maarten Lankhorst <maarten.lankhorst@linux.intel.com>, 
 Maxime Ripard <mripard@kernel.org>, Thomas Zimmermann <tzimmermann@suse.de>, 
 David Airlie <airlied@gmail.com>, Simona Vetter <simona@ffwll.ch>, 
 Sumit Semwal <sumit.semwal@linaro.org>, 
 =?utf-8?q?Christian_K=C3=B6nig?= <christian.koenig@amd.com>, 
 Wig Cheng <onlywig@gmail.com>, LiangCheng Wang <zaq14760@gmail.com>
Cc: devicetree@vger.kernel.org, linux-kernel@vger.kernel.org, 
 dri-devel@lists.freedesktop.org, linux-media@vger.kernel.org, 
 linaro-mm-sig@lists.linaro.org, 
 Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
X-Mailer: b4 0.14.2
X-Developer-Signature: v=1; a=ed25519-sha256; t=1753066865; l=4077;
 i=zaq14760@gmail.com; h=from:subject:message-id;
 bh=Nu/Vl9qRU9o6NkaUwTDQDHbqgwFFh2/bmVg/w5K5M8Q=;
 b=OtkVDCc9rbFqK0SardhcA5STp5qHR8/AQ9ijEQVOp2pObcDTf74R3t3k+NU1R68i0Be6yK129
 MprjY4A3A6YBGKm3KNP5rzsODMnJOnFI0s3nnzx2o37X4wLpbDepTY5
X-Developer-Key: i=zaq14760@gmail.com; a=ed25519;
 pk=5IaLhzvMqasgGPT47dsa8HEpfb0/Dv2BZC0TzSLj6E0=
X-Mailman-Approved-At: Mon, 21 Jul 2025 08:45:46 +0000
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

This patch series adds support for the Mayqueen Pixpaper e-ink display panel,
controlled via SPI.

The series includes:
- A new vendor-prefix entry for "mayqueen"
- Device tree binding documentation for the Pixpaper panel
- A DRM tiny driver implementation for the Pixpaper panel
- A MAINTAINERS entry for the Pixpaper DRM driver and binding

The panel supports 122x250 resolution with XRGB8888 format and uses SPI,
along with GPIO lines for reset, busy, and data/command control.

The driver has been tested on:
- Raspberry Pi 2 Model B
with Linux kernel 6.16.

---
Changes in v3:
- MAINTAINERS
    - Added pixpaper-regs.h

- Kconfig
    - Rename config symbol to DRM_PIXPAPER (drop TINYDRM_ prefix).
    - Reordered Kconfig select lines alphabetically.

- Code structure & style
    - Fix include order: move <linux/> headers above <drm/> headers.
    - Removed forward declarations; placed static functions next to usage
    - Switched logging to drm_err()/drm_warn()/drm_dbg() (legacy DRM_ERROR/WARN removed)
    - Remove dev_info() statements.
    - Switched encoder type to DRM_MODE_ENCODER_NONE
    - Moved pixpaper_panel_hw_init() from atomic_enable() to probe() to avoid redundant hardware init.
    - Use helper to_pixpaper_panel() instead of container_of() on crtc.

- Robustness
    - Added timeout + warning in pixpaper_wait_busy() to ensure robustness if BUSY line gets stuck.
    - Introduced struct pixpaper_error_ctx to propagate SPI/GPIO errors

- Clean‑ups
    - Removed drm_plane_enable_fb_damage_clips() (full‑frame updates)
    - Removed noisy info prints; kept drm_dbg() only where helpful
    - Consolidated all magic register values/commands into new
      pixpaper-regs.h with datasheet‑aligned naming

- Memory helpers
    - Driver now uses GEM SHMEM helpers; GEM DMA helpers dropped
      (panel has no bus‑mastering DMA)

- Functionality fixes
    - Rewrote pack_pixels_to_byte() to correctly handle 4-color (B/W/R/Y) layout
      based on expected panel color encoding

- DRM callback safety
    - Add missing drm_dev_enter()/drm_dev_exit() in callbacks.

- Tags added
    - Reviewed-by: Rob Herring <robh@kernel.org> (from v1)
    - Acked-by: Rob Herring <robh@kernel.org> (from v1)
    - Acked-by: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org> (from v2)

- Link to v2: https://lore.kernel.org/r/20250714-drm-v2-0-5d1a2e12796c@gmail.com

Changes in v2:
- Reordered patches so that DT bindings come before the driver (suggested by Rob Herring)
- Fixed sparse warning: removed duplicate `.reset` initializer in `pixpaper_plane_funcs`
- Fixed checkpatch issues reported by Media CI:
  - Removed unnecessary blank line before closing brace
  - Moved opening parentheses up to function call lines (e.g., `DRM_WARN(...)`)
  - Fixed alignment of conditionals
  - Fixed `dev_warn(` and `drm_universal_plane_init(` formatting
- Thanks to Rob Herring for ack on vendor-prefix patch
- Link to v1: https://lore.kernel.org/r/20250708-drm-v1-0-45055fdadc8a@gmail.com

Thanks to all reviewers for feedback across earlier versions.

Best regards,
LiangCheng Wang
<zaq14760@gmail.com>

---
LiangCheng Wang (2):
      dt-bindings: display: Add Mayqueen Pixpaper e-ink panel
      drm: tiny: Add support for Mayqueen Pixpaper e-ink panel

Wig Cheng (1):
      dt-bindings: vendor-prefixes: Add Mayqueen name

 .../bindings/display/mayqueen,pixpaper.yaml        |  63 ++
 .../devicetree/bindings/vendor-prefixes.yaml       |   2 +
 MAINTAINERS                                        |   7 +
 drivers/gpu/drm/tiny/Kconfig                       |  15 +
 drivers/gpu/drm/tiny/Makefile                      |   1 +
 drivers/gpu/drm/tiny/pixpaper-regs.h               | 428 +++++++++++
 drivers/gpu/drm/tiny/pixpaper.c                    | 790 +++++++++++++++++++++
 7 files changed, 1306 insertions(+)
---
base-commit: 6832a9317eee280117cd695fa885b2b7a7a38daf
change-id: 20250708-drm-6021df0715d7

Best regards,
-- 
LiangCheng Wang <zaq14760@gmail.com>

