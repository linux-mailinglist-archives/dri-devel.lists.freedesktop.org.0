Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 5F708A358AB
	for <lists+dri-devel@lfdr.de>; Fri, 14 Feb 2025 09:18:45 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 61CDC10EBF9;
	Fri, 14 Feb 2025 08:18:38 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=kernel.org header.i=@kernel.org header.b="QkW5UjGN";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from dfw.source.kernel.org (dfw.source.kernel.org [139.178.84.217])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 9BCC610EBF9;
 Fri, 14 Feb 2025 08:18:37 +0000 (UTC)
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
 by dfw.source.kernel.org (Postfix) with ESMTP id 052765C55C5;
 Fri, 14 Feb 2025 08:17:57 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 2D16CC4CEE2;
 Fri, 14 Feb 2025 08:18:24 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=k20201202; t=1739521116;
 bh=xl1RxIPlL8WV/QUkGzOzNrCPqAGUw2t+vphKlojUgdE=;
 h=Date:From:To:Cc:Subject:From;
 b=QkW5UjGNu6QsrKnL+dkqcKsg61pKX5DaCoV2sCMWkHssVlGqsFp/Jk9utxirp4rOR
 tIL8V0DLTPQIa+OMH6eFSpXCaL4KRcSv3OQ6KvXgx+F7GD4DfzrkYi5SZzCgj8srNq
 K4SX10MjQLNPT6FvBvLWip0sNHr/MnTTLdT3q4COjqgO2Lp7JhY40LAnCkxePZaTgz
 UOvtqOQ8EFMMF5eCG2+yyF76tiexYgHuwlShKArDwjEgq9QPVsYHcYskZVUm3p9VkW
 XesTAaglJ7J7yK0lqk+RYJAyHr5lEo9RkLh2khShk8UW4qucl8OwpLACN2kKVfNZK6
 CezKxhufqBZ4g==
Date: Fri, 14 Feb 2025 18:48:20 +1030
From: "Gustavo A. R. Silva" <gustavoars@kernel.org>
To: Kenneth Feng <kenneth.feng@amd.com>,
 Alex Deucher <alexander.deucher@amd.com>,
 Christian =?iso-8859-1?Q?K=F6nig?= <christian.koenig@amd.com>,
 Xinhui Pan <Xinhui.Pan@amd.com>, David Airlie <airlied@gmail.com>,
 Simona Vetter <simona@ffwll.ch>
Cc: amd-gfx@lists.freedesktop.org, dri-devel@lists.freedesktop.org,
 linux-kernel@vger.kernel.org,
 "Gustavo A. R. Silva" <gustavoars@kernel.org>,
 linux-hardening@vger.kernel.org
Subject: [PATCH][next] drm/amd/pm: Avoid multiple
 -Wflex-array-member-not-at-end warnings
Message-ID: <Z678TNhCbTk363Tw@kspp>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
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

-Wflex-array-member-not-at-end was introduced in GCC-14, and we are
getting ready to enable it, globally.

So, in order to avoid ending up with a flexible-array member in the
middle of other structs, we use the `struct_group_tagged()` helper
to create a new tagged `struct NISLANDS_SMC_SWSTATE_HDR` (and `struct
SISLANDS_SMC_SWSTATE_HDR`). This structures group together all the
members of the flexible `struct NISLANDS_SMC_SWSTATE` (and `struct
SISLANDS_SMC_SWSTATE`) except the flexible array.

As a result, the array is effectively separated from the rest of the
members without modifying the memory layout of the flexible structure.
We then change the type of the middle struct members currently causing
trouble from `struct NISLANDS_SMC_SWSTATE` to `struct
NISLANDS_SMC_SWSTATE_HDR` (and from `struct SISLANDS_SMC_SWSTATE` to
`struct SISLANDS_SMC_SWSTATE_HDR`).

We also want to ensure that when new members need to be added to the
flexible structure, they are always included within the newly created
tagged struct. For this, we use `static_assert()`. This ensures that
the memory layout for both the flexible structure and the new tagged
struct is the same after any changes.

This approach avoids having to implement `struct NISLANDS_SMC_SWSTATE_HDR`
(and `struct SISLANDS_SMC_SWSTATE_HDR`) as a completely separate structure,
thus preventing having to maintain two independent but basically identical
structures, closing the door to potential bugs in the future.

