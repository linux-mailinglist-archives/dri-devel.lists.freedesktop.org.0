Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 8F5E8419411
	for <lists+dri-devel@lfdr.de>; Mon, 27 Sep 2021 14:21:16 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id D80EC6E841;
	Mon, 27 Sep 2021 12:21:11 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 5099E6E83A;
 Mon, 27 Sep 2021 12:21:10 +0000 (UTC)
Received: by mail.kernel.org (Postfix) with ESMTPSA id 31D5B61058;
 Mon, 27 Sep 2021 12:21:07 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=k20201202; t=1632745270;
 bh=kEUnvq6r3df7WOYaeqB5E+DLccPdbdebgIInj07zILU=;
 h=From:To:Cc:Subject:Date:From;
 b=kp4bOf49VtZ+onb9V1XGhpj7eYyxSuMwtgYl6GhW1kSVI+8n4iqeVqZ9Ssv9HtKin
 i3CMVAEDfzmBCfXrggwhkCds+7kZOR7Aw+KE9B09S/upNAP8LH3YRyM5PNtGDvOdgJ
 9ar5ZG4FezOMuDadyIpwx4Ggn1PR23vLqJFwdvIlrziCxGmECksJrRSxthqv80yL+g
 lCDsPzQbqkiJBnhpouXmvDFuemz48qH+Lkr/SENEQl53WWJAMeWED+kxGHw4rClgzf
 mDJZqCcm5G0I6daxgx2QgX2/qRFZ6fPDov26neVaN+kp9wmhLnMWGt0L0U9vQgkOAW
 m7A69UC+HlWHw==
From: Arnd Bergmann <arnd@kernel.org>
To: Harry Wentland <harry.wentland@amd.com>, Leo Li <sunpeng.li@amd.com>,
 Alex Deucher <alexander.deucher@amd.com>,
 =?UTF-8?q?Christian=20K=C3=B6nig?= <christian.koenig@amd.com>,
 "Pan, Xinhui" <Xinhui.Pan@amd.com>, David Airlie <airlied@linux.ie>,
 Daniel Vetter <daniel@ffwll.ch>, Evan Quan <evan.quan@amd.com>
Cc: Arnd Bergmann <arnd@arndb.de>, Nathan Chancellor <nathan@kernel.org>,
 Nick Desaulniers <ndesaulniers@google.com>,
 Randy Dunlap <rdunlap@infradead.org>,
 Mauro Carvalho Chehab <mchehab+huawei@kernel.org>,
 amd-gfx@lists.freedesktop.org, dri-devel@lists.freedesktop.org,
 linux-kernel@vger.kernel.org, llvm@lists.linux.dev
Subject: [PATCH] gpu: amd: replace open-coded offsetof() with builtin
Date: Mon, 27 Sep 2021 14:20:41 +0200
Message-Id: <20210927122105.942129-1-arnd@kernel.org>
X-Mailer: git-send-email 2.29.2
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

From: Arnd Bergmann <arnd@arndb.de>

The two AMD drivers have their own custom offsetof() implementation
that now triggers a warning with recent versions of clang:

drivers/gpu/drm/radeon/radeon_atombios.c:133:14: error: performing pointer subtraction with a null pointer has undefined behavior [-Werror,-Wnull-pointer-subtraction]

Change all the instances to use the normal offsetof() provided
by the kernel that does not have this problem.

Signed-off-by: Arnd Bergmann <arnd@arndb.de>
---
 drivers/gpu/drm/amd/display/dc/bios/command_table2.c  | 4 +---
 drivers/gpu/drm/amd/include/atombios.h                | 2 +-
 drivers/gpu/drm/amd/pm/powerplay/hwmgr/ppatomfwctrl.h | 4 ++--
 drivers/gpu/drm/radeon/atombios.h                     | 2 +-
 4 files changed, 5 insertions(+), 7 deletions(-)

diff --git a/drivers/gpu/drm/amd/display/dc/bios/command_table2.c b/drivers/gpu/drm/amd/display/dc/bios/command_table2.c
index f1f672a997d7..4f37be727332 100644
--- a/drivers/gpu/drm/amd/display/dc/bios/command_table2.c
+++ b/drivers/gpu/drm/amd/display/dc/bios/command_table2.c
@@ -44,9 +44,7 @@
 	bp->base.ctx->logger
 
 #define GET_INDEX_INTO_MASTER_TABLE(MasterOrData, FieldName)\
