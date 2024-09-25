Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 882EB9858D1
	for <lists+dri-devel@lfdr.de>; Wed, 25 Sep 2024 13:47:36 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id E42DE10E939;
	Wed, 25 Sep 2024 11:47:27 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=kernel.org header.i=@kernel.org header.b="uWjcd1q6";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from dfw.source.kernel.org (dfw.source.kernel.org [139.178.84.217])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 93D5910E939;
 Wed, 25 Sep 2024 11:47:26 +0000 (UTC)
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
 by dfw.source.kernel.org (Postfix) with ESMTP id 15D1C5C5846;
 Wed, 25 Sep 2024 11:47:22 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id E3B0DC4CEC3;
 Wed, 25 Sep 2024 11:47:23 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=k20201202; t=1727264845;
 bh=rzK5O95JgbjDpL/AA5VaWdPSBZInlDNs7nukUFJRlWs=;
 h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
 b=uWjcd1q6MFAyf6Qs88iQs06wqP0+Fg9ojK/ETBmVmI7yaBCmo68Er6A3jySWkdcAg
 MeNlWbagJqR2SrcZV80mB6VcPmh9BtzAar9P4WV9jqWBHquFbNBTOIojZZr34/52z7
 YmQkAyln/fiqYbOIoN/7WMw4rNnH40E+ZdMotL6kGAjQI9aTFxctVF/Q174DvHAf5p
 x1qIQMOAf4U9iyljNwV9An3O/HNjTbd0c3sXclTw3yIDW8mc9fOO62Z543+1pBVw90
 Zqe23c0u4dz62dIoQzvDR52h3Jl5zeapLtJ3RSDWnRk71KYyctubeWlVnI50i+3vHr
 HOfZDF2sGL67w==
From: Sasha Levin <sashal@kernel.org>
To: linux-kernel@vger.kernel.org,
	stable@vger.kernel.org
Cc: Matt Roper <matthew.d.roper@intel.com>,
 Jonathan Cavitt <jonathan.cavitt@intel.com>,
 Sasha Levin <sashal@kernel.org>, lucas.demarchi@intel.com,
 thomas.hellstrom@linux.intel.com, rodrigo.vivi@intel.com,
 maarten.lankhorst@linux.intel.com, mripard@kernel.org, tzimmermann@suse.de,
 airlied@gmail.com, daniel@ffwll.ch, intel-xe@lists.freedesktop.org,
 dri-devel@lists.freedesktop.org
Subject: [PATCH AUTOSEL 6.11 160/244] drm/xe: Name and document Wa_14019789679
Date: Wed, 25 Sep 2024 07:26:21 -0400
Message-ID: <20240925113641.1297102-160-sashal@kernel.org>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20240925113641.1297102-1-sashal@kernel.org>
References: <20240925113641.1297102-1-sashal@kernel.org>
MIME-Version: 1.0
X-stable: review
X-Patchwork-Hint: Ignore
X-stable-base: Linux 6.11
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

From: Matt Roper <matthew.d.roper@intel.com>

[ Upstream commit 1d734a3e5d6bb266f52eaf2b1400c5d3f1875a54 ]

