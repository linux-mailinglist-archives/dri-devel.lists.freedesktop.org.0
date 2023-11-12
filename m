Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 064AE7E9068
	for <lists+dri-devel@lfdr.de>; Sun, 12 Nov 2023 14:29:04 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 1B37710E300;
	Sun, 12 Nov 2023 13:29:02 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from ams.source.kernel.org (ams.source.kernel.org [145.40.68.75])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 3D8CB10E300;
 Sun, 12 Nov 2023 13:29:00 +0000 (UTC)
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
 by ams.source.kernel.org (Postfix) with ESMTP id BEE7DB80ACB;
 Sun, 12 Nov 2023 13:28:58 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 5F339C433C7;
 Sun, 12 Nov 2023 13:28:57 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=k20201202; t=1699795738;
 bh=w4qN+a75YUNjsfpxnK3cPswg+fKzx5UswAxWVXOKX0k=;
 h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
 b=ssb07MW5IbTLAU//4PU7hH//17ZGdfC1L3cU8623I91buvqGEXhf3TSk32CShsbO6
 7/4eWPo7oqhVfmEWVWO87eXdO8gqC1wabL5MetnnyDyhPJcCxok9jMWpzsVQVkWsa4
 a0MoWGFMQEFLBgVslKvnQxOspocw7h4guk61b4nFGxkLVn8raZBa5u4xL6TzO70zMe
 zB8cuDBLteAYicEO874vUk5kq4HmjdU+piDjwTdvSuGhgMUsa/neMYrW0AolP5SiTN
 v5+nxmg5JJkthe+0vISamZHOuRk8QL0J6DTNL6BofpBvyX92Mu13T2/A20kbXDDHM8
 0mjgNKOkzkBbg==
From: Sasha Levin <sashal@kernel.org>
To: linux-kernel@vger.kernel.org,
	stable@vger.kernel.org
Subject: [PATCH AUTOSEL 5.10 7/8] drm/amd: Fix UBSAN array-index-out-of-bounds
 for Powerplay headers
Date: Sun, 12 Nov 2023 08:28:45 -0500
Message-ID: <20231112132847.176473-7-sashal@kernel.org>
X-Mailer: git-send-email 2.42.0
In-Reply-To: <20231112132847.176473-1-sashal@kernel.org>
References: <20231112132847.176473-1-sashal@kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
X-stable: review
X-Patchwork-Hint: Ignore
X-stable-base: Linux 5.10.200
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
Cc: Sasha Levin <sashal@kernel.org>, airlied@linux.ie,
 dri-devel@lists.freedesktop.org, amd-gfx@lists.freedesktop.org,
 Mario Limonciello <mario.limonciello@amd.com>,
 Alex Deucher <alexander.deucher@amd.com>,
 =?UTF-8?q?Christian=20K=C3=B6nig?= <christian.koenig@amd.com>
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

From: Alex Deucher <alexander.deucher@amd.com>

[ Upstream commit 49afe91370b86566857a3c2c39612cf098110885 ]

For pptable structs that use flexible array sizes, use flexible arrays.

Link: https://bugs.launchpad.net/ubuntu/+source/linux/+bug/2039926
Reviewed-by: Mario Limonciello <mario.limonciello@amd.com>
Acked-by: Christian König <christian.koenig@amd.com>
Signed-off-by: Alex Deucher <alexander.deucher@amd.com>
Signed-off-by: Sasha Levin <sashal@kernel.org>
---
 .../drm/amd/pm/powerplay/hwmgr/pptable_v1_0.h |  4 ++--
 .../amd/pm/powerplay/hwmgr/vega10_pptable.h   | 24 +++++++++----------
 2 files changed, 14 insertions(+), 14 deletions(-)

