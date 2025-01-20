Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id D4F9CA170D1
	for <lists+dri-devel@lfdr.de>; Mon, 20 Jan 2025 17:52:53 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id E62B010E44A;
	Mon, 20 Jan 2025 16:52:48 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=fail reason="signature verification failed" (2048-bit key; unprotected) header.d=igalia.com header.i=@igalia.com header.b="AsJ5hGvk";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from fanzine2.igalia.com (fanzine.igalia.com [178.60.130.6])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 5BD1A10E44A;
 Mon, 20 Jan 2025 16:52:47 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=igalia.com; 
 s=20170329;
 h=Content-Transfer-Encoding:Content-Type:MIME-Version:Message-ID:
 Date:Subject:Cc:To:From:Sender:Reply-To:Content-ID:Content-Description:
 Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
 In-Reply-To:References:List-Id:List-Help:List-Unsubscribe:List-Subscribe:
 List-Post:List-Owner:List-Archive;
 bh=7H4QuAlO5JKO5RCWS7k3G/YRJZbKlVzlI/O/Cw6qPb4=; b=AsJ5hGvkcinD//mMnDQNnNE0/i
 6yWqTk4onOJ2lSzqub9ypVYHKE6OwOShXQKgjHg1phAqLFjUGy3BKtm2CgjMc1JhZWquCghTja2Gn
 BLWR/yWtKhdHvuvTmTElzyEv4+Jbhd3wsXDsq3txKOBG0kpHUJsEmT+LtSiaW1cCZneiJAadI2QKg
 GZQV/i3D/A2DOD/nVF0Uq6hY+iJ3P10J0pfOA+Ys4jbdSvmisW+nZ+jLpIG9yEj5w8qX59f6XaDlL
 EXnQjAYDWiDbuqhuyQA1L3HegvM0NT8XYCzSGSjQwqgpzfxP7cH2Iiixg/przBX48cgg99BjjnL8Y
 XhhHNVxg==;
Received: from [90.241.98.187] (helo=localhost)
 by fanzine2.igalia.com with esmtpsa 
 (Cipher TLS1.3:ECDHE_SECP256R1__RSA_PSS_RSAE_SHA256__AES_256_GCM:256) (Exim)
 id 1tZv12-000v9P-Pp; Mon, 20 Jan 2025 17:52:44 +0100
From: Tvrtko Ursulin <tvrtko.ursulin@igalia.com>
To: amd-gfx@lists.freedesktop.org,
	dri-devel@lists.freedesktop.org
Cc: kernel-dev@igalia.com, Tvrtko Ursulin <tvrtko.ursulin@igalia.com>,
 =?UTF-8?q?Christian=20K=C3=B6nig?= <christian.koenig@amd.com>,
 Danilo Krummrich <dakr@kernel.org>,
 Matthew Brost <matthew.brost@intel.com>,
 Philipp Stanner <phasta@kernel.org>
Subject: [PATCH 0/4] A bit of struct drm_sched_job cleanup
Date: Mon, 20 Jan 2025 16:52:36 +0000
Message-ID: <20250120165240.9105-1-tvrtko.ursulin@igalia.com>
X-Mailer: git-send-email 2.47.1
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

At one point I thought I wanted to add a member to struct drm_sched_job. As I
noticed there is a hole in the struct, I went to re-order some members to get
rid of it (the hole), at which point I was greeted by a subtle bug cause by the
frequent pattern of:

 job = to_drm_sched_job(spsc_queue_peek|pop(...))

Because to_drm_sched_job is a container of, it implies a lot of the scheduler
(and amdgpu) assumes job->queue_node is the first struct element. Dare to change
that, code will compile but weird things will happen at runtime.

So I thought lets clean that up and remove that hardcoded sneaky assumption and
that is what this series does.

1) Adds a helper so amdgpu can touch the scheduler internals a little bit less.
2) Removes the assumption job->queue_node must be the first element.
3) And finally removes the hole from struct drm_sched_job, fixing one instance
   of type confusion in passing too.

Cc: Christian König <christian.koenig@amd.com>
Cc: Danilo Krummrich <dakr@kernel.org>
Cc: Matthew Brost <matthew.brost@intel.com>
Cc: Philipp Stanner <phasta@kernel.org>

Tvrtko Ursulin (4):
  drm/sched: Add job popping API
  drm/amdgpu: Use the new low level job popping helper
  drm/sched: Remove to_drm_sched_job internal helper
  drm/sched: Make the type of drm_sched_job->last_dependency consistent

 drivers/gpu/drm/amd/amdgpu/amdgpu_job.c  |  5 +-
 drivers/gpu/drm/scheduler/sched_entity.c | 20 ++++----
 drivers/gpu/drm/scheduler/sched_main.c   | 10 ++--
 include/drm/gpu_scheduler.h              | 59 ++++++++++++++++--------
 4 files changed, 57 insertions(+), 37 deletions(-)

-- 
2.47.1

