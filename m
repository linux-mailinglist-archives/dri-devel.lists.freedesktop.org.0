Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 58C5C88DF52
	for <lists+dri-devel@lfdr.de>; Wed, 27 Mar 2024 13:23:08 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id CC52410FC34;
	Wed, 27 Mar 2024 12:23:04 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=kernel.org header.i=@kernel.org header.b="jAJYVwxF";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from dfw.source.kernel.org (dfw.source.kernel.org [139.178.84.217])
 by gabe.freedesktop.org (Postfix) with ESMTPS id D2C2010FC31;
 Wed, 27 Mar 2024 12:23:02 +0000 (UTC)
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
 by dfw.source.kernel.org (Postfix) with ESMTP id 4AC65614E3;
 Wed, 27 Mar 2024 12:23:02 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 1DE0CC433F1;
 Wed, 27 Mar 2024 12:23:01 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=k20201202; t=1711542182;
 bh=rbEE12QMPMTIwD8fxagOOe+sH5H49TSnbgVxh8Z31/w=;
 h=From:To:Cc:Subject:Date:From;
 b=jAJYVwxFT1hT/5v5ftE33q1yhjpYMQZfYm3LL1Uc8EeWu287UNCepxyuPT1F+xaXm
 b66kzN3iFQQMa+NPyb0m2axikVnVtrkZfPDcUmTmIPvxeGFKnFX4txFzPCEjSUA3uk
 rCTVk2g3BhaMNZK0/68hcDzanwBsI9icdtd5pBgol6XoipHE0yAXQUjBQCPvP/tlKx
 iCCLhbGV990oqAq+GLl4s7RKM46+uV10n9bDaIXHskt1iMrN/4ATK4EqIac88lCRMx
 3Om6wfUGK/5xjRQoHxjm+r96PAyu6b1cG0X1WlqxHzc4lx38wTML4pbw9WMA3FRpR6
 FzFVCeR9p3Xiw==
From: Sasha Levin <sashal@kernel.org>
To: stable@vger.kernel.org,
	friedrich.vock@gmx.de
Cc: Joshua Ashton <joshua@froggi.es>, Alex Deucher <alexander.deucher@amd.com>,
 =?UTF-8?q?Christian=20K=C3=B6nig?= <christian.koenig@amd.com>,
 amd-gfx@lists.freedesktop.org, dri-devel@lists.freedesktop.org,
 linux-kernel@vger.kernel.org
Subject: FAILED: Patch "drm/amdgpu: Reset IH OVERFLOW_CLEAR bit" failed to
 apply to 5.4-stable tree
Date: Wed, 27 Mar 2024 08:22:59 -0400
Message-ID: <20240327122300.2838132-1-sashal@kernel.org>
X-Mailer: git-send-email 2.43.0
MIME-Version: 1.0
X-Patchwork-Hint: ignore
X-stable: review
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

The patch below does not apply to the 5.4-stable tree.
If someone wants it applied there, or to any other stable or longterm
tree, then please email the backport, including the original git commit
id to <stable@vger.kernel.org>.

Thanks,
Sasha

------------------ original commit in Linus's tree ------------------

From 9217b91c64587459362f211b0310e2bdaeb67719 Mon Sep 17 00:00:00 2001
From: Friedrich Vock <friedrich.vock@gmx.de>
Date: Tue, 23 Jan 2024 12:52:03 +0100
Subject: [PATCH] drm/amdgpu: Reset IH OVERFLOW_CLEAR bit
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit

Allows us to detect subsequent IH ring buffer overflows as well.