We also use `container_of()` whenever we need to retrieve a pointer to
the flexible structure, through which we can access the flexible-array
member, if necessary.

So, with this changes, fix the following warnings:

drivers/gpu/drm/amd/amdgpu/../pm/legacy-dpm/sislands_smc.h:218:49: warning: structure containing a flexible array member is not at the end of another structure [-Wflex-array-member-not-at-end]
drivers/gpu/drm/amd/amdgpu/../pm/legacy-dpm/si_dpm.h:819:41: warning: structure containing a flexible array member is not at the end of another structure [-Wflex-array-member-not-at-end]
drivers/gpu/drm/amd/amdgpu/../pm/legacy-dpm/si_dpm.h:818:41: warning: structure containing a flexible array member is not at the end of another structure [-Wflex-array-member-not-at-end]
drivers/gpu/drm/amd/amdgpu/../pm/legacy-dpm/si_dpm.h:817:41: warning: structure containing a flexible array member is not at the end of another structure [-Wflex-array-member-not-at-end]
drivers/gpu/drm/amd/amdgpu/../pm/legacy-dpm/si_dpm.h:816:41: warning: structure containing a flexible array member is not at the end of another structure [-Wflex-array-member-not-at-end]

Signed-off-by: Gustavo A. R. Silva <gustavoars@kernel.org>
---
 drivers/gpu/drm/amd/pm/legacy-dpm/si_dpm.c    |  7 ++++--
 drivers/gpu/drm/amd/pm/legacy-dpm/si_dpm.h    | 23 +++++++++++--------
 .../gpu/drm/amd/pm/legacy-dpm/sislands_smc.h  | 15 ++++++++----
 3 files changed, 29 insertions(+), 16 deletions(-)

diff --git a/drivers/gpu/drm/amd/pm/legacy-dpm/si_dpm.c b/drivers/gpu/drm/amd/pm/legacy-dpm/si_dpm.c
index a87dcf0974bc..2c9d473d122f 100644
--- a/drivers/gpu/drm/amd/pm/legacy-dpm/si_dpm.c
+++ b/drivers/gpu/drm/amd/pm/legacy-dpm/si_dpm.c
@@ -5234,7 +5234,8 @@ static int si_init_smc_table(struct amdgpu_device *adev)
 
 	table->driverState.flags = table->initialState.flags;
 	table->driverState.levelCount = table->initialState.levelCount;
-	table->driverState.levels[0] = table->initialState.level;
+	container_of(&table->driverState, SISLANDS_SMC_SWSTATE, __hdr)->levels[0] =
+								table->initialState.level;
 
 	ret = si_do_program_memory_timing_parameters(adev, amdgpu_boot_state,
 						     SISLANDS_INITIAL_STATE_ARB_INDEX);
