Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 80949A180E3
	for <lists+dri-devel@lfdr.de>; Tue, 21 Jan 2025 16:16:05 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id DC56F10E5E5;
	Tue, 21 Jan 2025 15:16:00 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=kernel.org header.i=@kernel.org header.b="pk8xJK6G";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from dfw.source.kernel.org (dfw.source.kernel.org
 [IPv6:2604:1380:4641:c500::1])
 by gabe.freedesktop.org (Postfix) with ESMTPS id D259E10E5E5
 for <dri-devel@lists.freedesktop.org>; Tue, 21 Jan 2025 15:15:59 +0000 (UTC)
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
 by dfw.source.kernel.org (Postfix) with ESMTP id 8087F5C06C5;
 Tue, 21 Jan 2025 15:15:18 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 388C0C4CEE3;
 Tue, 21 Jan 2025 15:15:54 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=k20201202; t=1737472558;
 bh=+nIjqYD/j2RTpJxB2Fsvg3Iv/g326EMXel5aJPmyIj4=;
 h=From:To:Cc:Subject:Date:From;
 b=pk8xJK6GzwaH1fN8KBMMPadPwh8ZBSvwvHqfmmAEeImMJbMyu2gNofem4rDklUdFG
 N3gVPIqdGutH1zAXAAjdaB7+mJYEvSnDjVmr+yncCXEX7zAYbhsufQfrasBVvr7Ar6
 3MXegwxKdxsqFTan2egweANthAwMPQELa3Y8/MHEfjcyLi9kUzlgq036C0YLKgStqJ
 KTZBFgSFRB0l8VVj8lz358643DL0YrqFwWgFU3+iubJuURHkXKsZNOTyTX/4Qa8fAE
 5tJs6FPq0/2cJQbtKi3aP8Rkx7SWtx+fCEHN6D9iBz0sdVO6XDq+srhSVkM5B5BZa2
 sFj5G8yglZAFw==
From: Philipp Stanner <phasta@kernel.org>
To: Matthew Brost <matthew.brost@intel.com>,
 Danilo Krummrich <dakr@kernel.org>, Philipp Stanner <pstanner@redhat.com>,
 Maarten Lankhorst <maarten.lankhorst@linux.intel.com>,
 Maxime Ripard <mripard@kernel.org>,
 Thomas Zimmermann <tzimmermann@suse.de>, David Airlie <airlied@gmail.com>,
 Simona Vetter <simona@ffwll.ch>, Sumit Semwal <sumit.semwal@linaro.org>,
 =?UTF-8?q?Christian=20K=C3=B6nig?= <christian.koenig@amd.com>
Cc: dri-devel@lists.freedesktop.org, linux-kernel@vger.kernel.org,
 linux-media@vger.kernel.org, linaro-mm-sig@lists.linaro.org,
 Philipp Stanner <phasta@kernel.org>
Subject: [PATCH v2 0/3] drm/sched: Documentation and refcount improvements
Date: Tue, 21 Jan 2025 16:15:42 +0100
Message-ID: <20250121151544.44949-2-phasta@kernel.org>
X-Mailer: git-send-email 2.47.1
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

Changes in v2:
  - Document what run_job() is allowed to return. (Tvrtko)
  - Delete confusing comment about putting the fence. (Danilo)
  - Apply Danilo's RB to patch 1.
  - Delete info about job recovery for entities in patch 3. (Danilo, me)
  - Set the term "ring" as fix term for both HW rings and FW rings. A
    ring shall always be the thingy on the CPU ;) (Danilo)
  - Many (all) other comments improvements in patch 3. (Danilo)

This is as series succeeding my previous patch [1].

I recognized that we are still referring to a non-existing function and
a deprecated one in the callback docu. We should probably also point out
the important distinction between hardware and firmware schedulers more
cleanly.

Please give me feedback, especially on the RFC comments in patch3.

(This series still fires docu-build-warnings. I want to gather feedback
on the opion questions first and will solve them in v2.)

Thank you,
Philipp

[1] https://lore.kernel.org/all/20241220124515.93169-2-phasta@kernel.org/

Philipp Stanner (3):
  drm/sched: Document run_job() refcount hazard
  drm/sched: Adjust outdated docu for run_job()
  drm/sched: Update timedout_job()'s documentation

 drivers/gpu/drm/scheduler/sched_main.c |   5 +-
 include/drm/gpu_scheduler.h            | 106 ++++++++++++++++---------
 2 files changed, 71 insertions(+), 40 deletions(-)

-- 
2.47.1

