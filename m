Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id DCD9189CD3D
	for <lists+dri-devel@lfdr.de>; Mon,  8 Apr 2024 23:12:37 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id A47F2112980;
	Mon,  8 Apr 2024 21:12:34 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (1024-bit key; unprotected) header.d=qq.com header.i=@qq.com header.b="goS3NwiP";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
X-Greylist: delayed 442 seconds by postgrey-1.36 at gabe;
 Mon, 08 Apr 2024 18:00:48 UTC
Received: from out203-205-221-155.mail.qq.com (out203-205-221-155.mail.qq.com
 [203.205.221.155])
 by gabe.freedesktop.org (Postfix) with ESMTPS id B783410E333;
 Mon,  8 Apr 2024 18:00:48 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qq.com; s=s201512;
 t=1712599244; bh=Pps4HsLgFHLx122khZoFNB9+hWAVJVChvnEPFqxgolA=;
 h=From:To:Cc:Subject:Date;
 b=goS3NwiPbvOds+R8nukIAPiO0m3YaCrJ03GYntGci8G2oUDhLY9KgezSzxafuvvsM
 XY1NNpMRJ4WYQfR3b4LxnjXuW53l7+K/C0MbRLTBYRq/Ha6uXg3JDO6m6Mky1tyNQ6
 POBPpzZ8XOxCVgiMbRXtOff7EObfUsACOV2PRCMY=
Received: from b.. ([111.45.33.200])
 by newxmesmtplogicsvrszb9-0.qq.com (NewEsmtp) with SMTP
 id D2B0006C; Tue, 09 Apr 2024 01:52:43 +0800
X-QQ-mid: xmsmtpt1712598763t0rn2vgkn
Message-ID: <tencent_9949E2F260D801549611A452B52FC112F009@qq.com>
X-QQ-XMAILINFO: OdDhBiKk1LgMmeqTxzAoEjqQRh7T+DCyVeh1exnmT20HYw7qVIcrsV/TyrhQyI
 aJr1NuytaezlNYKp2TA2+EAII7aItDvhhtimtfLvM8L7re7Es292gZ2JmBzd7hEK1K1WJyjbHlZC
 6Onka8U2lusbJ0AxUv2ts2r6aTko1Ca2flXNy726IsuheoO1e7W8Gpj8xTyCkHAtelestFOiwDRa
 X15GZA6kJPkZXwVqPYR5EuRQ8egv7PiYDeMewZAUTntzfCgMzAQnOHKY7whkvVIzyWSeiOiOo8BH
 yMxJNKLNMFyUNFI1B49dCiANMF56Bs9FTHG/yC0MwbSWBBBq3lHhaNJTO6r9hzW6OYcXJzLfq56f
 XTfWZJtzjn169mx+TL5tZnwr6p4RUXxqeNasqzcJO65as9I8DCY1p/tiP15RvAOOLG3ZsmZcUT8y
 3P+ijqDHbq9N90GkJU+dSSaR1TNRoKeBRQGKsrbUoHvJOSUdXv/5XHJlkjFoltTxwnfJcfAu71Kv
 +EPHNTmyPmCLBeqyYaJOwm8y2n7vAxXuFsjjmoVMCZ7tm6JwWXJC/lFiqRz7txWVyf8XLob2JUIm
 kOFNrna82bari7KP/tMeRPLkLt1ttdg+7o3E3BhKDyHViASfUenLn5vMbnUS9AK9KDdgBZdiXr3B
 udP0XDKhCrbwDB8kLSnnXC1wrDDLRJBc6PM89mLMFVXzLg9OlbCI+KqLCYuvIqqJwWNXVLwc1+cd
 1rqRgYjMdg5LT1lEAbqneYKv/yoMSeN1V7aiTf8jPJSnFnYyLnU1NWqFvtMSx1eKTTmnx4ihI19I
 zkKwBjt9kOTkDjJolOXZc/iZzbZjsJVm3xOUOK+IHYhw6NDrVCblw5ikOLs0vNI+WVjROpPb4HKd
 zrHxBmO537uus/rcVOthfz4oFC2d20Eq0S9ojyDOEjsFlf00m59PtWKoLy6ekVOrm1ZZ3XHpvDo9
 dJ0xKdPqQ=
X-QQ-XMRINFO: M/715EihBoGSf6IYSX1iLFg=
From: brolerliew <575705195@qq.com>
To: alexander.deucher@amd.com
Cc: christian.koenig@amd.com, Xinhui.Pan@amd.com, airlied@gmail.com,
 daniel@ffwll.ch, amd-gfx@lists.freedesktop.org,
 dri-devel@lists.freedesktop.org, linux-kernel@vger.kernel.org,
 luben.tuikov@amd.com, brolerliew <brolerliew@gmail.com>,
 brolerliew <575705195@qq.com>
Subject: [PATCH] drm/amdgpu: remove "num_pages" local variable in
 amdgpu_gtt_mgr_new
Date: Tue,  9 Apr 2024 01:52:42 +0800
X-OQ-MSGID: <20240408175242.613724-1-575705195@qq.com>
X-Mailer: git-send-email 2.40.1
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Mailman-Approved-At: Mon, 08 Apr 2024 21:12:18 +0000
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

From: brolerliew <brolerliew@gmail.com>

amdgpu_gtt_mgr_new and ttm_range_man_alloc share similar logic, but
"num_pages" in amdgpu_gtt_mgr_new is defined as local variable which
is calculate directly in ttm_range_man_alloc.

Signed-off-by: brolerliew <575705195@qq.com>
---
 drivers/gpu/drm/amd/amdgpu/amdgpu_gtt_mgr.c | 3 +--
 1 file changed, 1 insertion(+), 2 deletions(-)

diff --git a/drivers/gpu/drm/amd/amdgpu/amdgpu_gtt_mgr.c b/drivers/gpu/drm/amd/amdgpu/amdgpu_gtt_mgr.c
index 44367f03316f..0c56e4057d85 100644
--- a/drivers/gpu/drm/amd/amdgpu/amdgpu_gtt_mgr.c
+++ b/drivers/gpu/drm/amd/amdgpu/amdgpu_gtt_mgr.c
@@ -116,7 +116,6 @@ static int amdgpu_gtt_mgr_new(struct ttm_resource_manager *man,
 			      struct ttm_resource **res)
 {
 	struct amdgpu_gtt_mgr *mgr = to_gtt_mgr(man);
-	uint32_t num_pages = PFN_UP(tbo->base.size);
 	struct ttm_range_mgr_node *node;
 	int r;
 
@@ -134,7 +133,7 @@ static int amdgpu_gtt_mgr_new(struct ttm_resource_manager *man,
 	if (place->lpfn) {
 		spin_lock(&mgr->lock);
 		r = drm_mm_insert_node_in_range(&mgr->mm, &node->mm_nodes[0],
-						num_pages, tbo->page_alignment,
+						PFN_UP(node->base.size), tbo->page_alignment,
 						0, place->fpfn, place->lpfn,
 						DRM_MM_INSERT_BEST);
 		spin_unlock(&mgr->lock);
-- 
2.40.1

