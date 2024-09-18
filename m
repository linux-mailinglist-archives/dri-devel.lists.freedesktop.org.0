Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 910FC97B990
	for <lists+dri-devel@lfdr.de>; Wed, 18 Sep 2024 10:48:36 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 9F7EC10E1DD;
	Wed, 18 Sep 2024 08:48:33 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=maxima.ru header.i=@maxima.ru header.b="ZCuKeT3K";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from ksmg02.maxima.ru (ksmg02.maxima.ru [81.200.124.39])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 44FAF10E1DD;
 Wed, 18 Sep 2024 08:48:30 +0000 (UTC)
Received: from ksmg02.maxima.ru (localhost [127.0.0.1])
 by ksmg02.maxima.ru (Postfix) with ESMTP id EAA891E0008;
 Wed, 18 Sep 2024 11:48:26 +0300 (MSK)
DKIM-Filter: OpenDKIM Filter v2.11.0 ksmg02.maxima.ru EAA891E0008
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=maxima.ru; s=sl;
 t=1726649306; bh=4didXC8oklQfIE0UM2UabfJum3DZPrOiUxM6+vR/FuM=;
 h=From:To:Subject:Date:Message-ID:MIME-Version:Content-Type:From;
 b=ZCuKeT3K17L3Uiu5uSTqkq87sYD6I3SIrkhejr23+1b+9mjdq+mnImsw8e0O+OZcG
 foaiFeCFBxa864n63oVUk3HgLzwPjDhUu1fFzGxw6i2GwOzUIpU7HoagrLXPFYH/om
 V+vWEbyuNxhFHHjtbbwKthFtHWHFk5Sv7fGQgSWwRyLuJZNcuBm38PG8ZfV/xc6NLj
 fPrD7NyFUjqGKmcVHxwmLSWXkZkRfucHCaszKhiEfVva5q2Urt2GG+jl9W+dvEg5MS
 V7CEPg0vU6Tfc6kJiXrVWtx5b3XmHfFQH7kk7IHJG08d0J/VkO7fbkp9mxhHRokuBV
 xoiWJm2sS5lqg==
Received: from ksmg02.maxima.ru (unknown [81.200.124.62])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (Client CN "*.maxima.ru",
 Issuer "GlobalSign GCC R3 DV TLS CA 2020" (verified OK))
 by ksmg02.maxima.ru (Postfix) with ESMTPS;
 Wed, 18 Sep 2024 11:48:26 +0300 (MSK)
Received: from GS-NOTE-190.mt.ru (10.0.247.62) by mmail-p-exch02.mt.ru
 (81.200.124.62) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id 15.2.1544.4; Wed, 18 Sep
 2024 11:48:14 +0300
From: Murad Masimov <m.masimov@maxima.ru>
To: <stable@vger.kernel.org>, Greg Kroah-Hartman <gregkh@linuxfoundation.org>
CC: Murad Masimov <m.masimov@maxima.ru>, Felix Kuehling
 <Felix.Kuehling@amd.com>, Alex Deucher <alexander.deucher@amd.com>,
 =?UTF-8?q?Christian=20K=C3=B6nig?= <christian.koenig@amd.com>, "Pan, Xinhui"
 <Xinhui.Pan@amd.com>, David Airlie <airlied@gmail.com>, Daniel Vetter
 <daniel@ffwll.ch>, "open list:AMD KFD" <amd-gfx@lists.freedesktop.org>, "open
 list:DRM DRIVERS" <dri-devel@lists.freedesktop.org>, open list
 <linux-kernel@vger.kernel.org>, <lvc-project@linuxtesting.org>, Philip Yang
 <Philip.Yang@amd.com>, Alex Sierra <alex.sierra@amd.com>
Subject: [PATCH 6.1] drm/amdkfd: Skip handle mapping SVM range with no GPU
 access
Date: Wed, 18 Sep 2024 11:47:16 +0300
Message-ID: <20240918084718.958-1-m.masimov@maxima.ru>
X-Mailer: git-send-email 2.46.0.windows.1
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-Originating-IP: [10.0.247.62]
X-ClientProxiedBy: mt-exch-01.mt.ru (91.220.120.210) To mmail-p-exch02.mt.ru
 (81.200.124.62)
