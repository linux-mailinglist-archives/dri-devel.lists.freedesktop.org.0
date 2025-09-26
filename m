Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 7A531BA3A3C
	for <lists+dri-devel@lfdr.de>; Fri, 26 Sep 2025 14:36:54 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 5400710EA4A;
	Fri, 26 Sep 2025 12:36:52 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=kernel.org header.i=@kernel.org header.b="DZbFko8d";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from tor.source.kernel.org (tor.source.kernel.org [172.105.4.254])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 7F3E110EA4A
 for <dri-devel@lists.freedesktop.org>; Fri, 26 Sep 2025 12:36:51 +0000 (UTC)
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
 by tor.source.kernel.org (Postfix) with ESMTP id 7A8AB61D5D;
 Fri, 26 Sep 2025 12:36:50 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id A54E1C4CEF4;
 Fri, 26 Sep 2025 12:36:48 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=k20201202; t=1758890210;
 bh=6J7ciNSyBqrMlRToLA4gwKqu2Yswr/KFx9veRorLzXk=;
 h=From:To:Cc:Subject:Date:From;
 b=DZbFko8dNr2VjhRUujjLQPi+jLQusq9B/622cZGoJ/ZUqax/uxvGCGrHDzALMdRDA
 8kvund8T5Ym0W2vuHPejFNTC97S8/aa8Dej+xiNDRaI4dYLTbFpspjeAUYfjkiRg1q
 JFN2/MfAU/V6fPtyz7IwpC83rb1naHgMB1T1IWOiolsTKCwuiRuY0MTBXZdrtoGF6x
 fNWFf4B9LvwOKduH31ynODRPxSZquiFWvlJvq/5sXpk2jg9UTClPbLZHVce9wTYCvo
 wZdcuKnyZW5DV775F/DQsJy4taP5PSQfgdJuaEp7wbintjcv4G3CUIdH0b+ySU2e+8
 8ZtQC9Z7wSwfA==
From: Philipp Stanner <phasta@kernel.org>
To: Matthew Brost <matthew.brost@intel.com>,
 Danilo Krummrich <dakr@kernel.org>, Philipp Stanner <phasta@kernel.org>,
 =?UTF-8?q?Christian=20K=C3=B6nig?= <ckoenig.leichtzumerken@gmail.com>
Cc: dri-devel@lists.freedesktop.org,
	linux-kernel@vger.kernel.org
Subject: [PATCH] drm/sched: Mandate usage of drm_sched_job_cleanup()
Date: Fri, 26 Sep 2025 14:36:31 +0200
Message-ID: <20250926123630.200920-2-phasta@kernel.org>
X-Mailer: git-send-email 2.49.0
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

drm_sched_job_cleanup()'s documentation so far uses relatively soft
language, only "recommending" usage of the function. To avoid memory
leaks and, potentiall, other bugs, however, the function has to be used.

Demand usage of the function explicitly.

Signed-off-by: Philipp Stanner <phasta@kernel.org>
---
 drivers/gpu/drm/scheduler/sched_main.c | 4 ++--
 1 file changed, 2 insertions(+), 2 deletions(-)

diff --git a/drivers/gpu/drm/scheduler/sched_main.c b/drivers/gpu/drm/scheduler/sched_main.c
index 46119aacb809..0a9df9e61963 100644
--- a/drivers/gpu/drm/scheduler/sched_main.c
+++ b/drivers/gpu/drm/scheduler/sched_main.c
@@ -1030,7 +1030,7 @@ EXPORT_SYMBOL(drm_sched_job_has_dependency);
  *
  * Cleans up the resources allocated with drm_sched_job_init().
  *
- * Drivers should call this from their error unwind code if @job is aborted
+ * Drivers need to call this from their error unwind code if @job is aborted
  * before drm_sched_job_arm() is called.
  *
  * drm_sched_job_arm() is a point of no return since it initializes the fences
@@ -1038,7 +1038,7 @@ EXPORT_SYMBOL(drm_sched_job_has_dependency);
  * submit it with drm_sched_entity_push_job() and cannot simply abort it by
  * calling drm_sched_job_cleanup().
  *
- * This function should be called in the &drm_sched_backend_ops.free_job callback.
+ * This function must be called in the &drm_sched_backend_ops.free_job callback.
  */
 void drm_sched_job_cleanup(struct drm_sched_job *job)
 {
-- 
2.49.0

