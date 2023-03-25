Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 685B96C8FC2
	for <lists+dri-devel@lfdr.de>; Sat, 25 Mar 2023 18:30:12 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 455E110E1D0;
	Sat, 25 Mar 2023 17:30:09 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
X-Greylist: delayed 457 seconds by postgrey-1.36 at gabe;
 Sat, 25 Mar 2023 17:30:04 UTC
Received: from knopi.disroot.org (knopi.disroot.org [178.21.23.139])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 85A6810E053;
 Sat, 25 Mar 2023 17:30:04 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by disroot.org (Postfix) with ESMTP id 96A0A4179B;
 Sat, 25 Mar 2023 18:22:25 +0100 (CET)
X-Virus-Scanned: SPAM Filter at disroot.org
Received: from knopi.disroot.org ([127.0.0.1])
 by localhost (disroot.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id OL1t-CpaxX2e; Sat, 25 Mar 2023 18:22:24 +0100 (CET)
From: Carlos Eduardo Gallo Filho <gcarlos@disroot.org>
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=disroot.org; s=mail;
 t=1679764944; bh=p/c8nuEmaGbzp/LfotIufrRa9jGX8DZ0lu+qqXLt/1o=;
 h=From:To:Cc:Subject:Date;
 b=bzwqfeiHrKonERuvbpVuwuIU//pUooPPoKbJcygDJMFaZbhFWbeWlx5cW4MQKZ41v
 YFrFKX7MaB9JdqAqIGQycYDWCPQ5KNT/+W9/RvEVJpZeshAdVVZrqk9hbYr8g0NZOn
 RJhfsMfmbINr8CEDL/LTffgsDyw06p8nwF8lLRhdPoY+VzSQqccbOyjzJjdkpi375m
 LhRV5QtHCB/+HUT4xTOmqp/WzSuY+n/sLXwY+upWTlt38NqzOq1uuLlGaQB+HM1oWK
 YkeeNhrd1XiUrfCX8sr+TXvx1FLs/1cWs4Wb+dluLJf5i88A0ypAz2zY33aaZh6YI/
 xMX0qxkFX31Xw==
To: dri-devel@lists.freedesktop.org,
	amd-gfx@lists.freedesktop.org
Subject: [PATCH] drm/amdgpu: Remove ununsed variable that holds a return value
Date: Sat, 25 Mar 2023 14:20:51 -0300
Message-Id: <20230325172051.16768-1-gcarlos@disroot.org>
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

