Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 65C7EB54C44
	for <lists+dri-devel@lfdr.de>; Fri, 12 Sep 2025 14:04:15 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id BA55010EC2F;
	Fri, 12 Sep 2025 12:04:13 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=astralinux.ru header.i=@astralinux.ru header.b="XoAxeWzT";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-gw02.astralinux.ru (mail-gw02.astralinux.ru
 [93.188.205.243])
 by gabe.freedesktop.org (Postfix) with ESMTPS id E727210EC32;
 Fri, 12 Sep 2025 12:04:12 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=astralinux.ru;
 s=mail; t=1757678651;
 bh=2KXka414fCOALlXKBNLhsY7WlMq13LlLKLbzudZG4YY=;
 h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
 b=XoAxeWzTyG7Fb4pSfurGCFfrQ13WWrJip9p79kBrYizQGDaTITvKoSi2csSV4RHWU
 g7Rr3E22WsqDOtDBvVA5ZY7rHLeruKv0a7EWNEU2JJMABOjI6ztICpXXuLLer1nCvr
 M0lJvNJhebt090fXVRrQVPTKnCcTHVwWg4mv7h8pVRfG5aMjQOccv5j8+K4VF8f08c
 5S15s7qpRjFVgQ5reAV1XA9CHSMG5EIb+QBQR1KeEBUve+by63lOh7SGDwufu2eVqc
 pi/qekhPKRxhGj3xcRLH/ownpoX6adQxVtsqD0moD+vtdI1kNQ85zSMEb+VgpsghBl
 C/ok8gI7ZVkCA==
Received: from gca-msk-a-srv-ksmg01.astralinux.ru (localhost [127.0.0.1])
 by mail-gw02.astralinux.ru (Postfix) with ESMTP id 5294A1FA00;
 Fri, 12 Sep 2025 15:04:11 +0300 (MSK)
Received: from new-mail.astralinux.ru (unknown [10.177.185.199])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
 (No client certificate requested)
 by mail-gw02.astralinux.ru (Postfix) with ESMTPS;
 Fri, 12 Sep 2025 15:04:10 +0300 (MSK)
Received: from rbta-msk-lt-169874.astralinux.site (unknown [10.198.57.215])
 by new-mail.astralinux.ru (Postfix) with ESMTPA id 4cNY4R041sz2xDf;
 Fri, 12 Sep 2025 15:04:06 +0300 (MSK)
From: Mikhail Dmitrichenko <mdmitrichenko@astralinux.ru>
To: stable@vger.kernel.org,
	Greg Kroah-Hartman <gregkh@linuxfoundation.org>
Cc: Mikhail Dmitrichenko <mdmitrichenko@astralinux.ru>,
 Michal Wajdeczko <michal.wajdeczko@intel.com>,
 Matthew Brost <matthew.brost@intel.com>,
 Rodrigo Vivi <rodrigo.vivi@intel.com>,
 Maarten Lankhorst <maarten.lankhorst@linux.intel.com>,
 Maxime Ripard <mripard@kernel.org>,
 Thomas Zimmermann <tzimmermann@suse.de>, David Airlie <airlied@gmail.com>,
 Simona Vetter <simona@ffwll.ch>,
 Francois Dugast <francois.dugast@intel.com>,
 intel-xe@lists.freedesktop.org, dri-devel@lists.freedesktop.org,
 linux-kernel@vger.kernel.org, lvc-project@linuxtesting.org,
 Shuicheng Lin <shuicheng.lin@intel.com>
Subject: [PATCH v2 6.12 3/3] drm/xe/hw_engine_group: Avoid call kfree() for
 drmm_kzalloc()
Date: Fri, 12 Sep 2025 15:02:01 +0300
Message-Id: <20250912120202.240305-3-mdmitrichenko@astralinux.ru>
X-Mailer: git-send-email 2.39.2
In-Reply-To: <20250912120202.240305-1-mdmitrichenko@astralinux.ru>
References: <20250912120202.240305-1-mdmitrichenko@astralinux.ru>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-KSMG-AntiPhishing: NotDetected, bases: 2025/09/12 10:31:00
X-KSMG-AntiSpam-Auth: dkim=none
X-KSMG-AntiSpam-Envelope-From: mdmitrichenko@astralinux.ru
X-KSMG-AntiSpam-Info: LuaCore: 66 0.3.66
 fc5dda3b6b70d34b3701db39319eece2aeb510fb, {Tracking_uf_ne_domains},
 {Tracking_from_domain_doesnt_match_to},
 {Tracking_spam_in_reply_from_match_msgid}, astralinux.ru:7.1.1;
 new-mail.astralinux.ru:7.1.1; 127.0.0.199:7.1.2; lore.kernel.org:7.1.1;
 d41d8cd98f00b204e9800998ecf8427e.com:7.1.1, FromAlignment: s
