Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 4125F849A5F
	for <lists+dri-devel@lfdr.de>; Mon,  5 Feb 2024 13:34:43 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id A2DE510EF46;
	Mon,  5 Feb 2024 12:34:41 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
X-Greylist: delayed 329 seconds by postgrey-1.36 at gabe;
 Mon, 05 Feb 2024 12:34:40 UTC
Received: from tretyak2.mcst.ru (tretyak2.mcst.ru [212.5.119.215])
 by gabe.freedesktop.org (Postfix) with ESMTPS id AB2A010EF46;
 Mon,  5 Feb 2024 12:34:40 +0000 (UTC)
Received: from tretyak2.mcst.ru (localhost [127.0.0.1])
 by tretyak2.mcst.ru (Postfix) with ESMTP id D6021102399;
 Mon,  5 Feb 2024 15:29:02 +0300 (MSK)
Received: from frog.lab.sun.mcst.ru (frog.lab.sun.mcst.ru [176.16.4.50])
 by tretyak2.mcst.ru (Postfix) with ESMTP id CEF09102394;
 Mon,  5 Feb 2024 15:28:12 +0300 (MSK)
Received: from artemiev-i.lab.sun.mcst.ru (avior-1 [192.168.63.223])
 by frog.lab.sun.mcst.ru (8.13.4/8.12.11) with ESMTP id 415CS8Dw005304;
 Mon, 5 Feb 2024 15:28:08 +0300
From: Igor Artemiev <Igor.A.Artemiev@mcst.ru>
To: Alex Deucher <alexander.deucher@amd.com>
Cc: Igor Artemiev <Igor.A.Artemiev@mcst.ru>, Evan Quan <evan.quan@amd.com>,
 =?UTF-8?q?Christian=20K=C3=B6nig?= <christian.koenig@amd.com>,
 "Pan, Xinhui" <Xinhui.Pan@amd.com>, David Airlie <airlied@gmail.com>,
 Daniel Vetter <daniel@ffwll.ch>, amd-gfx@lists.freedesktop.org,
 dri-devel@lists.freedesktop.org, linux-kernel@vger.kernel.org,
 lvc-project@linuxtesting.org
Subject: [lvc-project] [PATCH] drm/amd/pm: check return value of
 amdgpu_irq_add_id()
Date: Mon,  5 Feb 2024 15:25:21 +0300
Message-Id: <20240205122522.81627-1-Igor.A.Artemiev@mcst.ru>
X-Mailer: git-send-email 2.39.2
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Anti-Virus: Kaspersky Anti-Virus for Linux Mail Server 5.6.39/RELEASE,
 bases: 20111107 #2745587, check: 20240205 notchecked
X-AV-Checked: ClamAV using ClamSMTP
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

amdgpu_irq_ad_id() may fail and the irq handlers will not be registered.
This patch adds error code check.

Found by Linux Verification Center (linuxtesting.org).

Signed-off-by: Igor Artemiev <Igor.A.Artemiev@mcst.ru>
---
 .../gpu/drm/amd/pm/powerplay/hwmgr/smu_helper.c    | 14 +++++++++++---
 1 file changed, 11 insertions(+), 3 deletions(-)

diff --git a/drivers/gpu/drm/amd/pm/powerplay/hwmgr/smu_helper.c b/drivers/gpu/drm/amd/pm/powerplay/hwmgr/smu_helper.c
index 79a566f3564a..9cb965479dd8 100644
--- a/drivers/gpu/drm/amd/pm/powerplay/hwmgr/smu_helper.c
+++ b/drivers/gpu/drm/amd/pm/powerplay/hwmgr/smu_helper.c
@@ -647,26 +647,34 @@ int smu9_register_irq_handlers(struct pp_hwmgr *hwmgr)
 {
 	struct amdgpu_irq_src *source =
 		kzalloc(sizeof(struct amdgpu_irq_src), GFP_KERNEL);
+	int ret;
 
 	if (!source)
 		return -ENOMEM;
 
 	source->funcs = &smu9_irq_funcs;
 
-	amdgpu_irq_add_id((struct amdgpu_device *)(hwmgr->adev),
+	ret = amdgpu_irq_add_id((struct amdgpu_device *)(hwmgr->adev),
 			SOC15_IH_CLIENTID_THM,
 			THM_9_0__SRCID__THM_DIG_THERM_L2H,
 			source);
-	amdgpu_irq_add_id((struct amdgpu_device *)(hwmgr->adev),
+	if (ret)
+		return ret;
+
+	ret = amdgpu_irq_add_id((struct amdgpu_device *)(hwmgr->adev),
 			SOC15_IH_CLIENTID_THM,
 			THM_9_0__SRCID__THM_DIG_THERM_H2L,
 			source);
+	if (ret)
+		return ret;
 
 	/* Register CTF(GPIO_19) interrupt */
-	amdgpu_irq_add_id((struct amdgpu_device *)(hwmgr->adev),
+	ret = amdgpu_irq_add_id((struct amdgpu_device *)(hwmgr->adev),
 			SOC15_IH_CLIENTID_ROM_SMUIO,
 			SMUIO_9_0__SRCID__SMUIO_GPIO19,
 			source);
+	if (ret)
+		return ret;
 
 	return 0;
 }
-- 
2.39.2

