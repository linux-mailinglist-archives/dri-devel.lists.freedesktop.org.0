Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id B6462A6E2E1
	for <lists+dri-devel@lfdr.de>; Mon, 24 Mar 2025 19:59:47 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id F15AB10E4B9;
	Mon, 24 Mar 2025 18:59:45 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=kernel.org header.i=@kernel.org header.b="L17Z8LtJ";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from tor.source.kernel.org (tor.source.kernel.org [172.105.4.254])
 by gabe.freedesktop.org (Postfix) with ESMTPS id BD13E10E4B7;
 Mon, 24 Mar 2025 18:59:39 +0000 (UTC)
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
 by tor.source.kernel.org (Postfix) with ESMTP id 07786615A4;
 Mon, 24 Mar 2025 18:59:35 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 58058C4CEEA;
 Mon, 24 Mar 2025 18:59:35 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=k20201202; t=1742842778;
 bh=xhoLbq5vLDpkF7vOhtPhJa9aRN77Uui3d6RuWBdXsI8=;
 h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
 b=L17Z8LtJUZIhDsROpLic9OKSKSKVsgxhl+h6ZaPjlrMntjZvf12luHuySfvdldIMb
 H9HIptsl/RAQq/iYWI1ASRh9cWHvJbTXgd9UdbZPehLyyH8mpR5gl0U6sSjpMZGM/m
 w4NkTMRsVgukL2Zb4ncQJZBs/SBT31o+6agUzejxxB8rAINQ+CeT9Gjj/wbF0AqkMV
 fdo778tK3SeJlaxLOZ8q70TLh//c9yBQv+mHXl/7iwppe0rVSfN5lRFcdOvI+bZEOI
 WPXjEg2U5EkAl2zXk9FWYiaVHL2ymoBRrQp6dsgWAamqK6WBP2VbkpM28uuaFGz8FA
 0rFxiaBtXFpxA==
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
Subject: [RFC PATCH 3/5] drm/sched: Warn if pending list is not empty
Date: Mon, 24 Mar 2025 19:57:27 +0100
Message-ID: <20250324185728.45857-5-phasta@kernel.org>
X-Mailer: git-send-email 2.48.1
In-Reply-To: <20250324185728.45857-2-phasta@kernel.org>
References: <20250324185728.45857-2-phasta@kernel.org>
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
index 87acbcb1a821..4f8cc208a231 100644
--- a/drivers/gpu/drm/scheduler/sched_main.c
+++ b/drivers/gpu/drm/scheduler/sched_main.c
@@ -1455,6 +1455,10 @@ void drm_sched_fini(struct drm_gpu_scheduler *sched)
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

