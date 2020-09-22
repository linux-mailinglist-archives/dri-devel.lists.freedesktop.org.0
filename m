Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 6FBFD273C88
	for <lists+dri-devel@lfdr.de>; Tue, 22 Sep 2020 09:49:06 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id E30136E826;
	Tue, 22 Sep 2020 07:49:00 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from youngberry.canonical.com (youngberry.canonical.com
 [91.189.89.112])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 5271B6E0AD
 for <dri-devel@lists.freedesktop.org>; Tue, 22 Sep 2020 06:53:19 +0000 (UTC)
Received: from mail-pf1-f198.google.com ([209.85.210.198])
 by youngberry.canonical.com with esmtps
 (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128) (Exim 4.86_2)
 (envelope-from <koba.ko@canonical.com>) id 1kKcAv-0003zj-I9
 for dri-devel@lists.freedesktop.org; Tue, 22 Sep 2020 06:53:17 +0000
Received: by mail-pf1-f198.google.com with SMTP id g8so10531708pfq.15
 for <dri-devel@lists.freedesktop.org>; Mon, 21 Sep 2020 23:53:17 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id;
 bh=w9iqaz4NmjNGwlYOvyMuR9M9SYy/rnYZVpOGW5l2Yx8=;
 b=iw59XWlZyEO57ESCSdo4/Fa3YW1mCur4K1dHCJTv8ZIvLN2eV3VMkv5sRhNA7rPzg/
 zhzsZ08sCL4xazylD9zepTjuBJ3IOZbPgh+mY25a+m+IqY9gtGLwbKOPcZFzu88KcP2q
 dfgP8vP/Wk+7z+a5erG+7TDsZtkNXcZywJF2pGu9SrfA0GK289qcf0fYhgGPzWA1tjQJ
 PjLu5PIZuzgG2EL5l1GN9h/F263n5ttmoRNEHebQv5rSv8hcT3soXlRX7bPpI7J0K9Bk
 oavvrUN/U02c0xYfFcFv/CzsdhzhQF+nw/2n0g8r6pvaADD1b7Uh4ypCCOH+NdemSQ2r
 5vwQ==
X-Gm-Message-State: AOAM530XuPNNilJ9nYHEnnFVy22fG06TPiHJaN/3/Jw8YdrslVWPEaVF
 Uo6gCSS7HTDMnwwSvwrQ6jCQjBnALQwXrAIOgrx0OB7MP8eIaEKTKvddHlvM5xopTlUCbgHhLl0
 1AZoGVTXsN6Rt9f2FvUzbhVKVkYXw8PlHc4CLQGN1VtiOAg==
X-Received: by 2002:aa7:93a2:0:b029:142:2501:39f4 with SMTP id
 x2-20020aa793a20000b0290142250139f4mr2866566pff.67.1600757596152; 
 Mon, 21 Sep 2020 23:53:16 -0700 (PDT)
X-Google-Smtp-Source: ABdhPJzNg1FrNUOYNUMcUorUSwdMpymWxJcD36ivwwRqyApLFMfCl7hC/L7diiu9Fxoog4xeBBrkfw==
X-Received: by 2002:aa7:93a2:0:b029:142:2501:39f4 with SMTP id
 x2-20020aa793a20000b0290142250139f4mr2866542pff.67.1600757595700; 
 Mon, 21 Sep 2020 23:53:15 -0700 (PDT)
Received: from canonical.com (61-220-137-37.HINET-IP.hinet.net.
 [61.220.137.37])
 by smtp.gmail.com with ESMTPSA id y12sm7046142pga.53.2020.09.21.23.53.14
 (version=TLS1_2 cipher=ECDHE-ECDSA-CHACHA20-POLY1305 bits=256/256);
 Mon, 21 Sep 2020 23:53:15 -0700 (PDT)
From: Koba Ko <koba.ko@canonical.com>
To: Maarten Lankhorst <maarten.lankhorst@linux.intel.com>,
 Maxime Ripard <mripard@kernel.org>,
 Thomas Zimmermann <tzimmermann@suse.de>, David Airlie <airlied@linux.ie>,
 Daniel Vetter <daniel@ffwll.ch>, Lyude Paul <lyude@redhat.com>,
 dri-devel@lists.freedesktop.org, linux-kernel@vger.kernel.org
Subject: [PATCH V4] drm/dp_mst: Retrieve extended DPCD caps for topology
 manager
Date: Tue, 22 Sep 2020 14:53:13 +0800
Message-Id: <20200922065313.4794-1-koba.ko@canonical.com>
X-Mailer: git-send-email 2.17.1
X-Mailman-Approved-At: Tue, 22 Sep 2020 07:46:35 +0000
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
Cc: anthony.wong@canonical.com
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

As per DP-1.3, First check DP_EXTENDED_RECEIVER_CAP_FIELD_PRESENT.
If DP_EXTENDED_RECEIVER_CAP_FIELD_PRESENT is 1,read the DP_DP13_DPCD_REV to
get the faster capability.
If DP_EXTENDED_RECEIVER_CAP_FIELD_PRESENT is 0,read DP_DPCD_REV.

Signed-off-by: Koba Ko <koba.ko@canonical.com>
Reviewed-by: Lyude Paul <lyude@redhat.com>
---
 drivers/gpu/drm/drm_dp_mst_topology.c | 6 +++---
 1 file changed, 3 insertions(+), 3 deletions(-)

diff --git a/drivers/gpu/drm/drm_dp_mst_topology.c b/drivers/gpu/drm/drm_dp_mst_topology.c
index e87542533640..63f8809b9aa4 100644
--- a/drivers/gpu/drm/drm_dp_mst_topology.c
+++ b/drivers/gpu/drm/drm_dp_mst_topology.c
@@ -3686,9 +3686,9 @@ int drm_dp_mst_topology_mgr_set_mst(struct drm_dp_mst_topology_mgr *mgr, bool ms
 		WARN_ON(mgr->mst_primary);
 
 		/* get dpcd info */
-		ret = drm_dp_dpcd_read(mgr->aux, DP_DPCD_REV, mgr->dpcd, DP_RECEIVER_CAP_SIZE);
-		if (ret != DP_RECEIVER_CAP_SIZE) {
-			DRM_DEBUG_KMS("failed to read DPCD\n");
+		ret = drm_dp_read_dpcd_caps(mgr->aux, mgr->dpcd);
+		if (ret < 0) {
+			drm_dbg_kms(mgr->dev, "failed to read DPCD, ret %d\n", ret);
 			goto out_unlock;
 		}
 
-- 
2.17.1

_______________________________________________
dri-devel mailing list
dri-devel@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/dri-devel
