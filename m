Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 2210AA3D8C7
	for <lists+dri-devel@lfdr.de>; Thu, 20 Feb 2025 12:34:39 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id A62DA10E4CF;
	Thu, 20 Feb 2025 11:34:34 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=kernel.org header.i=@kernel.org header.b="q4Hq1uHr";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from tor.source.kernel.org (tor.source.kernel.org [172.105.4.254])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 0155710E955
 for <dri-devel@lists.freedesktop.org>; Thu, 20 Feb 2025 11:34:32 +0000 (UTC)
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
 by tor.source.kernel.org (Postfix) with ESMTP id 98D4E613AD;
 Thu, 20 Feb 2025 11:28:21 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 6EBFAC4CED1;
 Thu, 20 Feb 2025 11:28:20 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=k20201202; t=1740050902;
 bh=JDB0yEuPVkvAyMz7TDwn8wLKPDLpB7CukMSdFDh9uKQ=;
 h=From:To:Cc:Subject:Date:From;
 b=q4Hq1uHrh/jj9PjoUlaXaPuSrfwJpj7bckJ54hKBP/dzpToM0O29jPKXU4X08nX3e
 qbYWs9Jfc2Kjj2jKuflhYXWFMON9WgxDbUp/I5gWH3r0DXYa5w+Htl8LpdhqSTdilo
 AvyMYVOwbNMIlakWtsqrEPiBFBpjmHJ8AnPw+5mLkf5ze+nDezpSandxM+8/ot6Qsl
 nnQW2eoUBp2FbbY+Ib9eyRNZBiUkOlNnf7YGsUs87YOXR3g5iAT2Kdy+WqZn2m6jH4
 SaRKksH1QeLrDr0gHeci47kZrnroQu8Jqg+aRNceBgkLSlCGVbnJj72tfqJ+2sCjja
 GTNmo37HcjA7w==
From: Philipp Stanner <phasta@kernel.org>
To: Matthew Brost <matthew.brost@intel.com>,
 Danilo Krummrich <dakr@kernel.org>, Philipp Stanner <phasta@kernel.org>,
 =?UTF-8?q?Christian=20K=C3=B6nig?= <ckoenig.leichtzumerken@gmail.com>,
 Maarten Lankhorst <maarten.lankhorst@linux.intel.com>,
 Maxime Ripard <mripard@kernel.org>,
 Thomas Zimmermann <tzimmermann@suse.de>, David Airlie <airlied@gmail.com>,
 Simona Vetter <simona@ffwll.ch>, Tvrtko Ursulin <tvrtko.ursulin@igalia.com>
Cc: dri-devel@lists.freedesktop.org,
	linux-kernel@vger.kernel.org
Subject: [PATCH v5 0/3] drm/sched: Documentation and refcount improvements
Date: Thu, 20 Feb 2025 12:28:11 +0100
Message-ID: <20250220112813.87992-2-phasta@kernel.org>
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

Changes in v5:
  - Fix broken enumarated list in timedout_job's docu.
  - Add TODO for documenting the dma_fence rules in timedout_job one
    day.

Changes in v4:
  - Remove mention of vague "dma_fence rules" in timedout_job() again
    since I couldn't get input on what those rules precisely are.
  - Address a forgotten TODO. (Me)
  - Reposition "Return:" statements to make them congruent with the
    official kernel style. (Tvrtko)
  - Change formatting a bit because of crazy make htmldocs errors. (Me)

Changes in v3:
  - timedout_job(): various docu wording improvements. (Danilo)
  - Use the term "ring" consistently. (Danilo)
  - Add fully fledged docu for enum drm_gpu_sched_stat. (Danilo)

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
 include/drm/gpu_scheduler.h            | 109 +++++++++++++++++--------
 2 files changed, 76 insertions(+), 38 deletions(-)

-- 
2.47.1

