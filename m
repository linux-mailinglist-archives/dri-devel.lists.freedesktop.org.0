Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 419253F54C1
	for <lists+dri-devel@lfdr.de>; Tue, 24 Aug 2021 02:55:55 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 14F4B89F19;
	Tue, 24 Aug 2021 00:55:32 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 881DB89E5F;
 Tue, 24 Aug 2021 00:55:24 +0000 (UTC)
Received: by mail.kernel.org (Postfix) with ESMTPSA id 8E6ED61506;
 Tue, 24 Aug 2021 00:55:23 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=k20201202; t=1629766524;
 bh=VrsQIPaHzdglb66XduYrB24NyHPFMRYRLea94YBVTMA=;
 h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
 b=sOx7mJLTBUyld6S0IvFkbCUieDiabPBScS3z31ogFz6k8rgCPSiktzf/PW1F0s2Vx
 AZOsn8qnpEfAXtoT/w9ZPf6UJr8pp9+ASGVKPbWB4cgedNOKeaj05B8rHr0domQmX+
 I+v0n6IvAXLqjluxV+qMYJraa8A5uqyf3arPwZKyTTCoTtE65WavwQveuIbd+Thj8j
 fxMdbR954OKKi9In4SKmsdOs6A3/GS3MEirfl1mak3tRpMs4MqDpmzbZv7FXCZeuHi
 ZBMr1q3CR/DkGYOrwrTN9e+rzPs/gsnjk2ITOW7IHAKh/8CalV6yZCqPcOPLNPJnvQ
 b7ETvHJ99liRw==
From: Sasha Levin <sashal@kernel.org>
To: linux-kernel@vger.kernel.org,
	stable@vger.kernel.org
Cc: Ben Skeggs <bskeggs@redhat.com>, Lyude Paul <lyude@redhat.com>,
 Sasha Levin <sashal@kernel.org>, dri-devel@lists.freedesktop.org,
 nouveau@lists.freedesktop.org
Subject: [PATCH AUTOSEL 4.19 08/10] drm/nouveau/disp: power down unused DP
 links during init
Date: Mon, 23 Aug 2021 20:55:10 -0400
Message-Id: <20210824005513.631557-8-sashal@kernel.org>
X-Mailer: git-send-email 2.30.2
In-Reply-To: <20210824005513.631557-1-sashal@kernel.org>
References: <20210824005513.631557-1-sashal@kernel.org>
MIME-Version: 1.0
X-stable: review
X-Patchwork-Hint: Ignore
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

From: Ben Skeggs <bskeggs@redhat.com>

[ Upstream commit 6eaa1f3c59a707332e921e32782ffcad49915c5e ]

When booted with multiple displays attached, the EFI GOP driver on (at
least) Ampere, can leave DP links powered up that aren't being used to
display anything.  This confuses our tracking of SOR routing, with the
likely result being a failed modeset and display engine hang.

Fix this by (ab?)using the DisableLT IED script to power-down the link,
restoring HW to a state the driver expects.

Signed-off-by: Ben Skeggs <bskeggs@redhat.com>
Reviewed-by: Lyude Paul <lyude@redhat.com>
Signed-off-by: Sasha Levin <sashal@kernel.org>
---
 drivers/gpu/drm/nouveau/nvkm/engine/disp/dp.c   | 2 +-
 drivers/gpu/drm/nouveau/nvkm/engine/disp/dp.h   | 1 +
 drivers/gpu/drm/nouveau/nvkm/engine/disp/outp.c | 9 +++++++++
 3 files changed, 11 insertions(+), 1 deletion(-)

diff --git a/drivers/gpu/drm/nouveau/nvkm/engine/disp/dp.c b/drivers/gpu/drm/nouveau/nvkm/engine/disp/dp.c
index 818d21bd28d3..1d2837c5a8f2 100644
--- a/drivers/gpu/drm/nouveau/nvkm/engine/disp/dp.c
+++ b/drivers/gpu/drm/nouveau/nvkm/engine/disp/dp.c
@@ -419,7 +419,7 @@ nvkm_dp_train(struct nvkm_dp *dp, u32 dataKBps)
 	return ret;
 }
 
-static void
+void
 nvkm_dp_disable(struct nvkm_outp *outp, struct nvkm_ior *ior)
 {
 	struct nvkm_dp *dp = nvkm_dp(outp);
diff --git a/drivers/gpu/drm/nouveau/nvkm/engine/disp/dp.h b/drivers/gpu/drm/nouveau/nvkm/engine/disp/dp.h
index 495f665a0ee6..12d6ff4cfa95 100644
--- a/drivers/gpu/drm/nouveau/nvkm/engine/disp/dp.h
+++ b/drivers/gpu/drm/nouveau/nvkm/engine/disp/dp.h
@@ -32,6 +32,7 @@ struct nvkm_dp {
 
 int nvkm_dp_new(struct nvkm_disp *, int index, struct dcb_output *,
 		struct nvkm_outp **);
+void nvkm_dp_disable(struct nvkm_outp *, struct nvkm_ior *);
 
 /* DPCD Receiver Capabilities */
 #define DPCD_RC00_DPCD_REV                                              0x00000
diff --git a/drivers/gpu/drm/nouveau/nvkm/engine/disp/outp.c b/drivers/gpu/drm/nouveau/nvkm/engine/disp/outp.c
index c62030c96fba..4b1c72fd8f03 100644
--- a/drivers/gpu/drm/nouveau/nvkm/engine/disp/outp.c
+++ b/drivers/gpu/drm/nouveau/nvkm/engine/disp/outp.c
@@ -22,6 +22,7 @@
  * Authors: Ben Skeggs
  */
 #include "outp.h"
+#include "dp.h"
 #include "ior.h"
 
 #include <subdev/bios.h>
@@ -216,6 +217,14 @@ nvkm_outp_init_route(struct nvkm_outp *outp)
 	if (!ior->arm.head || ior->arm.proto != proto) {
 		OUTP_DBG(outp, "no heads (%x %d %d)", ior->arm.head,
 			 ior->arm.proto, proto);
+
+		/* The EFI GOP driver on Ampere can leave unused DP links routed,
+		 * which we don't expect.  The DisableLT IED script *should* get
+		 * us back to where we need to be.
+		 */
+		if (ior->func->route.get && !ior->arm.head && outp->info.type == DCB_OUTPUT_DP)
+			nvkm_dp_disable(outp, ior);
+
 		return;
 	}
 
-- 
2.30.2

