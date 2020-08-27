Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 2657E253E67
	for <lists+dri-devel@lfdr.de>; Thu, 27 Aug 2020 08:58:33 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 06D446EB54;
	Thu, 27 Aug 2020 06:57:44 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from youngberry.canonical.com (youngberry.canonical.com
 [91.189.89.112])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 0167889F77
 for <dri-devel@lists.freedesktop.org>; Thu, 27 Aug 2020 05:30:58 +0000 (UTC)
Received: from mail-pf1-f200.google.com ([209.85.210.200])
 by youngberry.canonical.com with esmtps
 (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128) (Exim 4.86_2)
 (envelope-from <koba.ko@canonical.com>) id 1kBAUz-0004Xl-Iy
 for dri-devel@lists.freedesktop.org; Thu, 27 Aug 2020 05:30:57 +0000
Received: by mail-pf1-f200.google.com with SMTP id 129so3264225pfv.6
 for <dri-devel@lists.freedesktop.org>; Wed, 26 Aug 2020 22:30:57 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id;
 bh=bf2rqF6BAK5D4hPugV7d7delD8442g8W9XT02V7+aCE=;
 b=Q3H7CkbNez7Cf0m+ZkGQ1wGriKw9NGWTRQSw53OR9evO3dCQRQxlJqKFgEpmi+vy9f
 Wm16sl/WX51arTp8hbOsWenzHkvKj10UwLQTBbVRAiNRTd4Cl0M6yZgx+bjFRo46fTlV
 xp2elN3heOc/lKpMCTJgpxc7g6VOOVChORVLOaknNGDdGAajd4mR+QGH5tGIs17Cjg78
 4RNFD2nK/VmuxFI3Hb2tspQ9fpjVfxL+Lo74VnwTOjTX4OjBlVDaZDzl4XC1BD4gNxzi
 0kBR0IdFZQiYObQERBp13/PNZPXBswCcNAPlyC0If9G8LlYGjdbBGI8r6Jju82GUzW3j
 5p+g==
X-Gm-Message-State: AOAM531s7rMTsPKg7GQ+qHegM6fplAX6P0CZYVi79AwclVNv5HrApI1e
 TeSBD8sWTRgy1jM3m/WjbWj3KeS+pxckmWjbPSL6OkXqJkxkavZ99T5h1JAL/bgRNXWIZcFFn4n
 oBtGVLdCAVdlBAK0EiRpCVggxfJnG0ZIXC50eGYHa6Yw2oQ==
X-Received: by 2002:a63:af47:: with SMTP id s7mr13687767pgo.335.1598506256182; 
 Wed, 26 Aug 2020 22:30:56 -0700 (PDT)
X-Google-Smtp-Source: ABdhPJwqTU9o5RiGepVidVskRAeoiz/nKhzhE7ecXbU0gvHzio5d3WOpAq9QOlQgyA8tcBUo/I2/rg==
X-Received: by 2002:a63:af47:: with SMTP id s7mr13687753pgo.335.1598506255857; 
 Wed, 26 Aug 2020 22:30:55 -0700 (PDT)
Received: from canonical.com (61-220-137-37.HINET-IP.hinet.net.
 [61.220.137.37])
 by smtp.gmail.com with ESMTPSA id n68sm1000195pfn.145.2020.08.26.22.30.55
 (version=TLS1_2 cipher=ECDHE-ECDSA-CHACHA20-POLY1305 bits=256/256);
 Wed, 26 Aug 2020 22:30:55 -0700 (PDT)
From: Koba Ko <koba.ko@canonical.com>
To: Maarten Lankhorst <maarten.lankhorst@linux.intel.com>,
 Maxime Ripard <mripard@kernel.org>,
 Thomas Zimmermann <tzimmermann@suse.de>, David Airlie <airlied@linux.ie>,
 Daniel Vetter <daniel@ffwll.ch>, dri-devel@lists.freedesktop.org,
 linux-kernel@vger.kernel.org
Subject: [PATCH] drm/dp: For MST hub,
 Get max_link_rate&max_lane from extended rx capability field if
 EXTENDED_RECEIVER_CAPABILITY_FILED_PRESENT is set.
Date: Thu, 27 Aug 2020 13:30:53 +0800
Message-Id: <20200827053053.11271-1-koba.ko@canonical.com>
X-Mailer: git-send-email 2.17.1
X-Mailman-Approved-At: Thu, 27 Aug 2020 06:57:36 +0000
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

Currently, DRM get the capability of the mst hub only from DP_DPCD_REV and
get the slower speed even the mst hub can run in the faster speed.

As per DP-1.3, First check DP_EXTENDED_RECEIVER_CAP_FIELD_PRESENT.
If DP_EXTENDED_RECEIVER_CAP_FIELD_PRESENT is 1, read the DP_DP13_DPCD_REV to
get the faster capability.
If DP_EXTENDED_RECEIVER_CAP_FIELD_PRESENT is 0, read DP_DPCD_REV.

Signed-off-by: Koba Ko <koba.ko@canonical.com>
---
 drivers/gpu/drm/drm_dp_mst_topology.c | 10 +++++++++-
 1 file changed, 9 insertions(+), 1 deletion(-)

diff --git a/drivers/gpu/drm/drm_dp_mst_topology.c b/drivers/gpu/drm/drm_dp_mst_topology.c
index 67dd72ea200e..3b84c6801281 100644
--- a/drivers/gpu/drm/drm_dp_mst_topology.c
+++ b/drivers/gpu/drm/drm_dp_mst_topology.c
@@ -3497,6 +3497,8 @@ static int drm_dp_get_vc_payload_bw(u8 dp_link_bw, u8  dp_link_count)
 int drm_dp_mst_topology_mgr_set_mst(struct drm_dp_mst_topology_mgr *mgr, bool mst_state)
 {
 	int ret = 0;
+	u8 dpcd_ext = 0;
+	unsigned int dpcd_offset = 0;
 	struct drm_dp_mst_branch *mstb = NULL;
 
 	mutex_lock(&mgr->payload_lock);
@@ -3510,9 +3512,15 @@ int drm_dp_mst_topology_mgr_set_mst(struct drm_dp_mst_topology_mgr *mgr, bool ms
 		struct drm_dp_payload reset_pay;
 
 		WARN_ON(mgr->mst_primary);
+		drm_dp_dpcd_read(mgr->aux,
+				 DP_TRAINING_AUX_RD_INTERVAL,
+				 &dpcd_ext, sizeof(dpcd_ext));
+
+		dpcd_offset =
+			((dpcd_ext & DP_EXTENDED_RECEIVER_CAP_FIELD_PRESENT) ?  DP_DP13_DPCD_REV : DP_DPCD_REV);
 
 		/* get dpcd info */
-		ret = drm_dp_dpcd_read(mgr->aux, DP_DPCD_REV, mgr->dpcd, DP_RECEIVER_CAP_SIZE);
+		ret = drm_dp_dpcd_read(mgr->aux, dpcd_offset, mgr->dpcd, DP_RECEIVER_CAP_SIZE);
 		if (ret != DP_RECEIVER_CAP_SIZE) {
 			DRM_DEBUG_KMS("failed to read DPCD\n");
 			goto out_unlock;
-- 
2.25.1

_______________________________________________
dri-devel mailing list
dri-devel@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/dri-devel
