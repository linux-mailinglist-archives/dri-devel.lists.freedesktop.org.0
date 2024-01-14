Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id ACA9A82D10F
	for <lists+dri-devel@lfdr.de>; Sun, 14 Jan 2024 16:09:31 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id BF88110E12C;
	Sun, 14 Jan 2024 15:09:26 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from smtp.smtpout.orange.fr (smtp-24.smtpout.orange.fr
 [80.12.242.24])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 3B20D10E12C
 for <dri-devel@lists.freedesktop.org>; Sun, 14 Jan 2024 15:09:25 +0000 (UTC)
Received: from fedora.home ([92.140.202.140]) by smtp.orange.fr with ESMTPA
 id P26xrDSR7T1UwP26xrm4KQ; Sun, 14 Jan 2024 16:09:22 +0100
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=wanadoo.fr;
 s=t20230301; t=1705244962;
 bh=D4u6ZY8/Ur6FTZ//imiCQyP7Y8yAqe7AAZ58naxjz8A=;
 h=From:To:Cc:Subject:Date;
 b=nzH4J84cZVHQOVW0KPp/cLSC3pL50CpKxdOjirhPLQfNhV/Yrqo75zKzkKfxCwCHu
 mDt1PvfU1iULiOHF2aQ/bypcGVlUATudKhYMLC0YxipoqpSxTeLzzk5NnyuLp0LOJT
 G8AgPHmauRqaW/2TMO2NCi8Dy2gKsyghfFsMhrz9EU/3e8a9W2KNfIybrzYWngOZL/
 7+eMRxQYSld9TOdoxLiQXpe4W1LEHQw/Bekr9DzHbrFRtY4YRwfJ8jMexWLZnU2v6O
 qLd3Qbuo0lerFxtd+xh52kSTkkxixzl5oepVZ63hCe3WYCGjzGLqZpFQ2Vy87kvlrQ
 B+4a6dzhzd8EQ==
X-ME-Helo: fedora.home
X-ME-Auth: Y2hyaXN0b3BoZS5qYWlsbGV0QHdhbmFkb28uZnI=
X-ME-Date: Sun, 14 Jan 2024 16:09:22 +0100
X-ME-IP: 92.140.202.140
From: Christophe JAILLET <christophe.jaillet@wanadoo.fr>
To: Lucas De Marchi <lucas.demarchi@intel.com>,
 Oded Gabbay <ogabbay@kernel.org>,
 =?UTF-8?q?Thomas=20Hellstr=C3=B6m?= <thomas.hellstrom@linux.intel.com>,
 Maarten Lankhorst <maarten.lankhorst@linux.intel.com>,
 Maxime Ripard <mripard@kernel.org>,
 Thomas Zimmermann <tzimmermann@suse.de>, David Airlie <airlied@gmail.com>,
 Daniel Vetter <daniel@ffwll.ch>
Subject: [PATCH] drm/xe/guc: Remove usage of the deprecated ida_simple_xx() API
Date: Sun, 14 Jan 2024 16:09:16 +0100
Message-ID: <d6a9ec9dc426fca372eaa1423a83632bd743c5d9.1705244938.git.christophe.jaillet@wanadoo.fr>
X-Mailer: git-send-email 2.43.0
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
Cc: Christophe JAILLET <christophe.jaillet@wanadoo.fr>,
 kernel-janitors@vger.kernel.org, linux-kernel@vger.kernel.org,
 dri-devel@lists.freedesktop.org, intel-xe@lists.freedesktop.org
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

ida_alloc() and ida_free() should be preferred to the deprecated
ida_simple_get() and ida_simple_remove().

Note that the upper limit of ida_simple_get() is exclusive, but the one of
ida_alloc_max() is inclusive. So a -1 has been added when needed.

Signed-off-by: Christophe JAILLET <christophe.jaillet@wanadoo.fr>
---
 drivers/gpu/drm/xe/xe_guc_submit.c | 6 +++---
 1 file changed, 3 insertions(+), 3 deletions(-)

diff --git a/drivers/gpu/drm/xe/xe_guc_submit.c b/drivers/gpu/drm/xe/xe_guc_submit.c
index 21ac68e3246f..11ffacd1dd58 100644
--- a/drivers/gpu/drm/xe/xe_guc_submit.c
+++ b/drivers/gpu/drm/xe/xe_guc_submit.c
@@ -311,7 +311,7 @@ static void __release_guc_id(struct xe_guc *guc, struct xe_exec_queue *q, u32 xa
 				      q->guc->id - GUC_ID_START_MLRC,
 				      order_base_2(q->width));
 	else
-		ida_simple_remove(&guc->submission_state.guc_ids, q->guc->id);
+		ida_free(&guc->submission_state.guc_ids, q->guc->id);
 }
 
 static int alloc_guc_id(struct xe_guc *guc, struct xe_exec_queue *q)
@@ -335,8 +335,8 @@ static int alloc_guc_id(struct xe_guc *guc, struct xe_exec_queue *q)
 		ret = bitmap_find_free_region(bitmap, GUC_ID_NUMBER_MLRC,
 					      order_base_2(q->width));
 	} else {
-		ret = ida_simple_get(&guc->submission_state.guc_ids, 0,
-				     GUC_ID_NUMBER_SLRC, GFP_NOWAIT);
+		ret = ida_alloc_max(&guc->submission_state.guc_ids,
+				    GUC_ID_NUMBER_SLRC - 1, GFP_NOWAIT);
 	}
 	if (ret < 0)
 		return ret;
-- 
2.43.0