Cc: Joshua Ashton <joshua@froggi.es>
Cc: Alex Deucher <alexander.deucher@amd.com>
Cc: Christian König <christian.koenig@amd.com>
Cc: stable@vger.kernel.org
Signed-off-by: Friedrich Vock <friedrich.vock@gmx.de>
Reviewed-by: Christian König <christian.koenig@amd.com>
Signed-off-by: Alex Deucher <alexander.deucher@amd.com>
---
 drivers/gpu/drm/amd/amdgpu/cik_ih.c     | 6 ++++++
 drivers/gpu/drm/amd/amdgpu/cz_ih.c      | 5 +++++
 drivers/gpu/drm/amd/amdgpu/iceland_ih.c | 5 +++++
 drivers/gpu/drm/amd/amdgpu/ih_v6_0.c    | 6 ++++++
 drivers/gpu/drm/amd/amdgpu/ih_v6_1.c    | 7 +++++++
 drivers/gpu/drm/amd/amdgpu/navi10_ih.c  | 6 ++++++
 drivers/gpu/drm/amd/amdgpu/si_ih.c      | 6 ++++++
 drivers/gpu/drm/amd/amdgpu/tonga_ih.c   | 6 ++++++
 drivers/gpu/drm/amd/amdgpu/vega10_ih.c  | 6 ++++++
 drivers/gpu/drm/amd/amdgpu/vega20_ih.c  | 6 ++++++
 10 files changed, 59 insertions(+)

diff --git a/drivers/gpu/drm/amd/amdgpu/cik_ih.c b/drivers/gpu/drm/amd/amdgpu/cik_ih.c
index 6f7c031dd197a..f24e34dc33d1d 100644
--- a/drivers/gpu/drm/amd/amdgpu/cik_ih.c
+++ b/drivers/gpu/drm/amd/amdgpu/cik_ih.c
@@ -204,6 +204,12 @@ static u32 cik_ih_get_wptr(struct amdgpu_device *adev,
 		tmp = RREG32(mmIH_RB_CNTL);
 		tmp |= IH_RB_CNTL__WPTR_OVERFLOW_CLEAR_MASK;
 		WREG32(mmIH_RB_CNTL, tmp);
+
+		/* Unset the CLEAR_OVERFLOW bit immediately so new overflows
+		 * can be detected.
+		 */
+		tmp &= ~IH_RB_CNTL__WPTR_OVERFLOW_CLEAR_MASK;
+		WREG32(mmIH_RB_CNTL, tmp);
 	}
 	return (wptr & ih->ptr_mask);
 }