X-KSMG-AntiSpam-Interceptor-Info: scan successful
X-KSMG-AntiSpam-Lua-Profiles: 196220 [Sep 12 2025]
X-KSMG-AntiSpam-Method: none
X-KSMG-AntiSpam-Rate: 0
X-KSMG-AntiSpam-Status: not_detected
X-KSMG-AntiSpam-Version: 6.1.1.11
X-KSMG-AntiVirus: Kaspersky Secure Mail Gateway, version 2.1.0.7854,
 bases: 2025/09/12 09:49:00 #27811571
X-KSMG-AntiVirus-Status: NotDetected, skipped
X-KSMG-LinksScanning: NotDetected, bases: 2025/09/12 11:18:00
X-KSMG-Message-Action: skipped
X-KSMG-Rule-ID: 1
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

From: Shuicheng Lin <shuicheng.lin@intel.com>

commit 4846856c3a4afa882b6d1b842ed2fad6f3781f4d upstream.

Memory allocated with drmm_kzalloc() should not be freed using
kfree(), as it is managed by the DRM subsystem. The memory will
be automatically freed when the associated drm_device is released.
These 3 group pointers are allocated using drmm_kzalloc() in
hw_engine_group_alloc(), so they don't require manual deallocation.

Fixes: 67979060740f ("drm/xe/hw_engine_group: Fix potential leak")
Signed-off-by: Shuicheng Lin <shuicheng.lin@intel.com>
Reviewed-by: Matthew Brost <matthew.brost@intel.com>
Signed-off-by: Michal Wajdeczko <michal.wajdeczko@intel.com>
Link: https://lore.kernel.org/r/20250724193854.1124510-2-shuicheng.lin@intel.com
(cherry picked from commit f98de826b418885a21ece67f0f5b921ae759b7bf)
Signed-off-by: Rodrigo Vivi <rodrigo.vivi@intel.com>
Signed-off-by: Mikhail Dmitrichenko <mdmitrichenko@astralinux.ru>
---
v2: upstream commit 67979060740f7f978c8cb580ccea6c91154150f9 was
included in PATCH v2 2/3 because it also doesn't present in 6.12 
and commit 4846856c3a4afa882b6d1b842ed2fad6f3781f4d fixes
issue from 67979060740f7f978c8cb580ccea6c91154150f9. Upstream
commit c367b772e6d89d8c7b560c7df7e3803ce6b8bcea was included
in PATCH v2 1/3 because changes from 
67979060740f7f978c8cb580ccea6c91154150f9 require __drmm_workqueue_release.
 drivers/gpu/drm/xe/xe_hw_engine_group.c | 28 ++++++-------------------
 1 file changed, 6 insertions(+), 22 deletions(-)

diff --git a/drivers/gpu/drm/xe/xe_hw_engine_group.c b/drivers/gpu/drm/xe/xe_hw_engine_group.c
index 9ace3993caee..eef3a6479bfd 100644
--- a/drivers/gpu/drm/xe/xe_hw_engine_group.c
+++ b/drivers/gpu/drm/xe/xe_hw_engine_group.c
@@ -75,25 +75,18 @@ int xe_hw_engine_setup_groups(struct xe_gt *gt)
 	enum xe_hw_engine_id id;
 	struct xe_hw_engine_group *group_rcs_ccs, *group_bcs, *group_vcs_vecs;
 	struct xe_device *xe = gt_to_xe(gt);
-	int err;
 
 	group_rcs_ccs = hw_engine_group_alloc(xe);
-	if (IS_ERR(group_rcs_ccs)) {
-		err = PTR_ERR(group_rcs_ccs);
-		goto err_group_rcs_ccs;
-	}
+	if (IS_ERR(group_rcs_ccs))
+		return PTR_ERR(group_rcs_ccs);
 
 	group_bcs = hw_engine_group_alloc(xe);
-	if (IS_ERR(group_bcs)) {
-		err = PTR_ERR(group_bcs);
-		goto err_group_bcs;
-	}
+	if (IS_ERR(group_bcs))
+		return PTR_ERR(group_bcs);
 
 	group_vcs_vecs = hw_engine_group_alloc(xe);
-	if (IS_ERR(group_vcs_vecs)) {
-		err = PTR_ERR(group_vcs_vecs);
-		goto err_group_vcs_vecs;
-	}
+	if (IS_ERR(group_vcs_vecs))
+		return PTR_ERR(group_vcs_vecs);
 
 	for_each_hw_engine(hwe, gt, id) {
 		switch (hwe->class) {
@@ -116,15 +109,6 @@ int xe_hw_engine_setup_groups(struct xe_gt *gt)
 	}
 
 	return 0;
-
-err_group_vcs_vecs:
-	kfree(group_vcs_vecs);
-err_group_bcs:
-	kfree(group_bcs);
-err_group_rcs_ccs:
-	kfree(group_rcs_ccs);
-
-	return err;
 }
 
 /**
-- 
2.39.2

