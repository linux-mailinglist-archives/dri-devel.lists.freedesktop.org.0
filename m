Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id E58071F213D
	for <lists+dri-devel@lfdr.de>; Mon,  8 Jun 2020 23:06:40 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id F0E746E99E;
	Mon,  8 Jun 2020 21:06:38 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-qk1-x744.google.com (mail-qk1-x744.google.com
 [IPv6:2607:f8b0:4864:20::744])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 32C666E99E
 for <dri-devel@lists.freedesktop.org>; Mon,  8 Jun 2020 21:06:37 +0000 (UTC)
Received: by mail-qk1-x744.google.com with SMTP id l17so4958959qki.9
 for <dri-devel@lists.freedesktop.org>; Mon, 08 Jun 2020 14:06:37 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=poorly.run; s=google;
 h=from:to:cc:subject:date:message-id:in-reply-to:references;
 bh=UADwIitYeeRjrBoFSNdL04uFlF0ln39T0ne23bnsj5g=;
 b=Q7QA1ExDjnKdhXRkd13w6l0b+xEo0MsPjeuJqaMKBEBTqCp7HEWYPiIgcGZVsoZVI2
 VBpnYdlGSSjZq4Xh8ALm6VvypeX+686t4mn/FvnnFA6OGTCVwxrs48oZWMLSU8cRddOv
 D4KPqPf9wgfm/8L9QrFoCL2On5ssGrpoObryuOQfNsEzfr186X3tyFFZpXR5dDRA0QzT
 cd9De3u1Xrtq0C4OpAlKhL0NpuUqwWTVx7ATaj9XXyXu1GHLfNzcAfBqOX/Od/J1etM2
 O85ArkwYApaAEHTGsNrziGwO/pP0/IO8Ouyr9M7icX1p0C9ZbU1v2nEOeWzL9wXy4FgU
 0ZGw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references;
 bh=UADwIitYeeRjrBoFSNdL04uFlF0ln39T0ne23bnsj5g=;
 b=qoHSUeKkyJCdnM6ijuod5fmhGvHrMobu/S7fXpcZbQS/f9SiVaH1HdSQqxFwBMsxAX
 eCRtaN/LjGgLDpoZyxOStdQr9bRKXiuF63zpVeu8hHA4mNxsAuSAFDbszBGltOWepJ6E
 yhZ4cRBfM1YTPKsvYwo/lWkXdL11wOxwDZvX08Mv2kOsfKo3klk1HowYrytMzcDS+OWg
 hcARkr3J2TUO8Zm9JyvuwPblb0ytHMjCOTVoazpmzLg6/9Wlwi6oiiYjQJmaRlz6f4/6
 sZq/gEH6XHTQlboerVgQO6wYt9mRL7tGFXhv+N9WqC46y5c7lVzfMiGam3Vp0H8UyHAr
 ZNIQ==
X-Gm-Message-State: AOAM533l+6yvRlVV1VLtbj1sRRZJqi0ybjl/ETAmfwT9FkvDoKw/YVxN
 zPHRKZHMLMe1fPfQwB9ruTacDk6U+mI=
X-Google-Smtp-Source: ABdhPJyR8wfk5lCJjROGNWxVSXFl5Qn8lMtdi/zb6b4sTWPNuGHM1PX7nHEYhBQOUC4xAPfhTfVsrw==
X-Received: by 2002:a37:9a87:: with SMTP id
 c129mr24251895qke.374.1591650396180; 
 Mon, 08 Jun 2020 14:06:36 -0700 (PDT)
Received: from localhost (mobile-166-173-249-24.mycingular.net.
 [166.173.249.24])
 by smtp.gmail.com with ESMTPSA id e16sm8976160qtc.71.2020.06.08.14.06.35
 (version=TLS1_2 cipher=ECDHE-ECDSA-CHACHA20-POLY1305 bits=256/256);
 Mon, 08 Jun 2020 14:06:35 -0700 (PDT)
From: Sean Paul <sean@poorly.run>
To: dri-devel@lists.freedesktop.org
Subject: [PATCH v5 11/13] drm/mst: Convert debug printers to debug category
 printers
Date: Mon,  8 Jun 2020 17:05:01 -0400
Message-Id: <20200608210505.48519-12-sean@poorly.run>
X-Mailer: git-send-email 2.17.1
In-Reply-To: <20200608210505.48519-1-sean@poorly.run>
References: <20200608210505.48519-1-sean@poorly.run>
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
Cc: David Airlie <airlied@linux.ie>, daniel.vetter@ffwll.ch,
 Sean Paul <seanpaul@chromium.org>, tzimmermann@suse.de
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

From: Sean Paul <seanpaul@chromium.org>

The printers in dp_mst are meant to be gated on DRM_UT_DP, so use the
debug category printer to avoid dumping mst transactions to the wrong
place.

Signed-off-by: Sean Paul <seanpaul@chromium.org>

Changes in v5:
-Added to the set
---
 drivers/gpu/drm/drm_dp_mst_topology.c | 9 ++++++---
 1 file changed, 6 insertions(+), 3 deletions(-)

diff --git a/drivers/gpu/drm/drm_dp_mst_topology.c b/drivers/gpu/drm/drm_dp_mst_topology.c
index 1bdf3cfeeebb..e225a84da96e 100644
--- a/drivers/gpu/drm/drm_dp_mst_topology.c
+++ b/drivers/gpu/drm/drm_dp_mst_topology.c
@@ -1203,7 +1203,8 @@ static int drm_dp_mst_wait_tx_reply(struct drm_dp_mst_branch *mstb,
 	}
 out:
 	if (unlikely(ret == -EIO) && drm_debug_enabled(DRM_UT_DP)) {
-		struct drm_printer p = drm_debug_printer(DBG_PREFIX);
+		struct drm_printer p = drm_debug_category_printer(DRM_UT_DP,
+								  DBG_PREFIX);
 
 		drm_dp_mst_dump_sideband_msg_tx(&p, txmsg);
 	}
@@ -2739,7 +2740,8 @@ static int process_single_tx_qlock(struct drm_dp_mst_topology_mgr *mgr,
 
 	ret = drm_dp_send_sideband_msg(mgr, up, chunk, idx);
 	if (unlikely(ret) && drm_debug_enabled(DRM_UT_DP)) {
-		struct drm_printer p = drm_debug_printer(DBG_PREFIX);
+		struct drm_printer p = drm_debug_category_printer(DRM_UT_DP,
+								  DBG_PREFIX);
 
 		drm_printf(&p, "sideband msg failed to send\n");
 		drm_dp_mst_dump_sideband_msg_tx(&p, txmsg);
@@ -2783,7 +2785,8 @@ static void drm_dp_queue_down_tx(struct drm_dp_mst_topology_mgr *mgr,
 	list_add_tail(&txmsg->next, &mgr->tx_msg_downq);
 
 	if (drm_debug_enabled(DRM_UT_DP)) {
-		struct drm_printer p = drm_debug_printer(DBG_PREFIX);
+		struct drm_printer p = drm_debug_category_printer(DRM_UT_DP,
+								  DBG_PREFIX);
 
 		drm_dp_mst_dump_sideband_msg_tx(&p, txmsg);
 	}
-- 
Sean Paul, Software Engineer, Google / Chromium OS

_______________________________________________
dri-devel mailing list
dri-devel@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/dri-devel
