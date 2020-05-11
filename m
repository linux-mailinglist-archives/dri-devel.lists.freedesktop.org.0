Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 057041CE85B
	for <lists+dri-devel@lfdr.de>; Tue, 12 May 2020 00:42:53 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 857126E5D1;
	Mon, 11 May 2020 22:42:50 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from us-smtp-1.mimecast.com (us-smtp-delivery-1.mimecast.com
 [205.139.110.120])
 by gabe.freedesktop.org (Postfix) with ESMTPS id A872B6E5CE
 for <dri-devel@lists.freedesktop.org>; Mon, 11 May 2020 22:42:48 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1589236967;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=2CFJqLqwxwm/YiCehI/vMQMvMy9CLDJuBp2YttHeyzg=;
 b=JyoH2lK3CaoICBCTqttX9t8KqvyT5pOV19EUAWbZZhve5Xm8LQSxt8v6IwhtUv0qCaG9U3
 UkQ3ZMw36Vl2xSyxENVdbysrQq/zgG/qjwcP/mtQJiyYaZI5Kzpuc0YP+zO2BMZ5hXXxK8
 InAe0q8v60rXX3TtwJbH/EVR5YlpPDo=
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-378-6w2qJPSPORGvVI8ZmcNusw-1; Mon, 11 May 2020 18:42:41 -0400
X-MC-Unique: 6w2qJPSPORGvVI8ZmcNusw-1
Received: from smtp.corp.redhat.com (int-mx03.intmail.prod.int.phx2.redhat.com
 [10.5.11.13])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx01.redhat.com (Postfix) with ESMTPS id 2AF4E8005AD;
 Mon, 11 May 2020 22:42:40 +0000 (UTC)
Received: from Whitewolf.redhat.com (ovpn-117-238.rdu2.redhat.com
 [10.10.117.238])
 by smtp.corp.redhat.com (Postfix) with ESMTP id F273977F2E;
 Mon, 11 May 2020 22:42:38 +0000 (UTC)
From: Lyude Paul <lyude@redhat.com>
To: nouveau@lists.freedesktop.org
Subject: [PATCH v3 4/5] drm/nouveau/kms/nv50-: Move 8BPC limit for MST into
 nv50_mstc_get_modes()
Date: Mon, 11 May 2020 18:41:26 -0400
Message-Id: <20200511224148.598468-5-lyude@redhat.com>
In-Reply-To: <20200511224148.598468-1-lyude@redhat.com>
References: <20200511224148.598468-1-lyude@redhat.com>
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
Cc: David Airlie <airlied@linux.ie>,
 Pankaj Bharadiya <pankaj.laxminarayan.bharadiya@intel.com>,
 linux-kernel@vger.kernel.org, dri-devel@lists.freedesktop.org,
 Sean Paul <seanpaul@chromium.org>, Ben Skeggs <bskeggs@redhat.com>,
 Alex Deucher <alexander.deucher@amd.com>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

This just limits the BPC for MST connectors to a maximum of 8 from
nv50_mstc_get_modes(), instead of doing so during
nv50_msto_atomic_check(). This doesn't introduce any functional changes
yet (other then userspace now lying about the max bpc, but we can't
support that yet anyway so meh). But, we'll need this in a moment so
that we can share mode validation between SST and MST which will fix
some real world issues.

Signed-off-by: Lyude Paul <lyude@redhat.com>
---
 drivers/gpu/drm/nouveau/dispnv50/disp.c | 25 ++++++++++++++-----------
 1 file changed, 14 insertions(+), 11 deletions(-)

diff --git a/drivers/gpu/drm/nouveau/dispnv50/disp.c b/drivers/gpu/drm/nouveau/dispnv50/disp.c
index f67dffe8c005..c49a6c47c66f 100644
--- a/drivers/gpu/drm/nouveau/dispnv50/disp.c
+++ b/drivers/gpu/drm/nouveau/dispnv50/disp.c
@@ -904,15 +904,9 @@ nv50_msto_atomic_check(struct drm_encoder *encoder,
 	if (!state->duplicated) {
 		const int clock = crtc_state->adjusted_mode.clock;
 
-		/*
-		 * XXX: Since we don't use HDR in userspace quite yet, limit
-		 * the bpc to 8 to save bandwidth on the topology. In the
-		 * future, we'll want to properly fix this by dynamically
-		 * selecting the highest possible bpc that would fit in the
-		 * topology
-		 */
-		asyh->or.bpc = min(connector->display_info.bpc, 8U);
-		asyh->dp.pbn = drm_dp_calc_pbn_mode(clock, asyh->or.bpc * 3, false);
+		asyh->or.bpc = connector->display_info.bpc;
+		asyh->dp.pbn = drm_dp_calc_pbn_mode(clock, asyh->or.bpc * 3,
+						    false);
 	}
 
 	slots = drm_dp_atomic_find_vcpi_slots(state, &mstm->mgr, mstc->port,
@@ -1072,8 +1066,17 @@ nv50_mstc_get_modes(struct drm_connector *connector)
 	if (mstc->edid)
 		ret = drm_add_edid_modes(&mstc->connector, mstc->edid);
 
-	if (!mstc->connector.display_info.bpc)
-		mstc->connector.display_info.bpc = 8;
+	/*
+	 * XXX: Since we don't use HDR in userspace quite yet, limit the bpc
+	 * to 8 to save bandwidth on the topology. In the future, we'll want
+	 * to properly fix this by dynamically selecting the highest possible
+	 * bpc that would fit in the topology
+	 */
+	if (connector->display_info.bpc)
+		connector->display_info.bpc =
+			clamp(connector->display_info.bpc, 6U, 8U);
+	else
+		connector->display_info.bpc = 8;
 
 	if (mstc->native)
 		drm_mode_destroy(mstc->connector.dev, mstc->native);
-- 
2.26.2

_______________________________________________
dri-devel mailing list
dri-devel@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/dri-devel
