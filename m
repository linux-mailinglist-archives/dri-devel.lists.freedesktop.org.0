Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 34CE99D708C
	for <lists+dri-devel@lfdr.de>; Sun, 24 Nov 2024 14:36:13 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 96F0710E4E0;
	Sun, 24 Nov 2024 13:36:11 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=kernel.org header.i=@kernel.org header.b="fTf+1NVb";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from dfw.source.kernel.org (dfw.source.kernel.org [139.178.84.217])
 by gabe.freedesktop.org (Postfix) with ESMTPS id EA92E10E4DE
 for <dri-devel@lists.freedesktop.org>; Sun, 24 Nov 2024 13:36:09 +0000 (UTC)
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
 by dfw.source.kernel.org (Postfix) with ESMTP id C05265C54AB;
 Sun, 24 Nov 2024 13:35:25 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 8ABB7C4CECC;
 Sun, 24 Nov 2024 13:36:07 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=k20201202; t=1732455369;
 bh=w23f07CrIy+GznCKbCOqwJH7ze1gmeI/5uXAH1UokYs=;
 h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
 b=fTf+1NVbG/aAjD4ZvhgX92Dpos3Vgc18DptZHyA1LEZY8VQVZQFXT190ugvzVfkQD
 +GUpzrXzdJ3nfQ6AMZrA0GmGZO7eKGFi3ShKbXjN4MjVz6dTOOsM9tLLgZf6p5BI5O
 qp9D8Gtgd+ZL439Ay3unx4SbJDoM+s9AxEGO6aT0udX+g6qBrn3tFGTqIgEWJsKAvx
 wUo7K3+ZECPQsAFCvx5jdWJRPEUMgMyAt1sopeqT27BcWYRDXUplSZPIzJH5TurhST
 RxtgnENJWTvXU6eEN14eMlwv/3+8Tdnvd3EkIRXak4P0XeuvjJ/sirap4Fg7RKm97t
 uaDK+BpbRhTnw==
From: Sasha Levin <sashal@kernel.org>
To: linux-kernel@vger.kernel.org,
	stable@vger.kernel.org
Cc: Philipp Stanner <pstanner@redhat.com>,
 =?UTF-8?q?Christian=20K=C3=B6nig?= <christian.koenig@amd.com>,
 Sasha Levin <sashal@kernel.org>, ltuikov89@gmail.com,
 matthew.brost@intel.com, dakr@kernel.org,
 maarten.lankhorst@linux.intel.com, mripard@kernel.org, tzimmermann@suse.de,
 airlied@gmail.com, simona@ffwll.ch, dri-devel@lists.freedesktop.org
Subject: [PATCH AUTOSEL 6.12 058/107] drm/sched: memset() 'job' in
 drm_sched_job_init()
Date: Sun, 24 Nov 2024 08:29:18 -0500
Message-ID: <20241124133301.3341829-58-sashal@kernel.org>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20241124133301.3341829-1-sashal@kernel.org>
References: <20241124133301.3341829-1-sashal@kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
X-stable: review
X-Patchwork-Hint: Ignore
X-stable-base: Linux 6.12.1
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

From: Philipp Stanner <pstanner@redhat.com>

[ Upstream commit 2320c9e6a768d135c7b0039995182bb1a4e4fd22 ]

drm_sched_job_init() has no control over how users allocate struct
drm_sched_job. Unfortunately, the function can also not set some struct
members such as job->sched.

This could theoretically lead to UB by users dereferencing the struct's
pointer members too early.

It is easier to debug such issues if these pointers are initialized to
NULL, so dereferencing them causes a NULL pointer exception.
Accordingly, drm_sched_entity_init() does precisely that and initializes
its struct with memset().

Initialize parameter "job" to 0 in drm_sched_job_init().

Signed-off-by: Philipp Stanner <pstanner@redhat.com>
Link: https://patchwork.freedesktop.org/patch/msgid/20241021105028.19794-2-pstanner@redhat.com
Reviewed-by: Christian König <christian.koenig@amd.com>
Signed-off-by: Sasha Levin <sashal@kernel.org>
---
 drivers/gpu/drm/scheduler/sched_main.c | 8 ++++++++
 1 file changed, 8 insertions(+)

diff --git a/drivers/gpu/drm/scheduler/sched_main.c b/drivers/gpu/drm/scheduler/sched_main.c
index e97c6c60bc96e..416590ea0dc3d 100644
--- a/drivers/gpu/drm/scheduler/sched_main.c
+++ b/drivers/gpu/drm/scheduler/sched_main.c
@@ -803,6 +803,14 @@ int drm_sched_job_init(struct drm_sched_job *job,
 		return -EINVAL;
 	}
 
+	/*
+	 * We don't know for sure how the user has allocated. Thus, zero the
+	 * struct so that unallowed (i.e., too early) usage of pointers that
+	 * this function does not set is guaranteed to lead to a NULL pointer
+	 * exception instead of UB.
+	 */
+	memset(job, 0, sizeof(*job));
+
 	job->entity = entity;
 	job->credits = credits;
 	job->s_fence = drm_sched_fence_alloc(entity, owner);
-- 
2.43.0

