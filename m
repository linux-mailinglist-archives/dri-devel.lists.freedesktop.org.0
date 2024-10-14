Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 96A8799C769
	for <lists+dri-devel@lfdr.de>; Mon, 14 Oct 2024 12:47:02 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 4825A10E411;
	Mon, 14 Oct 2024 10:46:46 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=fail reason="signature verification failed" (2048-bit key; unprotected) header.d=igalia.com header.i=@igalia.com header.b="OT6ZxoZO";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from fanzine2.igalia.com (fanzine.igalia.com [178.60.130.6])
 by gabe.freedesktop.org (Postfix) with ESMTPS id CAA1810E40D
 for <dri-devel@lists.freedesktop.org>; Mon, 14 Oct 2024 10:46:42 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=igalia.com; 
 s=20170329;
 h=Content-Transfer-Encoding:Content-Type:MIME-Version:References:
 In-Reply-To:Message-ID:Date:Subject:Cc:To:From:Sender:Reply-To:Content-ID:
 Content-Description:Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc
 :Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:List-Subscribe:
 List-Post:List-Owner:List-Archive;
 bh=4QMAFCZ6I6fcS8mAh/uyYLlgonaAHrW8ni2Psawcgoo=; b=OT6ZxoZOovj0wPkXf5pdOWuKL0
 P26P7VB3Iy+XPIYW3ls+sK9UNWkPc87bVClX5rBeIpTBKj5jawmgS4RMHemjvOcDBtrpwMCVv3Y6j
 9x9jex8NkejGtpjD2hCLblmzVAXZ1A80VK2qj+Hz5eJYM+c43EnhiydI5+AAIZvHL8XpifSTke0LL
 VN8mQme+VZIVOsfBRt0C870YwCWvckPplDCxaXWbhVpESohRP5ix48gHW3DwoMETiy94rtK4wUguJ
 GZhMR0HwsNEsAb6JgBsPl1LJZRKjgluY2ofi9LlVoCZOsCYRQq/pP53jBjbEYct0mwR/U1HZjntmo
 nWloSo+w==;
Received: from [90.241.98.187] (helo=localhost)
 by fanzine2.igalia.com with esmtpsa 
 (Cipher TLS1.3:ECDHE_SECP256R1__RSA_PSS_RSAE_SHA256__AES_256_GCM:256) (Exim)
 id 1t0Ib3-009J6i-0c; Mon, 14 Oct 2024 12:46:41 +0200
From: Tvrtko Ursulin <tursulin@igalia.com>
To: dri-devel@lists.freedesktop.org
Cc: kernel-dev@igalia.com, Tvrtko Ursulin <tvrtko.ursulin@igalia.com>,
 =?UTF-8?q?Christian=20K=C3=B6nig?= <christian.koenig@amd.com>,
 Alex Deucher <alexander.deucher@amd.com>,
 Luben Tuikov <ltuikov89@gmail.com>,
 Matthew Brost <matthew.brost@intel.com>,
 Philipp Stanner <pstanner@redhat.com>
Subject: [PATCH 2/5] drm/sched: Stop setting current entity in FIFO mode
Date: Mon, 14 Oct 2024 11:46:34 +0100
Message-ID: <20241014104637.83209-3-tursulin@igalia.com>
X-Mailer: git-send-email 2.46.0
In-Reply-To: <20241014104637.83209-1-tursulin@igalia.com>
References: <20241014104637.83209-1-tursulin@igalia.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
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

From: Tvrtko Ursulin <tvrtko.ursulin@igalia.com>

It does not seem there is a need to set the current entity in FIFO mode
since ot only serves as being a "cursor" in round-robin mode. Even if
scheduling mode is changed at runtime the change in behaviour is simply
to restart from the first entity, instead of continuing in RR mode from
where FIFO left it, and that sounds completely fine.

Signed-off-by: Tvrtko Ursulin <tvrtko.ursulin@igalia.com>
Cc: Christian König <christian.koenig@amd.com>
Cc: Alex Deucher <alexander.deucher@amd.com>
Cc: Luben Tuikov <ltuikov89@gmail.com>
Cc: Matthew Brost <matthew.brost@intel.com>
Cc: Philipp Stanner <pstanner@redhat.com>
Acked-by: Christian König <christian.koenig@amd.com>
Reviewed-by: Philipp Stanner <pstanner@redhat.com>
---
 drivers/gpu/drm/scheduler/sched_main.c | 1 -
 1 file changed, 1 deletion(-)

diff --git a/drivers/gpu/drm/scheduler/sched_main.c b/drivers/gpu/drm/scheduler/sched_main.c
index bbd1630407e4..07ee386b8e4b 100644
--- a/drivers/gpu/drm/scheduler/sched_main.c
+++ b/drivers/gpu/drm/scheduler/sched_main.c
@@ -355,7 +355,6 @@ drm_sched_rq_select_entity_fifo(struct drm_gpu_scheduler *sched,
 				return ERR_PTR(-ENOSPC);
 			}
 
-			rq->current_entity = entity;
 			reinit_completion(&entity->entity_idle);
 			break;
 		}
-- 
2.46.0

