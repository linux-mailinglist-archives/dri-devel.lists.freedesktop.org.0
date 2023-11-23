Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 73DF37F5EFF
	for <lists+dri-devel@lfdr.de>; Thu, 23 Nov 2023 13:24:57 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 9A3AA10E72A;
	Thu, 23 Nov 2023 12:24:55 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-qk1-x72e.google.com (mail-qk1-x72e.google.com
 [IPv6:2607:f8b0:4864:20::72e])
 by gabe.freedesktop.org (Postfix) with ESMTPS id B26AD10E72B
 for <dri-devel@lists.freedesktop.org>; Thu, 23 Nov 2023 12:24:52 +0000 (UTC)
Received: by mail-qk1-x72e.google.com with SMTP id
 af79cd13be357-77bcbc14899so44933585a.1
 for <dri-devel@lists.freedesktop.org>; Thu, 23 Nov 2023 04:24:52 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20230601; t=1700742291; x=1701347091; darn=lists.freedesktop.org;
 h=content-transfer-encoding:mime-version:message-id:date:subject:cc
 :to:from:from:to:cc:subject:date:message-id:reply-to;
 bh=RkqNFsJ4BgTtTqsnbn2ZGFyovgJBdJZm6RNGEaTIQI4=;
 b=VC9v7GQZ1V85cy3nJqM7jNpc8C3SrAcLDoNVnK+RMoUulHUd8S9ZgGuPp7+VjYY9Mz
 Kn6qN3TIONZBkiFlKWCSBsYnzf9KJBPTK56AdTEauoFOcoF3NGD08jhtMZFbI4ikPjdV
 tPUYz0KUEhIzOxwX6TMa3u2Ut6rzUo7geLD+D+iOUErFZMBxsStcO0gznFQ3c5lKceB1
 KVhI9VyPUoXKsO1S5XOws+Ajrt/Y4et3IetwNQy53vWxTk4PD/ln/4H/8DSGiIWCgbvn
 qicyfZQqMKOOwBHGtg8m/geOUWdYreEZYittWHym+6/n02zgCful2y4FhSTfmVu9vzHP
 Jwng==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1700742291; x=1701347091;
 h=content-transfer-encoding:mime-version:message-id:date:subject:cc
 :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
 :reply-to;
 bh=RkqNFsJ4BgTtTqsnbn2ZGFyovgJBdJZm6RNGEaTIQI4=;
 b=Y1Haq1m9mZUsCHXwKwy/WYMx6pIzeU/Q1l1VNHdemSKtrvIunGSwhSaXkd0FhZ5C/s
 BMUfIUAVG4kdgCFh8QFOB7AVQLZEgZkXulJRhQ1l1YWhSQ6HY0v3uCNdD3ugaVwq7LmT
 LVa0VxFTHPO/p71+FHUJ6V5k/P1FgTPPkAFC5HPZ+ofdza456Tju7iiNIQ6VBvGODHdm
 eebNfLEEpiYZTmd4Y9YEGmPJ+lCEdY7cR7zkF/o0RybNNS0EeQnFUD6EG/cJhyTLyrL4
 klRihqCXMKXkvNhOdx+b+pXQjewY0zXVbOAbGCVmIwSYH/CB/ExWFB0MknKqEpZd8mhf
 rwng==
X-Gm-Message-State: AOJu0YyjbEaAN8qD2pIRPHhx0u4mb6DFh37PnkgmErGkskk9e9G3wUDZ
 OqVHozY2Lifdw4PxidNwfza8a8iuHBN2501ttsk=
X-Google-Smtp-Source: AGHT+IHxE6mMLpb5zc8SDuzLU1MQp9st6LKe962S6d9X2fY9xibVEKeu2aidplKLH12VqRU+EicSfA==
X-Received: by 2002:a05:620a:8888:b0:774:226b:c327 with SMTP id
 qk8-20020a05620a888800b00774226bc327mr4470764qkn.67.1700742291522; 
 Thu, 23 Nov 2023 04:24:51 -0800 (PST)
Received: from localhost.localdomain ([76.65.20.140])
 by smtp.gmail.com with ESMTPSA id
 j8-20020a05620a410800b0077d622f22d3sm410953qko.127.2023.11.23.04.24.50
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Thu, 23 Nov 2023 04:24:51 -0800 (PST)
From: Luben Tuikov <ltuikov89@gmail.com>
To: Direct Rendering Infrastructure - Development
 <dri-devel@lists.freedesktop.org>
Subject: [PATCH] drm/sched: Fix bounds limiting when given a malformed entity
Date: Thu, 23 Nov 2023 07:24:23 -0500
Message-ID: <20231123122422.167832-2-ltuikov89@gmail.com>
X-Mailer: git-send-email 2.43.0
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
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
Cc: Luben Tuikov <ltuikov89@gmail.com>
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

If we're given a malformed entity in drm_sched_entity_init()--shouldn't
happen, but we verify--with out-of-bounds priority value, we set it to an
allowed value. Fix the expression which sets this limit.

Signed-off-by: Luben Tuikov <ltuikov89@gmail.com>
Fixes: 56e449603f0ac5 ("drm/sched: Convert the GPU scheduler to variable number of run-queues")
---
 drivers/gpu/drm/scheduler/sched_entity.c | 9 ++++++---
 1 file changed, 6 insertions(+), 3 deletions(-)

diff --git a/drivers/gpu/drm/scheduler/sched_entity.c b/drivers/gpu/drm/scheduler/sched_entity.c
index 4d42b1e4daa67f..20c9c561843ce1 100644
--- a/drivers/gpu/drm/scheduler/sched_entity.c
+++ b/drivers/gpu/drm/scheduler/sched_entity.c
@@ -84,9 +84,12 @@ int drm_sched_entity_init(struct drm_sched_entity *entity,
 		/* The "priority" of an entity cannot exceed the number
 		 * of run-queues of a scheduler.
 		 */
-		if (entity->priority >= sched_list[0]->num_rqs)
-			entity->priority = max_t(u32, sched_list[0]->num_rqs,
-						 DRM_SCHED_PRIORITY_MIN);
+		if (entity->priority >= sched_list[0]->num_rqs) {
+			drm_err(sched_list[0], "entity with out-of-bounds priority:%u num_rqs:%u\n",
+				entity->priority, sched_list[0]->num_rqs);
+			entity->priority = max_t(s32, (s32) sched_list[0]->num_rqs - 1,
+						 (s32) DRM_SCHED_PRIORITY_MIN);
+		}
 		entity->rq = sched_list[0]->sched_rq[entity->priority];
 	}
 

base-commit: b3c5a7de9aeb51cb19160f3f61343ed87487abde
-- 
2.43.0

