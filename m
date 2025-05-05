Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id BEB0CAAA0B1
	for <lists+dri-devel@lfdr.de>; Tue,  6 May 2025 00:38:19 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 20D0510E4F8;
	Mon,  5 May 2025 22:38:18 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=kernel.org header.i=@kernel.org header.b="sT0oeLLy";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from dfw.source.kernel.org (dfw.source.kernel.org [139.178.84.217])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 9734510E4F8;
 Mon,  5 May 2025 22:38:16 +0000 (UTC)
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
 by dfw.source.kernel.org (Postfix) with ESMTP id DF5FC5C4E3B;
 Mon,  5 May 2025 22:35:58 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 6E18BC4CEE4;
 Mon,  5 May 2025 22:38:14 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=k20201202; t=1746484695;
 bh=LfceeoSy3Yuos/oSFvaad0WRsAM7wu6oaK05l1ynG70=;
 h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
 b=sT0oeLLyqo2WaVIStnbS3wx9yy2auyrEqVW7MFqfFD5nnnQNtdrApswr9mX8Uu1Xl
 l0viuwQKoF0niAghgvGPduzPz9RXh/KMGjuXgX3S5c2NihHeji1ycJOilpyXrhmlR6
 r/mOccG0/vz4OvS6YolCETQ2b01BGnI5qbli7hqj7MVwGfqyz6HuE2g+kvkwSa+Ial
 8gQefYSNGmtBt1GsXkOlzmS+RMelSfd5jz7pNBOlRQK2rSRjmckiXBPWPtxWpxhXp/
 rrllZGdjpfhepp3DUVEIdHqABSqcukBwnMhGzujkt5ZVpdueFkg+BGPdgFxkB1viwK
 STGtWCo88ArNw==
From: Sasha Levin <sashal@kernel.org>
To: linux-kernel@vger.kernel.org,
	stable@vger.kernel.org
Cc: Michal Wajdeczko <michal.wajdeczko@intel.com>,
 Matt Roper <matthew.d.roper@intel.com>,
 Lucas De Marchi <lucas.demarchi@intel.com>,
 Sasha Levin <sashal@kernel.org>, thomas.hellstrom@linux.intel.com,
 rodrigo.vivi@intel.com, airlied@gmail.com, simona@ffwll.ch,
 intel-xe@lists.freedesktop.org, dri-devel@lists.freedesktop.org
Subject: [PATCH AUTOSEL 6.14 612/642] drm/xe: Always setup GT MMIO adjustment
 data
Date: Mon,  5 May 2025 18:13:48 -0400
Message-Id: <20250505221419.2672473-612-sashal@kernel.org>
X-Mailer: git-send-email 2.39.5
In-Reply-To: <20250505221419.2672473-1-sashal@kernel.org>
References: <20250505221419.2672473-1-sashal@kernel.org>
MIME-Version: 1.0
X-stable: review
X-Patchwork-Hint: Ignore
X-stable-base: Linux 6.14.5
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

From: Michal Wajdeczko <michal.wajdeczko@intel.com>

[ Upstream commit bbd8429264baf8bc3c40cefda048560ae0eb7890 ]

While we believed that xe_gt_mmio_init() will be called just once
per GT, this might not be a case due to some tweaks that need to
performed by the VF driver during early probe.  To avoid leaving
any stale data in case of the re-run, reset the GT MMIO adjustment
data for the non-media GT case.

Signed-off-by: Michal Wajdeczko <michal.wajdeczko@intel.com>
Cc: Matt Roper <matthew.d.roper@intel.com>
Reviewed-by: Lucas De Marchi <lucas.demarchi@intel.com>
Link: https://patchwork.freedesktop.org/patch/msgid/20241114175955.2299-2-michal.wajdeczko@intel.com
Signed-off-by: Sasha Levin <sashal@kernel.org>
---
 drivers/gpu/drm/xe/xe_gt.c | 3 +++
 1 file changed, 3 insertions(+)

diff --git a/drivers/gpu/drm/xe/xe_gt.c b/drivers/gpu/drm/xe/xe_gt.c
index 94eed1315b0f1..a749de08982b8 100644
--- a/drivers/gpu/drm/xe/xe_gt.c
+++ b/drivers/gpu/drm/xe/xe_gt.c
@@ -650,6 +650,9 @@ void xe_gt_mmio_init(struct xe_gt *gt)
 	if (gt->info.type == XE_GT_TYPE_MEDIA) {
 		gt->mmio.adj_offset = MEDIA_GT_GSI_OFFSET;
 		gt->mmio.adj_limit = MEDIA_GT_GSI_LENGTH;
+	} else {
+		gt->mmio.adj_offset = 0;
+		gt->mmio.adj_limit = 0;
 	}
 
 	if (IS_SRIOV_VF(gt_to_xe(gt)))
-- 
2.39.5

