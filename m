Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id C2BD553BF85
	for <lists+dri-devel@lfdr.de>; Thu,  2 Jun 2022 22:18:24 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 5E120113137;
	Thu,  2 Jun 2022 20:18:22 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from us-smtp-delivery-124.mimecast.com
 (us-smtp-delivery-124.mimecast.com [170.10.133.124])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 1EED5113137
 for <dri-devel@lists.freedesktop.org>; Thu,  2 Jun 2022 20:18:20 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1654201100;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=l4iW0euo2hpUkJUtHiLJMCOQOvdkFw2OylvP6PRtFgU=;
 b=c57/5dJ/ntTaQnECf3YVJI/Kk4zxY7Ceubs8awbgOu2/sNs1X9YV2DUqSINbY/n+krIF6P
 ZiKjxUqaiW1ZOFd01fWJn6KD+myyYvmF7r30evWtBLPNxpKw4xrrRcIuNIv/aRduZqaUfj
 /ZxYWEJaLmrw/Om7yYOkPmaz2keEV0s=
Received: from mimecast-mx02.redhat.com (mimecast-mx02.redhat.com
 [66.187.233.88]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 us-mta-656-nJSe9AyMNWyvtZ7uq8_tKA-1; Thu, 02 Jun 2022 16:18:19 -0400
X-MC-Unique: nJSe9AyMNWyvtZ7uq8_tKA-1
Received: from smtp.corp.redhat.com (int-mx02.intmail.prod.int.rdu2.redhat.com
 [10.11.54.2])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx02.redhat.com (Postfix) with ESMTPS id 2DE02955B00;
 Thu,  2 Jun 2022 20:18:18 +0000 (UTC)
Received: from emerald.redhat.com (unknown [10.22.34.8])
 by smtp.corp.redhat.com (Postfix) with ESMTP id A2E59414A7E7;
 Thu,  2 Jun 2022 20:18:17 +0000 (UTC)
From: Lyude Paul <lyude@redhat.com>
To: dri-devel@lists.freedesktop.org
Subject: [PATCH 2/3] drm/display/dp_mst: Fix
 drm_atomic_get_mst_topology_state()
Date: Thu,  2 Jun 2022 16:17:56 -0400
Message-Id: <20220602201757.30431-3-lyude@redhat.com>
In-Reply-To: <20220602201757.30431-1-lyude@redhat.com>
References: <20220602201757.30431-1-lyude@redhat.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-Scanned-By: MIMEDefang 2.84 on 10.11.54.2
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
 Imran Khan <imran.f.khan@oracle.com>,
 Javier Martinez Canillas <javierm@redhat.com>, stable@vger.kernel.org,
 open list <linux-kernel@vger.kernel.org>, Jani Nikula <jani.nikula@intel.com>,
 Fangzhi Zuo <Jerry.Zuo@amd.com>, Wayne Lin <Wayne.Lin@amd.com>,
 Bhawanpreet Lakha <Bhawanpreet.Lakha@amd.com>
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

I noticed a rather surprising issue here while working on removing all of
the non-atomic MST code: drm_atomic_get_mst_topology_state() doesn't check
the return value of drm_atomic_get_private_obj_state() and instead just
passes it directly to to_dp_mst_topology_state(). This means that if we
hit a deadlock or something else which would return an error code pointer,
we'll likely segfault the kernel.

This is definitely another one of those fixes where I'm astonished we
somehow managed never to discover this issue until now…

Signed-off-by: Lyude Paul <lyude@redhat.com>
Fixes: a4370c777406 ("drm/atomic: Make private objs proper objects")
Cc: Ville Syrjälä <ville.syrjala@linux.intel.com>
Cc: <stable@vger.kernel.org> # v4.14+
---
 drivers/gpu/drm/display/drm_dp_mst_topology.c | 2 +-
 include/drm/display/drm_dp_mst_helper.h       | 2 ++
 2 files changed, 3 insertions(+), 1 deletion(-)

diff --git a/drivers/gpu/drm/display/drm_dp_mst_topology.c b/drivers/gpu/drm/display/drm_dp_mst_topology.c
index d84673b3294b..d6e595b95f07 100644
--- a/drivers/gpu/drm/display/drm_dp_mst_topology.c
+++ b/drivers/gpu/drm/display/drm_dp_mst_topology.c
@@ -5468,7 +5468,7 @@ EXPORT_SYMBOL(drm_dp_mst_topology_state_funcs);
 struct drm_dp_mst_topology_state *drm_atomic_get_mst_topology_state(struct drm_atomic_state *state,
 								    struct drm_dp_mst_topology_mgr *mgr)
 {
-	return to_dp_mst_topology_state(drm_atomic_get_private_obj_state(state, &mgr->base));
+	return to_dp_mst_topology_state_safe(drm_atomic_get_private_obj_state(state, &mgr->base));
 }
 EXPORT_SYMBOL(drm_atomic_get_mst_topology_state);
 
diff --git a/include/drm/display/drm_dp_mst_helper.h b/include/drm/display/drm_dp_mst_helper.h
index 10adec068b7f..fe7577e7f305 100644
--- a/include/drm/display/drm_dp_mst_helper.h
+++ b/include/drm/display/drm_dp_mst_helper.h
@@ -541,6 +541,8 @@ struct drm_dp_payload {
 };
 
 #define to_dp_mst_topology_state(x) container_of(x, struct drm_dp_mst_topology_state, base)
+#define to_dp_mst_topology_state_safe(x) \
+	container_of_safe(x, struct drm_dp_mst_topology_state, base)
 
 struct drm_dp_vcpi_allocation {
 	struct drm_dp_mst_port *port;
-- 
2.35.3

