Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 0DE703C1847
	for <lists+dri-devel@lfdr.de>; Thu,  8 Jul 2021 19:38:19 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id C1C456E946;
	Thu,  8 Jul 2021 17:38:10 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-wr1-x436.google.com (mail-wr1-x436.google.com
 [IPv6:2a00:1450:4864:20::436])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 3D7036E947
 for <dri-devel@lists.freedesktop.org>; Thu,  8 Jul 2021 17:38:08 +0000 (UTC)
Received: by mail-wr1-x436.google.com with SMTP id a13so8504380wrf.10
 for <dri-devel@lists.freedesktop.org>; Thu, 08 Jul 2021 10:38:08 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ffwll.ch; s=google;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=aF+7eqin7S19iz1UaMS7J3yDc/1YnzVl0I5fw9EWIlI=;
 b=bO/n1Zkb675oqo0/mqmxMsZGEJK5fHx8vO2Qdp6XWQ13sNT986eieB+8HgrxFISvmn
 w1Rg2Av3kA57wfsywQwdtHolMQMPVlv13pjJaqC/naOXaX43wj/vMN5FQNr36btAD5CL
 OdZWTJTB2cD03BzImT/2/TGvok0NVl7zi+XOg=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=aF+7eqin7S19iz1UaMS7J3yDc/1YnzVl0I5fw9EWIlI=;
 b=M1Sce7sZ9yQ+cW5xGad/S6oTqv0NAmi7mJQr5u0+75liHTVg/Oyenude2EkPD4IswP
 DthayY5AfO71kqXX/NCHpEsXIldxh590UTfZ2rZpTlFfgDxh3cknxpxFl8ZZ8xa8MZBm
 gBsdOQYYWTIy9Hwu07JVLTlnbbZNQGfkCp44UA5PKQZx8vG/cL86fY6GFIN70UwF+aF5
 LecJmgoDvmwMPelHsj8EHidCWuIhyagwBjhBJf/NWqRJnhU8Liw73T8pfPT2Up69C+4U
 UdDXoay485fK2ovSh6xqRByvk+YcCs1+5nw18mooRGdZSXg9hxWniZbAliVFruTCtHKY
 cNMg==
X-Gm-Message-State: AOAM531xF7kOyYq1IhqajkSJw5KcHq292UlgJUJRiEmMx6X62p4NYeaj
 RPKENnDzqWLsq8b4ZPv/GOL+6AQCaiVWXg==
X-Google-Smtp-Source: ABdhPJwb5BeLFRcg8K4BNw7pXlR3MfrHpXzNoWjZEF/8JFh241KqjnY9I8YmGDoEPgePmuWZETl0ew==
X-Received: by 2002:a5d:6ac4:: with SMTP id u4mr17670499wrw.166.1625765886972; 
 Thu, 08 Jul 2021 10:38:06 -0700 (PDT)
Received: from phenom.ffwll.local ([2a02:168:57f4:0:efd0:b9e5:5ae6:c2fa])
 by smtp.gmail.com with ESMTPSA id l4sm2521853wme.26.2021.07.08.10.38.06
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Thu, 08 Jul 2021 10:38:06 -0700 (PDT)
From: Daniel Vetter <daniel.vetter@ffwll.ch>
To: DRI Development <dri-devel@lists.freedesktop.org>
Subject: [PATCH v3 01/20] drm/sched: entity->rq selection cannot fail
Date: Thu,  8 Jul 2021 19:37:35 +0200
Message-Id: <20210708173754.3877540-2-daniel.vetter@ffwll.ch>
X-Mailer: git-send-email 2.32.0
In-Reply-To: <20210708173754.3877540-1-daniel.vetter@ffwll.ch>
References: <20210708173754.3877540-1-daniel.vetter@ffwll.ch>
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
Cc: Jack Zhang <Jack.Zhang1@amd.com>, Daniel Vetter <daniel.vetter@ffwll.ch>,
 Intel Graphics Development <intel-gfx@lists.freedesktop.org>,
 Steven Price <steven.price@arm.com>, Luben Tuikov <luben.tuikov@amd.com>,
 Boris Brezillon <boris.brezillon@collabora.com>,
 Daniel Vetter <daniel.vetter@intel.com>,
 =?UTF-8?q?Christian=20K=C3=B6nig?= <christian.koenig@amd.com>
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

If it does, someone managed to set up a sched_entity without
schedulers, which is just a driver bug.

We BUG_ON() here because in the next patch drm_sched_job_init() will
be split up, with drm_sched_job_arm() never failing. And that's the
part where the rq selection will end up in.

Note that if having an empty sched_list set on an entity is indeed a
valid use-case, we can keep that check in job_init even after the split
into job_init/arm.

Signed-off-by: Daniel Vetter <daniel.vetter@intel.com>
Cc: "Christian König" <christian.koenig@amd.com>
Cc: Luben Tuikov <luben.tuikov@amd.com>
Cc: Daniel Vetter <daniel.vetter@ffwll.ch>
Cc: Steven Price <steven.price@arm.com>
Cc: Andrey Grodzovsky <andrey.grodzovsky@amd.com>
Cc: Boris Brezillon <boris.brezillon@collabora.com>
Cc: Jack Zhang <Jack.Zhang1@amd.com>
---
 drivers/gpu/drm/scheduler/sched_entity.c | 2 +-
 drivers/gpu/drm/scheduler/sched_main.c   | 3 +--
 2 files changed, 2 insertions(+), 3 deletions(-)

diff --git a/drivers/gpu/drm/scheduler/sched_entity.c b/drivers/gpu/drm/scheduler/sched_entity.c
index 79554aa4dbb1..6fc116ee7302 100644
--- a/drivers/gpu/drm/scheduler/sched_entity.c
+++ b/drivers/gpu/drm/scheduler/sched_entity.c
@@ -45,7 +45,7 @@
  * @guilty: atomic_t set to 1 when a job on this queue
  *          is found to be guilty causing a timeout
  *
- * Note: the sched_list should have at least one element to schedule
+ * Note: the sched_list must have at least one element to schedule
  *       the entity
  *
  * Returns 0 on success or a negative error code on failure.
diff --git a/drivers/gpu/drm/scheduler/sched_main.c b/drivers/gpu/drm/scheduler/sched_main.c
index 33c414d55fab..01dd47154181 100644
--- a/drivers/gpu/drm/scheduler/sched_main.c
+++ b/drivers/gpu/drm/scheduler/sched_main.c
@@ -586,8 +586,7 @@ int drm_sched_job_init(struct drm_sched_job *job,
 	struct drm_gpu_scheduler *sched;
 
 	drm_sched_entity_select_rq(entity);
-	if (!entity->rq)
-		return -ENOENT;
+	BUG_ON(!entity->rq);
 
 	sched = entity->rq->sched;
 
-- 
2.32.0

