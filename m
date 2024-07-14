Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 851EF9308DF
	for <lists+dri-devel@lfdr.de>; Sun, 14 Jul 2024 09:37:41 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 360EA10E095;
	Sun, 14 Jul 2024 07:37:38 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=wanadoo.fr header.i=@wanadoo.fr header.b="AXRo7NO+";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from smtp.smtpout.orange.fr (smtp-13.smtpout.orange.fr
 [80.12.242.13])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 5EA5010E095
 for <dri-devel@lists.freedesktop.org>; Sun, 14 Jul 2024 07:37:36 +0000 (UTC)
Received: from fedora.home ([90.11.132.44]) by smtp.orange.fr with ESMTPA
 id StnYsEflQwxoIStnYs4c19; Sun, 14 Jul 2024 09:37:34 +0200
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=wanadoo.fr;
 s=t20230301; t=1720942654;
 bh=JiF6rlqsmKD1wAOp9hDzYCiLWPlf9kUDYQw53qiLvCc=;
 h=From:To:Subject:Date:Message-ID:MIME-Version;
 b=AXRo7NO+P0TMlGtigGCaWrJERsqN5Bf7rwQAflRz7/nSk8X/PkTiZNjlYXZBh91Bv
 jpT1TyRE5U/s7tpIE5H62zQzEQhcdy3htE/keeZEQVgbceWylPmJwWho9DbuuniB3O
 MsaDSfc+d46qs+srFaJO8pLwxYJcgr0hZjjIh5pgfitK/xRIeW4Q0RhhNHf1sDe7vm
 ZlR50ahvaof+exNxkgGbcU0wTaV5HUfs9G94hkQ9gh0E11/c+LKeYvTnTGKgIDA2XP
 NZHp/IdqMDNWnU+XbBUMnX0qfpH3Vj89RzusRSQ7W/wNaLaiUzCSha56/UhkUNYXVs
 gwutLJ8PyeTSA==
X-ME-Helo: fedora.home
X-ME-Auth: Y2hyaXN0b3BoZS5qYWlsbGV0QHdhbmFkb28uZnI=
X-ME-Date: Sun, 14 Jul 2024 09:37:34 +0200
X-ME-IP: 90.11.132.44
From: Christophe JAILLET <christophe.jaillet@wanadoo.fr>
To: Inki Dae <inki.dae@samsung.com>, Seung-Woo Kim <sw0312.kim@samsung.com>,
 Kyungmin Park <kyungmin.park@samsung.com>,
 David Airlie <airlied@gmail.com>, Daniel Vetter <daniel@ffwll.ch>,
 Krzysztof Kozlowski <krzk@kernel.org>,
 Alim Akhtar <alim.akhtar@samsung.com>
Cc: linux-kernel@vger.kernel.org, kernel-janitors@vger.kernel.org,
 Christophe JAILLET <christophe.jaillet@wanadoo.fr>,
 dri-devel@lists.freedesktop.org, linux-arm-kernel@lists.infradead.org,
 linux-samsung-soc@vger.kernel.org
Subject: [PATCH] drm/exynos: Constify struct exynos_drm_ipp_funcs
Date: Sun, 14 Jul 2024 09:37:20 +0200
Message-ID: <7c4a1ca4525a1d1429c9f16ccfc6d8bf80fc2b63.1720942618.git.christophe.jaillet@wanadoo.fr>
X-Mailer: git-send-email 2.45.2
MIME-Version: 1.0
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

'struct exynos_drm_ipp_funcs' are not modified in these drivers.

Constifying this structure moves some data to a read-only section, so
increase overall security.

On a x86_64, with allmodconfig, as an example:
Before:
======
   text	   data	    bss	    dec	    hex	filename
  20446	   1746	     16	  22208	   56c0	drivers/gpu/drm/exynos/exynos_drm_fimc.o

After:
=====
   text	   data	    bss	    dec	    hex	filename
  20446	   1714	     16	  22176	   56a0	drivers/gpu/drm/exynos/exynos_drm_fimc.o

Signed-off-by: Christophe JAILLET <christophe.jaillet@wanadoo.fr>
---
Compile tested-only.
---
 drivers/gpu/drm/exynos/exynos_drm_fimc.c   | 2 +-
 drivers/gpu/drm/exynos/exynos_drm_gsc.c    | 2 +-
 drivers/gpu/drm/exynos/exynos_drm_scaler.c | 2 +-
 3 files changed, 3 insertions(+), 3 deletions(-)

diff --git a/drivers/gpu/drm/exynos/exynos_drm_fimc.c b/drivers/gpu/drm/exynos/exynos_drm_fimc.c
index 142184c8c3bc..4d7ea65b7dd8 100644
--- a/drivers/gpu/drm/exynos/exynos_drm_fimc.c
+++ b/drivers/gpu/drm/exynos/exynos_drm_fimc.c
@@ -1125,7 +1125,7 @@ static void fimc_abort(struct exynos_drm_ipp *ipp,
 	}
 }
 
-static struct exynos_drm_ipp_funcs ipp_funcs = {
+static const struct exynos_drm_ipp_funcs ipp_funcs = {
 	.commit = fimc_commit,
 	.abort = fimc_abort,
 };
diff --git a/drivers/gpu/drm/exynos/exynos_drm_gsc.c b/drivers/gpu/drm/exynos/exynos_drm_gsc.c
index 1b111e2c3347..d80b0d1eb734 100644
--- a/drivers/gpu/drm/exynos/exynos_drm_gsc.c
+++ b/drivers/gpu/drm/exynos/exynos_drm_gsc.c
@@ -1162,7 +1162,7 @@ static void gsc_abort(struct exynos_drm_ipp *ipp,
 	}
 }
 
-static struct exynos_drm_ipp_funcs ipp_funcs = {
+static const struct exynos_drm_ipp_funcs ipp_funcs = {
 	.commit = gsc_commit,
 	.abort = gsc_abort,
 };
diff --git a/drivers/gpu/drm/exynos/exynos_drm_scaler.c b/drivers/gpu/drm/exynos/exynos_drm_scaler.c
index a9d469896824..2788105ac780 100644
--- a/drivers/gpu/drm/exynos/exynos_drm_scaler.c
+++ b/drivers/gpu/drm/exynos/exynos_drm_scaler.c
@@ -403,7 +403,7 @@ static int scaler_commit(struct exynos_drm_ipp *ipp,
 	return 0;
 }
 
-static struct exynos_drm_ipp_funcs ipp_funcs = {
+static const struct exynos_drm_ipp_funcs ipp_funcs = {
 	.commit = scaler_commit,
 };
 
-- 
2.45.2

