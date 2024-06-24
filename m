Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 4B25A914072
	for <lists+dri-devel@lfdr.de>; Mon, 24 Jun 2024 04:22:47 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 261E710E1E2;
	Mon, 24 Jun 2024 02:22:42 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (1024-bit key; unprotected) header.d=linux.alibaba.com header.i=@linux.alibaba.com header.b="V5g7F1yN";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from out30-133.freemail.mail.aliyun.com
 (out30-133.freemail.mail.aliyun.com [115.124.30.133])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 3FDB310E1E2;
 Mon, 24 Jun 2024 02:22:38 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=linux.alibaba.com; s=default;
 t=1719195756; h=From:To:Subject:Date:Message-Id:MIME-Version;
 bh=4oEKDf6ktKNvNm2YhLgJ2R/X0teHz21rhJGCnMtpSVo=;
 b=V5g7F1yNeV15jSjRPEoaUld2zKeulaCaf7Lu7iaSgOcSo8p3Jl17yctn6SycMov8UEUbXa3eZF6N2tNErV6Y2eS1jNfAhrfufAXsjbuzTMToQO814h+ExWe6k2ir/5kWhfZ/8gKxbH8K9jar9SGC6NfhJr5kbQyN8sfiKK7LdeA=
X-Alimail-AntiSpam: AC=PASS; BC=-1|-1; BR=01201311R111e4; CH=green; DM=||false|;
 DS=||; FP=0|-1|-1|-1|0|-1|-1|-1; HT=maildocker-contentspam033037067110;
 MF=jiapeng.chong@linux.alibaba.com; NM=1; PH=DS; RN=10; SR=0;
 TI=SMTPD_---0W90xIIb_1719195747; 
Received: from localhost(mailfrom:jiapeng.chong@linux.alibaba.com
 fp:SMTPD_---0W90xIIb_1719195747) by smtp.aliyun-inc.com;
 Mon, 24 Jun 2024 10:22:35 +0800
From: Jiapeng Chong <jiapeng.chong@linux.alibaba.com>
To: alexander.deucher@amd.com
Cc: christian.koenig@amd.com, Xinhui.Pan@amd.com, airlied@gmail.com,
 daniel@ffwll.ch, amd-gfx@lists.freedesktop.org,
 dri-devel@lists.freedesktop.org, linux-kernel@vger.kernel.org,
 Jiapeng Chong <jiapeng.chong@linux.alibaba.com>,
 Abaci Robot <abaci@linux.alibaba.com>
Subject: [PATCH] drm/amd/display: Remove unused function reverse_planes_order
Date: Mon, 24 Jun 2024 10:22:25 +0800
Message-Id: <20240624022225.28655-1-jiapeng.chong@linux.alibaba.com>
X-Mailer: git-send-email 2.20.1.7.g153144c
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
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

The function are defined in the amdgpu_dm.c file, but not called
anywhere, so delete the unused function.

drivers/gpu/drm/amd/amdgpu/../display/amdgpu_dm/amdgpu_dm.c:371:20: warning: unused function 'reverse_planes_order'.

Reported-by: Abaci Robot <abaci@linux.alibaba.com>
Closes: https://bugzilla.openanolis.cn/show_bug.cgi?id=9402
Signed-off-by: Jiapeng Chong <jiapeng.chong@linux.alibaba.com>
---
 drivers/gpu/drm/amd/display/amdgpu_dm/amdgpu_dm.c | 9 ---------
 1 file changed, 9 deletions(-)

diff --git a/drivers/gpu/drm/amd/display/amdgpu_dm/amdgpu_dm.c b/drivers/gpu/drm/amd/display/amdgpu_dm/amdgpu_dm.c
index 4b86b30eddc4..1e0e33b565f1 100644
--- a/drivers/gpu/drm/amd/display/amdgpu_dm/amdgpu_dm.c
+++ b/drivers/gpu/drm/amd/display/amdgpu_dm/amdgpu_dm.c
@@ -368,15 +368,6 @@ static inline bool is_dc_timing_adjust_needed(struct dm_crtc_state *old_state,
 		return false;
 }
 
-static inline void reverse_planes_order(struct dc_surface_update *array_of_surface_update,
-					int planes_count)
-{
-	int i, j;
-
-	for (i = 0, j = planes_count - 1; i < j; i++, j--)
-		swap(array_of_surface_update[i], array_of_surface_update[j]);
-}
-
 /*
  * DC will program planes with their z-order determined by their ordering
  * in the dc_surface_updates array. This comparator is used to sort them
-- 
2.20.1.7.g153144c

