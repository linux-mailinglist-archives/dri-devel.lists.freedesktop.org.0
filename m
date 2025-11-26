Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id AE0D3C8B1E8
	for <lists+dri-devel@lfdr.de>; Wed, 26 Nov 2025 18:04:35 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id C6BD810E692;
	Wed, 26 Nov 2025 17:04:32 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=gmail.com header.i=@gmail.com header.b="KDVRpblA";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-wr1-f53.google.com (mail-wr1-f53.google.com
 [209.85.221.53])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 1BE1D10E692
 for <dri-devel@lists.freedesktop.org>; Wed, 26 Nov 2025 17:04:32 +0000 (UTC)
Received: by mail-wr1-f53.google.com with SMTP id
 ffacd0b85a97d-429c82bf86bso34793f8f.1
 for <dri-devel@lists.freedesktop.org>; Wed, 26 Nov 2025 09:04:31 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20230601; t=1764176670; x=1764781470; darn=lists.freedesktop.org;
 h=cc:to:content-transfer-encoding:mime-version:message-id:date
 :subject:from:from:to:cc:subject:date:message-id:reply-to;
 bh=5eqx4+S00UCrDQU63RvPAcNH3X7qUV1/VG2Dh4jqWGI=;
 b=KDVRpblA7HVwCfeCxOgk7illqXUekY5tISNXso2Q5nnEBXPY5lEn7jAkynxAWGdBxK
 U6Ls2TAeU0utPfI62zcsTz0NKA1yZ2qtD+7cMoNmbNz5YhMs8neFiYpBeZ1ItucellTE
 X1f/cz2tdYlrCFkE1hg0vMKf82aaG7yh+LAGlNajH3Oh3tjzxxjBcw1uFOUKfchIkSG5
 hE8yICYJxl+6utX/E+z/oS53kZ+r4F/wLbJz1CZMNYILJqwfIUQy6kB9xHVZzwgbJrtl
 XtnXXOx9/8YmEX+ZxLL9CWu7IvHLGa0oH8Vy/UPc3mxZyOihoF3bHwx1oHqwCjX+22hK
 KRSQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1764176670; x=1764781470;
 h=cc:to:content-transfer-encoding:mime-version:message-id:date
 :subject:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
 :message-id:reply-to;
 bh=5eqx4+S00UCrDQU63RvPAcNH3X7qUV1/VG2Dh4jqWGI=;
 b=Jq3tuy0v8JcuAqoycXsmrcIZjn2uEnOcJ8f2CMZtFFLRt+3H/LR6YCcDi9uiACxYd5
 G6tkp2/8h/H3ZUBDD2+tVhCy+5WpjkPTVPKxvjtC40rhvFPd74NB//ecBM8aEnVGCa1c
 KlVRbV1KQ+1YE6izEVFpprFQiQ5QKuu0YOilA1fGVgsYEF3qj5o54PZ7tMw0kptJRFQy
 aWq4a9du93Dta4HxGrXk3BvY6NtiIAsm9FUwfH5Cs7BgM8xpYgcngUUm1CuT1HdkQchm
 Oi8I/wEF2TFP/vX2ngnThrOp41A3u+v8r9mYz/9vuG6eQ61Lbed5p4eIvLQL/xJ16oMM
 91LA==
X-Forwarded-Encrypted: i=1;
 AJvYcCVpjNklWxP9v6KgInqnJgWkcQZpyxrCQga8RF4lctsNGk7EW9KX8I+YmjvdQXkaP5KpKABnNyV14W0=@lists.freedesktop.org
X-Gm-Message-State: AOJu0YzS6bSlHXE034rEwD1QOr5LhzLccbHvSYli8qp84erAWb89hnkX
 QPvN0TqFeieYAGbRoiXdj/kAarpPAXqsiHfDQnDRg1yYQm/F1Y7Cqg5w/wYfFsWs
