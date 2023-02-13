Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id BDA81695248
	for <lists+dri-devel@lfdr.de>; Mon, 13 Feb 2023 21:50:36 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 0C57310E727;
	Mon, 13 Feb 2023 20:50:35 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mx1.riseup.net (mx1.riseup.net [198.252.153.129])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 76BA210E726;
 Mon, 13 Feb 2023 20:50:32 +0000 (UTC)
Received: from fews2.riseup.net (fews2-pn.riseup.net [10.0.1.84])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256
 client-signature RSA-PSS (2048 bits) client-digest SHA256)
 (Client CN "mail.riseup.net", Issuer "R3" (not verified))
 by mx1.riseup.net (Postfix) with ESMTPS id 4PFxLc0Qj9zDqCJ;
 Mon, 13 Feb 2023 20:50:32 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=riseup.net; s=squak;
 t=1676321432; bh=+kXlkGSX0/qjZhXCyWQHUkI1bw0ktUisI74gcR6D61w=;
 h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
 b=Cks2raI9dKTsEWDngNKjyXyMRZ8L2WHgAimq59iKUNUsaraWkLdQigYSfjidpLYkG
 zj9hMzPqM8BP07d0bje4OOWYgIVfg1rArqJ7X3zYX0GLd65wtCRmwC4eM1b1G/UQEV
 3nhQzuNsoBQ+W/qfzxVzFUJhUDWiuq4hxhTSaXK4=
X-Riseup-User-ID: 6F56C18DB87848D17F1F785E90031DC5E61065F2BE4F5C49949CCAD82F0AE0B9
Received: from [127.0.0.1] (localhost [127.0.0.1])
 by fews2.riseup.net (Postfix) with ESMTPSA id 4PFxLW5dn1z1y8Z;
 Mon, 13 Feb 2023 20:50:27 +0000 (UTC)
From: Arthur Grillo <arthurgrillo@riseup.net>
To: amd-gfx@lists.freedesktop.org,
	dri-devel@lists.freedesktop.org
Subject: [PATCH 07/10] drm/amd/amdgpu: Deal with possible fail allocation
Date: Mon, 13 Feb 2023 17:49:20 -0300
Message-Id: <20230213204923.111948-8-arthurgrillo@riseup.net>
In-Reply-To: <20230213204923.111948-1-arthurgrillo@riseup.net>
References: <20230213204923.111948-1-arthurgrillo@riseup.net>
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
Cc: sunpeng.li@amd.com, tales.aparecida@gmail.com, Xinhui.Pan@amd.com,
 Rodrigo.Siqueira@amd.com, Arthur Grillo <arthurgrillo@riseup.net>,
 mairacanal@riseup.net, alexander.deucher@amd.com, andrealmeid@riseup.net,
 christian.koenig@amd.com
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

Deal with return value of an allocation. This reduces the number of
-Wunused-but-set-variable warnings.

Signed-off-by: Arthur Grillo <arthurgrillo@riseup.net>
---
 drivers/gpu/drm/amd/amdgpu/amdgpu_mes.c | 2 ++
 1 file changed, 2 insertions(+)

diff --git a/drivers/gpu/drm/amd/amdgpu/amdgpu_mes.c b/drivers/gpu/drm/amd/amdgpu/amdgpu_mes.c
index 82e27bd4f038..00c0876840c1 100644
--- a/drivers/gpu/drm/amd/amdgpu/amdgpu_mes.c
+++ b/drivers/gpu/drm/amd/amdgpu/amdgpu_mes.c
@@ -1104,6 +1104,8 @@ int amdgpu_mes_ctx_alloc_meta_data(struct amdgpu_device *adev,
 			    &ctx_data->meta_data_obj,
 			    &ctx_data->meta_data_mc_addr,
 			    &ctx_data->meta_data_ptr);
+	if (r)
+		return r;
 	if (!ctx_data->meta_data_obj)
 		return -ENOMEM;
 
-- 
2.39.1

