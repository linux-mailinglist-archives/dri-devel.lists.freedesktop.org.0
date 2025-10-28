Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id B5DB9C14F36
	for <lists+dri-devel@lfdr.de>; Tue, 28 Oct 2025 14:46:20 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id D877E10E3F2;
	Tue, 28 Oct 2025 13:46:18 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=kernel.org header.i=@kernel.org header.b="Zx7oSTRF";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from sea.source.kernel.org (sea.source.kernel.org [172.234.252.31])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 0E15210E3F2
 for <dri-devel@lists.freedesktop.org>; Tue, 28 Oct 2025 13:46:17 +0000 (UTC)
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
 by sea.source.kernel.org (Postfix) with ESMTP id E953248E71;
 Tue, 28 Oct 2025 13:46:16 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 0478FC4CEF7;
 Tue, 28 Oct 2025 13:46:13 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=k20201202; t=1761659176;
 bh=w7f3xidSiMuMp3mDXJlUUc5D0wccUhU3tupiMlxaRc0=;
 h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
 b=Zx7oSTRFwurmTdWXau1Z5IYE1gJR/tV9SO4p/Ycxp5J5gqUa4EVZiXTDQw7EMmww0
 fJ7GOUecF3mfVIVyQvXD/Gn/rJ+UH6togC0DNUVAEc6v6Bdwm0TbtjyJkGmx2EC1Yx
 e4Pb6WKzbseYp8fk0qIdvvJ7n7qR7sU0hZqco4RKlUyDLBlRJOmmGxAPQqfW67/7bc
 W09jBQgot9r1DgricVqPjJ/MIM+WgBCtsNyGvo/q+//c54kQdrV++ZDInpwlxDchbR
 EkidB072S6NQlCijuPnBx8TeEivoLS9NLH6vPrIf1JlN9NuAlS0U4XnJVQHir6lN9l
 BISEH5KanAWQw==
From: Philipp Stanner <phasta@kernel.org>
To: Matthew Brost <matthew.brost@intel.com>,
 Danilo Krummrich <dakr@kernel.org>, Philipp Stanner <phasta@kernel.org>,
 =?UTF-8?q?Christian=20K=C3=B6nig?= <ckoenig.leichtzumerken@gmail.com>,
 Maarten Lankhorst <maarten.lankhorst@linux.intel.com>,
 Maxime Ripard <mripard@kernel.org>,
 Thomas Zimmermann <tzimmermann@suse.de>, David Airlie <airlied@gmail.com>,
 Simona Vetter <simona@ffwll.ch>, tursulin@ursulin.net
Cc: dri-devel@lists.freedesktop.org,
	linux-kernel@vger.kernel.org
Subject: [PATCH 1/2] drm/sched: Fix comment in drm_sched_run_job_work()
Date: Tue, 28 Oct 2025 14:46:01 +0100
Message-ID: <20251028134602.94125-3-phasta@kernel.org>
X-Mailer: git-send-email 2.49.0
In-Reply-To: <20251028134602.94125-2-phasta@kernel.org>
References: <20251028134602.94125-2-phasta@kernel.org>
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
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

drm_sched_run_job_work() contains a comment which explains that an
entity being NULL means that there is no more work to do. It can,
however, also mean that there is work, but the scheduler doesn't have
enough credits to process the jobs right now.

Provide this detail in the comment.

Signed-off-by: Philipp Stanner <phasta@kernel.org>
---
 drivers/gpu/drm/scheduler/sched_main.c | 9 +++++++--
 1 file changed, 7 insertions(+), 2 deletions(-)

diff --git a/drivers/gpu/drm/scheduler/sched_main.c b/drivers/gpu/drm/scheduler/sched_main.c
index c39f0245e3a9..492e8af639db 100644
--- a/drivers/gpu/drm/scheduler/sched_main.c
+++ b/drivers/gpu/drm/scheduler/sched_main.c
@@ -1237,8 +1237,13 @@ static void drm_sched_run_job_work(struct work_struct *w)
 
 	/* Find entity with a ready job */
 	entity = drm_sched_select_entity(sched);
-	if (!entity)
-		return;	/* No more work */
+	if (!entity) {
+		/*
+		 * Either no more work to do, or the next ready job needs more
+		 * credits than the scheduler has currently available.
+		 */
+		return;
+	}
 
 	sched_job = drm_sched_entity_pop_job(entity);
 	if (!sched_job) {
-- 
2.49.0

