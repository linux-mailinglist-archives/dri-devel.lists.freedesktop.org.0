Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id C87136E5E2D
	for <lists+dri-devel@lfdr.de>; Tue, 18 Apr 2023 12:05:08 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id B3C7310E73B;
	Tue, 18 Apr 2023 10:05:03 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from us-smtp-delivery-124.mimecast.com
 (us-smtp-delivery-124.mimecast.com [170.10.133.124])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 429EF10E73B
 for <dri-devel@lists.freedesktop.org>; Tue, 18 Apr 2023 10:05:02 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1681812300;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding;
 bh=kkPmtUJM/y/8ZMLgmPzrDpSz/aD5s4kTz4AWJ+kwyns=;
 b=bO8R5fHgL2eWJ4ENTY06teG28ew467rr0XoqvHCvGyaUQ8J11DHh3lKQyWeZSDK7MbrMou
 RaW0V4vyHd+d0yhVGhTo3cw28+DxIYh9jzt4z0RqtAWWUOLR6TLLt8+o03/w/Nf2sCLaN8
 Ph8kCvWjeSBrL/2MEoWXpPWYXUJMe98=
Received: from mail-ej1-f70.google.com (mail-ej1-f70.google.com
 [209.85.218.70]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_256_GCM_SHA384) id
 us-mta-622-sbt8mS7ROjGhra4flKIOVw-1; Tue, 18 Apr 2023 06:04:58 -0400
X-MC-Unique: sbt8mS7ROjGhra4flKIOVw-1
Received: by mail-ej1-f70.google.com with SMTP id
 e23-20020a170906375700b0094ed5ffb83fso4319996ejc.1
 for <dri-devel@lists.freedesktop.org>; Tue, 18 Apr 2023 03:04:58 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20221208; t=1681812297; x=1684404297;
 h=content-transfer-encoding:mime-version:message-id:date:subject:cc
 :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
 :reply-to;
 bh=kkPmtUJM/y/8ZMLgmPzrDpSz/aD5s4kTz4AWJ+kwyns=;
 b=Mi416lj00vqMHsFzUaGJqV/Jfq/pyfaW7FhREg8LES6zsu4DyxYev3ybhzjkblWiEq
 ZUTiOPuBhd2KbrF/cbvMiCPolmI1GemIhDzkHVYWT4+qj7cQOigwWw6917bOWp4dQ2OO
 WDzLAetcIKLWu3ROXs59HRxTp9q7EZe/N/VrBAUwg6hT8yV0BhuX1ICLCoKCs8v5gDlg
 tgdOkjItJobv0td7RVIRbkQQD4f/vTRwiC+2sLY8xLbrrAJaPQF3vFhFnshqQ5ykg4tH
 P/IlGbKPcvEOqT0FT/AJJJmArFQXiebD+2SBlZ5L02sD2STB4caCm1n8Jf5x6XdCJIc8
 8xKA==
X-Gm-Message-State: AAQBX9fJJxMEv8ALg36krWG40A/INfzbPwnsa/yHuJb+TeN/celFrgoI
 Bh2VWGDh5IVbrLHpBeUHVc8YeJxjKivmPIzWB9zIKFQJOmA6KuPEEdb4G88n5F08d1DznhCcOZX
 SnsTxpqdcVRAzE5yoC3iWUUDfEVGmhmjKkvNd
X-Received: by 2002:a17:906:f6cd:b0:94f:3bf7:dacf with SMTP id
 jo13-20020a170906f6cd00b0094f3bf7dacfmr7523194ejb.71.1681812297377; 
 Tue, 18 Apr 2023 03:04:57 -0700 (PDT)
X-Google-Smtp-Source: AKy350a+XHfJpZZVIUYU09ecLUdbAZs0U1PMVcoHiowslaeLzqa8MByKR7gSpV0az5yz9+7T0p4Ipg==
X-Received: by 2002:a17:906:f6cd:b0:94f:3bf7:dacf with SMTP id
 jo13-20020a170906f6cd00b0094f3bf7dacfmr7523179ejb.71.1681812297083; 
 Tue, 18 Apr 2023 03:04:57 -0700 (PDT)
Received: from cassiopeiae.. ([2a02:810d:4b3f:de78:642:1aff:fe31:a19f])
 by smtp.gmail.com with ESMTPSA id
 q18-20020a170906361200b0094f124a37c4sm5131590ejb.18.2023.04.18.03.04.56
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Tue, 18 Apr 2023 03:04:56 -0700 (PDT)
From: Danilo Krummrich <dakr@redhat.com>
To: luben.tuikov@amd.com, airlied@gmail.com, daniel@ffwll.ch,
 l.stach@pengutronix.de, christian.koenig@amd.com
Subject: [PATCH v2] drm/scheduler: set entity to NULL in
 drm_sched_entity_pop_job()
Date: Tue, 18 Apr 2023 12:04:53 +0200
Message-Id: <20230418100453.4433-1-dakr@redhat.com>
X-Mailer: git-send-email 2.39.2
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
Cc: Danilo Krummrich <dakr@redhat.com>, linux-kernel@vger.kernel.org,
 dri-devel@lists.freedesktop.org
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

It already happend a few times that patches slipped through which
implemented access to an entity through a job that was already removed
from the entities queue. Since jobs and entities might have different
lifecycles, this can potentially cause UAF bugs.

In order to make it obvious that a jobs entity pointer shouldn't be
accessed after drm_sched_entity_pop_job() was called successfully, set
the jobs entity pointer to NULL once the job is removed from the entity
queue.

Moreover, debugging a potential NULL pointer dereference is way easier
than potentially corrupted memory through a UAF.

Signed-off-by: Danilo Krummrich <dakr@redhat.com>
---
 drivers/gpu/drm/scheduler/sched_entity.c | 6 ++++++
 drivers/gpu/drm/scheduler/sched_main.c   | 4 ++++
 2 files changed, 10 insertions(+)

diff --git a/drivers/gpu/drm/scheduler/sched_entity.c b/drivers/gpu/drm/scheduler/sched_entity.c
index 15d04a0ec623..a9c6118e534b 100644
--- a/drivers/gpu/drm/scheduler/sched_entity.c
+++ b/drivers/gpu/drm/scheduler/sched_entity.c
@@ -448,6 +448,12 @@ struct drm_sched_job *drm_sched_entity_pop_job(struct drm_sched_entity *entity)
 			drm_sched_rq_update_fifo(entity, next->submit_ts);
 	}
 
+	/* Jobs and entities might have different lifecycles. Since we're
+	 * removing the job from the entities queue, set the jobs entity pointer
+	 * to NULL to prevent any future access of the entity through this job.
+	 */
+	sched_job->entity = NULL;
+
 	return sched_job;
 }
 
diff --git a/drivers/gpu/drm/scheduler/sched_main.c b/drivers/gpu/drm/scheduler/sched_main.c
index 9b16480686f6..e89a3e469cd5 100644
--- a/drivers/gpu/drm/scheduler/sched_main.c
+++ b/drivers/gpu/drm/scheduler/sched_main.c
@@ -42,6 +42,10 @@
  *    the hardware.
  *
  * The jobs in a entity are always scheduled in the order that they were pushed.
+ *
+ * Note that once a job was taken from the entities queue and pushed to the
+ * hardware, i.e. the pending queue, the entity must not be referenced anymore
+ * through the jobs entity pointer.
  */
 
 #include <linux/kthread.h>
-- 
2.39.2

