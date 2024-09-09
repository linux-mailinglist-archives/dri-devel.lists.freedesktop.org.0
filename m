Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id CFDAA972043
	for <lists+dri-devel@lfdr.de>; Mon,  9 Sep 2024 19:19:57 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id E720910E606;
	Mon,  9 Sep 2024 17:19:48 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=fail reason="signature verification failed" (2048-bit key; unprotected) header.d=igalia.com header.i=@igalia.com header.b="sB+RAmMj";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from fanzine2.igalia.com (fanzine.igalia.com [178.60.130.6])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 092C710E5F2;
 Mon,  9 Sep 2024 17:19:44 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=igalia.com; 
 s=20170329;
 h=Content-Transfer-Encoding:Content-Type:MIME-Version:Message-ID:
 Date:Subject:Cc:To:From:Sender:Reply-To:Content-ID:Content-Description:
 Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
 In-Reply-To:References:List-Id:List-Help:List-Unsubscribe:List-Subscribe:
 List-Post:List-Owner:List-Archive;
 bh=kDL51pcgcRJIyeEdGU4mkHBztUhdwQBuePicEtXDHGI=; b=sB+RAmMjM3ngXRjGXKRyDWVceQ
 ugUZ84QUx/cJXkpJ8dULJAfPCL8CfGIWWFIiLyLDnBPgm6zTqRvrbCHwyESQl/SultUNQ2X7Pla7z
 pm2up1htnxdnMmARB+MPGWI5IloQxcnm/ivBVeRVSYeJWKDZkAwJWNOGaREc9R9TBZ0g5BWIMHWV2
 TeL9U3QTUCIOsAG7J0tQacO8/EyRywDWju2smFF+mcQ7YVHg/r8IM4INmu1yg00jpYt+j1uD0DwtC
 ZUKnEyWdqks722dRbP03FkeAZEcqlPnJUv9qM4R0DpnSMCtFUeshL700ad049+p2ZPvvJUQB7pe/E
 GTu0evfg==;
Received: from [90.241.98.187] (helo=localhost)
 by fanzine2.igalia.com with esmtpsa 
 (Cipher TLS1.3:ECDHE_SECP256R1__RSA_PSS_RSAE_SHA256__AES_256_GCM:256) (Exim)
 id 1sni3B-00Bg4g-0y; Mon, 09 Sep 2024 19:19:41 +0200
From: Tvrtko Ursulin <tursulin@igalia.com>
To: amd-gfx@lists.freedesktop.org,
	dri-devel@lists.freedesktop.org
Cc: Tvrtko Ursulin <tvrtko.ursulin@igalia.com>,
 =?UTF-8?q?Christian=20K=C3=B6nig?= <christian.koenig@amd.com>,
 Alex Deucher <alexander.deucher@amd.com>,
 Luben Tuikov <ltuikov89@gmail.com>,
 Matthew Brost <matthew.brost@intel.com>,
 Philipp Stanner <pstanner@redhat.com>
Subject: [PATCH v2 0/8] DRM scheduler fixes, or not, or incorrect kind
Date: Mon,  9 Sep 2024 18:19:29 +0100
Message-ID: <20240909171937.51550-1-tursulin@igalia.com>
X-Mailer: git-send-email 2.46.0
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

Re-spin of the series from two days ago with review feedback addressed and
some new patches added.

Changelog is in individual patches but essentially new patches are renames
and struct members re-ordering as discussed in v1, plus one more optimisation
when I noticed we can save another spinlock re-lock cycle this time on rq->lock.

Cc: Christian König <christian.koenig@amd.com>
Cc: Alex Deucher <alexander.deucher@amd.com>
Cc: Luben Tuikov <ltuikov89@gmail.com>
Cc: Matthew Brost <matthew.brost@intel.com>
Cc: Philipp Stanner <pstanner@redhat.com>

Tvrtko Ursulin (8):
  drm/sched: Add locking to drm_sched_entity_modify_sched
  drm/sched: Always wake up correct scheduler in
    drm_sched_entity_push_job
  drm/sched: Always increment correct scheduler score
  drm/sched: Optimise drm_sched_entity_push_job
  drm/sched: Stop setting current entity in FIFO mode
  drm/sched: Re-order struct drm_sched_rq members for clarity
  drm/sched: Re-group and rename the entity run-queue lock
  drm/sched: Further optimise drm_sched_entity_push_job

 drivers/gpu/drm/scheduler/sched_entity.c | 40 +++++++++++------
 drivers/gpu/drm/scheduler/sched_main.c   | 57 ++++++++++++++----------
 include/drm/gpu_scheduler.h              | 31 +++++++------
 3 files changed, 77 insertions(+), 51 deletions(-)

-- 
2.46.0