diff --git a/drivers/gpu/drm/amd/amdgpu/cz_ih.c b/drivers/gpu/drm/amd/amdgpu/cz_ih.c
index b8c47e0cf37ad..c19681492efa7 100644
--- a/drivers/gpu/drm/amd/amdgpu/cz_ih.c
+++ b/drivers/gpu/drm/amd/amdgpu/cz_ih.c
@@ -216,6 +216,11 @@ static u32 cz_ih_get_wptr(struct amdgpu_device *adev,
 	tmp = REG_SET_FIELD(tmp, IH_RB_CNTL, WPTR_OVERFLOW_CLEAR, 1);
 	WREG32(mmIH_RB_CNTL, tmp);
 
+	/* Unset the CLEAR_OVERFLOW bit immediately so new overflows
+	 * can be detected.
+	 */
+	tmp = REG_SET_FIELD(tmp, IH_RB_CNTL, WPTR_OVERFLOW_CLEAR, 0);
+	WREG32(mmIH_RB_CNTL, tmp);
 
 out:
 	return (wptr & ih->ptr_mask);
diff --git a/drivers/gpu/drm/amd/amdgpu/iceland_ih.c b/drivers/gpu/drm/amd/amdgpu/iceland_ih.c
index aecad530b10a6..2c02ae69883d2 100644
--- a/drivers/gpu/drm/amd/amdgpu/iceland_ih.c
+++ b/drivers/gpu/drm/amd/amdgpu/iceland_ih.c
@@ -215,6 +215,11 @@ static u32 iceland_ih_get_wptr(struct amdgpu_device *adev,
 	tmp = REG_SET_FIELD(tmp, IH_RB_CNTL, WPTR_OVERFLOW_CLEAR, 1);
 	WREG32(mmIH_RB_CNTL, tmp);
 
+	/* Unset the CLEAR_OVERFLOW bit immediately so new overflows
+	 * can be detected.
+	 */
+	tmp = REG_SET_FIELD(tmp, IH_RB_CNTL, WPTR_OVERFLOW_CLEAR, 0);
+	WREG32(mmIH_RB_CNTL, tmp);
 
 out:
 	return (wptr & ih->ptr_mask);
diff --git a/drivers/gpu/drm/amd/amdgpu/ih_v6_0.c b/drivers/gpu/drm/amd/amdgpu/ih_v6_0.c
index d9ed7332d805d..ad4ad39f128f7 100644
--- a/drivers/gpu/drm/amd/amdgpu/ih_v6_0.c
+++ b/drivers/gpu/drm/amd/amdgpu/ih_v6_0.c
@@ -418,6 +418,12 @@ static u32 ih_v6_0_get_wptr(struct amdgpu_device *adev,
 	tmp = RREG32_NO_KIQ(ih_regs->ih_rb_cntl);
 	tmp = REG_SET_FIELD(tmp, IH_RB_CNTL, WPTR_OVERFLOW_CLEAR, 1);
 	WREG32_NO_KIQ(ih_regs->ih_rb_cntl, tmp);
+
+	/* Unset the CLEAR_OVERFLOW bit immediately so new overflows
+	 * can be detected.
+	 */
+	tmp = REG_SET_FIELD(tmp, IH_RB_CNTL, WPTR_OVERFLOW_CLEAR, 0);
+	WREG32_NO_KIQ(ih_regs->ih_rb_cntl, tmp);
 out:
 	return (wptr & ih->ptr_mask);
 }
diff --git a/drivers/gpu/drm/amd/amdgpu/ih_v6_1.c b/drivers/gpu/drm/amd/amdgpu/ih_v6_1.c
index 8fb05eae340ad..b8da0fc29378c 100644
--- a/drivers/gpu/drm/amd/amdgpu/ih_v6_1.c
+++ b/drivers/gpu/drm/amd/amdgpu/ih_v6_1.c
@@ -418,6 +418,13 @@ static u32 ih_v6_1_get_wptr(struct amdgpu_device *adev,
 	tmp = RREG32_NO_KIQ(ih_regs->ih_rb_cntl);
 	tmp = REG_SET_FIELD(tmp, IH_RB_CNTL, WPTR_OVERFLOW_CLEAR, 1);
 	WREG32_NO_KIQ(ih_regs->ih_rb_cntl, tmp);
+
+	/* Unset the CLEAR_OVERFLOW bit immediately so new overflows
+	 * can be detected.
+	 */
+	tmp = REG_SET_FIELD(tmp, IH_RB_CNTL, WPTR_OVERFLOW_CLEAR, 0);
+	WREG32_NO_KIQ(ih_regs->ih_rb_cntl, tmp);
+
 out:
 	return (wptr & ih->ptr_mask);
 }
diff --git a/drivers/gpu/drm/amd/amdgpu/navi10_ih.c b/drivers/gpu/drm/amd/amdgpu/navi10_ih.c
index 57d04ed20357b..4178f4e5dad73 100644
--- a/drivers/gpu/drm/amd/amdgpu/navi10_ih.c
+++ b/drivers/gpu/drm/amd/amdgpu/navi10_ih.c
@@ -442,6 +442,12 @@ static u32 navi10_ih_get_wptr(struct amdgpu_device *adev,
 	tmp = RREG32_NO_KIQ(ih_regs->ih_rb_cntl);
 	tmp = REG_SET_FIELD(tmp, IH_RB_CNTL, WPTR_OVERFLOW_CLEAR, 1);
 	WREG32_NO_KIQ(ih_regs->ih_rb_cntl, tmp);
+
+	/* Unset the CLEAR_OVERFLOW bit immediately so new overflows
+	 * can be detected.
+	 */
+	tmp = REG_SET_FIELD(tmp, IH_RB_CNTL, WPTR_OVERFLOW_CLEAR, 0);
+	WREG32_NO_KIQ(ih_regs->ih_rb_cntl, tmp);
 out:
 	return (wptr & ih->ptr_mask);
 }
diff --git a/drivers/gpu/drm/amd/amdgpu/si_ih.c b/drivers/gpu/drm/amd/amdgpu/si_ih.c
index 9a24f17a57502..cada9f300a7f5 100644
--- a/drivers/gpu/drm/amd/amdgpu/si_ih.c
+++ b/drivers/gpu/drm/amd/amdgpu/si_ih.c
@@ -119,6 +119,12 @@ static u32 si_ih_get_wptr(struct amdgpu_device *adev,
 		tmp = RREG32(IH_RB_CNTL);
 		tmp |= IH_RB_CNTL__WPTR_OVERFLOW_CLEAR_MASK;
 		WREG32(IH_RB_CNTL, tmp);
+
+		/* Unset the CLEAR_OVERFLOW bit immediately so new overflows
+		 * can be detected.
+		 */
+		tmp &= ~IH_RB_CNTL__WPTR_OVERFLOW_CLEAR_MASK;
+		WREG32(IH_RB_CNTL, tmp);
 	}
 	return (wptr & ih->ptr_mask);
 }
diff --git a/drivers/gpu/drm/amd/amdgpu/tonga_ih.c b/drivers/gpu/drm/amd/amdgpu/tonga_ih.c
index 917707bba7f36..450b6e8315091 100644
--- a/drivers/gpu/drm/amd/amdgpu/tonga_ih.c
+++ b/drivers/gpu/drm/amd/amdgpu/tonga_ih.c
@@ -219,6 +219,12 @@ static u32 tonga_ih_get_wptr(struct amdgpu_device *adev,
 	tmp = REG_SET_FIELD(tmp, IH_RB_CNTL, WPTR_OVERFLOW_CLEAR, 1);
 	WREG32(mmIH_RB_CNTL, tmp);
 
+	/* Unset the CLEAR_OVERFLOW bit immediately so new overflows
+	 * can be detected.
+	 */
+	tmp = REG_SET_FIELD(tmp, IH_RB_CNTL, WPTR_OVERFLOW_CLEAR, 0);
+	WREG32(mmIH_RB_CNTL, tmp);
+
 out:
 	return (wptr & ih->ptr_mask);
 }
diff --git a/drivers/gpu/drm/amd/amdgpu/vega10_ih.c b/drivers/gpu/drm/amd/amdgpu/vega10_ih.c
index d364c6dd152c3..bf68e18e3824b 100644
--- a/drivers/gpu/drm/amd/amdgpu/vega10_ih.c
+++ b/drivers/gpu/drm/amd/amdgpu/vega10_ih.c
@@ -373,6 +373,12 @@ static u32 vega10_ih_get_wptr(struct amdgpu_device *adev,
 	tmp = REG_SET_FIELD(tmp, IH_RB_CNTL, WPTR_OVERFLOW_CLEAR, 1);
 	WREG32_NO_KIQ(ih_regs->ih_rb_cntl, tmp);
 
+	/* Unset the CLEAR_OVERFLOW bit immediately so new overflows
+	 * can be detected.
+	 */
+	tmp = REG_SET_FIELD(tmp, IH_RB_CNTL, WPTR_OVERFLOW_CLEAR, 0);
+	WREG32_NO_KIQ(ih_regs->ih_rb_cntl, tmp);
+
 out:
 	return (wptr & ih->ptr_mask);
 }
diff --git a/drivers/gpu/drm/amd/amdgpu/vega20_ih.c b/drivers/gpu/drm/amd/amdgpu/vega20_ih.c
index ddfc6941f9d55..db66e6cccaf2a 100644
--- a/drivers/gpu/drm/amd/amdgpu/vega20_ih.c
+++ b/drivers/gpu/drm/amd/amdgpu/vega20_ih.c
@@ -421,6 +421,12 @@ static u32 vega20_ih_get_wptr(struct amdgpu_device *adev,
 	tmp = REG_SET_FIELD(tmp, IH_RB_CNTL, WPTR_OVERFLOW_CLEAR, 1);
 	WREG32_NO_KIQ(ih_regs->ih_rb_cntl, tmp);
 
+	/* Unset the CLEAR_OVERFLOW bit immediately so new overflows
+	 * can be detected.
+	 */
+	tmp = REG_SET_FIELD(tmp, IH_RB_CNTL, WPTR_OVERFLOW_CLEAR, 0);
+	WREG32_NO_KIQ(ih_regs->ih_rb_cntl, tmp);
+
 out:
 	return (wptr & ih->ptr_mask);
 }
-- 
2.43.0




