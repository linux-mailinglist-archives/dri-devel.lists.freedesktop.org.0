Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 634D025252C
	for <lists+dri-devel@lfdr.de>; Wed, 26 Aug 2020 03:46:41 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 8C1BE6E9EB;
	Wed, 26 Aug 2020 01:46:39 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from us-smtp-delivery-1.mimecast.com (us-smtp-1.mimecast.com
 [207.211.31.81])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 411C36E9EB
 for <dri-devel@lists.freedesktop.org>; Wed, 26 Aug 2020 01:46:38 +0000 (UTC)
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-29-9W3jJmnmNUipVxNJVbRBGA-1; Tue, 25 Aug 2020 21:45:28 -0400
X-MC-Unique: 9W3jJmnmNUipVxNJVbRBGA-1
Received: from smtp.corp.redhat.com (int-mx02.intmail.prod.int.phx2.redhat.com
 [10.5.11.12])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx01.redhat.com (Postfix) with ESMTPS id 9B7991005E5B;
 Wed, 26 Aug 2020 01:45:27 +0000 (UTC)
Received: from tyrion-bne-redhat-com.redhat.com (vpn2-54-53.bne.redhat.com
 [10.64.54.53])
 by smtp.corp.redhat.com (Postfix) with ESMTP id 2F33660FC2;
 Wed, 26 Aug 2020 01:45:25 +0000 (UTC)
From: Dave Airlie <airlied@gmail.com>
To: dri-devel@lists.freedesktop.org
Subject: [PATCH 21/23] drm/ttm: store populated status in upper page flag bits.
Date: Wed, 26 Aug 2020 11:44:26 +1000
Message-Id: <20200826014428.828392-22-airlied@gmail.com>
In-Reply-To: <20200826014428.828392-1-airlied@gmail.com>
References: <20200826014428.828392-1-airlied@gmail.com>
MIME-Version: 1.0
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.12
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
Cc: kraxel@redhat.com, sroland@vmware.com, bskeggs@redhat.com,
 christian.koenig@amd.com
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

From: Dave Airlie <airlied@redhat.com>

Signed-off-by: Dave Airlie <airlied@redhat.com>
---
 include/drm/ttm/ttm_tt.h | 10 +++++++---
 1 file changed, 7 insertions(+), 3 deletions(-)

diff --git a/include/drm/ttm/ttm_tt.h b/include/drm/ttm/ttm_tt.h
index 2aa4cd7d6451..3b87ce43864a 100644
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
@@ -69,17 +71,19 @@ struct ttm_tt {
 	unsigned long num_pages;
 	struct file *swap_storage;
 	enum ttm_caching_state caching_state;
-	bool _populated;
 };
 
 static inline bool ttm_tt_is_populated(struct ttm_tt *tt)
 {
-	return tt->_populated;
+	return tt->page_flags & TTM_PAGE_FLAG_PRIV_POPULATED;
 }
 
 static inline void ttm_tt_set_populated(struct ttm_tt *tt, bool flag)
 {
-	tt->_populated = flag;
+	if (flag)
+		tt->page_flags |= TTM_PAGE_FLAG_PRIV_POPULATED;
+	else
+		tt->page_flags &= ~TTM_PAGE_FLAG_PRIV_POPULATED;
 }
 
 /**
-- 
2.27.0

_______________________________________________
dri-devel mailing list
dri-devel@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/dri-devel
