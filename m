Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id E6EB993E606
	for <lists+dri-devel@lfdr.de>; Sun, 28 Jul 2024 17:43:11 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 6091F10E1EE;
	Sun, 28 Jul 2024 15:43:10 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=kernel.org header.i=@kernel.org header.b="B3KUDdkT";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from sin.source.kernel.org (sin.source.kernel.org [145.40.73.55])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 3023D10E1EE;
 Sun, 28 Jul 2024 15:43:08 +0000 (UTC)
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
 by sin.source.kernel.org (Postfix) with ESMTP id 5B2A4CE0957;
 Sun, 28 Jul 2024 15:43:06 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 1DE53C116B1;
 Sun, 28 Jul 2024 15:43:04 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=k20201202; t=1722181386;
 bh=EZMMz4krHIUvdzWVI5xV0nWibKMMsJlJ0glYjhFHBCs=;
 h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
 b=B3KUDdkToYQWiFb0WndBYesteIu4OLcsXsgyWY4BeGRy1U6qKNrx3OSpLadeYuift
 wybK884S0esKxVbNGh0BmuOQOmNbWK9VmyKa8pdTshrNup+nZwSDVhGa+E9SvpYg8T
 Is6AAArNrphaPYwZP2qpQwPDDXUp2s/j5JpCbpuDSg2sWagV5trV7fadPgaFl52JZx
 1wSux/j0HlWJ1ELSJQvB8yXZAmSUKaCbb2n8CCeQ/M7H1rANPU6pOMSQu68GG4V+l5
 qJAIKVqrBLiGn8oMT4Fom0UPRqeTSrsN3CoD+DQx/jamJMB5XkaPSGkNlQlxejAjRT
 Uddg6oJEyqFsg==
From: Sasha Levin <sashal@kernel.org>
To: linux-kernel@vger.kernel.org,
	stable@vger.kernel.org
Cc: Jonathan Cavitt <jonathan.cavitt@intel.com>,
 Matthew Brost <matthew.brost@intel.com>,
 Stuart Summers <stuart.summers@intel.com>, Sasha Levin <sashal@kernel.org>,
 lucas.demarchi@intel.com, thomas.hellstrom@linux.intel.com,
 rodrigo.vivi@intel.com, maarten.lankhorst@linux.intel.com,
 mripard@kernel.org, tzimmermann@suse.de, airlied@gmail.com,
 daniel@ffwll.ch, intel-xe@lists.freedesktop.org,
 dri-devel@lists.freedesktop.org
Subject: [PATCH AUTOSEL 6.10 07/34] drm/xe/xe_guc_submit: Fix exec queue stop
 race condition
Date: Sun, 28 Jul 2024 11:40:31 -0400
Message-ID: <20240728154230.2046786-7-sashal@kernel.org>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20240728154230.2046786-1-sashal@kernel.org>
References: <20240728154230.2046786-1-sashal@kernel.org>
MIME-Version: 1.0
X-stable: review
X-Patchwork-Hint: Ignore
X-stable-base: Linux 6.10.2
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

From: Jonathan Cavitt <jonathan.cavitt@intel.com>

[ Upstream commit 1564d411e17f51e2f64655b4e4da015be1ba7eaa ]

Reorder the xe_sched_tdr_queue_imm and set_exec_queue_banned calls in
guc_exec_queue_stop.  This prevents a possible race condition between
the two events in which it's possible for xe_sched_tdr_queue_imm to
wake the ufence waiter before the exec queue is banned, causing the
ufence waiter to miss the banned state.

Suggested-by: Matthew Brost <matthew.brost@intel.com>
Signed-off-by: Jonathan Cavitt <jonathan.cavitt@intel.com>
Reviewed-by: Matthew Brost <matthew.brost@intel.com>
Reviewed-by: Stuart Summers <stuart.summers@intel.com>
Signed-off-by: Matthew Brost <matthew.brost@intel.com>
Link: https://patchwork.freedesktop.org/patch/msgid/20240510194540.3246991-1-jonathan.cavitt@intel.com
Signed-off-by: Sasha Levin <sashal@kernel.org>
---
 drivers/gpu/drm/xe/xe_guc_submit.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/drivers/gpu/drm/xe/xe_guc_submit.c b/drivers/gpu/drm/xe/xe_guc_submit.c
index e4e3658e6a138..0f42971ff0a83 100644
--- a/drivers/gpu/drm/xe/xe_guc_submit.c
+++ b/drivers/gpu/drm/xe/xe_guc_submit.c
@@ -1429,8 +1429,8 @@ static void guc_exec_queue_stop(struct xe_guc *guc, struct xe_exec_queue *q)
 			    !xe_sched_job_completed(job)) ||
 			    xe_sched_invalidate_job(job, 2)) {
 				trace_xe_sched_job_ban(job);
-				xe_sched_tdr_queue_imm(&q->guc->sched);
 				set_exec_queue_banned(q);
+				xe_sched_tdr_queue_imm(&q->guc->sched);
 			}
 		}
 	}
-- 
2.43.0

