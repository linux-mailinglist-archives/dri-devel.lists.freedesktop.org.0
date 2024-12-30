Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 5B4B09FE926
	for <lists+dri-devel@lfdr.de>; Mon, 30 Dec 2024 17:53:13 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id C63A210E525;
	Mon, 30 Dec 2024 16:53:08 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=fail reason="signature verification failed" (2048-bit key; unprotected) header.d=igalia.com header.i=@igalia.com header.b="DluJXpmj";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from fanzine2.igalia.com (fanzine.igalia.com [178.60.130.6])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 6FFE710E525
 for <dri-devel@lists.freedesktop.org>; Mon, 30 Dec 2024 16:53:06 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=igalia.com; 
 s=20170329;
 h=Content-Transfer-Encoding:Content-Type:MIME-Version:Message-ID:
 Date:Subject:Cc:To:From:Sender:Reply-To:Content-ID:Content-Description:
 Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
 In-Reply-To:References:List-Id:List-Help:List-Unsubscribe:List-Subscribe:
 List-Post:List-Owner:List-Archive;
 bh=nwroXuwGJTbXEFJ5mgBnhh0kfzlvX6PCVbJX+EldYxI=; b=DluJXpmjdmR9/AnYiUlabJPL6H
 h7w/1c0VbVtmyFfCGs2bQyS9zLQMiBiw/WpeiPD8HFZr3+6yUQeWfwShKreUHb55g42vN6D79m/hr
 TQdR54KGl2wJVTDHwfoNgWnVt8kXT+d1JZ43ksDW+C+KiqYldrWDmdD4FlrcrMn3HdmT9JvVHou3c
 ri9Bz1BZEbpNKNUJJcCo9WDMx30Q8xuutwtklsQZB9HRxo1+gYDoexDbouonPOLw+RpuuBGzFZI6I
 glxxbUlDmXiVS5aBjvviy0kBuic5hL5Gr4cLNYSKRKXRs7gUwybYK/+b1/PrEEIKfhKM739j1ZhmP
 ryGyVg4A==;
Received: from [90.241.98.187] (helo=localhost)
 by fanzine2.igalia.com with esmtpsa 
 (Cipher TLS1.3:ECDHE_SECP256R1__RSA_PSS_RSAE_SHA256__AES_256_GCM:256) (Exim)
 id 1tSJ0p-009ZvF-SR; Mon, 30 Dec 2024 17:53:03 +0100
From: Tvrtko Ursulin <tursulin@igalia.com>
To: dri-devel@lists.freedesktop.org
Cc: kernel-dev@igalia.com, Tvrtko Ursulin <tvrtko.ursulin@igalia.com>,
 =?UTF-8?q?Christian=20K=C3=B6nig?= <christian.koenig@amd.com>,
 Danilo Krummrich <dakr@redhat.com>,
 Matthew Brost <matthew.brost@intel.com>,
 Philipp Stanner <pstanner@redhat.com>
Subject: [RFC 00/14] Deadline scheduler and other ideas
Date: Mon, 30 Dec 2024 16:52:45 +0000
Message-ID: <20241230165259.95855-1-tursulin@igalia.com>
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

From: Tvrtko Ursulin <tvrtko.ursulin@igalia.com>

<tldr>
Replacing FIFO with a flavour of deadline driven scheduling and removing round-
robin. Connecting the scheduler with dma-fence deadlines. First draft and
testing by different drivers and feedback would be nice. I was only able to test
it with amdgpu. Other drivers may not even compile.
</tldr>

If I remember correctly Christian mentioned recently (give or take) that maybe
round-robin could be removed. That got me thinking how and what could be
improved and simplified. So I played a bit in the scheduler code and came up
with something which appears to not crash at least. Whether or not there are
significant advantages apart from maybe code consolidation and reduction is the
main thing to be determined.

One big question is whether round-robin can really be removed. Does anyone use
it, rely on it, or what are even use cases where it is much better than FIFO.

See "drm/sched: Add deadline policy" commit message for a short description on
what flavour of deadline scheduling it is. But in essence it should a more fair
FIFO where higher priority can not forever starve lower priorities.

"drm/sched: Connect with dma-fence deadlines" wires up dma-fence deadlines to
the scheduler because it is easy and makes logical sense with this. And I
noticed userspace already uses it so why not wire it up fully.

Otherwise the series is a bit of progression from consolidating RR into FIFO
code paths and going from there to deadline and then to a change in how
dependencies are handled. And code simplification to 1:1 run queue to scheduler
relationship, because deadline does not need per priority run queues.

There is quite a bit of code to go throught here so I think it could be even
better if other drivers could give it a spin as is and see if some improvements
can be detected. Or at least no regressions.

Cc: Christian König <christian.koenig@amd.com>
Cc: Danilo Krummrich <dakr@redhat.com>
Cc: Matthew Brost <matthew.brost@intel.com>
Cc: Philipp Stanner <pstanner@redhat.com>

Tvrtko Ursulin (14):
  drm/sched: Delete unused update_job_credits
  drm/sched: Remove idle entity from tree
  drm/sched: Implement RR via FIFO
  drm/sched: Consolidate entity run queue management
  drm/sched: Move run queue related code into a separate file
  drm/sched: Ignore own fence earlier
  drm/sched: Resolve same scheduler dependencies earlier
  drm/sched: Add deadline policy
  drm/sched: Remove FIFO and RR and simplify to a single run queue
  drm/sched: Queue all free credits in one worker invocation
  drm/sched: Connect with dma-fence deadlines
  drm/sched: Embed run queue singleton into the scheduler
  dma-fence: Add helper for custom fence context when merging fences
  drm/sched: Resolve all job dependencies in one go

 drivers/dma-buf/dma-fence-unwrap.c          |   8 +-
 drivers/gpu/drm/amd/amdgpu/amdgpu_cs.c      |   6 +-
 drivers/gpu/drm/amd/amdgpu/amdgpu_job.c     |  27 +-
 drivers/gpu/drm/amd/amdgpu/amdgpu_job.h     |   5 +-
 drivers/gpu/drm/amd/amdgpu/amdgpu_trace.h   |   8 +-
 drivers/gpu/drm/amd/amdgpu/amdgpu_vm_sdma.c |   8 +-
 drivers/gpu/drm/amd/amdgpu/amdgpu_xcp.c     |   8 +-
 drivers/gpu/drm/scheduler/Makefile          |   2 +-
 drivers/gpu/drm/scheduler/sched_entity.c    | 316 ++++++-----
 drivers/gpu/drm/scheduler/sched_fence.c     |   5 +-
 drivers/gpu/drm/scheduler/sched_main.c      | 587 +++++---------------
 drivers/gpu/drm/scheduler/sched_rq.c        | 199 +++++++
 include/drm/gpu_scheduler.h                 |  74 ++-
 include/linux/dma-fence-unwrap.h            |  31 +-
 14 files changed, 606 insertions(+), 678 deletions(-)
 create mode 100644 drivers/gpu/drm/scheduler/sched_rq.c

-- 
2.47.1

