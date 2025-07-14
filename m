Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 3ACABB037F2
	for <lists+dri-devel@lfdr.de>; Mon, 14 Jul 2025 09:28:29 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 82E6910E40D;
	Mon, 14 Jul 2025 07:28:27 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=gmail.com header.i=@gmail.com header.b="lb4Y9G+j";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-pf1-f172.google.com (mail-pf1-f172.google.com
 [209.85.210.172])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 41D1F10E1D5
 for <dri-devel@lists.freedesktop.org>; Mon, 14 Jul 2025 03:00:04 +0000 (UTC)
Received: by mail-pf1-f172.google.com with SMTP id
 d2e1a72fcca58-74801bc6dc5so3029581b3a.1
 for <dri-devel@lists.freedesktop.org>; Sun, 13 Jul 2025 20:00:04 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20230601; t=1752462004; x=1753066804; darn=lists.freedesktop.org;
 h=cc:to:content-transfer-encoding:mime-version:message-id:date
 :subject:from:from:to:cc:subject:date:message-id:reply-to;
 bh=Y6pstB75S20K2ggi+/G/IyUWheZt8LKcxEwRUgTMXz8=;
 b=lb4Y9G+jPkV7+m1YxGez+n4NSDxaGQ2e/SPqF6Xv+J+/3LG139KInrJdy9wK7sw/ID
 v59K0iF29IYYCqq8lMPhi3tddMB/6smuOumd0kiiZWt1N/W20trQVmRrOgzomFGCQmgO
 PiT7AdJkBe4cngxDAEyyRKX4FmkMRy+BtY6snyNjdfpnb5mTNVQg2zOy9uHpDqKpGwBi
 mP6azNfqkDZH0iHgZIc2cVCPgY8/diSbsunFsEaVn2Y7Qtfk43Ifhwfg/Z/MrAZn8k0o
 XV7Xp1noRpBgG+F2sqzP9QIwFD1R/BNjIMHNwBJkDjczZ7hbXfkMSzHbtfBkLa/9BK08
 W48Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1752462004; x=1753066804;
 h=cc:to:content-transfer-encoding:mime-version:message-id:date
 :subject:from:x-gm-message-state:from:to:cc:subject:date:message-id
 :reply-to;
 bh=Y6pstB75S20K2ggi+/G/IyUWheZt8LKcxEwRUgTMXz8=;
 b=QOLgtVxH/a19KkQFlu+m4cwB6d2WAOQHLGn8SABhF2w6k1pP8N1HCAWQmcvW8Hb5r4
 q8Ha9OwX8lWySikWNs0V8MxLkUxkU+eteYrg2fYDciPcXSU/epm9smywgShfgcMVy0+R
 IjNDzlIKhLw3sNHNsCFstIxVPBlxbQOiceht1k+GrZGvkDN/76946+97U8OcbtUYywOG
 5V+u8yMRKC+YwVgFtqxtmTTsKz2hd64vZpa/Z1NtBrdk8am68OcLY7botqdnPeNtfwFU
 +A+zLcD8cx0C2bB6BMElztsuc7U9WM7FVZuQxPx97vUyakrw6FeGjrdAKEBlAWU3A6+6
 UlkA==
X-Forwarded-Encrypted: i=1;
 AJvYcCU2Aest4cZ9J+JZCNPfY+qg/ACDpo5of2sUNxqRm23tDXr7uInhizblaPegegQqKOALSopFnJdj6YA=@lists.freedesktop.org
X-Gm-Message-State: AOJu0YxIKxBQSoUoBsTPPyjzx4qGreXOI+aZx8UfZkx/tw/GrDASIp0D
 huMszI1PynbM41z1GWLAIlcy0St3iogKXPUdagd4yyS2VYdt6eZ/scgN
X-Gm-Gg: ASbGncs35IAvPmCXzb3AtJonRrL1q4pAiN4vTgnb/0ZPwl5Ib8FJcEXvuD0y7mpMyaG
 Nju5xf6hslCKnKvWCPJthasd6QYk3Fy66VZMdXNUdhvxCX+Kmupoi/WEJ4ml67eZaDlPCWvkk1A
 4JPsbNoQwjgWFl/81vGSxHIskBBRy5E7n+tQ4wzauYcCKIo+dftHIIZexry0voAQ5zGqFprgHpk
 EbF9qoE7Sim9ee/099V5/xw8Kx338V0TgZN2wJN9CG8F56hIHtHoA4Y7Pky511Wb7G15WM26fsI
 JdVF4c73V5qhOvC4LTLW3YHIiBkj6TbLh4R4s8euPr7TgukVZ8NBJxfNM0ssWY9ZFZGkzTkSR4P
 +sub+RdnsZMGvGV6wlDEKe/soWbKugWXr6vMJgahGnMIUp+sCwT8=
