Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 2E3D993AD43
	for <lists+dri-devel@lfdr.de>; Wed, 24 Jul 2024 09:38:15 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 71F0C10E03A;
	Wed, 24 Jul 2024 07:38:11 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (1024-bit key; unprotected) header.d=linux.alibaba.com header.i=@linux.alibaba.com header.b="h7XeOrRh";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from out30-99.freemail.mail.aliyun.com
 (out30-99.freemail.mail.aliyun.com [115.124.30.99])
 by gabe.freedesktop.org (Postfix) with ESMTPS id DDB9F10E03A;
 Wed, 24 Jul 2024 07:38:02 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=linux.alibaba.com; s=default;
 t=1721806680; h=From:To:Subject:Date:Message-Id:MIME-Version;
 bh=rAGYYc4I8IT8kc2kTezhDQbo9h4T2Gzxv5TX4WM92Cc=;
 b=h7XeOrRhSeH1vbwE0H7ADL3Z+qv9fWqZxS1VJoczW9qCf9HDZOiC9+HtKh036TyJ9gQwPtVRXNQ8g9IjAKcWUW2NBxkVBYG9+qK3sltq/oP9ID74iU4A3M6/4qUtk7RJjUrl142DCZagfJ7HRe32Yn5gWA7vMW2QcpyC+2cqVjQ=
X-Alimail-AntiSpam: AC=PASS; BC=-1|-1; BR=01201311R491e4; CH=green; DM=||false|;
 DS=||; FP=0|-1|-1|-1|0|-1|-1|-1; HT=maildocker-contentspam033037067113;
 MF=jiapeng.chong@linux.alibaba.com; NM=1; PH=DS; RN=13; SR=0;
 TI=SMTPD_---0WBDLO5j_1721806670; 
Received: from localhost(mailfrom:jiapeng.chong@linux.alibaba.com
 fp:SMTPD_---0WBDLO5j_1721806670) by smtp.aliyun-inc.com;
 Wed, 24 Jul 2024 15:37:59 +0800
From: Jiapeng Chong <jiapeng.chong@linux.alibaba.com>
To: harry.wentland@amd.com
Cc: sunpeng.li@amd.com, Rodrigo.Siqueira@amd.com, alexander.deucher@amd.com,
 christian.koenig@amd.com, Xinhui.Pan@amd.com, airlied@gmail.com,
 daniel@ffwll.ch, amd-gfx@lists.freedesktop.org,
 dri-devel@lists.freedesktop.org, linux-kernel@vger.kernel.org,
 Jiapeng Chong <jiapeng.chong@linux.alibaba.com>,
 Abaci Robot <abaci@linux.alibaba.com>
Subject: [PATCH -next] drm/amd/display: use swap() in sort()
Date: Wed, 24 Jul 2024 15:37:49 +0800
Message-Id: <20240724073749.14338-1-jiapeng.chong@linux.alibaba.com>
X-Mailer: git-send-email 2.32.0.3.g01195cf9f
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

Use existing swap() function rather than duplicating its implementation.

./drivers/gpu/drm/amd/display/dc/dml2/dml21/src/dml2_pmo/dml2_pmo_dcn3.c:17:29-30: WARNING opportunity for swap().

Reported-by: Abaci Robot <abaci@linux.alibaba.com>
Closes: https://bugzilla.openanolis.cn/show_bug.cgi?id=9573
Signed-off-by: Jiapeng Chong <jiapeng.chong@linux.alibaba.com>
---
 .../display/dc/dml2/dml21/src/dml2_pmo/dml2_pmo_dcn3.c    | 8 ++------
 1 file changed, 2 insertions(+), 6 deletions(-)

diff --git a/drivers/gpu/drm/amd/display/dc/dml2/dml21/src/dml2_pmo/dml2_pmo_dcn3.c b/drivers/gpu/drm/amd/display/dc/dml2/dml21/src/dml2_pmo/dml2_pmo_dcn3.c
index 717536d7bb30..8e68a8094658 100644
--- a/drivers/gpu/drm/amd/display/dc/dml2/dml21/src/dml2_pmo/dml2_pmo_dcn3.c
+++ b/drivers/gpu/drm/amd/display/dc/dml2/dml21/src/dml2_pmo/dml2_pmo_dcn3.c
@@ -7,16 +7,12 @@
 
 static void sort(double *list_a, int list_a_size)
 {
-	double temp;
 	// For all elements b[i] in list_b[]
 	for (int i = 0; i < list_a_size - 1; i++) {
 		// Find the first element of list_a that's larger than b[i]
 		for (int j = i; j < list_a_size - 1; j++) {
-			if (list_a[j] > list_a[j + 1]) {
-				temp = list_a[j];
-				list_a[j] = list_a[j + 1];
-				list_a[j + 1] = temp;
-			}
+			if (list_a[j] > list_a[j + 1])
+				swap(list_a[j], list_a[j + 1]);
 		}
 	}
 }
-- 
2.32.0.3.g01195cf9f

