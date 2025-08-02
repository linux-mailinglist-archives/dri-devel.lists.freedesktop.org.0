Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id B93F0B18B49
	for <lists+dri-devel@lfdr.de>; Sat,  2 Aug 2025 10:22:34 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 6EDA410E32B;
	Sat,  2 Aug 2025 08:22:24 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=ethancedwards.com header.i=@ethancedwards.com header.b="eQRFA9LU";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
X-Greylist: delayed 444 seconds by postgrey-1.36 at gabe;
 Sat, 02 Aug 2025 01:45:48 UTC
Received: from mout-p-103.mailbox.org (mout-p-103.mailbox.org [80.241.56.161])
 by gabe.freedesktop.org (Postfix) with ESMTPS id E40E310E07E;
 Sat,  2 Aug 2025 01:45:48 +0000 (UTC)
Received: from smtp1.mailbox.org (smtp1.mailbox.org
 [IPv6:2001:67c:2050:b231:465::1])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
 (No client certificate requested)
 by mout-p-103.mailbox.org (Postfix) with ESMTPS id 4bv5Hs6L4Bz9srX;
 Sat,  2 Aug 2025 03:45:45 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ethancedwards.com;
 s=MBO0001; t=1754099145;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding;
 bh=CpjI4I6Uq8G040F7+g4OD3KACxvNtwDXSXaQIXXONz8=;
 b=eQRFA9LUCoFkzelyoGO+FBD17JtZjzVoqzAjzZtNl/dF32NJql/WJ6XjL5U94pnG0oYiDI
 vDu/pIoQQ2s7N5zDGGdcY6nivksV9GakgFmkd7wES/1i/ZdHkyVgo2hzIx16QmwqojQD3q
 BVhuUxNdqa+rg/150nSip3EwxGLWZs1NiiQOsq8rhVuFF3+UbSS9sIb9UOJqQu5EBskjNB
 OgWPz0XUQOB3qQwDf9Mbt+qUoEkGnA6vVia3/CpjrTGX2o5nmNkL4MjORfEiWErH6VFxlq
 0JaQk1NYt01Ogl5fHHDvfye9CUzXo3YqRf76olZnr3PndUuzCnSyxPV6h+8+xQ==
Authentication-Results: outgoing_mbo_mout; dkim=none;
 spf=pass (outgoing_mbo_mout: domain of ethan@ethancedwards.com designates
 2001:67c:2050:b231:465::1 as permitted sender)
 smtp.mailfrom=ethan@ethancedwards.com
From: Ethan Carter Edwards <ethan@ethancedwards.com>
Date: Fri, 01 Aug 2025 21:45:41 -0400
Subject: [PATCH] drm/amdgpu/gfx9: remove redundant repeated null checks
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20250801-amdgfxv9-v1-1-0b9670ab5509@ethancedwards.com>
X-B4-Tracking: v=1; b=H4sIAMRtjWgC/6tWKk4tykwtVrJSqFYqSi3LLM7MzwNyDHUUlJIzE
 vPSU3UzU4B8JSMDI1MDCwND3cTclPS0ijJLXWMDY1NzcxNLc0PzVCWg8oKi1LTMCrBR0bG1tQB
 WQFkTWgAAAA==
X-Change-ID: 20250801-amdgfxv9-30357749717e
To: Alex Deucher <alexander.deucher@amd.com>, 
 =?utf-8?q?Christian_K=C3=B6nig?= <christian.koenig@amd.com>, 
 David Airlie <airlied@gmail.com>, Simona Vetter <simona@ffwll.ch>
Cc: amd-gfx@lists.freedesktop.org, dri-devel@lists.freedesktop.org, 
 linux-kernel@vger.kernel.org, kernel-janitors@vger.kernel.org, 
 Ethan Carter Edwards <ethan@ethancedwards.com>
