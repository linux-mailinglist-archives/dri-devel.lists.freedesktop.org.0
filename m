Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 8D55BB18B43
	for <lists+dri-devel@lfdr.de>; Sat,  2 Aug 2025 10:22:29 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id A713B10E101;
	Sat,  2 Aug 2025 08:22:22 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=ethancedwards.com header.i=@ethancedwards.com header.b="2BUzz0mP";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mout-p-201.mailbox.org (mout-p-201.mailbox.org [80.241.56.171])
 by gabe.freedesktop.org (Postfix) with ESMTPS id DE42710E07E;
 Sat,  2 Aug 2025 01:48:09 +0000 (UTC)
Received: from smtp1.mailbox.org (smtp1.mailbox.org [10.196.197.1])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
 (No client certificate requested)
 by mout-p-201.mailbox.org (Postfix) with ESMTPS id 4bv57K4DLnz9sjY;
 Sat,  2 Aug 2025 03:38:21 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ethancedwards.com;
 s=MBO0001; t=1754098701;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding;
 bh=rfkrPveYvBWrUoTk+3x/Gm8/fAfhVxdSxnNmYta/3AU=;
 b=2BUzz0mPfFRiv93fjREkLONE/LzphDg6i7cdTQJ1TfqY5dBgTlidYiCn0RUwkI9PKiJXSi
 0yLtcy/IiblkuDSV3H8HiAcbQQGYv5eaiBkTdTQ/Ha+351EuUs0xgMzYJMunWAlSaCRr8O
 sRMzt7yGtAaBOIfcbu0JEBcLoNNtyE2BV+h0kmCLdUmyXzBYAIr6Ym8BwyRFOUfcEk86Gv
 EYh7HVmKUyBfNpc+kwV4wVf6gT3cYZeLetcQpX81EBS9toAOzSOAqrcH/f03+rdyqlWhjh
 OlH/WWf+djA0dkZpY6gvk4o6W0oIbMjap8sRtc1j9ROrc8ULXue9TfAn6KE1lg==
From: Ethan Carter Edwards <ethan@ethancedwards.com>
Date: Fri, 01 Aug 2025 21:38:16 -0400
Subject: [PATCH] drm/amdgpu/gfx9.4.3: remove redundant repeated null checks
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20250801-uartlite-redundant-v1-1-6141b97a3c7f@ethancedwards.com>
X-B4-Tracking: v=1; b=H4sIAAdsjWgC/x3MTQqAIBBA4avErBMsyqSrRAt/xhoIi9EiiO6et
 PwW7z2QkAkTjNUDjBcl2mNBU1fgVhMXFOSLoZVtL7VsxGk4b5RRMPozehOzcJ2zKujBWqWhhAd
 joPufTvP7fpSTyuRkAAAA
X-Change-ID: 20250801-uartlite-redundant-c4cb6f87bb68
To: Alex Deucher <alexander.deucher@amd.com>, 
 =?utf-8?q?Christian_K=C3=B6nig?= <christian.koenig@amd.com>, 
 David Airlie <airlied@gmail.com>, Simona Vetter <simona@ffwll.ch>
Cc: amd-gfx@lists.freedesktop.org, dri-devel@lists.freedesktop.org, 
 linux-kernel@vger.kernel.org, kernel-janitors@vger.kernel.org, 
 Ethan Carter Edwards <ethan@ethancedwards.com>
