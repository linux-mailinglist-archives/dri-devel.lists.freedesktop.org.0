Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 6B5E8B28B8E
	for <lists+dri-devel@lfdr.de>; Sat, 16 Aug 2025 09:49:22 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id BF2C810E2E3;
	Sat, 16 Aug 2025 07:49:20 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=icenowy.me header.i=uwu@icenowy.me header.b="jUmOF3tp";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from sender4-op-o15.zoho.com (sender4-op-o15.zoho.com
 [136.143.188.15])
 by gabe.freedesktop.org (Postfix) with ESMTPS id DB2F710E2E3;
 Sat, 16 Aug 2025 07:49:19 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; t=1755330551; cv=none; 
 d=zohomail.com; s=zohoarc; 
 b=GGx/y22vt2n1+VvXqcL2yWNISLQy4SswC3PcUorScO2WXW70gvIjkkcb8kSaKdDQIafkgPuRGr+/0gGiNJzSTDqYog+q4VV5Fh3NDjxibz04TKFC+yV3xCD1q+FQ+I5bbOPaqrOG49zq14gmMQGL56ZoE0l9zfBP/YEA9WDq08I=
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=zohomail.com;
 s=zohoarc; t=1755330551;
 h=Content-Transfer-Encoding:Cc:Cc:Date:Date:From:From:In-Reply-To:MIME-Version:Message-ID:References:Subject:Subject:To:To:Message-Id:Reply-To;
 bh=cUbeoz3eH2Lp/NXawnV6Nuu9wKEOZRT4VvJUTFslJ1M=; 
 b=JE6YfCJ4AaU1Dwlvhzd60dYfZzy+C8zMgltuqNXSaanwAkTwnumHETf/QIzxB3j1xvY3ssIOVFbi5yHv1Aw6P6u3o5lYlk8anlTwGoc/v3vRsnsbXnZLtA1yXEmYMjCK9iukawYr1n225tfNiOHzu4hl4Gh1sgEaQ8JB7Y/D3Mg=
ARC-Authentication-Results: i=1; mx.zohomail.com;
 dkim=pass  header.i=icenowy.me;
 spf=pass  smtp.mailfrom=uwu@icenowy.me;
 dmarc=pass header.from=<uwu@icenowy.me>
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; t=1755330551; 
 s=zmail2; d=icenowy.me; i=uwu@icenowy.me;
 h=From:From:To:To:Cc:Cc:Subject:Subject:Date:Date:Message-ID:In-Reply-To:References:MIME-Version:Content-Transfer-Encoding:Message-Id:Reply-To;
 bh=cUbeoz3eH2Lp/NXawnV6Nuu9wKEOZRT4VvJUTFslJ1M=;
 b=jUmOF3tpWt6gG0OC6wxeq1XDIjFVEXlKRh3WkQCtROEYE4OJRzhrgRmBQ9RS7hrv
 Bwrzmv/CfFWEkfgZhfnt5pUMQb1l1eVEiQEwU/q3vfiSfXMbxxrIskYN/HX7NsFGouY
 z6Jm8m2OqtHSX3SS2biCDxFynVBSPGyN2BSleC6rwMi6JR1tQdppG9fLq19CgP4VbDN
 HYnOooly7hRmXUdvxN7DJg9Ljiz77t2shehAFugY5xf8jgXQEmWsiDdC3RRH7U4rWp7
 i9y8UCgCnn9I9vS4TvzA1e5fttjypXdYfvmZaaNQzusw7tbK1MgdnqzeKhv8K7jr9/C
 evok/aeJTQ==
Received: by mx.zohomail.com with SMTPS id 1755330548740860.1574521157502;
 Sat, 16 Aug 2025 00:49:08 -0700 (PDT)
