Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id F32D7781DA0
	for <lists+dri-devel@lfdr.de>; Sun, 20 Aug 2023 13:56:22 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 0371D10E133;
	Sun, 20 Aug 2023 11:56:17 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from sender-of-o51.zoho.in (sender-of-o51.zoho.in [103.117.158.51])
 by gabe.freedesktop.org (Postfix) with ESMTPS id F3EE510E128
 for <dri-devel@lists.freedesktop.org>; Sun, 20 Aug 2023 11:56:14 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; t=1692531661; cv=none; d=zohomail.in; s=zohoarc; 
 b=GZrKDVnWTUhWlT0XtS92HxMY0d3TK42t+i9w9UCZ5ouClI87cynX9nupN8Rv1Skwl/GWi5RmhojxEJD/zfqFwAGY1QHKSL3gsx4piv5Px/tNsXicmEC+Md+EIeertD/GDfOL3WADHBYrkc2gG3BOUy1H80S+MQpIjnwTpgrfbW4=
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=zohomail.in;
 s=zohoarc; t=1692531661;
 h=Content-Type:Content-Transfer-Encoding:Cc:Date:From:In-Reply-To:MIME-Version:Message-ID:References:Subject:To;
 bh=+ThfIsuUqQy+CJfFmSwKKtx2BvDK3nbKpXp0o2G9/Uo=; 
 b=MRZWZ2UTXdxUMOD80YpykDEy0SaKq6wNxkCiT/Sp/PfurBt1NS6S+8s1VX7ppC4P2vYdpyM1Cr4VSUyAIEbbqqOrsx8q058fHrlBy1nbIqBOZTvQStLQsaNwMxf5ZnbckuBbRKeuAAL5EPeS1F4x+I7yKjWHWKcOz5Ally6cwMA=
ARC-Authentication-Results: i=1; mx.zohomail.in; dkim=pass  header.i=siddh.me;
 spf=pass  smtp.mailfrom=code@siddh.me;
 dmarc=pass header.from=<code@siddh.me>
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; t=1692531661; 
 s=zmail; d=siddh.me; i=code@siddh.me;
 h=From:From:To:To:Cc:Cc:Message-ID:Subject:Subject:Date:Date:In-Reply-To:References:MIME-Version:Content-Transfer-Encoding:Content-Type:Message-Id:Reply-To;
 bh=+ThfIsuUqQy+CJfFmSwKKtx2BvDK3nbKpXp0o2G9/Uo=;
 b=WknEwTPQ62t6kgZiflc3WY5TedqQq1UCNihKf4F1LnBPHf/cKCXmF9ylm+/S8SyF
 94zM40/+ykeOLbOx09eRQbNLg4SQQjEBDR5RBhsVlGmKY+/xRPZcu7QyMkssH1uNfP4
 w7A8/OzLsYjGRa+IzSQklDV6zjjVxvIeYeV5SC9o=
Received: from kampyooter.. (110.226.17.164 [110.226.17.164]) by mx.zoho.in
 with SMTPS id 1692531658928825.376611081641;
 Sun, 20 Aug 2023 17:10:58 +0530 (IST)
From: Siddh Raman Pant <code@siddh.me>
To: Maarten Lankhorst <maarten.lankhorst@linux.intel.com>,
 Maxime Ripard <mripard@kernel.org>,
 Thomas Zimmermann <tzimmermann@suse.de>, David Airlie <airlied@gmail.com>,
 Daniel Vetter <daniel@ffwll.ch>, Andrzej Hajda <andrzej.hajda@intel.com>,
 Neil Armstrong <neil.armstrong@linaro.org>, Robert Foss <rfoss@kernel.org>,
 Laurent Pinchart <Laurent.pinchart@ideasonboard.com>,
 Jonas Karlman <jonas@kwiboo.se>, Jernej Skrabec <jernej.skrabec@gmail.com>,
 Jani Nikula <jani.nikula@linux.intel.com>,
 Laurent Pinchart <laurent.pinchart@ideasonboard.com>
Message-ID: <83242950b058afbc4cb9bafeca4c7ac5ea2f8d79.1692531217.git.code@siddh.me>
Subject: [PATCH v11 7/8] drm: Remove usage of deprecated DRM_DEBUG_DRIVER in
 DRM core
