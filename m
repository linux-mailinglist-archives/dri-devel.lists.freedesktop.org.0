Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id A0F0C1A00B0
	for <lists+dri-devel@lfdr.de>; Tue,  7 Apr 2020 00:13:20 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 2092A6E4DE;
	Mon,  6 Apr 2020 22:13:17 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from us-smtp-delivery-1.mimecast.com (us-smtp-2.mimecast.com
 [207.211.31.81])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 0A1816E4E6
 for <dri-devel@lists.freedesktop.org>; Mon,  6 Apr 2020 22:13:15 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1586211195;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=D7FAESrU1cyyiP4ssSlJ0zFYn42hCfuVnZNataCYmDk=;
 b=QVw75Y1SnFjtWey/EHJr7/kYCf2gfsH2PjffWKc4VemhQtvEv7gpa3OQeHMNFd4q1LR8ad
 /l60qFgN3yR3SkkXiGlyeLmJmKbAgUEcfINSFS84xvuYrNCWiRJZyIxtaEnTEQd98MOyOW
 Mgxks7q59sva16sdCo/hZT6dHHNCrQU=
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-365-jJmSxJ7mMIaTv0zYg4PmEQ-1; Mon, 06 Apr 2020 18:13:11 -0400
X-MC-Unique: jJmSxJ7mMIaTv0zYg4PmEQ-1
Received: from smtp.corp.redhat.com (int-mx03.intmail.prod.int.phx2.redhat.com
 [10.5.11.13])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx01.redhat.com (Postfix) with ESMTPS id 874AF801A0D;
 Mon,  6 Apr 2020 22:13:09 +0000 (UTC)
Received: from Ruby.redhat.com (ovpn-117-12.rdu2.redhat.com [10.10.117.12])
 by smtp.corp.redhat.com (Postfix) with ESMTP id 8BEA4608E1;
 Mon,  6 Apr 2020 22:13:08 +0000 (UTC)
From: Lyude Paul <lyude@redhat.com>
To: dri-devel@lists.freedesktop.org
Subject: [PATCH v2 4/4] drm/dp_mst: Print errors on ACT timeouts
Date: Mon,  6 Apr 2020 18:12:53 -0400
Message-Id: <20200406221253.1307209-5-lyude@redhat.com>
In-Reply-To: <20200406221253.1307209-1-lyude@redhat.com>
References: <20200406221253.1307209-1-lyude@redhat.com>
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
 linux-kernel@vger.kernel.org, Sean Paul <sean@poorly.run>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

Although it's not unexpected for drm_dp_check_act_status() to fail due
to DPCD read failures (as the hub may have just been unplugged
suddenly), timeouts are a bit more worrying as they either mean we need
a longer timeout value, or we aren't setting up payload allocations
properly. So, let's start printing errors on timeouts.

Signed-off-by: Lyude Paul <lyude@redhat.com>
Cc: Sean Paul <sean@poorly.run>
---
 drivers/gpu/drm/drm_dp_mst_topology.c | 8 ++++++--
 1 file changed, 6 insertions(+), 2 deletions(-)

diff --git a/drivers/gpu/drm/drm_dp_mst_topology.c b/drivers/gpu/drm/drm_dp_mst_topology.c
index ce61964baa7c..0cbeb0f5c834 100644
--- a/drivers/gpu/drm/drm_dp_mst_topology.c
+++ b/drivers/gpu/drm/drm_dp_mst_topology.c
@@ -4499,10 +4499,14 @@ int drm_dp_check_act_status(struct drm_dp_mst_topology_mgr *mgr)
 				 status & DP_PAYLOAD_ACT_HANDLED || status < 0,
 				 100, timeout_ms * USEC_PER_MSEC);
 	if (ret < 0 && status >= 0) {
-		DRM_DEBUG_KMS("Failed to get ACT bit %d after %dms\n",
-			      status, timeout_ms);
+		DRM_ERROR("Failed to get ACT after %dms, last status: %02x\n",
+			  timeout_ms, status);
 		return -EINVAL;
 	} else if (status < 0) {
+		/*
+		 * Failure here isn't unexpected - the hub may have
+		 * just been unplugged
+		 */
 		DRM_DEBUG_KMS("Failed to read payload table status: %d\n",
 			      status);
 		return status;
-- 
2.25.1

_______________________________________________
dri-devel mailing list
dri-devel@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/dri-devel
