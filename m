Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 02FF97A6E23
	for <lists+dri-devel@lfdr.de>; Wed, 20 Sep 2023 00:06:56 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 0387C10E3F1;
	Tue, 19 Sep 2023 22:06:53 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from us-smtp-delivery-124.mimecast.com
 (us-smtp-delivery-124.mimecast.com [170.10.129.124])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 76EAC10E3EE
 for <dri-devel@lists.freedesktop.org>; Tue, 19 Sep 2023 22:06:48 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1695161207;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=OU5XGffeFstkERqBf5Qi7YcQ1tt2JoUnNS+NoZuaHhI=;
 b=QKBxUSlKFdzlTgezbMZIpt1yV7kyoeEEKiM3wIS2fZNJnSoniUsLazk9B4b+TPaRzdeoBz
 kZp2l1g/E9gS1rZePLChHC+BxGs/1NvtTGDWWsJFEKyKUy+YoOGPzGLfgBKdVzW65KHE1h
 paY5xUnrYS0ccY1DzI+xIHBImP8pjmY=
Received: from mimecast-mx02.redhat.com (mx-ext.redhat.com [66.187.233.73])
 by relay.mimecast.com with ESMTP with STARTTLS (version=TLSv1.2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 us-mta-681-PT4rTQ6-MVCHn11FAVKtKw-1; Tue, 19 Sep 2023 18:06:44 -0400
X-MC-Unique: PT4rTQ6-MVCHn11FAVKtKw-1
Received: from smtp.corp.redhat.com (int-mx01.intmail.prod.int.rdu2.redhat.com
 [10.11.54.1])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by mimecast-mx02.redhat.com (Postfix) with ESMTPS id 7F3893C02539;
 Tue, 19 Sep 2023 22:06:43 +0000 (UTC)
Received: from emerald.lyude.net (unknown [10.22.18.67])
 by smtp.corp.redhat.com (Postfix) with ESMTP id 08C5740C2064;
 Tue, 19 Sep 2023 22:06:43 +0000 (UTC)
From: Lyude Paul <lyude@redhat.com>
To: dri-devel@lists.freedesktop.org,
	nouveau@lists.freedesktop.org
Subject: [PATCH v3 25/44] drm/nouveau/disp: add hdmi audio hal function
Date: Tue, 19 Sep 2023 17:56:20 -0400
Message-ID: <20230919220442.202488-26-lyude@redhat.com>
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
 open list <linux-kernel@vger.kernel.org>, Ben Skeggs <bskeggs@redhat.com>
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

From: Ben Skeggs <bskeggs@redhat.com>

This just adds a hook for RM to use, HW paths remain untouched, but
should probably be cleaned up to use this too at some point.

Signed-off-by: Ben Skeggs <bskeggs@redhat.com>
Reviewed-by: Lyude Paul <lyude@redhat.com>
Acked-by: Danilo Krummrich <me@dakr.org>
Signed-off-by: Lyude Paul <lyude@redhat.com>
---
 drivers/gpu/drm/nouveau/nvkm/engine/disp/ior.h   |  1 +
 drivers/gpu/drm/nouveau/nvkm/engine/disp/uoutp.c | 10 +++++++++-
 2 files changed, 10 insertions(+), 1 deletion(-)

diff --git a/drivers/gpu/drm/nouveau/nvkm/engine/disp/ior.h b/drivers/gpu/drm/nouveau/nvkm/engine/disp/ior.h
index 6e750890bcc93..8686e5c044a5d 100644
--- a/drivers/gpu/drm/nouveau/nvkm/engine/disp/ior.h
+++ b/drivers/gpu/drm/nouveau/nvkm/engine/disp/ior.h
@@ -74,6 +74,7 @@ struct nvkm_ior_func {
 			     bool scrambling_low_rates);
 		void (*infoframe_avi)(struct nvkm_ior *, int head, void *data, u32 size);
 		void (*infoframe_vsi)(struct nvkm_ior *, int head, void *data, u32 size);
+		void (*audio)(struct nvkm_ior *, int head, bool enable);
 	} *hdmi;
 
 	const struct nvkm_ior_func_dp {
diff --git a/drivers/gpu/drm/nouveau/nvkm/engine/disp/uoutp.c b/drivers/gpu/drm/nouveau/nvkm/engine/disp/uoutp.c
index ad75dc5c50cf7..7574f22006441 100644
--- a/drivers/gpu/drm/nouveau/nvkm/engine/disp/uoutp.c
+++ b/drivers/gpu/drm/nouveau/nvkm/engine/disp/uoutp.c
@@ -99,12 +99,20 @@ nvkm_uoutp_mthd_hda_eld(struct nvkm_outp *outp, void *argv, u32 argc)
 	if (argc && args->v0.data[0]) {
 		if (outp->info.type == DCB_OUTPUT_DP)
 			ior->func->dp->audio(ior, args->v0.head, true);
+		else
+		if (ior->func->hdmi->audio)
+			ior->func->hdmi->audio(ior, args->v0.head, true);
+
 		ior->func->hda->hpd(ior, args->v0.head, true);
 		ior->func->hda->eld(ior, args->v0.head, args->v0.data, argc);
 	} else {
+		ior->func->hda->hpd(ior, args->v0.head, false);
+
 		if (outp->info.type == DCB_OUTPUT_DP)
 			ior->func->dp->audio(ior, args->v0.head, false);
-		ior->func->hda->hpd(ior, args->v0.head, false);
+		else
+		if (ior->func->hdmi->audio)
+			ior->func->hdmi->audio(ior, args->v0.head, false);
 	}
 
 	return 0;
-- 
2.41.0

