Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id D048012A220
	for <lists+dri-devel@lfdr.de>; Tue, 24 Dec 2019 15:30:32 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 2D76A6E071;
	Tue, 24 Dec 2019 14:29:57 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from huawei.com (szxga06-in.huawei.com [45.249.212.32])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 359AC89D5B;
 Mon, 23 Dec 2019 13:39:14 +0000 (UTC)
Received: from DGGEMS408-HUB.china.huawei.com (unknown [172.30.72.60])
 by Forcepoint Email with ESMTP id 93364DCFFFF26E33927F;
 Mon, 23 Dec 2019 21:39:12 +0800 (CST)
Received: from huawei.com (10.90.53.225) by DGGEMS408-HUB.china.huawei.com
 (10.3.19.208) with Microsoft SMTP Server id 14.3.439.0; Mon, 23 Dec 2019
 21:39:02 +0800
From: zhengbin <zhengbin13@huawei.com>
To: <alexander.deucher@amd.com>, <christian.koenig@amd.com>,
 <David1.Zhou@amd.com>, <airlied@linux.ie>, <daniel@ffwll.ch>,
 <amd-gfx@lists.freedesktop.org>, <dri-devel@lists.freedesktop.org>
Subject: [PATCH 5/5] drm/amdgpu: use true,
 false for bool variable in amdgpu_psp.c
Date: Mon, 23 Dec 2019 21:46:21 +0800
Message-ID: <1577108781-68614-6-git-send-email-zhengbin13@huawei.com>
X-Mailer: git-send-email 2.7.4
In-Reply-To: <1577108781-68614-1-git-send-email-zhengbin13@huawei.com>
References: <1577108781-68614-1-git-send-email-zhengbin13@huawei.com>
MIME-Version: 1.0
X-Originating-IP: [10.90.53.225]
X-CFilter-Loop: Reflected
X-Mailman-Approved-At: Tue, 24 Dec 2019 14:29:55 +0000
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
Cc: zhengbin13@huawei.com
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

Fixes coccicheck warning:

drivers/gpu/drm/amd/amdgpu/amdgpu_psp.c:674:2-26: WARNING: Assignment of 0/1 to bool variable
drivers/gpu/drm/amd/amdgpu/amdgpu_psp.c:794:1-25: WARNING: Assignment of 0/1 to bool variable
drivers/gpu/drm/amd/amdgpu/amdgpu_psp.c:897:2-36: WARNING: Assignment of 0/1 to bool variable
drivers/gpu/drm/amd/amdgpu/amdgpu_psp.c:1016:1-35: WARNING: Assignment of 0/1 to bool variable
drivers/gpu/drm/amd/amdgpu/amdgpu_psp.c:1087:2-34: WARNING: Assignment of 0/1 to bool variable
drivers/gpu/drm/amd/amdgpu/amdgpu_psp.c:1177:1-33: WARNING: Assignment of 0/1 to bool variable

Reported-by: Hulk Robot <hulkci@huawei.com>
Signed-off-by: zhengbin <zhengbin13@huawei.com>
---
 drivers/gpu/drm/amd/amdgpu/amdgpu_psp.c | 12 ++++++------
 1 file changed, 6 insertions(+), 6 deletions(-)

diff --git a/drivers/gpu/drm/amd/amdgpu/amdgpu_psp.c b/drivers/gpu/drm/amd/amdgpu/amdgpu_psp.c
index 3e293a3..9153b9a 100644
--- a/drivers/gpu/drm/amd/amdgpu/amdgpu_psp.c
+++ b/drivers/gpu/drm/amd/amdgpu/amdgpu_psp.c
@@ -671,7 +671,7 @@ static int psp_ras_load(struct psp_context *psp)
 			psp->fence_buf_mc_addr);

 	if (!ret) {
-		psp->ras.ras_initialized = 1;
+		psp->ras.ras_initialized = true;
 		psp->ras.session_id = cmd->resp.session_id;
 	}

@@ -791,7 +791,7 @@ static int psp_ras_terminate(struct psp_context *psp)
 	if (ret)
 		return ret;

-	psp->ras.ras_initialized = 0;
+	psp->ras.ras_initialized = false;

 	/* free ras shared memory */
 	amdgpu_bo_free_kernel(&psp->ras.ras_shared_bo,
@@ -894,7 +894,7 @@ static int psp_hdcp_load(struct psp_context *psp)
 	ret = psp_cmd_submit_buf(psp, NULL, cmd, psp->fence_buf_mc_addr);

 	if (!ret) {
-		psp->hdcp_context.hdcp_initialized = 1;
+		psp->hdcp_context.hdcp_initialized = true;
 		psp->hdcp_context.session_id = cmd->resp.session_id;
 	}

@@ -1013,7 +1013,7 @@ static int psp_hdcp_terminate(struct psp_context *psp)
 	if (ret)
 		return ret;

-	psp->hdcp_context.hdcp_initialized = 0;
+	psp->hdcp_context.hdcp_initialized = false;

 	/* free hdcp shared memory */
 	amdgpu_bo_free_kernel(&psp->hdcp_context.hdcp_shared_bo,
@@ -1084,7 +1084,7 @@ static int psp_dtm_load(struct psp_context *psp)
 	ret = psp_cmd_submit_buf(psp, NULL, cmd, psp->fence_buf_mc_addr);

 	if (!ret) {
-		psp->dtm_context.dtm_initialized = 1;
+		psp->dtm_context.dtm_initialized = true;
 		psp->dtm_context.session_id = cmd->resp.session_id;
 	}

@@ -1174,7 +1174,7 @@ static int psp_dtm_terminate(struct psp_context *psp)
 	if (ret)
 		return ret;

-	psp->dtm_context.dtm_initialized = 0;
+	psp->dtm_context.dtm_initialized = false;

 	/* free hdcp shared memory */
 	amdgpu_bo_free_kernel(&psp->dtm_context.dtm_shared_bo,
--
2.7.4

_______________________________________________
dri-devel mailing list
dri-devel@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/dri-devel
