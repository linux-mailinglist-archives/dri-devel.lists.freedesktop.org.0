Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 9B6163D15B7
	for <lists+dri-devel@lfdr.de>; Wed, 21 Jul 2021 19:56:22 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id C0A106EC20;
	Wed, 21 Jul 2021 17:56:20 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-qk1-x735.google.com (mail-qk1-x735.google.com
 [IPv6:2607:f8b0:4864:20::735])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 8BE586EC20
 for <dri-devel@lists.freedesktop.org>; Wed, 21 Jul 2021 17:56:19 +0000 (UTC)
Received: by mail-qk1-x735.google.com with SMTP id q15so2861138qkm.8
 for <dri-devel@lists.freedesktop.org>; Wed, 21 Jul 2021 10:56:19 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=poorly.run; s=google;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=s5kCoPIWaEgRDHab51bWpg6a/Dd81e6wqtHD2wi+BP0=;
 b=ChenSsXdbDl5aTq0sUbNKneDgbSYSdDxayK9i9rCcKZ095PGXsfVPlh2c9G6I6WYuj
 KsovBQ1GzgxlhkHp6RdhSnlEWusfNFpmLRm5a4MUsTCke1FLaFZMTzt3zsZ8xrWHUiUH
 HuhG9AotnX3wimxTqax0Jdhp16PxdILEDDVvIrdoDZ0l2pNNgOXIoh7ZzHnoJ83sy5+p
 FoblAN/LqzKcb0kllRcf9Pg6q5qywtE+ZivyAeJflIToNz3GVaJR05assbYYdptevixT
 JsP0AqHtn6Zt43k+nNGd4hUy/0oqzdyUdJ7grgYGZ8gn+QGvGX3KJfXNu9i0Nviti/4r
 //vQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=s5kCoPIWaEgRDHab51bWpg6a/Dd81e6wqtHD2wi+BP0=;
 b=Xz698UOAMDd6MPqJ5+LvgUw8hBKtpJSIH96LIBwSk5uZckyfaaPVANrpfXzyBIQcmJ
 rQxY+9I83rohpapUg9Y1C786VA3FYCZeRvetbpCx3LaHmm9cM5PzNdYXSSg2RC45o5Xx
 OXMNoAsQitJ4k7+BYWy9pM1Eqe3foFRLluPNW7ljAE5nuwF1RqvlzsrpD6eDKG0lI7lz
 3r3OWM0UqHOlwgKhzMNwzHgm5C9a9RbTFYzPFiC2fSHeiGtdmOBWIK1ac6m3Q+NIiNMM
 d3C/yhNWieJnHZwhwpo/hsAcfQWn+SZxmmS+5ciyjN0nnnFq//sgq/J84Hv6LeulZVxF
 c2GQ==
X-Gm-Message-State: AOAM533VeSSccNGjXFZN26GYvC3Thfgg9PyOEQ9L+qYWG0VbNAZXnANY
 +U6jvwt1zcjxQT60A026KwAiwZFGXTaDpg==
X-Google-Smtp-Source: ABdhPJz5cpVzsaV5ztunMqTbe1NPaosx1FiDSV8tkfqz1rNWBgF6WEINhrr8tZTPT3O9OcOvcRLGbA==
X-Received: by 2002:a37:66d6:: with SMTP id a205mr4953679qkc.422.1626890178622; 
 Wed, 21 Jul 2021 10:56:18 -0700 (PDT)
Received: from localhost ([167.100.64.199])
 by smtp.gmail.com with ESMTPSA id d16sm9183955qtj.69.2021.07.21.10.56.18
 (version=TLS1_2 cipher=ECDHE-ECDSA-CHACHA20-POLY1305 bits=256/256);
 Wed, 21 Jul 2021 10:56:18 -0700 (PDT)
From: Sean Paul <sean@poorly.run>
To: dri-devel@lists.freedesktop.org, ppaalanen@gmail.com,
 maarten.lankhorst@linux.intel.com, tzimmermann@suse.de, airlied@linux.ie,
 daniel.vetter@ffwll.ch
Subject: [RESEND PATCH v6 11/14] drm/mst: Convert debug printers to debug
 category printers
Date: Wed, 21 Jul 2021 13:55:18 -0400
Message-Id: <20210721175526.22020-12-sean@poorly.run>
X-Mailer: git-send-email 2.31.0
In-Reply-To: <20210721175526.22020-1-sean@poorly.run>
References: <20210721175526.22020-1-sean@poorly.run>
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
Cc: Sean Paul <seanpaul@chromium.org>
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

From: Sean Paul <seanpaul@chromium.org>

The printers in dp_mst are meant to be gated on DRM_UT_DP, so use the
debug category printer to avoid dumping mst transactions to the wrong
place.

Signed-off-by: Sean Paul <seanpaul@chromium.org>
Link: https://patchwork.freedesktop.org/patch/msgid/20200608210505.48519-12-sean@poorly.run #v5

Changes in v5:
-Added to the set
Changes in v6:
-None
Reviewed-by: Lyude Paul <lyude@redhat.com>
---
 drivers/gpu/drm/drm_dp_mst_topology.c | 9 ++++++---
 1 file changed, 6 insertions(+), 3 deletions(-)

diff --git a/drivers/gpu/drm/drm_dp_mst_topology.c b/drivers/gpu/drm/drm_dp_mst_topology.c
index ad0795afc21c..b1dddecad4c6 100644
--- a/drivers/gpu/drm/drm_dp_mst_topology.c
+++ b/drivers/gpu/drm/drm_dp_mst_topology.c
@@ -1356,7 +1356,8 @@ static int drm_dp_mst_wait_tx_reply(struct drm_dp_mst_branch *mstb,
 	}
 out:
 	if (unlikely(ret == -EIO) && drm_debug_enabled(DRM_UT_DP)) {
-		struct drm_printer p = drm_debug_printer(DBG_PREFIX);
+		struct drm_printer p = drm_debug_category_printer(DRM_UT_DP,
+								  DBG_PREFIX);
 
 		drm_dp_mst_dump_sideband_msg_tx(&p, txmsg);
 	}
@@ -2873,7 +2874,8 @@ static int process_single_tx_qlock(struct drm_dp_mst_topology_mgr *mgr,
 
 	ret = drm_dp_send_sideband_msg(mgr, up, chunk, idx);
 	if (unlikely(ret) && drm_debug_enabled(DRM_UT_DP)) {
-		struct drm_printer p = drm_debug_printer(DBG_PREFIX);
+		struct drm_printer p = drm_debug_category_printer(DRM_UT_DP,
+								  DBG_PREFIX);
 
 		drm_printf(&p, "sideband msg failed to send\n");
 		drm_dp_mst_dump_sideband_msg_tx(&p, txmsg);
@@ -2917,7 +2919,8 @@ static void drm_dp_queue_down_tx(struct drm_dp_mst_topology_mgr *mgr,
 	list_add_tail(&txmsg->next, &mgr->tx_msg_downq);
 
 	if (drm_debug_enabled(DRM_UT_DP)) {
-		struct drm_printer p = drm_debug_printer(DBG_PREFIX);
+		struct drm_printer p = drm_debug_category_printer(DRM_UT_DP,
+								  DBG_PREFIX);
 
 		drm_dp_mst_dump_sideband_msg_tx(&p, txmsg);
 	}
-- 
Sean Paul, Software Engineer, Google / Chromium OS

