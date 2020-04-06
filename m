Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id D606519FE1F
	for <lists+dri-devel@lfdr.de>; Mon,  6 Apr 2020 21:34:17 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 941E46E488;
	Mon,  6 Apr 2020 19:34:13 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from us-smtp-delivery-1.mimecast.com (us-smtp-1.mimecast.com
 [205.139.110.61])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 523AE6E488
 for <dri-devel@lists.freedesktop.org>; Mon,  6 Apr 2020 19:34:12 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1586201651;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:
 content-transfer-encoding:content-transfer-encoding;
 bh=BSgez8GiaPB88s5mIg8AyQPW/mDw6g5wVL3NjzNhkP8=;
 b=Rba2JOTu85k/W5dVJ+8uhPstGF9hELCjhiOEU8HyETeChKgsQXYmJuy39jbveipz8+MLyJ
 z8I4gwCZVyg9GSSbnQwgA1sMODvrgK8AsxHvXy5FrRhTwMREQiy5tK8iKRKmviaChvkLEp
 FXOPLruVslXKoCa8i5aVrrAPScu0MVw=
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-468-7sVfS2VFNe6hrJBroCNwkQ-1; Mon, 06 Apr 2020 15:34:07 -0400
X-MC-Unique: 7sVfS2VFNe6hrJBroCNwkQ-1
Received: from smtp.corp.redhat.com (int-mx05.intmail.prod.int.phx2.redhat.com
 [10.5.11.15])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx01.redhat.com (Postfix) with ESMTPS id 12EE0190B2A0;
 Mon,  6 Apr 2020 19:34:02 +0000 (UTC)
Received: from Ruby.redhat.com (ovpn-117-12.rdu2.redhat.com [10.10.117.12])
 by smtp.corp.redhat.com (Postfix) with ESMTP id 6A7E962697;
 Mon,  6 Apr 2020 19:33:59 +0000 (UTC)
From: Lyude Paul <lyude@redhat.com>
To: dri-devel@lists.freedesktop.org
Subject: [PATCH] drm/dp_mst: Fix NULL deref in drm_dp_get_one_sb_msg()
Date: Mon,  6 Apr 2020 15:33:52 -0400
Message-Id: <20200406193352.1245985-1-lyude@redhat.com>
MIME-Version: 1.0
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.15
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

While we don't need this function to store an mstb anywhere for UP
requests since we process them asynchronously, we do need to make sure
that we don't try to write to **mstb for UP requests otherwise we'll
cause a NULL pointer deref:

    RIP: 0010:drm_dp_get_one_sb_msg+0x4b/0x460 [drm_kms_helper]
    Call Trace:
     ? vprintk_emit+0x16a/0x230
     ? drm_dp_mst_hpd_irq+0x133/0x1010 [drm_kms_helper]
     drm_dp_mst_hpd_irq+0x133/0x1010 [drm_kms_helper]
     ? __drm_dbg+0x87/0x90 [drm]
     ? intel_dp_hpd_pulse+0x24b/0x400 [i915]
     intel_dp_hpd_pulse+0x24b/0x400 [i915]
     i915_digport_work_func+0xd6/0x160 [i915]
     process_one_work+0x1a9/0x370
     worker_thread+0x4d/0x3a0
     kthread+0xf9/0x130
     ? process_one_work+0x370/0x370
     ? kthread_park+0x90/0x90
     ret_from_fork+0x35/0x40

So, fix this.

Signed-off-by: Lyude Paul <lyude@redhat.com>
Fixes: fbc821c4a506 ("drm/mst: Support simultaneous down replies")
Cc: Wayne Lin <Wayne.Lin@amd.com>
Cc: Lyude Paul <lyude@redhat.com>
Cc: Wayne Lin <waynelin@amd.com>
Cc: Sean Paul <seanpaul@chromium.org>
---
 drivers/gpu/drm/drm_dp_mst_topology.c | 3 ++-
 1 file changed, 2 insertions(+), 1 deletion(-)

diff --git a/drivers/gpu/drm/drm_dp_mst_topology.c b/drivers/gpu/drm/drm_dp_mst_topology.c
index 1ff49547b2e8..8751278b3941 100644
--- a/drivers/gpu/drm/drm_dp_mst_topology.c
+++ b/drivers/gpu/drm/drm_dp_mst_topology.c
@@ -3703,7 +3703,8 @@ static bool drm_dp_get_one_sb_msg(struct drm_dp_mst_topology_mgr *mgr, bool up,
 	int basereg = up ? DP_SIDEBAND_MSG_UP_REQ_BASE :
 			   DP_SIDEBAND_MSG_DOWN_REP_BASE;
 
-	*mstb = NULL;
+	if (!up)
+		*mstb = NULL;
 	*seqno = -1;
 
 	len = min(mgr->max_dpcd_transaction_bytes, 16);
-- 
2.25.1

_______________________________________________
dri-devel mailing list
dri-devel@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/dri-devel
