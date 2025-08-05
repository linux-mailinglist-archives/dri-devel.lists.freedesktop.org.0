Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id DDA45B1AF35
	for <lists+dri-devel@lfdr.de>; Tue,  5 Aug 2025 09:11:36 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 9DB1F10E5F0;
	Tue,  5 Aug 2025 07:11:34 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=gmail.com header.i=@gmail.com header.b="VfaEOW19";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-pf1-f169.google.com (mail-pf1-f169.google.com
 [209.85.210.169])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 1074310E07A
 for <dri-devel@lists.freedesktop.org>; Tue,  5 Aug 2025 05:40:11 +0000 (UTC)
Received: by mail-pf1-f169.google.com with SMTP id
 d2e1a72fcca58-769a21bd4d5so4109370b3a.0
 for <dri-devel@lists.freedesktop.org>; Mon, 04 Aug 2025 22:40:11 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20230601; t=1754372410; x=1754977210; darn=lists.freedesktop.org;
 h=cc:to:content-transfer-encoding:mime-version:message-id:date
 :subject:from:from:to:cc:subject:date:message-id:reply-to;
 bh=LeEJhrhnwUrTVBP5B/ItjxYOvOdUNX9WUsE+fmf4AKc=;
 b=VfaEOW19DUvIt9mkNFy5C5luGLN/p/HDQaZUQOfVzS9EcB9RUEPcuVq5tCbQcjcRj6
 u5zGPm8FYk2YiY7w2D08+DwLoXfjERkviRiv/N8TpRWbcs8Oces2yxFy2GZTmuBuNgbY
 YIWTD5sFix51peNvTiKgaedxvii48SodWZLXT8ej/EOVRyOZNt/Z9FJMDjmtFtkG6dQH
 lUCJ9u9JCk2RpcyWTuO4b25qmoiwdP0Wf2Xp1KHm4ACP1VOoz7agsVq5nYYgU29GVD59
 +AvTtuWWBH6MB7zbo+mg9sAN5hOTqJQ+2pHzZTnfUw9ETBDBR/25IV/C9IQN0QURMZ00
 1BJg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1754372410; x=1754977210;
 h=cc:to:content-transfer-encoding:mime-version:message-id:date
 :subject:from:x-gm-message-state:from:to:cc:subject:date:message-id
 :reply-to;
 bh=LeEJhrhnwUrTVBP5B/ItjxYOvOdUNX9WUsE+fmf4AKc=;
 b=U4nL+JLDcI3zt3WcQQpOap0kIxKnkpBfz0koURVmgjYeF9lszIW0AQsA0B3o+lfNFK
 SnyGuUpWxKXzlY9BiV9QW2uXpYW5LO4JbL40diTifl7c7Hyuj0PzaB/0Ad/Z5NPeprEB
 SFp5IueOx8t+/59nZtLTP3KMz3t6K3WJfLUEZP3tifmfvfy3Gq9MQXcCEIWnzxvM43dn
 319aDpwVcVCLJUtIihpVO2tQBYnKWIyYqXsz2ht033Y2nbpoiFulEf9CfUzpa3c8hPbs
 OqUkpw9rlGTREWALPQPCAY9MhROM+misp16ORwMbvtnWM+ySIyUF8gRUwuC6q13pj5j2
 7J+w==
X-Forwarded-Encrypted: i=1;
 AJvYcCWXt9FpYztbux6Lj9qpG3y/riB68nEeRw6L2YtLkhDLmLOZURh05JEb8a5aonW5pEHtBDfVOE4uGcU=@lists.freedesktop.org
X-Gm-Message-State: AOJu0Yz9GlkEnF4hhMFYCY/N6bw506Vgmd0RbDEhPSgdyzY6FoD0T1gd
 j2vY6gi6gh8gPVgtXu51eTvXnffh+M8XYKeY3uBCkFVGMdIvl0cGWeix
