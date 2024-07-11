Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 302E192EDE9
	for <lists+dri-devel@lfdr.de>; Thu, 11 Jul 2024 19:36:15 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id A58C610E292;
	Thu, 11 Jul 2024 17:36:13 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (1024-bit key; unprotected) header.d=redhat.com header.i=@redhat.com header.b="RzFO2rbv";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from us-smtp-delivery-124.mimecast.com
 (us-smtp-delivery-124.mimecast.com [170.10.129.124])
 by gabe.freedesktop.org (Postfix) with ESMTPS id F3F3C10E298
 for <dri-devel@lists.freedesktop.org>; Thu, 11 Jul 2024 17:36:11 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1720719371;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding;
 bh=PqZ5Lq7rcqKvViuzmKy6ImpdE7S1OOOZU2S6RM0SUzQ=;
 b=RzFO2rbvwzoKSubD8f2S2OEtHyFnVdAm8WmLWSWxvp29H1/xnFSEHTtDe9nyGcWBass5iE
 VhUz+k1VIRcD9pAfZgy4QRtDR5v6r3h5X4Pxvxl1Y0Iubl391z+Os5AekEc+sGhq3Xa+Nb
 8CX35UC9laZQH5rach5MmsVnpYZnAPI=
Received: from mail-wm1-f72.google.com (mail-wm1-f72.google.com
 [209.85.128.72]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_256_GCM_SHA384) id
 us-mta-651-i1AB6n38PnqreCUlxdqRsA-1; Thu, 11 Jul 2024 13:36:07 -0400
X-MC-Unique: i1AB6n38PnqreCUlxdqRsA-1
Received: by mail-wm1-f72.google.com with SMTP id
 5b1f17b1804b1-4210e98f8d7so2191925e9.3
 for <dri-devel@lists.freedesktop.org>; Thu, 11 Jul 2024 10:36:07 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1720719366; x=1721324166;
 h=content-transfer-encoding:mime-version:message-id:date:subject:cc
 :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
 :reply-to;
 bh=PqZ5Lq7rcqKvViuzmKy6ImpdE7S1OOOZU2S6RM0SUzQ=;
 b=XjRYLiGBE2lf6UPAX9gfFwE/bVa8NxoikmS6C/8SmY3/SCTDz8igpCkydoYXtwQV1G
 WEf/G5PL2qo5EFfX8tgXjvtf39lty4Keb+VF3Sx8WCSPH9MzwtQkeg7YurXC/BWn6cSL
 ZS1EiBnX69xgYf/G9iWclSQ2SaNVm1UNLH/3AbzzMYQsLGtZR/w1k9jG3tYdlBZ69sFX
 Qhan1+EFBrOZ5ZYmJTl9EbPftMVQoXEGT6dEvWJl/8eXxUi2p4tZQJfJBQ0LkCFJxHLq
 Ita19Q8AMRMk8LFFBvVvRKkYPx5YN59iFy7Owm1mNZ5uLuNgCbIGu4VKB3l4Ia4zyn0K
 vcAA==
X-Gm-Message-State: AOJu0Yxkl6+EybTRAjx/8ZHTXoolalXuu1L3dSglN0LP6Pp2CLQVSPpc
 ouZhk5f8sySIOAiA0IwX1u9iqqZZlR33ZjDxiGJbiOW6dHgfLDM20tEJXpN0B9dKs+RZnUGnz1F
 j0cBRMA0IzHVy5EbyzZmxrsMZc7RaHgRZ0uCmnMSA8RpZOY8UxbB9HZ86wW74Dyed4w==
X-Received: by 2002:a5d:6489:0:b0:367:9614:fdf7 with SMTP id
 ffacd0b85a97d-367f0545ecdmr2325012f8f.0.1720719366376; 
 Thu, 11 Jul 2024 10:36:06 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IGMfYTkbrTlZRWFy2Gd9pQVj1zME06oiFKdU2+UjDpE1fDMi5oLmElwlTGgF4rW+HmuC4lNjw==
X-Received: by 2002:a5d:6489:0:b0:367:9614:fdf7 with SMTP id
 ffacd0b85a97d-367f0545ecdmr2325000f8f.0.1720719366016; 
 Thu, 11 Jul 2024 10:36:06 -0700 (PDT)
Received: from pstanner-thinkpadt14sgen1.muc.redhat.com
 (nat-pool-muc-t.redhat.com. [149.14.88.26])
 by smtp.gmail.com with ESMTPSA id
 ffacd0b85a97d-367cde7e19dsm8242836f8f.15.2024.07.11.10.36.04
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Thu, 11 Jul 2024 10:36:05 -0700 (PDT)
From: Philipp Stanner <pstanner@redhat.com>
To: Karol Herbst <kherbst@redhat.com>, Lyude Paul <lyude@redhat.com>,
 Danilo Krummrich <dakr@redhat.com>, David Airlie <airlied@gmail.com>,
 Daniel Vetter <daniel@ffwll.ch>
Cc: dri-devel@lists.freedesktop.org, nouveau@lists.freedesktop.org,
 linux-kernel@vger.kernel.org, Philipp Stanner <pstanner@redhat.com>
Subject: [PATCH] drm/nouveau: Improve variable names in nouveau_sched_init()
Date: Thu, 11 Jul 2024 19:35:51 +0200
Message-ID: <20240711173551.76148-1-pstanner@redhat.com>
X-Mailer: git-send-email 2.45.0
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
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

nouveau_sched_init() uses the function drm_sched_init(). The latter
function has parameters called "hang_limit" and "timeout" in its API
documentation.

nouveau_sched_init(), however, defines a variable called
"job_hang_limit" which is passed to drm_sched_init()'s "timeout"
parameter. The actual "hang_limit" parameter is directly set to 0.

Define a new variable and rename the existing one to make naming
congruent with the function API.

Signed-off-by: Philipp Stanner <pstanner@redhat.com>
---
 drivers/gpu/drm/nouveau/nouveau_sched.c | 5 +++--
 1 file changed, 3 insertions(+), 2 deletions(-)

diff --git a/drivers/gpu/drm/nouveau/nouveau_sched.c b/drivers/gpu/drm/nouveau/nouveau_sched.c
index 32fa2e273965..ee1f49056737 100644
--- a/drivers/gpu/drm/nouveau/nouveau_sched.c
+++ b/drivers/gpu/drm/nouveau/nouveau_sched.c
@@ -404,7 +404,8 @@ nouveau_sched_init(struct nouveau_sched *sched, struct nouveau_drm *drm,
 {
 	struct drm_gpu_scheduler *drm_sched = &sched->base;
 	struct drm_sched_entity *entity = &sched->entity;
-	long job_hang_limit = msecs_to_jiffies(NOUVEAU_SCHED_JOB_TIMEOUT_MS);
+	const long timeout = msecs_to_jiffies(NOUVEAU_SCHED_JOB_TIMEOUT_MS);
+	const unsigned int hang_limit = 0;
 	int ret;
 
 	if (!wq) {
@@ -418,7 +419,7 @@ nouveau_sched_init(struct nouveau_sched *sched, struct nouveau_drm *drm,
 
 	ret = drm_sched_init(drm_sched, &nouveau_sched_ops, wq,
 			     NOUVEAU_SCHED_PRIORITY_COUNT,
-			     credit_limit, 0, job_hang_limit,
+			     credit_limit, hang_limit, timeout,
 			     NULL, NULL, "nouveau_sched", drm->dev->dev);
 	if (ret)
 		goto fail_wq;
-- 
2.45.0

