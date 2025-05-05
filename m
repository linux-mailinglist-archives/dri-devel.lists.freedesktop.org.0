Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 419A9AAA1C5
	for <lists+dri-devel@lfdr.de>; Tue,  6 May 2025 00:51:41 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 9E05210E563;
	Mon,  5 May 2025 22:51:39 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=kernel.org header.i=@kernel.org header.b="JC5tqzDI";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from nyc.source.kernel.org (nyc.source.kernel.org [147.75.193.91])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 2369310E563;
 Mon,  5 May 2025 22:51:39 +0000 (UTC)
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
 by nyc.source.kernel.org (Postfix) with ESMTP id BF441A4D044;
 Mon,  5 May 2025 22:46:10 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id E07A0C4CEE4;
 Mon,  5 May 2025 22:51:36 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=k20201202; t=1746485498;
 bh=coLhG9Pp1bgSTr9mtBnDZVokSNSSpLEUVDDReXuEQes=;
 h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
 b=JC5tqzDI+zVUhZ3Xl3flGvNNH3EN0VAMeimdQ346xS2QvhbRddC7VGBRYGU30otdN
 jfKF6TK6b4fcmMK13j67jM4duzTSRK58wpIo5KQXu3hOeNevKnScejcdCg8cH0c5fd
 PzrSHCraV2VmBqMzlzV37TlFc2wacz7i/40yJP/hv4aY1m5A2YWbgiUuaIs8hjOeij
 Crg4MF6vSj0AcqiqY1yclvR0h7oQ1yWNerZmUOK9TU1DDCyOuSlgrTiPaiNpo+JmYK
 3O0nGYRD9LQQgc1U5xAwCvEWx0+tm5MGZjl9v4y/CRpDGQ57zIZLuKxmsrhGEBFDVr
 MMKnzqs6buteQ==
From: Sasha Levin <sashal@kernel.org>
To: linux-kernel@vger.kernel.org,
	stable@vger.kernel.org
Cc: Shuicheng Lin <shuicheng.lin@intel.com>,
 Rodrigo Vivi <rodrigo.vivi@intel.com>, Sasha Levin <sashal@kernel.org>,
 lucas.demarchi@intel.com, thomas.hellstrom@linux.intel.com,
 airlied@gmail.com, simona@ffwll.ch, intel-xe@lists.freedesktop.org,
 dri-devel@lists.freedesktop.org
Subject: [PATCH AUTOSEL 6.12 348/486] drm/xe/debugfs: Add missing
 xe_pm_runtime_put in wedge_mode_set
Date: Mon,  5 May 2025 18:37:04 -0400
Message-Id: <20250505223922.2682012-348-sashal@kernel.org>
X-Mailer: git-send-email 2.39.5
In-Reply-To: <20250505223922.2682012-1-sashal@kernel.org>
References: <20250505223922.2682012-1-sashal@kernel.org>
MIME-Version: 1.0
X-stable: review
X-Patchwork-Hint: Ignore
X-stable-base: Linux 6.12.26
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

[ Upstream commit b31e668d3111b100d16fd7db8db335328ce8c6d5 ]

xe_pm_runtime_put is missed in the failure path.

Cc: Rodrigo Vivi <rodrigo.vivi@intel.com>
Signed-off-by: Shuicheng Lin <shuicheng.lin@intel.com>
Reviewed-by: Rodrigo Vivi <rodrigo.vivi@intel.com>
Link: https://patchwork.freedesktop.org/patch/msgid/20250213230322.1180621-1-shuicheng.lin@intel.com
Signed-off-by: Rodrigo Vivi <rodrigo.vivi@intel.com>
Signed-off-by: Sasha Levin <sashal@kernel.org>
---
 drivers/gpu/drm/xe/xe_debugfs.c | 1 +
 1 file changed, 1 insertion(+)

diff --git a/drivers/gpu/drm/xe/xe_debugfs.c b/drivers/gpu/drm/xe/xe_debugfs.c
index 051a37e477f4c..278ce1c37b395 100644
--- a/drivers/gpu/drm/xe/xe_debugfs.c
+++ b/drivers/gpu/drm/xe/xe_debugfs.c
@@ -156,6 +156,7 @@ static ssize_t wedged_mode_set(struct file *f, const char __user *ubuf,
 		ret = xe_guc_ads_scheduler_policy_toggle_reset(&gt->uc.guc.ads);
 		if (ret) {
 			xe_gt_err(gt, "Failed to update GuC ADS scheduler policy. GuC may still cause engine reset even with wedged_mode=2\n");
+			xe_pm_runtime_put(xe);
 			return -EIO;
 		}
 	}
-- 
2.39.5

