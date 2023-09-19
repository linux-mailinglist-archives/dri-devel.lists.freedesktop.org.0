Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id B42907A6E07
	for <lists+dri-devel@lfdr.de>; Wed, 20 Sep 2023 00:06:07 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 9446A10E3E0;
	Tue, 19 Sep 2023 22:06:04 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from us-smtp-delivery-124.mimecast.com
 (us-smtp-delivery-124.mimecast.com [170.10.133.124])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 1BFB510E3CF
 for <dri-devel@lists.freedesktop.org>; Tue, 19 Sep 2023 22:06:00 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1695161159;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=txBkK1g64IFW2dm4mpw4nbcLbEYBgAGBSdwWC/i0adY=;
 b=iIRzW/tqLxqruDIpagWH9MEd0ICwvvo8KpciNXPz/pHjMZ/i7fmGWgJFxzGeAbpBqV44NQ
 JVbl4C6ucPJi18eGXmQJeH6pkJhGb0YebZsEQbEYMZEU/0MTqU9XU2h9MvoRY4y5VrZfJv
 kPU1xB0c1aqthbr7rCH/ETUianCQxHw=
Received: from mimecast-mx02.redhat.com (mx-ext.redhat.com [66.187.233.73])
 by relay.mimecast.com with ESMTP with STARTTLS (version=TLSv1.2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 us-mta-444-ulE4CPWPO5SikagALureFQ-1; Tue, 19 Sep 2023 18:05:55 -0400
X-MC-Unique: ulE4CPWPO5SikagALureFQ-1
Received: from smtp.corp.redhat.com (int-mx01.intmail.prod.int.rdu2.redhat.com
 [10.11.54.1])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by mimecast-mx02.redhat.com (Postfix) with ESMTPS id A26F23822567;
 Tue, 19 Sep 2023 22:05:54 +0000 (UTC)
Received: from emerald.lyude.net (unknown [10.22.18.67])
 by smtp.corp.redhat.com (Postfix) with ESMTP id 414DE40C2064;
 Tue, 19 Sep 2023 22:05:54 +0000 (UTC)
From: Lyude Paul <lyude@redhat.com>
To: dri-devel@lists.freedesktop.org,
	nouveau@lists.freedesktop.org
Subject: [PATCH v3 17/44] drm/nouveau/kms/nv50-: keep output state around
 until modeset complete
Date: Tue, 19 Sep 2023 17:56:12 -0400
Message-ID: <20230919220442.202488-18-lyude@redhat.com>
In-Reply-To: <20230919220442.202488-1-lyude@redhat.com>
References: <20230919220442.202488-1-lyude@redhat.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Scanned-By: MIMEDefang 3.1 on 10.11.54.1
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
Cc: Karol Herbst <kherbst@redhat.com>, Danilo Krummrich <me@dakr.org>,
 open list <linux-kernel@vger.kernel.org>, Ben Skeggs <bskeggs@redhat.com>,
 Wayne Lin <Wayne.Lin@amd.com>
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

From: Ben Skeggs <bskeggs@redhat.com>

- we'll want this info post-UPDATE for later patches

Signed-off-by: Ben Skeggs <bskeggs@redhat.com>
Reviewed-by: Lyude Paul <lyude@redhat.com>
Acked-by: Danilo Krummrich <me@dakr.org>
Signed-off-by: Lyude Paul <lyude@redhat.com>
---
 drivers/gpu/drm/nouveau/dispnv50/disp.c | 10 ++++++----
 1 file changed, 6 insertions(+), 4 deletions(-)

diff --git a/drivers/gpu/drm/nouveau/dispnv50/disp.c b/drivers/gpu/drm/nouveau/dispnv50/disp.c
index a72cb74184472..8fa3bb8c2f41e 100644
--- a/drivers/gpu/drm/nouveau/dispnv50/disp.c
+++ b/drivers/gpu/drm/nouveau/dispnv50/disp.c
@@ -2080,7 +2080,7 @@ nv50_disp_atomic_commit_tail(struct drm_atomic_state *state)
 	nv50_crc_atomic_init_notifier_contexts(state);
 
 	/* Update output path(s). */
-	list_for_each_entry_safe(outp, outt, &atom->outp, head) {
+	list_for_each_entry(outp, &atom->outp, head) {
 		const struct drm_encoder_helper_funcs *help;
 		struct drm_encoder *encoder;
 
@@ -2094,9 +2094,6 @@ nv50_disp_atomic_commit_tail(struct drm_atomic_state *state)
 			help->atomic_enable(encoder, state);
 			interlock[NV50_DISP_INTERLOCK_CORE] = 1;
 		}
-
-		list_del(&outp->head);
-		kfree(outp);
 	}
 
 	/* Update head(s). */
@@ -2194,6 +2191,11 @@ nv50_disp_atomic_commit_tail(struct drm_atomic_state *state)
 	if (atom->lock_core)
 		mutex_unlock(&disp->mutex);
 
+	list_for_each_entry_safe(outp, outt, &atom->outp, head) {
+		list_del(&outp->head);
+		kfree(outp);
+	}
+
 	/* Wait for HW to signal completion. */
 	for_each_new_plane_in_state(state, plane, new_plane_state, i) {
 		struct nv50_wndw_atom *asyw = nv50_wndw_atom(new_plane_state);
-- 
2.41.0