@@ -5755,7 +5756,9 @@ static int si_upload_sw_state(struct amdgpu_device *adev,
 	int ret;
 	u32 address = si_pi->state_table_start +
 		offsetof(SISLANDS_SMC_STATETABLE, driverState);
-	SISLANDS_SMC_SWSTATE *smc_state = &si_pi->smc_statetable.driverState;
+	SISLANDS_SMC_SWSTATE *smc_state =
+		container_of(&si_pi->smc_statetable.driverState,
+			     SISLANDS_SMC_SWSTATE, __hdr);
 	size_t state_size = struct_size(smc_state, levels,
 					new_state->performance_level_count);
 	memset(smc_state, 0, state_size);
diff --git a/drivers/gpu/drm/amd/pm/legacy-dpm/si_dpm.h b/drivers/gpu/drm/amd/pm/legacy-dpm/si_dpm.h
index 11cb7874a6bb..62530f89ebdf 100644
--- a/drivers/gpu/drm/amd/pm/legacy-dpm/si_dpm.h
+++ b/drivers/gpu/drm/amd/pm/legacy-dpm/si_dpm.h
@@ -784,12 +784,17 @@ typedef struct NISLANDS_SMC_HW_PERFORMANCE_LEVEL NISLANDS_SMC_HW_PERFORMANCE_LEV
 
 struct NISLANDS_SMC_SWSTATE
 {
-    uint8_t                             flags;
-    uint8_t                             levelCount;
-    uint8_t                             padding2;
-    uint8_t                             padding3;
-    NISLANDS_SMC_HW_PERFORMANCE_LEVEL   levels[];
+	/* New members MUST be added within the struct_group() macro below. */
+	struct_group_tagged(NISLANDS_SMC_SWSTATE_HDR, __hdr,
+		uint8_t                             flags;
+		uint8_t                             levelCount;
+		uint8_t                             padding2;
+		uint8_t                             padding3;
+	);
+	NISLANDS_SMC_HW_PERFORMANCE_LEVEL   levels[];
 };
+static_assert(offsetof(struct NISLANDS_SMC_SWSTATE, levels) == sizeof(struct NISLANDS_SMC_SWSTATE_HDR),
+	      "struct member likely outside of struct_group_tagged()");
 
 typedef struct NISLANDS_SMC_SWSTATE NISLANDS_SMC_SWSTATE;
 
@@ -813,10 +818,10 @@ struct NISLANDS_SMC_STATETABLE
     uint32_t                            lowSMIO[NISLANDS_MAX_NO_VREG_STEPS];
     NISLANDS_SMC_VOLTAGEMASKTABLE       voltageMaskTable;
     PP_NIslands_DPM2Parameters          dpm2Params;
-    NISLANDS_SMC_SWSTATE                initialState;
-    NISLANDS_SMC_SWSTATE                ACPIState;
-    NISLANDS_SMC_SWSTATE                ULVState;
-    NISLANDS_SMC_SWSTATE                driverState;
+    struct NISLANDS_SMC_SWSTATE_HDR		initialState;
+    struct NISLANDS_SMC_SWSTATE_HDR		ACPIState;
+    struct NISLANDS_SMC_SWSTATE_HDR		ULVState;
+    struct NISLANDS_SMC_SWSTATE_HDR		driverState;
     NISLANDS_SMC_HW_PERFORMANCE_LEVEL   dpmLevels[NISLANDS_MAX_SMC_PERFORMANCE_LEVELS_PER_SWSTATE - 1];
 };
 
diff --git a/drivers/gpu/drm/amd/pm/legacy-dpm/sislands_smc.h b/drivers/gpu/drm/amd/pm/legacy-dpm/sislands_smc.h
index 90ec411c5029..1711e3e35e80 100644
--- a/drivers/gpu/drm/amd/pm/legacy-dpm/sislands_smc.h
+++ b/drivers/gpu/drm/amd/pm/legacy-dpm/sislands_smc.h
@@ -172,12 +172,17 @@ struct SISLANDS_SMC_HW_PERFORMANCE_LEVEL {
 typedef struct SISLANDS_SMC_HW_PERFORMANCE_LEVEL SISLANDS_SMC_HW_PERFORMANCE_LEVEL;
 
 struct SISLANDS_SMC_SWSTATE {
-	uint8_t                             flags;
-	uint8_t                             levelCount;
-	uint8_t                             padding2;
-	uint8_t                             padding3;
+	/* New members MUST be added within the struct_group() macro below. */
+	struct_group_tagged(SISLANDS_SMC_SWSTATE_HDR, __hdr,
+		uint8_t                             flags;
+		uint8_t                             levelCount;
+		uint8_t                             padding2;
+		uint8_t                             padding3;
+	);
 	SISLANDS_SMC_HW_PERFORMANCE_LEVEL   levels[];
 };
+static_assert(offsetof(struct SISLANDS_SMC_SWSTATE, levels) == sizeof(struct SISLANDS_SMC_SWSTATE_HDR),
+	      "struct member likely outside of struct_group_tagged()");
 
 typedef struct SISLANDS_SMC_SWSTATE SISLANDS_SMC_SWSTATE;
 
@@ -215,7 +220,7 @@ struct SISLANDS_SMC_STATETABLE {
 	struct SISLANDS_SMC_SWSTATE_SINGLE	initialState;
 	struct SISLANDS_SMC_SWSTATE_SINGLE	ACPIState;
 	struct SISLANDS_SMC_SWSTATE_SINGLE	ULVState;
-	SISLANDS_SMC_SWSTATE			driverState;
+	struct SISLANDS_SMC_SWSTATE_HDR		driverState;
 	SISLANDS_SMC_HW_PERFORMANCE_LEVEL	dpmLevels[SISLANDS_MAX_SMC_PERFORMANCE_LEVELS_PER_SWSTATE];
 };
 
-- 
2.43.0