X-Google-Smtp-Source: AGHT+IFgq0CJoameSLgVhDrFKZgmjgscNozjW68vpXSBJzGFC5r8RB4R1SvSETsoFDPJWdr6HbwT7w==
X-Received: by 2002:a05:6a00:b90:b0:746:25d1:b712 with SMTP id
 d2e1a72fcca58-74ed0f37dbbmr15568022b3a.7.1752462003454; 
 Sun, 13 Jul 2025 20:00:03 -0700 (PDT)
Received: from [127.0.1.1] (211-23-39-77.hinet-ip.hinet.net. [211.23.39.77])
 by smtp.gmail.com with ESMTPSA id
 d2e1a72fcca58-74eb9f4af33sm9034577b3a.122.2025.07.13.20.00.00
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Sun, 13 Jul 2025 20:00:02 -0700 (PDT)
From: LiangCheng Wang <zaq14760@gmail.com>
Subject: [PATCH v2 0/3] Add support for Mayqueen Pixpaper e-ink panel
Date: Mon, 14 Jul 2025 10:59:38 +0800
Message-Id: <20250714-drm-v2-0-5d1a2e12796c@gmail.com>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
X-B4-Tracking: v=1; b=H4sIAJpydGgC/1WMQQ7CIBBFr9LMWsxARBpX3sN0QRhoJ5FioCGah
 ruL3bl8P/+9HYrP7Avchh2yr1w4rR3UaQC32HX2gqkzKFQaDY6CchRXVJICGqnJQH++sg/8Piq
 PqfPCZUv5c0Sr/K3/fpUCxUWj1oEsudHe52j5eXYpwtRa+wKED8UslgAAAA==
X-Change-ID: 20250708-drm-6021df0715d7
To: Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>, 
 Conor Dooley <conor+dt@kernel.org>, 
 Maarten Lankhorst <maarten.lankhorst@linux.intel.com>, 
 Maxime Ripard <mripard@kernel.org>, Thomas Zimmermann <tzimmermann@suse.de>, 
 David Airlie <airlied@gmail.com>, Simona Vetter <simona@ffwll.ch>, 
 Sumit Semwal <sumit.semwal@linaro.org>, 
 =?utf-8?q?Christian_K=C3=B6nig?= <christian.koenig@amd.com>, 
 Wig Cheng <onlywig@gmail.com>
Cc: devicetree@vger.kernel.org, linux-kernel@vger.kernel.org, 
 dri-devel@lists.freedesktop.org, linux-media@vger.kernel.org, 
 linaro-mm-sig@lists.linaro.org, LiangCheng Wang <zaq14760@gmail.com>
X-Mailer: b4 0.14.2
X-Developer-Signature: v=1; a=ed25519-sha256; t=1752462000; l=2106;
 i=zaq14760@gmail.com; h=from:subject:message-id;
 bh=LZFxIGcaYkZxoWI8vAMHadDEgvq9NNtsNON8+he1Adc=;
 b=AzcZ8ioBOR/11C1FrgwE4k8EJtaaO5keijkJ/PnwnqqSPRedLhDtKBYmTk9UYQWNx97c53s8l
 /znIl5IF3FyDp0E9Dx8MAo39n3kDa4P4zg0Vb1fNS3AexJJmCduCUbQ
X-Developer-Key: i=zaq14760@gmail.com; a=ed25519;
 pk=5IaLhzvMqasgGPT47dsa8HEpfb0/Dv2BZC0TzSLj6E0=
X-Mailman-Approved-At: Mon, 14 Jul 2025 07:28:12 +0000
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

Thanks for the feedback!

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
 MAINTAINERS                                        |   6 +
 drivers/gpu/drm/tiny/Kconfig                       |  15 +
 drivers/gpu/drm/tiny/Makefile                      |   1 +
 drivers/gpu/drm/tiny/pixpaper.c                    | 777 +++++++++++++++++++++
 6 files changed, 864 insertions(+)
---
base-commit: d7b8f8e20813f0179d8ef519541a3527e7661d3a
change-id: 20250708-drm-6021df0715d7

Best regards,
-- 
LiangCheng Wang <zaq14760@gmail.com>

