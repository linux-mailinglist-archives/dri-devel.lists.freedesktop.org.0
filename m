Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 7C9D51714CC
	for <lists+dri-devel@lfdr.de>; Thu, 27 Feb 2020 11:13:19 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id A6E176E578;
	Thu, 27 Feb 2020 10:13:14 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from fllv0015.ext.ti.com (fllv0015.ext.ti.com [198.47.19.141])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 0A6CF6E578
 for <dri-devel@lists.freedesktop.org>; Thu, 27 Feb 2020 10:13:12 +0000 (UTC)
Received: from lelv0266.itg.ti.com ([10.180.67.225])
 by fllv0015.ext.ti.com (8.15.2/8.15.2) with ESMTP id 01RADA8t083565;
 Thu, 27 Feb 2020 04:13:10 -0600
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ti.com;
 s=ti-com-17Q1; t=1582798390;
 bh=cGrdzz8ubZbEjX9A2eX0STvAo2kTLZTumyl+BULt1os=;
 h=From:To:CC:Subject:Date;
 b=VeoyF7nxufm6JvXVcAeMr8naJvY+sGk6IUwX6hJvGIgF48Crsj3Mu8Qh2K8vV+x8z
 CcaMy4nbrj/LgMcrpLljdEUL4fMfuSzo9oMejL8m4I9HSFZBlFGmiihfTtzNFYk8nr
 nkHdFPI2HFyc6EegwcVEAdQXZQx953xsTzjHoPQw=
Received: from DLEE105.ent.ti.com (dlee105.ent.ti.com [157.170.170.35])
 by lelv0266.itg.ti.com (8.15.2/8.15.2) with ESMTPS id 01RADAGY064251
 (version=TLSv1.2 cipher=AES256-GCM-SHA384 bits=256 verify=FAIL);
 Thu, 27 Feb 2020 04:13:10 -0600
Received: from DLEE115.ent.ti.com (157.170.170.26) by DLEE105.ent.ti.com
 (157.170.170.35) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id 15.1.1847.3; Thu, 27
 Feb 2020 04:13:09 -0600
Received: from fllv0040.itg.ti.com (10.64.41.20) by DLEE115.ent.ti.com
 (157.170.170.26) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id 15.1.1847.3 via
 Frontend Transport; Thu, 27 Feb 2020 04:13:09 -0600
Received: from jadmar.ti.com (ileax41-snat.itg.ti.com [10.172.224.153])
 by fllv0040.itg.ti.com (8.15.2/8.15.2) with ESMTP id 01RAD76C118676;
 Thu, 27 Feb 2020 04:13:07 -0600
From: Jyri Sarha <jsarha@ti.com>
To: <dri-devel@lists.freedesktop.org>
Subject: [PATCH] drm/tidss: Add prepare_fb to the plane helper funcs
Date: Thu, 27 Feb 2020 12:13:07 +0200
Message-ID: <20200227101307.4385-1-jsarha@ti.com>
X-Mailer: git-send-email 2.17.1
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
Cc: peter.ujfalusi@ti.com, tomi.valkeinen@ti.com,
 laurent.pinchart@ideasonboard.com, g-tammana@ti.com
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

From: Gowtham Tammana <g-tammana@ti.com>

drm_gem_fb_prepare_fb() extracts fence and attaches to plane state.
The fence info is needed if implicit fencing is used. Add this as
prepare_fb function pointer to plane helper funcs.

Signed-off-by: Gowtham Tammana <g-tammana@ti.com>
Signed-off-by: Jyri Sarha <jsarha@ti.com>
---
 drivers/gpu/drm/tidss/tidss_plane.c | 2 ++
 1 file changed, 2 insertions(+)

diff --git a/drivers/gpu/drm/tidss/tidss_plane.c b/drivers/gpu/drm/tidss/tidss_plane.c
index ff99b2dd4a17..345678faaeb6 100644
--- a/drivers/gpu/drm/tidss/tidss_plane.c
+++ b/drivers/gpu/drm/tidss/tidss_plane.c
@@ -10,6 +10,7 @@
 #include <drm/drm_crtc_helper.h>
 #include <drm/drm_fourcc.h>
 #include <drm/drm_fb_cma_helper.h>
+#include <drm/drm_gem_framebuffer_helper.h>
 
 #include "tidss_crtc.h"
 #include "tidss_dispc.h"
@@ -142,6 +143,7 @@ static void tidss_plane_atomic_disable(struct drm_plane *plane,
 }
 
 static const struct drm_plane_helper_funcs tidss_plane_helper_funcs = {
+	.prepare_fb = drm_gem_fb_prepare_fb,
 	.atomic_check = tidss_plane_atomic_check,
 	.atomic_update = tidss_plane_atomic_update,
 	.atomic_disable = tidss_plane_atomic_disable,
-- 
Texas Instruments Finland Oy, Porkkalankatu 22, 00180 Helsinki. Y-tunnus/Business ID: 0615521-4. Kotipaikka/Domicile: Helsinki

_______________________________________________
dri-devel mailing list
dri-devel@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/dri-devel
