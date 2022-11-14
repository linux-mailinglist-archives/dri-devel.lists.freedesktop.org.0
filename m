Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 60A0F62781A
	for <lists+dri-devel@lfdr.de>; Mon, 14 Nov 2022 09:47:52 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 2AF8010E284;
	Mon, 14 Nov 2022 08:47:50 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
X-Greylist: delayed 302 seconds by postgrey-1.36 at gabe;
 Mon, 14 Nov 2022 07:57:56 UTC
Received: from forwardcorp1b.mail.yandex.net (forwardcorp1b.mail.yandex.net
 [178.154.239.136])
 by gabe.freedesktop.org (Postfix) with ESMTPS id B114010E26A;
 Mon, 14 Nov 2022 07:57:56 +0000 (UTC)
Received: from myt6-81d8ab6a9f9d.qloud-c.yandex.net
 (myt6-81d8ab6a9f9d.qloud-c.yandex.net
 [IPv6:2a02:6b8:c12:520a:0:640:81d8:ab6a])
 by forwardcorp1b.mail.yandex.net (Yandex) with ESMTP id A12615FE67;
 Mon, 14 Nov 2022 10:52:41 +0300 (MSK)
Received: from d-tatianin-nix.yandex-team.ru (unknown
 [2a02:6b8:b081:7220::1:21])
 by myt6-81d8ab6a9f9d.qloud-c.yandex.net (smtpcorp/Yandex) with ESMTPSA id
 uYjZl30eU5-qdNuGotW; Mon, 14 Nov 2022 10:52:40 +0300
Precedence: bulk
X-Yandex-Fwd: 1
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=yandex-team.ru;
 s=default; 
 t=1668412360; bh=GTqY7T7dEAEj8Ia1JnRXW9bxS63gBPozodfpnRB0ZGk=;
 h=Message-Id:Date:Cc:Subject:To:From;
 b=e/j8rRsf0VUNLpibejzPTvmSSTY3ntIjFMafKnd1Ry/WRXyhQbxt45oLAPLfKIbFb
 gkMIIqd72EwVWJW4QxAK5TZyP+gOapuK9j+pXfjc4SStV3glulVOUbkIbGz4Fx8gj3
 KkKQm2qfV4xbb3iy+QnD8sPC32Vyu5hFIOOZla28=
Authentication-Results: myt6-81d8ab6a9f9d.qloud-c.yandex.net;
 dkim=pass header.i=@yandex-team.ru
From: Daniil Tatianin <d-tatianin@yandex-team.ru>
To: Harry Wentland <harry.wentland@amd.com>
Subject: [PATCH v2] amdgpu_dm: add missing NULL checks in amdgpu_dm_fini()
Date: Mon, 14 Nov 2022 10:52:09 +0300
Message-Id: <20221114075209.3458709-1-d-tatianin@yandex-team.ru>
X-Mailer: git-send-email 2.25.1
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Mailman-Approved-At: Mon, 14 Nov 2022 08:47:13 +0000
X-BeenThere: dri-devel@lists.freedesktop.org
X-Mailman-Version: 2.1.29
List-Id: Direct Rendering Infrastructure - Development
 <dri-devel.lists.freedesktop.org>
List-Unsubscribe: <https://lists.freedesktop.org/mailman/options/dri-devel>,
 <mailto:dri-devel-request@lists.freedesktop.org?subject=unsubscribe>
List-Archive: <https://lists.freedesktop.org/archives/dri-devel>
List-Post: <mailto:dri-devel@lists.freedesktop.org>
List-Help: <mailto:dri-devel-request@lists.freedesktop.org?subject=help>
List-Subscribe: <https://lists.freedesktop.org/mailman/listinfo/dri-devel>,
 <mailto:dri-devel-request@lists.freedesktop.org?subject=subscribe>
Cc: lvc-project@linuxtesting.org, Leo Li <sunpeng.li@amd.com>,
 linux-kernel@vger.kernel.org, "Pan, Xinhui" <Xinhui.Pan@amd.com>,
 Rodrigo Siqueira <Rodrigo.Siqueira@amd.com>, Roman Li <roman.li@amd.com>,
 amd-gfx@lists.freedesktop.org,
 Nicholas Kazlauskas <nicholas.kazlauskas@amd.com>,
 Fangzhi Zuo <Jerry.Zuo@amd.com>, Aurabindo Pillai <aurabindo.pillai@amd.com>,
 dri-devel@lists.freedesktop.org, Alex Deucher <alexander.deucher@amd.com>,
 Daniil Tatianin <d-tatianin@yandex-team.ru>,
 =?UTF-8?q?Christian=20K=C3=B6nig?= <christian.koenig@amd.com>,
 yc-core@yandex-team.ru
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

adev->dm.dc is already checked in a few other if branches of the same
function so no reason not to check it everywhere else as well.

Moreover, admgpu_dm_fini() can be called from an error branch in
amdgpu_dm_init(), at which point it won't contain a valid dm.dc.
This might happen, for example, under OOM conditions.

Found by Linux Verification Center (linuxtesting.org) with the SVACE
static analysis tool.

Signed-off-by: Daniil Tatianin <d-tatianin@yandex-team.ru>
---
 drivers/gpu/drm/amd/display/amdgpu_dm/amdgpu_dm.c | 7 +++++--
 1 file changed, 5 insertions(+), 2 deletions(-)

diff --git a/drivers/gpu/drm/amd/display/amdgpu_dm/amdgpu_dm.c b/drivers/gpu/drm/amd/display/amdgpu_dm/amdgpu_dm.c
index 589bee9acf16..6992bf766009 100644
--- a/drivers/gpu/drm/amd/display/amdgpu_dm/amdgpu_dm.c
+++ b/drivers/gpu/drm/amd/display/amdgpu_dm/amdgpu_dm.c
@@ -1716,7 +1716,8 @@ static void amdgpu_dm_fini(struct amdgpu_device *adev)
 		dc_deinit_callbacks(adev->dm.dc);
 #endif
 
-	dc_dmub_srv_destroy(&adev->dm.dc->ctx->dmub_srv);
+	if (adev->dm.dc)
+		dc_dmub_srv_destroy(&adev->dm.dc->ctx->dmub_srv);
 
 	if (dc_enable_dmub_notifications(adev->dm.dc)) {
 		kfree(adev->dm.dmub_notify);
@@ -1731,7 +1732,9 @@ static void amdgpu_dm_fini(struct amdgpu_device *adev)
 				      &adev->dm.dmub_bo_cpu_addr);
 
 	if (adev->dm.hpd_rx_offload_wq) {
-		for (i = 0; i < adev->dm.dc->caps.max_links; i++) {
+		int max_links = adev->dm.dc ? adev->dm.dc->caps.max_links : 0;
+
+		for (i = 0; i < max_links; i++) {
 			if (adev->dm.hpd_rx_offload_wq[i].wq) {
 				destroy_workqueue(adev->dm.hpd_rx_offload_wq[i].wq);
 				adev->dm.hpd_rx_offload_wq[i].wq = NULL;
-- 
2.25.1

