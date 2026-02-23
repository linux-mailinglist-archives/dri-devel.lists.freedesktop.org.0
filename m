Return-Path: <dri-devel-bounces@lists.freedesktop.org>
Delivered-To: lists+dri-devel@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id uPHjNTxKnGmODAQAu9opvQ
	(envelope-from <dri-devel-bounces@lists.freedesktop.org>)
	for <lists+dri-devel@lfdr.de>; Mon, 23 Feb 2026 13:38:20 +0100
X-Original-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 7182C17636E
	for <lists+dri-devel@lfdr.de>; Mon, 23 Feb 2026 13:38:20 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id BD1C110E38A;
	Mon, 23 Feb 2026 12:38:18 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=kernel.org header.i=@kernel.org header.b="bcF7dNOO";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from sea.source.kernel.org (sea.source.kernel.org [172.234.252.31])
 by gabe.freedesktop.org (Postfix) with ESMTPS id AC29910E38B;
 Mon, 23 Feb 2026 12:38:17 +0000 (UTC)
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
 by sea.source.kernel.org (Postfix) with ESMTP id 9460243E56;
 Mon, 23 Feb 2026 12:38:17 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 0ED4BC19424;
 Mon, 23 Feb 2026 12:38:15 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=k20201202; t=1771850297;
 bh=E4vvEItn79WGzKgXGSH0mp3TOP6nutTFxyRtaK2HbS0=;
 h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
 b=bcF7dNOOfWvNBsvinztYtWy19o21UyBR4YYU6UciyfzzI8V015YS2kAiJWrNuWyii
 tpFojFIecIKAAN07VP0Z422k2hOFIh9rcnoBfjSVCL8I88Rd11zzgKwjt69k6abV/1
 pWdtMPyVeNSQdsyHD6bjtM7jo1dUxcuLaRDc7A505+Gcuys1Z+VrmK6HTP3nvV7AWK
 2r4ChczJbXEB3eXezMa2y7laB7dM29qQTcE1QanEUy+BMyMmIjv4KGXCzdOt4gWCN8
 MRk3WDTBCQnAgvXDecXg2SUoYJiAwOL6w2kOkRFl6lDWzUFsjqdWXfkhRHT59jW7M+
 ZrKy5pDsuI0mw==
From: Sasha Levin <sashal@kernel.org>
To: patches@lists.linux.dev,
	stable@vger.kernel.org
Cc: Clay King <clayking@amd.com>, Aric Cyr <aric.cyr@amd.com>,
 Tom Chung <chiahsuan.chung@amd.com>,
 Alex Deucher <alexander.deucher@amd.com>, Sasha Levin <sashal@kernel.org>,
 harry.wentland@amd.com, sunpeng.li@amd.com, christian.koenig@amd.com,
 airlied@gmail.com, simona@ffwll.ch, amd-gfx@lists.freedesktop.org,
 dri-devel@lists.freedesktop.org, linux-kernel@vger.kernel.org
Subject: [PATCH AUTOSEL 6.19-6.12] drm/amd/display: bypass post csc for
 additional color spaces in dal
Date: Mon, 23 Feb 2026 07:37:30 -0500
Message-ID: <20260223123738.1532940-25-sashal@kernel.org>
X-Mailer: git-send-email 2.51.0
In-Reply-To: <20260223123738.1532940-1-sashal@kernel.org>
References: <20260223123738.1532940-1-sashal@kernel.org>
MIME-Version: 1.0
X-stable: review
X-Patchwork-Hint: Ignore
X-stable-base: Linux 6.19.3
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
X-Rspamd-Server: lfdr
X-Spamd-Result: default: False [-0.31 / 15.00];
	MID_CONTAINS_FROM(1.00)[];
	DMARC_POLICY_ALLOW(-0.50)[kernel.org,quarantine];
	R_SPF_ALLOW(-0.20)[+ip4:131.252.210.177:c];
	R_DKIM_ALLOW(-0.20)[kernel.org:s=k20201202];
	MAILLIST(-0.20)[mailman];
	RWL_MAILSPIKE_GOOD(-0.10)[131.252.210.177:from];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	RCVD_TLS_LAST(0.00)[];
	FREEMAIL_CC(0.00)[amd.com,kernel.org,gmail.com,ffwll.ch,lists.freedesktop.org,vger.kernel.org];
	ARC_NA(0.00)[];
	RCPT_COUNT_TWELVE(0.00)[15];
	MIME_TRACE(0.00)[0:+];
	RCVD_COUNT_THREE(0.00)[4];
	FORGED_SENDER_MAILLIST(0.00)[];
	DKIM_TRACE(0.00)[kernel.org:+];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[sashal@kernel.org,dri-devel-bounces@lists.freedesktop.org];
	FROM_HAS_DN(0.00)[];
	TO_DN_SOME(0.00)[];
	NEURAL_HAM(-0.00)[-1.000];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	TAGGED_RCPT(0.00)[dri-devel];
	ASN(0.00)[asn:6366, ipnet:131.252.0.0/16, country:US];
	DBL_BLOCKED_OPENRESOLVER(0.00)[gabe.freedesktop.org:helo,gabe.freedesktop.org:rdns,amd.com:email]
