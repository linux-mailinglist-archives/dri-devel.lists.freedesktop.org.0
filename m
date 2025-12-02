Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 9E294C9AAAB
	for <lists+dri-devel@lfdr.de>; Tue, 02 Dec 2025 09:26:12 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id DC73D10E5C0;
	Tue,  2 Dec 2025 08:26:10 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=gmail.com header.i=@gmail.com header.b="UUbegace";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-lj1-f175.google.com (mail-lj1-f175.google.com
 [209.85.208.175])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 254E010E5C7
 for <dri-devel@lists.freedesktop.org>; Tue,  2 Dec 2025 08:26:10 +0000 (UTC)
Received: by mail-lj1-f175.google.com with SMTP id
 38308e7fff4ca-37a875e3418so39113641fa.1
 for <dri-devel@lists.freedesktop.org>; Tue, 02 Dec 2025 00:26:10 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20230601; t=1764663968; x=1765268768; darn=lists.freedesktop.org;
 h=cc:to:content-transfer-encoding:mime-version:message-id:date
 :subject:from:from:to:cc:subject:date:message-id:reply-to;
 bh=v1ar+zOx3UK5ZzhkLv+Cc5rARED6vyzcN8kpDrUCdNc=;
 b=UUbegaceeCLKTvAy41mCVJoFK4K/yVny8m77UNNlc/EzAlX8h6d0pWDpxiLqfpXYIg
 F6ATUPflG6hMhf6ApTURSYwL3Ja9vnjazOyApTTDaweHC5wU3ao0rPUKrHnLeGqQNM78
 DX4TjSJcLjp1YvwwLmn5xmrMcBb3tmmF/zx/AfG+2tFfpOF+9K12WrhDl14y6FbP4uwB
 7RtK54UL0P4x97Lt3XTBqxfDHGhcGTdgTihIGBBhTuiclPUxMnpZdPqt+JPI9+Qk6rd6
 x8b/48kEOGHwdhUjp4WizbvYZMrffxc5jAhDYuMkmkKZF+NkdEjvhZvSuGGdGYS+17m3
 FAxA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1764663968; x=1765268768;
 h=cc:to:content-transfer-encoding:mime-version:message-id:date
 :subject:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
 :message-id:reply-to;
 bh=v1ar+zOx3UK5ZzhkLv+Cc5rARED6vyzcN8kpDrUCdNc=;
 b=Zh4tu9RyOF9txUI2XKfcOomDpePUoMEQ97K3itFsKkTJe33mrvS4+qUodfrRUpKkxo
 adygrO83a1Ar5rA27KMXtQN2xVlzfmQ7rK7EfeQlAlF6Pu6YHkRTot0P8YB2y5nu3DBs
 Kd40vQGi9hdMfcb0olTCfKeLdtu4/GLXhUcu/rBWZMAHo7WfPxJGrsLIRV7zPTxPFxQw
 Rx4abBMWGa8AdsUiatN2CB7A8Z0UZcSkI3WhPgoM8zG6MZVdhc9wCjyX2Qgf+eIEiwhS
 zVFynHdMXVHqi/h+doSmAbsqAv9V8yLSctpRAHOTDoik0ANj+CA6TRYQEhA/ascAejJn
 bIvg==
X-Gm-Message-State: AOJu0Yxivfk6Prw4B2CYWvCpVQw0u8kN769M2NbTpsuaFBLa24PKrNtV
 /5hb5mIbSZWSNx0gK3aeb0HMnS3YaxD7MK84/Jqx+7EjqVon1FvidbKv
X-Gm-Gg: ASbGnctgfWl791gRGXD46lpPi7PNLrhS6tesc+BqTayENC19IcKOHhjPSuh4poLnkrS
 ka/vqEiG8lReDl8ip2Y9yRbhQQohe2SNnmcyyJOpqWs0NDN3eWK0ywlDqYhP+NzVoFx5u0o/NTd
 GUsxVoZPaHi0IhcsPJ7G+ZclkKC9FgQ2CeIiw1O2p37actHpO+7cIzyaro8sRKTyLJa6RJSXa6R
 Wg0XcGcYXj4VnQ+CthVvBgNiBlqebaetpNbW02m4k56qpAqCUL+LAxRrEa79aEaCOm8Vb1wPzUp
 +8xzZLbBbFbW8blhWlvtBbvO0w5rtu/SkRH9rQpWIy0lt0ndD7CNdmhRNYK2+L3TNqPNRJ+EkFG
 QCIupMpUcn2qLPM/h7N4zWrDYDrZd2Q14Gx76nmXNlV3NG5Lkb5Ul1PSZXj8VHHpgpHUqpHqDda
 U5ilPVs26XFyX6mPt0jO1wsCbiDjeYfqzYiJ0hiyVv/KBgBWpycZ+6Hkyg
X-Google-Smtp-Source: AGHT+IEk4Zv5ekvv5x9wP5sv4R4B4RPxBsI8UcrYHXeCSVoN4uXc3V5ClZHkd0rFQwE5iPgJ742S4A==
X-Received: by 2002:a05:6512:108c:b0:594:5f00:c0b7 with SMTP id
 2adb3069b0e04-596b5058a7cmr9427919e87.15.1764663968003; 
 Tue, 02 Dec 2025 00:26:08 -0800 (PST)
