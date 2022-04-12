Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 260864FD293
	for <lists+dri-devel@lfdr.de>; Tue, 12 Apr 2022 09:21:21 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id CA8DC10FBE8;
	Tue, 12 Apr 2022 07:21:18 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from ams.source.kernel.org (ams.source.kernel.org [145.40.68.75])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 6A8FB10FBDC;
 Tue, 12 Apr 2022 07:21:17 +0000 (UTC)
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by ams.source.kernel.org (Postfix) with ESMTPS id 0EA9EB81B4F;
 Tue, 12 Apr 2022 07:21:16 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 5A239C385A1;
 Tue, 12 Apr 2022 07:21:14 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=linuxfoundation.org;
 s=korg; t=1649748074;
 bh=qVZQZO1froVUTZ6TwlksDchw3cHLrw0uS/UZVNIs+5k=;
 h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
 b=WYOlBrW5XwLS6TEGR6KFD4gikTUrVl10RnYBY8RheGegig0AQGXqDjHuz7ho3xH/S
 JCtv/XAA4opxP5/LaPNsSPcxG1Tv7KF0Tq0SRzZ7xoveOrjW21S9FCYMCbt84ilTim
 RPyPo0m5HcUM/mFP4QJl897aI4JcRU7z+Zg/OTuA=
From: Greg Kroah-Hartman <gregkh@linuxfoundation.org>
To: linux-kernel@vger.kernel.org
Subject: [PATCH 5.17 309/343] drm/nouveau/pmu: Add missing callbacks for Tegra
 devices
Date: Tue, 12 Apr 2022 08:32:07 +0200
Message-Id: <20220412063000.240457912@linuxfoundation.org>
X-Mailer: git-send-email 2.35.1
In-Reply-To: <20220412062951.095765152@linuxfoundation.org>
References: <20220412062951.095765152@linuxfoundation.org>
User-Agent: quilt/0.66
MIME-Version: 1.0
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
Cc: Karol Herbst <kherbst@redhat.com>,
 Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
 dri-devel@lists.freedesktop.org, Ben Skeggs <bskeggs@redhat.com>,
 nouveau@lists.freedesktop.org, stable@vger.kernel.org
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

From: Karol Herbst <kherbst@redhat.com>

commit 38d4e5cf5b08798f093374e53c2f4609d5382dd5 upstream.

Fixes a crash booting on those platforms with nouveau.

Fixes: 4cdd2450bf73 ("drm/nouveau/pmu/gm200-: use alternate falcon reset sequence")
Cc: Ben Skeggs <bskeggs@redhat.com>
Cc: Karol Herbst <kherbst@redhat.com>
Cc: dri-devel@lists.freedesktop.org
Cc: nouveau@lists.freedesktop.org
Cc: <stable@vger.kernel.org> # v5.17+
Signed-off-by: Karol Herbst <kherbst@redhat.com>
Reviewed-by: Lyude Paul <lyude@redhat.com>
Link: https://patchwork.freedesktop.org/patch/msgid/20220322124800.2605463-1-kherbst@redhat.com
Signed-off-by: Greg Kroah-Hartman <gregkh@linuxfoundation.org>
---
 drivers/gpu/drm/nouveau/nvkm/subdev/pmu/gm20b.c |    1 +
 drivers/gpu/drm/nouveau/nvkm/subdev/pmu/gp102.c |    2 +-
 drivers/gpu/drm/nouveau/nvkm/subdev/pmu/gp10b.c |    1 +
 drivers/gpu/drm/nouveau/nvkm/subdev/pmu/priv.h  |    1 +
 4 files changed, 4 insertions(+), 1 deletion(-)

--- a/drivers/gpu/drm/nouveau/nvkm/subdev/pmu/gm20b.c
+++ b/drivers/gpu/drm/nouveau/nvkm/subdev/pmu/gm20b.c
@@ -216,6 +216,7 @@ gm20b_pmu = {
 	.intr = gt215_pmu_intr,
 	.recv = gm20b_pmu_recv,
 	.initmsg = gm20b_pmu_initmsg,
+	.reset = gf100_pmu_reset,
 };
 
 #if IS_ENABLED(CONFIG_ARCH_TEGRA_210_SOC)
--- a/drivers/gpu/drm/nouveau/nvkm/subdev/pmu/gp102.c
+++ b/drivers/gpu/drm/nouveau/nvkm/subdev/pmu/gp102.c
@@ -23,7 +23,7 @@
  */
 #include "priv.h"
 
-static void
+void
 gp102_pmu_reset(struct nvkm_pmu *pmu)
 {
 	struct nvkm_device *device = pmu->subdev.device;
--- a/drivers/gpu/drm/nouveau/nvkm/subdev/pmu/gp10b.c
+++ b/drivers/gpu/drm/nouveau/nvkm/subdev/pmu/gp10b.c
@@ -83,6 +83,7 @@ gp10b_pmu = {
 	.intr = gt215_pmu_intr,
 	.recv = gm20b_pmu_recv,
 	.initmsg = gm20b_pmu_initmsg,
+	.reset = gp102_pmu_reset,
 };
 
 #if IS_ENABLED(CONFIG_ARCH_TEGRA_210_SOC)
--- a/drivers/gpu/drm/nouveau/nvkm/subdev/pmu/priv.h
+++ b/drivers/gpu/drm/nouveau/nvkm/subdev/pmu/priv.h
@@ -41,6 +41,7 @@ int gt215_pmu_send(struct nvkm_pmu *, u3
 
 bool gf100_pmu_enabled(struct nvkm_pmu *);
 void gf100_pmu_reset(struct nvkm_pmu *);
+void gp102_pmu_reset(struct nvkm_pmu *pmu);
 
 void gk110_pmu_pgob(struct nvkm_pmu *, bool);
 


