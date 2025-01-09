Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 36AFEA077AB
	for <lists+dri-devel@lfdr.de>; Thu,  9 Jan 2025 14:37:59 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id AC02110EDD9;
	Thu,  9 Jan 2025 13:37:57 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=kernel.org header.i=@kernel.org header.b="eBxECzfY";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from nyc.source.kernel.org (nyc.source.kernel.org [147.75.193.91])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 94B1710EDD8
 for <dri-devel@lists.freedesktop.org>; Thu,  9 Jan 2025 13:37:56 +0000 (UTC)
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
 by nyc.source.kernel.org (Postfix) with ESMTP id 3071AA41C22;
 Thu,  9 Jan 2025 13:36:07 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id BF62DC4CED6;
 Thu,  9 Jan 2025 13:37:51 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=k20201202; t=1736429875;
 bh=LgjK5otK9P6hpjfRdyg4uWgSBqeILjXkQz1XpFuvanw=;
 h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
 b=eBxECzfYF4678L25cL1r2fdL8TWtMa52UFDMNYkZYySzChzumDIDjul2h8jIFHRHK
 R+YBlFIlSB2FsC5xaQabz+58qy3cQS0DKAkOUUQHxhSgx2kGV9qxKmsC4sBQu22agu
 Szw3PSltjgwwpSUizd1nv9SSUDp9+2n6pvQzgYNyZ8j/KzwsnFbupsoXY12j9wEaZy
 M+lAsak2e3mCzuG8faVsPWm2DRuILw5F3W13me+Wnx0Me3ekGZg7YetCWW3v+IrfhP
 72m5kyEYX5J5qUS6KMYnV4JA5auNvmT4gW4WAryRkBJPM35kdnqsumKgI1okyo3qzQ
 FY7o2+iOnEENg==
From: Philipp Stanner <phasta@kernel.org>
To: Luben Tuikov <ltuikov89@gmail.com>,
 Matthew Brost <matthew.brost@intel.com>,
 Danilo Krummrich <dakr@kernel.org>, Philipp Stanner <pstanner@redhat.com>,
 Maarten Lankhorst <maarten.lankhorst@linux.intel.com>,
 Maxime Ripard <mripard@kernel.org>,
 Thomas Zimmermann <tzimmermann@suse.de>, David Airlie <airlied@gmail.com>,
 Simona Vetter <simona@ffwll.ch>, Sumit Semwal <sumit.semwal@linaro.org>,
 =?UTF-8?q?Christian=20K=C3=B6nig?= <christian.koenig@amd.com>
Cc: dri-devel@lists.freedesktop.org, linux-kernel@vger.kernel.org,
 linux-media@vger.kernel.org, linaro-mm-sig@lists.linaro.org,
 Philipp Stanner <phasta@kernel.org>
Subject: [PATCH 2/3] drm/sched: Adjust outdated docu for run_job()
Date: Thu,  9 Jan 2025 14:37:11 +0100
Message-ID: <20250109133710.39404-5-phasta@kernel.org>
X-Mailer: git-send-email 2.47.1
In-Reply-To: <20250109133710.39404-2-phasta@kernel.org>
References: <20250109133710.39404-2-phasta@kernel.org>
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

The documentation for drm_sched_backend_ops.run_job() mentions a certain
function called drm_sched_job_recovery(). This function does not exist.
What's actually meant is drm_sched_resubmit_jobs(), which is by now also
deprecated.

Remove the mention of the deprecated function.

Discourage the behavior of drm_sched_backend_ops.run_job() being called
multiple times for the same job.

Signed-off-by: Philipp Stanner <phasta@kernel.org>
---
 include/drm/gpu_scheduler.h | 9 ++++++---
 1 file changed, 6 insertions(+), 3 deletions(-)

diff --git a/include/drm/gpu_scheduler.h b/include/drm/gpu_scheduler.h
index d5cd2a78f27c..c4e65f9f7f22 100644
--- a/include/drm/gpu_scheduler.h
+++ b/include/drm/gpu_scheduler.h
@@ -421,9 +421,12 @@ struct drm_sched_backend_ops {
 
 	/**
 	 * @run_job: Called to execute the job once all of the dependencies
-	 * have been resolved. This may be called multiple times, if
-	 * timedout_job() has happened and drm_sched_job_recovery() decides to
-	 * try it again.
+	 * have been resolved.
+	 *
+	 * The deprecated drm_sched_resubmit_jobs() (called from
+	 * drm_sched_backend_ops.timedout_job()) can invoke this again with the
+	 * same parameters. Doing this is strongly discouraged because it
+	 * violates dma_fence rules.
 	 *
 	 * @sched_job: the job to run
 	 *
-- 
2.47.1

