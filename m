Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 651EA248FE5
	for <lists+dri-devel@lfdr.de>; Tue, 18 Aug 2020 23:05:47 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 6AFB96E17E;
	Tue, 18 Aug 2020 21:05:44 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-qk1-x744.google.com (mail-qk1-x744.google.com
 [IPv6:2607:f8b0:4864:20::744])
 by gabe.freedesktop.org (Postfix) with ESMTPS id A13B46E160
 for <dri-devel@lists.freedesktop.org>; Tue, 18 Aug 2020 21:05:37 +0000 (UTC)
Received: by mail-qk1-x744.google.com with SMTP id j187so19656526qke.11
 for <dri-devel@lists.freedesktop.org>; Tue, 18 Aug 2020 14:05:37 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=poorly.run; s=google;
 h=from:to:cc:subject:date:message-id:in-reply-to:references;
 bh=7xgwcYWpQF7hmZEi+axwrpWRaGn1fsxoBJfi6eNB9G8=;
 b=ViDs7zy555y2VrZd/AKA2qOG3phqo/RYe+1TgqDZEMUsdTp2kimaidZm2B2PmcFnki
 ubW9EEd2veM8uRtXkXCQHg805jRvGBhT5tlSuGCIlzVNVcHBO9K/NcfqXaJaI439H1Xk
 9ghx5URmmyegBNY19mQivkoatm5xoeQyijdpzEoJl2dc9kI5vpkJA2GOLcauvLx1rVSO
 ma+aeb0gikOCpRe67conDu1EfUFmNvn8Q+97rdp+Hcv7aFcw4vJE6nuxChAcbDMzjzJ8
 pfMSQHt1nChVxiDnYMStc+FvUMPncWUmurrOoM/bKQI6Byij/J2JqJSYnLp7Be/ppz3z
 Hq3w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references;
 bh=7xgwcYWpQF7hmZEi+axwrpWRaGn1fsxoBJfi6eNB9G8=;
 b=MJ044j1gEMUVH8qN6CTO0w2GZBpurpb13yxzbUCxfRDMRPpyVBy8/tUEoooYRuY5uY
 +AE2zP50dtPdAXoHijzEKLh++GBlYj9Tggxyt8Q8y7dBJIJ2vxYqTU7G/1Zk/VsV+Rvu
 On+Tczbp1JAkLTIBoWNT3QG68imHspG9ASTUJjvj/SXq7GoRg4lSyNblwmOtU5kgYpSr
 7lM4SYKCALsvi0yG0iw4Ju1JuubvwYB5MOF2caI2y1LwrevHEs68K1uUNbWYHXCT41Qx
 +8cPeGDE5tqKPvPQRSLYB1Fk4wUuHTYJ+mzLGMdvcJG0+2Tm6rD0b1RrdvcgmtsU7h1/
 W1Rw==
X-Gm-Message-State: AOAM533/s8/U/yAmBJIaPaxZq3cSG2bPKI1W7Y4FplKlAJl/5A05Enen
 0YUMa4XqxPNr5sJnt9uBGHVa1fTMNJs9Dg==
X-Google-Smtp-Source: ABdhPJyISwZDg0v+3Ylyc/Xy5Yr6auZoviHPXm6Kf7ldakzD/vuG7yRbjv40bkilsxxq1yDll4X4GA==
X-Received: by 2002:a37:6c3:: with SMTP id 186mr18743961qkg.457.1597784736612; 
 Tue, 18 Aug 2020 14:05:36 -0700 (PDT)
Received: from localhost (mobile-166-177-184-140.mycingular.net.
 [166.177.184.140])
 by smtp.gmail.com with ESMTPSA id k5sm24434488qtu.2.2020.08.18.14.05.36
 (version=TLS1_2 cipher=ECDHE-ECDSA-CHACHA20-POLY1305 bits=256/256);
 Tue, 18 Aug 2020 14:05:36 -0700 (PDT)
From: Sean Paul <sean@poorly.run>
To: dri-devel@lists.freedesktop.org, ppaalanen@gmail.com,
 maarten.lankhorst@linux.intel.com, mripard@kernel.org, tzimmermann@suse.de,
 seanpaul@chromium.org, airlied@linux.ie
Subject: [PATCH v6 11/14] drm/mst: Convert debug printers to debug category
 printers
Date: Tue, 18 Aug 2020 17:05:07 -0400
Message-Id: <20200818210510.49730-12-sean@poorly.run>
X-Mailer: git-send-email 2.17.1
In-Reply-To: <20200818210510.49730-1-sean@poorly.run>
References: <20200818210510.49730-1-sean@poorly.run>
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
Cc: daniel.vetter@ffwll.ch
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
Link: https://patchwork.freedesktop.org/patch/msgid/20200608210505.48519-12-sean@poorly.run #v5

Changes in v5:
-Added to the set
Changes in v6:
-None
---
 drivers/gpu/drm/drm_dp_mst_topology.c | 9 ++++++---
 1 file changed, 6 insertions(+), 3 deletions(-)

diff --git a/drivers/gpu/drm/drm_dp_mst_topology.c b/drivers/gpu/drm/drm_dp_mst_topology.c
index 67dd72ea200e..127120b60580 100644
--- a/drivers/gpu/drm/drm_dp_mst_topology.c
+++ b/drivers/gpu/drm/drm_dp_mst_topology.c
@@ -1242,7 +1242,8 @@ static int drm_dp_mst_wait_tx_reply(struct drm_dp_mst_branch *mstb,
 	}
 out:
 	if (unlikely(ret == -EIO) && drm_debug_enabled(DRM_UT_DP)) {
-		struct drm_printer p = drm_debug_printer(DBG_PREFIX);
+		struct drm_printer p = drm_debug_category_printer(DRM_UT_DP,
+								  DBG_PREFIX);
 
 		drm_dp_mst_dump_sideband_msg_tx(&p, txmsg);
 	}
@@ -2781,7 +2782,8 @@ static int process_single_tx_qlock(struct drm_dp_mst_topology_mgr *mgr,
 
 	ret = drm_dp_send_sideband_msg(mgr, up, chunk, idx);
 	if (unlikely(ret) && drm_debug_enabled(DRM_UT_DP)) {
-		struct drm_printer p = drm_debug_printer(DBG_PREFIX);
+		struct drm_printer p = drm_debug_category_printer(DRM_UT_DP,
+								  DBG_PREFIX);
 
 		drm_printf(&p, "sideband msg failed to send\n");
 		drm_dp_mst_dump_sideband_msg_tx(&p, txmsg);
@@ -2825,7 +2827,8 @@ static void drm_dp_queue_down_tx(struct drm_dp_mst_topology_mgr *mgr,
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
