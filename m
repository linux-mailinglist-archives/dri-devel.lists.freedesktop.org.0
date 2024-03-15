Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 1413087CFF0
	for <lists+dri-devel@lfdr.de>; Fri, 15 Mar 2024 16:14:21 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 3189F10F3AC;
	Fri, 15 Mar 2024 15:14:18 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (1024-bit key; unprotected) header.d=redhat.com header.i=@redhat.com header.b="Fgb/lqdZ";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from us-smtp-delivery-124.mimecast.com
 (us-smtp-delivery-124.mimecast.com [170.10.129.124])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 5050910E64E
 for <dri-devel@lists.freedesktop.org>; Fri, 15 Mar 2024 15:14:16 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1710515655;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=nXcPtyLqeHbb7jPp99zfpO8T0/xgr4Dz5JL/A4RsscI=;
 b=Fgb/lqdZ91wem9fCxoKpeSME2XTPybWZZEZZm/nauqGLbtFmcpoCAHIuH2tp+V4i57tuuu
 Ndb2PuGrYMnZIR2g15H50J1omp609jKfgLdB5DEvD4aw4wxbREUfgwIweuWwmS1p5rGOD0
 ehHJshTkgarr/JDDWJl+vbIqV0DGM1k=
Received: from mimecast-mx02.redhat.com (mimecast-mx02.redhat.com
 [66.187.233.88]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_256_GCM_SHA384) id
 us-mta-207-rcWDZaohOdSNyXQvPKVXmw-1; Fri, 15 Mar 2024 11:14:10 -0400
X-MC-Unique: rcWDZaohOdSNyXQvPKVXmw-1
Received: from smtp.corp.redhat.com (int-mx09.intmail.prod.int.rdu2.redhat.com
 [10.11.54.9])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
 (No client certificate requested)
 by mimecast-mx02.redhat.com (Postfix) with ESMTPS id 7DD158007A6;
 Fri, 15 Mar 2024 15:14:09 +0000 (UTC)
Received: from hydra.redhat.com (unknown [10.39.192.200])
 by smtp.corp.redhat.com (Postfix) with ESMTP id 95F1F492BCD;
 Fri, 15 Mar 2024 15:14:07 +0000 (UTC)
From: Jocelyn Falempe <jfalempe@redhat.com>
To: dri-devel@lists.freedesktop.org, tzimmermann@suse.de, airlied@redhat.com,
 maarten.lankhorst@linux.intel.com, mripard@kernel.org, daniel@ffwll.ch,
 javierm@redhat.com, bluescreen_avenger@verizon.net, noralf@tronnes.org,
 sui.jingfeng@linux.dev
Cc: gpiccoli@igalia.com,
	Jocelyn Falempe <jfalempe@redhat.com>
Subject: [PATCH v10 8/9] drm/imx: Add drm_panic support
Date: Fri, 15 Mar 2024 16:11:00 +0100
Message-ID: <20240315151317.857684-9-jfalempe@redhat.com>
In-Reply-To: <20240315151317.857684-1-jfalempe@redhat.com>
References: <20240315151317.857684-1-jfalempe@redhat.com>
MIME-Version: 1.0
X-Scanned-By: MIMEDefang 3.4.1 on 10.11.54.9
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Transfer-Encoding: 8bit
Content-Type: text/plain; charset="US-ASCII"; x-default=true
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

Add support for the drm_panic module, which displays a user-friendly
message to the screen when a kernel panic occurs.

v7:
 * use drm_panic_gem_get_scanout_buffer() helper

v8:
 * Replace get_scanout_buffer() logic with drm_panic_set_buffer()

v9:
 * Revert to using get_scanout_buffer() (Sima)
 * move get_scanout_buffer() to plane helper functions

Signed-off-by: Jocelyn Falempe <jfalempe@redhat.com>
---
 drivers/gpu/drm/imx/ipuv3/ipuv3-plane.c | 11 ++++++++++-
 1 file changed, 10 insertions(+), 1 deletion(-)

diff --git a/drivers/gpu/drm/imx/ipuv3/ipuv3-plane.c b/drivers/gpu/drm/imx/ipuv3/ipuv3-plane.c
index dade8b59feae..3e21d2a1a124 100644
--- a/drivers/gpu/drm/imx/ipuv3/ipuv3-plane.c
+++ b/drivers/gpu/drm/imx/ipuv3/ipuv3-plane.c
@@ -772,6 +772,12 @@ static const struct drm_plane_helper_funcs ipu_plane_helper_funcs = {
 	.atomic_disable = ipu_plane_atomic_disable,
 	.atomic_update = ipu_plane_atomic_update,
 };
+static const struct drm_plane_helper_funcs ipu_primary_plane_helper_funcs = {
+	.atomic_check = ipu_plane_atomic_check,
+	.atomic_disable = ipu_plane_atomic_disable,
+	.atomic_update = ipu_plane_atomic_update,
+	.get_scanout_buffer = drm_panic_gem_get_scanout_buffer,
+};
 
 bool ipu_plane_atomic_update_pending(struct drm_plane *plane)
 {
@@ -916,7 +922,10 @@ struct ipu_plane *ipu_plane_init(struct drm_device *dev, struct ipu_soc *ipu,
 	ipu_plane->dma = dma;
 	ipu_plane->dp_flow = dp;
 
-	drm_plane_helper_add(&ipu_plane->base, &ipu_plane_helper_funcs);
+	if (type == DRM_PLANE_TYPE_PRIMARY)
+		drm_plane_helper_add(&ipu_plane->base, &ipu_primary_plane_helper_funcs);
+	else
+		drm_plane_helper_add(&ipu_plane->base, &ipu_plane_helper_funcs);
 
 	if (dp == IPU_DP_FLOW_SYNC_BG || dp == IPU_DP_FLOW_SYNC_FG)
 		ret = drm_plane_create_zpos_property(&ipu_plane->base, zpos, 0,
-- 
2.44.0