X-KSMG-Rule-ID: 7
X-KSMG-Message-Action: clean
X-KSMG-AntiSpam-Lua-Profiles: 187815 [Sep 18 2024]
X-KSMG-AntiSpam-Version: 6.1.1.5
X-KSMG-AntiSpam-Envelope-From: m.masimov@maxima.ru
X-KSMG-AntiSpam-Rate: 0
X-KSMG-AntiSpam-Status: not_detected
X-KSMG-AntiSpam-Method: none
X-KSMG-AntiSpam-Auth: dmarc=none header.from=maxima.ru;
 spf=none smtp.mailfrom=maxima.ru; dkim=none
X-KSMG-AntiSpam-Info: LuaCore: 34 0.3.34
 8a1fac695d5606478feba790382a59668a4f0039, {rep_avail},
 {Tracking_from_domain_doesnt_match_to}, maxima.ru:7.1.1;
 d41d8cd98f00b204e9800998ecf8427e.com:7.1.1; 81.200.124.62:7.1.2;
 ksmg02.maxima.ru:7.1.1;
 127.0.0.199:7.1.2, FromAlignment: s, ApMailHostAddress: 81.200.124.62, {DNS
 response errors}
X-MS-Exchange-Organization-SCL: -1
X-KSMG-AntiSpam-Interceptor-Info: scan successful
X-KSMG-AntiPhishing: Clean
X-KSMG-LinksScanning: Clean
X-KSMG-AntiVirus: Kaspersky Secure Mail Gateway, version 2.0.1.6960,
 bases: 2024/09/18 05:45:00 #26614741
X-KSMG-AntiVirus-Status: Clean, skipped
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

From: Philip Yang <Philip.Yang@amd.com>

commit 8c45b31909b730f9c7b146588e038f9c6553394d upstream.

If the SVM range has no GPU access nor access-in-place attribute,
validate and map to GPU should skip the range.

Add NULL pointer check if find_first_bit(ctx->bitmap, MAX_GPU_INSTANCE)
returns MAX_GPU_INSTANCE as gpuidx if ctx->bitmap is empty.

Signed-off-by: Philip Yang <Philip.Yang@amd.com>
Reviewed-by: Alex Sierra <alex.sierra@amd.com>
Signed-off-by: Alex Deucher <alexander.deucher@amd.com>
[m.masimov@maxima.ru: In order to adapt this patch to branch 6.1
ctx was treated as a variable and not as a pointer.]
Signed-off-by: Murad Masimov <m.masimov@maxima.ru>
---
 drivers/gpu/drm/amd/amdkfd/kfd_svm.c | 8 +++++---
 1 file changed, 5 insertions(+), 3 deletions(-)

diff --git a/drivers/gpu/drm/amd/amdkfd/kfd_svm.c b/drivers/gpu/drm/amd/amdkfd/kfd_svm.c
index 7fa5e70f1aac..a44781b66af9 100644
--- a/drivers/gpu/drm/amd/amdkfd/kfd_svm.c
+++ b/drivers/gpu/drm/amd/amdkfd/kfd_svm.c
@@ -1491,6 +1491,8 @@ static void *kfd_svm_page_owner(struct kfd_process *p, int32_t gpuidx)
 	struct kfd_process_device *pdd;
 
 	pdd = kfd_process_device_from_gpuidx(p, gpuidx);
+	if (!pdd)
+		return NULL;
 
 	return SVM_ADEV_PGMAP_OWNER(pdd->dev->adev);
 }
@@ -1561,10 +1563,10 @@ static int svm_range_validate_and_map(struct mm_struct *mm,
 	}
 
 	if (bitmap_empty(ctx.bitmap, MAX_GPU_INSTANCE)) {
-		if (!prange->mapped_to_gpu)
-			return 0;
-
 		bitmap_copy(ctx.bitmap, prange->bitmap_access, MAX_GPU_INSTANCE);
+		if (!prange->mapped_to_gpu ||
+		    bitmap_empty(ctx.bitmap, MAX_GPU_INSTANCE))
+			return 0;
 	}
 
 	if (prange->actual_loc && !prange->ttm_res) {
-- 
2.39.2

