Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 3CDD76A2EBB
	for <lists+dri-devel@lfdr.de>; Sun, 26 Feb 2023 08:22:36 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 8192810E084;
	Sun, 26 Feb 2023 07:22:23 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from sender-of-o50.zoho.in (sender-of-o50.zoho.in [103.117.158.50])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 7F2FB10E097
 for <dri-devel@lists.freedesktop.org>; Sun, 26 Feb 2023 07:22:21 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; t=1677396131; cv=none; d=zohomail.in; s=zohoarc; 
 b=UyZGAbUGpmuA9MFPY08QUqshTZfyfgndRi59TNpzENqUwUcA0irPsr06hkCO+t9KUs3iwYOEBNzKsBiBAKWtT9pQgoi8fz4NJ88L8Epo1kfFxWtUhiqSxnTCFWfxa/6IndSHQFVlgMJRLLVA8yRHDjZKrMxoqUcTXkeY6wVQvOo=
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=zohomail.in;
 s=zohoarc; t=1677396131;
 h=Content-Type:Content-Transfer-Encoding:Cc:Date:From:In-Reply-To:MIME-Version:Message-ID:References:Subject:To;
 bh=Imhm3KADBFUzpqoR6YK0c7WlVUrrNnl5QByQ64s0W3k=; 
 b=I2K30Obz8Gv8MdDKAskiMo4cZTcSwd01gTRlYuVnr9hRxYIeVO6tJXgKm4+H9b8Cl18j6cS/PqSPXya4flP8Kc3ZjPF3R3/RUcPAERqLG8IBfZ9tiUYrkC51MyosQhgEi9tZSIHi+sEJqCZEG5NjgTqjuB8qb8wggiIkt73oJ+U=
ARC-Authentication-Results: i=1; mx.zohomail.in; dkim=pass  header.i=siddh.me;
 spf=pass  smtp.mailfrom=code@siddh.me;
 dmarc=pass header.from=<code@siddh.me>
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; t=1677396131; 
 s=zmail; d=siddh.me; i=code@siddh.me;
 h=From:From:To:To:Cc:Cc:Message-ID:Subject:Subject:Date:Date:In-Reply-To:References:MIME-Version:Content-Transfer-Encoding:Content-Type:Message-Id:Reply-To;
 bh=Imhm3KADBFUzpqoR6YK0c7WlVUrrNnl5QByQ64s0W3k=;
 b=Vn/O6em6/LzhuR55MbOAKdyAEiYYYg/cQ8z9cntCOo2TDZ1tUaSMACKn2+mhcplv
 RNbIzc9ZTW4KGEVWfwfHCV9QNY+6NRm8QwEOss1rx1NxX/xoKWOedJXJjdn5espie6v
 mbEZqdB0VhPgejiF/xSzi5FFAu9RNyp35S68sdLE=
Received: from kampyooter.. (122.170.64.102 [122.170.64.102]) by mx.zoho.in
 with SMTPS id 1677396129966293.123440320678;
 Sun, 26 Feb 2023 12:52:09 +0530 (IST)
From: Siddh Raman Pant <code@siddh.me>
To: Maarten Lankhorst <maarten.lankhorst@linux.intel.com>,
 Maxime Ripard <mripard@kernel.org>,
 Thomas Zimmermann <tzimmermann@suse.de>, David Airlie <airlied@gmail.com>,
 Daniel Vetter <daniel@ffwll.ch>, Jim Cromie <jim.cromie@gmail.com>,
 Sam Ravnborg <sam@ravnborg.org>
Message-ID: <b618f431b564df1b45f78f2c74190c1eb6e850f1.1677395403.git.code@siddh.me>
Subject: [PATCH v7 6/7] drm: Remove usage of deprecated DRM_DEBUG_DRIVER
Date: Sun, 26 Feb 2023 12:51:53 +0530
X-Mailer: git-send-email 2.39.1
In-Reply-To: <cover.1677395403.git.code@siddh.me>
References: <cover.1677395403.git.code@siddh.me>
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
Cc: linux-kernel <linux-kernel@vger.kernel.org>,
 dri-devel <dri-devel@lists.freedesktop.org>
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

drm_print.h says DRM_DEBUG_DRIVER is deprecated.
Thus, use newer drm_dbg_driver().

Also fix the deprecation comment in drm_print.h which
mentions drm_dbg() instead of drm_dbg_driver().

Signed-off-by: Siddh Raman Pant <code@siddh.me>
---
 drivers/gpu/drm/drm_mipi_dbi.c | 10 +++++-----
 include/drm/drm_print.h        |  2 +-
 2 files changed, 6 insertions(+), 6 deletions(-)

diff --git a/drivers/gpu/drm/drm_mipi_dbi.c b/drivers/gpu/drm/drm_mipi_dbi.=
c
index 58ff9503a403..ab5dd5933a1a 100644
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
@@ -1256,7 +1256,7 @@ int mipi_dbi_spi_init(struct spi_device *spi, struct =
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
index 1a7d4064d120..764f965a6660 100644
--- a/include/drm/drm_print.h
+++ b/include/drm/drm_print.h
@@ -624,7 +624,7 @@ void __drm_err(const char *format, ...);
 #define DRM_DEBUG(fmt, ...)=09=09=09=09=09=09\
 =09__drm_dbg(DRM_UT_CORE, fmt, ##__VA_ARGS__)
=20
-/* NOTE: this is deprecated in favor of drm_dbg(NULL, ...). */
+/* NOTE: this is deprecated in favor of drm_dbg_driver(NULL, ...). */
 #define DRM_DEBUG_DRIVER(fmt, ...)=09=09=09=09=09\
 =09__drm_dbg(DRM_UT_DRIVER, fmt, ##__VA_ARGS__)
=20
--=20
2.39.1


