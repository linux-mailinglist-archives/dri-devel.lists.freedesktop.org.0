Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 913CB2420D6
	for <lists+dri-devel@lfdr.de>; Tue, 11 Aug 2020 22:06:05 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id BCD366E7F1;
	Tue, 11 Aug 2020 20:05:52 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from us-smtp-delivery-1.mimecast.com (us-smtp-2.mimecast.com
 [207.211.31.81])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 0891D6E802
 for <dri-devel@lists.freedesktop.org>; Tue, 11 Aug 2020 20:05:49 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1597176349;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=JmTNhsPZLdpUnVNZa+gMWlRtbGSg6BTHeH385f0X4wk=;
 b=AfH7vNzotABLltFzp1Xh+6W+du6CayyhuHWExg2gDORGCB71H6RanVyPSXTV6Eo5S/hlEl
 s+a2izxeEbqIW2LWhbHRR6BYvEITI9DYBzZ8dEHPrxCTlhunfCgLKPzioZPuG1uktuwheh
 tSJYkdiG3bzVRU48jPfIk6MtwStPwXQ=
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-325-GqCtYWh2Nm2cOnFKo5p2-A-1; Tue, 11 Aug 2020 16:05:45 -0400
X-MC-Unique: GqCtYWh2Nm2cOnFKo5p2-A-1
Received: from smtp.corp.redhat.com (int-mx04.intmail.prod.int.phx2.redhat.com
 [10.5.11.14])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx01.redhat.com (Postfix) with ESMTPS id C2C748017F4;
 Tue, 11 Aug 2020 20:05:43 +0000 (UTC)
Received: from Ruby.redhat.com (ovpn-119-184.rdu2.redhat.com [10.10.119.184])
 by smtp.corp.redhat.com (Postfix) with ESMTP id CDBD15D9D7;
 Tue, 11 Aug 2020 20:05:42 +0000 (UTC)
From: Lyude Paul <lyude@redhat.com>
To: nouveau@lists.freedesktop.org, intel-gfx@lists.freedesktop.org,
 dri-devel@lists.freedesktop.org
Subject: [RFC 04/20] drm/nouveau/kms/nv50-: Use macros for DP registers in
 nouveau_dp.c
Date: Tue, 11 Aug 2020 16:04:41 -0400
Message-Id: <20200811200457.134743-5-lyude@redhat.com>
In-Reply-To: <20200811200457.134743-1-lyude@redhat.com>
References: <20200811200457.134743-1-lyude@redhat.com>
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

No functional changes.

Signed-off-by: Lyude Paul <lyude@redhat.com>
Reviewed-by: Ben Skeggs <bskeggs@redhat.com>
---
 drivers/gpu/drm/nouveau/nouveau_dp.c | 8 +++++---
 1 file changed, 5 insertions(+), 3 deletions(-)

diff --git a/drivers/gpu/drm/nouveau/nouveau_dp.c b/drivers/gpu/drm/nouveau/nouveau_dp.c
index 8db9216d52c69..4030806e3522b 100644
--- a/drivers/gpu/drm/nouveau/nouveau_dp.c
+++ b/drivers/gpu/drm/nouveau/nouveau_dp.c
@@ -50,11 +50,13 @@ nouveau_dp_detect(struct nouveau_connector *nv_connector,
 	if (ret != sizeof(dpcd))
 		return ret;
 
-	nv_encoder->dp.link_bw = 27000 * dpcd[1];
-	nv_encoder->dp.link_nr = dpcd[2] & DP_MAX_LANE_COUNT_MASK;
+	nv_encoder->dp.link_bw = 27000 * dpcd[DP_MAX_LINK_RATE];
+	nv_encoder->dp.link_nr =
+		dpcd[DP_MAX_LANE_COUNT] & DP_MAX_LANE_COUNT_MASK;
 
 	NV_DEBUG(drm, "display: %dx%d dpcd 0x%02x\n",
-		 nv_encoder->dp.link_nr, nv_encoder->dp.link_bw, dpcd[0]);
+		 nv_encoder->dp.link_nr, nv_encoder->dp.link_bw,
+		 dpcd[DP_DPCD_REV]);
 	NV_DEBUG(drm, "encoder: %dx%d\n",
 		 nv_encoder->dcb->dpconf.link_nr,
 		 nv_encoder->dcb->dpconf.link_bw);
-- 
2.26.2

_______________________________________________
dri-devel mailing list
dri-devel@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/dri-devel
