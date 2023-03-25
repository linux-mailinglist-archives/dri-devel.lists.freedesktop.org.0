Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 275416C90B6
	for <lists+dri-devel@lfdr.de>; Sat, 25 Mar 2023 21:32:01 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id A3FDF10E21C;
	Sat, 25 Mar 2023 20:31:56 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from knopi.disroot.org (knopi.disroot.org [178.21.23.139])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 643E310E21C;
 Sat, 25 Mar 2023 20:31:55 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by disroot.org (Postfix) with ESMTP id A643444536;
 Sat, 25 Mar 2023 21:31:53 +0100 (CET)
X-Virus-Scanned: SPAM Filter at disroot.org
Received: from knopi.disroot.org ([127.0.0.1])
 by localhost (disroot.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id dEUs8Y2xSF9d; Sat, 25 Mar 2023 21:31:52 +0100 (CET)
From: Carlos Eduardo Gallo Filho <gcarlos@disroot.org>
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=disroot.org; s=mail;
 t=1679776312; bh=zJZ3GBNggTrNe4MEi7UTf9RS2VQczEGPhT+ljQfNLn8=;
 h=From:To:Cc:Subject:Date;
 b=lS6XeOybuAcWz68mqc846bMa1UmWKiBTXh7EPZeucVCuhv+kS84vBfaA/TDkQjgE8
 7gvZzeibHHd0mUb35VPH5OoCjsfjeQy3+Ggu5Qwf7mtLf5ec2EXTsfzHZXEPL2D1OU
 8paS30JthIbIw8A/nvknRQo7NbnwZZswgd+gg2xYMH68wK/nHJjj2oeto92fufDJ+f
 zJlEaJDUFJqtXrPQ9A/2xRPq0yIlGzrxPbkxiRY6Qh1SWsUfxAHj/u+dmwxopTtuoQ
 JTHchzVI4wz8vedAnL4qqHmDMIaDKvmfYAO0Z3kF3YDyahsLByZodaqfJDOTqpKMGg
 UsBTA0R/VHUpA==
To: dri-devel@lists.freedesktop.org,
	amd-gfx@lists.freedesktop.org
Subject: [PATCH v2] drm/amdgpu: Remove unused variable that holds a return
 value
Date: Sat, 25 Mar 2023 17:31:36 -0300
Message-Id: <20230325203136.14401-1-gcarlos@disroot.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
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
Cc: alexander.deucher@amd.com, Xinhui.Pan@amd.com, andrealmeid@riseup.net,
 Carlos Eduardo Gallo Filho <gcarlos@disroot.org>, christian.koenig@amd.com
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

Compiling amdgpu with W=1 get that unused-but-set-variable warning.

drivers/gpu/drm/amd/amdgpu/amdgpu_mes.c: In function ‘amdgpu_mes_ctx_alloc_meta_data’:
drivers/gpu/drm/amd/amdgpu/amdgpu_mes.c:1099:13: warning: variable ‘r’ set but not used [-Wunused-but-set-variable]
 1099 |         int r;
      |             ^

That variable is used to hold the return value of amdgpu_bo_create_kernel()
function call.

Remove r to fix the warning.

Signed-off-by: Carlos Eduardo Gallo Filho <gcarlos@disroot.org>
---
Changes in v2:
- Fix missing Signed-off-by tag
- Fix typo in the description
---
 drivers/gpu/drm/amd/amdgpu/amdgpu_mes.c | 14 ++++++--------
 1 file changed, 6 insertions(+), 8 deletions(-)

diff --git a/drivers/gpu/drm/amd/amdgpu/amdgpu_mes.c b/drivers/gpu/drm/amd/amdgpu/amdgpu_mes.c
index 82e27bd4f038..a45c31717ae3 100644
--- a/drivers/gpu/drm/amd/amdgpu/amdgpu_mes.c
+++ b/drivers/gpu/drm/amd/amdgpu/amdgpu_mes.c
@@ -1096,14 +1096,12 @@ uint32_t amdgpu_mes_get_aggregated_doorbell_index(struct amdgpu_device *adev,
 int amdgpu_mes_ctx_alloc_meta_data(struct amdgpu_device *adev,
 				   struct amdgpu_mes_ctx_data *ctx_data)
 {
-	int r;
-
-	r = amdgpu_bo_create_kernel(adev,
-			    sizeof(struct amdgpu_mes_ctx_meta_data),
-			    PAGE_SIZE, AMDGPU_GEM_DOMAIN_GTT,
-			    &ctx_data->meta_data_obj,
-			    &ctx_data->meta_data_mc_addr,
-			    &ctx_data->meta_data_ptr);
+	amdgpu_bo_create_kernel(adev,
+				sizeof(struct amdgpu_mes_ctx_meta_data),
+				PAGE_SIZE, AMDGPU_GEM_DOMAIN_GTT,
+				&ctx_data->meta_data_obj,
+				&ctx_data->meta_data_mc_addr,
+				&ctx_data->meta_data_ptr);
 	if (!ctx_data->meta_data_obj)
 		return -ENOMEM;
 
-- 
2.39.2

