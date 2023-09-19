Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id F1BAA7A6E17
	for <lists+dri-devel@lfdr.de>; Wed, 20 Sep 2023 00:06:27 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id E5D5110E3D8;
	Tue, 19 Sep 2023 22:06:25 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from us-smtp-delivery-124.mimecast.com
 (us-smtp-delivery-124.mimecast.com [170.10.133.124])
 by gabe.freedesktop.org (Postfix) with ESMTPS id C07F810E3E8
 for <dri-devel@lists.freedesktop.org>; Tue, 19 Sep 2023 22:06:19 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1695161178;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=/MlFYOq/NSmxR/1uKfeYpusgfIpU4R7fczdhyvWYPnY=;
 b=Uws1doao37TFifZMVPMttbjWOzB9WA2aoajRhYS1kNQdEczyGKxQiELD9Y8Gj1bozbXBKb
 K+8tMcBA08tCPC1xlNWEU+kmkD/uuNkdjP0bhOf55PRrPJ/5N+IjJSIHHGryOseM1vDMFz
 AeFa6Y9+BwklKysWyxRKy1Vx8iPxf9E=
Received: from mimecast-mx02.redhat.com (mx-ext.redhat.com [66.187.233.73])
 by relay.mimecast.com with ESMTP with STARTTLS (version=TLSv1.2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 us-mta-390-Lg_ndyiHNuukkxvrUTeaew-1; Tue, 19 Sep 2023 18:06:14 -0400
X-MC-Unique: Lg_ndyiHNuukkxvrUTeaew-1
Received: from smtp.corp.redhat.com (int-mx01.intmail.prod.int.rdu2.redhat.com
 [10.11.54.1])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by mimecast-mx02.redhat.com (Postfix) with ESMTPS id F29093822565;
 Tue, 19 Sep 2023 22:06:13 +0000 (UTC)
Received: from emerald.lyude.net (unknown [10.22.18.67])
 by smtp.corp.redhat.com (Postfix) with ESMTP id 9158E40C2064;
 Tue, 19 Sep 2023 22:06:13 +0000 (UTC)
From: Lyude Paul <lyude@redhat.com>
To: dri-devel@lists.freedesktop.org,
	nouveau@lists.freedesktop.org
Subject: [PATCH v3 22/44] drm/nouveau/disp: remove SOR routing updates from
 supervisor
Date: Tue, 19 Sep 2023 17:56:17 -0400
Message-ID: <20230919220442.202488-23-lyude@redhat.com>
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
 ruanjinjie <ruanjinjie@huawei.com>, open list <linux-kernel@vger.kernel.org>,
 Ben Skeggs <bskeggs@redhat.com>
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

From: Ben Skeggs <bskeggs@redhat.com>

- these shouldn't be necessary now, and are done in acquire()/release()
- preparation for GSP-RM, where we don't control the supervisor

Signed-off-by: Ben Skeggs <bskeggs@redhat.com>
Reviewed-by: Lyude Paul <lyude@redhat.com>
Acked-by: Danilo Krummrich <me@dakr.org>
Signed-off-by: Lyude Paul <lyude@redhat.com>
---
 drivers/gpu/drm/nouveau/nvkm/engine/disp/gf119.c | 1 -
 drivers/gpu/drm/nouveau/nvkm/engine/disp/gv100.c | 1 -
 drivers/gpu/drm/nouveau/nvkm/engine/disp/nv50.c  | 1 -
 3 files changed, 3 deletions(-)

diff --git a/drivers/gpu/drm/nouveau/nvkm/engine/disp/gf119.c b/drivers/gpu/drm/nouveau/nvkm/engine/disp/gf119.c
index a48e9bdf4cd07..937baae6a3ebb 100644
--- a/drivers/gpu/drm/nouveau/nvkm/engine/disp/gf119.c
+++ b/drivers/gpu/drm/nouveau/nvkm/engine/disp/gf119.c
@@ -1038,7 +1038,6 @@ gf119_disp_super(struct work_struct *work)
 				continue;
 			nv50_disp_super_2_0(disp, head);
 		}
-		nvkm_outp_route(disp);
 		list_for_each_entry(head, &disp->heads, head) {
 			if (!(mask[head->id] & 0x00010000))
 				continue;
diff --git a/drivers/gpu/drm/nouveau/nvkm/engine/disp/gv100.c b/drivers/gpu/drm/nouveau/nvkm/engine/disp/gv100.c
index 4ebc030e40d12..7ac59bab6309f 100644
--- a/drivers/gpu/drm/nouveau/nvkm/engine/disp/gv100.c
+++ b/drivers/gpu/drm/nouveau/nvkm/engine/disp/gv100.c
@@ -863,7 +863,6 @@ gv100_disp_super(struct work_struct *work)
 				continue;
 			nv50_disp_super_2_0(disp, head);
 		}
-		nvkm_outp_route(disp);
 		list_for_each_entry(head, &disp->heads, head) {
 			if (!(mask[head->id] & 0x00010000))
 				continue;
diff --git a/drivers/gpu/drm/nouveau/nvkm/engine/disp/nv50.c b/drivers/gpu/drm/nouveau/nvkm/engine/disp/nv50.c
index be81168029604..a4ce605177895 100644
--- a/drivers/gpu/drm/nouveau/nvkm/engine/disp/nv50.c
+++ b/drivers/gpu/drm/nouveau/nvkm/engine/disp/nv50.c
@@ -1371,7 +1371,6 @@ nv50_disp_super(struct work_struct *work)
 				continue;
 			nv50_disp_super_2_0(disp, head);
 		}
-		nvkm_outp_route(disp);
 		list_for_each_entry(head, &disp->heads, head) {
 			if (!(super & (0x00000200 << head->id)))
 				continue;
-- 
2.41.0

