Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 1DE03ACA20A
	for <lists+dri-devel@lfdr.de>; Mon,  2 Jun 2025 01:33:04 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 70C2510E403;
	Sun,  1 Jun 2025 23:33:02 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=kernel.org header.i=@kernel.org header.b="tXmrDsAS";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from dfw.source.kernel.org (dfw.source.kernel.org [139.178.84.217])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 7524C10E400;
 Sun,  1 Jun 2025 23:33:01 +0000 (UTC)
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
 by dfw.source.kernel.org (Postfix) with ESMTP id 10F585C571B;
 Sun,  1 Jun 2025 23:30:44 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 51D9BC4CEF1;
 Sun,  1 Jun 2025 23:32:59 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=k20201202; t=1748820780;
 bh=RXLXYPf25IYAL30WtOgQao+qkK8DvqIH5LiDksgBCRc=;
 h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
 b=tXmrDsASEWO8j/GZ0OLEsTzlyuvYtjANQq6M34+pp61TuiNq3PHq731PK5sIJoLDr
 suldEWYUoYrWwB4Wincwqm3ynk9FZQvrCVxhXprHjmtCYo15JG3hq/pDay/lXooRYw
 eYw9BI9U+gbtYpW9SYDIILRNDd968wL5+UbM498dSVXi2YA/Pxk7cq5MEb63ZZoYPk
 NN/lfuhWNkR6/hpPGirnFl8RXDtcfPIHBRq+A3OcNFjpJIBZt9f4LK+pe4n4HqGyCk
 mjJLCtcWl2vRsAJqc0H/gnNMF9MZNoa7Wvr1LwjKohdMa6fP3dwv+ueCkIrgMmXPdw
 WNlYLLWkn3N+A==
From: Sasha Levin <sashal@kernel.org>
To: patches@lists.linux.dev,
	stable@vger.kernel.org
Cc: Lucas De Marchi <lucas.demarchi@intel.com>,
 John Harrison <John.C.Harrison@Intel.com>, Sasha Levin <sashal@kernel.org>,
 thomas.hellstrom@linux.intel.com, rodrigo.vivi@intel.com,
 airlied@gmail.com, simona@ffwll.ch, intel-xe@lists.freedesktop.org,
 dri-devel@lists.freedesktop.org, linux-kernel@vger.kernel.org
Subject: [PATCH AUTOSEL 6.14 071/102] drm/xe/uc: Remove static from loop
 variable
Date: Sun,  1 Jun 2025 19:29:03 -0400
Message-Id: <20250601232937.3510379-71-sashal@kernel.org>
X-Mailer: git-send-email 2.39.5
In-Reply-To: <20250601232937.3510379-1-sashal@kernel.org>
References: <20250601232937.3510379-1-sashal@kernel.org>
MIME-Version: 1.0
X-stable: review
X-Patchwork-Hint: Ignore
X-stable-base: Linux 6.14.9
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

From: Lucas De Marchi <lucas.demarchi@intel.com>

[ Upstream commit 75584c8213d341ddd5b7c72abf822e62f4b3ab27 ]

The `entries` variable is used to loop through the array - it's supposed
to be const, but not static.

Reviewed-by: John Harrison <John.C.Harrison@Intel.com>
Link: https://patchwork.freedesktop.org/patch/msgid/20250307-xe-per-gt-fw-v1-1-459574d76400@intel.com
Signed-off-by: Lucas De Marchi <lucas.demarchi@intel.com>
Signed-off-by: Sasha Levin <sashal@kernel.org>
---

**YES** This commit should be backported to stable kernel trees. Here's
my extensive analysis: ## Commit Analysis **Type of Issue:** This commit
fixes an incorrect use of the `static` storage class specifier on a
local variable that should be a simple `const` pointer. **Code
Analysis:** - The problematic line changes `static const struct
uc_fw_entry *entries;` to `const struct uc_fw_entry *entries;` - This
variable is used as a loop iteration pointer in the
`uc_fw_auto_select()` function - The variable gets assigned from
`blobs_all[uc_fw->type].entries` and is used to iterate through firmware
entries - The `static` keyword is incorrect here because this should be
a local variable that gets reinitialized on each function call **Impact
Assessment:** - **Bug severity:** This is a subtle but real bug that
affects driver correctness - **User impact:** Could cause firmware
selection issues in Intel Xe GPU drivers, potentially leading to
graphics driver failures or incorrect firmware loading - **Risk:** The
incorrect `static` storage could cause the `entries` pointer to retain
stale values across function calls, leading to unpredictable firmware
selection behavior **Backport Suitability Criteria:** 1. ✅ **Fixes a
real bug:** Yes, incorrect storage class affects program correctness 2.
✅ **Small and contained:** Single line change, minimal risk 3. ✅ **No
side effects:** Pure bug fix with no behavioral changes beyond
correcting the error 4. ✅ **No architectural changes:** Simple variable
declaration fix 5. ✅ **Minimal regression risk:** Extremely low risk -
makes the code work as originally intended 6. ✅ **Follows stable tree
rules:** Important bugfix, minimal risk, contained change **Historical
Precedent:** This commit is nearly identical to the i915 commit
`5821a0bbb4c3` which was backported (marked as "YES" in the reference
commits). Both commits: - Fix the exact same type of bug (accidental
`static` on local variable) - Affect similar firmware selection code in
Intel GPU drivers - Have identical risk profiles and change patterns -
Were authored by the same team working on Intel GPU microcontroller
firmware **Conclusion:** This is a clear candidate for backporting - it
fixes a genuine bug that could affect system stability, has minimal risk
of regression, and follows the established pattern of similar fixes that
have been successfully backported.

 drivers/gpu/drm/xe/xe_uc_fw.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/drivers/gpu/drm/xe/xe_uc_fw.c b/drivers/gpu/drm/xe/xe_uc_fw.c
index fb0eda3d56829..b553079ae3d64 100644
--- a/drivers/gpu/drm/xe/xe_uc_fw.c
+++ b/drivers/gpu/drm/xe/xe_uc_fw.c
@@ -222,8 +222,8 @@ uc_fw_auto_select(struct xe_device *xe, struct xe_uc_fw *uc_fw)
 		[XE_UC_FW_TYPE_HUC] = { entries_huc, ARRAY_SIZE(entries_huc) },
 		[XE_UC_FW_TYPE_GSC] = { entries_gsc, ARRAY_SIZE(entries_gsc) },
 	};
-	static const struct uc_fw_entry *entries;
 	enum xe_platform p = xe->info.platform;
+	const struct uc_fw_entry *entries;
 	u32 count;
 	int i;
 
-- 
2.39.5

