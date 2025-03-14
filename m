Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 192FEA60E52
	for <lists+dri-devel@lfdr.de>; Fri, 14 Mar 2025 11:11:16 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id CED1210E205;
	Fri, 14 Mar 2025 10:11:12 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=kernel.org header.i=@kernel.org header.b="DII7biZc";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from dfw.source.kernel.org (dfw.source.kernel.org [139.178.84.217])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 3E7C910E98C
 for <dri-devel@lists.freedesktop.org>; Fri, 14 Mar 2025 10:11:10 +0000 (UTC)
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
 by dfw.source.kernel.org (Postfix) with ESMTP id AC1F95C5F04;
 Fri, 14 Mar 2025 10:08:51 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 2B88BC4CEE9;
 Fri, 14 Mar 2025 10:11:04 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=k20201202; t=1741947068;
 bh=U98yKqR09pci6Dos0Xkhum9zeW7dWjBPjiKDCl11NQ0=;
 h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
 b=DII7biZchvhnRhdU3rKFzW0yo5dl9ZwMpZtayi1CfTmdqFN+PQIv22aSNvg7oYTgR
 lHPvJ0NBG3rgGW+XT/294GuK1Rp4csTkCJ2/ZWG+0Aan+NNYMvU1iDLBA/k4P01gQ4
 zEzhLccNyDWZijIG1GqSe5Mu+bUhBUIrTeqR//Lf0Q4FZOTFQnbWVF/Ma9L3KxI4Rz
 wGhiZGDF+jjbsfq1TSBWNRGNHJ/Gx299k4XLQLIBF7PDWp0OY9/CpLP62uScflhU45
 OYIX6wtQ0LxYR7HcZ0auXmVKqQ2i2hdH2o9BDa0QxWH9v5jlm1j5ZVauJTyaTDS7Ih
 quMNxGTIOqHYQ==
From: Philipp Stanner <phasta@kernel.org>
To: Matthew Brost <matthew.brost@intel.com>,
 Danilo Krummrich <dakr@kernel.org>, Philipp Stanner <phasta@kernel.org>,
 =?UTF-8?q?Christian=20K=C3=B6nig?= <ckoenig.leichtzumerken@gmail.com>,
 Maarten Lankhorst <maarten.lankhorst@linux.intel.com>,
 Maxime Ripard <mripard@kernel.org>,
 Thomas Zimmermann <tzimmermann@suse.de>, David Airlie <airlied@gmail.com>,
 Simona Vetter <simona@ffwll.ch>
Cc: dri-devel@lists.freedesktop.org, linux-kernel@vger.kernel.org,
 Tvrtko Ursulin <tvrtko.ursulin@igalia.com>
Subject: [PATCH v3 2/2] drm/sched: Remove kthread header
Date: Fri, 14 Mar 2025 11:10:24 +0100
Message-ID: <20250314101023.111248-3-phasta@kernel.org>
X-Mailer: git-send-email 2.48.1
In-Reply-To: <20250314101023.111248-2-phasta@kernel.org>
References: <20250314101023.111248-2-phasta@kernel.org>
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

The kthread header doesn't need to be included anymore. It's a relict
from commit a6149f039369 ("drm/sched: Convert drm scheduler to use a
work queue rather than kthread").

Remove the unneeded includes.

Signed-off-by: Philipp Stanner <phasta@kernel.org>
Reviewed-by: Tvrtko Ursulin <tvrtko.ursulin@igalia.com>
---
 drivers/gpu/drm/scheduler/sched_entity.c | 1 -
 drivers/gpu/drm/scheduler/sched_fence.c  | 1 -
 2 files changed, 2 deletions(-)

diff --git a/drivers/gpu/drm/scheduler/sched_entity.c b/drivers/gpu/drm/scheduler/sched_entity.c
index 74a72c0a9c0a..8551892aca12 100644
--- a/drivers/gpu/drm/scheduler/sched_entity.c
+++ b/drivers/gpu/drm/scheduler/sched_entity.c
@@ -21,7 +21,6 @@
  *
  */
 
-#include <linux/kthread.h>
 #include <linux/slab.h>
 #include <linux/completion.h>
 
diff --git a/drivers/gpu/drm/scheduler/sched_fence.c b/drivers/gpu/drm/scheduler/sched_fence.c
index e971528504a5..d6239e015b66 100644
--- a/drivers/gpu/drm/scheduler/sched_fence.c
+++ b/drivers/gpu/drm/scheduler/sched_fence.c
@@ -21,7 +21,6 @@
  *
  */
 
-#include <linux/kthread.h>
 #include <linux/module.h>
 #include <linux/sched.h>
 #include <linux/slab.h>
-- 
2.48.1

