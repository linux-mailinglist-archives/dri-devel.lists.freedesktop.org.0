Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 6CE55909B17
	for <lists+dri-devel@lfdr.de>; Sun, 16 Jun 2024 03:25:50 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 2EA0010E111;
	Sun, 16 Jun 2024 01:25:48 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (1024-bit key; unprotected) header.d=broadcom.com header.i=@broadcom.com header.b="BYtCf6JS";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-qt1-f179.google.com (mail-qt1-f179.google.com
 [209.85.160.179])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 7AC3F10E120
 for <dri-devel@lists.freedesktop.org>; Sun, 16 Jun 2024 01:25:42 +0000 (UTC)
Received: by mail-qt1-f179.google.com with SMTP id
 d75a77b69052e-43fdb114e07so16096351cf.2
 for <dri-devel@lists.freedesktop.org>; Sat, 15 Jun 2024 18:25:42 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=broadcom.com; s=google; t=1718501141; x=1719105941;
 darn=lists.freedesktop.org; 
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:from:to:cc:subject:date
 :message-id:reply-to;
 bh=gCrX2aP7omTOt40mjhlbJGCmLHhusecgyid8m4PMNe0=;
 b=BYtCf6JSBtgZCHGGPbMEHoNIVjZYTE4kjpWEt3BoSU9gbKnJbsUcgsDvOC9Ei6VpQE
 8KymDw5B86/0amr4CQ+W69JK643qRyjcZY+mw984g9aD+wQNIObOIIaJKuHh0RfOjjfS
 d7kovONZiybSyLmua2+bRzj9a/O52248MijeI=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1718501141; x=1719105941;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=gCrX2aP7omTOt40mjhlbJGCmLHhusecgyid8m4PMNe0=;
 b=JTAHWiFvQv2c8FbR6+9cXwyboN4dS4IT9DA8O8xWzb/ySWVi7OP/H4gpkzVbPa6AvB
 44gg1f+tDgNv6imVr0DXxY7W068b76w/3IhfTzxtocY/leMfEbYFs57G0q5reNyDwj8U
 +AVMBKsFCOW3NWIMxl/kFWG5LXeYgoZ0Ub8UAVkFzZFsagkeF/KbDGIv9WL+K6hWYT+v
 Hacw9sT1wMOXQWeuFjxsGe5WZYLfXhdryTvTaR9QDM0EHzLrkVScw1Sh/9RUZqep/sv/
 9D469Ii1g+8eyz6/86nHPH+L5QVQCgwXvqGYyEqVLjnUGRlWblfJoSn9sfLtu65GNvl/
 CBgQ==
X-Forwarded-Encrypted: i=1;
 AJvYcCUQhk605LPsdZZ03gLB90972qR2S1N5iEsZmJDk/V9D7UDiKtfilmUGJEfmD42YQeK47BA4CYtm7+Idh0hj3xGXtOBDzOUVeqWlTrS564ao
X-Gm-Message-State: AOJu0YxqdJUCHPX0m6HC/IbcSw3a+2hfHOUOcI9KUDlT44BvLwPFsFgD
 DOdf0v1FzLk6/RzzdvmG2g+ltt0I/HfiMtac9xZ1Tlflgl1akAtRY01M+r6/gA==
X-Google-Smtp-Source: AGHT+IG29Vm1eX4EMSaDAYflKH0cuDBu7WkYeoXWjmR1hkQVFmvlJrcmLUBw6U+nnvmj44pJx+WVcQ==
X-Received: by 2002:ac8:5a8c:0:b0:440:60f3:733b with SMTP id
 d75a77b69052e-4421685caa4mr69850701cf.14.1718501140971; 
 Sat, 15 Jun 2024 18:25:40 -0700 (PDT)
Received: from amakhalov-build-vm.eng.vmware.com ([192.19.161.250])
 by smtp.gmail.com with ESMTPSA id
 d75a77b69052e-441f310dae0sm32256121cf.97.2024.06.15.18.25.36
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Sat, 15 Jun 2024 18:25:40 -0700 (PDT)
From: Alexey Makhalov <alexey.makhalov@broadcom.com>
To: linux-kernel@vger.kernel.org, bp@alien8.de,
 bcm-kernel-feedback-list@broadcom.com, lkp@intel.com
