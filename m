Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 2A92E19A056
	for <lists+dri-devel@lfdr.de>; Tue, 31 Mar 2020 22:58:16 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 205F76E896;
	Tue, 31 Mar 2020 20:58:14 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from us-smtp-1.mimecast.com (us-smtp-delivery-1.mimecast.com
 [205.139.110.120])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 778D96E895
 for <dri-devel@lists.freedesktop.org>; Tue, 31 Mar 2020 20:58:12 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1585688291;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=mpM1XxT0yKaKGYgf2gGKRTmepGnz6nJa59IN7BPPkTY=;
 b=f+OEVQmhuu6eWUitWHhzZWqCAQOjC1OMS7D4bYVQWvSEhlngDS1PJltKp77zH7L4rfz4CM
 85gkgBol9YEPRCnVhDW8U9U8rk7Ez/ht846+omo0T9+nufHvN8f+NGTMoMt4T33KqL1fsG
 d5FynTSne/C4+tj3i07upJwryaY1u2Y=
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-326-_8ieoBgKMOu3PpoyXoV6Rw-1; Tue, 31 Mar 2020 16:58:04 -0400
X-MC-Unique: _8ieoBgKMOu3PpoyXoV6Rw-1
Received: from smtp.corp.redhat.com (int-mx03.intmail.prod.int.phx2.redhat.com
 [10.5.11.13])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx01.redhat.com (Postfix) with ESMTPS id B89E6192296B;
 Tue, 31 Mar 2020 20:58:02 +0000 (UTC)
Received: from Ruby.redhat.com (ovpn-113-88.rdu2.redhat.com [10.10.113.88])
 by smtp.corp.redhat.com (Postfix) with ESMTP id 3CCE199DE2;
 Tue, 31 Mar 2020 20:58:00 +0000 (UTC)
From: Lyude Paul <lyude@redhat.com>
To: amd-gfx@lists.freedesktop.org,
	dri-devel@lists.freedesktop.org
Subject: [PATCH 4/4] drm/dp_mst: Remove
 drm_dp_mst_topology_cbs.destroy_connector
Date: Tue, 31 Mar 2020 16:57:37 -0400
Message-Id: <20200331205740.135525-5-lyude@redhat.com>
In-Reply-To: <20200331205740.135525-1-lyude@redhat.com>
References: <20200331205740.135525-1-lyude@redhat.com>
MIME-Version: 1.0
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.13
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
Cc: Thomas Zimmermann <tzimmermann@suse.de>, David Airlie <airlied@linux.ie>,
 Pankaj Bharadiya <pankaj.laxminarayan.bharadiya@intel.com>,
 linux-kernel@vger.kernel.org
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

Now that we've removed the last user of this callback, get rid of it and
drm_dp_destroy_connector().

Signed-off-by: Lyude Paul <lyude@redhat.com>
Cc: Pankaj Bharadiya <pankaj.laxminarayan.bharadiya@intel.com>
---
 drivers/gpu/drm/drm_dp_mst_topology.c | 16 +++-------------
 include/drm/drm_dp_mst_helper.h       |  2 --
 2 files changed, 3 insertions(+), 15 deletions(-)

diff --git a/drivers/gpu/drm/drm_dp_mst_topology.c b/drivers/gpu/drm/drm_dp_mst_topology.c
index 31b7a8f5309d..e235b2b29f59 100644
--- a/drivers/gpu/drm/drm_dp_mst_topology.c
+++ b/drivers/gpu/drm/drm_dp_mst_topology.c
@@ -4692,23 +4692,13 @@ static void drm_dp_tx_work(struct work_struct *work)
 	mutex_unlock(&mgr->qlock);
 }
 
-static inline void drm_dp_destroy_connector(struct drm_dp_mst_port *port)
+static inline void
+drm_dp_delayed_destroy_port(struct drm_dp_mst_port *port)
 {
-	if (!port->connector)
-		return;
-
-	if (port->mgr->cbs->destroy_connector) {
-		port->mgr->cbs->destroy_connector(port->mgr, port->connector);
-	} else {
+	if (port->connector) {
 		drm_connector_unregister(port->connector);
 		drm_connector_put(port->connector);
 	}
-}
-
-static inline void
-drm_dp_delayed_destroy_port(struct drm_dp_mst_port *port)
-{
-	drm_dp_destroy_connector(port);
 
 	drm_dp_port_set_pdt(port, DP_PEER_DEVICE_NONE, port->mcs);
 	drm_dp_mst_put_port_malloc(port);
diff --git a/include/drm/drm_dp_mst_helper.h b/include/drm/drm_dp_mst_helper.h
index 13461db1444a..7af51c947b81 100644
--- a/include/drm/drm_dp_mst_helper.h
+++ b/include/drm/drm_dp_mst_helper.h
@@ -488,8 +488,6 @@ struct drm_dp_mst_topology_mgr;
 struct drm_dp_mst_topology_cbs {
 	/* create a connector for a port */
 	struct drm_connector *(*add_connector)(struct drm_dp_mst_topology_mgr *mgr, struct drm_dp_mst_port *port, const char *path);
-	void (*destroy_connector)(struct drm_dp_mst_topology_mgr *mgr,
-				  struct drm_connector *connector);
 };
 
 #define DP_MAX_PAYLOAD (sizeof(unsigned long) * 8)
-- 
2.25.1

_______________________________________________
dri-devel mailing list
dri-devel@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/dri-devel