Early in the development of Xe we identified an issue with SVG state
handling on DG2 and MTL (and later on Xe2 as well).  In
commit 72ac304769dd ("drm/xe: Emit SVG state on RCS during driver load
on DG2 and MTL") and commit fb24b858a20d ("drm/xe/xe2: Update SVG state
handling") we implemented our own workaround to prevent SVG state from
leaking from context A to context B in cases where context B never
issues a specific state setting.

The hardware teams have now created official workaround Wa_14019789679
to cover this issue.  The workaround description only requires emitting
3DSTATE_MESH_CONTROL, since they believe that's the only SVG instruction
that would potentially remain unset by a context B, but still cause
notable issues if unwanted values were inherited from context A.
However since we already have a more extensive implementation that emits
the entire SVG state and prevents _any_ SVG state from unintentionally
leaking, we'll stick with our existing implementation just to be safe.

Signed-off-by: Matt Roper <matthew.d.roper@intel.com>
Reviewed-by: Jonathan Cavitt <jonathan.cavitt@intel.com>
Link: https://patchwork.freedesktop.org/patch/msgid/20240812181042.2013508-2-matthew.d.roper@intel.com
Signed-off-by: Sasha Levin <sashal@kernel.org>
---
 drivers/gpu/drm/xe/xe_lrc.c        | 35 +++++++++++++++++++++---------
 drivers/gpu/drm/xe/xe_wa_oob.rules |  2 ++
 2 files changed, 27 insertions(+), 10 deletions(-)

diff --git a/drivers/gpu/drm/xe/xe_lrc.c b/drivers/gpu/drm/xe/xe_lrc.c
index 58121821f0814..974a9cd8c3795 100644
--- a/drivers/gpu/drm/xe/xe_lrc.c
+++ b/drivers/gpu/drm/xe/xe_lrc.c
@@ -5,6 +5,8 @@
 
 #include "xe_lrc.h"
 
+#include <generated/xe_wa_oob.h>
+
 #include <linux/ascii85.h>
 
 #include "instructions/xe_mi_commands.h"
@@ -24,6 +26,7 @@
 #include "xe_memirq.h"
 #include "xe_sriov.h"
 #include "xe_vm.h"
+#include "xe_wa.h"
 
 #define LRC_VALID				BIT_ULL(0)
 #define LRC_PRIVILEGE				BIT_ULL(8)
@@ -1581,19 +1584,31 @@ void xe_lrc_emit_hwe_state_instructions(struct xe_exec_queue *q, struct xe_bb *b
 	int state_table_size = 0;
 
 	/*
-	 * At the moment we only need to emit non-register state for the RCS
-	 * engine.
+	 * Wa_14019789679
+	 *
+	 * If the driver doesn't explicitly emit the SVG instructions while
+	 * setting up the default LRC, the context switch will write 0's
+	 * (noops) into the LRC memory rather than the expected instruction
+	 * headers.  Application contexts start out as a copy of the default
+	 * LRC, and if they also do not emit specific settings for some SVG
+	 * state, then on context restore they'll unintentionally inherit
+	 * whatever state setting the previous context had programmed into the
+	 * hardware (i.e., the lack of a 3DSTATE_* instruction in the LRC will
+	 * prevent the hardware from resetting that state back to any specific
+	 * value).
+	 *
+	 * The official workaround only requires emitting 3DSTATE_MESH_CONTROL
+	 * since that's a specific state setting that can easily cause GPU
+	 * hangs if unintentionally inherited.  However to be safe we'll
+	 * continue to emit all of the SVG state since it's best not to leak
+	 * any of the state between contexts, even if that leakage is harmless.
 	 */
-	if (q->hwe->class != XE_ENGINE_CLASS_RENDER)
-		return;
-
-	switch (GRAPHICS_VERx100(xe)) {
-	case 1255:
-	case 1270 ... 2004:
+	if (XE_WA(gt, 14019789679) && q->hwe->class == XE_ENGINE_CLASS_RENDER) {
 		state_table = xe_hpg_svg_state;
 		state_table_size = ARRAY_SIZE(xe_hpg_svg_state);
-		break;
-	default:
+	}
+
+	if (!state_table) {
 		xe_gt_dbg(gt, "No non-register state to emit on graphics ver %d.%02d\n",
 			  GRAPHICS_VER(xe), GRAPHICS_VERx100(xe) % 100);
 		return;
diff --git a/drivers/gpu/drm/xe/xe_wa_oob.rules b/drivers/gpu/drm/xe/xe_wa_oob.rules
index 08f7336881e32..d4c33dbc14c7a 100644
--- a/drivers/gpu/drm/xe/xe_wa_oob.rules
+++ b/drivers/gpu/drm/xe/xe_wa_oob.rules
@@ -30,3 +30,5 @@
 22019338487	MEDIA_VERSION(2000)
 		GRAPHICS_VERSION(2001)
 16023588340	GRAPHICS_VERSION(2001)
+14019789679	GRAPHICS_VERSION(1255)
+		GRAPHICS_VERSION_RANGE(1270, 2004)
-- 
2.43.0

