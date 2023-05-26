Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id B79CA71231C
	for <lists+dri-devel@lfdr.de>; Fri, 26 May 2023 11:11:03 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 393AD10E7D6;
	Fri, 26 May 2023 09:11:00 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from us-smtp-delivery-124.mimecast.com
 (us-smtp-delivery-124.mimecast.com [170.10.129.124])
 by gabe.freedesktop.org (Postfix) with ESMTPS id C0BB810E7D6
 for <dri-devel@lists.freedesktop.org>; Fri, 26 May 2023 09:10:57 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1685092256;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding;
 bh=pfhQPnMMVxGy9HVpRogR5S0+kfWfaO5hPxVfZgqeerw=;
 b=OdOF6tqTy92ytR38lag6JyzSpzKfLb40bZEXsA1MclD3M6wVY1CzpdDuVb1j/Me9g6EK+a
 +wrblKsqi7Jk+yzrm2Od0R+h8xa5Youmtjdg9pO3/beS+6fHID6nlV8IJq1GPIY8x95pYL
 ACDJRWorItin8WQAd/gTpADGnYyg1Sc=
Received: from mail-wm1-f69.google.com (mail-wm1-f69.google.com
 [209.85.128.69]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_256_GCM_SHA384) id
 us-mta-601-ujLSRSbtMjC6S_hZUxKHNQ-1; Fri, 26 May 2023 05:10:55 -0400
X-MC-Unique: ujLSRSbtMjC6S_hZUxKHNQ-1
Received: by mail-wm1-f69.google.com with SMTP id
 5b1f17b1804b1-3f08900caadso1018875e9.0
 for <dri-devel@lists.freedesktop.org>; Fri, 26 May 2023 02:10:54 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20221208; t=1685092254; x=1687684254;
 h=content-transfer-encoding:mime-version:message-id:date:subject:cc
 :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
 :reply-to;
 bh=pfhQPnMMVxGy9HVpRogR5S0+kfWfaO5hPxVfZgqeerw=;
 b=XbpeD/LoUEoSpRhZXWhP/YNkf9gOS9s5tZphtOqqqdVkaOVvXLQoumy6kLhC4c+oqV
 OOhnyXnn40FD3IDncTtrq9N5icq4b3wDaer1IAMYm2B9GPUo6Ci5Ab27WuJFO8Bq5Y6s
 HuXjqXnYy1f8Cq93YahI5YUvkOOKW8Brr0IyKYlQxfs3UXpVFoXeqisaxT0TVTMWj3by
 0VIQNh7i84mJBey8QkEoLlG+OLuG10TDp1udcVJqXERD/N7xYRtEaZR/Rw5f5wFjDWod
 r3H51ZTicijKmbKs2XrYbkEW99tz8ToQTc1Aqmb0xb7KvEhLax08h4uYvoECwa8z/3cD
 nCqw==
X-Gm-Message-State: AC+VfDyCO9y/jT9w67cmmTgl4Ab7GXZqIEKrVflq67Qh0zkZH4nwotzC
 rc8AC+N+64G2EjxpAwoLKsbq5hEkAX7DCiuVgldk28X7w6ovFigPBjxraKPkC+5WnNG/bgenHiD
 k/roX+rB+lWXENxhH/gss3fy2aj98
X-Received: by 2002:a5d:4089:0:b0:305:ed26:856e with SMTP id
 o9-20020a5d4089000000b00305ed26856emr726548wrp.4.1685092254080; 
 Fri, 26 May 2023 02:10:54 -0700 (PDT)
X-Google-Smtp-Source: ACHHUZ7saa/44Q0pwfx5BthoXdKEazE+VPecBiWDTDxgSxJeja34PRg2BVqeRTUB/dal6RLuLcQ8aA==
X-Received: by 2002:a5d:4089:0:b0:305:ed26:856e with SMTP id
 o9-20020a5d4089000000b00305ed26856emr726532wrp.4.1685092253802; 
 Fri, 26 May 2023 02:10:53 -0700 (PDT)
Received: from kherbst.pingu (ip1f1032e8.dynamic.kabel-deutschland.de.
 [31.16.50.232]) by smtp.gmail.com with ESMTPSA id
 z16-20020adfe550000000b003063a92bbf5sm4474553wrm.70.2023.05.26.02.10.52
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Fri, 26 May 2023 02:10:53 -0700 (PDT)
From: Karol Herbst <kherbst@redhat.com>
To: linux-kernel@vger.kernel.org
Subject: [PATCH v2] drm/nouveau: bring back blit subchannel for pre nv50 GPUs
Date: Fri, 26 May 2023 11:10:52 +0200
Message-Id: <20230526091052.2169044-1-kherbst@redhat.com>
X-Mailer: git-send-email 2.40.1
MIME-Version: 1.0
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Transfer-Encoding: 8bit
Content-Type: text/plain; charset="US-ASCII"; x-default=true
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
Cc: nouveau@lists.freedesktop.org, Karol Herbst <kherbst@redhat.com>,
 Ben Skeggs <bskeggs@redhat.com>, dri-devel@lists.freedesktop.org
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

