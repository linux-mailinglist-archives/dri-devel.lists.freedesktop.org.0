Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id D97BA97203E
	for <lists+dri-devel@lfdr.de>; Mon,  9 Sep 2024 19:19:54 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 3F44310E5FA;
	Mon,  9 Sep 2024 17:19:48 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=fail reason="signature verification failed" (2048-bit key; unprotected) header.d=igalia.com header.i=@igalia.com header.b="qqlzuzgP";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from fanzine2.igalia.com (fanzine.igalia.com [178.60.130.6])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 8B8E610E5FC;
 Mon,  9 Sep 2024 17:19:46 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=igalia.com; 
 s=20170329;
 h=Content-Transfer-Encoding:Content-Type:MIME-Version:References:
 In-Reply-To:Message-ID:Date:Subject:Cc:To:From:Sender:Reply-To:Content-ID:
 Content-Description:Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc
 :Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:List-Subscribe:
 List-Post:List-Owner:List-Archive;
 bh=V/uRjwv/oSxk2TbLebPeVs1upZjn9s8SKS0SFuzwqEg=; b=qqlzuzgPK2t3/gyLupiMNQL/+1
 orvHOxpUh4DhCgeFqVA6SAOHKDzkJu5qV2D0bRhxWGELt5QH5O1mUcZfTd94mvZfbPtQDeguD2jOR
 ctWucKYGYHLNIMcEDCUuDw4D+/7CkEQQrYbjvkE0qaniJCBHpPxj1BL6Kn+6UmPl5/S2hSt9Ljfhg
 YNCRbs/0QmEBXU/B7KzPNJeqSMFPcoqlD2ZxWBAXqM0fAZfw1cza3Vo4r1GoeRHJXNcUCmc3ryWDX
 AACohtvPwsqLTRRBMsQPmQNSMAbnVoOf5gHO8eq5ts8TxHOKxvGT0GhFk7tccJ4bQw02O7rlwsmvo
 kQwJhB2A==;
Received: from [90.241.98.187] (helo=localhost)
 by fanzine2.igalia.com with esmtpsa 
 (Cipher TLS1.3:ECDHE_SECP256R1__RSA_PSS_RSAE_SHA256__AES_256_GCM:256) (Exim)
 id 1sni3E-00Bg5G-NH; Mon, 09 Sep 2024 19:19:44 +0200
From: Tvrtko Ursulin <tursulin@igalia.com>
To: amd-gfx@lists.freedesktop.org,
	dri-devel@lists.freedesktop.org
Cc: Tvrtko Ursulin <tvrtko.ursulin@igalia.com>,
 =?UTF-8?q?Christian=20K=C3=B6nig?= <christian.koenig@amd.com>,
 Alex Deucher <alexander.deucher@amd.com>,
 Luben Tuikov <ltuikov89@gmail.com>,
 Matthew Brost <matthew.brost@intel.com>,
 Philipp Stanner <pstanner@redhat.com>
Subject: [PATCH 5/8] drm/sched: Stop setting current entity in FIFO mode
Date: Mon,  9 Sep 2024 18:19:34 +0100
Message-ID: <20240909171937.51550-6-tursulin@igalia.com>
X-Mailer: git-send-email 2.46.0
In-Reply-To: <20240909171937.51550-1-tursulin@igalia.com>
References: <20240909171937.51550-1-tursulin@igalia.com>
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
---
 drivers/gpu/drm/scheduler/sched_main.c | 1 -
 1 file changed, 1 deletion(-)

diff --git a/drivers/gpu/drm/scheduler/sched_main.c b/drivers/gpu/drm/scheduler/sched_main.c
index 10abbcefe9d8..54c5fe7a7d1d 100644
--- a/drivers/gpu/drm/scheduler/sched_main.c
+++ b/drivers/gpu/drm/scheduler/sched_main.c
@@ -356,7 +356,6 @@ drm_sched_rq_select_entity_fifo(struct drm_gpu_scheduler *sched,
 				return ERR_PTR(-ENOSPC);
 			}
 
-			rq->current_entity = entity;
 			reinit_completion(&entity->entity_idle);
 			break;
 		}
-- 
2.46.0