Received: from [192.168.1.168] (83-233-6-197.cust.bredband2.com.
 [83.233.6.197]) by smtp.gmail.com with ESMTPSA id
 2adb3069b0e04-596bf8b06bcsm4423727e87.25.2025.12.02.00.26.05
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Tue, 02 Dec 2025 00:26:06 -0800 (PST)
From: Marcus Folkesson <marcus.folkesson@gmail.com>
Subject: [PATCH RESEND v2 0/6] drm/sitronix/st7571: split up driver to
 support both I2C and SPI
Date: Tue, 02 Dec 2025 09:25:16 +0100
Message-Id: <20251202-st7571-split-v2-0-1e537a09e92f@gmail.com>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
To: Maarten Lankhorst <maarten.lankhorst@linux.intel.com>, 
 Maxime Ripard <mripard@kernel.org>, Thomas Zimmermann <tzimmermann@suse.de>, 
 David Airlie <airlied@gmail.com>, Simona Vetter <simona@ffwll.ch>, 
 Javier Martinez Canillas <javierm@redhat.com>
Cc: dri-devel@lists.freedesktop.org, linux-kernel@vger.kernel.org, 
 Marcus Folkesson <marcus.folkesson@gmail.com>
X-Mailer: b4 0.14.3
X-Developer-Signature: v=1; a=openpgp-sha256; l=1588;
 i=marcus.folkesson@gmail.com; h=from:subject:message-id;
 bh=SHyI8R4tmfpX+TjjAvSZcqT4Jl7+j2cCDwZNAwIZGOs=;
 b=owEBbQKS/ZANAwAKAYiATm9ZXVIyAcsmYgBpLqJ9Dkw/Pea4gIymgIDnxH3FrhAKUqqnhTj4l
 9De3VVNbLqJAjMEAAEKAB0WIQQFUaLotmy1TWTBLGWIgE5vWV1SMgUCaS6ifQAKCRCIgE5vWV1S
 Mg9jD/9dTRNx3H2++VsdJdXjtBRb+iKpQxbz1IsY170oh8aJvKY8ofOwdsrvTmJmTmLf8gE+dWv
 HZZR0ajmbnWcZ/wGPIlXiwIjwXPpIEDmQtSaLD3j7SdVSbPZSdV29dKAYwil5wHAonc8oEo13zG
 swrQTUBgjTlbCV7eO/NQxp/CDF8Tdzel8bUCNBAAqNZLyKUwu78vCJc2K8wb3bd74ARhyUYOkiK
 ljCVPkvOHzkYtKNbdn7klJLlsjh71foI/f/oCNdanB/pLPXbbcaVbgjFeuXdHRZ/gO61c63GQXp
 R5c4u+vpAPDTtXxjpNnEkgFnKdh6V/ozAL0taO+pUxKW654fYsJ4QLiMzuh7N/8y93WAHckcJhq
 2FTtOgWpcBnYgWfGrwkR3Nu2fIqbKNUWlDZx+2M40UrddlNVbQzAlKOUhMtLhgGjK1Dh2PNaPEr
 NGckpB4f7oqhuyXUYYAHDnYhhCpYPg1LvMdM1b8tfWHCegDFeWbXlWe52TXwrf/BQBqakIogZ1S
 AoqzwRZAHBfjjBtg/u1fmqDkExzLZCt4LqxGJdGNGFJIe6JdWQmH2RgkYxsmHFFFtbEzcRmGiod
 XB/mrxBnUt/Rf8PBLI2MJ4dbHvlw6mHZtm9BN48W0VWjcbQhpMOsXM1izNJtzxa15gxUkOHRnwI
 Sg1h4eJrIQD122Q==
X-Developer-Key: i=marcus.folkesson@gmail.com; a=openpgp;
 fpr=AB91D46C7E0F6E6FB2AB640EC0FE25D598F6C127
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

This series splits up the driver and finally implements
support for ST7571/ST7561 connected to a SPI bus.

I've not tested the SPI interface myself as I lack HW, but the
implementation should be okay from what I've read in the datasheet.

Signed-off-by: Marcus Folkesson <marcus.folkesson@gmail.com>
---
Changes in v2:
- Add MODULE_IMPORT_NS to st7571-i2c.c st7571-spi.c (Kernel test robot)
- Link to v1: https://lore.kernel.org/r/20251024-st7571-split-v1-0-d3092b98130f@gmail.com

---
Marcus Folkesson (6):
      drm/sitronix/st7571-i2c: rename 'struct drm_device' in st7571_device
      drm/sitronix/st7571-i2c: add 'struct device' to st7571_device
      drm/sitronix/st7571-i2c: move common structures to st7571.h
      drm/sitronix/st7571-i2c: make probe independent of hw interface
      drm/sitronix/st7571: split up the driver into a common and an i2c part
      drm/sitronix/st7571-spi: add support for SPI interface

 MAINTAINERS                           |    3 +
 drivers/gpu/drm/sitronix/Kconfig      |   38 +-
 drivers/gpu/drm/sitronix/Makefile     |    2 +
 drivers/gpu/drm/sitronix/st7571-i2c.c | 1003 ++-------------------------------
 drivers/gpu/drm/sitronix/st7571-spi.c |   76 +++
 drivers/gpu/drm/sitronix/st7571.c     |  918 ++++++++++++++++++++++++++++++
 drivers/gpu/drm/sitronix/st7571.h     |   91 +++
 7 files changed, 1162 insertions(+), 969 deletions(-)
---
base-commit: 07a4844f2ef49f352ef46d0a4774ad63576a6694
change-id: 20251024-st7571-split-c734b06106a4

Best regards,
-- 
Marcus Folkesson <marcus.folkesson@gmail.com>

