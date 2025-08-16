Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 290D2B28B88
	for <lists+dri-devel@lfdr.de>; Sat, 16 Aug 2025 09:49:07 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 8B39C10E2DF;
	Sat, 16 Aug 2025 07:49:05 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=icenowy.me header.i=uwu@icenowy.me header.b="lL0bvAeD";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from sender4-op-o15.zoho.com (sender4-op-o15.zoho.com
 [136.143.188.15])
 by gabe.freedesktop.org (Postfix) with ESMTPS id E065A10E2DF;
 Sat, 16 Aug 2025 07:49:04 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; t=1755330537; cv=none; 
 d=zohomail.com; s=zohoarc; 
 b=QrGGBxLbY7j0af7Z/MtfX8YwtrA4ZAbdmEkt7Lh9BpooB/rk1Bqyf1c7/UKu6SYYyBNxJjLm+FBLftOASEYSUENqIofa9tLPw4JGdTmDkDtAxsEZsfc7FuwFfibov8Prs4mSIz4JGO7hAhLhLT7BtxlzZ7rrAj/bTHx/Zlj7nVc=
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=zohomail.com;
 s=zohoarc; t=1755330537;
 h=Content-Transfer-Encoding:Cc:Cc:Date:Date:From:From:In-Reply-To:MIME-Version:Message-ID:References:Subject:Subject:To:To:Message-Id:Reply-To;
 bh=e7Ngx6Rt/JpIvo0R+kAwIonCUQ/vaWPqz6Ke56ZQkT4=; 
 b=PY/0ctaNQ30JiKmPvDZmdLQBayxyYpFuxB08IMAHspmnH+JCxYotVeicwV2EVnsi0cZlu0rXRD/RlZ7PnGeflqYRen289qwC9bQCRWMjldp53g8kXgJY5W4i8GHtkDSjp9pDfY7eWrWZ0P9o4oWqCW0OGgcjiLkQWjDDUstp1Ok=
ARC-Authentication-Results: i=1; mx.zohomail.com;
 dkim=pass  header.i=icenowy.me;
 spf=pass  smtp.mailfrom=uwu@icenowy.me;
 dmarc=pass header.from=<uwu@icenowy.me>
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; t=1755330537; 
 s=zmail2; d=icenowy.me; i=uwu@icenowy.me;
 h=From:From:To:To:Cc:Cc:Subject:Subject:Date:Date:Message-ID:In-Reply-To:References:MIME-Version:Content-Transfer-Encoding:Message-Id:Reply-To;
 bh=e7Ngx6Rt/JpIvo0R+kAwIonCUQ/vaWPqz6Ke56ZQkT4=;
 b=lL0bvAeDZfX7fEYqdGfkrtBSvD2+IDHQLz0TwEMaQhSQRQE1+zOG2LL2Lvf9+fQ3
 xK5xF+z9vIPyPsCb/2+kJBKormNUcWmP6mxE9ETl12k6dNFqJA9fhhEQEhib0a+0BU3
 N4FVkZcfpEmD/Id3iFDYKPBac+u9y5mj4c5Uv7h+U7pWOyNP5Uq3CLbgSLpUkGtHg5c
 U7zVSKk5HKYHk23cg+gUqUuvNmXxLIAeRE3oKhwR6zCkcB1dhk16R3hJpQ9c4KyN7uN
 JCMaf0wqt1U1y2jM0wzrIzAQhnqk1AaEKZEQgPNwMdHTcqn0NaOPKvPluS+g8o/a7V4
 p4RUkXSdEA==
Received: by mx.zohomail.com with SMTPS id 1755330536462939.8814640628641;
 Sat, 16 Aug 2025 00:48:56 -0700 (PDT)
