Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 794A6A39A1B
	for <lists+dri-devel@lfdr.de>; Tue, 18 Feb 2025 12:13:10 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 7CC5110E09B;
	Tue, 18 Feb 2025 11:13:08 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=kernel.org header.i=@kernel.org header.b="NL6X4IBC";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from dfw.source.kernel.org (dfw.source.kernel.org [139.178.84.217])
 by gabe.freedesktop.org (Postfix) with ESMTPS id EE09910E09B
 for <dri-devel@lists.freedesktop.org>; Tue, 18 Feb 2025 11:13:06 +0000 (UTC)
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
 by dfw.source.kernel.org (Postfix) with ESMTP id E11D95C5A81;
 Tue, 18 Feb 2025 11:12:26 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 70944C4CEE2;
 Tue, 18 Feb 2025 11:13:02 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=k20201202; t=1739877185;
 bh=Lvi6FQ89TE/loV59Xko0QSZp0LU8OQ2GNhpZE13oz6w=;
 h=From:To:Cc:Subject:Date:From;
 b=NL6X4IBC36NR3Gupnzzer+nn7zCmkBXuVn9tAO/ylk0BI8m2incSSD2Mm0lx1CIyN
 P8Ye6XWOKuDElNt4wpY4jO0wF8wctoiBtj3UHMP3daU80I7oSbpPpp8fbViUwqilho
 /ai4gL3GoMSzaO/H/LdgsQBUBRN+En3ys37UuBCdJGAHACBByF1QxJBwkAIC77fqyG
 JyqqRAYSJ7i3L5xch49KV7PVZHVggr9GBNXBh5fXAlbXCe8FU+hImwcwfjUr110rOV
 XIAVm8a9WFbPrq5KMvDCfUqYs53m8TmiYXwE1KhIqnB1bST4isHSC6bI+KeNPEuWaU
 opVe6Ph7oNv7Q==
From: Philipp Stanner <phasta@kernel.org>
To: Matthew Brost <matthew.brost@intel.com>,
 Danilo Krummrich <dakr@kernel.org>, Philipp Stanner <phasta@kernel.org>,
 =?UTF-8?q?Christian=20K=C3=B6nig?= <ckoenig.leichtzumerken@gmail.com>,
 Maarten Lankhorst <maarten.lankhorst@linux.intel.com>,
 Maxime Ripard <mripard@kernel.org>,
 Thomas Zimmermann <tzimmermann@suse.de>, David Airlie <airlied@gmail.com>,
 Simona Vetter <simona@ffwll.ch>, Sumit Semwal <sumit.semwal@linaro.org>
Cc: dri-devel@lists.freedesktop.org, linux-kernel@vger.kernel.org,
 linux-media@vger.kernel.org, linaro-mm-sig@lists.linaro.org
Subject: [PATCH v4 0/3] drm/sched: Documentation and refcount improvements
Date: Tue, 18 Feb 2025 12:12:44 +0100
Message-ID: <20250218111246.108266-2-phasta@kernel.org>
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
 include/drm/gpu_scheduler.h            | 106 +++++++++++++++++--------
 2 files changed, 73 insertions(+), 38 deletions(-)

-- 
2.47.1

