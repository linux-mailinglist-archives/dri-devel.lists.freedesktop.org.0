Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 29BC6BD9FAC
	for <lists+dri-devel@lfdr.de>; Tue, 14 Oct 2025 16:24:37 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 657B010E147;
	Tue, 14 Oct 2025 14:24:34 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=gmail.com header.i=@gmail.com header.b="IyDFVcj6";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-wr1-f54.google.com (mail-wr1-f54.google.com
 [209.85.221.54])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 7623E10E147
 for <dri-devel@lists.freedesktop.org>; Tue, 14 Oct 2025 14:24:33 +0000 (UTC)
Received: by mail-wr1-f54.google.com with SMTP id
 ffacd0b85a97d-3ece0e4c5faso5075673f8f.1
 for <dri-devel@lists.freedesktop.org>; Tue, 14 Oct 2025 07:24:33 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20230601; t=1760451872; x=1761056672; darn=lists.freedesktop.org;
 h=content-transfer-encoding:mime-version:message-id:date:subject:to
 :from:from:to:cc:subject:date:message-id:reply-to;
 bh=YmYOdXmvUnpDibgncHAF8BFYMZOXQP0i3fyVp1EB78g=;
 b=IyDFVcj6dzUsIeLjoDNtzAuYZOqgY06eV5VZxVpR+rZdaFPqQsnDvcIzsBBW8LnVUH
 IchVakY8/PwHqXgak3cHi2SGyDuo95eckLaXj16hHR4vp9KRgOhEzPftufFzH2ZFa4aR
 VRbBuAfy2NEBbEAvDfWlE5BflCQ6+hICzGtd0BQb7BG215PUOWTHF1zWHMsOyqc/cTTB
 ba8CgjIkGFHlg0NfQy+mYVExOrr4kBNpe8VTcI2bpNSJw0oCr/gfeMmWJl7BgfzGHS+A
 K3NxslLrFWo3fDyBfJJu3oNAsCmw2VQ43nPvj60p/tSwiYSDV2aqSUXQllik9gf9QmA8
 5YKQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1760451872; x=1761056672;
 h=content-transfer-encoding:mime-version:message-id:date:subject:to
 :from:x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
 bh=YmYOdXmvUnpDibgncHAF8BFYMZOXQP0i3fyVp1EB78g=;
 b=qlaEO1pYXOAAkyr2/pQ4/e1XTt2g0W6ghd9RLvm03IfL5axBtHbWRsoOgNW3C+SmV3
 HcAtzyzVp1cgAMFNsPzbPdP/cHjSSBokjGfe3KGM/fqapfSnzoZfa/bTL1EP3e4bp5Cs
 ++0wt8d0pUkYRAbaLz5eI4PiKdt3z4YDhM9PlU6hgyQEKwL2fYX03ejf2BQEmqHnkOSy
 1KHb8sKnATUWYYfTqZFQ7IAwTgAgEey6ZI68OqBsxHYyr2atqd0gxfj8LoV/JIl7B5eg
 UmfS1ckG8d6zd7wfOjEibwMD6015TmQg/iavoiN1OaSDN8xrfscNd0uwCYd7aCvtcx9R
 zuJQ==
X-Forwarded-Encrypted: i=1;
 AJvYcCVhhvwE+e8GaGpqdgAXxoPLQeGmD577yMYGqI7kGlW5bbX9IQN7luhPZQtXTnSsQV7uscUXq81o44s=@lists.freedesktop.org
X-Gm-Message-State: AOJu0YxcwzxsgSUmrbfpYDYk4TbmbEi+NMbW1gTXeY9aC5fFLcj8ujLu
 SYj/Pp4v1MBkcf1Csjp4A3MyF/v/oc7BbqlvXN4IC+gDlt6131FQ7c+1