From: Icenowy Zheng <uwu@icenowy.me>
To: Drew Fustini <fustini@kernel.org>, Guo Ren <guoren@kernel.org>,
 Fu Wei <wefu@redhat.com>, Lucas Stach <l.stach@pengutronix.de>,
 Russell King <linux+etnaviv@armlinux.org.uk>,
 Christian Gmeiner <christian.gmeiner@gmail.com>,
 David Airlie <airlied@gmail.com>, Simona Vetter <simona@ffwll.ch>
Cc: linux-riscv@lists.infradead.org, linux-kernel@vger.kernel.org,
 etnaviv@lists.freedesktop.org, dri-devel@lists.freedesktop.org,
 Icenowy Zheng <uwu@icenowy.me>
Subject: [PATCH 3/7] drm/etnaviv: setup DEC400EX on GC620 r5552
Date: Sat, 16 Aug 2025 15:47:53 +0800
Message-ID: <20250816074757.2559055-4-uwu@icenowy.me>
X-Mailer: git-send-email 2.50.1
In-Reply-To: <20250816074757.2559055-1-uwu@icenowy.me>
References: <20250816074757.2559055-1-uwu@icenowy.me>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-ZohoMailClient: External
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

The GC620 r5552 GPU found on T-Head TH1520 features (and requires) a
DEC400EX buffer compressor that needs to be set up. In addition, some
quirk exist for the DEC400 part that needs to be handled during GPU
reset, otherwise the reset will not happen.

Set the DEC400EX up and add the quirk code to the GPU reset codepath.

Currently the DEC400EX setup is gated by this specific GPU identity,
however in future we should add a feature flag for it.

Signed-off-by: Icenowy Zheng <uwu@icenowy.me>
---
 drivers/gpu/drm/etnaviv/etnaviv_gpu.c | 13 +++++++++++++
 1 file changed, 13 insertions(+)

diff --git a/drivers/gpu/drm/etnaviv/etnaviv_gpu.c b/drivers/gpu/drm/etnaviv/etnaviv_gpu.c
index 7431e180b3ae4..a8d4394c8f637 100644
--- a/drivers/gpu/drm/etnaviv/etnaviv_gpu.c
+++ b/drivers/gpu/drm/etnaviv/etnaviv_gpu.c
@@ -559,6 +559,10 @@ static int etnaviv_hw_reset(struct etnaviv_gpu *gpu)
 		control |= VIVS_HI_CLOCK_CONTROL_ISOLATE_GPU;
 		gpu_write(gpu, VIVS_HI_CLOCK_CONTROL, control);
 
+		if (etnaviv_is_model_rev(gpu, 0x620, 0x5552)) {
+			gpu_write(gpu, VIVS_DEC400EX_UNK00800, 0x10);
+		}
+
 		if (gpu->identity.minor_features7 & chipMinorFeatures7_BIT_SECURITY) {
 			gpu_write(gpu, VIVS_MMUv2_AHB_CONTROL,
 			          VIVS_MMUv2_AHB_CONTROL_RESET);
@@ -797,6 +801,15 @@ static void etnaviv_gpu_hw_init(struct etnaviv_gpu *gpu)
 		gpu_write(gpu, VIVS_MC_BUS_CONFIG, bus_config);
 	}
 
+	/*
+	 * FIXME: Required by GC620 r5552 as a bug workaround, but might be
+	 * useful on other GPUs with G2D_DEC400EX feature too.
+	 */
+	if (etnaviv_is_model_rev(gpu, 0x620, 0x5552)) {
+		gpu_write(gpu, VIVS_DEC400EX_UNK00800, 0x2010188);
+		gpu_write(gpu, VIVS_DEC400EX_UNK00808, 0x3fc104);
+	}
+
 	if (gpu->identity.minor_features7 & chipMinorFeatures7_BIT_SECURITY) {
 		u32 val = gpu_read(gpu, VIVS_MMUv2_AHB_CONTROL);
 		val |= VIVS_MMUv2_AHB_CONTROL_NONSEC_ACCESS;
-- 
2.50.1