X-Rspamd-Queue-Id: 7182C17636E
X-Rspamd-Action: no action

From: Clay King <clayking@amd.com>

[ Upstream commit 7d9ec9dc20ecdb1661f4538cd9112cd3d6a5f15a ]

[Why]
For RGB BT2020 full and limited color spaces, overlay adjustments were
applied twice (once by MM and once by DAL). This results in incorrect
colours and a noticeable difference between mpo and non-mpo cases.

[How]
Add RGB BT2020 full and limited color spaces to list that bypasses post
csc adjustment.

Reviewed-by: Aric Cyr <aric.cyr@amd.com>
Signed-off-by: Clay King <clayking@amd.com>
Signed-off-by: Tom Chung <chiahsuan.chung@amd.com>
Signed-off-by: Alex Deucher <alexander.deucher@amd.com>
Signed-off-by: Sasha Levin <sashal@kernel.org>
---

LLM Generated explanations, may be completely bogus:

## Analysis

### What the Commit Fixes

This commit fixes a **color correctness bug** in AMD display driver for
DCN3.0+ hardware. The bug causes incorrect colors when BT2020 RGB
content is displayed with multi-plane overlay (MPO).

**Root cause**: The old logic used a numeric enum comparison
`color_space >= COLOR_SPACE_YCBCR601` to decide whether to apply ICSC or
bypass post-CSC. Looking at the enum values:

| Color Space | Value | Should Bypass? | Old Behavior |
|---|---|---|---|
| COLOR_SPACE_SRGB | 1 | YES | bypass (correct) |
| COLOR_SPACE_MSREF_SCRGB | 4 | YES | bypass (correct) |
| COLOR_SPACE_YCBCR601 | 5 | NO | ICSC (correct) |
| COLOR_SPACE_2020_RGB_FULLRANGE | 11 | **YES** | **ICSC (WRONG)** |
| COLOR_SPACE_2020_RGB_LIMITEDRANGE | 12 | **YES** | **ICSC (WRONG)** |

Since `COLOR_SPACE_2020_RGB_FULLRANGE` (11) and
`COLOR_SPACE_2020_RGB_LIMITEDRANGE` (12) are numerically >=
`COLOR_SPACE_YCBCR601` (5), the old code incorrectly applied ICSC
instead of bypassing post-CSC. This resulted in overlay adjustments
being applied twice (by MM and DAL), causing visibly wrong colors in MPO
vs non-MPO rendering.

### Fix Approach

The fix replaces the fragile numeric comparison with an explicit switch-
case function `dpp3_should_bypass_post_csc_for_colorspace()` that
enumerates all RGB color spaces that should bypass post CSC. This is
both a bug fix and a robustness improvement — future enum additions
won't silently break the logic.

### Stable Kernel Criteria Assessment

1. **Fixes a real bug**: Yes — visible color corruption for BT2020 RGB
   content with MPO
2. **Obviously correct**: Yes — the switch-case explicitly lists RGB
   color spaces; reviewed by AMD's display lead (Aric Cyr)
3. **Small and contained**: Yes — ~30 lines added across 3 files, all in
   the same subsystem
4. **No new features**: Correct — this only fixes existing color space
   handling
5. **Risk**: Low — the change only affects which color spaces bypass
   post-CSC; worst case is reverting to the same incorrect behavior

### Concerns for Backporting

- **dcn401_dpp.c** was introduced in April 2024 (kernel ~6.10), so this
  portion won't apply to older stable trees (6.6.y, 6.1.y, etc.). The
  dcn30 portion should apply to kernels with DCN3.0 support (5.8+).
- **dcn10 and dcn20** have the same buggy pattern but are NOT fixed by
  this commit. This is not a blocker for backporting — the dcn30/dcn401
  fix stands on its own.
- The file paths were refactored in Feb 2024 (from `dc/dcn30/` to
  `dc/dpp/dcn30/`), so the patch will need path adjustment for older
  stable trees.

### User Impact

Users with AMD GPUs (RDNA2+) displaying HDR/BT2020 RGB content see
incorrect colors when the compositor uses multi-plane overlay. This is a
real-world visual bug affecting desktop and media playback scenarios.

### Verification

- Verified enum `dc_color_space` in `dc_hw_types.h` lines 642-666:
  confirmed `COLOR_SPACE_2020_RGB_FULLRANGE=11` and
  `COLOR_SPACE_2020_RGB_LIMITEDRANGE=12` are both >=
  `COLOR_SPACE_YCBCR601=5`, confirming the bug mechanism
- Verified the same buggy pattern `color_space >= COLOR_SPACE_YCBCR601`
  exists in dcn10_dpp.c (line 398), dcn20_dpp.c (line 239), dcn30_dpp.c
  (line 379), and dcn401_dpp.c (line 209) — confirming this is a long-
  standing bug
