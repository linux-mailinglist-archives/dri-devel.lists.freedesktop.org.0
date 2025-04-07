Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id D274CA7E40A
	for <lists+dri-devel@lfdr.de>; Mon,  7 Apr 2025 17:23:06 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 522D910E16A;
	Mon,  7 Apr 2025 15:23:03 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=kernel.org header.i=@kernel.org header.b="Cwx8K2hA";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from dfw.source.kernel.org (dfw.source.kernel.org [139.178.84.217])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 396A710E3EE;
 Mon,  7 Apr 2025 15:23:02 +0000 (UTC)
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
 by dfw.source.kernel.org (Postfix) with ESMTP id 9AF215C24F3;
 Mon,  7 Apr 2025 15:20:44 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 7FF1FC4CEE8;
 Mon,  7 Apr 2025 15:22:58 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=k20201202; t=1744039381;
 bh=c/cHw962Afn9EFlsW0TCSyauMJFYlWb4TIDzbQnTmWc=;
 h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
 b=Cwx8K2hAA/WItU/f3PVN0MjpeYPCVFg6ErCkXbtxM5JHrPuitd9N/LA34iAjk1ZV8
 sd6BpD3IjjhRTW0TqkAYPFRZRKmoKKZ9zkVPosW+DMEQIoxLNK/lWnYPAj0ouNmBLs
 cWC/AfZ84uFY07DGjuW+MqHAR6nDl7gA6kJS8PPJJDDgY0ErNKvKXPX4SuN5wX+yJx
 w8bdd8Pwf03vO5RHZQSOhyNg3aFH4Fo0cL7Q5PT/NTXLGJFrf3AfjvdHRAiJO+Op8Q
 WBvK4POj2ni4qmSdK5QUMyucSUsR6vkT1dljWIEomlXLvEPb0ZPEvD3qqq2Nqka3wa
 bckAOm+EH+5Mg==
From: Philipp Stanner <phasta@kernel.org>
To: Lyude Paul <lyude@redhat.com>, Danilo Krummrich <dakr@kernel.org>,
 David Airlie <airlied@gmail.com>, Simona Vetter <simona@ffwll.ch>,
 Matthew Brost <matthew.brost@intel.com>,
 Philipp Stanner <phasta@kernel.org>,
 =?UTF-8?q?Christian=20K=C3=B6nig?= <ckoenig.leichtzumerken@gmail.com>,
 Maarten Lankhorst <maarten.lankhorst@linux.intel.com>,
 Maxime Ripard <mripard@kernel.org>,
 Thomas Zimmermann <tzimmermann@suse.de>,
 Tvrtko Ursulin <tvrtko.ursulin@igalia.com>
Cc: dri-devel@lists.freedesktop.org, nouveau@lists.freedesktop.org,
 linux-kernel@vger.kernel.org
Subject: [PATCH 3/5] drm/sched: Warn if pending list is not empty
Date: Mon,  7 Apr 2025 17:22:38 +0200
Message-ID: <20250407152239.34429-5-phasta@kernel.org>
X-Mailer: git-send-email 2.48.1
In-Reply-To: <20250407152239.34429-2-phasta@kernel.org>
References: <20250407152239.34429-2-phasta@kernel.org>
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

drm_sched_fini() can leak jobs under certain circumstances.

Warn if that happens.

Signed-off-by: Philipp Stanner <phasta@kernel.org>
---
 drivers/gpu/drm/scheduler/sched_main.c | 4 ++++
 1 file changed, 4 insertions(+)

diff --git a/drivers/gpu/drm/scheduler/sched_main.c b/drivers/gpu/drm/scheduler/sched_main.c
index 6b72278c4b72..ae3152beca14 100644
--- a/drivers/gpu/drm/scheduler/sched_main.c
+++ b/drivers/gpu/drm/scheduler/sched_main.c
@@ -1465,6 +1465,10 @@ void drm_sched_fini(struct drm_gpu_scheduler *sched)
 	sched->ready = false;
 	kfree(sched->sched_rq);
 	sched->sched_rq = NULL;
+
+	if (!list_empty(&sched->pending_list))
+		dev_err(sched->dev, "%s: Tearing down scheduler while jobs are pending!\n",
+			__func__);
 }
 EXPORT_SYMBOL(drm_sched_fini);
 
-- 
2.48.1

