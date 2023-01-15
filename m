Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 96DAE66AF9E
	for <lists+dri-devel@lfdr.de>; Sun, 15 Jan 2023 08:16:56 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 8684A10E0C4;
	Sun, 15 Jan 2023 07:16:54 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from msg-1.mailo.com (msg-1.mailo.com [213.182.54.11])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 1A5F810E0C4;
 Sun, 15 Jan 2023 07:16:51 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple; d=mailo.com; s=mailo;
 t=1673767007; bh=+fQITG3zFSx+3AQZJEQdW3kgJY9FXR6AQ5P5BGfD2f0=;
 h=X-EA-Auth:Date:From:To:Cc:Subject:Message-ID:References:
 MIME-Version:Content-Type:In-Reply-To;
 b=LpJYY7WRGDZodMaM42Nvvqcb2MZktoqZz+wtt4XW7KBZiD1VUwc4IzgbJOvnTvcf/
 QPZfZcbt9uq3rLkD6qTMS7gSQHXGwfHl0ljBiDiUuRsqlHR8h0WZ19QOHRqt8Kj8gn
 TBlQHS+QRDAIKTJOd/VQCmKw1Z5fO2zlXm/gbk0A=
Received: by b-1.in.mailobj.net [192.168.90.11] with ESMTP
 via ip-206.mailobj.net [213.182.55.206]
 Sun, 15 Jan 2023 08:16:47 +0100 (CET)
X-EA-Auth: TgOkwxa4yz4MbR4/OVAaqXgSCIUEw7Eb+uea7TiQJukxZ6pfKqePsPmuSldH7seB5/nw1+KkWUkNpqZu4IcfmodnAMEIlYgN
Date: Sun, 15 Jan 2023 12:46:43 +0530
From: Deepak R Varma <drv@mailo.com>
To: Evan Quan <evan.quan@amd.com>, Alex Deucher <alexander.deucher@amd.com>,
 Christian =?iso-8859-1?Q?K=F6nig?= <christian.koenig@amd.com>,
 "Pan, Xinhui" <Xinhui.Pan@amd.com>,
 David Airlie <airlied@gmail.com>, Daniel Vetter <daniel@ffwll.ch>,
 amd-gfx@lists.freedesktop.org, dri-devel@lists.freedesktop.org,
 linux-kernel@vger.kernel.org
Subject: [PATCH 1/3] drm/amd/pm/powerplay/smumgr: use bitwise or for addition
Message-ID: <b1cceaacb32bd2a72ac4d8e12a04da3f78e8c41c.1673766696.git.drv@mailo.com>
References: <cover.1673766696.git.drv@mailo.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <cover.1673766696.git.drv@mailo.com>
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
Cc: Praveen Kumar <kumarpraveen@linux.microsoft.com>,
 Saurabh Singh Sengar <ssengar@microsoft.com>
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

For bit mask addition, it is recommended to use or operator "|" instead
of numerical addition as the former is quicker and cleaner. Change
suggested by orplus.cocci Coccinelle semantic patch.

Signed-off-by: Deepak R Varma <drv@mailo.com>
---
 drivers/gpu/drm/amd/pm/powerplay/smumgr/iceland_smumgr.c | 2 +-
 drivers/gpu/drm/amd/pm/powerplay/smumgr/tonga_smumgr.c   | 2 +-
 2 files changed, 2 insertions(+), 2 deletions(-)

diff --git a/drivers/gpu/drm/amd/pm/powerplay/smumgr/iceland_smumgr.c b/drivers/gpu/drm/amd/pm/powerplay/smumgr/iceland_smumgr.c
index 03df35dee8ba..060fc140c574 100644
--- a/drivers/gpu/drm/amd/pm/powerplay/smumgr/iceland_smumgr.c
+++ b/drivers/gpu/drm/amd/pm/powerplay/smumgr/iceland_smumgr.c
@@ -2165,7 +2165,7 @@ static int iceland_program_mem_timing_parameters(struct pp_hwmgr *hwmgr)
 	struct smu7_hwmgr *data = (struct smu7_hwmgr *)(hwmgr->backend);
 
 	if (data->need_update_smu7_dpm_table &
-		(DPMTABLE_OD_UPDATE_SCLK + DPMTABLE_OD_UPDATE_MCLK))
+		(DPMTABLE_OD_UPDATE_SCLK | DPMTABLE_OD_UPDATE_MCLK))
 		return iceland_program_memory_timing_parameters(hwmgr);
 
 	return 0;
diff --git a/drivers/gpu/drm/amd/pm/powerplay/smumgr/tonga_smumgr.c b/drivers/gpu/drm/amd/pm/powerplay/smumgr/tonga_smumgr.c
index 04b561f5d932..acbe41174d7e 100644
--- a/drivers/gpu/drm/amd/pm/powerplay/smumgr/tonga_smumgr.c
+++ b/drivers/gpu/drm/amd/pm/powerplay/smumgr/tonga_smumgr.c
@@ -2554,7 +2554,7 @@ static int tonga_program_mem_timing_parameters(struct pp_hwmgr *hwmgr)
 	struct smu7_hwmgr *data = (struct smu7_hwmgr *)(hwmgr->backend);
 
 	if (data->need_update_smu7_dpm_table &
-		(DPMTABLE_OD_UPDATE_SCLK + DPMTABLE_OD_UPDATE_MCLK))
+		(DPMTABLE_OD_UPDATE_SCLK | DPMTABLE_OD_UPDATE_MCLK))
 		return tonga_program_memory_timing_parameters(hwmgr);
 
 	return 0;
-- 
2.34.1



