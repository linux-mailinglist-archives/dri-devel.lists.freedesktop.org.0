Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 0638AA35B5E
	for <lists+dri-devel@lfdr.de>; Fri, 14 Feb 2025 11:20:08 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id A2EA810EC3F;
	Fri, 14 Feb 2025 10:20:00 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=fail reason="signature verification failed" (2048-bit key; unprotected) header.d=igalia.com header.i=@igalia.com header.b="HQuM5Wmi";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from fanzine2.igalia.com (fanzine.igalia.com [178.60.130.6])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 79FB710E2BF;
 Fri, 14 Feb 2025 10:19:53 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=igalia.com; 
 s=20170329;
 h=Content-Transfer-Encoding:Content-Type:MIME-Version:Message-ID:
 Date:Subject:Cc:To:From:Sender:Reply-To:Content-ID:Content-Description:
 Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
 In-Reply-To:References:List-Id:List-Help:List-Unsubscribe:List-Subscribe:
 List-Post:List-Owner:List-Archive;
 bh=JBldiGdzPBREG8VY6lWkuKno3FYS8N6A+ouC38dlaF8=; b=HQuM5Wmiw2RPmxlHclDOAnsNfI
 b1Ri85LSSKDhp01V9yoVJJbc7Tycw1HYkILgbghUpW+pP43a2XZyV52QS0rjTu60lGFoG8erzhq0s
 it0TC1TJ6VnX7ZmFA6gq58tWwTqzLM5y3zuP2DcJEe02mnhpMF+LwlxPqldPHnAkRoS7M4m13CdFF
 5rFIF5YYW9XkugNykUY9y9RWB0Kbj8IcEfhKJ2XQj6GwNUe9c+TUrz1hMda+3SMMxjR5IzuVxAJle
 b4PyFTZqPnV6F5HOxpy1Fq3ldS28s6fQOPsE5teltwBI1SLgeDbZ0tbPapiRIzsCwL3UjJxNmZ36R
 030uhKcA==;
Received: from [90.241.98.187] (helo=localhost)
 by fanzine2.igalia.com with esmtpsa 
 (Cipher TLS1.3:ECDHE_SECP256R1__RSA_PSS_RSAE_SHA256__AES_256_GCM:256) (Exim)
 id 1tisnQ-00HYkW-W9; Fri, 14 Feb 2025 11:19:50 +0100
From: Tvrtko Ursulin <tvrtko.ursulin@igalia.com>
To: amd-gfx@lists.freedesktop.org,
	dri-devel@lists.freedesktop.org
Cc: intel-xe@lists.freedesktop.org, kernel-dev@igalia.com,
 Tvrtko Ursulin <tvrtko.ursulin@igalia.com>,
 =?UTF-8?q?Christian=20K=C3=B6nig?= <christian.koenig@amd.com>,
 Danilo Krummrich <dakr@kernel.org>,
 Matthew Brost <matthew.brost@intel.com>,
 Philipp Stanner <phasta@kernel.org>
Subject: [PATCH v5 0/6] drm/sched: Job queue peek/pop helpers and struct job
 re-order
Date: Fri, 14 Feb 2025 10:19:38 +0000
Message-ID: <20250214101944.19390-1-tvrtko.ursulin@igalia.com>
X-Mailer: git-send-email 2.48.0
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

Lets add some helpers for peeking and popping from the job queue which allows us
to re-order the fields in struct drm_sched_job and remove one hole.

As in the process we have added a header file for scheduler internal prototypes,
lets also use it more and cleanup the "exported" header a bit.

v2:
 * Add header file for internal scheduler API.
 * Add helper for peeking too. (Danilo)
 * Add (temporary?) drm_sched_cancel_all_jobs() helper to replace amdgpu
   amdgpu_job_stop_all_jobs_on_sched().

v3:
 * Settle for a copy of __drm_sched_entity_queue_pop in amdgpu for now.

v4:
 * Expand the series with some more header file cleanup.

v5:
 * Rebase for drm_sched_init changes.
 * Tweak kerneldoc format.

Cc: Christian König <christian.koenig@amd.com>
Cc: Danilo Krummrich <dakr@kernel.org>
Cc: Matthew Brost <matthew.brost@intel.com>
Cc: Philipp Stanner <phasta@kernel.org>

Tvrtko Ursulin (6):
  drm/sched: Add internal job peek/pop API
  drm/amdgpu: Pop jobs from the queue more robustly
  drm/sched: Remove a hole from struct drm_sched_job
  drm/sched: Move drm_sched_entity_is_ready to internal header
  drm/sched: Move internal prototypes to internal header
  drm/sched: Group exported prototypes by object type

 drivers/gpu/drm/amd/amdgpu/amdgpu_job.c    |  22 +++-
 drivers/gpu/drm/scheduler/sched_entity.c   |  23 +---
 drivers/gpu/drm/scheduler/sched_fence.c    |   2 +
 drivers/gpu/drm/scheduler/sched_internal.h |  89 +++++++++++++++
 drivers/gpu/drm/scheduler/sched_main.c     |   7 +-
 include/drm/gpu_scheduler.h                | 122 +++++++++------------
 6 files changed, 169 insertions(+), 96 deletions(-)
 create mode 100644 drivers/gpu/drm/scheduler/sched_internal.h

-- 
2.48.0

