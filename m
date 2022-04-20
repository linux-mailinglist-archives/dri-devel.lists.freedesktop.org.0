Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 753CB508B9C
	for <lists+dri-devel@lfdr.de>; Wed, 20 Apr 2022 17:10:12 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 1B0E710F198;
	Wed, 20 Apr 2022 15:10:06 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from smtp-out1.suse.de (smtp-out1.suse.de [195.135.220.28])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 19EE110F197
 for <dri-devel@lists.freedesktop.org>; Wed, 20 Apr 2022 15:10:01 +0000 (UTC)
Received: from imap2.suse-dmz.suse.de (imap2.suse-dmz.suse.de [192.168.254.74])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature ECDSA (P-521) server-digest SHA512)
 (No client certificate requested)
 by smtp-out1.suse.de (Postfix) with ESMTPS id A9A2B2129B;
 Wed, 20 Apr 2022 15:09:59 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.com; s=susede1;
 t=1650467399; h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
 mime-version:mime-version:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=tOhV6YQDouFKSF4kDrscgmAnoCYSHdFmpTsct9Kqzek=;
 b=M2CSLl0VqnHJJC0YsOCEQojyDKPkmBs5veLj38AgGdJxabAIf7h7XElPNlT4+0mo0+eBOj
 zKrOb0vmHAlVaH4Nbwvy1oILNfIjzCnCLFr0PRRGVQhPpjPeLu24cZScK/vIUcyE6IHG/O
 MNv+w8hsIg/uI1+QirFTAqLXtACWMas=
Received: from imap2.suse-dmz.suse.de (imap2.suse-dmz.suse.de [192.168.254.74])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature ECDSA (P-521) server-digest SHA512)
 (No client certificate requested)
 by imap2.suse-dmz.suse.de (Postfix) with ESMTPS id 6D87713AD5;
 Wed, 20 Apr 2022 15:09:59 +0000 (UTC)
Received: from dovecot-director2.suse.de ([192.168.254.65])
 by imap2.suse-dmz.suse.de with ESMTPSA id MJhzGUciYGJILQAAMHmgww
 (envelope-from <jgross@suse.com>); Wed, 20 Apr 2022 15:09:59 +0000
From: Juergen Gross <jgross@suse.com>
To: xen-devel@lists.xenproject.org, dri-devel@lists.freedesktop.org,
 linux-kernel@vger.kernel.org
Subject: [PATCH 05/18] xen/drm: switch xen_drm_front to use INVALID_GRANT_REF
Date: Wed, 20 Apr 2022 17:09:29 +0200
Message-Id: <20220420150942.31235-6-jgross@suse.com>
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

Instead of using a private macro for an invalid grant reference use
the common one.

Signed-off-by: Juergen Gross <jgross@suse.com>
---
 drivers/gpu/drm/xen/xen_drm_front.h         | 9 ---------
 drivers/gpu/drm/xen/xen_drm_front_evtchnl.c | 4 ++--
 2 files changed, 2 insertions(+), 11 deletions(-)

diff --git a/drivers/gpu/drm/xen/xen_drm_front.h b/drivers/gpu/drm/xen/xen_drm_front.h
index cefafe859aba..a987c78abe41 100644
--- a/drivers/gpu/drm/xen/xen_drm_front.h
+++ b/drivers/gpu/drm/xen/xen_drm_front.h
@@ -80,15 +80,6 @@ struct drm_pending_vblank_event;
 /* timeout in ms to wait for backend to respond */
 #define XEN_DRM_FRONT_WAIT_BACK_MS	3000
 
-#ifndef GRANT_INVALID_REF
-/*
- * Note on usage of grant reference 0 as invalid grant reference:
- * grant reference 0 is valid, but never exposed to a PV driver,
- * because of the fact it is already in use/reserved by the PV console.
- */
-#define GRANT_INVALID_REF	0
-#endif
-
 struct xen_drm_front_info {
 	struct xenbus_device *xb_dev;
 	struct xen_drm_front_drm_info *drm_info;
diff --git a/drivers/gpu/drm/xen/xen_drm_front_evtchnl.c b/drivers/gpu/drm/xen/xen_drm_front_evtchnl.c
index 08b526eeec16..4006568b9e32 100644
--- a/drivers/gpu/drm/xen/xen_drm_front_evtchnl.c
+++ b/drivers/gpu/drm/xen/xen_drm_front_evtchnl.c
@@ -147,7 +147,7 @@ static void evtchnl_free(struct xen_drm_front_info *front_info,
 		xenbus_free_evtchn(front_info->xb_dev, evtchnl->port);
 
 	/* end access and free the page */
-	if (evtchnl->gref != GRANT_INVALID_REF)
+	if (evtchnl->gref != INVALID_GRANT_REF)
 		gnttab_end_foreign_access(evtchnl->gref, page);
 
 	memset(evtchnl, 0, sizeof(*evtchnl));
@@ -168,7 +168,7 @@ static int evtchnl_alloc(struct xen_drm_front_info *front_info, int index,
 	evtchnl->index = index;
 	evtchnl->front_info = front_info;
 	evtchnl->state = EVTCHNL_STATE_DISCONNECTED;
-	evtchnl->gref = GRANT_INVALID_REF;
+	evtchnl->gref = INVALID_GRANT_REF;
 
 	page = get_zeroed_page(GFP_NOIO | __GFP_HIGH);
 	if (!page) {
-- 
2.34.1

