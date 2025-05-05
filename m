Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id BB3A6AAA01A
	for <lists+dri-devel@lfdr.de>; Tue,  6 May 2025 00:31:58 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 0DE6910E4AB;
	Mon,  5 May 2025 22:31:57 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=kernel.org header.i=@kernel.org header.b="sgftdVMn";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from dfw.source.kernel.org (dfw.source.kernel.org [139.178.84.217])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 277B510E4AB;
 Mon,  5 May 2025 22:31:56 +0000 (UTC)
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
 by dfw.source.kernel.org (Postfix) with ESMTP id 6F3675C5523;
 Mon,  5 May 2025 22:29:38 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id EC5E6C4CEED;
 Mon,  5 May 2025 22:31:53 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=k20201202; t=1746484315;
 bh=0+x/1ba+TCL1sFEC6TM5FPJpMZfBZBascbItQHc6Fe0=;
 h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
 b=sgftdVMnM5Lz40NihVmPIJ9hkH3xpIQHWB0+2H4ivyTILFQCiRBwpuVydaPJHL1wk
 XxNQvCmXMrd0H1irgtF1ubhQhNkq3rR0U/XyXhItyt02Ihqc+THG+tG2fJQxWdwrab
 yx0f8pNVqgHykiFUWBCtVkWahauBg+p91XZe831fwJ7Zb0nnUAhdW5qwZKZMPVmYw+
 kNXc2iIQZ/e5AnpWDRD3mid5o5udE7HSeXUMsGIpN9jbIMb6zeQgJH9itODs6De1sx
 iIv88fUft87syUHwp064yUogo23F8czYExy1UfXVkpxWLgolo4/IQIZ0QgFU+a1wph
 LCGG1BMSZiT8Q==
From: Sasha Levin <sashal@kernel.org>
To: linux-kernel@vger.kernel.org,
	stable@vger.kernel.org
Cc: Rodrigo Vivi <rodrigo.vivi@intel.com>, Imre Deak <imre.deak@intel.com>,
 Sasha Levin <sashal@kernel.org>, jani.nikula@linux.intel.com,
 lucas.demarchi@intel.com, thomas.hellstrom@linux.intel.com,
 airlied@gmail.com, simona@ffwll.ch, intel-gfx@lists.freedesktop.org,
 intel-xe@lists.freedesktop.org, dri-devel@lists.freedesktop.org
Subject: [PATCH AUTOSEL 6.14 449/642] drm/xe/display: Remove hpd cancel work
 sync from runtime pm path
Date: Mon,  5 May 2025 18:11:05 -0400
Message-Id: <20250505221419.2672473-449-sashal@kernel.org>
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

[ Upstream commit 1ed591582b7b894d2f7e7ab5cef2e9b0b6fef12b ]

This function will synchronously cancel and wait for many display
work queue items, which might try to take the runtime pm reference
causing a bad deadlock. So, remove it from the runtime_pm suspend patch.

Reported-by: Imre Deak <imre.deak@intel.com>
Reviewed-by: Imre Deak <imre.deak@intel.com>
Link: https://patchwork.freedesktop.org/patch/msgid/20250212192447.402715-1-rodrigo.vivi@intel.com
Signed-off-by: Rodrigo Vivi <rodrigo.vivi@intel.com>
Signed-off-by: Sasha Levin <sashal@kernel.org>
---
 drivers/gpu/drm/xe/display/xe_display.c | 3 ++-
 1 file changed, 2 insertions(+), 1 deletion(-)

diff --git a/drivers/gpu/drm/xe/display/xe_display.c b/drivers/gpu/drm/xe/display/xe_display.c
index b3921dbc52ff6..b735e30953cee 100644
--- a/drivers/gpu/drm/xe/display/xe_display.c
+++ b/drivers/gpu/drm/xe/display/xe_display.c
@@ -346,7 +346,8 @@ static void __xe_display_pm_suspend(struct xe_device *xe, bool runtime)
 
 	xe_display_flush_cleanup_work(xe);
 
-	intel_hpd_cancel_work(xe);
+	if (!runtime)
+		intel_hpd_cancel_work(xe);
 
 	if (!runtime && has_display(xe)) {
 		intel_display_driver_suspend_access(display);
-- 
2.39.5