-	(((char *)(&((\
-		struct atom_master_list_of_##MasterOrData##_functions_v2_1 *)0)\
-		->FieldName)-(char *)0)/sizeof(uint16_t))
+	(offsetof(struct atom_master_list_of_##MasterOrData##_functions_v2_1, FieldName) / sizeof(uint16_t))
 
 #define EXEC_BIOS_CMD_TABLE(fname, params)\
 	(amdgpu_atom_execute_table(((struct amdgpu_device *)bp->base.ctx->driver_context)->mode_info.atom_context, \
diff --git a/drivers/gpu/drm/amd/include/atombios.h b/drivers/gpu/drm/amd/include/atombios.h
index 6a505d1b82a5..da895d1f3b4f 100644
--- a/drivers/gpu/drm/amd/include/atombios.h
+++ b/drivers/gpu/drm/amd/include/atombios.h
@@ -7148,7 +7148,7 @@ typedef struct _ATOM_ASIC_INTERNAL_SS_INFO_V3
 #define GET_COMMAND_TABLE_COMMANDSET_REVISION(TABLE_HEADER_OFFSET) (((static_cast<ATOM_COMMON_TABLE_HEADER*>(TABLE_HEADER_OFFSET))->ucTableFormatRevision )&0x3F)
 #define GET_COMMAND_TABLE_PARAMETER_REVISION(TABLE_HEADER_OFFSET)  (((static_cast<ATOM_COMMON_TABLE_HEADER*>(TABLE_HEADER_OFFSET))->ucTableContentRevision)&0x3F)
 #else // not __cplusplus
-#define   GetIndexIntoMasterTable(MasterOrData, FieldName) (((char*)(&((ATOM_MASTER_LIST_OF_##MasterOrData##_TABLES*)0)->FieldName)-(char*)0)/sizeof(USHORT))
+#define   GetIndexIntoMasterTable(MasterOrData, FieldName) (offsetof(ATOM_MASTER_LIST_OF_##MasterOrData##_TABLES, FieldName) / sizeof(USHORT))
 
 #define GET_COMMAND_TABLE_COMMANDSET_REVISION(TABLE_HEADER_OFFSET) ((((ATOM_COMMON_TABLE_HEADER*)TABLE_HEADER_OFFSET)->ucTableFormatRevision)&0x3F)
 #define GET_COMMAND_TABLE_PARAMETER_REVISION(TABLE_HEADER_OFFSET)  ((((ATOM_COMMON_TABLE_HEADER*)TABLE_HEADER_OFFSET)->ucTableContentRevision)&0x3F)
diff --git a/drivers/gpu/drm/amd/pm/powerplay/hwmgr/ppatomfwctrl.h b/drivers/gpu/drm/amd/pm/powerplay/hwmgr/ppatomfwctrl.h
index b7e2651b570b..2fc1733bcdcf 100644
--- a/drivers/gpu/drm/amd/pm/powerplay/hwmgr/ppatomfwctrl.h
+++ b/drivers/gpu/drm/amd/pm/powerplay/hwmgr/ppatomfwctrl.h
@@ -29,9 +29,9 @@
 typedef enum atom_smu9_syspll0_clock_id BIOS_CLKID;
 
 #define GetIndexIntoMasterCmdTable(FieldName) \
-	(((char*)(&((struct atom_master_list_of_command_functions_v2_1*)0)->FieldName)-(char*)0)/sizeof(uint16_t))
+	(offsetof(struct atom_master_list_of_command_functions_v2_1, FieldName) / sizeof(uint16_t))
 #define GetIndexIntoMasterDataTable(FieldName) \
-	(((char*)(&((struct atom_master_list_of_data_tables_v2_1*)0)->FieldName)-(char*)0)/sizeof(uint16_t))
+	(offsetof(struct atom_master_list_of_data_tables_v2_1, FieldName) / sizeof(uint16_t))
 
 #define PP_ATOMFWCTRL_MAX_VOLTAGE_ENTRIES 32
 
diff --git a/drivers/gpu/drm/radeon/atombios.h b/drivers/gpu/drm/radeon/atombios.h
index 83e8b8547f9b..bd5dc09e860f 100644
--- a/drivers/gpu/drm/radeon/atombios.h
+++ b/drivers/gpu/drm/radeon/atombios.h
@@ -5983,7 +5983,7 @@ typedef struct _ATOM_ASIC_INTERNAL_SS_INFO_V3
 #define GET_COMMAND_TABLE_COMMANDSET_REVISION(TABLE_HEADER_OFFSET) (((static_cast<ATOM_COMMON_TABLE_HEADER*>(TABLE_HEADER_OFFSET))->ucTableFormatRevision )&0x3F)
 #define GET_COMMAND_TABLE_PARAMETER_REVISION(TABLE_HEADER_OFFSET)  (((static_cast<ATOM_COMMON_TABLE_HEADER*>(TABLE_HEADER_OFFSET))->ucTableContentRevision)&0x3F)
 #else // not __cplusplus
-#define	GetIndexIntoMasterTable(MasterOrData, FieldName) (((char*)(&((ATOM_MASTER_LIST_OF_##MasterOrData##_TABLES*)0)->FieldName)-(char*)0)/sizeof(USHORT))
+#define	GetIndexIntoMasterTable(MasterOrData, FieldName) (offsetof(ATOM_MASTER_LIST_OF_##MasterOrData##_TABLES, FieldName)/sizeof(USHORT))
 
 #define GET_COMMAND_TABLE_COMMANDSET_REVISION(TABLE_HEADER_OFFSET) ((((ATOM_COMMON_TABLE_HEADER*)TABLE_HEADER_OFFSET)->ucTableFormatRevision)&0x3F)
 #define GET_COMMAND_TABLE_PARAMETER_REVISION(TABLE_HEADER_OFFSET)  ((((ATOM_COMMON_TABLE_HEADER*)TABLE_HEADER_OFFSET)->ucTableContentRevision)&0x3F)
-- 
2.29.2

