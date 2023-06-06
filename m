Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 31008725858
	for <lists+dri-devel@lfdr.de>; Wed,  7 Jun 2023 10:46:20 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id A8B9810E491;
	Wed,  7 Jun 2023 08:45:44 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from sender-of-o51.zoho.in (sender-of-o51.zoho.in [103.117.158.51])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 571F910E395
 for <dri-devel@lists.freedesktop.org>; Tue,  6 Jun 2023 18:30:36 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; t=1686076229; cv=none; d=zohomail.in; s=zohoarc; 
 b=bdnlhfp6tuzXDFhKwEhrFgVG25OTMFL3ZvrqHq2F9+dSH7iKsxfWIvPn08R3lUX1j1jNE/hx2LOIP0BdlYJeiS8axecLfCK7rd7dLFyJ2tdqN5u10DQkI6wOVz0w70A9VZeWBzIYfZKbsEYfMO41WPjT+tzuGeXlrRW5Ir0MorE=
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=zohomail.in;
 s=zohoarc; t=1686076229;
 h=Content-Type:Content-Transfer-Encoding:Cc:Date:From:In-Reply-To:MIME-Version:Message-ID:References:Subject:To;
 bh=cl03iPbszoY1ulXeWyy4kFcOXDGykKuT85fVuI02SQ4=; 
 b=Q9BEwdbW1itHgA4LQrQZLXaQU2+egUACace2vJGq1d5g0EjWGfRUPuEvcS3QXXjmzDAOOyMd3BqMVJAOmzFGl6z12W/G4d0rDQQfoJaa6apDOk/e/WE6CBJWaSD7V+X5ecMgpYGkocvjHJ4LtFH7VqdHdMXO3rh/6MITm26pP5A=
ARC-Authentication-Results: i=1; mx.zohomail.in; dkim=pass  header.i=siddh.me;
 spf=pass  smtp.mailfrom=code@siddh.me;
 dmarc=pass header.from=<code@siddh.me>
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; t=1686076229; 
 s=zmail; d=siddh.me; i=code@siddh.me;
 h=From:From:To:To:Cc:Cc:Message-ID:Subject:Subject:Date:Date:In-Reply-To:References:MIME-Version:Content-Transfer-Encoding:Content-Type:Message-Id:Reply-To;
 bh=cl03iPbszoY1ulXeWyy4kFcOXDGykKuT85fVuI02SQ4=;
 b=jSmSeVCAQE5TM6GRGc3EN0IMZsYmUmK/3O30zYEXbh9xtTpE59BB7tWyPIlCA1kp
 ZGMIJyE0+rWE+D8v4rd7mCwYzyZ5X1MK+OWOaBKHLhhnTG0Pw+EUZ2SqaZvrNo1r2Hx
 CsnP5BGx/gIV/1yXUH3O2jhZVhmxAdqYhQwnJnvc=
Received: from kampyooter.. (122.176.141.156 [122.176.141.156]) by mx.zoho.in
 with SMTPS id 1686076228333728.8236826606964;
 Wed, 7 Jun 2023 00:00:28 +0530 (IST)
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
Message-ID: <66a3aa66fa69fb44942d52e8ac3adeac337a400a.1686075579.git.code@siddh.me>
Subject: [PATCH v10 3/9] drm: Remove usage of deprecated DRM_INFO in DRM core
Date: Wed,  7 Jun 2023 00:00:04 +0530
X-Mailer: git-send-email 2.39.2
In-Reply-To: <cover.1686075579.git.code@siddh.me>
References: <cover.1686075579.git.code@siddh.me>
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable
X-ZohoMailClient: External
Content-Type: text/plain; charset=utf8
X-Mailman-Approved-At: Wed, 07 Jun 2023 08:45:25 +0000
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

drm_print.h says DRM_INFO is deprecated in favor of drm_info().

