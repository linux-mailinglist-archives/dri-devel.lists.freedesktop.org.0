Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 350E2B18B42
	for <lists+dri-devel@lfdr.de>; Sat,  2 Aug 2025 10:22:27 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 53E9C10E0E1;
	Sat,  2 Aug 2025 08:22:22 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=ethancedwards.com header.i=@ethancedwards.com header.b="SGNbONkT";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mout-p-103.mailbox.org (mout-p-103.mailbox.org [80.241.56.161])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 8C19F10E323;
 Sat,  2 Aug 2025 01:51:37 +0000 (UTC)
Received: from smtp102.mailbox.org (smtp102.mailbox.org
 [IPv6:2001:67c:2050:b231:465::102])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
 (No client certificate requested)
 by mout-p-103.mailbox.org (Postfix) with ESMTPS id 4bv5CG2YH0z9sNZ;
 Sat,  2 Aug 2025 03:41:46 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ethancedwards.com;
 s=MBO0001; t=1754098906;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding;
 bh=hC33MpvR7EnAum2rPEi+BrxfSU2s+0/kfdHWysXARnw=;
 b=SGNbONkTIJ3xq0bJkKblq7p6wXInscD86UVia9dEBidHpbsISkPqYLmgQ43YWKOHswxW2r
 2NIY+0WCd8Ufk0J62tYyd4kIROw9a7N1C0jdFx4GOPmYx+I2KXWViXY/QtxrpCug6DbG6n
 XIJyb65POgKRytjYriWfak3aHbkgXHJS/eV09Bnh5MEZeDp/Tbbm9iprGrCBBxt8T4ZTJl
 WSDpcRdC5oOzY/1Faa8vGAoyn64GxYT0PkXTb7ZSzMvEr7MASFTMJKvm9MLuDBOckMihRN
 GXM6HbrQeX/bMoOiITD8dCzMDizRN6xqhFklTcCuPZg6z60+/KgQFgcElKsRAA==
Authentication-Results: outgoing_mbo_mout; dkim=none;
 spf=pass (outgoing_mbo_mout: domain of ethan@ethancedwards.com designates
 2001:67c:2050:b231:465::102 as permitted sender)
 smtp.mailfrom=ethan@ethancedwards.com
From: Ethan Carter Edwards <ethan@ethancedwards.com>
Date: Fri, 01 Aug 2025 21:41:42 -0400
Subject: [PATCH] drm/amdgpu/gfx10: remove redundant repeated null checks
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20250801-amdgfx10-v1-1-e1dcbe18d84e@ethancedwards.com>
X-B4-Tracking: v=1; b=H4sIANVsjWgC/6tWKk4tykwtVrJSqFYqSi3LLM7MzwNyDHUUlJIzE
 vPSU3UzU4B8JSMDI1MDCwND3cTclPS0CkMD3TRLs2QT4+Qkg2RTSyWg8oKi1LTMCrBR0bG1tQA
 mRLYJWgAAAA==
X-Change-ID: 20250801-amdgfx10-f96c43cb0c59
To: Alex Deucher <alexander.deucher@amd.com>, 
 =?utf-8?q?Christian_K=C3=B6nig?= <christian.koenig@amd.com>, 
 David Airlie <airlied@gmail.com>, Simona Vetter <simona@ffwll.ch>
Cc: amd-gfx@lists.freedesktop.org, dri-devel@lists.freedesktop.org, 
 linux-kernel@vger.kernel.org, kernel-janitors@vger.kernel.org, 
 Ethan Carter Edwards <ethan@ethancedwards.com>
X-Developer-Signature: v=1; a=openpgp-sha256; l=1786;
 i=ethan@ethancedwards.com; h=from:subject:message-id;
 bh=tzPbGNY/HtNHNCn/spEV2iQKJagDaRpg4U+Fv4M44/o=;
 b=LS0tLS1CRUdJTiBQR1AgTUVTU0FHRS0tLS0tCgpvd0o0bkp2QXk4ekFKWGJEOXFoNThlVGp6e
 GhQcXlVeFpQVG1YTi8xbXVjcjA3SW0wM2VUL2orcWVkQWtxTDZnCko5bEZZT2sySjY1dXFjT0Zz
 VE02U2xrWXhMZ1laTVVVV2Y3bktLYzkxSnloc1BPdlN4UE1IRllta0NFTVhKd0MKTUpHZ1N3ei9
 5OE1mZnJHTGRYMXkxaTVLYzZYdXlROEJPaHZ1cDcvVWZyNHYzY1ExYk9kZFQ0Yi9vVnRLR2VSdQ
 ptMDh2OHVDUkNwMjhlb1AvbTZSNHNZOU5pNjd2Wm4zR0k5UFBEQUFaUDA0bQo9bHgySQotLS0tL
 UVORCBQR1AgTUVTU0FHRS0tLS0tCg==
X-Developer-Key: i=ethan@ethancedwards.com; a=openpgp;
 fpr=2E51F61839D1FA947A7300C234C04305D581DBFE
X-Rspamd-Queue-Id: 4bv5CG2YH0z9sNZ
X-Mailman-Approved-At: Sat, 02 Aug 2025 08:22:22 +0000
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
 drivers/gpu/drm/amd/amdgpu/gfx_v10_0.c | 24 +++++++++++-------------
 1 file changed, 11 insertions(+), 13 deletions(-)

diff --git a/drivers/gpu/drm/amd/amdgpu/gfx_v10_0.c b/drivers/gpu/drm/amd/amdgpu/gfx_v10_0.c
index 7bd506f06eb155de7f2edb2c1c9d5ed7232b16fc..264183ab24ec299425e6a6d0539339ee69f60c24 100644
--- a/drivers/gpu/drm/amd/amdgpu/gfx_v10_0.c
+++ b/drivers/gpu/drm/amd/amdgpu/gfx_v10_0.c
@@ -7668,19 +7668,17 @@ static int gfx_v10_0_soft_reset(struct amdgpu_ip_block *ip_block)
 		/* Disable MEC parsing/prefetching */
 		gfx_v10_0_cp_compute_enable(adev, false);
 
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
change-id: 20250801-amdgfx10-f96c43cb0c59

Best regards,
-- 
Ethan Carter Edwards <ethan@ethancedwards.com>

