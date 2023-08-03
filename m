Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id D6C3176E441
	for <lists+dri-devel@lfdr.de>; Thu,  3 Aug 2023 11:23:58 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id DFBF410E05E;
	Thu,  3 Aug 2023 09:23:56 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-lf1-x131.google.com (mail-lf1-x131.google.com
 [IPv6:2a00:1450:4864:20::131])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 177F810E05E
 for <dri-devel@lists.freedesktop.org>; Thu,  3 Aug 2023 09:23:55 +0000 (UTC)
Received: by mail-lf1-x131.google.com with SMTP id
 2adb3069b0e04-4fe2d152f62so1282217e87.0
 for <dri-devel@lists.freedesktop.org>; Thu, 03 Aug 2023 02:23:54 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=semihalf.com; s=google; t=1691054633; x=1691659433;
 h=content-transfer-encoding:mime-version:message-id:date:subject:cc
 :to:from:from:to:cc:subject:date:message-id:reply-to;
 bh=DKE5RPCVa4ZdeYnCra9n15ebxdPiozynuD4jWbZ/+EU=;
 b=Fl5doOIX4WD/qvdR+ht1Wd1QHAIDUlpDjXH/YRXlTANpbCIZ8AbkIE65tOb+ZaA1ol
 DKcZeCM5YBmjp2AmbNLj9kGa0x8UIe9hfqfvK9hCWUdoEtvCaQgogCQRWmovC5PVcF/T
 05xE9fzq2Pqlu55FnPXJ73/YS5Cn6r46OBJdLgLvbzDz1pYSw+XVECDU8VBRsOglZ83E
 FBlQysam9VW5iHy1N44Xrzg5965F7mlwNQ+AMGxRa2xP0qUNbWkaeOzohS+8PCqX6T5P
 dYzJtp7QPr+foHHCIGVSUSDreQsPxO9/Zi85C6H6U5mcQFOuO7LNKVgZjy1JzXbDHkrL
 roVg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20221208; t=1691054633; x=1691659433;
 h=content-transfer-encoding:mime-version:message-id:date:subject:cc
 :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
 :reply-to;
 bh=DKE5RPCVa4ZdeYnCra9n15ebxdPiozynuD4jWbZ/+EU=;
 b=YG4dbTDfJVj7cc4bkHeP02ZY3kEaJgPCCaFY7KxUVfNmCR6G+a5S0I5WtnI4Mr/C8u
 +vRR2Nae6K7LpmzFFZM+mkGcjQ4kgEXiE5MKlwVAhtne+HPQF9yHNgS6qZvtVyWmmPXw
 kvEHh2kXNBpv+TEnkDOLhsMDvthtx40Qx4pi/SUFeEb+m5SIwhBcpo7NV4CLEcLzymlk
 eU9g/YsToQmpyFbeqjLYh7x1KieGPEyAVQ0Qvs8FNcejNkApf7D8x31pZ/1EIkA+kBpz
 uN5U+vXZzYim6IvCZwJUVV5+TiVVlniqzoWH/3rBBp0gObHfGsCtELbmj+s4lCNPCYup
 jwLA==
X-Gm-Message-State: ABy/qLax0U7/X+G6tyJ/fvaqdlAVtIwVav77kdy56Cawc5bnX0KStHdm
 tvcjya3+Tzw3oHNir1KNTR9p27zGtceLgmel70A=
X-Google-Smtp-Source: APBJJlGcKEvuwsZDe77Nz1Pb30gbPEvm1CNLmx3c4bRUnw9Q3s/GD77kQYFkTGOXIxrIYkh9KPUcsg==
X-Received: by 2002:a05:6512:546:b0:4f6:6b:a43b with SMTP id
 h6-20020a056512054600b004f6006ba43bmr5967812lfl.52.1691054633058; 
 Thu, 03 Aug 2023 02:23:53 -0700 (PDT)
