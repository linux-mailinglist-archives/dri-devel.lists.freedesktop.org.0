Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id EF5689B2D63
	for <lists+dri-devel@lfdr.de>; Mon, 28 Oct 2024 11:52:11 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 1A93B10E477;
	Mon, 28 Oct 2024 10:52:08 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=kernel.org header.i=@kernel.org header.b="PX7WjG2E";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from dfw.source.kernel.org (dfw.source.kernel.org [139.178.84.217])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 94B0810E473;
 Mon, 28 Oct 2024 10:52:06 +0000 (UTC)
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
 by dfw.source.kernel.org (Postfix) with ESMTP id B310C5C5A77;
 Mon, 28 Oct 2024 10:51:20 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 2EF7FC4CEE7;
 Mon, 28 Oct 2024 10:52:03 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=k20201202; t=1730112725;
 bh=awgu0iGo3uoDSu5mVHC0L1PH/1s2sI1wy6Q5lwygyvM=;
 h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
 b=PX7WjG2EQb65tx4JZ+/EjISmEOSLCaG59iP666KjYqqi2w4oSMKjIfrf6H2mkwE78
 TkzhtN+Rtoh7YTvlr5cP7FXTbsuhR4a4exHnHkRcA3dCCDe5NYo6LcXg/TZuMFDEMg
 F030fyJflF1wSHw0r/77X9JX6NpEXmYqaqLXhrZUpyardsUnhEpjH7mFwd/yHBUEEw
 AoN/k9oMyNQm7qfS3eDJyYYIMeWtreRq/aRVar8XrMK5yFIjqYIkKuWtyMpZAX7Qyn
 pkq2KcZ5rf2pEg+EkbSoUioDN55vFyF27mhC3jj4xhhLFUQTGvQLns1EoAZswsS/6e
 RChDO457PvDFA==
From: Sasha Levin <sashal@kernel.org>
To: linux-kernel@vger.kernel.org,
	stable@vger.kernel.org
Cc: Shuicheng Lin <shuicheng.lin@intel.com>, Alex Zuo <alex.zuo@intel.com>,
 Matthew Brost <matthew.brost@intel.com>,
 Michal Wajdeczko <michal.wajdeczko@intel.com>,
 Himal Prasad Ghimiray <himal.prasad.ghimiray@intel.com>,
 Badal Nilawar <badal.nilawar@intel.com>,
 Anshuman Gupta <anshuman.gupta@intel.com>,
 Matt Roper <matthew.d.roper@intel.com>,
 Rodrigo Vivi <rodrigo.vivi@intel.com>,
 Lucas De Marchi <lucas.demarchi@intel.com>,
 Sasha Levin <sashal@kernel.org>, thomas.hellstrom@linux.intel.com,
 maarten.lankhorst@linux.intel.com, mripard@kernel.org, tzimmermann@suse.de,
 airlied@gmail.com, simona@ffwll.ch, intel-xe@lists.freedesktop.org,
 dri-devel@lists.freedesktop.org
Subject: [PATCH AUTOSEL 6.11 30/32] drm/xe: Handle unreliable MMIO reads
 during forcewake
Date: Mon, 28 Oct 2024 06:50:12 -0400
Message-ID: <20241028105050.3559169-30-sashal@kernel.org>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20241028105050.3559169-1-sashal@kernel.org>
References: <20241028105050.3559169-1-sashal@kernel.org>
MIME-Version: 1.0
X-stable: review
X-Patchwork-Hint: Ignore
X-stable-base: Linux 6.11.5
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

From: Shuicheng Lin <shuicheng.lin@intel.com>

[ Upstream commit 69418db678567bdf9a4992c83d448da462ffa78c ]

In some cases, when the driver attempts to read an MMIO register,
the hardware may return 0xFFFFFFFF. The current force wake path
code treats this as a valid response, as it only checks the BIT.
However, 0xFFFFFFFF should be considered an invalid value, indicating
a potential issue. To address this, we should add a log entry to
highlight this condition and return failure.
The force wake failure log level is changed from notice to err
to match the failure return value.

v2 (Matt Brost):
  - set ret value (-EIO) to kick the error to upper layers
v3 (Rodrigo):
  - add commit message for the log level promotion from notice to err
v4:
  - update reviewed info

Suggested-by: Alex Zuo <alex.zuo@intel.com>
Signed-off-by: Shuicheng Lin <shuicheng.lin@intel.com>
Cc: Matthew Brost <matthew.brost@intel.com>
Cc: Michal Wajdeczko <michal.wajdeczko@intel.com>
Reviewed-by: Himal Prasad Ghimiray <himal.prasad.ghimiray@intel.com>
Acked-by: Badal Nilawar <badal.nilawar@intel.com>
Cc: Anshuman Gupta <anshuman.gupta@intel.com>
Cc: Matt Roper <matthew.d.roper@intel.com>
Cc: Rodrigo Vivi <rodrigo.vivi@intel.com>
Link: https://patchwork.freedesktop.org/patch/msgid/20241017221547.1564029-1-shuicheng.lin@intel.com
Signed-off-by: Rodrigo Vivi <rodrigo.vivi@intel.com>
(cherry picked from commit a9fbeabe7226a3bf90f82d0e28a02c18e3c67447)
Signed-off-by: Lucas De Marchi <lucas.demarchi@intel.com>
Signed-off-by: Sasha Levin <sashal@kernel.org>
---
 drivers/gpu/drm/xe/xe_force_wake.c | 12 +++++++++---
 1 file changed, 9 insertions(+), 3 deletions(-)

diff --git a/drivers/gpu/drm/xe/xe_force_wake.c b/drivers/gpu/drm/xe/xe_force_wake.c
index b263fff152737..7d9fc489dcb81 100644
--- a/drivers/gpu/drm/xe/xe_force_wake.c
+++ b/drivers/gpu/drm/xe/xe_force_wake.c
@@ -115,9 +115,15 @@ static int __domain_wait(struct xe_gt *gt, struct xe_force_wake_domain *domain,
 			     XE_FORCE_WAKE_ACK_TIMEOUT_MS * USEC_PER_MSEC,
 			     &value, true);
 	if (ret)
-		xe_gt_notice(gt, "Force wake domain %d failed to ack %s (%pe) reg[%#x] = %#x\n",
-			     domain->id, str_wake_sleep(wake), ERR_PTR(ret),
-			     domain->reg_ack.addr, value);
+		xe_gt_err(gt, "Force wake domain %d failed to ack %s (%pe) reg[%#x] = %#x\n",
+			  domain->id, str_wake_sleep(wake), ERR_PTR(ret),
+			  domain->reg_ack.addr, value);
+	if (value == ~0) {
+		xe_gt_err(gt,
+			  "Force wake domain %d: %s. MMIO unreliable (forcewake register returns 0xFFFFFFFF)!\n",
+			  domain->id, str_wake_sleep(wake));
+		ret = -EIO;
+	}
 
 	return ret;
 }
-- 
2.43.0

