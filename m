Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id F122924C575
	for <lists+dri-devel@lfdr.de>; Thu, 20 Aug 2020 20:31:13 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id AC89D6E9E2;
	Thu, 20 Aug 2020 18:31:09 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from us-smtp-1.mimecast.com (us-smtp-delivery-1.mimecast.com
 [207.211.31.120])
 by gabe.freedesktop.org (Postfix) with ESMTPS id A08C36E9EC
 for <dri-devel@lists.freedesktop.org>; Thu, 20 Aug 2020 18:31:03 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1597948262;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=9gTAM7TDlgZMdWHt2r6XU0KzwhLUE1MvpqOoSpb17cM=;
 b=OzowgkRQ276KKmuJkaVzFv3jbRoLJ9Hi9HWmWnO1sGZFBHI6PSTi3KoPzOWEplFDbJawSg
 mV+7g5xXm8z0spgWpSxVUaYsq2Zx49eF2sBhilDV/l9AJHUeJLHRCjRj9D7BPdOPEGOTCB
 RkAsbWWi9rGbxCprV6A3gda3UTrFJkQ=
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-235-Zq5vuNvlMlyhYgZvgwfddQ-1; Thu, 20 Aug 2020 14:30:57 -0400
X-MC-Unique: Zq5vuNvlMlyhYgZvgwfddQ-1
Received: from smtp.corp.redhat.com (int-mx04.intmail.prod.int.phx2.redhat.com
 [10.5.11.14])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx01.redhat.com (Postfix) with ESMTPS id 4241B801AE8;
 Thu, 20 Aug 2020 18:30:56 +0000 (UTC)
Received: from Whitewolf.redhat.com (ovpn-120-42.rdu2.redhat.com
 [10.10.120.42])
 by smtp.corp.redhat.com (Postfix) with ESMTP id 85B4E5DA78;
 Thu, 20 Aug 2020 18:30:55 +0000 (UTC)
From: Lyude Paul <lyude@redhat.com>
To: dri-devel@lists.freedesktop.org, intel-gfx@lists.freedesktop.org,
 nouveau@lists.freedesktop.org
Subject: [RFC v2 10/20] drm/nouveau/kms: Use new drm_dp_has_mst() helper for
 checking MST caps
Date: Thu, 20 Aug 2020 14:30:02 -0400
Message-Id: <20200820183012.288794-11-lyude@redhat.com>
In-Reply-To: <20200820183012.288794-1-lyude@redhat.com>
References: <20200820183012.288794-1-lyude@redhat.com>
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
Cc: David Airlie <airlied@linux.ie>, Ben Skeggs <bskeggs@redhat.com>,
 open list <linux-kernel@vger.kernel.org>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

Signed-off-by: Lyude Paul <lyude@redhat.com>
Reviewed-by: Ben Skeggs <bskeggs@redhat.com>
---
 drivers/gpu/drm/nouveau/nouveau_dp.c | 16 +++-------------
 1 file changed, 3 insertions(+), 13 deletions(-)

diff --git a/drivers/gpu/drm/nouveau/nouveau_dp.c b/drivers/gpu/drm/nouveau/nouveau_dp.c
index 032afc73e2a33..201c0b4335563 100644
--- a/drivers/gpu/drm/nouveau/nouveau_dp.c
+++ b/drivers/gpu/drm/nouveau/nouveau_dp.c
@@ -44,7 +44,6 @@ nouveau_dp_probe_dpcd(struct nouveau_connector *nv_connector,
 	struct nv50_mstm *mstm = NULL;
 	int ret;
 	u8 *dpcd = outp->dp.dpcd;
-	u8 tmp;
 
 	ret = drm_dp_dpcd_read(aux, DP_DPCD_REV, dpcd, DP_RECEIVER_CAP_SIZE);
 	if (ret == DP_RECEIVER_CAP_SIZE && dpcd[DP_DPCD_REV]) {
@@ -56,19 +55,10 @@ nouveau_dp_probe_dpcd(struct nouveau_connector *nv_connector,
 		return connector_status_disconnected;
 	}
 
-	if (nouveau_mst)
+	if (nouveau_mst) {
 		mstm = outp->dp.mstm;
-
-	if (mstm) {
-		if (dpcd[DP_DPCD_REV] >= DP_DPCD_REV_12) {
-			ret = drm_dp_dpcd_readb(aux, DP_MSTM_CAP, &tmp);
-			if (ret < 0)
-				return connector_status_disconnected;
-
-			mstm->can_mst = !!(tmp & DP_MST_CAP);
-		} else {
-			mstm->can_mst = false;
-		}
+		if (mstm)
+			mstm->can_mst = drm_dp_has_mst(aux, dpcd);
 	}
 
 	return connector_status_connected;
-- 
2.26.2

_______________________________________________
dri-devel mailing list
dri-devel@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/dri-devel
