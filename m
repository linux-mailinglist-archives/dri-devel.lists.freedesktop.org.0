Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 8213FAC0712
	for <lists+dri-devel@lfdr.de>; Thu, 22 May 2025 10:28:32 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id CCE3910EC98;
	Thu, 22 May 2025 08:28:14 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=kernel.org header.i=@kernel.org header.b="gs7uON+v";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from nyc.source.kernel.org (nyc.source.kernel.org [147.75.193.91])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 32A3F10EC62;
 Thu, 22 May 2025 08:28:10 +0000 (UTC)
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
 by nyc.source.kernel.org (Postfix) with ESMTP id 6EC53A4E4C2;
 Thu, 22 May 2025 08:28:09 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id C19ECC4CEEA;
 Thu, 22 May 2025 08:28:05 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=k20201202; t=1747902489;
 bh=kPkZtalTn6TC4lN3oTaHdbFRHY6GMTw8m4m6qeCssVE=;
 h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
 b=gs7uON+vEZevuf6v5yijtPIS7j7PNy7jlcgbPd8KXZq0ze6r2+7ne7pDGCOZl2O0n
 pJAZ16/qTBMbGYph06hWZAgz0daBvWqMrlwHxGJtMXJ1kA61nn44WDc4DBcCBliXYs
 FFoA3fVr4iAAITcHTmXQ6gu7OAErMYg75lqvcKGckMEwXQWnF9H2M2PtEG9SN67gIB
 5q7uZfrW4XWR01YfkHMKULygV8TLPGzo/IdtmE7rQVVEnrjUWyBEoKyJ73hxQUKC0f
 Gsbo0mHcwhviSUDSFryfRkL5wRIUkPGlnCOS1YqFYGDlAtK6zS8A3YlHVsueE76NgP
 egLFobbliUAeA==
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
Subject: [PATCH v3 3/5] drm/sched: Warn if pending list is not empty
Date: Thu, 22 May 2025 10:27:41 +0200
Message-ID: <20250522082742.148191-5-phasta@kernel.org>
X-Mailer: git-send-email 2.49.0
In-Reply-To: <20250522082742.148191-2-phasta@kernel.org>
References: <20250522082742.148191-2-phasta@kernel.org>
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
 drivers/gpu/drm/scheduler/sched_main.c | 3 +++
 1 file changed, 3 insertions(+)

diff --git a/drivers/gpu/drm/scheduler/sched_main.c b/drivers/gpu/drm/scheduler/sched_main.c
index 406572f5168e..48f07e6cfe2b 100644
--- a/drivers/gpu/drm/scheduler/sched_main.c
+++ b/drivers/gpu/drm/scheduler/sched_main.c
@@ -1469,6 +1469,9 @@ void drm_sched_fini(struct drm_gpu_scheduler *sched)
 	sched->ready = false;
 	kfree(sched->sched_rq);
 	sched->sched_rq = NULL;
+
+	if (!list_empty(&sched->pending_list))
+		dev_err(sched->dev, "Tearing down scheduler while jobs are pending!\n");
 }
 EXPORT_SYMBOL(drm_sched_fini);
 
-- 
2.49.0