X-Gm-Gg: ASbGncsk4SQ0zOOW6oPpqc9KDMc+qGjkLvYSmKghHasKZPt5yR64M6fzQJCaBSu6t1E
 g4jSeVz+dnjys0/rEak5lTzPO0zxDET/p96tThu0tRiuSuYY9LbEqWksT83MfmtRJ/6Uxgz3BkD
 oum9Ws4kfHVppQim7Q63LDhWqm+w1xpr9GQ/EtsOPbp0VhP5o9a9G/rXnpy33SXCJAdJXHZkSLV
 Dq6xI81EWeSCjzNH5yXClRDZ0h4ZaJuNsYve68iJPbNlq5GbH3niLff8xFr9AwoMFfTfSbas6rf
 qcjy2rcjzozK467qpTUZNGpJp6R2ZdBBCgrlt+WRxM++2jslEFb4iU9LLBOsjyE+wRgbmGP5xP0
 iFbcT+jz4gYCOXhQACvCZmRfhMysmyU0gKs/wZH6/JAmXjy4zg7MpuPnCfLhcD5YU
X-Google-Smtp-Source: AGHT+IGQIDcULRaG+dw8290Kkmq7/9E3B1rRIqp66Y1KR3RKEaO0jj8O9jKx23OvQBdR/JiXdCQJlQ==
X-Received: by 2002:a05:6000:40c7:b0:411:3c14:3aac with SMTP id
 ffacd0b85a97d-42666ac43a0mr13335486f8f.7.1760451871619; 
 Tue, 14 Oct 2025 07:24:31 -0700 (PDT)
Received: from able.fritz.box ([2a00:e180:1531:a00:26a0:8196:c95f:7900])
 by smtp.gmail.com with ESMTPSA id
 ffacd0b85a97d-426ce5e10e8sm23898832f8f.39.2025.10.14.07.24.30
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Tue, 14 Oct 2025 07:24:31 -0700 (PDT)
From: "=?UTF-8?q?Christian=20K=C3=B6nig?=" <ckoenig.leichtzumerken@gmail.com>
X-Google-Original-From: =?UTF-8?q?Christian=20K=C3=B6nig?=
 <christian.koenig@amd.com>
To: matthew.brost@intel.com, dakr@kernel.org, phasta@kernel.org,
 dri-devel@lists.freedesktop.org
Subject: [PATCH] drm/sched: avoid killing parent entity on child SIGKILL v2
Date: Tue, 14 Oct 2025 16:24:30 +0200
Message-ID: <20251014142430.2470-1-christian.koenig@amd.com>
X-Mailer: git-send-email 2.43.0
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
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
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

From: David Rosca <david.rosca@amd.com>

The DRM scheduler tracks who last uses an entity and when that process
is killed blocks all further submissions to that entity.

The problem is that we didn't tracked who initialy created an entity, so
when an process accidentially leaked its file descriptor to a child and
that child got killed we killed the parents entities.

Avoid that and instead initialize the entities last user on entity
creation.

Signed-off-by: David Rosca <david.rosca@amd.com>
Signed-off-by: Christian König <christian.koenig@amd.com>
CC: stable@vger.kernel.org
---
 drivers/gpu/drm/scheduler/sched_entity.c | 3 ++-
 1 file changed, 2 insertions(+), 1 deletion(-)

diff --git a/drivers/gpu/drm/scheduler/sched_entity.c b/drivers/gpu/drm/scheduler/sched_entity.c
index 5a4697f636f2..3e2f83dc3f24 100644
--- a/drivers/gpu/drm/scheduler/sched_entity.c
+++ b/drivers/gpu/drm/scheduler/sched_entity.c
@@ -70,6 +70,7 @@ int drm_sched_entity_init(struct drm_sched_entity *entity,
 	entity->guilty = guilty;
 	entity->num_sched_list = num_sched_list;
 	entity->priority = priority;
+	entity->last_user = current->group_leader;
 	/*
 	 * It's perfectly valid to initialize an entity without having a valid
 	 * scheduler attached. It's just not valid to use the scheduler before it
@@ -302,7 +303,7 @@ long drm_sched_entity_flush(struct drm_sched_entity *entity, long timeout)
 
 	/* For a killed process disallow further enqueueing of jobs. */
 	last_user = cmpxchg(&entity->last_user, current->group_leader, NULL);
-	if ((!last_user || last_user == current->group_leader) &&
+	if (last_user == current->group_leader &&
 	    (current->flags & PF_EXITING) && (current->exit_code == SIGKILL))
 		drm_sched_entity_kill(entity);
 
-- 
2.43.0