Signed-off-by: Siddh Raman Pant <code@siddh.me>
---
 drivers/gpu/drm/drm_client_modeset.c | 2 +-
 drivers/gpu/drm/drm_connector.c      | 7 ++++---
 drivers/gpu/drm/drm_drv.c            | 2 +-
 drivers/gpu/drm/drm_pci.c            | 2 +-
 4 files changed, 7 insertions(+), 6 deletions(-)

diff --git a/drivers/gpu/drm/drm_client_modeset.c b/drivers/gpu/drm/drm_cli=
ent_modeset.c
index 1b12a3c201a3..ae19734974b5 100644
--- a/drivers/gpu/drm/drm_client_modeset.c
+++ b/drivers/gpu/drm/drm_client_modeset.c
@@ -331,7 +331,7 @@ static bool drm_client_target_cloned(struct drm_device =
*dev,
 =09=09DRM_DEBUG_KMS("can clone using 1024x768\n");
 =09=09return true;
 =09}
-=09DRM_INFO("kms: can't enable cloning when we probably wanted to.\n");
+=09drm_info(dev, "kms: can't enable cloning when we probably wanted to.\n"=
);
 =09return false;
 }
=20
diff --git a/drivers/gpu/drm/drm_connector.c b/drivers/gpu/drm/drm_connecto=
r.c
index 48df7a5ea503..dca8dd4ab93f 100644
--- a/drivers/gpu/drm/drm_connector.c
+++ b/drivers/gpu/drm/drm_connector.c
@@ -168,13 +168,14 @@ static void drm_connector_get_cmdline_mode(struct drm=
_connector *connector)
 =09=09return;
=20
 =09if (mode->force) {
-=09=09DRM_INFO("forcing %s connector %s\n", connector->name,
-=09=09=09 drm_get_connector_force_name(mode->force));
+=09=09drm_info(connector->dev, "forcing %s connector %s\n",
+=09=09=09 connector->name, drm_get_connector_force_name(mode->force));
 =09=09connector->force =3D mode->force;
 =09}
=20
 =09if (mode->panel_orientation !=3D DRM_MODE_PANEL_ORIENTATION_UNKNOWN) {
-=09=09DRM_INFO("cmdline forces connector %s panel_orientation to %d\n",
+=09=09drm_info(connector->dev,
+=09=09=09 "cmdline forces connector %s panel_orientation to %d\n",
 =09=09=09 connector->name, mode->panel_orientation);
 =09=09drm_connector_set_panel_orientation(connector,
 =09=09=09=09=09=09    mode->panel_orientation);
diff --git a/drivers/gpu/drm/drm_drv.c b/drivers/gpu/drm/drm_drv.c
index 12687dd9e1ac..02eaa4c9344d 100644
--- a/drivers/gpu/drm/drm_drv.c
+++ b/drivers/gpu/drm/drm_drv.c
@@ -943,7 +943,7 @@ int drm_dev_register(struct drm_device *dev, unsigned l=
ong flags)
 =09if (drm_core_check_feature(dev, DRIVER_MODESET))
 =09=09drm_modeset_register_all(dev);
=20
-=09DRM_INFO("Initialized %s %d.%d.%d %s for %s on minor %d\n",
+=09drm_info(dev, "Initialized %s %d.%d.%d %s for %s on minor %d\n",
 =09=09 driver->name, driver->major, driver->minor,
 =09=09 driver->patchlevel, driver->date,
 =09=09 dev->dev ? dev_name(dev->dev) : "virtual device",
diff --git a/drivers/gpu/drm/drm_pci.c b/drivers/gpu/drm/drm_pci.c
index 39d35fc3a43b..7dfb837d1325 100644
--- a/drivers/gpu/drm/drm_pci.c
+++ b/drivers/gpu/drm/drm_pci.c
@@ -262,7 +262,7 @@ void drm_legacy_pci_exit(const struct drm_driver *drive=
r,
 =09=09}
 =09=09mutex_unlock(&legacy_dev_list_lock);
 =09}
-=09DRM_INFO("Module unloaded\n");
+=09drm_info(NULL, "Module unloaded\n");
 }
 EXPORT_SYMBOL(drm_legacy_pci_exit);
=20
--=20
2.39.2


