Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id A053A253026
	for <lists+dri-devel@lfdr.de>; Wed, 26 Aug 2020 15:44:37 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id AA7E46EA8A;
	Wed, 26 Aug 2020 13:44:35 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from fllv0015.ext.ti.com (fllv0015.ext.ti.com [198.47.19.141])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 4A52F6EA8A
 for <dri-devel@lists.freedesktop.org>; Wed, 26 Aug 2020 13:44:34 +0000 (UTC)
Received: from fllv0035.itg.ti.com ([10.64.41.0])
 by fllv0015.ext.ti.com (8.15.2/8.15.2) with ESMTP id 07QDiS74055496;
 Wed, 26 Aug 2020 08:44:28 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ti.com;
 s=ti-com-17Q1; t=1598449468;
 bh=0LQPnwdzE2PjOiONJMnL8nMxcoaCzhUCC81gEzqSu3g=;
 h=From:To:CC:Subject:Date;
 b=aAxHrR/z4qvwiBRh96z/mG9m2W4O4AMxWsAGilR6xxJiC9j6vbHkiS6tlQRQvb7dB
 rNXDTrMbN5REuaF3lNqrj0pxTkbRQWMwZEjiUvI9VP927pftOSus8wib/XVOYLahKf
 pyyEGgCpSgg6AgCxVV0dZovIXoS/eu1k4CZKi5ug=
Received: from DFLE112.ent.ti.com (dfle112.ent.ti.com [10.64.6.33])
 by fllv0035.itg.ti.com (8.15.2/8.15.2) with ESMTP id 07QDiSBW061537;
 Wed, 26 Aug 2020 08:44:28 -0500
Received: from DFLE108.ent.ti.com (10.64.6.29) by DFLE112.ent.ti.com
 (10.64.6.33) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id 15.1.1979.3; Wed, 26
 Aug 2020 08:44:28 -0500
Received: from fllv0039.itg.ti.com (10.64.41.19) by DFLE108.ent.ti.com
 (10.64.6.29) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id 15.1.1979.3 via
 Frontend Transport; Wed, 26 Aug 2020 08:44:28 -0500
Received: from deskari.ti.com (ileax41-snat.itg.ti.com [10.172.224.153])
 by fllv0039.itg.ti.com (8.15.2/8.15.2) with ESMTP id 07QDiQ7V128302;
 Wed, 26 Aug 2020 08:44:26 -0500
From: Tomi Valkeinen <tomi.valkeinen@ti.com>
To: <dri-devel@lists.freedesktop.org>, Jyri Sarha <jsarha@ti.com>, Laurent
 Pinchart <laurent.pinchart@ideasonboard.com>
Subject: [PATCH] drm/tidss: Add prepare_fb to the plane helper funcs
Date: Wed, 26 Aug 2020 16:44:09 +0300
Message-ID: <20200826134409.473554-1-tomi.valkeinen@ti.com>
X-Mailer: git-send-email 2.25.1
MIME-Version: 1.0
X-EXCLAIMER-MD-CONFIG: e1e8a2fd-e40a-4ac6-ac9b-f7e9cc9ee180
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
Cc: Tomi Valkeinen <tomi.valkeinen@ti.com>, Gowtham Tammana <g-tammana@ti.com>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

From: Gowtham Tammana <g-tammana@ti.com>

drm_gem_fb_prepare_fb() extracts fence and attaches to plane state.
The fence info is needed if implicit fencing is used. Add this as
prepare_fb function pointer to plane helper funcs.

Signed-off-by: Gowtham Tammana <g-tammana@ti.com>
Signed-off-by: Tomi Valkeinen <tomi.valkeinen@ti.com>
---
 drivers/gpu/drm/tidss/tidss_plane.c | 2 ++
 1 file changed, 2 insertions(+)

diff --git a/drivers/gpu/drm/tidss/tidss_plane.c b/drivers/gpu/drm/tidss/tidss_plane.c
index 43e72d0b2d84..35067ae674ea 100644
--- a/drivers/gpu/drm/tidss/tidss_plane.c
+++ b/drivers/gpu/drm/tidss/tidss_plane.c
@@ -10,6 +10,7 @@
 #include <drm/drm_crtc_helper.h>
 #include <drm/drm_fourcc.h>
 #include <drm/drm_fb_cma_helper.h>
+#include <drm/drm_gem_framebuffer_helper.h>
 
 #include "tidss_crtc.h"
 #include "tidss_dispc.h"
@@ -150,6 +151,7 @@ static void drm_plane_destroy(struct drm_plane *plane)
 }
 
 static const struct drm_plane_helper_funcs tidss_plane_helper_funcs = {
+	.prepare_fb = drm_gem_fb_prepare_fb,
 	.atomic_check = tidss_plane_atomic_check,
 	.atomic_update = tidss_plane_atomic_update,
 	.atomic_disable = tidss_plane_atomic_disable,
-- 
Texas Instruments Finland Oy, Porkkalankatu 22, 00180 Helsinki.
Y-tunnus/Business ID: 0615521-4. Kotipaikka/Domicile: Helsinki

_______________________________________________
dri-devel mailing list
dri-devel@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/dri-devel