Received: from lmajczak1-l.roam.corp.google.com ([83.142.187.84])
 by smtp.gmail.com with ESMTPSA id
 q19-20020ac25293000000b004fe0ab60530sm3306750lfm.49.2023.08.03.02.23.52
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Thu, 03 Aug 2023 02:23:52 -0700 (PDT)
From: Lukasz Majczak <lma@semihalf.com>
To: David Airlie <airlied@gmail.com>,
	Daniel Vetter <daniel@ffwll.ch>
Subject: [PATCH] drm/dp_mst: Fix NULL deref in
 get_mst_branch_device_by_guid_helper()
Date: Thu,  3 Aug 2023 11:23:08 +0200
Message-ID: <20230803092308.79197-1-lma@semihalf.com>
X-Mailer: git-send-email 2.41.0.640.ga95def55d0-goog
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
Cc: upstream@semihalf.com, Guenter Roeck <linux@roeck-us.net>,
 linux-kernel@vger.kernel.org, stable@vger.kernel.org,
 dri-devel@lists.freedesktop.org, Lukasz Majczak <lma@semihalf.com>
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

Check mgr->mst_primary, before passing it to
the get_mst_branch_device_by_guid_helper(), otherwise NULL dereference
may occur in the call to memcpy() and cause:

[12579.365869] BUG: kernel NULL pointer dereference, address: 0000000000000049
[12579.365878] #PF: supervisor read access in kernel mode
[12579.365880] #PF: error_code(0x0000) - not-present page
[12579.365882] PGD 0 P4D 0
[12579.365887] Oops: 0000 [#1] PREEMPT SMP NOPTI
...
[12579.365895] Workqueue: events_long drm_dp_mst_up_req_work
[12579.365899] RIP: 0010:memcmp+0xb/0x29
[12579.365921] Call Trace:
[12579.365927] get_mst_branch_device_by_guid_helper+0x22/0x64
[12579.365930] drm_dp_mst_up_req_work+0x137/0x416
[12579.365933] process_one_work+0x1d0/0x419
[12579.365935] worker_thread+0x11a/0x289
[12579.365938] kthread+0x13e/0x14f
[12579.365941] ? process_one_work+0x419/0x419
[12579.365943] ? kthread_blkcg+0x31/0x31
[12579.365946] ret_from_fork+0x1f/0x30

Similar check is done in e.g: drm_dp_mst_topology_get_mstb_validated().

Fixes: 5e93b8208d3c ("drm/dp/mst: move GUID storage from mgr, port to only mst branch")
Cc: <stable@vger.kernel.org> # 4.14+
Signed-off-by: Lukasz Majczak <lma@semihalf.com>
---
 drivers/gpu/drm/display/drm_dp_mst_topology.c | 16 ++++++++--------
 1 file changed, 8 insertions(+), 8 deletions(-)

diff --git a/drivers/gpu/drm/display/drm_dp_mst_topology.c b/drivers/gpu/drm/display/drm_dp_mst_topology.c
index ed96cfcfa304..703cd97b1d11 100644
--- a/drivers/gpu/drm/display/drm_dp_mst_topology.c
+++ b/drivers/gpu/drm/display/drm_dp_mst_topology.c
@@ -2595,19 +2595,19 @@ static struct drm_dp_mst_branch *
 drm_dp_get_mst_branch_device_by_guid(struct drm_dp_mst_topology_mgr *mgr,
 				     const uint8_t *guid)
 {
-	struct drm_dp_mst_branch *mstb;
+	struct drm_dp_mst_branch *mstb = NULL;
 	int ret;
 
 	/* find the port by iterating down */
 	mutex_lock(&mgr->lock);
-
-	mstb = get_mst_branch_device_by_guid_helper(mgr->mst_primary, guid);
-	if (mstb) {
-		ret = drm_dp_mst_topology_try_get_mstb(mstb);
-		if (!ret)
-			mstb = NULL;
+	if (mgr->mst_primary) {
+		mstb = get_mst_branch_device_by_guid_helper(mgr->mst_primary, guid);
+		if (mstb) {
+			ret = drm_dp_mst_topology_try_get_mstb(mstb);
+			if (!ret)
+				mstb = NULL;
+		}
 	}
-
 	mutex_unlock(&mgr->lock);
 	return mstb;
 }
-- 
2.41.0.640.ga95def55d0-goog

