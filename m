Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id B91FA60C447
	for <lists+dri-devel@lfdr.de>; Tue, 25 Oct 2022 08:55:26 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 23CE310E164;
	Tue, 25 Oct 2022 06:54:15 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-pj1-x1031.google.com (mail-pj1-x1031.google.com
 [IPv6:2607:f8b0:4864:20::1031])
 by gabe.freedesktop.org (Postfix) with ESMTPS id D9F1810E0FC
 for <dri-devel@lists.freedesktop.org>; Tue, 25 Oct 2022 06:19:00 +0000 (UTC)
Received: by mail-pj1-x1031.google.com with SMTP id
 r61-20020a17090a43c300b00212f4e9cccdso6111894pjg.5
 for <dri-devel@lists.freedesktop.org>; Mon, 24 Oct 2022 23:19:00 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20210112;
 h=content-transfer-encoding:mime-version:message-id:date:subject:cc
 :to:from:from:to:cc:subject:date:message-id:reply-to;
 bh=12QBAJ7DmLqyQWnHrdks60L8hd98m3eMBCj+hNYftI0=;
 b=InODbJj4Fj/eiKetwOgrodIX0PxWjCUlX16/H+OhnS89EDFUjGlPs3yDws2Ax4LbYo
 svkJpAR/ZX/jWAra79lJBxfYLaem0Gg+Hq/hA80MiFvfwiOe9U5wtzcfOfCCj1ANX9Z3
 sh0sVLZY8qSADqafobTn+a6dGnsPvR04iCnTr+HBy/491Y2DB6z4ySJovE/Pjge1cMCJ
 N7RtJdXexVoxTIQJY/la4v7RKPLiOa+upOi6j2xhTwwBJdtT20ed9EAkAvJa4GlZhlPU
 LaeAjvEytdwfV8C8+FAUWfU1YjSVd51s2Bl5+ijeXSQtaVNJlklC+bcazDNN+ciN36Y9
 COvg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=content-transfer-encoding:mime-version:message-id:date:subject:cc
 :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
 :reply-to;
 bh=12QBAJ7DmLqyQWnHrdks60L8hd98m3eMBCj+hNYftI0=;
 b=yCoYYA0epI2fUNqyHN1xDLAucyN10LM9WYvOI6nvfvpOLDGoLZGF09Z+B7f/waUj1L
 uorRcSgQ7Okgl/RRG/Jg9ZWY2HM+DugvDPdEP8xzPhlJUdZxmWXcE4Il7jHag5nTY3pI
 TYYIq13Fg83/avtDlQAVON+t5MTjxlZCm//TailiuDYvB6VLc12BRSd6YWiQMdNzIZ0Q
 V48wUOiuj5tPtNkuIJgjzU5oPcSHhwWtv2MR0ob7hFo4MC38AWCrQ+QxXtkRuGF3U5hb
 j/TzOd0pwkMH4AhzW6CnYjKg3THwSft3mOYwTqg/SFbanrFJ6RtmEE2M/bJrpJkalaGb
 /Qkg==
X-Gm-Message-State: ACrzQf2ohuDC6ewAbz2PT+XMXtMoV2GozHLTyFUnR4ZavJH3L1hxGzyy
 rYl3AL9tLmFMeKwvRrzy7Ok=
X-Google-Smtp-Source: AMsMyM5p5tpQvnFbyquz5tYj/STP6Kb+hIKXV83kT0DLWXB4Z1ZgRcWqs/UnY7b7yl/qYSSewOG02Q==
X-Received: by 2002:a17:902:f34b:b0:186:abd0:93ff with SMTP id
 q11-20020a170902f34b00b00186abd093ffmr8063636ple.56.1666678740372; 
 Mon, 24 Oct 2022 23:19:00 -0700 (PDT)
Received: from b-7000.. ([103.7.29.103]) by smtp.gmail.com with ESMTPSA id
 me2-20020a17090b17c200b0020d9df9610bsm4830047pjb.19.2022.10.24.23.18.58
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Mon, 24 Oct 2022 23:19:00 -0700 (PDT)
From: brolerliew <brolerliew@gmail.com>
To: 
Subject: [PATCH] drm/scheduler: set current_entity to next when remove from rq
Date: Tue, 25 Oct 2022 14:18:46 +0800
Message-Id: <20221025061846.447975-1-brolerliew@gmail.com>
X-Mailer: git-send-email 2.34.1
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Mailman-Approved-At: Tue, 25 Oct 2022 06:54:01 +0000
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
Cc: Andrey Grodzovsky <andrey.grodzovsky@amd.com>, brolerliew@gmail.com,
 linux-kernel@vger.kernel.org, dri-devel@lists.freedesktop.org
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

When entity move from one rq to another, current_entity will be set to NULL
if it is the moving entity. This make entities close to rq head got
selected more frequently, especially when doing load balance between
multiple drm_gpu_scheduler.

Make current_entity to next when removing from rq.

Signed-off-by: brolerliew <brolerliew@gmail.com>
---
 drivers/gpu/drm/scheduler/sched_main.c | 5 +++--
 1 file changed, 3 insertions(+), 2 deletions(-)

diff --git a/drivers/gpu/drm/scheduler/sched_main.c b/drivers/gpu/drm/scheduler/sched_main.c
index 2fab218d7082..00b22cc50f08 100644
--- a/drivers/gpu/drm/scheduler/sched_main.c
+++ b/drivers/gpu/drm/scheduler/sched_main.c
@@ -168,10 +168,11 @@ void drm_sched_rq_remove_entity(struct drm_sched_rq *rq,
 	spin_lock(&rq->lock);
 
 	atomic_dec(rq->sched->score);
-	list_del_init(&entity->list);
 
 	if (rq->current_entity == entity)
-		rq->current_entity = NULL;
+		rq->current_entity = list_next_entry(entity, list);
+
+	list_del_init(&entity->list);
 
 	if (drm_sched_policy == DRM_SCHED_POLICY_FIFO)
 		drm_sched_rq_remove_fifo_locked(entity);
-- 
2.34.1

