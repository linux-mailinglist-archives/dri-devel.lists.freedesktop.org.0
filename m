Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 562CB5F4440
	for <lists+dri-devel@lfdr.de>; Tue,  4 Oct 2022 15:28:44 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id EF89A10E6FF;
	Tue,  4 Oct 2022 13:28:37 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-ej1-x62a.google.com (mail-ej1-x62a.google.com
 [IPv6:2a00:1450:4864:20::62a])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 270F910E6FF
 for <dri-devel@lists.freedesktop.org>; Tue,  4 Oct 2022 13:28:36 +0000 (UTC)
Received: by mail-ej1-x62a.google.com with SMTP id a2so8758690ejx.10
 for <dri-devel@lists.freedesktop.org>; Tue, 04 Oct 2022 06:28:36 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20210112;
 h=content-transfer-encoding:mime-version:message-id:date:subject:cc
 :to:from:from:to:cc:subject:date;
 bh=Go9W4zTbqFzZ34YoCNazvXX7vLgKgcOS76bwfszkkAU=;
 b=ap+AZO4BmlD+PtvRU9ejrScx9pWcT5yhNBfu7wMJSxqn9jfBCxbEB9TbToNxym72/4
 ksAlytKHz4E4KS8WY0POFAo6kymIr+JqKqxwUPQBXyhaPjuTDCZuue92M/eLvUN9AlBm
 otb5WDq8wik+HAWa5nzR1MVAoOyBx7ry15E/sSabSjnTLUvA9evYGb3ZEmH9iBn1+C30
 AcUs79z1wgBc1WnQrQf7m7eR/cK8Aol3Sf6sWpDjn2zFIC5n7g2/J4gzEf6Hyo5RnHug
 LlEnlwVMKvsMGHmG46jhK/2RIJWxoObqaD/AL9NSBnUdWb8lO1IhF7GJ+UZP+qi4kbdG
 4UOw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=content-transfer-encoding:mime-version:message-id:date:subject:cc
 :to:from:x-gm-message-state:from:to:cc:subject:date;
 bh=Go9W4zTbqFzZ34YoCNazvXX7vLgKgcOS76bwfszkkAU=;
 b=PaRSP0voQ5yiDR1TB2jsFUQLEdwRtVyLwrfKdYWPMWbazxXSEsDkhcb4fZI4+py1wY
 TPs6sbe5KFq8V5byd8Nc1XDfCDkOC4gLKaFFvdWKGEXyN+9JI/kDJTxmeHuSf4KKg193
 sCTxsxTHRNjxdlmLMZEQnOC77RTawqMZ+0Mbw4TdI6R1tjOqM5PFPl/8DqUdOwDwhlNk
 JJiYmIR02UoHtu/F6fjNlkSD1Rl27vqAUpPDzR2QiAxGVqRS6Xi6gB3x7R+DnJuWIFsK
 SHRVjRH48aQ4yHFarB0Q7puMbqmvY6GHyJmmvH39PQp+XNr5wNyFXcBKgjG0PtnaYtNl
 KTdQ==
X-Gm-Message-State: ACrzQf32rkkW8EzczMioSNFGi0IfLeH3wbzO5IvVGCHZm/EV9b3XGlRW
 M9LADxHWF+iFN0mywxrWcM8=
X-Google-Smtp-Source: AMsMyM40MygiWbHGFjKA9NXN8MffnkQ412lOuO8wICKl3sKvYM5Qp14QvbPJYA7oFF24kHVxolys/g==
X-Received: by 2002:a17:907:948f:b0:78b:5a89:a23e with SMTP id
 dm15-20020a170907948f00b0078b5a89a23emr8153944ejc.421.1664890114543; 
 Tue, 04 Oct 2022 06:28:34 -0700 (PDT)
Received: from able.fritz.box (p5b0eacfe.dip0.t-ipconnect.de. [91.14.172.254])
 by smtp.gmail.com with ESMTPSA id
 r9-20020a1709061ba900b0077d6f628e14sm7015777ejg.83.2022.10.04.06.28.33
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Tue, 04 Oct 2022 06:28:33 -0700 (PDT)
From: "=?UTF-8?q?Christian=20K=C3=B6nig?=" <ckoenig.leichtzumerken@gmail.com>
X-Google-Original-From: =?UTF-8?q?Christian=20K=C3=B6nig?=
 <christian.koenig@amd.com>
To: steven.price@arm.com, Arvind.Yadav@amd.com, andrey.grodzovsky@amd.com,
 Arunpravin.PaneerSelvam@amd.com, luben.tuikov@amd.com,
 dri-devel@lists.freedesktop.org
Subject: [PATCH] drm/sched: add missing NULL check in
 drm_sched_get_cleanup_job v2
Date: Tue,  4 Oct 2022 15:28:31 +0200
Message-Id: <20221004132831.134986-1-christian.koenig@amd.com>
X-Mailer: git-send-email 2.25.1
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
Cc: =?UTF-8?q?Christian=20K=C3=B6nig?= <christian.koenig@amd.com>
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

Otherwise we would crash if the job is not resubmitted.

v2: fix second usage of s_fence->parent as well.

Signed-off-by: Christian König <christian.koenig@amd.com>
---
 drivers/gpu/drm/scheduler/sched_main.c | 5 +++--
 1 file changed, 3 insertions(+), 2 deletions(-)

diff --git a/drivers/gpu/drm/scheduler/sched_main.c b/drivers/gpu/drm/scheduler/sched_main.c
index ce86b03e8386..4cc59bae38dd 100644
--- a/drivers/gpu/drm/scheduler/sched_main.c
+++ b/drivers/gpu/drm/scheduler/sched_main.c
@@ -919,7 +919,8 @@ drm_sched_get_cleanup_job(struct drm_gpu_scheduler *sched)
 	job = list_first_entry_or_null(&sched->pending_list,
 				       struct drm_sched_job, list);
 
-	if (job && dma_fence_is_signaled(job->s_fence->parent)) {
+	if (job && (!job->s_fence->parent ||
+		    dma_fence_is_signaled(job->s_fence->parent))) {
 		/* remove job from pending_list */
 		list_del_init(&job->list);
 
@@ -929,7 +930,7 @@ drm_sched_get_cleanup_job(struct drm_gpu_scheduler *sched)
 		next = list_first_entry_or_null(&sched->pending_list,
 						typeof(*next), list);
 
-		if (next) {
+		if (next && job->s_fence->parent) {
 			next->s_fence->scheduled.timestamp =
 				job->s_fence->parent->timestamp;
 			/* start TO timer for next job */
-- 
2.25.1

