Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id BE1ECACA14B
	for <lists+dri-devel@lfdr.de>; Mon,  2 Jun 2025 01:26:05 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 1DFF210E35D;
	Sun,  1 Jun 2025 23:26:04 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=kernel.org header.i=@kernel.org header.b="GPf4QneH";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from dfw.source.kernel.org (dfw.source.kernel.org [139.178.84.217])
 by gabe.freedesktop.org (Postfix) with ESMTPS id BE7EE10E35D;
 Sun,  1 Jun 2025 23:26:02 +0000 (UTC)
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
 by dfw.source.kernel.org (Postfix) with ESMTP id 413465C55E9;
 Sun,  1 Jun 2025 23:23:45 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id C88B5C4CEE7;
 Sun,  1 Jun 2025 23:25:59 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=k20201202; t=1748820361;
 bh=EEO5q/anlUp9Wf8k9dVDWiAKdrMGhZ2pHpowvmT+wOg=;
 h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
 b=GPf4QneHVad1LykXYma4p4uQHHkyc4yueXriwyJPD7WB9wdc+DyTId1j/wqMip+W5
 gK1VaVpGFLyX+WhDbueq+oRPMIiYPR+/b6rjibMs5PZMfMIn4n+xrqE1aN9FHmoFQ3
 u5Gk68zsYC8JJK9HaWRL7zv4ck9grvt9W5pEObfV2sjUrg+LZ1nf3TD4nmRgseMGTF
 SG0ZMxrdCZlHKg6cvPXkmBMnTifkpFK2hMhhWxYB3ctn6NP8fv+slSBpaWA/PCESLT
 dwRx+YfP6wCXWTEePBK+Gtey1KtV8b/VvvCNrAFEQDjiNyzlpeOtaO+NyQWhW1LBEx
 TIvLJmnYkCBmA==
From: Sasha Levin <sashal@kernel.org>
To: patches@lists.linux.dev,
	stable@vger.kernel.org
Cc: Lijo Lazar <lijo.lazar@amd.com>, Hawking Zhang <Hawking.Zhang@amd.com>,
 Alex Deucher <alexander.deucher@amd.com>, Sasha Levin <sashal@kernel.org>,
 christian.koenig@amd.com, airlied@gmail.com, simona@ffwll.ch,
 matthias.bgg@gmail.com, angelogioacchino.delregno@collabora.com,
 tao.zhou1@amd.com, ganglxie@amd.com, candice.li@amd.com,
 Stanley.Yang@amd.com, amd-gfx@lists.freedesktop.org,
 dri-devel@lists.freedesktop.org, linux-kernel@vger.kernel.org,
 linux-arm-kernel@lists.infradead.org, linux-mediatek@lists.infradead.org
Subject: [PATCH AUTOSEL 6.15 032/110] drm/amdgpu: Add basic validation for RAS
 header
Date: Sun,  1 Jun 2025 19:23:14 -0400
Message-Id: <20250601232435.3507697-32-sashal@kernel.org>
X-Mailer: git-send-email 2.39.5
In-Reply-To: <20250601232435.3507697-1-sashal@kernel.org>
References: <20250601232435.3507697-1-sashal@kernel.org>
MIME-Version: 1.0
X-stable: review
X-Patchwork-Hint: Ignore
X-stable-base: Linux 6.15
Content-Type: text/plain; charset=UTF-8
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

From: Lijo Lazar <lijo.lazar@amd.com>

[ Upstream commit 5df0d6addb7e9b6f71f7162d1253762a5be9138e ]

If RAS header read from EEPROM is corrupted, it could result in trying
to allocate huge memory for reading the records. Add some validation to
header fields.

Signed-off-by: Lijo Lazar <lijo.lazar@amd.com>
Reviewed-by: Hawking Zhang <Hawking.Zhang@amd.com>
Signed-off-by: Alex Deucher <alexander.deucher@amd.com>
Signed-off-by: Sasha Levin <sashal@kernel.org>
---

