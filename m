Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id A2402A72967
	for <lists+dri-devel@lfdr.de>; Thu, 27 Mar 2025 05:05:09 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 70A1010E038;
	Thu, 27 Mar 2025 04:05:06 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from ssh248.corpemail.net (unknown [210.51.61.248])
 by gabe.freedesktop.org (Postfix) with ESMTPS id DC54A10E038
 for <dri-devel@lists.freedesktop.org>; Thu, 27 Mar 2025 04:04:59 +0000 (UTC)
Received: from jtjnmail201608.home.langchao.com
 by ssh248.corpemail.net ((D)) with ASMTP (SSL) id 202503271204425699;
 Thu, 27 Mar 2025 12:04:42 +0800
Received: from locahost.localdomain.com (10.94.8.32) by
 jtjnmail201608.home.langchao.com (10.100.2.8) with Microsoft SMTP Server id
 15.1.2507.39; Thu, 27 Mar 2025 12:04:43 +0800
From: Charles Han <hanchunchao@inspur.com>
To: <kenneth.feng@amd.com>, <alexander.deucher@amd.com>,
 <christian.koenig@amd.com>, <airlied@gmail.com>, <simona@ffwll.ch>,
 <sid@itb.spb.ru>, <Tim.Huang@amd.com>, <jesse.zhang@amd.com>,
 <linux@treblig.org>, <ray.huang@amd.com>, <Rex.Zhu@amd.com>,
 <evan.quan@amd.com>
CC: <amd-gfx@lists.freedesktop.org>, <dri-devel@lists.freedesktop.org>,
 Charles Han <hanchunchao@inspur.com>
Subject: [PATCH] drm/amd/pp: Fix potential NULL pointer dereference in
 atomctrl_initialize_mc_reg_table
Date: Thu, 27 Mar 2025 12:04:35 +0800
Message-ID: <20250327040435.2470-1-hanchunchao@inspur.com>
X-Mailer: git-send-email 2.43.0
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-Originating-IP: [10.94.8.32]
tUid: 2025327120442563de7936e55f04c29022374788ddd14
X-Abuse-Reports-To: service@corp-email.com
Abuse-Reports-To: service@corp-email.com
X-Complaints-To: service@corp-email.com
X-Report-Abuse-To: service@corp-email.com
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

The function atomctrl_initialize_mc_reg_table() and
atomctrl_initialize_mc_reg_table_v2_2() does not check the return
value of smu_atom_get_data_table(). If smu_atom_get_data_table()
fails to retrieve vram_info, it returns NULL which is later
dereferenced.

Fixes: b3892e2bb519 ("drm/amd/pp: Use atombios api directly in powerplay (v2)")
Fixes: 5f92b48cf62c ("drm/amd/pm: add mc register table initialization")
Signed-off-by: Charles Han <hanchunchao@inspur.com>
---
 drivers/gpu/drm/amd/pm/powerplay/hwmgr/ppatomctrl.c | 8 ++++++++
 1 file changed, 8 insertions(+)

diff --git a/drivers/gpu/drm/amd/pm/powerplay/hwmgr/ppatomctrl.c b/drivers/gpu/drm/amd/pm/powerplay/hwmgr/ppatomctrl.c
index 4bd92fd782be..8d40ed0f0e83 100644
--- a/drivers/gpu/drm/amd/pm/powerplay/hwmgr/ppatomctrl.c
+++ b/drivers/gpu/drm/amd/pm/powerplay/hwmgr/ppatomctrl.c
@@ -143,6 +143,10 @@ int atomctrl_initialize_mc_reg_table(
 	vram_info = (ATOM_VRAM_INFO_HEADER_V2_1 *)
 		smu_atom_get_data_table(hwmgr->adev,
 				GetIndexIntoMasterTable(DATA, VRAM_Info), &size, &frev, &crev);
+	if (!vram_info) {
+		pr_err("Could not retrieve the VramInfo table!");
+		return -EINVAL;
+	}
 
 	if (module_index >= vram_info->ucNumOfVRAMModule) {
 		pr_err("Invalid VramInfo table.");
@@ -180,6 +184,10 @@ int atomctrl_initialize_mc_reg_table_v2_2(
 	vram_info = (ATOM_VRAM_INFO_HEADER_V2_2 *)
 		smu_atom_get_data_table(hwmgr->adev,
 				GetIndexIntoMasterTable(DATA, VRAM_Info), &size, &frev, &crev);
+	if (!vram_info) {
+		pr_err("Could not retrieve the VramInfo table!");
+		return -EINVAL;
+	}
 
 	if (module_index >= vram_info->ucNumOfVRAMModule) {
 		pr_err("Invalid VramInfo table.");
-- 
2.43.0