X-Gm-Gg: ASbGncso7g11d8YIsARZ7YTwcC3c/1u/U0RIvZXljpfxr6Ql7sGKoMWBEj+o9lkQmKb
 7avmCGGS8smSqNaskIbugpVpiPdtbrClXXIutGScE07/vr8313M5Jy0uewj7XmPZUdQ76kao8Qu
 BT3ulce89KZ0sw/JDCDTFd/R1fGcZKXU4sH10v8IA7hbBkUdqZZFT+w2kZBbzGEX/xC1FE74y/H
 zwZZiCgVDkzpGsdAZ/9NqEnsZrWkSCBDLOvfHbBmCzvH+BbuNvGE021w6+PwhLHRLfQcE+kfv3A
 WAiguYTojan+v08yIN6yDSqZjcDHhfQ0xWmXZIflbLQS3TA6IZv8zllP/C3PxK+R1E2eR5sxuru
 0jLi7KYmf9GwcpHoYZ4xnGBf+77olfXe73HvUC5NC3dLq2uIUbOT385QQgAhAbR0IFrwkhBo/EJ
 KotjWX43atD9H9cGybCMBS7RtJWyOkYKVif+b/1MspcavPCvHH4d8k
X-Google-Smtp-Source: AGHT+IFdqkWsh+2nr9ILp76fRWiW/aU2Px9HNs0aUX0aYdlBQkkkQ1tWgSr6ACM24wCTMWLrMxsEUw==
X-Received: by 2002:a05:6000:1447:b0:42b:36f4:cd21 with SMTP id
 ffacd0b85a97d-42cc1d0cfa2mr21131627f8f.40.1764176670137; 
 Wed, 26 Nov 2025 09:04:30 -0800 (PST)
Received: from ipedrosa-thinkpadx1carbongen12.rmtes.csb ([5.225.141.247])
 by smtp.gmail.com with ESMTPSA id
 ffacd0b85a97d-42cb7f2e574sm41252799f8f.3.2025.11.26.09.04.28
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Wed, 26 Nov 2025 09:04:29 -0800 (PST)
From: Iker Pedrosa <ikerpedrosam@gmail.com>
Subject: [PATCH v5 0/3] drm/sitronix/st7920: Add support for the ST7920
 controller
Date: Wed, 26 Nov 2025 18:03:48 +0100
Message-Id: <20251126-st7920-v5-0-64eda5267d35@gmail.com>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
X-B4-Tracking: v=1; b=H4sIAAAAAAAC/2XNTQ6CMBCG4auYrq2Z/kJdeQ/jYgotNBEwlBAN4
 e4WFkhw+U36vJ1IdH1wkVxPE+ndGGLo2jTU+USKGtvK0VCmTThwBTloGofMcKAuQ4uCW4FWk/T
 41Tsf3mvo/ki7DnHo+s/aHdly/UuMjALVEq1CIb1BuFUNhuel6BqyJEb+YwbMxnhiEoyXuQFvl
 T8ysTEGu9/EwnxuSq20RxBHJndMsI3JxITihvkcMm35ns3z/AXdlL/7QQEAAA==
X-Change-ID: 20250806-st7920-e7aba32b3ab6
To: Maarten Lankhorst <maarten.lankhorst@linux.intel.com>, 
 Maxime Ripard <mripard@kernel.org>, Thomas Zimmermann <tzimmermann@suse.de>, 
 David Airlie <airlied@gmail.com>, Simona Vetter <simona@ffwll.ch>, 
 Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>, 
 Conor Dooley <conor+dt@kernel.org>, 
 Javier Martinez Canillas <javierm@redhat.com>, 
 Iker Pedrosa <ikerpedrosam@gmail.com>
Cc: linux-kernel@vger.kernel.org, dri-devel@lists.freedesktop.org, 
 devicetree@vger.kernel.org, 
 Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
X-Mailer: b4 0.14.2
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

This patch-series adds support for the Sitronix ST7920 controller, which
is a monochrome dot-matrix graphical LCD controller that has SPI and
parallel interfaces.

