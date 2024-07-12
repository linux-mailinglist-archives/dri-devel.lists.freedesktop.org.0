Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id CC34C92F582
	for <lists+dri-devel@lfdr.de>; Fri, 12 Jul 2024 08:26:37 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 6E67210EBFA;
	Fri, 12 Jul 2024 06:26:34 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (1024-bit key; unprotected) header.d=redhat.com header.i=@redhat.com header.b="M7zchPnP";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from us-smtp-delivery-124.mimecast.com
 (us-smtp-delivery-124.mimecast.com [170.10.129.124])
 by gabe.freedesktop.org (Postfix) with ESMTPS id C3E8C10EBFA
 for <dri-devel@lists.freedesktop.org>; Fri, 12 Jul 2024 06:26:33 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1720765592;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding;
 bh=9a5IayKbXBKJrNi/QMZz5s0Prw5V2adYI5z3/V5xH40=;
 b=M7zchPnPSofukDv3l2q5o9L5VLSygCvSd+UYDVopNXv9Y50oVPhAHkDqFyZuBk5J44eOL2
 HcpE/Gy3fz+lYMP/5HlEGLdF6hhm80yJZE5YzSbjA3q2bwHydnl1fnllXP8fMh1afU2kXB
 TLOYaT45uA63P0TGpCGm8awmZJn26u0=
Received: from mail-wm1-f69.google.com (mail-wm1-f69.google.com
 [209.85.128.69]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_256_GCM_SHA384) id
 us-mta-83-JIXOq6guNwy8jXKw1pPw-w-1; Fri, 12 Jul 2024 02:26:28 -0400
X-MC-Unique: JIXOq6guNwy8jXKw1pPw-w-1
Received: by mail-wm1-f69.google.com with SMTP id
 5b1f17b1804b1-4279c924c84so694965e9.1
 for <dri-devel@lists.freedesktop.org>; Thu, 11 Jul 2024 23:26:28 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1720765587; x=1721370387;
 h=content-transfer-encoding:mime-version:message-id:date:subject:cc
 :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
 :reply-to;
 bh=9a5IayKbXBKJrNi/QMZz5s0Prw5V2adYI5z3/V5xH40=;
 b=U2qiw0Z5PQFraqUMLDAqiAyOyly6W3Z5D5nAxEBwi4fcWsCpnpv2c3xsT0zkoV2sla
 F9VcG5RSkxmFoplmGRvwLLqCs2xA2Ik98PFKhec8lKuu0+iml9v6l/hrHQo4j3C/VKOA
 vC+45M8cSjwbMcabdm5q2pTTMPK1mlUBiaxR4hlQRE76fyBC2WSQ2lo6pq/u41pgekil
 /vJ8wCQHR4wpX/8a30g8IXlFsu8GX5UZ/vDNPRurWH0jEnx6vQ3JYqmnergwF7qr9xl7
 +oKFrxuQ8qhrMPr/AqjvPUr/XqhhomdNjc5Br5tQI7+y99rUwyzmtTIcR8iZ/MJd/6dL
 V9Wg==
X-Gm-Message-State: AOJu0YwgYzafm50ad9Dsl2ips4PFAumcRtRLQcYMtE833MWBsXdMVZMG
 NYYnPUjJdbzxDcLVIoaHlvR/JNLOmLQaPpuyvYIu3QfdIuNAz+UXjQ9ez4+Le/IEeteqlsWClDw
 mcJVsLX+UoznC1BtR41aYMQ74YSWsMEOeVOwEbVevB8+CaXDPpw7uqO7KvJdi8x10Sg==
X-Received: by 2002:a5d:64cb:0:b0:362:1322:affc with SMTP id
 ffacd0b85a97d-367ceac1af6mr7196238f8f.5.1720765587438; 
 Thu, 11 Jul 2024 23:26:27 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IFKURcKatRXBWbit8UsmQ0Qm94LXmqPcy3DdNqKx6medY7O8ZyGlJX5YS/xZ14HpSQcyTLjgg==
X-Received: by 2002:a5d:64cb:0:b0:362:1322:affc with SMTP id
 ffacd0b85a97d-367ceac1af6mr7196220f8f.5.1720765587025; 
 Thu, 11 Jul 2024 23:26:27 -0700 (PDT)
Received: from pstanner-thinkpadt14sgen1.fritz.box
 (200116b82df8b300fbf278adc06b342f.dip.versatel-1u1.de.
 [2001:16b8:2df8:b300:fbf2:78ad:c06b:342f])
 by smtp.gmail.com with ESMTPSA id
 ffacd0b85a97d-367cde891a3sm9322535f8f.61.2024.07.11.23.26.26
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Thu, 11 Jul 2024 23:26:26 -0700 (PDT)
From: Philipp Stanner <pstanner@redhat.com>
To: Karol Herbst <kherbst@redhat.com>, Lyude Paul <lyude@redhat.com>,
 Danilo Krummrich <dakr@redhat.com>, David Airlie <airlied@gmail.com>,
 Daniel Vetter <daniel@ffwll.ch>
Cc: dri-devel@lists.freedesktop.org, nouveau@lists.freedesktop.org,
 linux-kernel@vger.kernel.org, Philipp Stanner <pstanner@redhat.com>
Subject: [PATCH v2] drm/nouveau: Improve variable names in nouveau_sched_init()
Date: Fri, 12 Jul 2024 08:26:18 +0200
Message-ID: <20240712062618.8057-1-pstanner@redhat.com>
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

Rename "job_hang_limit" to "timeout".

Signed-off-by: Philipp Stanner <pstanner@redhat.com>
---
Changes in v2:
- Remove variable "hang_limit". (Danilo)
---
 drivers/gpu/drm/nouveau/nouveau_sched.c | 4 ++--
 1 file changed, 2 insertions(+), 2 deletions(-)

diff --git a/drivers/gpu/drm/nouveau/nouveau_sched.c b/drivers/gpu/drm/nouveau/nouveau_sched.c
index 32fa2e273965..ba4139288a6d 100644
--- a/drivers/gpu/drm/nouveau/nouveau_sched.c
+++ b/drivers/gpu/drm/nouveau/nouveau_sched.c
@@ -404,7 +404,7 @@ nouveau_sched_init(struct nouveau_sched *sched, struct nouveau_drm *drm,
 {
 	struct drm_gpu_scheduler *drm_sched = &sched->base;
 	struct drm_sched_entity *entity = &sched->entity;
-	long job_hang_limit = msecs_to_jiffies(NOUVEAU_SCHED_JOB_TIMEOUT_MS);
+	const long timeout = msecs_to_jiffies(NOUVEAU_SCHED_JOB_TIMEOUT_MS);
 	int ret;
 
 	if (!wq) {
@@ -418,7 +418,7 @@ nouveau_sched_init(struct nouveau_sched *sched, struct nouveau_drm *drm,
 
 	ret = drm_sched_init(drm_sched, &nouveau_sched_ops, wq,
 			     NOUVEAU_SCHED_PRIORITY_COUNT,
-			     credit_limit, 0, job_hang_limit,
+			     credit_limit, 0, timeout,
 			     NULL, NULL, "nouveau_sched", drm->dev->dev);
 	if (ret)
 		goto fail_wq;
-- 
2.45.0

