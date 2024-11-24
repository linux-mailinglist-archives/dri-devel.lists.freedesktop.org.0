Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 5B7989D708A
	for <lists+dri-devel@lfdr.de>; Sun, 24 Nov 2024 14:36:05 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id BB6AC10E4DD;
	Sun, 24 Nov 2024 13:36:03 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=kernel.org header.i=@kernel.org header.b="B0b86pTB";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from nyc.source.kernel.org (nyc.source.kernel.org [147.75.193.91])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 1E9B110E4DB;
 Sun, 24 Nov 2024 13:36:02 +0000 (UTC)
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
 by nyc.source.kernel.org (Postfix) with ESMTP id 27800A40AC6;
 Sun, 24 Nov 2024 13:34:08 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 11C90C4CED1;
 Sun, 24 Nov 2024 13:35:58 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=k20201202; t=1732455360;
 bh=juvZpPMZICGteH+IeDccZe5iw94T8otHKKCkwOAJIyE=;
 h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
 b=B0b86pTBVq+WBhKkMkcHKSP5Z6NEZj1tfNfDm6kNVBynlIZ3XhUcQ6xYeweIcnWRA
 6nFX8b4qa860QsO6inGGTV3O4S5babnFYoQGPB1O13lY/pwNiexzBzQAEUZcRkLnUy
 U14hTWEUCHfZvjaEPZIdhASUQTms1TFgpGjeVzJY0vyfvmTff8E0EpJn1nnRzTjsPZ
 6ha1OsHn7FrI44FzNPCy/3I498UszNyGY2M0CigVDIsmwGxWqUF/t5uecQTUgkz/mw
 Uwt+b08KnjxeUHHyPQrL7pqglCi9UCn+ImEeoprc+CmdlGd0ZSiWEPHAM5Fr6eqOMI
 TpG7hCsItir+w==
From: Sasha Levin <sashal@kernel.org>
To: linux-kernel@vger.kernel.org,
	stable@vger.kernel.org
Cc: Badal Nilawar <badal.nilawar@intel.com>,
 Matthew Brost <matthew.brost@intel.com>,
 Matthew Auld <matthew.auld@intel.com>,
 John Harrison <John.C.Harrison@Intel.com>,
 Himal Prasad Ghimiray <himal.prasad.ghimiray@intel.com>,
 Sasha Levin <sashal@kernel.org>, lucas.demarchi@intel.com,
 thomas.hellstrom@linux.intel.com, rodrigo.vivi@intel.com,
 maarten.lankhorst@linux.intel.com, mripard@kernel.org, tzimmermann@suse.de,
 airlied@gmail.com, simona@ffwll.ch, intel-xe@lists.freedesktop.org,
 dri-devel@lists.freedesktop.org
Subject: [PATCH AUTOSEL 6.12 054/107] drm/xe/guc/ct: Flush g2h worker in case
 of g2h response timeout
Date: Sun, 24 Nov 2024 08:29:14 -0500
Message-ID: <20241124133301.3341829-54-sashal@kernel.org>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20241124133301.3341829-1-sashal@kernel.org>
References: <20241124133301.3341829-1-sashal@kernel.org>
MIME-Version: 1.0
X-stable: review
X-Patchwork-Hint: Ignore
X-stable-base: Linux 6.12.1
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

From: Badal Nilawar <badal.nilawar@intel.com>

[ Upstream commit e5152723380404acb8175e0777b1cea57f319a01 ]

In case if g2h worker doesn't get opportunity to within specified
timeout delay then flush the g2h worker explicitly.

v2:
  - Describe change in the comment and add TODO (Matt B/John H)
  - Add xe_gt_warn on fence done after G2H flush (John H)
v3:
  - Updated the comment with root cause
  - Clean up xe_gt_warn message (John H)

Closes: https://gitlab.freedesktop.org/drm/xe/kernel/issues/1620
Closes: https://gitlab.freedesktop.org/drm/xe/kernel/issues/2902
Signed-off-by: Badal Nilawar <badal.nilawar@intel.com>
Cc: Matthew Brost <matthew.brost@intel.com>
Cc: Matthew Auld <matthew.auld@intel.com>
Cc: John Harrison <John.C.Harrison@Intel.com>
Cc: Himal Prasad Ghimiray <himal.prasad.ghimiray@intel.com>
Reviewed-by: Himal Prasad Ghimiray <himal.prasad.ghimiray@intel.com>
Acked-by: Matthew Brost <matthew.brost@intel.com>
Signed-off-by: Matthew Brost <matthew.brost@intel.com>
Link: https://patchwork.freedesktop.org/patch/msgid/20241017111410.2553784-2-badal.nilawar@intel.com
Signed-off-by: Sasha Levin <sashal@kernel.org>
---
 drivers/gpu/drm/xe/xe_guc_ct.c | 18 ++++++++++++++++++
 1 file changed, 18 insertions(+)

diff --git a/drivers/gpu/drm/xe/xe_guc_ct.c b/drivers/gpu/drm/xe/xe_guc_ct.c
index 9c505d3517cd1..cd6a5f09d631e 100644
--- a/drivers/gpu/drm/xe/xe_guc_ct.c
+++ b/drivers/gpu/drm/xe/xe_guc_ct.c
@@ -906,6 +906,24 @@ static int guc_ct_send_recv(struct xe_guc_ct *ct, const u32 *action, u32 len,
 		}
 	}
 
+	/*
+	 * Occasionally it is seen that the G2H worker starts running after a delay of more than
+	 * a second even after being queued and activated by the Linux workqueue subsystem. This
+	 * leads to G2H timeout error. The root cause of issue lies with scheduling latency of
+	 * Lunarlake Hybrid CPU. Issue dissappears if we disable Lunarlake atom cores from BIOS
+	 * and this is beyond xe kmd.
+	 *
+	 * TODO: Drop this change once workqueue scheduling delay issue is fixed on LNL Hybrid CPU.
+	 */
+	if (!ret) {
+		flush_work(&ct->g2h_worker);
+		if (g2h_fence.done) {
+			xe_gt_warn(gt, "G2H fence %u, action %04x, done\n",
+				   g2h_fence.seqno, action[0]);
+			ret = 1;
+		}
+	}
+
 	/*
 	 * Ensure we serialize with completion side to prevent UAF with fence going out of scope on
 	 * the stack, since we have no clue if it will fire after the timeout before we can erase
-- 
2.43.0

