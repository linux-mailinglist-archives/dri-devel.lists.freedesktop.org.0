Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 5AB78707BC6
	for <lists+dri-devel@lfdr.de>; Thu, 18 May 2023 10:20:46 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 969B510E4E7;
	Thu, 18 May 2023 08:20:36 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
X-Greylist: delayed 543 seconds by postgrey-1.36 at gabe;
 Wed, 17 May 2023 13:02:14 UTC
Received: from mail.ispras.ru (mail.ispras.ru [83.149.199.84])
 by gabe.freedesktop.org (Postfix) with ESMTPS id B0B0210E122
 for <dri-devel@lists.freedesktop.org>; Wed, 17 May 2023 13:02:14 +0000 (UTC)
Received: from vefanov-Precision-3650-Tower.intra.ispras.ru (unknown
 [10.10.2.69])
 by mail.ispras.ru (Postfix) with ESMTPSA id E979144C1013;
 Wed, 17 May 2023 12:53:05 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 mail.ispras.ru E979144C1013
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ispras.ru;
 s=default; t=1684327986;
 bh=KFaX/2tqEHJVLG8kfiqijrjpzQ1dulXoIoRl1Nm6ws4=;
 h=From:To:Cc:Subject:Date:From;
 b=ZG1fdJH2oBF1CHR2wwa1NllsEyhlC/jOhH8h9ubTvPRpSNyDlOduUsGvINvz6FN1w
 /l4EkLGy8uUj43MBmgeHPNizD5r053D/05CVV1ry6yX36RdHHsGTrkcWp5TsTzZW3F
 pAQfrN2BdL/5S2rfItpWx9Lpt5lHQW8aGQZ5s7Oc=
From: Vladislav Efanov <VEfanov@ispras.ru>
To: Luben Tuikov <luben.tuikov@amd.com>
Subject: [PATCH] drm/sched: Remove redundant check
Date: Wed, 17 May 2023 15:52:47 +0300
Message-Id: <20230517125247.434103-1-VEfanov@ispras.ru>
X-Mailer: git-send-email 2.34.1
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Mailman-Approved-At: Thu, 18 May 2023 08:20:23 +0000
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
Cc: Andrey Grodzovsky <andrey.grodzovsky@amd.com>, lvc-project@linuxtesting.org,
 linux-kernel@vger.kernel.org, dri-devel@lists.freedesktop.org,
 Vladislav Efanov <VEfanov@ispras.ru>,
 =?UTF-8?q?Christian=20K=C3=B6nig?= <christian.koenig@amd.com>
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

The rq pointer points inside the drm_gpu_scheduler structure. Thus
it can't be NULL.

Found by Linux Verification Center (linuxtesting.org) with SVACE.

Fixes: c61cdbdbffc1 ("drm/scheduler: Fix hang when sched_entity released")
Signed-off-by: Vladislav Efanov <VEfanov@ispras.ru>
---
 drivers/gpu/drm/scheduler/sched_main.c | 3 ---
 1 file changed, 3 deletions(-)

diff --git a/drivers/gpu/drm/scheduler/sched_main.c b/drivers/gpu/drm/scheduler/sched_main.c
index 8c183639603e..aea5a90ff98b 100644
--- a/drivers/gpu/drm/scheduler/sched_main.c
+++ b/drivers/gpu/drm/scheduler/sched_main.c
@@ -1141,9 +1141,6 @@ void drm_sched_fini(struct drm_gpu_scheduler *sched)
 	for (i = DRM_SCHED_PRIORITY_COUNT - 1; i >= DRM_SCHED_PRIORITY_MIN; i--) {
 		struct drm_sched_rq *rq = &sched->sched_rq[i];
 
-		if (!rq)
-			continue;
-
 		spin_lock(&rq->lock);
 		list_for_each_entry(s_entity, &rq->entities, list)
 			/*
-- 
2.34.1

