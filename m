Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 292AD17C909
	for <lists+dri-devel@lfdr.de>; Sat,  7 Mar 2020 00:49:45 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id D5C976EDA6;
	Fri,  6 Mar 2020 23:49:36 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from us-smtp-delivery-1.mimecast.com (us-smtp-2.mimecast.com
 [207.211.31.81])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 6C9276EDA6
 for <dri-devel@lists.freedesktop.org>; Fri,  6 Mar 2020 23:49:34 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1583538573;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=epJiNHcNlXrU/mKy0Mc+3UqF6n++TRVvv4Ahu8/c3RY=;
 b=hy9Q0WPSeBX3gTkzGla46DQD8BGruCN1P1jgvvITNU9OOrdJ9uMztJ3b9/81/CU10uY+BV
 hUzpd8j5Gd3lLmh/QxrvJG7ZYIAEAiuJwuHqKhcpD3px42EToFkzukF/jhq8fP8JWK84Jj
 ajZw7watwJlXzCunZ90FSymhQ0Qx/vg=
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-431-yc73RDNVM--k6bO1k8rr2A-1; Fri, 06 Mar 2020 18:49:29 -0500
X-MC-Unique: yc73RDNVM--k6bO1k8rr2A-1
Received: from smtp.corp.redhat.com (int-mx03.intmail.prod.int.phx2.redhat.com
 [10.5.11.13])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx01.redhat.com (Postfix) with ESMTPS id D92D48010E8;
 Fri,  6 Mar 2020 23:49:27 +0000 (UTC)
Received: from Ruby.bss.redhat.com (dhcp-10-20-1-196.bss.redhat.com
 [10.20.1.196])
 by smtp.corp.redhat.com (Postfix) with ESMTP id 9E96491D7A;
 Fri,  6 Mar 2020 23:49:26 +0000 (UTC)
From: Lyude Paul <lyude@redhat.com>
To: dri-devel@lists.freedesktop.org
Subject: [PATCH 1/2] drm/dp_mst: Make drm_dp_mst_dpcd_write() consistent with
 drm_dp_dpcd_write()
Date: Fri,  6 Mar 2020 18:49:21 -0500
Message-Id: <20200306234923.547873-2-lyude@redhat.com>
In-Reply-To: <20200306234923.547873-1-lyude@redhat.com>
References: <20200306234923.547873-1-lyude@redhat.com>
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
Cc: David Airlie <airlied@linux.ie>, David Francis <David.Francis@amd.com>,
 linux-kernel@vger.kernel.org, Hans de Goede <hdegoede@redhat.com>,
 Thomas Zimmermann <tzimmermann@suse.de>,
 Alex Deucher <alexander.deucher@amd.com>,
 Mikita Lipski <mikita.lipski@amd.com>, Sean Paul <sean@poorly.run>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

Noticed this while having some problems with hubs sometimes not being
detected on the first plug. Every single dpcd read or write function
returns the number of bytes transferred on success or a negative error
code, except apparently for drm_dp_mst_dpcd_write() - which returns 0 on
success.

There's not really any good reason for this difference that I can tell,
and having the two functions give differing behavior means that
drm_dp_dpcd_write() will end up returning 0 on success for MST devices,
but the number of bytes transferred for everything else.

So, fix that and update the kernel doc.

Signed-off-by: Lyude Paul <lyude@redhat.com>
Fixes: 2f221a5efed4 ("drm/dp_mst: Add MST support to DP DPCD R/W functions")
Cc: Hans de Goede <hdegoede@redhat.com>
Cc: Mikita Lipski <mikita.lipski@amd.com>
Cc: Sean Paul <sean@poorly.run>
---
 drivers/gpu/drm/drm_dp_mst_topology.c | 11 ++++-------
 1 file changed, 4 insertions(+), 7 deletions(-)

diff --git a/drivers/gpu/drm/drm_dp_mst_topology.c b/drivers/gpu/drm/drm_dp_mst_topology.c
index 6c62ad8f4414..e421c2d13267 100644
--- a/drivers/gpu/drm/drm_dp_mst_topology.c
+++ b/drivers/gpu/drm/drm_dp_mst_topology.c
@@ -2063,7 +2063,7 @@ ssize_t drm_dp_mst_dpcd_read(struct drm_dp_aux *aux,
  * sideband messaging as drm_dp_dpcd_write() does for local
  * devices via actual AUX CH.
  *
- * Return: 0 on success, negative error code on failure.
+ * Return: number of bytes written on success, negative error code on failure.
  */
 ssize_t drm_dp_mst_dpcd_write(struct drm_dp_aux *aux,
 			      unsigned int offset, void *buffer, size_t size)
@@ -3428,12 +3428,9 @@ static int drm_dp_send_dpcd_write(struct drm_dp_mst_topology_mgr *mgr,
 	drm_dp_queue_down_tx(mgr, txmsg);
 
 	ret = drm_dp_mst_wait_tx_reply(mstb, txmsg);
-	if (ret > 0) {
-		if (txmsg->reply.reply_type == DP_SIDEBAND_REPLY_NAK)
-			ret = -EIO;
-		else
-			ret = 0;
-	}
+	if (ret > 0 && txmsg->reply.reply_type == DP_SIDEBAND_REPLY_NAK)
+		ret = -EIO;
+
 	kfree(txmsg);
 fail_put:
 	drm_dp_mst_topology_put_mstb(mstb);
-- 
2.24.1

_______________________________________________
dri-devel mailing list
dri-devel@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/dri-devel