Date: Sun, 20 Aug 2023 17:10:43 +0530
X-Mailer: git-send-email 2.40.1
In-Reply-To: <cover.1692531217.git.code@siddh.me>
References: <cover.1692531217.git.code@siddh.me>
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable
X-ZohoMailClient: External
Content-Type: text/plain; charset=utf8
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
Cc: linux-kernel@vger.kernel.org, dri-devel@lists.freedesktop.org,
 Suraj Upadhyay <usuraj35@gmail.com>
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

drm_print.h says DRM_DEBUG_DRIVER is deprecated.
Thus, use newer drm_dbg_driver().

Also fix the deprecation comment in drm_print.h which
mentions drm_dbg() instead of drm_dbg_driver().

Reviewed-by: Laurent Pinchart <laurent.pinchart+renesas@ideasonboard.com>
Signed-off-by: Siddh Raman Pant <code@siddh.me>
---
 drivers/gpu/drm/drm_mipi_dbi.c | 10 +++++-----
 include/drm/drm_print.h        |  2 +-
 2 files changed, 6 insertions(+), 6 deletions(-)

diff --git a/drivers/gpu/drm/drm_mipi_dbi.c b/drivers/gpu/drm/drm_mipi_dbi.=
c
index 4d9450d6df00..ad05181af1bd 100644
--- a/drivers/gpu/drm/drm_mipi_dbi.c
+++ b/drivers/gpu/drm/drm_mipi_dbi.c
@@ -70,11 +70,11 @@
 #define MIPI_DBI_DEBUG_COMMAND(cmd, data, len) \
 ({ \
 =09if (!len) \
-=09=09DRM_DEBUG_DRIVER("cmd=3D%02x\n", cmd); \
+=09=09drm_dbg_driver(NULL, "cmd=3D%02x\n", cmd); \
 =09else if (len <=3D 32) \
-=09=09DRM_DEBUG_DRIVER("cmd=3D%02x, par=3D%*ph\n", cmd, (int)len, data);\
+=09=09drm_dbg_driver(NULL, "cmd=3D%02x, par=3D%*ph\n", cmd, (int)len, data=
);\
 =09else \
-=09=09DRM_DEBUG_DRIVER("cmd=3D%02x, len=3D%zu\n", cmd, len); \
+=09=09drm_dbg_driver(NULL, "cmd=3D%02x, len=3D%zu\n", cmd, len); \
 })
=20
 static const u8 mipi_dbi_dcs_read_commands[] =3D {
@@ -708,7 +708,7 @@ bool mipi_dbi_display_is_on(struct mipi_dbi *dbi)
 =09    DCS_POWER_MODE_DISPLAY_NORMAL_MODE | DCS_POWER_MODE_SLEEP_MODE))
 =09=09return false;
=20
-=09DRM_DEBUG_DRIVER("Display is ON\n");
+=09drm_dbg_driver(NULL, "Display is ON\n");
=20
 =09return true;
 }
@@ -1264,7 +1264,7 @@ int mipi_dbi_spi_init(struct spi_device *spi, struct =
mipi_dbi *dbi,
=20
 =09mutex_init(&dbi->cmdlock);
=20
-=09DRM_DEBUG_DRIVER("SPI speed: %uMHz\n", spi->max_speed_hz / 1000000);
+=09drm_dbg_driver(NULL, "SPI speed: %uMHz\n", spi->max_speed_hz / 1000000)=
;
=20
 =09return 0;
 }
diff --git a/include/drm/drm_print.h b/include/drm/drm_print.h
index 4b8532cf2ae6..2bac5e8fd550 100644
--- a/include/drm/drm_print.h
+++ b/include/drm/drm_print.h
@@ -589,7 +589,7 @@ void __drm_err(const char *format, ...);
 #define DRM_DEBUG(fmt, ...)=09=09=09=09=09=09\
 =09__drm_dbg(DRM_UT_CORE, fmt, ##__VA_ARGS__)
=20
-/* NOTE: this is deprecated in favor of drm_dbg(NULL, ...). */
+/* NOTE: this is deprecated in favor of drm_dbg_driver(NULL, ...). */
 #define DRM_DEBUG_DRIVER(fmt, ...)=09=09=09=09=09\
 =09__drm_dbg(DRM_UT_DRIVER, fmt, ##__VA_ARGS__)
=20
--=20
2.40.1


