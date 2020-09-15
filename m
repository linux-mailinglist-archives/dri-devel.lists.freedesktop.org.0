Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id ADF40269BF8
	for <lists+dri-devel@lfdr.de>; Tue, 15 Sep 2020 04:40:29 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 6F5056E82F;
	Tue, 15 Sep 2020 02:40:25 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from us-smtp-delivery-1.mimecast.com (us-smtp-2.mimecast.com
 [205.139.110.61])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 2B2956E830
 for <dri-devel@lists.freedesktop.org>; Tue, 15 Sep 2020 02:40:22 +0000 (UTC)
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-580-qHTwVzuQOfaA9IIxcTmc4g-1; Mon, 14 Sep 2020 22:40:17 -0400
X-MC-Unique: qHTwVzuQOfaA9IIxcTmc4g-1
Received: from smtp.corp.redhat.com (int-mx05.intmail.prod.int.phx2.redhat.com
 [10.5.11.15])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx01.redhat.com (Postfix) with ESMTPS id 19BD61007461;
 Tue, 15 Sep 2020 02:40:16 +0000 (UTC)
Received: from tyrion-bne-redhat-com.redhat.com (vpn2-54-25.bne.redhat.com
 [10.64.54.25])
 by smtp.corp.redhat.com (Postfix) with ESMTP id 26AE075142;
 Tue, 15 Sep 2020 02:40:14 +0000 (UTC)
From: Dave Airlie <airlied@gmail.com>
To: dri-devel@lists.freedesktop.org
Subject: [PATCH 3/7] drm/ttm: tt destroy move null check to outer function.
Date: Tue, 15 Sep 2020 12:40:03 +1000
Message-Id: <20200915024007.67163-4-airlied@gmail.com>
In-Reply-To: <20200915024007.67163-1-airlied@gmail.com>
References: <20200915024007.67163-1-airlied@gmail.com>
MIME-Version: 1.0
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.15
X-Mimecast-Spam-Score: 0.0
X-Mimecast-Originator: gmail.com
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
Reply-To: , PATCH@freedesktop.org, drm@freedesktop.org
Cc: christian.koenig@amd.com, bskeggs@redhat.com
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

From: Dave Airlie <airlied@redhat.com>

This just makes things easier later.

Signed-off-by: Dave Airlie <airlied@redhat.com>
---
 drivers/gpu/drm/ttm/ttm_bo_util.c | 2 ++
 drivers/gpu/drm/ttm/ttm_tt.c      | 3 ---
 2 files changed, 2 insertions(+), 3 deletions(-)

diff --git a/drivers/gpu/drm/ttm/ttm_bo_util.c b/drivers/gpu/drm/ttm/ttm_bo_util.c
index 0ddaaa1ddafd..f3452a1624fd 100644
--- a/drivers/gpu/drm/ttm/ttm_bo_util.c
+++ b/drivers/gpu/drm/ttm/ttm_bo_util.c
@@ -699,6 +699,8 @@ int ttm_bo_pipeline_gutting(struct ttm_buffer_object *bo)
 
 void ttm_bo_tt_destroy(struct ttm_buffer_object *bo)
 {
+	if (bo->ttm == NULL)
+		return;
 	ttm_tt_destroy(bo->bdev, bo->ttm);
 	bo->ttm = NULL;
 }
diff --git a/drivers/gpu/drm/ttm/ttm_tt.c b/drivers/gpu/drm/ttm/ttm_tt.c
index ff3d953aa90e..381face3cedb 100644
--- a/drivers/gpu/drm/ttm/ttm_tt.c
+++ b/drivers/gpu/drm/ttm/ttm_tt.c
@@ -209,9 +209,6 @@ EXPORT_SYMBOL(ttm_tt_set_placement_caching);
 
 void ttm_tt_destroy(struct ttm_bo_device *bdev, struct ttm_tt *ttm)
 {
-	if (ttm == NULL)
-		return;
-
 	ttm_tt_unbind(bdev, ttm);
 
 	ttm_tt_unpopulate(bdev, ttm);
-- 
2.27.0

_______________________________________________
dri-devel mailing list
dri-devel@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/dri-devel
