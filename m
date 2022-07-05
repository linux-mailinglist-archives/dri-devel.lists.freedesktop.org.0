Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 53561566FB9
	for <lists+dri-devel@lfdr.de>; Tue,  5 Jul 2022 15:46:26 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 4EDEF11AADD;
	Tue,  5 Jul 2022 13:46:23 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-m971.mail.163.com (mail-m971.mail.163.com [123.126.97.1])
 by gabe.freedesktop.org (Postfix) with ESMTP id 487E611AADD;
 Tue,  5 Jul 2022 13:46:21 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=163.com;
 s=s110527; h=From:Subject:Date:Message-Id:MIME-Version; bh=InYC8
 SXGCUr2SbxJw+eNF1Llgvx8IFbTt02Np0AXcRM=; b=hYQrstqfPF4JRb4R0SFN8
 jS4VvImduc1Bo97gYtxIVti+8UltclstQHX0Gp5Hm6UuV58UrUdCmyPgWCMQPWug
 TJ5JrkjCFm5Qv1nVjSarCp7sudfiw4UEnmiGYs+wtf7jLMgsLsOShN1Lz60V9RHL
 xCIUi4iG0anD41SCDaNDCw=
Received: from localhost.localdomain (unknown [123.112.69.106])
 by smtp1 (Coremail) with SMTP id GdxpCgA3TqGcQMRiNFCtMg--.33524S4;
 Tue, 05 Jul 2022 21:46:11 +0800 (CST)
From: Jianglei Nie <niejianglei2021@163.com>
To: alexander.deucher@amd.com, christian.koenig@amd.com, Xinhui.Pan@amd.com,
 airlied@linux.ie, daniel@ffwll.ch, Jack.Xiao@amd.com,
 Hawking.Zhang@amd.com, mukul.joshi@amd.com
Subject: [PATCH] drm/amdgpu/mes: Fix an error handling path in
 amdgpu_mes_self_test()
Date: Tue,  5 Jul 2022 21:46:03 +0800
Message-Id: <20220705134603.2248455-1-niejianglei2021@163.com>
X-Mailer: git-send-email 2.25.1
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-CM-TRANSID: GdxpCgA3TqGcQMRiNFCtMg--.33524S4
X-Coremail-Antispam: 1Uf129KBjvJXoW7Cw4DKr1UKw47Kr1kWFWDCFg_yoW8JF4xpF
 yfJFsrtry8ZF4jya4UCa4UZas8tw1xX3WUKF4F934S93s8KF98Gwn5tF1xAa4DKFZ8uFZx
 Jr97X34xZF1q9F7anT9S1TB71UUUUUUqnTZGkaVYY2UrUUUUjbIjqfuFe4nvWSU5nxnvy2
 9KBjDUYxBIdaVFxhVjvjDU0xZFpf9x0zRIPfLUUUUU=
X-Originating-IP: [123.112.69.106]
X-CM-SenderInfo: xqlhyxxdqjzvrlsqjii6rwjhhfrp/1tbiFQM1jF5mLp8E1AAAs2
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
Cc: Jianglei Nie <niejianglei2021@163.com>, dri-devel@lists.freedesktop.org,
 amd-gfx@lists.freedesktop.org, linux-kernel@vger.kernel.org
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

if amdgpu_mes_ctx_alloc_meta_data() fails, we should call amdgpu_vm_fini()
to handle amdgpu_vm_init().

Add a new lable before amdgpu_vm_init() and goto this lable when
amdgpu_mes_ctx_alloc_meta_data() fails.

Signed-off-by: Jianglei Nie <niejianglei2021@163.com>
---
 drivers/gpu/drm/amd/amdgpu/amdgpu_mes.c | 4 +++-
 1 file changed, 3 insertions(+), 1 deletion(-)

diff --git a/drivers/gpu/drm/amd/amdgpu/amdgpu_mes.c b/drivers/gpu/drm/amd/amdgpu/amdgpu_mes.c
index 69a70a0aaed9..7c196b8ac49f 100644
--- a/drivers/gpu/drm/amd/amdgpu/amdgpu_mes.c
+++ b/drivers/gpu/drm/amd/amdgpu/amdgpu_mes.c
@@ -1157,7 +1157,7 @@ int amdgpu_mes_self_test(struct amdgpu_device *adev)
 	r = amdgpu_mes_ctx_alloc_meta_data(adev, &ctx_data);
 	if (r) {
 		DRM_ERROR("failed to alloc ctx meta data\n");
-		goto error_pasid;
+		goto error_fini;
 	}
 
 	ctx_data.meta_data_gpu_addr = AMDGPU_VA_RESERVED_SIZE;
@@ -1215,6 +1215,8 @@ int amdgpu_mes_self_test(struct amdgpu_device *adev)
 	BUG_ON(amdgpu_bo_reserve(ctx_data.meta_data_obj, true));
 	amdgpu_vm_bo_del(adev, ctx_data.meta_data_va);
 	amdgpu_bo_unreserve(ctx_data.meta_data_obj);
+
+error_fini:
 	amdgpu_vm_fini(adev, vm);
 
 error_pasid:
-- 
2.25.1

