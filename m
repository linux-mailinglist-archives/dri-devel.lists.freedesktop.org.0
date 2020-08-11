Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 103ED24210C
	for <lists+dri-devel@lfdr.de>; Tue, 11 Aug 2020 22:07:07 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 643AD6E83E;
	Tue, 11 Aug 2020 20:07:03 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from us-smtp-1.mimecast.com (us-smtp-delivery-1.mimecast.com
 [207.211.31.120])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 3B4626E83A
 for <dri-devel@lists.freedesktop.org>; Tue, 11 Aug 2020 20:07:02 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1597176421;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=0PGG//CtuoOTYv2p77D8V5k7E6MAMYxPO8Vv8577Zp8=;
 b=bFvbcCMguCjvU111njve4CvT0OxiEz38KcIOnviM4Cy1Rc67fycIM/sNuAqgCKPkg2eT0z
 iail5LYKthbWIeOFnPbEEHpBqLdePuSqLjhqusF/HWQCRNN5RZ3sb86ySjWza1AMSiN53P
 iYlWIP6XugPyJrWurMWpQBxACfF1ZWU=
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-255-VKygY5HSMxeH3V02zJJllw-1; Tue, 11 Aug 2020 16:06:58 -0400
X-MC-Unique: VKygY5HSMxeH3V02zJJllw-1
Received: from smtp.corp.redhat.com (int-mx04.intmail.prod.int.phx2.redhat.com
 [10.5.11.14])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx01.redhat.com (Postfix) with ESMTPS id 383BA1DE1;
 Tue, 11 Aug 2020 20:06:57 +0000 (UTC)
Received: from Ruby.redhat.com (ovpn-119-184.rdu2.redhat.com [10.10.119.184])
 by smtp.corp.redhat.com (Postfix) with ESMTP id 44FEA5D9D7;
 Tue, 11 Aug 2020 20:06:56 +0000 (UTC)
From: Lyude Paul <lyude@redhat.com>
To: nouveau@lists.freedesktop.org, intel-gfx@lists.freedesktop.org,
 dri-devel@lists.freedesktop.org
Subject: [RFC 20/20] drm/nouveau/kms: Start using drm_dp_read_dpcd_caps()
Date: Tue, 11 Aug 2020 16:04:57 -0400
Message-Id: <20200811200457.134743-21-lyude@redhat.com>
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

Now that we've extracted i915's code for reading both the normal DPCD
caps and extended DPCD caps into a shared helper, let's start using this
in nouveau to enable us to start checking extended DPCD caps for free.

Signed-off-by: Lyude Paul <lyude@redhat.com>
---
 drivers/gpu/drm/nouveau/nouveau_dp.c | 14 ++++++--------
 1 file changed, 6 insertions(+), 8 deletions(-)

diff --git a/drivers/gpu/drm/nouveau/nouveau_dp.c b/drivers/gpu/drm/nouveau/nouveau_dp.c
index f41fa513023fd..a4e07d116972f 100644
--- a/drivers/gpu/drm/nouveau/nouveau_dp.c
+++ b/drivers/gpu/drm/nouveau/nouveau_dp.c
@@ -55,15 +55,13 @@ nouveau_dp_probe_dpcd(struct nouveau_connector *nv_connector,
 	int ret;
 	u8 *dpcd = outp->dp.dpcd;
 
-	ret = drm_dp_dpcd_read(aux, DP_DPCD_REV, dpcd, DP_RECEIVER_CAP_SIZE);
-	if (ret == DP_RECEIVER_CAP_SIZE && dpcd[DP_DPCD_REV]) {
-		ret = drm_dp_read_desc(aux, &outp->dp.desc,
-				       drm_dp_is_branch(dpcd));
-		if (ret < 0)
-			goto out;
-	} else {
+	ret = drm_dp_read_dpcd_caps(aux, dpcd);
+	if (ret < 0)
+		goto out;
+
+	ret = drm_dp_read_desc(aux, &outp->dp.desc, drm_dp_is_branch(dpcd));
+	if (ret < 0)
 		goto out;
-	}
 
 	if (nouveau_mst) {
 		mstm = outp->dp.mstm;
-- 
2.26.2

_______________________________________________
dri-devel mailing list
dri-devel@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/dri-devel
