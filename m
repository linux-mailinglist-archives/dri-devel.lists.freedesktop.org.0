Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 0815A43A6AD
	for <lists+dri-devel@lfdr.de>; Tue, 26 Oct 2021 00:38:47 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 171C76E288;
	Mon, 25 Oct 2021 22:38:42 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from us-smtp-delivery-124.mimecast.com
 (us-smtp-delivery-124.mimecast.com [216.205.24.124])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 964F66E270
 for <dri-devel@lists.freedesktop.org>; Mon, 25 Oct 2021 22:38:40 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1635201519;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=E5v1Na7JVt3wuBUYr9NpLnaa0AfB+WKs9SYn9cUM/6Y=;
 b=huPNgBVV1JwYX7PfydAgcbyKKEcDXYSQo+/cDh8KDUeZqtIXM8BcQRLktqo4a3Fn+4YOdJ
 4/URTZlha7Hzk/0NdMVtQSdJ3BBaCJURE4UTiMRLd7kVtWyErWEzg+KC7BChO1MCbDPwBi
 T3e81dhrCeFaIMzLG2TTBWwewawr4P4=
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-231-lwRaFAw_M6yBDXp0uGa7JQ-1; Mon, 25 Oct 2021 18:38:36 -0400
X-MC-Unique: lwRaFAw_M6yBDXp0uGa7JQ-1
Received: from smtp.corp.redhat.com (int-mx02.intmail.prod.int.phx2.redhat.com
 [10.5.11.12])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx01.redhat.com (Postfix) with ESMTPS id B34E5100C612;
 Mon, 25 Oct 2021 22:38:34 +0000 (UTC)
Received: from emerald.lyude.net (unknown [10.22.9.162])
 by smtp.corp.redhat.com (Postfix) with ESMTP id C266160BF1;
 Mon, 25 Oct 2021 22:38:33 +0000 (UTC)
From: Lyude Paul <lyude@redhat.com>
To: dri-devel@lists.freedesktop.org,
	amd-gfx@lists.freedesktop.org
Cc: Bhawanpreet Lakha <Bhawanpreet.Lakha@amd.com>,
 Maarten Lankhorst <maarten.lankhorst@linux.intel.com>,
 Maxime Ripard <mripard@kernel.org>,
 Thomas Zimmermann <tzimmermann@suse.de>, David Airlie <airlied@linux.ie>,
 Daniel Vetter <daniel@ffwll.ch>, linux-kernel@vger.kernel.org (open list)
Subject: [PATCH RESEND v5 1/4] drm: Remove slot checks in dp mst topology
 during commit
Date: Mon, 25 Oct 2021 18:38:21 -0400
Message-Id: <20211025223825.301703-2-lyude@redhat.com>
In-Reply-To: <20211025223825.301703-1-lyude@redhat.com>
References: <20211025223825.301703-1-lyude@redhat.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
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
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

From: Bhawanpreet Lakha <Bhawanpreet.Lakha@amd.com>

This code path is used during commit, and we dont expect things to fail
during the commit stage, so remove this.

Signed-off-by: Bhawanpreet Lakha <Bhawanpreet.Lakha@amd.com>
Reviewed-by: Lyude Paul <lyude@redhat.com>
Signed-off-by: Lyude Paul <lyude@redhat.com>
---
 drivers/gpu/drm/drm_dp_mst_topology.c | 6 +-----
 1 file changed, 1 insertion(+), 5 deletions(-)

diff --git a/drivers/gpu/drm/drm_dp_mst_topology.c b/drivers/gpu/drm/drm_dp_mst_topology.c
index 86d13d6bc463..04ed34a7f71c 100644
--- a/drivers/gpu/drm/drm_dp_mst_topology.c
+++ b/drivers/gpu/drm/drm_dp_mst_topology.c
@@ -4334,10 +4334,6 @@ static int drm_dp_init_vcpi(struct drm_dp_mst_topology_mgr *mgr,
 {
 	int ret;
 
-	/* max. time slots - one slot for MTP header */
-	if (slots > 63)
-		return -ENOSPC;
-
 	vcpi->pbn = pbn;
 	vcpi->aligned_pbn = slots * mgr->pbn_div;
 	vcpi->num_slots = slots;
@@ -4540,7 +4536,7 @@ bool drm_dp_mst_allocate_vcpi(struct drm_dp_mst_topology_mgr *mgr,
 
 	ret = drm_dp_init_vcpi(mgr, &port->vcpi, pbn, slots);
 	if (ret) {
-		drm_dbg_kms(mgr->dev, "failed to init vcpi slots=%d max=63 ret=%d\n",
+		drm_dbg_kms(mgr->dev, "failed to init vcpi slots=%d ret=%d\n",
 			    DIV_ROUND_UP(pbn, mgr->pbn_div), ret);
 		drm_dp_mst_topology_put_port(port);
 		goto out;
-- 
2.31.1

