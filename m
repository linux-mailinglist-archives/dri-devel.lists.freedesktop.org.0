Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 91C09AFE850
	for <lists+dri-devel@lfdr.de>; Wed,  9 Jul 2025 13:53:44 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id EDA4F10E7B7;
	Wed,  9 Jul 2025 11:53:42 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=kernel.org header.i=@kernel.org header.b="p9vmiO0w";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from tor.source.kernel.org (tor.source.kernel.org [172.105.4.254])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 752AC10E7B4;
 Wed,  9 Jul 2025 11:53:41 +0000 (UTC)
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
 by tor.source.kernel.org (Postfix) with ESMTP id E6B68614AD;
 Wed,  9 Jul 2025 11:53:40 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id C3875C4CEEF;
 Wed,  9 Jul 2025 11:53:36 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=k20201202; t=1752062020;
 bh=Jr45GDaF+42wl4BEFdHS/S6QGGlCSlKcGecFU5CGZvo=;
 h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
 b=p9vmiO0wJGy+be/TMUQ/D2XXdl/jmSvqoVU39tj/aVdyp06EAhivoC75sjpqg+XTM
 pI7O8kCdTiEACr4GdnrvuJ9zwC2A77BJqVOdJnxkQ7OytBTlBd9MEOXlcwmghk1iGg
 zEVxT7GizIyW3TI9pmROs7+CHOAkYfckYkFUPMfpnDkDPFXM+aoUbor6WVKdELYvJI
 jWVYYHkUeHYQ4mkYcS7fHURDki+nZkvdI3IubfzNs+dhFrBJB5aazdB4EnDkiIU1zb
 bjI4IzyQSqEVWuIGm7I0e5NjkrwmYikbFhbvlkPYl8KUIV4ZeO5ZzF7Ax/HWVgOHzV
 SIrkeYMymZAfA==
From: Philipp Stanner <phasta@kernel.org>
To: Lyude Paul <lyude@redhat.com>, Danilo Krummrich <dakr@kernel.org>,
 David Airlie <airlied@gmail.com>, Simona Vetter <simona@ffwll.ch>,
 Matthew Brost <matthew.brost@intel.com>,
 Philipp Stanner <phasta@kernel.org>,
 =?UTF-8?q?Christian=20K=C3=B6nig?= <ckoenig.leichtzumerken@gmail.com>,
 Maarten Lankhorst <maarten.lankhorst@linux.intel.com>,
 Maxime Ripard <mripard@kernel.org>,
 Thomas Zimmermann <tzimmermann@suse.de>,
 Sumit Semwal <sumit.semwal@linaro.org>,
 Tvrtko Ursulin <tvrtko.ursulin@igalia.com>,
 Pierre-Eric Pelloux-Prayer <pierre-eric.pelloux-prayer@amd.com>
Cc: dri-devel@lists.freedesktop.org, nouveau@lists.freedesktop.org,
 linux-kernel@vger.kernel.org, linux-media@vger.kernel.org
Subject: [PATCH v3 4/7] drm/sched: Warn if pending_list is not empty
Date: Wed,  9 Jul 2025 13:52:54 +0200
Message-ID: <20250709115257.106370-6-phasta@kernel.org>
X-Mailer: git-send-email 2.49.0
In-Reply-To: <20250709115257.106370-2-phasta@kernel.org>
References: <20250709115257.106370-2-phasta@kernel.org>
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
index a971f0c9e6e0..93cb74c0ccf8 100644
--- a/drivers/gpu/drm/scheduler/sched_main.c
+++ b/drivers/gpu/drm/scheduler/sched_main.c
@@ -1414,6 +1414,9 @@ void drm_sched_fini(struct drm_gpu_scheduler *sched)
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

