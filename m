Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 92326265CE6
	for <lists+dri-devel@lfdr.de>; Fri, 11 Sep 2020 11:50:20 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 2DA386E9B9;
	Fri, 11 Sep 2020 09:49:40 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from youngberry.canonical.com (youngberry.canonical.com
 [91.189.89.112])
 by gabe.freedesktop.org (Postfix) with ESMTPS id EF5C56E287
 for <dri-devel@lists.freedesktop.org>; Fri, 11 Sep 2020 03:44:36 +0000 (UTC)
Received: from mail-pf1-f198.google.com ([209.85.210.198])
 by youngberry.canonical.com with esmtps
 (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128) (Exim 4.86_2)
 (envelope-from <koba.ko@canonical.com>) id 1kGZzG-0008DP-Ph
 for dri-devel@lists.freedesktop.org; Fri, 11 Sep 2020 03:44:34 +0000
Received: by mail-pf1-f198.google.com with SMTP id 8so5972890pfx.6
 for <dri-devel@lists.freedesktop.org>; Thu, 10 Sep 2020 20:44:34 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id;
 bh=oBCdh9AHVKn2pvKDjPYbf2p/ubia6a1LMjcyX5qUih0=;
 b=LnfM+UW8zNYLf5UhajIsID6ncXjhAh2oP85FXg2USNpk0zcQ6b1Z+XaLw0JYb9DvG6
 TZ9GL/XNki0LbRd2r7vyZ9GnbJ2tx8dVCCgkc5M029ukiu1Xb6yBDFALSAB6MIVjJ/da
 sPgEderRimNe19GqPnYRkhOEnZqgrK+BoEqSFYUWf1IGqi5i/DcvdLfjBvEObxl6Gvf3
 NwQAuU4WVKXYuhWIjoH90sQ+/AnqXEw/+NBJoV/NtCiRq/fckxXRGYRk5Nfxm1u5KFmd
 umWi79kyC3fjyMp+iZ3BShvUq0P2oopQs3rpUotYWY1aIYC06cQJHO9t6ruSm/B4Bu+c
 BnQA==
X-Gm-Message-State: AOAM5338nrHT52frFyEyB2IURQIIwxv1nY4/ArDuTc4MuIPg7TobW3/q
 BWNeziLKIrGUMjJo62izxKcAJSJxf6yjYzpqZjG12f1sgwUZNa3gH14GxTY1Vdcu8Yy/g5uarDP
 FqE+yRWqJc15PmdgObOvhW2Rzlo5QGjtUsdzGIWP+XMTyxg==
X-Received: by 2002:a17:902:c253:: with SMTP id 19mr52939plg.65.1599795873446; 
 Thu, 10 Sep 2020 20:44:33 -0700 (PDT)
X-Google-Smtp-Source: ABdhPJyY4uaVpMyLnMtK0DRHCZhKP7Ii+rxYMe3wFJYMXiN3+HVrxw7f0xI1ZOkDROwv497nOMpnJg==
X-Received: by 2002:a17:902:c253:: with SMTP id 19mr52922plg.65.1599795873124; 
 Thu, 10 Sep 2020 20:44:33 -0700 (PDT)
Received: from canonical.com (61-220-137-37.HINET-IP.hinet.net.
 [61.220.137.37])
 by smtp.gmail.com with ESMTPSA id q7sm415031pgg.10.2020.09.10.20.44.32
 (version=TLS1_2 cipher=ECDHE-ECDSA-CHACHA20-POLY1305 bits=256/256);
 Thu, 10 Sep 2020 20:44:32 -0700 (PDT)
From: Koba Ko <koba.ko@canonical.com>
To: Maarten Lankhorst <maarten.lankhorst@linux.intel.com>,
 Maxime Ripard <mripard@kernel.org>,
 Thomas Zimmermann <tzimmermann@suse.de>, David Airlie <airlied@linux.ie>,
 Daniel Vetter <daniel@ffwll.ch>, Lyude Paul <lyude@redhat.com>,
 dri-devel@lists.freedesktop.org, linux-kernel@vger.kernel.org
Subject: [PATCH v3] drm/dp_mst: Retrieve extended DPCD caps for topology
 manager
Date: Fri, 11 Sep 2020 11:44:31 +0800
Message-Id: <20200911034431.29059-1-koba.ko@canonical.com>
X-Mailer: git-send-email 2.17.1
X-Mailman-Approved-At: Fri, 11 Sep 2020 09:49:36 +0000
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
If DP_EXTENDED_RECEIVER_CAP_FIELD_PRESENT is 1, read the DP_DP13_DPCD_REV to
get the faster capability.
If DP_EXTENDED_RECEIVER_CAP_FIELD_PRESENT is 0, read DP_DPCD_REV.

Signed-off-by: Koba Ko <koba.ko@canonical.com>
Reviewed-by: Lyude Paul <lyude@redhat.com>
---
Changelog:
1. Adjust the commit message.
2. use drm_dbg_kms instead and print the return code.
---
 drivers/gpu/drm/drm_dp_mst_topology.c | 14 +++-----------
 1 file changed, 3 insertions(+), 11 deletions(-)

diff --git a/drivers/gpu/drm/drm_dp_mst_topology.c b/drivers/gpu/drm/drm_dp_mst_topology.c
index 7753c718ddf9..63f8809b9aa4 100644
--- a/drivers/gpu/drm/drm_dp_mst_topology.c
+++ b/drivers/gpu/drm/drm_dp_mst_topology.c
@@ -3671,8 +3671,6 @@ EXPORT_SYMBOL(drm_dp_read_mst_cap);
 int drm_dp_mst_topology_mgr_set_mst(struct drm_dp_mst_topology_mgr *mgr, bool mst_state)
 {
 	int ret = 0;
-	u8 dpcd_ext = 0;
-	unsigned int dpcd_offset = 0;
 	struct drm_dp_mst_branch *mstb = NULL;
 
 	mutex_lock(&mgr->payload_lock);
@@ -3686,17 +3684,11 @@ int drm_dp_mst_topology_mgr_set_mst(struct drm_dp_mst_topology_mgr *mgr, bool ms
 		struct drm_dp_payload reset_pay;
 
 		WARN_ON(mgr->mst_primary);
-		drm_dp_dpcd_read(mgr->aux,
-				 DP_TRAINING_AUX_RD_INTERVAL,
-				 &dpcd_ext, sizeof(dpcd_ext));
-
-		dpcd_offset =
-			((dpcd_ext & DP_EXTENDED_RECEIVER_CAP_FIELD_PRESENT) ?  DP_DP13_DPCD_REV : DP_DPCD_REV);
 
 		/* get dpcd info */
-		ret = drm_dp_dpcd_read(mgr->aux, dpcd_offset, mgr->dpcd, DP_RECEIVER_CAP_SIZE);
-		if (ret != DP_RECEIVER_CAP_SIZE) {
-			DRM_DEBUG_KMS("failed to read DPCD\n");
+		ret = drm_dp_read_dpcd_caps(mgr->aux, mgr->dpcd);
+		if (ret < 0) {
+			drm_dbg_kms(mgr->dev, "failed to read DPCD, ret %d\n", ret);
 			goto out_unlock;
 		}
 
-- 
2.25.1

_______________________________________________
dri-devel mailing list
dri-devel@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/dri-devel
