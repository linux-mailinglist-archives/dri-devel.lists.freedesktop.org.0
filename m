Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id AA774C6307D
	for <lists+dri-devel@lfdr.de>; Mon, 17 Nov 2025 10:04:24 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 13ACE10E316;
	Mon, 17 Nov 2025 09:04:23 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=gmail.com header.i=@gmail.com header.b="YpUwM1Dj";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-lf1-f45.google.com (mail-lf1-f45.google.com
 [209.85.167.45])
 by gabe.freedesktop.org (Postfix) with ESMTPS id C41A710E320
 for <dri-devel@lists.freedesktop.org>; Mon, 17 Nov 2025 09:04:21 +0000 (UTC)
Received: by mail-lf1-f45.google.com with SMTP id
 2adb3069b0e04-5957d7e0bf3so4394596e87.0
 for <dri-devel@lists.freedesktop.org>; Mon, 17 Nov 2025 01:04:21 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20230601; t=1763370260; x=1763975060; darn=lists.freedesktop.org;
 h=cc:to:content-transfer-encoding:mime-version:message-id:date
 :subject:from:from:to:cc:subject:date:message-id:reply-to;
 bh=v1ar+zOx3UK5ZzhkLv+Cc5rARED6vyzcN8kpDrUCdNc=;
 b=YpUwM1DjbmSHbifhYibfh6IXUoz/DroEjnIpt/Su0BuWmA8qAcL/a4u/wmxGBsydCd
 fBfDGo3z7LnJpNu5Aegg4hreuHJLX+8VHh8RUeEvZn+p4DrW4ByD0i+8QS2vdU3GZvlX
 lH7JdF0HeCkjq4eW31qNKPZvQcQAuHLp2nn6eCRgLz8G8Kj+g+5TODHF3AHHG7XbI4ne
 YXDAZvTNxpG7Ae/uwXWioQFflVM9ecKFduIgo8vU4ov3fHfF1r38ZiuH6wEN72baPxTr
 gDvJcgWspd8YzenF5Ny47b2jiFk6n2MFaGMqZksyQV7GssjMmHlDev9IBhv3hfwBhmPM
 xJtQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1763370260; x=1763975060;
 h=cc:to:content-transfer-encoding:mime-version:message-id:date
 :subject:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
 :message-id:reply-to;
 bh=v1ar+zOx3UK5ZzhkLv+Cc5rARED6vyzcN8kpDrUCdNc=;
 b=sSUktw0w1Lj/dIBwgzTI1azIfm3QAqt+5PcZvHw8OTZ28ketASy5ZRn0m0U7ddKxlb
 3JU83LhtqGCGLNbdWu2qh1zTVJ7EdzooaigvmHp+I1AJ/vhMG+famUEKuvC2xQtS00GP
 hHp5vb8EGUoV+PONWyTGMY7rQ8I1+e1l2WfOz9uS2wPAp8IyB46LmFGQ0UWNnpDLJ+qN
 Vid/EF0nUtC5L9qsU34bpxXfQLTU/Ho8TRl2+TVBoyVH7wFPrBBMkPkmkdFZ8x8e2JMV
 SrUhX/Od7HR1Eg8A0PJpUWXS/gPWlupHPPuP5zN55tfQE6kosBjmGkcyIvIXO1NtXUN9
 SDVA==
X-Gm-Message-State: AOJu0YyjrdQxsjlNftaqMWE94r8ZYVolKl4fu2ecAe0Pt9AMmDpLO8z+
 WvzxyYqi6vB+wx8AX3DJmmd8YztT+5rC9a7P/LHmtE/oILNnuoCxgNDG
X-Gm-Gg: ASbGnctD1c2J87DWAkGFUQgeyWbBWKWfpy3Zb/6cUUbBced/YtDs/ITRTW+w0pZ/d+w
 b/MWLpam/0/Er6DTYnJrb8cb0QI0xARWR8afG+17X1ZQmHF3lr3IBnlOveKbtjtgO1Fen6pZOU5
 iVibCsnNfW220QFMLAjQJyVD2894NLcY9QEqu6hxIzES7lWxPapj7h4zbwdtPoSm1OqwRHSATkX
 5PWJ+01u5LI6mm+JBobUbNqZJFExIpKq1MDBftyYj49JqKhsH8VnWUk8xnLQKi53eRq/I6PQ87A
 7h19KyT8O2ihP2+Ybc3k/zvugKzUaEW7nljceqTGhUP3zJozpFKWmedBBzpX0QBALzyg4qmo5Dy
 gUkv4Cf1pO/CxuWNb/2OEIS6RwYwb+TCGC99wo/lpZoXcZ67k0eSdz16WvGWfdCZ0/Kae8DdHNf
 aI8CzC4HcPdNrbwlPk8PxPYgQ8xJeLTVdEKNvWrK7Smo6USd/1zy8x/QDR