1ba6113a90a0 removed a lot of the kernel GPU channel, but method 0x128
was important as otherwise the GPU spams us with `CACHE_ERROR` messages.

We use the blit subchannel inside our vblank handling, so we should keep
at least this part.

v2: Only do it for NV11+ GPUs

Closes: https://gitlab.freedesktop.org/drm/nouveau/-/issues/201
Fixes: 4a16dd9d18a0 ("drm/nouveau/kms: switch to drm fbdev helpers")
Signed-off-by: Karol Herbst <kherbst@redhat.com>
---
 drivers/gpu/drm/nouveau/nouveau_chan.c |  1 +
 drivers/gpu/drm/nouveau/nouveau_chan.h |  1 +
 drivers/gpu/drm/nouveau/nouveau_drm.c  | 20 +++++++++++++++++---
 3 files changed, 19 insertions(+), 3 deletions(-)

diff --git a/drivers/gpu/drm/nouveau/nouveau_chan.c b/drivers/gpu/drm/nouveau/nouveau_chan.c
index e648ecd0c1a0..3dfbc374478e 100644
--- a/drivers/gpu/drm/nouveau/nouveau_chan.c
+++ b/drivers/gpu/drm/nouveau/nouveau_chan.c
@@ -90,6 +90,7 @@ nouveau_channel_del(struct nouveau_channel **pchan)
 		if (cli)
 			nouveau_svmm_part(chan->vmm->svmm, chan->inst);
 
+		nvif_object_dtor(&chan->blit);
 		nvif_object_dtor(&chan->nvsw);
 		nvif_object_dtor(&chan->gart);
 		nvif_object_dtor(&chan->vram);
diff --git a/drivers/gpu/drm/nouveau/nouveau_chan.h b/drivers/gpu/drm/nouveau/nouveau_chan.h
index e06a8ffed31a..bad7466bd0d5 100644
--- a/drivers/gpu/drm/nouveau/nouveau_chan.h
+++ b/drivers/gpu/drm/nouveau/nouveau_chan.h
@@ -53,6 +53,7 @@ struct nouveau_channel {
 	u32 user_put;
 
 	struct nvif_object user;
+	struct nvif_object blit;
 
 	struct nvif_event kill;
 	atomic_t killed;
diff --git a/drivers/gpu/drm/nouveau/nouveau_drm.c b/drivers/gpu/drm/nouveau/nouveau_drm.c
index cc7c5b4a05fd..9512f1c2f871 100644
--- a/drivers/gpu/drm/nouveau/nouveau_drm.c
+++ b/drivers/gpu/drm/nouveau/nouveau_drm.c
@@ -369,15 +369,29 @@ nouveau_accel_gr_init(struct nouveau_drm *drm)
 		ret = nvif_object_ctor(&drm->channel->user, "drmNvsw",
 				       NVDRM_NVSW, nouveau_abi16_swclass(drm),
 				       NULL, 0, &drm->channel->nvsw);
+
+		if (ret == 0 && device->info.chipset >= 0x11) {
+			ret = nvif_object_ctor(&drm->channel->user, "drmBlit",
+					       0x005f, 0x009f,
+					       NULL, 0, &drm->channel->blit);
+		}
+
 		if (ret == 0) {
 			struct nvif_push *push = drm->channel->chan.push;
-			ret = PUSH_WAIT(push, 2);
-			if (ret == 0)
+			ret = PUSH_WAIT(push, 8);
+			if (ret == 0) {
+				if (device->info.chipset >= 0x11) {
+					PUSH_NVSQ(push, NV05F, 0x0000, drm->channel->blit.handle);
+					PUSH_NVSQ(push, NV09F, 0x0120, 0,
+							       0x0124, 1,
+							       0x0128, 2);
+				}
 				PUSH_NVSQ(push, NV_SW, 0x0000, drm->channel->nvsw.handle);
+			}
 		}
 
 		if (ret) {
-			NV_ERROR(drm, "failed to allocate sw class, %d\n", ret);
+			NV_ERROR(drm, "failed to allocate sw or blit class, %d\n", ret);
 			nouveau_accel_gr_fini(drm);
 			return;
 		}
-- 
2.40.1