- Verified dcn401_dpp.c was introduced April 2024 (commit
  `70839da6360500a`), limiting backport applicability for dcn401 portion
  to kernels >= ~6.10
- Verified dcn30_dpp.c was moved to current path Feb 2024 — older stable
  trees will have it at `dc/dcn30/dcn30_dpp.c`
- Verified the new function `dpp3_should_bypass_post_csc_for_colorspace`
  does not exist in the current tree yet (this commit introduces it),
  confirming no dependency issues
- Could NOT verify whether specific user bug reports exist on mailing
  lists (unverified, but the commit message describes concrete user-
  visible symptoms)

### Summary

This is a clear bug fix for visible color corruption affecting AMD
display users with BT2020 RGB content. The fix is small, well-reviewed,
and low-risk. The only backporting consideration is path adjustments for
older stable trees and the dcn401 portion only applying to recent
kernels.

**YES**

 .../drm/amd/display/dc/dpp/dcn30/dcn30_dpp.c  | 21 ++++++++++++++++---
 .../drm/amd/display/dc/dpp/dcn30/dcn30_dpp.h  |  4 ++++
 .../amd/display/dc/dpp/dcn401/dcn401_dpp.c    |  6 +++---
 3 files changed, 25 insertions(+), 6 deletions(-)

diff --git a/drivers/gpu/drm/amd/display/dc/dpp/dcn30/dcn30_dpp.c b/drivers/gpu/drm/amd/display/dc/dpp/dcn30/dcn30_dpp.c
index ef4a161171814..c7923531da83d 100644
--- a/drivers/gpu/drm/amd/display/dc/dpp/dcn30/dcn30_dpp.c
+++ b/drivers/gpu/drm/amd/display/dc/dpp/dcn30/dcn30_dpp.c
@@ -376,10 +376,10 @@ void dpp3_cnv_setup (
 
 		tbl_entry.color_space = input_color_space;
 
-		if (color_space >= COLOR_SPACE_YCBCR601)
-			select = INPUT_CSC_SELECT_ICSC;
-		else
+		if (dpp3_should_bypass_post_csc_for_colorspace(color_space))
 			select = INPUT_CSC_SELECT_BYPASS;
+		else
+			select = INPUT_CSC_SELECT_ICSC;
 
 		dpp3_program_post_csc(dpp_base, color_space, select,
 				      &tbl_entry);
@@ -1541,3 +1541,18 @@ bool dpp3_construct(
 	return true;
 }
 
+bool dpp3_should_bypass_post_csc_for_colorspace(enum dc_color_space dc_color_space)
+{
+	switch (dc_color_space) {
+	case COLOR_SPACE_UNKNOWN:
+	case COLOR_SPACE_SRGB:
+	case COLOR_SPACE_XR_RGB:
+	case COLOR_SPACE_SRGB_LIMITED:
+	case COLOR_SPACE_MSREF_SCRGB:
+	case COLOR_SPACE_2020_RGB_FULLRANGE:
+	case COLOR_SPACE_2020_RGB_LIMITEDRANGE:
+		return true;
+	default:
+		return false;
+	}
+}
diff --git a/drivers/gpu/drm/amd/display/dc/dpp/dcn30/dcn30_dpp.h b/drivers/gpu/drm/amd/display/dc/dpp/dcn30/dcn30_dpp.h
index d4a70b4379eaf..6a61b99d6a798 100644
--- a/drivers/gpu/drm/amd/display/dc/dpp/dcn30/dcn30_dpp.h
+++ b/drivers/gpu/drm/amd/display/dc/dpp/dcn30/dcn30_dpp.h
@@ -644,4 +644,8 @@ void dpp3_program_cm_dealpha(
 
 void dpp3_cm_get_gamut_remap(struct dpp *dpp_base,
 			     struct dpp_grph_csc_adjustment *adjust);
+
+bool dpp3_should_bypass_post_csc_for_colorspace(
+		enum dc_color_space dc_color_space);
+
 #endif /* __DC_HWSS_DCN30_H__ */
diff --git a/drivers/gpu/drm/amd/display/dc/dpp/dcn401/dcn401_dpp.c b/drivers/gpu/drm/amd/display/dc/dpp/dcn401/dcn401_dpp.c
index 96c2c853de42c..2d6a646462e21 100644
--- a/drivers/gpu/drm/amd/display/dc/dpp/dcn401/dcn401_dpp.c
+++ b/drivers/gpu/drm/amd/display/dc/dpp/dcn401/dcn401_dpp.c
@@ -206,10 +206,10 @@ void dpp401_dpp_setup(
 
 		tbl_entry.color_space = input_color_space;
 
-		if (color_space >= COLOR_SPACE_YCBCR601)
-			select = INPUT_CSC_SELECT_ICSC;
-		else
+		if (dpp3_should_bypass_post_csc_for_colorspace(color_space))
 			select = INPUT_CSC_SELECT_BYPASS;
+		else
+			select = INPUT_CSC_SELECT_ICSC;
 
 		dpp3_program_post_csc(dpp_base, color_space, select,
 			&tbl_entry);
-- 
2.51.0