X-Google-Smtp-Source: AGHT+IFKy/dTdWK5s9uh6PeiBMFTYsX+TKnfkjyfQejiHQ8NSUENbCpaeSERjsJa71r/M5gFLaBpfQ==
X-Received: by 2002:a05:6512:3d94:b0:591:c6eb:baf1 with SMTP id
 2adb3069b0e04-5957eccf900mr4902172e87.20.1763370259602; 
 Mon, 17 Nov 2025 01:04:19 -0800 (PST)
Received: from [192.168.1.168] (83-233-6-197.cust.bredband2.com.
 [83.233.6.197]) by smtp.gmail.com with ESMTPSA id
 2adb3069b0e04-595803b77e5sm2982498e87.42.2025.11.17.01.04.18
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Mon, 17 Nov 2025 01:04:18 -0800 (PST)
From: Marcus Folkesson <marcus.folkesson@gmail.com>
Subject: [PATCH RESEND v2 0/6] drm/sitronix/st7571: split up driver to
 support both I2C and SPI
Date: Mon, 17 Nov 2025 10:03:42 +0100
Message-Id: <20251117-st7571-split-v2-0-13189da95265@gmail.com>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
To: Maarten Lankhorst <maarten.lankhorst@linux.intel.com>, 
 Maxime Ripard <mripard@kernel.org>, Thomas Zimmermann <tzimmermann@suse.de>, 
 David Airlie <airlied@gmail.com>, Simona Vetter <simona@ffwll.ch>
Cc: dri-devel@lists.freedesktop.org, linux-kernel@vger.kernel.org, 
 Marcus Folkesson <marcus.folkesson@gmail.com>
X-Mailer: b4 0.14.3
X-Developer-Signature: v=1; a=openpgp-sha256; l=1588;
 i=marcus.folkesson@gmail.com; h=from:subject:message-id;
 bh=SHyI8R4tmfpX+TjjAvSZcqT4Jl7+j2cCDwZNAwIZGOs=;
 b=owEBbQKS/ZANAwAKAYiATm9ZXVIyAcsmYgBpGuTw40jA+KxKySbhRfBPa7997U3n3JUXqp82b
 UQRmp041h+JAjMEAAEKAB0WIQQFUaLotmy1TWTBLGWIgE5vWV1SMgUCaRrk8AAKCRCIgE5vWV1S
 Mv6HD/4ngH1Dwo+ObDDtYnxN+I+H1063Ppwnhg+t7S1zG6hh2oa8x6MFLfP2Uk+H3vZBcZooaaP
 IjSKaNG1c79YVEvOJKvkexefunW6+0WMuOYTkGJ2ta2h1XY3yj6HLEgEZCOmko3uXDHnQHpfmzy
 CwahqKhoOx7RkpRgrI4ATjAI6R0vDNpYir/cA9nFhhH0D9n3o+61CM42k1pqxbk3+PhJHm0KYWh
 2Bh1U5p2GZVQiMPk9hPOHNsYjwvsCC4KNfsuNlqjBx3x7PIGl0s9F8LfFkChd9jBah9yC7mdw7N
 IBDNQpcIuZmxmwpQfTnD9mLTRMAxhCKn017QkG2XVu1YPjgCe+95+Eo3/54WpO6hfS6DLX4Ruxe
 XMlMNu7IUNoCy/uPty90KxrVtG8XYgIOPKu09C95GWrreg0AMqvemJ6nIfPm0hk1cSNM1BpKb5d
 ZlxIn3gBcZ4FgDqCB3Alm4XO80LiwOJK73Ze/yN49ZJRzDqEUZ9PXwgM2DwXAoSPDqy4kNSrTbx
 OiFMUMNIr/NtVx8Pqd2b44U2TWwHI9xYphcNMx6xTlScWVN0Xxh5YmziDwSUqWFketGVNJxvZX8
 ER5IPpTz/ak0f1KXjVSvuZ9dMLRI6lcktvYFgZxeuXS/btZkyYxMsSKtDbYy+JVyy4d0ylZbrBf
 0f2HczPL9Pa2n9A==
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

