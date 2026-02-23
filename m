Return-Path: <dri-devel-bounces@lists.freedesktop.org>
Delivered-To: lists+dri-devel@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id yCkJHipKnGmODAQAu9opvQ
	(envelope-from <dri-devel-bounces@lists.freedesktop.org>)
	for <lists+dri-devel@lfdr.de>; Mon, 23 Feb 2026 13:38:02 +0100
X-Original-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id CEB5F17631C
	for <lists+dri-devel@lfdr.de>; Mon, 23 Feb 2026 13:38:01 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id C3A6610E381;
	Mon, 23 Feb 2026 12:37:59 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=kernel.org header.i=@kernel.org header.b="JMfm+V6e";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from sea.source.kernel.org (sea.source.kernel.org [172.234.252.31])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 01CAD10E380;
 Mon, 23 Feb 2026 12:37:59 +0000 (UTC)
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
 by sea.source.kernel.org (Postfix) with ESMTP id DAD1D43911;
 Mon, 23 Feb 2026 12:37:58 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id AD524C2BC9E;
 Mon, 23 Feb 2026 12:37:57 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=k20201202; t=1771850278;
 bh=M7F2rSTTqr90Kn3s4L70s4qOpWDL49vgW3qJw5dHmnU=;
 h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
 b=JMfm+V6eIgrVBP6y3qGfX7YcCECFquhAtBS7xZY1ahms9qRL3DUksH0VXq9TG5+in
 BttTE2cB/5mZQ7H4F5NQbWX+b9bDid3dN4vuCZ2/UnSMVNThYnZAgrHF1HVEMV4a+w
 3bO9tnNZs+T2ygod/EswOhPIH3lI0KWpsWwf9/8G80OUA585n5s8pmbT6VsYdlP3Uu
 8PLLZytVdicWS3R0GjEQIolxao8aQ676xcD+MojbqD/YVxzuENvLmhcGJAaFHS7ne7
 cg2G6QdSn7GWVGxy3JByTkd7xELCYIvn6/ar1MgJVGgs8YN6VsITy+SnSekS0mwcQV
 jquZCYtetHIew==
From: Sasha Levin <sashal@kernel.org>
To: patches@lists.linux.dev,
	stable@vger.kernel.org
Cc: decce6 <decce6@proton.me>, Alex Deucher <alexander.deucher@amd.com>,
 Sasha Levin <sashal@kernel.org>, christian.koenig@amd.com,
 airlied@gmail.com, simona@ffwll.ch, amd-gfx@lists.freedesktop.org,
 dri-devel@lists.freedesktop.org, linux-kernel@vger.kernel.org
Subject: [PATCH AUTOSEL 6.19-5.10] drm/radeon: Add HAINAN clock adjustment
Date: Mon, 23 Feb 2026 07:37:18 -0500
Message-ID: <20260223123738.1532940-13-sashal@kernel.org>
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
	FREEMAIL_CC(0.00)[proton.me,amd.com,kernel.org,gmail.com,ffwll.ch,lists.freedesktop.org,vger.kernel.org];
	ARC_NA(0.00)[];
	RCVD_TLS_LAST(0.00)[];
	TO_DN_SOME(0.00)[];
	RCVD_COUNT_THREE(0.00)[4];
	MIME_TRACE(0.00)[0:+];
	FROM_HAS_DN(0.00)[];
	DKIM_TRACE(0.00)[kernel.org:+];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	NEURAL_HAM(-0.00)[-1.000];
	FROM_NEQ_ENVFROM(0.00)[sashal@kernel.org,dri-devel-bounces@lists.freedesktop.org];
	FORGED_SENDER_MAILLIST(0.00)[];
	RCPT_COUNT_SEVEN(0.00)[11];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	TAGGED_RCPT(0.00)[dri-devel];
	ASN(0.00)[asn:6366, ipnet:131.252.0.0/16, country:US];
	DBL_BLOCKED_OPENRESOLVER(0.00)[gabe.freedesktop.org:helo,gabe.freedesktop.org:rdns,amd.com:email,proton.me:email]
X-Rspamd-Queue-Id: CEB5F17631C
X-Rspamd-Action: no action

From: decce6 <decce6@proton.me>

[ Upstream commit 908d318f23d6b5d625bea093c5fc056238cdb7ff ]

This patch limits the clock speeds of the AMD Radeon R5 M420 GPU from
850/1000MHz (core/memory) to 800/950 MHz, making it work stably. This
patch is for radeon.

