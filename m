Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 09CE551B9DD
	for <lists+dri-devel@lfdr.de>; Thu,  5 May 2022 10:16:54 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id BC0CB10F8D2;
	Thu,  5 May 2022 08:16:51 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from smtp-out1.suse.de (smtp-out1.suse.de [195.135.220.28])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 7758510F8DA
 for <dri-devel@lists.freedesktop.org>; Thu,  5 May 2022 08:16:49 +0000 (UTC)
Received: from imap2.suse-dmz.suse.de (imap2.suse-dmz.suse.de [192.168.254.74])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature ECDSA (P-521) server-digest SHA512)
 (No client certificate requested)
 by smtp-out1.suse.de (Postfix) with ESMTPS id 12A012129A;
 Thu,  5 May 2022 08:16:48 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.com; s=susede1;
 t=1651738608; h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
 mime-version:mime-version:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=IedMI7VTW3rOengTxIhbDIljAXRKt8bJ55HpQHeXTKE=;
 b=icajDoZbBIwzJ6XcUYvjT5rdUpqaOLHVx+KJgSdfR6jIBErNSkSt0o44KvdViEe6Gl4dxM
 y8ety7dLU+QVWAR9qvUOSPuT4K7BvqCgmQSR10XuH36FLkxabJLU+fZ6mW8c6f0yU+WgIg
 CVjSUZA1EqxHMUE0Gi/sxDg4kyBRsoM=
Received: from imap2.suse-dmz.suse.de (imap2.suse-dmz.suse.de [192.168.254.74])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature ECDSA (P-521) server-digest SHA512)
 (No client certificate requested)
 by imap2.suse-dmz.suse.de (Postfix) with ESMTPS id CCA8B13B11;
 Thu,  5 May 2022 08:16:47 +0000 (UTC)
Received: from dovecot-director2.suse.de ([192.168.254.65])
 by imap2.suse-dmz.suse.de with ESMTPSA id kD2xMO+Hc2K1BwAAMHmgww
 (envelope-from <jgross@suse.com>); Thu, 05 May 2022 08:16:47 +0000
From: Juergen Gross <jgross@suse.com>
To: xen-devel@lists.xenproject.org, dri-devel@lists.freedesktop.org,
 linux-kernel@vger.kernel.org
Subject: [PATCH v3 16/21] xen/drmfront: use xenbus_setup_ring() and
 xenbus_teardown_ring()
Date: Thu,  5 May 2022 10:16:35 +0200
Message-Id: <20220505081640.17425-17-jgross@suse.com>
X-Mailer: git-send-email 2.35.3
In-Reply-To: <20220505081640.17425-1-jgross@suse.com>
References: <20220505081640.17425-1-jgross@suse.com>
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
 drivers/gpu/drm/xen/xen_drm_front_evtchnl.c | 43 ++++++---------------
 1 file changed, 11 insertions(+), 32 deletions(-)

diff --git a/drivers/gpu/drm/xen/xen_drm_front_evtchnl.c b/drivers/gpu/drm/xen/xen_drm_front_evtchnl.c
index 4006568b9e32..e52afd792346 100644
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
 
@@ -168,44 +166,25 @@ static int evtchnl_alloc(struct xen_drm_front_info *front_info, int index,
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
-		SHARED_RING_INIT(sring);
-		FRONT_RING_INIT(&evtchnl->u.req.ring, sring, XEN_PAGE_SIZE);
-
-		ret = xenbus_grant_ring(xb_dev, sring, 1, &gref);
-		if (ret < 0) {
-			evtchnl->u.req.ring.sring = NULL;
-			free_page(page);
-			goto fail;
-		}
+		sring = page;
+		XEN_FRONT_RING_INIT(&evtchnl->u.req.ring, sring, XEN_PAGE_SIZE);
 
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
2.35.3

