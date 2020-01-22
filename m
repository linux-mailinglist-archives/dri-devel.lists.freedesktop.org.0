Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 9E847145CAD
	for <lists+dri-devel@lfdr.de>; Wed, 22 Jan 2020 20:49:04 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 248DD6F8A0;
	Wed, 22 Jan 2020 19:49:02 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from us-smtp-1.mimecast.com (us-smtp-delivery-1.mimecast.com
 [205.139.110.120])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 2BD8E6F8A0
 for <dri-devel@lists.freedesktop.org>; Wed, 22 Jan 2020 19:49:01 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1579722539;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:
 content-transfer-encoding:content-transfer-encoding;
 bh=Ma5Y1/pMEZixk7IDf2HYKU6je151JAJZTEKd6Ot7KFo=;
 b=Pob899bkxLkYzmULrX3MciJrt6kX2pUVCDmXzLYOGnjckCESPef7wbD60/3Hjsiw2CgAME
 bNWhtH7hIackvDQhTf+Lg6tVlZsvYJbtxrTZH031lpN3qZNszMhC0eK5VOMjA9uWVzSn9I
 WWbFV5aHwsfog7qIZ4xF5I83gRIP6rE=
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-330-POiDRitANUyQ9M88Y-KYTA-1; Wed, 22 Jan 2020 14:48:55 -0500
X-MC-Unique: POiDRitANUyQ9M88Y-KYTA-1
Received: from smtp.corp.redhat.com (int-mx04.intmail.prod.int.phx2.redhat.com
 [10.5.11.14])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx01.redhat.com (Postfix) with ESMTPS id 6C8A710937C5;
 Wed, 22 Jan 2020 19:48:53 +0000 (UTC)
Received: from malachite.bss.redhat.com (dhcp-10-20-1-90.bss.redhat.com
 [10.20.1.90])
 by smtp.corp.redhat.com (Postfix) with ESMTP id 5051A5D9E2;
 Wed, 22 Jan 2020 19:48:50 +0000 (UTC)
From: Lyude Paul <lyude@redhat.com>
To: dri-devel@lists.freedesktop.org
Subject: [PATCH] drm/dp_mst: Convert
 drm_dp_mst_topology_mgr.is_waiting_for_dwn_reply to bitfield
Date: Wed, 22 Jan 2020 14:48:46 -0500
Message-Id: <20200122194846.16025-1-lyude@redhat.com>
MIME-Version: 1.0
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.14
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
Cc: David Airlie <airlied@linux.ie>, linux-kernel@vger.kernel.org,
 Wayne Lin <Wayne.Lin@amd.com>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

Small nitpick that I noticed a second ago - we can save some space in
the struct by making this a bitfield and sticking it with the rest of
the bitfields. Also, some small cleanup to the kdocs for this member.

There should be no functional changes in this patch.

Signed-off-by: Lyude Paul <lyude@redhat.com>
Cc: Wayne Lin <Wayne.Lin@amd.com>
---
 include/drm/drm_dp_mst_helper.h | 10 +++++-----
 1 file changed, 5 insertions(+), 5 deletions(-)

diff --git a/include/drm/drm_dp_mst_helper.h b/include/drm/drm_dp_mst_helper.h
index bcb39da9adb4..58bbab3684b5 100644
--- a/include/drm/drm_dp_mst_helper.h
+++ b/include/drm/drm_dp_mst_helper.h
@@ -590,6 +590,11 @@ struct drm_dp_mst_topology_mgr {
 	 */
 	bool payload_id_table_cleared : 1;
 
+	/**
+	 * @is_waiting_for_dwn_reply: whether we're waiting for a down reply.
+	 */
+	bool is_waiting_for_dwn_reply : 1;
+
 	/**
 	 * @mst_primary: Pointer to the primary/first branch device.
 	 */
@@ -619,11 +624,6 @@ struct drm_dp_mst_topology_mgr {
 	 */
 	struct mutex qlock;
 
-	/**
-	 * @is_waiting_for_dwn_reply: indicate whether is waiting for down reply
-	 */
-	bool is_waiting_for_dwn_reply;
-
 	/**
 	 * @tx_msg_downq: List of pending down replies.
 	 */
-- 
2.24.1

_______________________________________________
dri-devel mailing list
dri-devel@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/dri-devel
