Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 45B51263E89
	for <lists+dri-devel@lfdr.de>; Thu, 10 Sep 2020 09:23:05 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id E29146E21E;
	Thu, 10 Sep 2020 07:22:45 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from youngberry.canonical.com (youngberry.canonical.com
 [91.189.89.112])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 62C8089E38
 for <dri-devel@lists.freedesktop.org>; Thu, 10 Sep 2020 06:36:46 +0000 (UTC)
Received: from mail-pj1-f70.google.com ([209.85.216.70])
 by youngberry.canonical.com with esmtps
 (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128) (Exim 4.86_2)
 (envelope-from <koba.ko@canonical.com>) id 1kGGCK-0006uZ-Ic
 for dri-devel@lists.freedesktop.org; Thu, 10 Sep 2020 06:36:44 +0000
Received: by mail-pj1-f70.google.com with SMTP id ng5so1030791pjb.0
 for <dri-devel@lists.freedesktop.org>; Wed, 09 Sep 2020 23:36:44 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id;
 bh=jn9Jem5r6BEp8pI1f0WJBxWG1XIwYaN+OR+bwtjFIhI=;
 b=QCBSH76Nv1jZ4UaCIefX4UuDXtw/ZrHRHNLBdlis0BKQjc//N0bciVEN0/q9+7v/8D
 mbbjm0uT1RH4epaxuXVPog62o+yvLw6szaUKN1zLlbvI2wf9WNYmK4l77BOqmWK2swu1
 M0cgOkNCrjX/pVKATdhyFXTJpDNS1eCDvrmGtAi4RFswj4u6otWzY8pRjkg4h6NGdKzH
 9jy5pOOOCmmNpCTGOOYcNBvl7gVVM3+It0+01Szq8s+Bq2cmlGwuodVkyFkwlZLcYCGa
 krFsvkFXxeE7jRa5/Wv7BRdZu7TjtytqsGdjpa1ggJBLLXTr1dTFYULpUueQq5IfFXKP
 yv9A==
X-Gm-Message-State: AOAM530/TQ9TDiqO+wpD85NFMID9aS/BIyee9lQsn4/lwG2M7tx4TQav
 pnj+HpcOUHXw2H+9oVpa42c9iY63PVJduX0OT1RUcTUNQT+251MmQBGLuPvR6j2JfPTJrOcKjNL
 vnQFeOpJ3SbPXALIlCI0+VuxmC2zX2pA6lGzbztXfnQa/5w==
X-Received: by 2002:a17:902:b20e:: with SMTP id
 t14mr4222702plr.24.1599719802979; 
 Wed, 09 Sep 2020 23:36:42 -0700 (PDT)
X-Google-Smtp-Source: ABdhPJzVXJSJqtSyUbzWKlYyhW0mTxoi/ulhvQkfQjVkVkwZkuKcTn71S+DXLIeEl1YwVQyIguNXgw==
X-Received: by 2002:a17:902:b20e:: with SMTP id
 t14mr4222673plr.24.1599719802575; 
 Wed, 09 Sep 2020 23:36:42 -0700 (PDT)
Received: from canonical.com (61-220-137-37.HINET-IP.hinet.net.
 [61.220.137.37])
 by smtp.gmail.com with ESMTPSA id j9sm4529045pfe.170.2020.09.09.23.36.41
 (version=TLS1_2 cipher=ECDHE-ECDSA-CHACHA20-POLY1305 bits=256/256);
 Wed, 09 Sep 2020 23:36:42 -0700 (PDT)
From: Koba Ko <koba.ko@canonical.com>
To: Maarten Lankhorst <maarten.lankhorst@linux.intel.com>,
 Maxime Ripard <mripard@kernel.org>,
 Thomas Zimmermann <tzimmermann@suse.de>, David Airlie <airlied@linux.ie>,
 Daniel Vetter <daniel@ffwll.ch>, Lyude Paul <lyude@redhat.com>,
 dri-devel@lists.freedesktop.org, linux-kernel@vger.kernel.org
Subject: [PATCH] V2: Currently,
 DRM get the capability of the mst hub only from DP_DPCD_REV and get
 the slower speed even the mst hub can run in the faster speed.
Date: Thu, 10 Sep 2020 14:36:40 +0800
Message-Id: <20200910063640.21519-1-koba.ko@canonical.com>
X-Mailer: git-send-email 2.17.1
X-Mailman-Approved-At: Thu, 10 Sep 2020 07:22:25 +0000
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
---
ChangeLog:
1. use drm_dp_read_dpcd_caps instead.
---
 drivers/gpu/drm/drm_dp_mst_topology.c | 4 ++--
 1 file changed, 2 insertions(+), 2 deletions(-)

diff --git a/drivers/gpu/drm/drm_dp_mst_topology.c b/drivers/gpu/drm/drm_dp_mst_topology.c
index 7753c718ddf9..293f71d0ae90 100644
--- a/drivers/gpu/drm/drm_dp_mst_topology.c
+++ b/drivers/gpu/drm/drm_dp_mst_topology.c
@@ -3694,8 +3694,8 @@ int drm_dp_mst_topology_mgr_set_mst(struct drm_dp_mst_topology_mgr *mgr, bool ms
 			((dpcd_ext & DP_EXTENDED_RECEIVER_CAP_FIELD_PRESENT) ?  DP_DP13_DPCD_REV : DP_DPCD_REV);
 
 		/* get dpcd info */
-		ret = drm_dp_dpcd_read(mgr->aux, dpcd_offset, mgr->dpcd, DP_RECEIVER_CAP_SIZE);
-		if (ret != DP_RECEIVER_CAP_SIZE) {
+		ret = drm_dp_read_dpcd_caps(mgr->aux, mgr->dpcd);
+		if (ret < 0) {
 			DRM_DEBUG_KMS("failed to read DPCD\n");
 			goto out_unlock;
 		}
-- 
2.25.1

_______________________________________________
dri-devel mailing list
dri-devel@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/dri-devel
