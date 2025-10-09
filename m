Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id D583CBC9272
	for <lists+dri-devel@lfdr.de>; Thu, 09 Oct 2025 15:00:24 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id AA6D910EA34;
	Thu,  9 Oct 2025 13:00:22 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=kernel.org header.i=@kernel.org header.b="N3rEP6Fz";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from tor.source.kernel.org (tor.source.kernel.org [172.105.4.254])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 15ADB10EA34
 for <dri-devel@lists.freedesktop.org>; Thu,  9 Oct 2025 13:00:21 +0000 (UTC)
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
 by tor.source.kernel.org (Postfix) with ESMTP id 5412B622DC;
 Thu,  9 Oct 2025 13:00:20 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 46C2CC4CEE7;
 Thu,  9 Oct 2025 13:00:17 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=k20201202; t=1760014820;
 bh=RYuJ6aT2S9Kz/9NlGFnc04Gk8G7jOeT+9XyFBA7w33Q=;
 h=From:To:Cc:Subject:Date:From;
 b=N3rEP6FzSfAMn4cxbh4kmoxpybZljYLmUfs6c4JGmsIEZx29Kfr3GVswnQHfSEwuz
 aR/wWZaw13+n0CdKmyiRNOijEtwfiS43YwE8ksL5ZW3sWPPZ0pN/RSHlNcWOM04DjN
 2f9us5pTYyP/fSo14xrZCzBu0C2sIwj3bvPsaW+fQGcSI7Bk1gkn7nYk5EPKo+QO60
 PlIvqwOlheO7EQNtWsCoYWpJpF6eFNwuCP7MkQLtnvfSxz9ctLS4msadLjdkV4TysV
 Z7imwc+jmOgw2lT3pRopjWUG6jrKY086FOPCbhjFDEZtTve8xircFe135Jf+7mj5Rg
 wOteb/OtmLo9w==
From: Philipp Stanner <phasta@kernel.org>
To: Matthew Brost <matthew.brost@intel.com>,
 Danilo Krummrich <dakr@kernel.org>, Philipp Stanner <phasta@kernel.org>,
 =?UTF-8?q?Christian=20K=C3=B6nig?= <ckoenig.leichtzumerken@gmail.com>,
 Maarten Lankhorst <maarten.lankhorst@linux.intel.com>,
 Maxime Ripard <mripard@kernel.org>,
 Thomas Zimmermann <tzimmermann@suse.de>, David Airlie <airlied@gmail.com>,
 Simona Vetter <simona@ffwll.ch>
Cc: dri-devel@lists.freedesktop.org,
	linux-kernel@vger.kernel.org
Subject: [PATCH] drm/sched: Add warning for removing hack in drm_sched_fini()
Date: Thu,  9 Oct 2025 14:59:29 +0200
Message-ID: <20251009125928.250652-2-phasta@kernel.org>
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

The assembled developers agreed at the X.Org Developers Conference that
the hack added for amdgpu in drm_sched_fini() shall be removed. It
shouldn't be needed by amdgpu anymore.

As it's unclear whether all drivers really follow the life time rule of
entities having to be torn down before their scheduler, it is reasonable
to warn for a while before removing the hack.

Add a warning in drm_sched_fini() that fires if an entity is still
active.

Signed-off-by: Philipp Stanner <phasta@kernel.org>
---
 drivers/gpu/drm/scheduler/sched_main.c | 2 ++
 1 file changed, 2 insertions(+)

diff --git a/drivers/gpu/drm/scheduler/sched_main.c b/drivers/gpu/drm/scheduler/sched_main.c
index 46119aacb809..e69917120870 100644
--- a/drivers/gpu/drm/scheduler/sched_main.c
+++ b/drivers/gpu/drm/scheduler/sched_main.c
@@ -1441,6 +1441,8 @@ void drm_sched_fini(struct drm_gpu_scheduler *sched)
 			 * drivers that keep entities alive for longer than
 			 * the scheduler.
 			 */
+			if (!s_entity->stopped)
+				dev_warn(sched->dev, "Tearing down scheduler with active entities!\n");
 			s_entity->stopped = true;
 		spin_unlock(&rq->lock);
 		kfree(sched->sched_rq[i]);
-- 
2.49.0

