Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 0763419DEF1
	for <lists+dri-devel@lfdr.de>; Fri,  3 Apr 2020 22:03:58 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id D824C6EC7B;
	Fri,  3 Apr 2020 20:03:53 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from us-smtp-1.mimecast.com (us-smtp-delivery-1.mimecast.com
 [207.211.31.120])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 007366EC76
 for <dri-devel@lists.freedesktop.org>; Fri,  3 Apr 2020 20:03:51 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1585944230;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:
 content-transfer-encoding:content-transfer-encoding;
 bh=u8hLZsj2YqQxSgV0Txi9THZdrIA9G0FOv6QX9kTj3Dc=;
 b=Hv7X3zVssncWsPhNK330lP4fUWaqtJz8cPb2yFB1FLqkLFWgEbJilrNmCZ46xqWnjXt2Z3
 HEikZWNIWNPQux5FYH7WrSZM1gnJ5KXF6MOvVidPRtFLAeVTXUKrEvZc8i0oDpi/MM2lds
 i4DdD9VLuFwOAQsx9NOBbWVMl/oU1NY=
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-83-RaBLvtOdN-WS7Iz132o6gQ-1; Fri, 03 Apr 2020 16:03:46 -0400
X-MC-Unique: RaBLvtOdN-WS7Iz132o6gQ-1
Received: from smtp.corp.redhat.com (int-mx03.intmail.prod.int.phx2.redhat.com
 [10.5.11.13])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx01.redhat.com (Postfix) with ESMTPS id 6614E1005516;
 Fri,  3 Apr 2020 20:03:44 +0000 (UTC)
Received: from Ruby.redhat.com (ovpn-117-203.rdu2.redhat.com [10.10.117.203])
 by smtp.corp.redhat.com (Postfix) with ESMTP id CFE7C96F83;
 Fri,  3 Apr 2020 20:03:41 +0000 (UTC)
From: Lyude Paul <lyude@redhat.com>
To: dri-devel@lists.freedesktop.org
Subject: [PATCH] drm/dp_mst: Don't drop NAKs for down responses
Date: Fri,  3 Apr 2020 16:03:25 -0400
Message-Id: <20200403200325.885628-1-lyude@redhat.com>
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
Cc: David Airlie <airlied@linux.ie>, linux-kernel@vger.kernel.org,
 Sean Paul <seanpaul@chromium.org>, Thomas Zimmermann <tzimmermann@suse.de>,
 Wayne Lin <Wayne.Lin@amd.com>, Wayne Lin <waynelin@amd.com>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

It looks like that when we introduced the ability to handle multiple
down requests at once, we accidentally started dropping NAK replies -
causing sideband messages which got NAK'd to seemingly timeout and cause
all sorts of weirdness.

So, fix this by making sure we don't return from
drm_dp_mst_handle_down_rep() early, but instead treat NAKs like any
other message.

Signed-off-by: Lyude Paul <lyude@redhat.com>
Fixes: fbc821c4a506 ("drm/mst: Support simultaneous down replies")
Cc: Wayne Lin <Wayne.Lin@amd.com>
Cc: Wayne Lin <waynelin@amd.com>
Cc: Sean Paul <seanpaul@chromium.org>
---
 drivers/gpu/drm/drm_dp_mst_topology.c | 1 -
 1 file changed, 1 deletion(-)

diff --git a/drivers/gpu/drm/drm_dp_mst_topology.c b/drivers/gpu/drm/drm_dp_mst_topology.c
index 10d0315af513..5449ada3e019 100644
--- a/drivers/gpu/drm/drm_dp_mst_topology.c
+++ b/drivers/gpu/drm/drm_dp_mst_topology.c
@@ -3813,7 +3813,6 @@ static int drm_dp_mst_handle_down_rep(struct drm_dp_mst_topology_mgr *mgr)
 			      txmsg->reply.u.nak.reason,
 			      drm_dp_mst_nak_reason_str(txmsg->reply.u.nak.reason),
 			      txmsg->reply.u.nak.nak_data);
-		goto out_clear_reply;
 	}
 
 	memset(msg, 0, sizeof(struct drm_dp_sideband_msg_rx));
-- 
2.25.1

_______________________________________________
dri-devel mailing list
dri-devel@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/dri-devel
