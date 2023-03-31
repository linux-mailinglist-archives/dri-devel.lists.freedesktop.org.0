Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id EC9FD6D13D3
	for <lists+dri-devel@lfdr.de>; Fri, 31 Mar 2023 02:06:32 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id B859010E068;
	Fri, 31 Mar 2023 00:06:30 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from us-smtp-delivery-124.mimecast.com
 (us-smtp-delivery-124.mimecast.com [170.10.129.124])
 by gabe.freedesktop.org (Postfix) with ESMTPS id CD3E910E068
 for <dri-devel@lists.freedesktop.org>; Fri, 31 Mar 2023 00:06:28 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1680221187;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding;
 bh=YRYzYgFniGZhvmi5nnobFxQwki5yQ+bNYK75Yzixkz4=;
 b=LVwvWmrItiCfDFz7rrbZjqtwJ56v0T0lSTNl9cmwneRtYD1g73MJTWxx7htFDHaahWuLjK
 gCigvp59yUek6R31AjvOmCOikkKOm8tjuJzV+rXrqCqGljDfleaX6BVhV0ofIV8rt5RdJ7
 S5Sh3oIAtIG/LOKxKjg6Plqbb+tyupo=
Received: from mail-wr1-f71.google.com (mail-wr1-f71.google.com
 [209.85.221.71]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_256_GCM_SHA384) id
 us-mta-395-OtSKriNBOTCYrq7PSGcKaA-1; Thu, 30 Mar 2023 20:06:26 -0400
X-MC-Unique: OtSKriNBOTCYrq7PSGcKaA-1
Received: by mail-wr1-f71.google.com with SMTP id
 k16-20020adfd230000000b002cfe7555486so2202404wrh.13
 for <dri-devel@lists.freedesktop.org>; Thu, 30 Mar 2023 17:06:26 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112; t=1680221185;
 h=content-transfer-encoding:mime-version:message-id:date:subject:cc
 :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
 :reply-to;
 bh=YRYzYgFniGZhvmi5nnobFxQwki5yQ+bNYK75Yzixkz4=;
 b=WlseuKUoWLrWmp8Se8QuNTBzd6ql9MdZG5NO+k2bK3Rs1UzkhgdQOlElUguxNOrG52
 czMSslh1fWswoA2fCxS2FNa534/DlmAk2nqqsgd06L6CkNchnRJgiF10/n2O0oAiG/k2
 nQgTl8F7H5KW7+sNLurq3cjuS8CjvR0wLjzvNEYakxOUwNJAtlfzIRJhbfOscJj9U+hj
 sK9gvklabRZMz3tGglV09Ng/kMrV8sPe1mYn9ceniE4tFWbB+STGh2tFjc92m3qXSQv7
 s6Jl2U7oILUYIvMdIPSTTnNb2Mp/TE8XoVIinzee029N1ni95tnQKtJc/aFZJGkSCNGe
 vqjA==
X-Gm-Message-State: AAQBX9eR53OWx4E8w/GCrjxHwdCF+bCaUi0YHAqs+6phaMH2jqtB4VWS
 4eD21NACP2bh6SlhqZIycZOTscIi6Zd6IzdQe9djfHLYXgPahZ34MQNV0SKmEfhFWa0Ubq7rCqe
 OxJzhOBv60sOUuMUzymn6fJv8Jgt8
X-Received: by 2002:a5d:5229:0:b0:2c7:1c08:121c with SMTP id
 i9-20020a5d5229000000b002c71c08121cmr19692645wra.61.1680221185597; 
 Thu, 30 Mar 2023 17:06:25 -0700 (PDT)
X-Google-Smtp-Source: AKy350bglDYOowPykLhBMeJiilPpFbF5617zH9by5JhkVIpDXwqrgWjr0LW6yJQAzUG+HeI0ngmnFA==
X-Received: by 2002:a5d:5229:0:b0:2c7:1c08:121c with SMTP id
 i9-20020a5d5229000000b002c71c08121cmr19692638wra.61.1680221185320; 
 Thu, 30 Mar 2023 17:06:25 -0700 (PDT)
Received: from cassiopeiae.. ([2a02:810d:4b3f:de78:642:1aff:fe31:a19f])
 by smtp.gmail.com with ESMTPSA id
 g16-20020a5d5550000000b002c5598c14acsm662655wrw.6.2023.03.30.17.06.24
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Thu, 30 Mar 2023 17:06:24 -0700 (PDT)
From: Danilo Krummrich <dakr@redhat.com>
To: luben.tuikov@amd.com, airlied@gmail.com, daniel@ffwll.ch,
 l.stach@pengutronix.de, christian.koenig@amd.com
Subject: [PATCH] drm/scheduler: set entity to NULL in
 drm_sched_entity_pop_job()
Date: Fri, 31 Mar 2023 02:06:22 +0200
Message-Id: <20230331000622.4156-1-dakr@redhat.com>
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
I'm aware that drivers could already use job->entity in arbitrary places, since
they in control of when the entity is actually freed. A quick grep didn't give
me any results where this would actually be the case, however maybe I also just
didn't catch it.

If, therefore, we don't want to set job->entity to NULL I think we should at
least add a comment somewhere.
---

 drivers/gpu/drm/scheduler/sched_entity.c | 6 ++++++
 1 file changed, 6 insertions(+)

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
 
-- 
2.39.2

