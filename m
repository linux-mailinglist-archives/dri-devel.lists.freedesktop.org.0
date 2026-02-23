Return-Path: <dri-devel-bounces@lists.freedesktop.org>
Delivered-To: lists+dri-devel@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id WBcMDENKnGmODAQAu9opvQ
	(envelope-from <dri-devel-bounces@lists.freedesktop.org>)
	for <lists+dri-devel@lfdr.de>; Mon, 23 Feb 2026 13:38:27 +0100
X-Original-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id D31C617637E
	for <lists+dri-devel@lfdr.de>; Mon, 23 Feb 2026 13:38:26 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 20BE010E38D;
	Mon, 23 Feb 2026 12:38:25 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=kernel.org header.i=@kernel.org header.b="eJFmMZGP";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from tor.source.kernel.org (tor.source.kernel.org [172.105.4.254])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 3CA8510E38C;
 Mon, 23 Feb 2026 12:38:24 +0000 (UTC)
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
 by tor.source.kernel.org (Postfix) with ESMTP id B193D6012A;
 Mon, 23 Feb 2026 12:38:23 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 4059CC116D0;
 Mon, 23 Feb 2026 12:38:22 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=k20201202; t=1771850303;
 bh=D4dP0LYI4VlNV2ZYxZrotI++ONdV7jpBxNahnBVB4Mo=;
 h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
 b=eJFmMZGPERG4NA96DSa5WB12kayrTHtIBx183siOSvDAo5dWeN+KqBg7MvdBm0pxt
 wq5pnqxQD7WMYtR8Avg4ym7fYE7WlSFftH8Ii2V9XfkSDoGwDk33O/Ecj9LVXcqPUs
 RySQVmRGfS/Q4LU3KUJsl28RFDOWVEDnTn67K+eVsxb+nx+eh16qcRCK5r8JE+gU5W
 FOO7OjGKx9p+aS9uBNvwpKc21SjrBOx0HZaTgmk+neFi6YE52Jha45drWTmm0vrqo6
 wvm+sdmprmgxhfn6Lo19sq5eIYaJBU56pSVzaK4Z7/WpGt+1nBmOUI0rc/aLSkmPaW
 rgR4EfXTx/idA==
From: Sasha Levin <sashal@kernel.org>
To: patches@lists.linux.dev,
	stable@vger.kernel.org
Cc: decce6 <decce6@proton.me>, Alex Deucher <alexander.deucher@amd.com>,
 Sasha Levin <sashal@kernel.org>, kenneth.feng@amd.com,
 christian.koenig@amd.com, airlied@gmail.com, simona@ffwll.ch,
 amd-gfx@lists.freedesktop.org, dri-devel@lists.freedesktop.org,
 linux-kernel@vger.kernel.org
