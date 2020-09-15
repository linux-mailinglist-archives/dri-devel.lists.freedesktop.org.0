Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 14362269BFA
	for <lists+dri-devel@lfdr.de>; Tue, 15 Sep 2020 04:40:34 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id A81506E832;
	Tue, 15 Sep 2020 02:40:27 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from us-smtp-delivery-1.mimecast.com (us-smtp-1.mimecast.com
 [207.211.31.81])
 by gabe.freedesktop.org (Postfix) with ESMTPS id D9C8C6E830
 for <dri-devel@lists.freedesktop.org>; Tue, 15 Sep 2020 02:40:25 +0000 (UTC)
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-345-Dbm_e-9iPz-Uvkrm7sUQBQ-1; Mon, 14 Sep 2020 22:40:22 -0400
X-MC-Unique: Dbm_e-9iPz-Uvkrm7sUQBQ-1
Received: from smtp.corp.redhat.com (int-mx05.intmail.prod.int.phx2.redhat.com
 [10.5.11.15])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx01.redhat.com (Postfix) with ESMTPS id 524B9800688;
 Tue, 15 Sep 2020 02:40:21 +0000 (UTC)
Received: from tyrion-bne-redhat-com.redhat.com (vpn2-54-25.bne.redhat.com
 [10.64.54.25])
 by smtp.corp.redhat.com (Postfix) with ESMTP id 5F8137512A;
 Tue, 15 Sep 2020 02:40:20 +0000 (UTC)
From: Dave Airlie <airlied@gmail.com>
To: dri-devel@lists.freedesktop.org
Subject: [PATCH 7/7] drm/ttm: move populated state into page flags
Date: Tue, 15 Sep 2020 12:40:07 +1000
Message-Id: <20200915024007.67163-8-airlied@gmail.com>
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

Just use the top bit of page flags to store the populated state.

Signed-off-by: Dave Airlie <airlied@redhat.com>
---
 include/drm/ttm/ttm_tt.h | 9 +++++----
 1 file changed, 5 insertions(+), 4 deletions(-)

diff --git a/include/drm/ttm/ttm_tt.h b/include/drm/ttm/ttm_tt.h
index 94e16238c93d..c777b72063db 100644
--- a/include/drm/ttm/ttm_tt.h
+++ b/include/drm/ttm/ttm_tt.h
@@ -42,6 +42,8 @@ struct ttm_operation_ctx;
 #define TTM_PAGE_FLAG_SG              (1 << 8)
 #define TTM_PAGE_FLAG_NO_RETRY	      (1 << 9)
 
+#define TTM_PAGE_FLAG_PRIV_POPULATED  (1 << 31)
+
 enum ttm_caching_state {
 	tt_uncached,
 	tt_wc,
@@ -70,22 +72,21 @@ struct ttm_tt {
 	struct sg_table *sg; /* for SG objects via dma-buf */
 	struct file *swap_storage;
 	enum ttm_caching_state caching_state;
-	bool populated;
 };
 
 static inline bool ttm_tt_is_populated(struct ttm_tt *tt)
 {
-	return tt->populated;
+	return tt->page_flags & TTM_PAGE_FLAG_PRIV_POPULATED;
 }
 
 static inline void ttm_tt_set_unpopulated(struct ttm_tt *tt)
 {
-	tt->populated = false;
+	tt->page_flags &= ~TTM_PAGE_FLAG_PRIV_POPULATED;
 }
 
 static inline void ttm_tt_set_populated(struct ttm_tt *tt)
 {
-	tt->populated = true;
+	tt->page_flags |= TTM_PAGE_FLAG_PRIV_POPULATED;
 }
 
 /**
-- 
2.27.0

_______________________________________________
dri-devel mailing list
dri-devel@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/dri-devel