Cc: zack.rusin@broadcom.com, dri-devel@lists.freedesktop.org, daniel@ffwll.ch,
 airlied@gmail.com, tzimmermann@suse.de, mripard@kernel.org,
 maarten.lankhorst@linux.intel.com, linux-iio@vger.kernel.org,
 jic23@kernel.org, lars@metafoo.de, nuno.sa@analog.com,
 dragos.bogdan@analog.com, anshulusr@gmail.com, andrea.collamati@gmail.com,
 oe-kbuild-all@lists.linux.dev, x86@kernel.org,
 Alexey Makhalov <alexey.makhalov@broadcom.com>
Subject: [PATCH 2/2] iio: dac: Fix dependencies of AD9739A
Date: Sat, 15 Jun 2024 18:25:11 -0700
Message-Id: <20240616012511.198243-2-alexey.makhalov@broadcom.com>
X-Mailer: git-send-email 2.39.4
In-Reply-To: <20240616012511.198243-1-alexey.makhalov@broadcom.com>
References: <202406152104.FxakP1MB-lkp@intel.com>
 <20240616012511.198243-1-alexey.makhalov@broadcom.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
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

0-DAY CI Kernel Test automation reported an issue:

   ld: drivers/base/regmap/regmap-spi.o: in function `regmap_spi_read':
   regmap-spi.c:(.text+0xf): undefined reference to `spi_write_then_read'
   ld: drivers/base/regmap/regmap-spi.o: in function `regmap_spi_gather_write':
   regmap-spi.c:(.text+0x2b4): undefined reference to `spi_sync'
   ld: drivers/base/regmap/regmap-spi.o: in function `spi_sync_transfer.constprop.0':
   regmap-spi.c:(.text+0x337): undefined reference to `spi_sync'
   ld: drivers/base/regmap/regmap-spi.o: in function `regmap_spi_async_write':
   regmap-spi.c:(.text+0x445): undefined reference to `spi_async'
   ld: drivers/iio/dac/ad9739a.o: in function `ad9739a_driver_init':
   ad9739a.c:(.init.text+0x10): undefined reference to `__spi_register_driver'

Kconfig warnings: (for reference only)
   WARNING: unmet direct dependencies detected for REGMAP_SPI
   Depends on [n]: SPI [=n]
   Selected by [y]:
   - AD9739A [=y] && IIO [=y] && (SPI [=n] || COMPILE_TEST [=y])

The issue is caused by CONFIG_AD9739A=y when CONFIG_SPI is not set.

Add explicit dependency on SPI and conditional selection of REGMAP_SPI.

Fixes: e77603d5468b ("iio: dac: support the ad9739a RF DAC")
Reported-by: kernel test robot <lkp@intel.com>
Closes: https://lore.kernel.org/oe-kbuild-all/202406152104.FxakP1MB-lkp@intel.com/
Signed-off-by: Alexey Makhalov <alexey.makhalov@broadcom.com>
---
 drivers/iio/dac/Kconfig | 4 ++--
 1 file changed, 2 insertions(+), 2 deletions(-)

diff --git a/drivers/iio/dac/Kconfig b/drivers/iio/dac/Kconfig
index 3c2bf620f00f..d095f4d26e49 100644
--- a/drivers/iio/dac/Kconfig
+++ b/drivers/iio/dac/Kconfig
@@ -133,8 +133,8 @@ config AD5624R_SPI
 
 config AD9739A
 	tristate "Analog Devices AD9739A RF DAC spi driver"
-	depends on SPI || COMPILE_TEST
-	select REGMAP_SPI
+	depends on SPI
+	select REGMAP_SPI if SPI_MASTER
 	select IIO_BACKEND
 	help
 	  Say yes here to build support for Analog Devices AD9739A Digital-to
-- 
2.39.4

