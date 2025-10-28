Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 3E38BC14F39
	for <lists+dri-devel@lfdr.de>; Tue, 28 Oct 2025 14:46:26 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 6369510E3F7;
	Tue, 28 Oct 2025 13:46:24 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=kernel.org header.i=@kernel.org header.b="ILl/nI7k";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from tor.source.kernel.org (tor.source.kernel.org [172.105.4.254])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 474C510E3F6
 for <dri-devel@lists.freedesktop.org>; Tue, 28 Oct 2025 13:46:21 +0000 (UTC)
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
 by tor.source.kernel.org (Postfix) with ESMTP id 8809760398;
 Tue, 28 Oct 2025 13:46:20 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 6114EC4CEFD;
 Tue, 28 Oct 2025 13:46:17 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=k20201202; t=1761659180;
 bh=VoiscabQPRor6DkMinX+/cG24TnZhK5eJDrniLN5DIE=;
 h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
 b=ILl/nI7kFfekVqR2DFI7+J9Vg2cPFUrSZJ3SvXzxDzW11ybKisnkQ/C3oVxqk41Mp
 45yofm9nVnEgjeseh9U/naHjYrvZkNZVdpFEx5SEjVNE+iBu66XfdKxnc0MbKUL2Gg
 4rsbSoqL0dlQ0eykSGypfWH/Qy/c+3u1WS6oEwODX7h55tQsyGhrEcoNOylp4H+c1L
 sCRcouX2c+KzRMBMt5rEEXeEj0rPLlOqbYVcI2iQ1rTzn78XbP8lwokHcEWrkXsRjq
 ynqpusAbOeQY/DUJRVhdgKv5UBsaYEqNPi5Q1106Pqug51EZ4+gdiZ1lmw/coAjzKF
 2EObUYJB75QmQ==
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
Subject: [PATCH 2/2] drm/sched: Add FIXME detailing potential hang
Date: Tue, 28 Oct 2025 14:46:02 +0100
Message-ID: <20251028134602.94125-4-phasta@kernel.org>
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

If a job from a ready entity needs more credits than are currently
available, drm_sched_run_job_work() (a work item) simply returns and
doesn't reschedule itself. The scheduler is only woken up again when the
next job gets pushed with drm_sched_entity_push_job().

If someone submits a job that needs too many credits and doesn't submit
more jobs afterwards, this would lead to the scheduler never pulling the
too-expensive job, effectively hanging forever.

Document this problem as a FIXME.

Signed-off-by: Philipp Stanner <phasta@kernel.org>
---
 drivers/gpu/drm/scheduler/sched_main.c | 10 ++++++++++
 1 file changed, 10 insertions(+)

diff --git a/drivers/gpu/drm/scheduler/sched_main.c b/drivers/gpu/drm/scheduler/sched_main.c
index 492e8af639db..eaf8d17b2a66 100644
--- a/drivers/gpu/drm/scheduler/sched_main.c
+++ b/drivers/gpu/drm/scheduler/sched_main.c
@@ -1237,6 +1237,16 @@ static void drm_sched_run_job_work(struct work_struct *w)
 
 	/* Find entity with a ready job */
 	entity = drm_sched_select_entity(sched);
+	/*
+	 * FIXME:
+	 * The entity can be NULL when the scheduler currently has no capacity
+	 * (credits) for more jobs. If that happens, the work item terminates
+	 * itself here, without rescheduling itself.
+	 *
+	 * It only gets started again in drm_sched_entity_push_job(). IOW, the
+	 * scheduler might hang forever if a job that needs too many credits
+	 * gets submitted to an entity and no other, subsequent jobs are.
+	 */
 	if (!entity) {
 		/*
 		 * Either no more work to do, or the next ready job needs more
-- 
2.49.0

