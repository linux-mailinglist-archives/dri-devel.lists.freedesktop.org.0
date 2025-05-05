Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 14FD2AAA089
	for <lists+dri-devel@lfdr.de>; Tue,  6 May 2025 00:36:07 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 60F4B10E4E6;
	Mon,  5 May 2025 22:36:05 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=kernel.org header.i=@kernel.org header.b="IAL5jiSh";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from nyc.source.kernel.org (nyc.source.kernel.org [147.75.193.91])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 4833910E4E1;
 Mon,  5 May 2025 22:36:03 +0000 (UTC)
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
 by nyc.source.kernel.org (Postfix) with ESMTP id D7A15A4CEA8;
 Mon,  5 May 2025 22:30:34 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 0BEA0C4CEEF;
 Mon,  5 May 2025 22:36:00 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=k20201202; t=1746484562;
 bh=F973BCTRSrl66uFyaTkGbQP5pwTjAHxZzTa3RasnXYU=;
 h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
 b=IAL5jiShD1jcoT9NJeWEkRHNGDEhJGshphEFvLPE18TbeZ+RorTjxlKy1alBHDKFq
 wUU66NfQCjGdm0FflVZGGiJJekR7NI+szq+SJKBvV7Jk8eSRZGH9OrgRVhchGdTP9z
 R0KIU31RD0fVUMCj3OwBdDcEqy+xnd/MsUzfNi1IC5ZP9XIUJ3z4/C/8VY4xImzKLq
 AohA9l+StxIqvExexq3mx/FkkYvO5J0XVtTdA3ffw9CKQrZPLbMMIYNfraEntzl9wY
 oLO52wmA5y9HEuPNudmFEKseyL7Iankf46TXnHrX5TvtvWPd/jjsor0MJerMtpZQ7Y
 ZNYlSU9ZrL9gw==
From: Sasha Levin <sashal@kernel.org>
To: linux-kernel@vger.kernel.org,
	stable@vger.kernel.org
Cc: Rodrigo Vivi <rodrigo.vivi@intel.com>,
 Lucas De Marchi <lucas.demarchi@intel.com>,
 Vinay Belgaumkar <vinay.belgaumkar@intel.com>,
 Sasha Levin <sashal@kernel.org>, thomas.hellstrom@linux.intel.com,
 airlied@gmail.com, simona@ffwll.ch, intel-xe@lists.freedesktop.org,
 dri-devel@lists.freedesktop.org
Subject: [PATCH AUTOSEL 6.14 538/642] drm/xe: Fix PVC RPe and RPa information
Date: Mon,  5 May 2025 18:12:34 -0400
Message-Id: <20250505221419.2672473-538-sashal@kernel.org>
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

From: Rodrigo Vivi <rodrigo.vivi@intel.com>

[ Upstream commit 8a734b9359cfa1bdb805f5ca23e20bd99dd18a0a ]

A simple lazy buggy copy and paste of the PVC comment has brought
the attention to the incorrect masks of the PVC register for RPa
and RPe. So, let's fix them all.

Cc: Lucas De Marchi <lucas.demarchi@intel.com>
Cc: Vinay Belgaumkar <vinay.belgaumkar@intel.com>
Reviewed-by: Vinay Belgaumkar <vinay.belgaumkar@intel.com>
Link: https://patchwork.freedesktop.org/patch/msgid/20250109195219.658557-1-rodrigo.vivi@intel.com
Signed-off-by: Rodrigo Vivi <rodrigo.vivi@intel.com>
Signed-off-by: Sasha Levin <sashal@kernel.org>
---
 drivers/gpu/drm/xe/xe_guc_pc.c | 22 ++++++++++++----------
 1 file changed, 12 insertions(+), 10 deletions(-)

diff --git a/drivers/gpu/drm/xe/xe_guc_pc.c b/drivers/gpu/drm/xe/xe_guc_pc.c
index f382f5d53ca8b..2276d85926fcb 100644
--- a/drivers/gpu/drm/xe/xe_guc_pc.c
+++ b/drivers/gpu/drm/xe/xe_guc_pc.c
@@ -371,16 +371,17 @@ static void tgl_update_rpa_value(struct xe_guc_pc *pc)
 	u32 reg;
 
 	/*
-	 * For PVC we still need to use fused RP1 as the approximation for RPe
-	 * For other platforms than PVC we get the resolved RPe directly from
+	 * For PVC we still need to use fused RP0 as the approximation for RPa
+	 * For other platforms than PVC we get the resolved RPa directly from
 	 * PCODE at a different register
 	 */
-	if (xe->info.platform == XE_PVC)
+	if (xe->info.platform == XE_PVC) {
 		reg = xe_mmio_read32(&gt->mmio, PVC_RP_STATE_CAP);
-	else
+		pc->rpa_freq = REG_FIELD_GET(RP0_MASK, reg) * GT_FREQUENCY_MULTIPLIER;
+	} else {
 		reg = xe_mmio_read32(&gt->mmio, FREQ_INFO_REC);
-
-	pc->rpa_freq = REG_FIELD_GET(RPA_MASK, reg) * GT_FREQUENCY_MULTIPLIER;
+		pc->rpa_freq = REG_FIELD_GET(RPA_MASK, reg) * GT_FREQUENCY_MULTIPLIER;
+	}
 }
 
 static void tgl_update_rpe_value(struct xe_guc_pc *pc)
@@ -394,12 +395,13 @@ static void tgl_update_rpe_value(struct xe_guc_pc *pc)
 	 * For other platforms than PVC we get the resolved RPe directly from
 	 * PCODE at a different register
 	 */
-	if (xe->info.platform == XE_PVC)
+	if (xe->info.platform == XE_PVC) {
 		reg = xe_mmio_read32(&gt->mmio, PVC_RP_STATE_CAP);
-	else
+		pc->rpe_freq = REG_FIELD_GET(RP1_MASK, reg) * GT_FREQUENCY_MULTIPLIER;
+	} else {
 		reg = xe_mmio_read32(&gt->mmio, FREQ_INFO_REC);
-
-	pc->rpe_freq = REG_FIELD_GET(RPE_MASK, reg) * GT_FREQUENCY_MULTIPLIER;
+		pc->rpe_freq = REG_FIELD_GET(RPE_MASK, reg) * GT_FREQUENCY_MULTIPLIER;
+	}
 }
 
 static void pc_update_rp_values(struct xe_guc_pc *pc)
-- 
2.39.5

