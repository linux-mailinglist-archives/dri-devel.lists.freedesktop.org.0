Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 0C326AA0BA5
	for <lists+dri-devel@lfdr.de>; Tue, 29 Apr 2025 14:28:57 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 1C54C10E0CB;
	Tue, 29 Apr 2025 12:28:53 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=mcst.ru header.i=@mcst.ru header.b="p5ZA9exv";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from tretyak2q.mcst.ru (tretyak2q.mcst.ru [213.247.143.17])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 5A30E10E433
 for <dri-devel@lists.freedesktop.org>; Tue, 29 Apr 2025 12:28:47 +0000 (UTC)
Received: from tretyak2q.mcst.ru (localhost.localdomain [127.0.0.1])
 by tretyak2q.mcst.ru (Proxmox) with ESMTP id E2888100BD1
 for <dri-devel@lists.freedesktop.org>; Tue, 29 Apr 2025 15:28:37 +0300 (MSK)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=mcst.ru; h=cc:cc
 :content-transfer-encoding:date:from:from:message-id
 :mime-version:reply-to:subject:subject:to:to; s=dkim; bh=ywxBNZm
 /e8MuqcQvNAqzfZyw9hVYSTV4wTfXNoxerqU=; b=p5ZA9exveVnEd/AVFHrAPky
 wTA+tUq7WuVaCUDajMDcHNYVm9djyGMWplG4gnw/v5+vqO0AuWDvEcZ5EqdCg57F
 5zDxMcDrv+XFlqtK6UVIdgS6V94imODgkH/xIglmjfXrfJJsaHqvg7/yUOdrKfdc
 xwzN/Jfcmbqdky7blaWTENpCTDYn6pYk4tP79g+sB5liglyo55mtofn5FDCdepyE
 570I9x8b/FiyV8QqPnXO9i1v0cSGuLL2Ewi+cTEAnjqMHt0VO1/myRYvepPIgclt
 r2cfWLxQMz9KMBSPeXwFy6al93GFIDFdU+4PmyKLDX5E0zE7EvbaUXT6r3/rHUQ=
 =
X-Virus-Scanned: Debian amavis at mcst.ru
From: Igor Artemiev <Igor.A.Artemiev@mcst.ru>
To: stable@vger.kernel.org,
	Greg Kroah-Hartman <gregkh@linuxfoundation.org>
Cc: Igor Artemiev <Igor.A.Artemiev@mcst.ru>, Evan Quan <evan.quan@amd.com>,
 Alex Deucher <alexander.deucher@amd.com>,
 =?UTF-8?q?Christian=20K=C3=B6nig?= <christian.koenig@amd.com>,
 David Airlie <airlied@linux.ie>, Daniel Vetter <daniel@ffwll.ch>,
 amd-gfx@lists.freedesktop.org, dri-devel@lists.freedesktop.org,
 linux-kernel@vger.kernel.org, lvc-project@linuxtesting.org,
 Alexey Kodanev <aleksei.kodanev@bell-sw.com>
Subject: [lvc-project] [PATCH 5.10/5.15] drm/amd/pm: vega10_hwmgr: fix
 potential off-by-one overflow in 'performance_levels'
Date: Tue, 29 Apr 2025 15:20:15 +0300
Message-Id: <20250429122015.1503994-1-Igor.A.Artemiev@mcst.ru>
X-Mailer: git-send-email 2.39.2
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

From: Alexey Kodanev <aleksei.kodanev@bell-sw.com>

commit 2cc4a5914ce952d6fc83b0f8089a23095ad4f677 upstream.

Since 'hardwareActivityPerformanceLevels' is set to the size of the
'performance_levels' array in vega10_hwmgr_backend_init(), using the
'<=' assertion to check for the next index value is incorrect.
Replace it with '<'.

Detected using the static analysis tool - Svace.
Fixes: f83a9991648b ("drm/amd/powerplay: add Vega10 powerplay support (v5)")
Reviewed-by: Evan Quan <evan.quan@amd.com>
Signed-off-by: Alexey Kodanev <aleksei.kodanev@bell-sw.com>
Signed-off-by: Alex Deucher <alexander.deucher@amd.com>
[Igor: In order to adapt this patch to branch 5.10/5.15 the variable name
'vega10_ps' has been changed to 'vega10_power_state' as it is used 
in branch 5.10/5.15.] 
Signed-off-by: Igor Artemiev <Igor.A.Artemiev@mcst.ru>
---
 drivers/gpu/drm/amd/pm/powerplay/hwmgr/vega10_hwmgr.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/drivers/gpu/drm/amd/pm/powerplay/hwmgr/vega10_hwmgr.c b/drivers/gpu/drm/amd/pm/powerplay/hwmgr/vega10_hwmgr.c
index 79a41180adf1..30eab5002077 100644
--- a/drivers/gpu/drm/amd/pm/powerplay/hwmgr/vega10_hwmgr.c
+++ b/drivers/gpu/drm/amd/pm/powerplay/hwmgr/vega10_hwmgr.c
@@ -3171,7 +3171,7 @@ static int vega10_get_pp_table_entry_callback_func(struct pp_hwmgr *hwmgr,
 			return -1);
 
 	PP_ASSERT_WITH_CODE(
-			(vega10_power_state->performance_level_count <=
+			(vega10_power_state->performance_level_count <
 					hwmgr->platform_descriptor.
 					hardwareActivityPerformanceLevels),
 			"Performance levels exceeds Driver limit!",
-- 
2.39.2


