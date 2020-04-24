Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 5378C1B7E91
	for <lists+dri-devel@lfdr.de>; Fri, 24 Apr 2020 21:07:40 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 9B7FF6E0C5;
	Fri, 24 Apr 2020 19:07:37 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from us-smtp-delivery-1.mimecast.com (us-smtp-1.mimecast.com
 [207.211.31.81])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 7D8436E0C5
 for <dri-devel@lists.freedesktop.org>; Fri, 24 Apr 2020 19:07:36 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1587755254;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:
 content-transfer-encoding:content-transfer-encoding;
 bh=2jnvEsORNgR7b9vWe7xevtJyvEa+IeRDZ+hvY7I0CUI=;
 b=gXjbajg8xa69l9wooLFWutYsq+lxWzi5kHqL9/iXaHV/HdR/NJtAA9Z/N+5BXSsIu27d1l
 ekik7Zwn749hq1Ylcvs9yUeoCmU6sarjNGi9LBiUq9YZU6DkxeCPrj1QtCBI6R/ZbXdggl
 v0ls8qDpEkuJ9xe/Lm3SMtlYMAZP1A0=
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-419-RATWQOPrMG61uMefhhjxoA-1; Fri, 24 Apr 2020 15:07:30 -0400
X-MC-Unique: RATWQOPrMG61uMefhhjxoA-1
Received: from smtp.corp.redhat.com (int-mx02.intmail.prod.int.phx2.redhat.com
 [10.5.11.12])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx01.redhat.com (Postfix) with ESMTPS id 9A487800C78;
 Fri, 24 Apr 2020 19:07:28 +0000 (UTC)
Received: from Ruby.redhat.com (ovpn-115-210.rdu2.redhat.com [10.10.115.210])
 by smtp.corp.redhat.com (Postfix) with ESMTP id A7A8460F8D;
 Fri, 24 Apr 2020 19:07:26 +0000 (UTC)
From: Lyude Paul <lyude@redhat.com>
To: dri-devel@lists.freedesktop.org
Subject: [PATCH] drm/dp_mst: Fix drm_dp_send_dpcd_write() return code
Date: Fri, 24 Apr 2020 15:07:22 -0400
Message-Id: <20200424190722.775284-1-lyude@redhat.com>
MIME-Version: 1.0
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.12
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
Cc: Benjamin Gaignard <benjamin.gaignard@st.com>,
 David Airlie <airlied@linux.ie>, linux-kernel@vger.kernel.org,
 Thomas Zimmermann <tzimmermann@suse.de>, Sean Paul <sean@poorly.run>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

drm_dp_mst_wait_tx_reply() returns > 1 if time elapsed in
wait_event_timeout() before check_txmsg_state(mgr, txmsg) evaluated to
true. However, we make the mistake of returning this time from
drm_dp_send_dpcd_write() on success instead of returning the number of
bytes written - causing spontaneous failures during link probing:

[drm:drm_dp_send_link_address [drm_kms_helper]] *ERROR* GUID check on
10:01 failed: 3975

Yikes! So, fix this by returning the number of bytes written on success
instead.

Signed-off-by: Lyude Paul <lyude@redhat.com>
Fixes: cb897542c6d2 ("drm/dp_mst: Fix W=1 warnings")
Cc: Benjamin Gaignard <benjamin.gaignard@st.com>
Cc: Sean Paul <sean@poorly.run>
---
 drivers/gpu/drm/drm_dp_mst_topology.c | 8 ++++++--
 1 file changed, 6 insertions(+), 2 deletions(-)

diff --git a/drivers/gpu/drm/drm_dp_mst_topology.c b/drivers/gpu/drm/drm_dp_mst_topology.c
index 03a1496f6120..21dc78cb4ba6 100644
--- a/drivers/gpu/drm/drm_dp_mst_topology.c
+++ b/drivers/gpu/drm/drm_dp_mst_topology.c
@@ -3436,8 +3436,12 @@ static int drm_dp_send_dpcd_write(struct drm_dp_mst_topology_mgr *mgr,
 	drm_dp_queue_down_tx(mgr, txmsg);
 
 	ret = drm_dp_mst_wait_tx_reply(mstb, txmsg);
-	if (ret > 0 && txmsg->reply.reply_type == DP_SIDEBAND_REPLY_NAK)
-		ret = -EIO;
+	if (ret > 0) {
+		if (txmsg->reply.reply_type == DP_SIDEBAND_REPLY_NAK)
+			ret = -EIO;
+		else
+			ret = size;
+	}
 
 	kfree(txmsg);
 fail_put:
-- 
2.25.3

_______________________________________________
dri-devel mailing list
dri-devel@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/dri-devel
