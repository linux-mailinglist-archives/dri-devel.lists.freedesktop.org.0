Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 3C94CC1F9B3
	for <lists+dri-devel@lfdr.de>; Thu, 30 Oct 2025 11:42:50 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 64C2210E8C9;
	Thu, 30 Oct 2025 10:42:47 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=kernel.org header.i=@kernel.org header.b="UWxnrBI4";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from sea.source.kernel.org (sea.source.kernel.org [172.234.252.31])
 by gabe.freedesktop.org (Postfix) with ESMTPS id B498710E8C9
 for <dri-devel@lists.freedesktop.org>; Thu, 30 Oct 2025 10:42:45 +0000 (UTC)
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
 by sea.source.kernel.org (Postfix) with ESMTP id 76F0B43250;
 Thu, 30 Oct 2025 10:42:45 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id DFCDFC4CEF1;
 Thu, 30 Oct 2025 10:42:41 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=k20201202; t=1761820965;
 bh=G9W7fptY1OBNfQ3kQqrC8Ke7TKS8aSvFyr6gkJbxgUg=;
 h=From:To:Cc:Subject:Date:From;
 b=UWxnrBI4ivtJN0Jwz6QcrF6kihuKvTd0MeM43P/V2bB7GGlr8K+GC+QX80bw5jfk0
 aPFGS1/TOmBBPhxB8UpGzj3dx2PI51JsVNvR0wRcEqTRuEyOib1mg+MUBWB07IO/yG
 jourJZHBYoYHrf+w9Ce9dm3ICl9tfKVltmpjOHRhaAPAN+BGogpyZDxMEqKhC+Foip
 +STsayyFPtSgD49XjkrpXP/fyoGHX/5FSoIiy7NT4Oq4/wD3sNkSSRORiWnaigSnIw
 DmRIJhDfcGsgyu8a0tEdGygTTys0v0D66tIMqAnGgwtePRJyJ/IC0DfHT77DBAWFGT
 gNEsZweoPC1Zw==
From: Philipp Stanner <phasta@kernel.org>
To: Matthew Brost <matthew.brost@intel.com>,
 Danilo Krummrich <dakr@kernel.org>, Philipp Stanner <phasta@kernel.org>,
 =?UTF-8?q?Christian=20K=C3=B6nig?= <ckoenig.leichtzumerken@gmail.com>,
 Maarten Lankhorst <maarten.lankhorst@linux.intel.com>,
 Maxime Ripard <mripard@kernel.org>,
 Thomas Zimmermann <tzimmermann@suse.de>, David Airlie <airlied@gmail.com>,
 Simona Vetter <simona@ffwll.ch>,
 Boris Brezillon <boris.brezillon@collabora.com>,
 Melissa Wen <mwen@igalia.com>, Steven Price <steven.price@arm.com>
Cc: dri-devel@lists.freedesktop.org,
	linux-kernel@vger.kernel.org
Subject: [PATCH 0/2] drm/sched: Add bloody spinlocks
Date: Thu, 30 Oct 2025 11:42:18 +0100
Message-ID: <20251030104219.181704-2-phasta@kernel.org>
X-Mailer: git-send-email 2.49.0
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

The scheduler wouldn't be the scheduler if there weren't functions like
drm_sched_job_arm() being called probably a few thousand times per
second without taking proper locks, just racing wildly.

This series adds the proper locks to drm_sched_job_init() and
drm_sched_job_arm().

Philipp Stanner (2):
  drm/sched: Use proper locks in drm_sched_job_arm()
  drm/sched: Use proper locks for drm_sched_job_init()

 drivers/gpu/drm/scheduler/sched_main.c | 15 +++++++++++++--
 1 file changed, 13 insertions(+), 2 deletions(-)

-- 
2.49.0

