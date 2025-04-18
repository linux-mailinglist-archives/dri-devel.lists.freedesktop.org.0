Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id A09C3A934C8
	for <lists+dri-devel@lfdr.de>; Fri, 18 Apr 2025 10:43:42 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id D6D4610E0A6;
	Fri, 18 Apr 2025 08:43:39 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=kernel.org header.i=@kernel.org header.b="nOf/wvse";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from tor.source.kernel.org (tor.source.kernel.org [172.105.4.254])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 2B18110E0A6
 for <dri-devel@lists.freedesktop.org>; Fri, 18 Apr 2025 08:43:35 +0000 (UTC)
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
 by tor.source.kernel.org (Postfix) with ESMTP id D4B6461137;
 Fri, 18 Apr 2025 08:43:06 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPS id 371CAC4CEE2;
 Fri, 18 Apr 2025 08:43:25 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=k20201202; t=1744965805;
 bh=lmorddFDclvs7FCXPtABeuLvxJT51WRtU07RGNBL0bE=;
 h=From:Date:Subject:To:Cc:Reply-To:From;
 b=nOf/wvse+bmFozGioOWKP21tl7DRKepWw6PCaF1qQKe/+xv/z6YSRSNllixlAsOIq
 +w2lqk8savQ4Nq0xyiqEjEPuIsXCjeTtggebh4N4aPfxR3wV85fEkcd2LGdNsTWM3z
 ZNL5apMZ8V9PPkNiBClAmmN3HGXukpej4z8dvan0SRHaeMiiYVqqNV0GLdw4JoTep6
 pNkeo4j+05K64mYBeOrfKeiqorDhJyadXLXF+E4syr2xJpvM64eNXh8BY5P3ZFnjuD
 bS9QpT9vzB1ltBk40lPc93FN8g3S3fqVRqSxw9C24QGbSPYJ9NrmNjIBleFhMEdPGU
 fZxxtd8m+2p7Q==
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org
 (localhost.localdomain [127.0.0.1])
 by smtp.lore.kernel.org (Postfix) with ESMTP id 26E45C369AB;
 Fri, 18 Apr 2025 08:43:25 +0000 (UTC)
From: =?utf-8?q?Duje_Mihanovi=C4=87_via_B4_Relay?=
 <devnull+duje.mihanovic.skole.hr@kernel.org>
Date: Fri, 18 Apr 2025 10:43:22 +0200
Subject: [PATCH v2] backlight: ktd2801: depend on GPIOLIB
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit
Message-Id: <20250418-ktd-fix-v2-1-cf3d19bafc9e@skole.hr>
X-B4-Tracking: v=1; b=H4sIAKkQAmgC/2WMQQrCMBAAv1L27EqzNk3w5D+kh2pWs1SakpSgl
 Pzd2KvHGYbZIHEUTnBuNoicJUmYK9Chgbsf5yejuMpALem2Uwqn1eFD3mhGzdrZXpubhVovkav
 eT9ehspe0hvjZx1n97P8jK1TIpiPtyJyot5c0hRcffYShlPIFEY6HN50AAAA=
X-Change-ID: 20250411-ktd-fix-7a5e5d8657b8
To: Lee Jones <lee@kernel.org>, Daniel Thompson <danielt@kernel.org>, 
 Jingoo Han <jingoohan1@gmail.com>, Helge Deller <deller@gmx.de>
Cc: Randy Dunlap <rdunlap@infradead.org>, dri-devel@lists.freedesktop.org, 
 linux-fbdev@vger.kernel.org, linux-kernel@vger.kernel.org, 
 =?utf-8?q?Duje_Mihanovi=C4=87?= <duje.mihanovic@skole.hr>
X-Mailer: b4 0.14.2
X-Developer-Signature: v=1; a=openpgp-sha256; l=1451;
 i=duje.mihanovic@skole.hr; s=20240706; h=from:subject:message-id;
 bh=NvkEKW66oVkFED6cl1L9OEBr+ZdxEWUqxuIzm2YmzSg=;
 b=owGbwMvMwCW21nBykGv/WmbG02pJDBlMAmvM9CdPb+m7JZzJc36l/CX7loglnypbg2edbVi5o
 1iaJ+xTRykLgxgXg6yYIkvuf8drvJ9Ftm7PXmYAM4eVCWQIAxenAExkUhEjw5fgD3Hzz0zc8MLo
 gWtc3Zd6Zra5ec9b9pWYbhY+WLi5ZTvDX4kC5SNTFrFKbpFLqiif6btkr6KWmuOhaRyi+akfKnp
 usQAA
X-Developer-Key: i=duje.mihanovic@skole.hr; a=openpgp;
 fpr=6DFF41D60DF314B5B76BA630AD319352458FAD03
X-Endpoint-Received: by B4 Relay for duje.mihanovic@skole.hr/20240706 with
 auth_id=191
X-Original-From: =?utf-8?q?Duje_Mihanovi=C4=87?= <duje.mihanovic@skole.hr>
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
Reply-To: duje.mihanovic@skole.hr
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

From: Duje Mihanović <duje.mihanovic@skole.hr>

The ExpressWire library used by the driver depends on GPIOLIB, and by
extension the driver does as well. This is not reflected in the driver's
Kconfig entry, potentially causing Kconfig warnings. Fix this by adding
the dependency.

Closes: https://lore.kernel.org/all/5cf231e1-0bba-4595-9441-46acc5255512@infradead.org
Reported-by: Randy Dunlap <rdunlap@infradead.org>
Tested-by: Randy Dunlap <rdunlap@infradead.org>
Acked-by: Randy Dunlap <rdunlap@infradead.org>
Signed-off-by: Duje Mihanović <duje.mihanovic@skole.hr>
---
Changes in v2:
- s/Link/Closes
- Pull Randy's tags
- Link to v1: https://lore.kernel.org/r/20250411-ktd-fix-v1-1-e7425d273268@skole.hr
---
 drivers/video/backlight/Kconfig | 1 +
 1 file changed, 1 insertion(+)

diff --git a/drivers/video/backlight/Kconfig b/drivers/video/backlight/Kconfig
index d9374d208ceebbf8b3c27976e9cb4d725939b942..37341474beb9982f7099711e5e2506081061df46 100644
--- a/drivers/video/backlight/Kconfig
+++ b/drivers/video/backlight/Kconfig
@@ -185,6 +185,7 @@ config BACKLIGHT_KTD253
 
 config BACKLIGHT_KTD2801
 	tristate "Backlight Driver for Kinetic KTD2801"
+	depends on GPIOLIB || COMPILE_TEST
 	select LEDS_EXPRESSWIRE
 	help
 	  Say Y to enable the backlight driver for the Kinetic KTD2801 1-wire

---
base-commit: 01c6df60d5d4ae00cd5c1648818744838bba7763
change-id: 20250411-ktd-fix-7a5e5d8657b8

Best regards,
-- 
Duje Mihanović <duje.mihanovic@skole.hr>