Signed-off-by: decce6 <decce6@proton.me>
Signed-off-by: Alex Deucher <alexander.deucher@amd.com>
Signed-off-by: Sasha Levin <sashal@kernel.org>
---

LLM Generated explanations, may be completely bogus:

Now let me check the existing code to understand the pattern of these
quirks and what the commit adds.

## Analysis

### What the commit does
This commit adds a device-specific clock speed limitation (quirk) for
the AMD Radeon R5 M420 GPU, identified by PCI device ID `0x666f` and
revision `0x00`. It caps the core clock (sclk) to 800 MHz (80000 *
10kHz) and memory clock (mclk) to 950 MHz (95000 * 10kHz), down from the
default 850/1000 MHz, to achieve stable operation.

### Classification: Hardware Quirk
This is a **hardware quirk/workaround** — it follows an existing, well-
established pattern in `si_apply_state_adjust_rules()` where specific
HAINAN and OLAND device IDs/revisions have their clock speeds capped to
prevent instability. The existing code already has multiple similar
entries for other HAINAN variants (0x6664, 0x6665, 0x6667) and OLAND
variants.

### Stable Kernel Criteria Assessment

**Meets criteria:**
- **Fixes a real bug**: Without this quirk, the R5 M420 GPU runs
  unstably at its default clock speeds. This is a stability fix for real
  hardware.
- **Small and contained**: +5 lines, purely additive, in a single file,
  within an existing pattern.
- **Obviously correct**: Follows the exact same pattern as adjacent
  quirk entries.
- **No new features**: This is a workaround for broken hardware, not a
  feature.
- **Low risk**: Only affects the specific device ID 0x666f rev 0x00 —
  cannot impact any other hardware.
- **Accepted by AMD maintainer**: Signed off by Alex Deucher (AMD GPU
  subsystem maintainer).

**Concerns:**
- The commit message says "making it work stably" but doesn't detail
  specific symptoms (crashes, GPU hangs, artifacts, etc.).
- The author (`decce6@proton.me`) appears to be a relatively new
  contributor, and there's no `Tested-by:` or `Reported-by:` tag from
  others.
- However, this exact pattern has been used for years for other HAINAN
  variants, and similar patches have been accepted and even modified
  over time (see commits `c7e5587964201` and `a628392cf03e0`).

### Risk Assessment
**Very low risk**. The change is gated by specific device ID AND
revision checks (`device == 0x666f && revision == 0x00`), so it cannot
affect any other GPU. The pattern is identical to existing, proven quirk
entries. The worst case if the quirk values are wrong is slightly lower
performance on that one specific GPU model — the current state without
the quirk is instability/crashes.

### Verification
- Verified the existing code pattern in `si_apply_state_adjust_rules()`
  at `si_dpm.c:2915-2941` — the new code follows the exact same
  structure.
- Verified commit `c7e5587964201` shows history of HAINAN clock quirk
  adjustments (removing rev 0x83 because it worked stably without
  overrides), confirming this is an established practice.
- Verified commit `a628392cf03e0` dropped an mclk quirk for HAINAN when
  firmware improved, showing these quirks are hardware-specific and
  necessary.
- Verified device 0x666f is not referenced elsewhere in the radeon
  driver (grep found no other matches), confirming no conflicts.
- Could not access full mailing list discussion on lore.kernel.org
  (search only returned index pages).
- The patch was signed off by Alex Deucher, the AMD GPU maintainer,
  confirming maintainer approval.

This is a textbook hardware quirk addition — small, targeted, following
an established pattern, fixing a real stability issue on specific
hardware. These are explicitly called out as appropriate for stable
backporting.

**YES**

 drivers/gpu/drm/radeon/si_dpm.c | 5 +++++
 1 file changed, 5 insertions(+)

diff --git a/drivers/gpu/drm/radeon/si_dpm.c b/drivers/gpu/drm/radeon/si_dpm.c
index 9deb91970d4df..f12227145ef08 100644
--- a/drivers/gpu/drm/radeon/si_dpm.c
+++ b/drivers/gpu/drm/radeon/si_dpm.c
@@ -2925,6 +2925,11 @@ static void si_apply_state_adjust_rules(struct radeon_device *rdev,
 			max_sclk = 60000;
 			max_mclk = 80000;
 		}
+		if ((rdev->pdev->device == 0x666f) &&
+		    (rdev->pdev->revision == 0x00)) {
+			max_sclk = 80000;
+			max_mclk = 95000;
+		}
 	} else if (rdev->family == CHIP_OLAND) {
 		if ((rdev->pdev->revision == 0xC7) ||
 		    (rdev->pdev->revision == 0x80) ||
-- 
2.51.0