From: Icenowy Zheng <uwu@icenowy.me>
To: Drew Fustini <fustini@kernel.org>, Guo Ren <guoren@kernel.org>,
 Fu Wei <wefu@redhat.com>, Lucas Stach <l.stach@pengutronix.de>,
 Russell King <linux+etnaviv@armlinux.org.uk>,
 Christian Gmeiner <christian.gmeiner@gmail.com>,
 David Airlie <airlied@gmail.com>, Simona Vetter <simona@ffwll.ch>
Cc: linux-riscv@lists.infradead.org, linux-kernel@vger.kernel.org,
 etnaviv@lists.freedesktop.org, dri-devel@lists.freedesktop.org,
 Icenowy Zheng <uwu@icenowy.me>
Subject: [PATCH 2/7] drm/etnaviv: add handle for GPUs with only SECURITY_AHB
 flag
Date: Sat, 16 Aug 2025 15:47:52 +0800
Message-ID: <20250816074757.2559055-3-uwu@icenowy.me>
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

In the GC620 on T-Head TH1520 SoC, the SECURITY feature flag isn't set
but the SECURITY_AHB feature flag is set.

In this situation, the VIVS_MMUv2_AHB_CONTROL register isn't available,
but the GPU otherwise behave like secure ones and require commands to
load PTA.

The 6.4.6.9.354872 driver from T-Head asserts SECURITY_AHB feature flag
is set when SECURITY one is set, so it could be assumed that the
situation that only SECURITY is set do not exist.

Signed-off-by: Icenowy Zheng <uwu@icenowy.me>
---
 drivers/gpu/drm/etnaviv/etnaviv_gpu.c | 6 +++---
 1 file changed, 3 insertions(+), 3 deletions(-)

diff --git a/drivers/gpu/drm/etnaviv/etnaviv_gpu.c b/drivers/gpu/drm/etnaviv/etnaviv_gpu.c
index cf0d9049bcf1e..7431e180b3ae4 100644
--- a/drivers/gpu/drm/etnaviv/etnaviv_gpu.c
+++ b/drivers/gpu/drm/etnaviv/etnaviv_gpu.c
@@ -559,7 +559,7 @@ static int etnaviv_hw_reset(struct etnaviv_gpu *gpu)
 		control |= VIVS_HI_CLOCK_CONTROL_ISOLATE_GPU;
 		gpu_write(gpu, VIVS_HI_CLOCK_CONTROL, control);
 
-		if (gpu->sec_mode == ETNA_SEC_KERNEL) {
+		if (gpu->identity.minor_features7 & chipMinorFeatures7_BIT_SECURITY) {
 			gpu_write(gpu, VIVS_MMUv2_AHB_CONTROL,
 			          VIVS_MMUv2_AHB_CONTROL_RESET);
 		} else {
@@ -797,7 +797,7 @@ static void etnaviv_gpu_hw_init(struct etnaviv_gpu *gpu)
 		gpu_write(gpu, VIVS_MC_BUS_CONFIG, bus_config);
 	}
 
-	if (gpu->sec_mode == ETNA_SEC_KERNEL) {
+	if (gpu->identity.minor_features7 & chipMinorFeatures7_BIT_SECURITY) {
 		u32 val = gpu_read(gpu, VIVS_MMUv2_AHB_CONTROL);
 		val |= VIVS_MMUv2_AHB_CONTROL_NONSEC_ACCESS;
 		gpu_write(gpu, VIVS_MMUv2_AHB_CONTROL, val);
@@ -853,7 +853,7 @@ int etnaviv_gpu_init(struct etnaviv_gpu *gpu)
 	 * On cores with security features supported, we claim control over the
 	 * security states.
 	 */
-	if ((gpu->identity.minor_features7 & chipMinorFeatures7_BIT_SECURITY) &&
+	if ((gpu->identity.minor_features7 & chipMinorFeatures7_BIT_SECURITY) ||
 	    (gpu->identity.minor_features10 & chipMinorFeatures10_SECURITY_AHB))
 		gpu->sec_mode = ETNA_SEC_KERNEL;
 
-- 
2.50.1