X-Developer-Signature: v=1; a=openpgp-sha256; l=1960;
 i=ethan@ethancedwards.com; h=from:subject:message-id;
 bh=xDkwf/R7sAObhLKaY0pjx6MvG2RHtOr1vU7eBDGzsac=;
 b=LS0tLS1CRUdJTiBQR1AgTUVTU0FHRS0tLS0tCgpvd0o0bkp2QXk4ekFKWGJEOXFoNThlVGp6e
 GhQcXlVeFpQVG1jQmpWU2Mydlh2ajdoaFpIbTRVZTc4Nm02d2ZtClhxMTg4RnRsM3pSbW9kUHRY
 dVVkcFN3TVlsd01zbUtLTFA5emxOTWVhczVRMlBuWHBRbG1EaXNUeUJBR0xrNEIKbU1pL013ei9
 2VUl1bUI1Y0ZtWEx3N2EyemtIajR2TFpsL2VWNXoxZy91ZitnaXM3K09kZkpVYUdiU3lOemFvYw
 pCb3JiZ3hPRDUvTHNNZm44UXJBdjIreFIwTVBzYTg4WUhzcHhBd0R3cmt0QQo9VTJpcAotLS0tL
 UVORCBQR1AgTUVTU0FHRS0tLS0tCg==
X-Developer-Key: i=ethan@ethancedwards.com; a=openpgp;
 fpr=2E51F61839D1FA947A7300C234C04305D581DBFE
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
 drivers/gpu/drm/amd/amdgpu/gfx_v9_4_3.c | 24 +++++++++++-------------
 1 file changed, 11 insertions(+), 13 deletions(-)

diff --git a/drivers/gpu/drm/amd/amdgpu/gfx_v9_4_3.c b/drivers/gpu/drm/amd/amdgpu/gfx_v9_4_3.c
index 51babf5c78c86c20ef806e31e9d0a4185ffda5b8..8ba66d4dfe86e96073f63e259177ca0ca2416a6d 100644
--- a/drivers/gpu/drm/amd/amdgpu/gfx_v9_4_3.c
+++ b/drivers/gpu/drm/amd/amdgpu/gfx_v9_4_3.c
@@ -2461,19 +2461,17 @@ static int gfx_v9_4_3_soft_reset(struct amdgpu_ip_block *ip_block)
 		/* Disable MEC parsing/prefetching */
 		gfx_v9_4_3_xcc_cp_compute_enable(adev, false, 0);
 
-		if (grbm_soft_reset) {
-			tmp = RREG32_SOC15(GC, GET_INST(GC, 0), regGRBM_SOFT_RESET);
-			tmp |= grbm_soft_reset;
-			dev_info(adev->dev, "GRBM_SOFT_RESET=0x%08X\n", tmp);
-			WREG32_SOC15(GC, GET_INST(GC, 0), regGRBM_SOFT_RESET, tmp);
-			tmp = RREG32_SOC15(GC, GET_INST(GC, 0), regGRBM_SOFT_RESET);
-
-			udelay(50);
-
-			tmp &= ~grbm_soft_reset;
-			WREG32_SOC15(GC, GET_INST(GC, 0), regGRBM_SOFT_RESET, tmp);
-			tmp = RREG32_SOC15(GC, GET_INST(GC, 0), regGRBM_SOFT_RESET);
-		}
+		tmp = RREG32_SOC15(GC, GET_INST(GC, 0), regGRBM_SOFT_RESET);
+		tmp |= grbm_soft_reset;
+		dev_info(adev->dev, "GRBM_SOFT_RESET=0x%08X\n", tmp);
+		WREG32_SOC15(GC, GET_INST(GC, 0), regGRBM_SOFT_RESET, tmp);
+		tmp = RREG32_SOC15(GC, GET_INST(GC, 0), regGRBM_SOFT_RESET);
+
+		udelay(50);
+
+		tmp &= ~grbm_soft_reset;
+		WREG32_SOC15(GC, GET_INST(GC, 0), regGRBM_SOFT_RESET, tmp);
+		tmp = RREG32_SOC15(GC, GET_INST(GC, 0), regGRBM_SOFT_RESET);
 
 		/* Wait a little for things to settle down */
 		udelay(50);

---
base-commit: b9ddaa95fd283bce7041550ddbbe7e764c477110
change-id: 20250801-uartlite-redundant-c4cb6f87bb68

Best regards,
-- 
Ethan Carter Edwards <ethan@ethancedwards.com>

