Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 5A59434B0A1
	for <lists+dri-devel@lfdr.de>; Fri, 26 Mar 2021 21:40:26 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 8C04E6F4CA;
	Fri, 26 Mar 2021 20:40:20 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from us-smtp-delivery-124.mimecast.com
 (us-smtp-delivery-124.mimecast.com [170.10.133.124])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 139376F4D0
 for <dri-devel@lists.freedesktop.org>; Fri, 26 Mar 2021 20:40:16 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1616791216;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=HZw8++24B7zDhpssFCjAM4DVt+/nSr9Onctlnz9S1EI=;
 b=Dt3cXW10WzvL7MBdLLpOYb4s5D8/SaPLR6ojIYrTX9FNoKe1DiC5tC1KariMtxAfnR9/6j
 KjEtvFw1DvIcG46QJ67qoTFT9wFp/hApJIdr1WWhD5dOUS+5AW/hf/0ezr3SqnXQZCAB/U
 MtZmaPKUyk0WcmK7tw5w+UMAtJH6GNk=
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-290-NfKr5OOVPV6H7ThAZngMZg-1; Fri, 26 Mar 2021 16:40:11 -0400
X-MC-Unique: NfKr5OOVPV6H7ThAZngMZg-1
Received: from smtp.corp.redhat.com (int-mx04.intmail.prod.int.phx2.redhat.com
 [10.5.11.14])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx01.redhat.com (Postfix) with ESMTPS id 75A5A801FD8;
 Fri, 26 Mar 2021 20:40:10 +0000 (UTC)
Received: from Whitewolf.lyude.net (ovpn-114-133.rdu2.redhat.com
 [10.10.114.133])
 by smtp.corp.redhat.com (Postfix) with ESMTP id 2795F5DAA5;
 Fri, 26 Mar 2021 20:40:09 +0000 (UTC)
From: Lyude Paul <lyude@redhat.com>
To: nouveau@lists.freedesktop.org, dri-devel@lists.freedesktop.org,
 amd-gfx@lists.freedesktop.org, intel-gfx@lists.freedesktop.org
Subject: [PATCH v2 19/20] drm/dp_mst: Drop DRM_ERROR() on kzalloc() fail in
 drm_dp_mst_handle_up_req()
Date: Fri, 26 Mar 2021 16:38:06 -0400
Message-Id: <20210326203807.105754-20-lyude@redhat.com>
In-Reply-To: <20210326203807.105754-1-lyude@redhat.com>
References: <20210326203807.105754-1-lyude@redhat.com>
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
Cc: David Airlie <airlied@linux.ie>, open list <linux-kernel@vger.kernel.org>,
 Robert Foss <robert.foss@linaro.org>, Thomas Zimmermann <tzimmermann@suse.de>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

Checkpatch was complaining about this - there's no need for us to print
errors when kzalloc() fails, as kzalloc() will already WARN for us. So,
let's fix that before converting things to make checkpatch happy.

Signed-off-by: Lyude Paul <lyude@redhat.com>
Cc: Robert Foss <robert.foss@linaro.org>
---
 drivers/gpu/drm/drm_dp_mst_topology.c | 5 ++---
 1 file changed, 2 insertions(+), 3 deletions(-)

diff --git a/drivers/gpu/drm/drm_dp_mst_topology.c b/drivers/gpu/drm/drm_dp_mst_topology.c
index ec2285595c33..74c420f5f204 100644
--- a/drivers/gpu/drm/drm_dp_mst_topology.c
+++ b/drivers/gpu/drm/drm_dp_mst_topology.c
@@ -4113,10 +4113,9 @@ static int drm_dp_mst_handle_up_req(struct drm_dp_mst_topology_mgr *mgr)
 		return 0;
 
 	up_req = kzalloc(sizeof(*up_req), GFP_KERNEL);
-	if (!up_req) {
-		DRM_ERROR("Not enough memory to process MST up req\n");
+	if (!up_req)
 		return -ENOMEM;
-	}
+
 	INIT_LIST_HEAD(&up_req->next);
 
 	drm_dp_sideband_parse_req(&mgr->up_req_recv, &up_req->msg);
-- 
2.30.2

_______________________________________________
dri-devel mailing list
dri-devel@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/dri-devel