X-Gm-Gg: ASbGncuw8FDnjGQIXsVrWqoXi2rdnvsRU2VyVoVj4cRFUqunwrz5sX/sjHe6iUx32Mt
 RJAwyw7OdLMwuIxpdEpBT/RW2JLahTsGOj0RugTUMNlVIC0y0iu3w0Hxpvzk2EL43eHjG+9Doqm
 oFjIE+RsprBH5KyahfGprK0TcEK5VbGWO+sJs/qX8evn8cwMG8/SwaufgAAjNp9hEJG1yzEYl+n
 H8/VftqkwtITNms3Fg8WcAhpxBbwC81QHx4AjtAzBTIoHU3ggKWUE+L7QO8o163D85iZTX1MZ3O
 Qoyzk+RioRbXRvZQGFiTC/CrtEDhwmDYfbirq8+Hcwh+hgTs3IWLS99G84ecVYfZAOsA7+7lRZ6
 3Zovi7JhdtoignHSty4cbBCXBiYyEU60j2ELwHiTlJET5BrVhh9M=
X-Google-Smtp-Source: AGHT+IHYPgdA0GQ9owG/1e3TrYAgjSvBMzlvWf2Zgn2fzmwlOXUmTfEe6wtES4ekW7qNSW7tVKHLZA==
X-Received: by 2002:a05:6a00:3d0f:b0:732:2484:e0ce with SMTP id
 d2e1a72fcca58-76bec4c537amr14636092b3a.17.1754372410238; 
 Mon, 04 Aug 2025 22:40:10 -0700 (PDT)
Received: from [127.0.1.1] (211-23-39-77.hinet-ip.hinet.net. [211.23.39.77])
 by smtp.gmail.com with ESMTPSA id
 d2e1a72fcca58-76bcce89125sm11990006b3a.33.2025.08.04.22.40.06
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Mon, 04 Aug 2025 22:40:09 -0700 (PDT)
From: LiangCheng Wang <zaq14760@gmail.com>
Subject: [PATCH v4 0/3] Add support for Mayqueen Pixpaper e-ink panel
Date: Tue, 05 Aug 2025 13:40:04 +0800
Message-Id: <20250805-drm-v4-0-94eaec01598d@gmail.com>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit
X-B4-Tracking: v=1; b=H4sIADSZkWgC/13MQQ7CIBCF4as0rMUwQ4HqynsYFwSmLYm1BgzRN
 L27tN1Ul/9kvjexRDFQYudqYpFySGF8lKgPFXO9fXTEgy/NUKASRjTcx4FrgeBbYUB5w8rnM1I
 b3uvK9Va6D+k1xs86mmG5/voMXPBaCaVab71r7KUbbLgf3TiwxWfcGag3g8UoDxYJ0Jy0+zdyZ
 xA2I4sh0E46IoNa7s08z18s8fyW/gAAAA==
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
X-Developer-Signature: v=1; a=ed25519-sha256; t=1754372406; l=4414;
 i=zaq14760@gmail.com; h=from:subject:message-id;
 bh=N/pmzhrhBR41PCutlnpr0nlE6nslcrMo+1tEG23f7Dk=;
 b=EMUuPFvBDlpo2snWJLgaqTIGP2JwNUP2YFITzZ6fglmGFr1BO2fYzTpxF/x97kZG0flZeEY1a
 v4hEgG+FZL8DgUZIxoMD8hoYl5Bridtc8anmzusrv71pKs6eQD0z9z+
X-Developer-Key: i=zaq14760@gmail.com; a=ed25519;
 pk=5IaLhzvMqasgGPT47dsa8HEpfb0/Dv2BZC0TzSLj6E0=
X-Mailman-Approved-At: Tue, 05 Aug 2025 07:11:30 +0000
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
Changes in v4:
- Applied BIT() macro for all register bit definitions (per checkpatch)
- Fixed alignment and indentation based on checkpatch suggestions
- Removed unnecessary blank lines after braces
- Fixed universal plane init() call indentation
- Link to v3: https://lore.kernel.org/r/20250721-drm-v3-0-e16c3cee7263@gmail.com

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
 drivers/gpu/drm/tiny/pixpaper.c                    | 789 +++++++++++++++++++++
 7 files changed, 1305 insertions(+)
---
base-commit: 7e161a991ea71e6ec526abc8f40c6852ebe3d946
change-id: 20250708-drm-6021df0715d7

Best regards,
-- 
LiangCheng Wang <zaq14760@gmail.com>

