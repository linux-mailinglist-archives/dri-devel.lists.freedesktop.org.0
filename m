Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id A5B34508B9B
	for <lists+dri-devel@lfdr.de>; Wed, 20 Apr 2022 17:10:09 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 580F510F197;
	Wed, 20 Apr 2022 15:10:05 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from smtp-out1.suse.de (smtp-out1.suse.de [195.135.220.28])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 039F210F197
 for <dri-devel@lists.freedesktop.org>; Wed, 20 Apr 2022 15:10:02 +0000 (UTC)
Received: from imap2.suse-dmz.suse.de (imap2.suse-dmz.suse.de [192.168.254.74])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature ECDSA (P-521) server-digest SHA512)
 (No client certificate requested)
 by smtp-out1.suse.de (Postfix) with ESMTPS id 74293215FF;
 Wed, 20 Apr 2022 15:10:01 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.com; s=susede1;
 t=1650467401; h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
 mime-version:mime-version:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=tmwmbbtZJudUbAIbysps04tc1Vmd3FQIvvzlUXPcKxg=;
 b=pAfvqqiAD4OraYwqo6cZohlEfrN0mMKqAKpKdNaD5lUWEA3R1ABBgaA1jdc8J3HR2zf6Wv
 CbtxRrC6+LnfHL8iyNIz6lOK5roLsOdBsexS444hgxmjwnb4JHGj8GWdkog+m6mn/sWicy
 SxSln3cit6a9OYDk0m+vcJYUQ1e4DUo=
Received: from imap2.suse-dmz.suse.de (imap2.suse-dmz.suse.de [192.168.254.74])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature ECDSA (P-521) server-digest SHA512)
 (No client certificate requested)
 by imap2.suse-dmz.suse.de (Postfix) with ESMTPS id 3DC6113AD5;
 Wed, 20 Apr 2022 15:10:01 +0000 (UTC)
Received: from dovecot-director2.suse.de ([192.168.254.65])
 by imap2.suse-dmz.suse.de with ESMTPSA id sI81DUkiYGJILQAAMHmgww
 (envelope-from <jgross@suse.com>); Wed, 20 Apr 2022 15:10:01 +0000
From: Juergen Gross <jgross@suse.com>
To: xen-devel@lists.xenproject.org, dri-devel@lists.freedesktop.org,
 linux-kernel@vger.kernel.org
Subject: [PATCH 13/18] xen/drmfront: use xenbus_setup_ring() and
 xenbus_teardown_ring()
Date: Wed, 20 Apr 2022 17:09:37 +0200
Message-Id: <20220420150942.31235-14-jgross@suse.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20220420150942.31235-1-jgross@suse.com>
References: <20220420150942.31235-1-jgross@suse.com>
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
Cc: Juergen Gross <jgross@suse.com>, David Airlie <airlied@linux.ie>,
 Oleksandr Andrushchenko <oleksandr_andrushchenko@epam.com>
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

Simplify drmfront's ring creation and removal via xenbus_setup_ring()
and xenbus_teardown_ring().

Signed-off-by: Juergen Gross <jgross@suse.com>
---
 drivers/gpu/drm/xen/xen_drm_front_evtchnl.c | 40 ++++++---------------
 1 file changed, 10 insertions(+), 30 deletions(-)

diff --git a/drivers/gpu/drm/xen/xen_drm_front_evtchnl.c b/drivers/gpu/drm/xen/xen_drm_front_evtchnl.c
index 4006568b9e32..9b16ea9f523b 100644
--- a/drivers/gpu/drm/xen/xen_drm_front_evtchnl.c
+++ b/drivers/gpu/drm/xen/xen_drm_front_evtchnl.c
@@ -123,12 +123,12 @@ static irqreturn_t evtchnl_interrupt_evt(int irq, void *dev_id)
 static void evtchnl_free(struct xen_drm_front_info *front_info,
 			 struct xen_drm_front_evtchnl *evtchnl)
 {
-	unsigned long page = 0;
+	void *page = NULL;
 
 	if (evtchnl->type == EVTCHNL_TYPE_REQ)
-		page = (unsigned long)evtchnl->u.req.ring.sring;
+		page = evtchnl->u.req.ring.sring;
 	else if (evtchnl->type == EVTCHNL_TYPE_EVT)
-		page = (unsigned long)evtchnl->u.evt.page;
+		page = evtchnl->u.evt.page;
 	if (!page)
 		return;
 
@@ -147,8 +147,7 @@ static void evtchnl_free(struct xen_drm_front_info *front_info,
 		xenbus_free_evtchn(front_info->xb_dev, evtchnl->port);
 
 	/* end access and free the page */
-	if (evtchnl->gref != INVALID_GRANT_REF)
-		gnttab_end_foreign_access(evtchnl->gref, page);
+	xenbus_teardown_ring(&page, 1, &evtchnl->gref);
 
 	memset(evtchnl, 0, sizeof(*evtchnl));
 }
@@ -158,8 +157,7 @@ static int evtchnl_alloc(struct xen_drm_front_info *front_info, int index,
 			 enum xen_drm_front_evtchnl_type type)
 {
 	struct xenbus_device *xb_dev = front_info->xb_dev;
-	unsigned long page;
-	grant_ref_t gref;
+	void *page;
 	irq_handler_t handler;
 	int ret;
 
@@ -168,44 +166,26 @@ static int evtchnl_alloc(struct xen_drm_front_info *front_info, int index,
 	evtchnl->index = index;
 	evtchnl->front_info = front_info;
 	evtchnl->state = EVTCHNL_STATE_DISCONNECTED;
-	evtchnl->gref = INVALID_GRANT_REF;
 
-	page = get_zeroed_page(GFP_NOIO | __GFP_HIGH);
-	if (!page) {
-		ret = -ENOMEM;
+	ret = xenbus_setup_ring(xb_dev, GFP_NOIO | __GFP_HIGH, &page,
+				1, &evtchnl->gref);
+	if (ret)
 		goto fail;
-	}
 
 	if (type == EVTCHNL_TYPE_REQ) {
 		struct xen_displif_sring *sring;
 
 		init_completion(&evtchnl->u.req.completion);
 		mutex_init(&evtchnl->u.req.req_io_lock);
-		sring = (struct xen_displif_sring *)page;
+		sring = page;
 		SHARED_RING_INIT(sring);
 		FRONT_RING_INIT(&evtchnl->u.req.ring, sring, XEN_PAGE_SIZE);
 
-		ret = xenbus_grant_ring(xb_dev, sring, 1, &gref);
-		if (ret < 0) {
-			evtchnl->u.req.ring.sring = NULL;
-			free_page(page);
-			goto fail;
-		}
-
 		handler = evtchnl_interrupt_ctrl;
 	} else {
-		ret = gnttab_grant_foreign_access(xb_dev->otherend_id,
-						  virt_to_gfn((void *)page), 0);
-		if (ret < 0) {
-			free_page(page);
-			goto fail;
-		}
-
-		evtchnl->u.evt.page = (struct xendispl_event_page *)page;
-		gref = ret;
+		evtchnl->u.evt.page = page;
 		handler = evtchnl_interrupt_evt;
 	}
-	evtchnl->gref = gref;
 
 	ret = xenbus_alloc_evtchn(xb_dev, &evtchnl->port);
 	if (ret < 0)
-- 
2.34.1