Based on my analysis, here is my assessment: **YES** This commit should
be backported to stable kernel trees. Here's my extensive analysis: ##
Security Vulnerability Analysis **Critical Memory Allocation
Vulnerability:** The commit fixes a serious security vulnerability where
corrupted RAS (Reliability, Availability, and Serviceability) EEPROM
header data could cause huge memory allocations. In
`/home/sasha/linux/drivers/gpu/drm/amd/amdgpu/amdgpu_ras.c:3011`, the
code performs: ```c bps = kcalloc(control->ras_num_recs, sizeof(*bps),
GFP_KERNEL); ``` **Before the fix:** If `control->ras_num_recs` contains
a corrupted large value (e.g., 0xFFFFFFFF), this would attempt to
allocate `0xFFFFFFFF 0001-Fix-Clippy-warnings.patch 0002-Enhance-
inference-prompt-to-utilize-CVEKERNELDIR-whe.patch 0003-Update-to-
latest-version-of-clap.patch Cargo.lock Cargo.toml LICENSE README.md
analyze_merge_commit.sh dpp_rcg_backport_analysis.md
drm_bridge_analysis.txt drm_imagination_register_update_analysis.md
drm_mediatek_mtk_dpi_refactoring_analysis.md io_uring_analysis.txt
ksmbd_analysis.txt merge_commit_analysis.txt model prompt src target
test_gpio_cleanup.txt test_patch.txt verisilicon_av1_4k_analysis.md 24
bytes` = ~96GB of memory, likely causing: 1. System memory exhaustion 2.
Denial of service 3. Potential system crash/instability ## Code Changes
Analysis **1. Version Validation Enhancement:** The fix replaces a
simple `if/else` with a robust `switch` statement: ```c // Before: Only
checked for version >= V2_1 if (hdr->version >= RAS_TABLE_VER_V2_1) { //
After: Explicit validation of known versions switch (hdr->version) {
case RAS_TABLE_VER_V2_1: case RAS_TABLE_VER_V3: // Future-proofing //
V2.1+ handling break; case RAS_TABLE_VER_V1: // V1 handling break;
default: dev_err(adev->dev, "RAS header invalid, unsupported version:
%u", hdr->version); return -EINVAL; } ``` **2. Record Count Bounds
Checking:** Critical addition of bounds validation: ```c if
(control->ras_num_recs > control->ras_max_record_count) {
dev_err(adev->dev, "RAS header invalid, records in header: %u max
allowed :%u", control->ras_num_recs, control->ras_max_record_count);
return -EINVAL; } ``` This prevents the memory allocation attack by
ensuring `ras_num_recs` cannot exceed reasonable bounds. ## Stable Tree
Criteria Assessment ✅ **Fixes important security bug:** Prevents DoS via
memory exhaustion ✅ **Small and contained:** Only adds validation logic,
no functional changes ✅ **Clear side effects:** None - only adds error
checking ✅ **No architectural changes:** Pure validation enhancement ✅
**Touches critical subsystem:** Graphics driver reliability/security ✅
**Minimal regression risk:** Only adds stricter validation ## Comparison
with Historical Patterns Looking at the provided similar commits (all
marked "NO"), they were architectural refactoring changes that: - Split
functions (`ras_eeprom_init into init and check functions`) - Added new
infrastructure (`Hook EEPROM table to RAS`) - Wrapped function calls
(`RAS xfer to read/write`) - Added entirely new features (`Add RAS
EEPROM table`) In contrast, this commit is a **security hardening fix**
that adds essential input validation to prevent memory exhaustion
attacks. ## Impact Assessment **Risk if NOT backported:** - Systems with
AMD GPUs vulnerable to DoS attacks via corrupted EEPROM data - Potential
for system instability when corrupted data triggers massive allocations
- Security exposure in enterprise/server environments using AMD GPUs
**Risk if backported:** - Minimal: Only adds validation, existing
correct data will continue to work - Possible rejection of previously
accepted (but actually corrupted) EEPROM data - this is desired behavior
This fix addresses a clear security vulnerability with minimal code
changes and should definitely be backported to stable trees to protect
users from memory exhaustion attacks via corrupted RAS EEPROM headers.

 .../gpu/drm/amd/amdgpu/amdgpu_ras_eeprom.c    | 22 ++++++++++++++++---
 1 file changed, 19 insertions(+), 3 deletions(-)

diff --git a/drivers/gpu/drm/amd/amdgpu/amdgpu_ras_eeprom.c b/drivers/gpu/drm/amd/amdgpu/amdgpu_ras_eeprom.c
index 0ea7cfaf3587d..e979a6086178c 100644
--- a/drivers/gpu/drm/amd/amdgpu/amdgpu_ras_eeprom.c
+++ b/drivers/gpu/drm/amd/amdgpu/amdgpu_ras_eeprom.c
@@ -1392,17 +1392,33 @@ int amdgpu_ras_eeprom_init(struct amdgpu_ras_eeprom_control *control)
 
 	__decode_table_header_from_buf(hdr, buf);
 
-	if (hdr->version >= RAS_TABLE_VER_V2_1) {
+	switch (hdr->version) {
+	case RAS_TABLE_VER_V2_1:
+	case RAS_TABLE_VER_V3:
 		control->ras_num_recs = RAS_NUM_RECS_V2_1(hdr);
 		control->ras_record_offset = RAS_RECORD_START_V2_1;
 		control->ras_max_record_count = RAS_MAX_RECORD_COUNT_V2_1;
-	} else {
+		break;
+	case RAS_TABLE_VER_V1:
 		control->ras_num_recs = RAS_NUM_RECS(hdr);
 		control->ras_record_offset = RAS_RECORD_START;
 		control->ras_max_record_count = RAS_MAX_RECORD_COUNT;
+		break;
+	default:
+		dev_err(adev->dev,
+			"RAS header invalid, unsupported version: %u",
+			hdr->version);
+		return -EINVAL;
 	}
-	control->ras_fri = RAS_OFFSET_TO_INDEX(control, hdr->first_rec_offset);
 
+	if (control->ras_num_recs > control->ras_max_record_count) {
+		dev_err(adev->dev,
+			"RAS header invalid, records in header: %u max allowed :%u",
+			control->ras_num_recs, control->ras_max_record_count);
+		return -EINVAL;
+	}
+
+	control->ras_fri = RAS_OFFSET_TO_INDEX(control, hdr->first_rec_offset);
 	control->ras_num_mca_recs = 0;
 	control->ras_num_pa_recs = 0;
 	return 0;
-- 
2.39.5