The st7920 driver only has support for SPI so displays using other
transport protocols are currently not supported.

* Patch #1 adds the driver.
* Patch #2 adds the DT binding schema.
* Patch #3 adds the MAINTAINERS information.

---
Changes in v5:
- Remove unused device variant structures and hard-code display
  resolution.
- Fix GPIO reset logic to correctly handle logical levels.
- Use kzalloc() instead of kmemdup() for atomic state duplication.
- Refactor atomic update to integrate cpu access with the damage loop.
- Rename macros to avoid the reserved DRM_ prefix.
- Use DRM logging helpers instead of generic device logging.
- Link to v4: https://lore.kernel.org/r/20251031-st7920-v4-0-35291f8076b2@gmail.com

Changes in v4:
- Added definitions for the VDD power supply and the XRESET GPIO line,
  which were identified as minimum requirements from the datasheet.
- The error handling strategy has been refactored to propagate an
  error-tracking struct from the caller.
- The atomic enable/disable logic has been correctly moved from
  drm_encoder_helper_funcs to drm_crtc_helper_funcs, as the
  functionality is bound to the CRTC.
- Added drm_dev_enter() and drm_dev_exit() calls to the atomic_enable
  and atomic_disable helpers to correctly manage the device's runtime
  power state.
- Renamed macro definitions to match the correct terminology.
- Link to v3: https://lore.kernel.org/r/20251006-st7920-v3-0-4f89d656fa03@gmail.com

Changes in v3:
- Reorganize the patch documenting compatible (DT bindings) before their
  use.
- Drop reduntant information from DT bindings.
- Use a goto label to ensure drm_dev_exit() is called in the error path
  of drm_gem_fb_begin_cpu_access().
- Link to v2: https://lore.kernel.org/r/20250909-st7920-v2-0-409f4890fb5f@gmail.com

Changes in v2:
- Refactor SPI communication:
  * Internalize error handling and delays within the st7920_spi_write()
    helper.
  * Split the main SPI write function into smaller, command-specific
    helpers for clarity.
- Improve DRM/KMS logic:
  * Relocate CPU access calls (drm_gem_fb...) to the atomic_update hook.
  * Use standard DRM helpers (drm_crtc_helper_mode_valid_fixed and
    drm_connector_helper_get_modes_fixed) for mode validation and
    creation.
- General code cleanup:
  * Remove dead code related to ST7920_FAMILY.
  * Replace WARN_ON() with drm_WARN_ON_ONCE().
  * Ensure single variable assignments per line.
- Fix probe initialization order:
  * Move spi_set_drvdata() and st7920_init() to occur before device
    registration.
- Devicetree:
  * Update bindings to address feedback from review (e.g., reference
    common SPI properties).
- MAINTAINERS:
  * Add a proper commit message to the patch.
- Link to v1: https://lore.kernel.org/r/20250806-st7920-v1-0-64ab5a34f9a0@gmail.com
---

Signed-off-by: Iker Pedrosa <ikerpedrosam@gmail.com>

---
Iker Pedrosa (3):
      dt-bindings: display: sitronix,st7920: Add DT schema
      drm: Add driver for Sitronix ST7920 LCD displays
      MAINTAINERS: Add entry for Sitronix ST7920 driver

 .../bindings/display/sitronix,st7920.yaml          |  58 ++
 MAINTAINERS                                        |   7 +
 drivers/gpu/drm/sitronix/Kconfig                   |  10 +
 drivers/gpu/drm/sitronix/Makefile                  |   1 +
 drivers/gpu/drm/sitronix/st7920.c                  | 866 +++++++++++++++++++++
 5 files changed, 942 insertions(+)
---
base-commit: c571cb70e1ed43ee543c70151e61a001ab2eefa2
change-id: 20250806-st7920-e7aba32b3ab6

Best regards,
-- 
Iker Pedrosa <ikerpedrosam@gmail.com>

