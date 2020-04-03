Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id D6E7019DEFF
	for <lists+dri-devel@lfdr.de>; Fri,  3 Apr 2020 22:08:24 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 559806EC73;
	Fri,  3 Apr 2020 20:08:19 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from us-smtp-1.mimecast.com (us-smtp-delivery-1.mimecast.com
 [207.211.31.120])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 667ED6EC73
 for <dri-devel@lists.freedesktop.org>; Fri,  3 Apr 2020 20:08:17 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1585944496;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=kKsSricBHipqeqS0u1MchokqfR4S8U9l6GCrFWtjiM4=;
 b=F2WSo8DKZDYnuAWIbiYKD4HpWrtyUfKiqkZwpGETq7LpeN2FrwMzCv87H5LbQbMOhQJ3g/
 bAi7+1tCkyieV9nUqmdc0HxFV8HX0iAt9UEeSNf1qb096ul/OHILEW/h6B9Ypk0zdrKXQN
 k3kH0Qb45lA1gJPX5/H065xZr0bLvpw=
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-489-vyb4GsmyMQaIUUh3H_ynEA-1; Fri, 03 Apr 2020 16:08:14 -0400
X-MC-Unique: vyb4GsmyMQaIUUh3H_ynEA-1
Received: from smtp.corp.redhat.com (int-mx06.intmail.prod.int.phx2.redhat.com
 [10.5.11.16])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx01.redhat.com (Postfix) with ESMTPS id 1752E8017CE;
 Fri,  3 Apr 2020 20:08:13 +0000 (UTC)
Received: from Ruby.redhat.com (ovpn-117-203.rdu2.redhat.com [10.10.117.203])
 by smtp.corp.redhat.com (Postfix) with ESMTP id 2AC615C541;
 Fri,  3 Apr 2020 20:08:12 +0000 (UTC)
From: Lyude Paul <lyude@redhat.com>
To: dri-devel@lists.freedesktop.org
Subject: [PATCH 4/4] drm/dp_mst: Print errors on ACT timeouts
Date: Fri,  3 Apr 2020 16:07:56 -0400
Message-Id: <20200403200757.886443-5-lyude@redhat.com>
In-Reply-To: <20200403200757.886443-1-lyude@redhat.com>
References: <20200403200757.886443-1-lyude@redhat.com>
MIME-Version: 1.0
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.16
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
index f313407374ed..3d0d373f6f91 100644
--- a/drivers/gpu/drm/drm_dp_mst_topology.c
+++ b/drivers/gpu/drm/drm_dp_mst_topology.c
@@ -4494,6 +4494,10 @@ int drm_dp_check_act_status(struct drm_dp_mst_topology_mgr *mgr)
 					DP_PAYLOAD_TABLE_UPDATE_STATUS,
 					&status);
 		if (ret < 0) {
+			/*
+			 * Failure here isn't unexpected - the hub may have
+			 * just been unplugged
+			 */
 			DRM_DEBUG_KMS("failed to read payload table status %d\n",
 				      ret);
 			return ret;
@@ -4505,8 +4509,8 @@ int drm_dp_check_act_status(struct drm_dp_mst_topology_mgr *mgr)
 	} while (jiffies < timeout);
 
 	if (!(status & DP_PAYLOAD_ACT_HANDLED)) {
-		DRM_DEBUG_KMS("failed to get ACT bit %d after %dms\n",
-			      status, timeout_ms);
+		DRM_ERROR("Failed to get ACT after %dms, last status: %02x\n",
+			  timeout_ms, status);
 		return -EINVAL;
 	}
 	return 0;
-- 
2.25.1

_______________________________________________
dri-devel mailing list
dri-devel@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/dri-devel
