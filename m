Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 1C6CFCA5488
	for <lists+dri-devel@lfdr.de>; Thu, 04 Dec 2025 21:21:29 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id D378A10E216;
	Thu,  4 Dec 2025 20:21:26 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="Fmdezwe/";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.18])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 9FBFB10E214;
 Thu,  4 Dec 2025 20:21:25 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1764879686; x=1796415686;
 h=from:to:cc:subject:date:message-id:mime-version:
 content-transfer-encoding;
 bh=1TwGGNxOhuDagudoK9YoqLq05Zqas9Yl2A0kSW+yZ/s=;
 b=Fmdezwe/FJkMmq+W0Bm1V/QFoSzvpFf9FZww+D+tHntCcNM0FqqPArBM
 /BtBeHZppuld1VGqptOM5zwcEEiMezwlvQVVyttT0vr01waTA8SJqkXmr
 cEv3SylPu84vOLkeNzRPRVmI5c+kEdYMMwPUrsWgl4ull/51NQ5DSPXcf
 CsXw9P+uibWMH3mSHuKJMyS4O7nvsNZbA4ytv2T//Hh8nJmKio7C6u22U
 h8kTl6+X/3A6Cyan6f9C1qVPvpRDq8OWztm+t/TlMiKiAeOUjJDoeRnUH
 /hvO2fkQbc5NyVdm0O96wxOaI/l4PnN5YFacG6GlZlzSXJUMitoVNNV/J g==;
X-CSE-ConnectionGUID: vhnxYfEcSTC8EDqp9dkcsg==
X-CSE-MsgGUID: HJMycCtqREygT7hXHvyoOQ==
X-IronPort-AV: E=McAfee;i="6800,10657,11632"; a="66101034"
X-IronPort-AV: E=Sophos;i="6.20,249,1758610800"; d="scan'208";a="66101034"
Received: from fmviesa007.fm.intel.com ([10.60.135.147])
 by fmvoesa112.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 04 Dec 2025 12:21:25 -0800
X-CSE-ConnectionGUID: fNhY/HTvT92+R0yhp/kUKw==
X-CSE-MsgGUID: S4nCBptSTwmW/aE92FHKMA==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.20,249,1758610800"; d="scan'208";a="194738904"
Received: from hrotuna-mobl2.ger.corp.intel.com (HELO fedora)
 ([10.245.245.167])
 by fmviesa007-auth.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 04 Dec 2025 12:21:24 -0800
From: =?UTF-8?q?Thomas=20Hellstr=C3=B6m?= <thomas.hellstrom@linux.intel.com>
To: intel-xe@lists.freedesktop.org
Cc: dri-devel@lists.freedesktop.org,
 =?UTF-8?q?Thomas=20Hellstr=C3=B6m?= <thomas.hellstrom@linux.intel.com>,
 Dave Airlie <airlied@redhat.com>,
 Linus Torvalds <torvalds@linux-foundation.org>
Subject: [PATCH] drm/xe: Fix duplicated put due to merge resolution
Date: Thu,  4 Dec 2025 21:20:59 +0100
Message-ID: <20251204202059.326605-1-thomas.hellstrom@linux.intel.com>
X-Mailer: git-send-email 2.51.1
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

An incorrect backmerge resolution resulted in an
incorrect duplicate put. Fix.

Cc: Dave Airlie <airlied@redhat.com>
Reported-by: Linus Torvalds <torvalds@linux-foundation.org>
Closes: https://lore.kernel.org/dri-devel/CAHk-=whaiMayMx=LrL7P119MLBX6exM_mEu4S2uBRT+xWQ-mbA@mail.gmail.com/
Fixes: Fixes: ce0478b02ed2 ("Merge tag 'v6.18-rc6' into drm-next")
Signed-off-by: Thomas Hellström <thomas.hellstrom@linux.intel.com>
---
 drivers/gpu/drm/xe/xe_exec_queue.c | 3 ---
 1 file changed, 3 deletions(-)

diff --git a/drivers/gpu/drm/xe/xe_exec_queue.c b/drivers/gpu/drm/xe/xe_exec_queue.c
index 02b75652d497..226d07a3d852 100644
--- a/drivers/gpu/drm/xe/xe_exec_queue.c
+++ b/drivers/gpu/drm/xe/xe_exec_queue.c
@@ -392,9 +392,6 @@ void xe_exec_queue_destroy(struct kref *ref)
 
 	xe_assert(gt_to_xe(q->gt), atomic_read(&q->job_cnt) == 0);
 
-	if (q->ufence_syncobj)
-		drm_syncobj_put(q->ufence_syncobj);
-
 	if (q->ufence_syncobj)
 		drm_syncobj_put(q->ufence_syncobj);
 

base-commit: 29bce9c8b41d5c378263a927acb9a9074d0e7a0e
-- 
2.51.1

