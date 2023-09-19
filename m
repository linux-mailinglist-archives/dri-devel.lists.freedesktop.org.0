Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 000057A6E25
	for <lists+dri-devel@lfdr.de>; Wed, 20 Sep 2023 00:07:01 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 411C910E19C;
	Tue, 19 Sep 2023 22:07:00 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from us-smtp-delivery-124.mimecast.com
 (us-smtp-delivery-124.mimecast.com [170.10.133.124])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 93E9710E3F7
 for <dri-devel@lists.freedesktop.org>; Tue, 19 Sep 2023 22:06:54 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1695161213;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=zXKW/3wujMQKniDN1UFIV26pXsP566Lzxl/Vfmrm4zE=;
 b=FpjaIMX3gbQPwQe0WqMRqdvI5q5d0yV1SQWCHaBoWAjfwz9UpSh7rw2SUeQE4nOgBtHY88
 ql5I+JmqknfI80U03gmaduybiuj1DfvfpwxgNMRCC2wPp4NJOZIqK0scZIVwH3ysJq84mw
 nzfFy2P0jzaUc+cF1XlmIIE2YunZ030=
Received: from mimecast-mx02.redhat.com (mimecast-mx02.redhat.com
 [66.187.233.88]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 us-mta-48-HvcUmgBSOoiuIaxd9mKIMQ-1; Tue, 19 Sep 2023 18:06:47 -0400
X-MC-Unique: HvcUmgBSOoiuIaxd9mKIMQ-1
Received: from smtp.corp.redhat.com (int-mx01.intmail.prod.int.rdu2.redhat.com
 [10.11.54.1])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by mimecast-mx02.redhat.com (Postfix) with ESMTPS id B967F8001EA;
 Tue, 19 Sep 2023 22:06:46 +0000 (UTC)
Received: from emerald.lyude.net (unknown [10.22.18.67])
 by smtp.corp.redhat.com (Postfix) with ESMTP id 58C2240C2064;
 Tue, 19 Sep 2023 22:06:46 +0000 (UTC)
From: Lyude Paul <lyude@redhat.com>
To: dri-devel@lists.freedesktop.org,
	nouveau@lists.freedesktop.org
Subject: [PATCH v3 26/44] drm/nouveau/disp: move dp aux pwr method to HAL
Date: Tue, 19 Sep 2023 17:56:21 -0400
Message-ID: <20230919220442.202488-27-lyude@redhat.com>
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
Cc: Kees Cook <keescook@chromium.org>, Karol Herbst <kherbst@redhat.com>,
 Danilo Krummrich <me@dakr.org>, open list <linux-kernel@vger.kernel.org>,
 Ben Skeggs <bskeggs@redhat.com>
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

From: Ben Skeggs <bskeggs@redhat.com>

- preparation for GSP-RM

Signed-off-by: Ben Skeggs <bskeggs@redhat.com>
Reviewed-by: Lyude Paul <lyude@redhat.com>
Acked-by: Danilo Krummrich <me@dakr.org>
Signed-off-by: Lyude Paul <lyude@redhat.com>
---
 drivers/gpu/drm/nouveau/nvkm/engine/disp/dp.c    | 9 +++++++++
 drivers/gpu/drm/nouveau/nvkm/engine/disp/outp.h  | 4 ++++
 drivers/gpu/drm/nouveau/nvkm/engine/disp/uoutp.c | 6 +++---
 3 files changed, 16 insertions(+), 3 deletions(-)

diff --git a/drivers/gpu/drm/nouveau/nvkm/engine/disp/dp.c b/drivers/gpu/drm/nouveau/nvkm/engine/disp/dp.c
index 0e6e388003765..99fe7ef07a443 100644
--- a/drivers/gpu/drm/nouveau/nvkm/engine/disp/dp.c
+++ b/drivers/gpu/drm/nouveau/nvkm/engine/disp/dp.c
@@ -41,6 +41,14 @@
  */
 #define AMPERE_IED_HACK(disp) ((disp)->engine.subdev.device->card_type >= GA100)
 
+static int
+nvkm_dp_aux_pwr(struct nvkm_outp *outp, bool pu)
+{
+	outp->dp.enabled = pu;
+	nvkm_dp_enable(outp, outp->dp.enabled);
+	return 0;
+}
+
 struct lt_state {
 	struct nvkm_outp *outp;
 
@@ -814,6 +822,7 @@ nvkm_dp_func = {
 	.disable = nvkm_dp_disable,
 	.bl.get = nvkm_outp_bl_get,
 	.bl.set = nvkm_outp_bl_set,
+	.dp.aux_pwr = nvkm_dp_aux_pwr,
 };
 
 int
diff --git a/drivers/gpu/drm/nouveau/nvkm/engine/disp/outp.h b/drivers/gpu/drm/nouveau/nvkm/engine/disp/outp.h
index 38b6b43a9f200..513794a278a91 100644
--- a/drivers/gpu/drm/nouveau/nvkm/engine/disp/outp.h
+++ b/drivers/gpu/drm/nouveau/nvkm/engine/disp/outp.h
@@ -104,6 +104,10 @@ struct nvkm_outp_func {
 		int (*get)(struct nvkm_outp *);
 		int (*set)(struct nvkm_outp *, int level);
 	} bl;
+
+	struct {
+		int (*aux_pwr)(struct nvkm_outp *, bool pu);
+	} dp;
 };
 
 #define OUTP_MSG(o,l,f,a...) do {                                              \
diff --git a/drivers/gpu/drm/nouveau/nvkm/engine/disp/uoutp.c b/drivers/gpu/drm/nouveau/nvkm/engine/disp/uoutp.c
index 7574f22006441..6ca364e953bd7 100644
--- a/drivers/gpu/drm/nouveau/nvkm/engine/disp/uoutp.c
+++ b/drivers/gpu/drm/nouveau/nvkm/engine/disp/uoutp.c
@@ -75,10 +75,10 @@ nvkm_uoutp_mthd_dp_aux_pwr(struct nvkm_outp *outp, void *argv, u32 argc)
 
 	if (argc != sizeof(args->v0) || args->v0.version != 0)
 		return -ENOSYS;
+	if (!outp->func->dp.aux_pwr)
+		return -EINVAL;
 
-	outp->dp.enabled = !!args->v0.state;
-	nvkm_dp_enable(outp, outp->dp.enabled);
-	return 0;
+	return outp->func->dp.aux_pwr(outp, !!args->v0.state);
 }
 
 static int
-- 
2.41.0