diff --git a/drivers/gpu/drm/amd/pm/powerplay/hwmgr/pptable_v1_0.h b/drivers/gpu/drm/amd/pm/powerplay/hwmgr/pptable_v1_0.h
index 1e870f58dd12a..8f6ecbbfa5738 100644
--- a/drivers/gpu/drm/amd/pm/powerplay/hwmgr/pptable_v1_0.h
+++ b/drivers/gpu/drm/amd/pm/powerplay/hwmgr/pptable_v1_0.h
@@ -337,7 +337,7 @@ typedef struct _ATOM_Tonga_VCE_State_Record {
 typedef struct _ATOM_Tonga_VCE_State_Table {
 	UCHAR ucRevId;
 	UCHAR ucNumEntries;
-	ATOM_Tonga_VCE_State_Record entries[1];
+	ATOM_Tonga_VCE_State_Record entries[];
 } ATOM_Tonga_VCE_State_Table;
 
 typedef struct _ATOM_Tonga_PowerTune_Table {
@@ -416,7 +416,7 @@ typedef struct _ATOM_Tonga_Hard_Limit_Record {
 typedef struct _ATOM_Tonga_Hard_Limit_Table {
 	UCHAR ucRevId;
 	UCHAR ucNumEntries;
-	ATOM_Tonga_Hard_Limit_Record entries[1];
+	ATOM_Tonga_Hard_Limit_Record entries[];
 } ATOM_Tonga_Hard_Limit_Table;
 
 typedef struct _ATOM_Tonga_GPIO_Table {
diff --git a/drivers/gpu/drm/amd/pm/powerplay/hwmgr/vega10_pptable.h b/drivers/gpu/drm/amd/pm/powerplay/hwmgr/vega10_pptable.h
index c934e9612c1b5..794889917ea1b 100644
--- a/drivers/gpu/drm/amd/pm/powerplay/hwmgr/vega10_pptable.h
+++ b/drivers/gpu/drm/amd/pm/powerplay/hwmgr/vega10_pptable.h
@@ -129,7 +129,7 @@ typedef struct _ATOM_Vega10_State {
 typedef struct _ATOM_Vega10_State_Array {
 	UCHAR ucRevId;
 	UCHAR ucNumEntries;                                         /* Number of entries. */
-	ATOM_Vega10_State states[1];                             /* Dynamically allocate entries. */
+	ATOM_Vega10_State states[];                             /* Dynamically allocate entries. */
 } ATOM_Vega10_State_Array;
 
 typedef struct _ATOM_Vega10_CLK_Dependency_Record {
@@ -169,37 +169,37 @@ typedef struct _ATOM_Vega10_GFXCLK_Dependency_Table {
 typedef struct _ATOM_Vega10_MCLK_Dependency_Table {
     UCHAR ucRevId;
     UCHAR ucNumEntries;                                         /* Number of entries. */
-    ATOM_Vega10_MCLK_Dependency_Record entries[1];            /* Dynamically allocate entries. */
+    ATOM_Vega10_MCLK_Dependency_Record entries[];            /* Dynamically allocate entries. */
 } ATOM_Vega10_MCLK_Dependency_Table;
 
 typedef struct _ATOM_Vega10_SOCCLK_Dependency_Table {
     UCHAR ucRevId;
     UCHAR ucNumEntries;                                         /* Number of entries. */
-    ATOM_Vega10_CLK_Dependency_Record entries[1];            /* Dynamically allocate entries. */
+    ATOM_Vega10_CLK_Dependency_Record entries[];            /* Dynamically allocate entries. */
 } ATOM_Vega10_SOCCLK_Dependency_Table;
 
 typedef struct _ATOM_Vega10_DCEFCLK_Dependency_Table {
     UCHAR ucRevId;
     UCHAR ucNumEntries;                                         /* Number of entries. */
-    ATOM_Vega10_CLK_Dependency_Record entries[1];            /* Dynamically allocate entries. */
+    ATOM_Vega10_CLK_Dependency_Record entries[];            /* Dynamically allocate entries. */
 } ATOM_Vega10_DCEFCLK_Dependency_Table;
 
 typedef struct _ATOM_Vega10_PIXCLK_Dependency_Table {
 	UCHAR ucRevId;
 	UCHAR ucNumEntries;                                         /* Number of entries. */
-	ATOM_Vega10_CLK_Dependency_Record entries[1];            /* Dynamically allocate entries. */
+	ATOM_Vega10_CLK_Dependency_Record entries[];            /* Dynamically allocate entries. */
 } ATOM_Vega10_PIXCLK_Dependency_Table;
 
 typedef struct _ATOM_Vega10_DISPCLK_Dependency_Table {
 	UCHAR ucRevId;
 	UCHAR ucNumEntries;                                         /* Number of entries.*/
-	ATOM_Vega10_CLK_Dependency_Record entries[1];            /* Dynamically allocate entries. */
+	ATOM_Vega10_CLK_Dependency_Record entries[];            /* Dynamically allocate entries. */
 } ATOM_Vega10_DISPCLK_Dependency_Table;
 
 typedef struct _ATOM_Vega10_PHYCLK_Dependency_Table {
 	UCHAR ucRevId;
 	UCHAR ucNumEntries;                                         /* Number of entries. */
-	ATOM_Vega10_CLK_Dependency_Record entries[1];            /* Dynamically allocate entries. */
+	ATOM_Vega10_CLK_Dependency_Record entries[];            /* Dynamically allocate entries. */
 } ATOM_Vega10_PHYCLK_Dependency_Table;
 
 typedef struct _ATOM_Vega10_MM_Dependency_Record {
@@ -213,7 +213,7 @@ typedef struct _ATOM_Vega10_MM_Dependency_Record {
 typedef struct _ATOM_Vega10_MM_Dependency_Table {
 	UCHAR ucRevId;
 	UCHAR ucNumEntries;                                         /* Number of entries */
-	ATOM_Vega10_MM_Dependency_Record entries[1];             /* Dynamically allocate entries */
+	ATOM_Vega10_MM_Dependency_Record entries[];             /* Dynamically allocate entries */
 } ATOM_Vega10_MM_Dependency_Table;
 
 typedef struct _ATOM_Vega10_PCIE_Record {
@@ -225,7 +225,7 @@ typedef struct _ATOM_Vega10_PCIE_Record {
 typedef struct _ATOM_Vega10_PCIE_Table {
 	UCHAR  ucRevId;
 	UCHAR  ucNumEntries;                                        /* Number of entries */
-	ATOM_Vega10_PCIE_Record entries[1];                      /* Dynamically allocate entries. */
+	ATOM_Vega10_PCIE_Record entries[];                      /* Dynamically allocate entries. */
 } ATOM_Vega10_PCIE_Table;
 
 typedef struct _ATOM_Vega10_Voltage_Lookup_Record {
@@ -235,7 +235,7 @@ typedef struct _ATOM_Vega10_Voltage_Lookup_Record {
 typedef struct _ATOM_Vega10_Voltage_Lookup_Table {
 	UCHAR ucRevId;
 	UCHAR ucNumEntries;                                          /* Number of entries */
-	ATOM_Vega10_Voltage_Lookup_Record entries[1];             /* Dynamically allocate entries */
+	ATOM_Vega10_Voltage_Lookup_Record entries[];             /* Dynamically allocate entries */
 } ATOM_Vega10_Voltage_Lookup_Table;
 
 typedef struct _ATOM_Vega10_Fan_Table {
@@ -329,7 +329,7 @@ typedef struct _ATOM_Vega10_VCE_State_Table
 {
     UCHAR ucRevId;
     UCHAR ucNumEntries;
-    ATOM_Vega10_VCE_State_Record entries[1];
+    ATOM_Vega10_VCE_State_Record entries[];
 } ATOM_Vega10_VCE_State_Table;
 
 typedef struct _ATOM_Vega10_PowerTune_Table {
@@ -432,7 +432,7 @@ typedef struct _ATOM_Vega10_Hard_Limit_Table
 {
     UCHAR ucRevId;
     UCHAR ucNumEntries;
-    ATOM_Vega10_Hard_Limit_Record entries[1];
+    ATOM_Vega10_Hard_Limit_Record entries[];
 } ATOM_Vega10_Hard_Limit_Table;
 
 typedef struct _Vega10_PPTable_Generic_SubTable_Header
-- 
2.42.0

