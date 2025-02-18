Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 0179AA39C60
	for <lists+dri-devel@lfdr.de>; Tue, 18 Feb 2025 13:42:15 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 821B810E3B2;
	Tue, 18 Feb 2025 12:42:12 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=kernel.org header.i=@kernel.org header.b="SWwsQ1Nx";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from dfw.source.kernel.org (dfw.source.kernel.org [139.178.84.217])
 by gabe.freedesktop.org (Postfix) with ESMTPS id DE81910E3B2
 for <dri-devel@lists.freedesktop.org>; Tue, 18 Feb 2025 12:42:10 +0000 (UTC)
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
 by dfw.source.kernel.org (Postfix) with ESMTP id B64DA5C55D4;
 Tue, 18 Feb 2025 12:41:30 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id BED1AC4CEE9;
 Tue, 18 Feb 2025 12:42:06 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=k20201202; t=1739882529;
 bh=53+Jq1bsLhyjJZLdqY5IT9VqwmYxkNtjI8g1D826Ef4=;
 h=From:To:Cc:Subject:Date:From;
 b=SWwsQ1Nxh3mXXGdYakmphpXJbo2sg6eci213YGVqDhaz5f3lwr+BiZBjxw27oOs4O
 xOpyMCkw4erAHDEh/a6BUTwgGtvqM9zZznnNuW9wUm1+U6EHVXlA1lamPWAKzUKzRH
 4HL64AE53ualjtscUe4b5xQHq2I4LGOi+XuC3myGhuClIRkuhkgyNrfNTTfDv4PezN
 ik+TwkwLr7hQfc81L0vJuaNp+LG0MrbtaN216Pj7zn7DJMRiyUImK3MV782fbsAbM2
 hA0ISKfNuiNYYyeil9s9CMCdYzVZAn6ajghqRH6Qgu1Mhw2amWpEd4iZ8QXi7c4Ch0
 s3IxcRfG2bHqA==
From: Philipp Stanner <phasta@kernel.org>
To: Matthew Brost <matthew.brost@intel.com>,
 Danilo Krummrich <dakr@kernel.org>, Philipp Stanner <phasta@kernel.org>,
 =?UTF-8?q?Christian=20K=C3=B6nig?= <ckoenig.leichtzumerken@gmail.com>,
 Maarten Lankhorst <maarten.lankhorst@linux.intel.com>,
 Maxime Ripard <mripard@kernel.org>,
 Thomas Zimmermann <tzimmermann@suse.de>, David Airlie <airlied@gmail.com>,
 Simona Vetter <simona@ffwll.ch>, Tvrtko Ursulin <tvrtko.ursulin@igalia.com>
Cc: dri-devel@lists.freedesktop.org,
	linux-kernel@vger.kernel.org
Subject: [RFC PATCH] drm/sched: Fix preprocessor guard
Date: Tue, 18 Feb 2025 13:41:50 +0100
Message-ID: <20250218124149.118002-2-phasta@kernel.org>
X-Mailer: git-send-email 2.47.1
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

When writing the header guard for gpu_scheduler_trace.h, a typo,
apparently, occurred.

Fix the typo and document the scope of the guard.

Fixes: 353da3c520b4 ("drm/amdgpu: add tracepoint for scheduler (v2)")
Signed-off-by: Philipp Stanner <phasta@kernel.org>
---
I just discovered this. But I have little understanding of what is going
on in this header in the first place, so I kindly ask for comments on
this entire guard line with its logical or ||

The code hasn't been touched since 2015. So it seems it at least didn't
cause bugs.

P.
---
 drivers/gpu/drm/scheduler/gpu_scheduler_trace.h | 4 ++--
 1 file changed, 2 insertions(+), 2 deletions(-)

diff --git a/drivers/gpu/drm/scheduler/gpu_scheduler_trace.h b/drivers/gpu/drm/scheduler/gpu_scheduler_trace.h
index c75302ca3427..f56e77e7f6d0 100644
--- a/drivers/gpu/drm/scheduler/gpu_scheduler_trace.h
+++ b/drivers/gpu/drm/scheduler/gpu_scheduler_trace.h
@@ -21,7 +21,7 @@
  *
  */
 
-#if !defined(_GPU_SCHED_TRACE_H) || defined(TRACE_HEADER_MULTI_READ)
+#if !defined(_GPU_SCHED_TRACE_H_) || defined(TRACE_HEADER_MULTI_READ)
 #define _GPU_SCHED_TRACE_H_
 
 #include <linux/stringify.h>
@@ -106,7 +106,7 @@ TRACE_EVENT(drm_sched_job_wait_dep,
 		      __entry->seqno)
 );
 
-#endif
+#endif /* _GPU_SCHED_TRACE_H_ */
 
 /* This part must be outside protection */
 #undef TRACE_INCLUDE_PATH
-- 
2.47.1