Subject: [PATCH AUTOSEL 6.19-5.10] drm/amdgpu: Add HAINAN clock adjustment
Date: Mon, 23 Feb 2026 07:37:34 -0500
Message-ID: <20260223123738.1532940-29-sashal@kernel.org>
X-Mailer: git-send-email 2.51.0
In-Reply-To: <20260223123738.1532940-1-sashal@kernel.org>
References: <20260223123738.1532940-1-sashal@kernel.org>
MIME-Version: 1.0
X-stable: review
X-Patchwork-Hint: Ignore
X-stable-base: Linux 6.19.3
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
X-Spamd-Result: default: False [0.19 / 15.00];
	MID_CONTAINS_FROM(1.00)[];
	R_MISSING_CHARSET(0.50)[];
	DMARC_POLICY_ALLOW(-0.50)[kernel.org,quarantine];
	R_DKIM_ALLOW(-0.20)[kernel.org:s=k20201202];
	R_SPF_ALLOW(-0.20)[+ip4:131.252.210.177:c];
	MAILLIST(-0.20)[mailman];
	RWL_MAILSPIKE_GOOD(-0.10)[131.252.210.177:from];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	FREEMAIL_CC(0.00)[proton.me,amd.com,kernel.org,gmail.com,ffwll.ch,lists.freedesktop.org,vger.kernel.org];
	RCVD_TLS_LAST(0.00)[];
	RCVD_COUNT_THREE(0.00)[4];
	RCPT_COUNT_TWELVE(0.00)[12];
	MIME_TRACE(0.00)[0:+];
	ARC_NA(0.00)[];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	TO_DN_SOME(0.00)[];
	FORGED_SENDER_MAILLIST(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[sashal@kernel.org,dri-devel-bounces@lists.freedesktop.org];
	FROM_HAS_DN(0.00)[];
	DKIM_TRACE(0.00)[kernel.org:+];
	NEURAL_HAM(-0.00)[-1.000];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	TAGGED_RCPT(0.00)[dri-devel];
	ASN(0.00)[asn:6366, ipnet:131.252.0.0/16, country:US];
	DBL_BLOCKED_OPENRESOLVER(0.00)[amd.com:email,gabe.freedesktop.org:helo,gabe.freedesktop.org:rdns,proton.me:email]
X-Rspamd-Queue-Id: D31C617637E
X-Rspamd-Action: no action

From: decce6 <decce6@proton.me>

[ Upstream commit 49fe2c57bdc0acff9d2551ae337270b6fd8119d9 ]

This patch limits the clock speeds of the AMD Radeon R5 M420 GPU from
850/1000MHz (core/memory) to 800/950 MHz, making it work stably. This
patch is for amdgpu.

Signed-off-by: decce6 <decce6@proton.me>
Signed-off-by: Alex Deucher <alexander.deucher@amd.com>
Signed-off-by: Sasha Levin <sashal@kernel.org>
---

LLM Generated explanations, may be completely bogus:

## Analysis

### What the commit does
This adds a hardware-specific clock speed limitation (quirk) for the AMD
Radeon R5 M420 GPU (PCI device 0x666f, revision 0x00, HAINAN chip
family). It caps the core clock at 800 MHz and memory clock at 950 MHz,
down from 850/1000 MHz defaults, to fix GPU instability.

### Classification: Hardware Quirk/Workaround
This falls squarely into the **hardware quirk** exception category for
stable backports. The change:

1. **Is small and contained**: Only 5 lines added to a single file
2. **Follows an established pattern exactly**: The existing function
   `si_apply_state_adjust_rules()` already contains identical quirks for
   other HAINAN and OLAND device/revision combinations (lines
   3454-3481). The new code is a copy of this pattern.
3. **Fixes a real stability issue**: Without the clock cap, this
   specific GPU is unstable at default clocks. This means crashes,
   display corruption, or hangs for users with this hardware.
4. **Has zero risk to other hardware**: The change is gated by
   `adev->pdev->device == 0x666f && adev->pdev->revision == 0x00`, so it
   only affects one specific GPU variant.
5. **No new features or APIs**: Just limiting existing clock values.

### Risk Assessment
**Very low risk.** The change:
- Adds a device-specific conditional inside existing well-tested
  infrastructure
- Cannot affect any other device (specific PCI device ID + revision
  check)
- The `max_sclk`/`max_mclk` capping mechanism is already used by
  multiple other entries (lines 3575-3581)
- Was reviewed and signed off by Alex Deucher, the AMD GPU maintainer

### User Impact
Users with the AMD Radeon R5 M420 (a budget laptop GPU) experience
instability without this fix. This is found in many budget laptops and
the fix makes the difference between a working and non-working GPU under
the amdgpu driver.

### Dependency Check
No dependencies. The code being modified (`si_apply_state_adjust_rules`
with HAINAN device checks) has been present in the kernel for years
(since the amdgpu SI support was added). The `CHIP_HAINAN` branch and
the `max_sclk`/`max_mclk` mechanism are well-established in all stable
trees that support this hardware.

### Verification
- Read the diff and confirmed it adds exactly 5 lines matching the
  existing quirk pattern in `si_apply_state_adjust_rules()` (lines
  3454-3466 for existing HAINAN quirks)
- Verified `max_sclk` and `max_mclk` are used at lines 3575-3581 to cap
  performance levels - confirming the mechanism works
- Confirmed the change is authored by an external contributor and signed
  off by Alex Deucher (AMD GPU subsystem maintainer)
- Confirmed via `git log` that `si_dpm.c` has a history of receiving
  similar quirk/workaround fixes (e.g., "Workaround SI powertune issue
  on Radeon 430")
- lore.kernel.org search confirmed the patch went through multiple
  review iterations (Jan-Feb 2026) before being accepted by AMD
  maintainer
- Could NOT verify exact stable tree versions containing the base HAINAN
  support, but CHIP_HAINAN support in amdgpu has existed since at least
  v4.x (unverified exact version)

### Conclusion
This is a textbook hardware quirk addition - small, safe, device-
specific, zero risk to other hardware, fixes a real stability issue for
users with this GPU. It follows the exact same pattern as existing
entries in the same function. This is exactly the type of change that
stable trees exist to deliver.

**YES**

 drivers/gpu/drm/amd/pm/legacy-dpm/si_dpm.c | 5 +++++
 1 file changed, 5 insertions(+)

diff --git a/drivers/gpu/drm/amd/pm/legacy-dpm/si_dpm.c b/drivers/gpu/drm/amd/pm/legacy-dpm/si_dpm.c
index 695432d3045ff..2d8d86efe2e73 100644
--- a/drivers/gpu/drm/amd/pm/legacy-dpm/si_dpm.c
+++ b/drivers/gpu/drm/amd/pm/legacy-dpm/si_dpm.c
@@ -3464,6 +3464,11 @@ static void si_apply_state_adjust_rules(struct amdgpu_device *adev,
 			max_sclk = 60000;
 			max_mclk = 80000;
 		}
+		if ((adev->pdev->device == 0x666f) &&
+		    (adev->pdev->revision == 0x00)) {
+			max_sclk = 80000;
+			max_mclk = 95000;
+		}
 	} else if (adev->asic_type == CHIP_OLAND) {
 		if ((adev->pdev->revision == 0xC7) ||
 		    (adev->pdev->revision == 0x80) ||
-- 
2.51.0

