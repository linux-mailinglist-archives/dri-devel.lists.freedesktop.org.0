Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 44963B54C48
	for <lists+dri-devel@lfdr.de>; Fri, 12 Sep 2025 14:04:28 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 9B1DE10EC33;
	Fri, 12 Sep 2025 12:04:26 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=astralinux.ru header.i=@astralinux.ru header.b="Izuw2V1j";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-gw02.astralinux.ru (mail-gw02.astralinux.ru
 [93.188.205.243])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 655D510EC32;
 Fri, 12 Sep 2025 12:04:25 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=astralinux.ru;
 s=mail; t=1757678663;
 bh=ebEdQM9PsSFQ7ItLpYWwcNK8uCk7q2IsBEMnpwDG+ek=;
 h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
 b=Izuw2V1jNfMWHloM7KZh10Jif55JHY2rR1LXI6fOosRlMp/YCY4yAqT+AW1G30QXr
 qw1ekYasQXpOmTPdsSA2Mrq+dE/7WrhWGl7HKv8XkzB5wVnHWoy3CtgHoZ8a9rgt5x
 M2wMQLPixDhztcWSXCz8tWqaITxB39XH6vlQq7oYsWbwgZMq3pXl6tK036GXiKTyz6
 8myuPPtvMauVUGPWiLefqgTBDmQqRKWSQ+K4JGzGHFeu9pL0kFZ/Hjo1pa8uCRrCub
 sFcAh3S0lPBSvWAFnKwP+M7cJ3Y/oKduiAaL0vDVov5mFDaSGoRsgV9NEXVq+Gk7PS
 YZ/3JyFe+HhuA==
Received: from gca-msk-a-srv-ksmg01.astralinux.ru (localhost [127.0.0.1])
 by mail-gw02.astralinux.ru (Postfix) with ESMTP id F17981FA00;
 Fri, 12 Sep 2025 15:04:23 +0300 (MSK)
Received: from new-mail.astralinux.ru (unknown [10.177.185.199])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
 (No client certificate requested)
 by mail-gw02.astralinux.ru (Postfix) with ESMTPS;
 Fri, 12 Sep 2025 15:04:23 +0300 (MSK)
Received: from rbta-msk-lt-169874.astralinux.site (unknown [10.198.57.215])
 by new-mail.astralinux.ru (Postfix) with ESMTPA id 4cNY474Kqyz2xCh;
 Fri, 12 Sep 2025 15:03:51 +0300 (MSK)
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
 linux-kernel@vger.kernel.org, lvc-project@linuxtesting.org
Subject: [PATCH v2 6.12 2/3] drm/xe/hw_engine_group: Fix potential leak
Date: Fri, 12 Sep 2025 15:02:00 +0300
Message-Id: <20250912120202.240305-2-mdmitrichenko@astralinux.ru>
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
 {Tracking_spam_in_reply_from_match_msgid},
 d41d8cd98f00b204e9800998ecf8427e.com:7.1.1; new-mail.astralinux.ru:7.1.1;
 lore.kernel.org:7.1.1; astralinux.ru:7.1.1;
 127.0.0.199:7.1.2, FromAlignment: s
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

From: Michal Wajdeczko <michal.wajdeczko@intel.com>

commit 67979060740f7f978c8cb580ccea6c91154150f9 upstream.

If we fail to allocate a workqueue we will leak kzalloc'ed group
object since it was designed to be kfree'ed in the drmm cleanup
action, but we didn't have a chance to register this action yet.

To avoid this leak allocate a group object using drmm_kzalloc()
and start using predefined drmm action to release the workqueue.

Signed-off-by: Michal Wajdeczko <michal.wajdeczko@intel.com>
Reviewed-by: Matthew Brost <matthew.brost@intel.com>
Link: https://lore.kernel.org/r/20250627184143.1480-1-michal.wajdeczko@intel.com
Signed-off-by: Mikhail Dmitrichenko <mdmitrichenko@astralinux.ru>
---
 drivers/gpu/drm/xe/xe_hw_engine_group.c | 19 +++++--------------
 1 file changed, 5 insertions(+), 14 deletions(-)

diff --git a/drivers/gpu/drm/xe/xe_hw_engine_group.c b/drivers/gpu/drm/xe/xe_hw_engine_group.c
index 82750520a90a..9ace3993caee 100644
--- a/drivers/gpu/drm/xe/xe_hw_engine_group.c
+++ b/drivers/gpu/drm/xe/xe_hw_engine_group.c
@@ -12,15 +12,6 @@
 #include "xe_hw_engine_group.h"
 #include "xe_vm.h"
 
-static void
-hw_engine_group_free(struct drm_device *drm, void *arg)
-{
-	struct xe_hw_engine_group *group = arg;
-
-	destroy_workqueue(group->resume_wq);
-	kfree(group);
-}
-
 static void
 hw_engine_group_resume_lr_jobs_func(struct work_struct *w)
 {
@@ -53,7 +44,7 @@ hw_engine_group_alloc(struct xe_device *xe)
 	struct xe_hw_engine_group *group;
 	int err;
 
-	group = kzalloc(sizeof(*group), GFP_KERNEL);
+	group = drmm_kzalloc(&xe->drm, sizeof(*group), GFP_KERNEL);
 	if (!group)
 		return ERR_PTR(-ENOMEM);
 
@@ -61,14 +52,14 @@ hw_engine_group_alloc(struct xe_device *xe)
 	if (!group->resume_wq)
 		return ERR_PTR(-ENOMEM);
 
+	err = drmm_add_action_or_reset(&xe->drm, __drmm_workqueue_release, group->resume_wq);
+	if (err)
+		return ERR_PTR(err);
+
 	init_rwsem(&group->mode_sem);
 	INIT_WORK(&group->resume_work, hw_engine_group_resume_lr_jobs_func);
 	INIT_LIST_HEAD(&group->exec_queue_list);
 
-	err = drmm_add_action_or_reset(&xe->drm, hw_engine_group_free, group);
-	if (err)
-		return ERR_PTR(err);
-
 	return group;
 }
 
-- 
2.39.2

