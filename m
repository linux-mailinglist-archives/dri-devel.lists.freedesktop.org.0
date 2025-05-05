Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 39935AAA027
	for <lists+dri-devel@lfdr.de>; Tue,  6 May 2025 00:32:37 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 2183010E4B0;
	Mon,  5 May 2025 22:32:21 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=kernel.org header.i=@kernel.org header.b="Z/uLCjoX";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from nyc.source.kernel.org (nyc.source.kernel.org [147.75.193.91])
 by gabe.freedesktop.org (Postfix) with ESMTPS id BDB9110E4A7;
 Mon,  5 May 2025 22:32:19 +0000 (UTC)
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
 by nyc.source.kernel.org (Postfix) with ESMTP id 5BEE7A4CD9F;
 Mon,  5 May 2025 22:26:51 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 0F4D0C4CEEE;
 Mon,  5 May 2025 22:32:16 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=k20201202; t=1746484338;
 bh=esuW//bFiVJG0otYdfajTGOZfCOzsvAkrpYLsTeDXAk=;
 h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
 b=Z/uLCjoXf5y2fbOhRRpxkvOD2WOlQmhjs0r0TT3/chqzMIJ29J3fVn9o1FSV7JFfH
 cso+UTvYA/ZdNhF5SHcBuhavs9q/5i+EmDQRqJ/961gjal+9HYvamROe3Dr23hm7lO
 Ej9hjX3V6IwQLY6iXxmQYs32kxtVqH/tBULSxaDTizPpUyazqnVeRWsjzkhkdt+wN2
 GikIgmg6JI1N2zMSsn09up8+/su8t7tkmOxx9F5NSzAg+eXMn537l3hHgnoaQpeh/G
 /9hUWKWyDvadb1G2fceNt2+7nWPi50lnZVYYFzwY5xcQxB61d41gftqC53u+KNzb9F
 XfUdj9ooxnWGg==
From: Sasha Levin <sashal@kernel.org>
To: linux-kernel@vger.kernel.org,
	stable@vger.kernel.org
Cc: Alex Deucher <alexander.deucher@amd.com>,
 Srinivasan Shanmugam <srinivasan.shanmugam@amd.com>,
 =?UTF-8?q?Christian=20K=C3=B6nig?= <christian.koenig@amd.com>,
 Sasha Levin <sashal@kernel.org>, airlied@gmail.com, simona@ffwll.ch,
 sunil.khatri@amd.com, Jack.Xiao@amd.com, Hawking.Zhang@amd.com,
 shaoyun.liu@amd.com, Jiadong.Zhu@amd.com, amd-gfx@lists.freedesktop.org,
 dri-devel@lists.freedesktop.org
Subject: [PATCH AUTOSEL 6.14 458/642] drm/amdgpu/mes11: fix set_hw_resources_1
 calculation
Date: Mon,  5 May 2025 18:11:14 -0400
Message-Id: <20250505221419.2672473-458-sashal@kernel.org>
X-Mailer: git-send-email 2.39.5
In-Reply-To: <20250505221419.2672473-1-sashal@kernel.org>
References: <20250505221419.2672473-1-sashal@kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
X-stable: review
X-Patchwork-Hint: Ignore
X-stable-base: Linux 6.14.5
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
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

From: Alex Deucher <alexander.deucher@amd.com>

[ Upstream commit 1350dd3691b5f757a948e5b9895d62c422baeb90 ]

It's GPU page size not CPU page size.  In most cases they
are the same, but not always.  This can lead to overallocation
on systems with larger pages.

Cc: Srinivasan Shanmugam <srinivasan.shanmugam@amd.com>
Cc: Christian König <christian.koenig@amd.com>
Reviewed-by: Christian König <christian.koenig@amd.com>
Signed-off-by: Alex Deucher <alexander.deucher@amd.com>
Signed-off-by: Sasha Levin <sashal@kernel.org>
---
 drivers/gpu/drm/amd/amdgpu/mes_v11_0.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/drivers/gpu/drm/amd/amdgpu/mes_v11_0.c b/drivers/gpu/drm/amd/amdgpu/mes_v11_0.c
index 0f808ffcab943..68bb334393bb6 100644
--- a/drivers/gpu/drm/amd/amdgpu/mes_v11_0.c
+++ b/drivers/gpu/drm/amd/amdgpu/mes_v11_0.c
@@ -730,7 +730,7 @@ static int mes_v11_0_set_hw_resources(struct amdgpu_mes *mes)
 
 static int mes_v11_0_set_hw_resources_1(struct amdgpu_mes *mes)
 {
-	int size = 128 * PAGE_SIZE;
+	int size = 128 * AMDGPU_GPU_PAGE_SIZE;
 	int ret = 0;
 	struct amdgpu_device *adev = mes->adev;
 	union MESAPI_SET_HW_RESOURCES_1 mes_set_hw_res_pkt;
-- 
2.39.5