X-Developer-Signature: v=1; a=openpgp-sha256; l=1779;
 i=ethan@ethancedwards.com; h=from:subject:message-id;
 bh=wSIMwojZxAeqCqhOtPw3LFtWfkmZDSg728hLzzO3iGg=;
 b=LS0tLS1CRUdJTiBQR1AgTUVTU0FHRS0tLS0tCgpvd0o0bkp2QXk4ekFKWGJEOXFoNThlVGp6e
 GhQcXlVeFpQVG1IaE02TnorNktMRWhRRTZWOXdjRDI2bHVlN1dqCko2YUttSmR6bGJTZlZGQVZL
 TzhvWldFUTQyS1FGVk5rK1oram5QWlFjNGJDenI4dVRUQnpXSmxBaGpCd2NRckEKUk56Zk1melB
 uN0JLc2I3b2hGRkZaMkVvbndGSHd4czNxVFY1U1dKdWdRYnhuMWV0djIzR3lOQ1V1ZVQ1dVYrOQ
 oyMi8xL1RYeXVtUmgwWENJNHhrZjkrbEh6NXowWmZ2dTNPTUVBSXF4U2NFPQo9OHROaAotLS0tL
 UVORCBQR1AgTUVTU0FHRS0tLS0tCg==
X-Developer-Key: i=ethan@ethancedwards.com; a=openpgp;
 fpr=2E51F61839D1FA947A7300C234C04305D581DBFE
X-Rspamd-Queue-Id: 4bv5Hs6L4Bz9srX
X-Mailman-Approved-At: Sat, 02 Aug 2025 08:22:21 +0000
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

The repeated checks on grbm_soft_reset are unnecessary. Remove them.

Signed-off-by: Ethan Carter Edwards <ethan@ethancedwards.com>
---
 drivers/gpu/drm/amd/amdgpu/gfx_v9_0.c | 24 +++++++++++-------------
 1 file changed, 11 insertions(+), 13 deletions(-)

diff --git a/drivers/gpu/drm/amd/amdgpu/gfx_v9_0.c b/drivers/gpu/drm/amd/amdgpu/gfx_v9_0.c
index 6a9cf3587cc6f0a0d00ab1c109fd599dd8aa2579..a6ff9a137a83a93cde0b0c9c9e51db66374bcbee 100644
--- a/drivers/gpu/drm/amd/amdgpu/gfx_v9_0.c
+++ b/drivers/gpu/drm/amd/amdgpu/gfx_v9_0.c
@@ -4175,19 +4175,17 @@ static int gfx_v9_0_soft_reset(struct amdgpu_ip_block *ip_block)
 		/* Disable MEC parsing/prefetching */
 		gfx_v9_0_cp_compute_enable(adev, false);
 
-		if (grbm_soft_reset) {
-			tmp = RREG32_SOC15(GC, 0, mmGRBM_SOFT_RESET);
-			tmp |= grbm_soft_reset;
-			dev_info(adev->dev, "GRBM_SOFT_RESET=0x%08X\n", tmp);
-			WREG32_SOC15(GC, 0, mmGRBM_SOFT_RESET, tmp);
-			tmp = RREG32_SOC15(GC, 0, mmGRBM_SOFT_RESET);
-
-			udelay(50);
-
-			tmp &= ~grbm_soft_reset;
-			WREG32_SOC15(GC, 0, mmGRBM_SOFT_RESET, tmp);
-			tmp = RREG32_SOC15(GC, 0, mmGRBM_SOFT_RESET);
-		}
+		tmp = RREG32_SOC15(GC, 0, mmGRBM_SOFT_RESET);
+		tmp |= grbm_soft_reset;
+		dev_info(adev->dev, "GRBM_SOFT_RESET=0x%08X\n", tmp);
+		WREG32_SOC15(GC, 0, mmGRBM_SOFT_RESET, tmp);
+		tmp = RREG32_SOC15(GC, 0, mmGRBM_SOFT_RESET);
+
+		udelay(50);
+
+		tmp &= ~grbm_soft_reset;
+		WREG32_SOC15(GC, 0, mmGRBM_SOFT_RESET, tmp);
+		tmp = RREG32_SOC15(GC, 0, mmGRBM_SOFT_RESET);
 
 		/* Wait a little for things to settle down */
 		udelay(50);

---
base-commit: b9ddaa95fd283bce7041550ddbbe7e764c477110
change-id: 20250801-amdgfxv9-30357749717e

Best regards,
-- 
Ethan Carter Edwards <ethan@ethancedwards.com>

