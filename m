Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 8E475402798
	for <lists+dri-devel@lfdr.de>; Tue,  7 Sep 2021 13:09:21 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 13E2989F24;
	Tue,  7 Sep 2021 11:09:17 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from smtp-relay-canonical-0.canonical.com
 (smtp-relay-canonical-0.canonical.com [185.125.188.120])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 5997E89F24;
 Tue,  7 Sep 2021 11:09:15 +0000 (UTC)
Received: from localhost (1.general.cking.uk.vpn [10.172.193.212])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange ECDHE (P-256) server-signature RSA-PSS (2048 bits) server-digest
 SHA256) (No client certificate requested)
 by smtp-relay-canonical-0.canonical.com (Postfix) with ESMTPSA id 604E63F042; 
 Tue,  7 Sep 2021 11:09:13 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=canonical.com;
 s=20210705; t=1631012953;
 bh=5zF7FrF9V3AncSdXcy8cFb4c8MGP7SY6V76Vkh/I5bQ=;
 h=From:To:Cc:Subject:Date:Message-Id:MIME-Version:Content-Type;
 b=L1brJSz1lVzNGXriF1B/m2YyEUenrHe2nm19rbgu24d4GKSKk9V8OUThntl55BvVw
 e3ARqvpd+MI3qXRGxzuoVIDAmMEMhJSt8cMtyBw4h/oy4b3I06y2DdDdpp6nEupOew
 TQUXw197fe4FVSZ/GkzOTAE7Q33gscTwourCjxM+v7lwNPghYO9tZAyzIWAM1qtTaI
 NskiXGDUfBUTmLjxlU5IJR3cPr5UTInqR/STuSg2lzva618EVAZvw1hWkHezHedILF
 RbONCzotdC9uzF9rMxBOuqZ7Vc5jmJl6Ej9G5Qp9B9kWy8gTv+5Cf/IlEY3PyZzOPA
 QzXGpIb42eSMA==
From: Colin King <colin.king@canonical.com>
To: Alex Deucher <alexander.deucher@amd.com>,
 =?UTF-8?q?Christian=20K=C3=B6nig?= <christian.koenig@amd.com>,
 Xinhui.Pan@amd.com, David Airlie <airlied@linux.ie>,
 Daniel Vetter <daniel@ffwll.ch>, amd-gfx@lists.freedesktop.org,
 dri-devel@lists.freedesktop.org
Cc: kernel-janitors@vger.kernel.org,
	linux-kernel@vger.kernel.org
Subject: [PATCH] drm/radeon/ci_dpm: Remove redundant initialization of
 variables hi_sidd, lo_sidd
Date: Tue,  7 Sep 2021 12:09:13 +0100
Message-Id: <20210907110913.15499-1-colin.king@canonical.com>
X-Mailer: git-send-email 2.32.0
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
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

From: Colin Ian King <colin.king@canonical.com>

The variables hi_sidd and lo_sidd are being initialized with a values
that are never read, they are being updated later on. The assignments
are redundant and can be removed.

Addresses-Coverity: ("Unused value")
Signed-off-by: Colin Ian King <colin.king@canonical.com>
---
 drivers/gpu/drm/radeon/ci_dpm.c | 3 +--
 1 file changed, 1 insertion(+), 2 deletions(-)

diff --git a/drivers/gpu/drm/radeon/ci_dpm.c b/drivers/gpu/drm/radeon/ci_dpm.c
index f0cfb58da467..ac006bed4743 100644
--- a/drivers/gpu/drm/radeon/ci_dpm.c
+++ b/drivers/gpu/drm/radeon/ci_dpm.c
@@ -390,8 +390,7 @@ static int ci_min_max_v_gnbl_pm_lid_from_bapm_vddc(struct radeon_device *rdev)
 static int ci_populate_bapm_vddc_base_leakage_sidd(struct radeon_device *rdev)
 {
 	struct ci_power_info *pi = ci_get_pi(rdev);
-	u16 hi_sidd = pi->smc_powertune_table.BapmVddCBaseLeakageHiSidd;
-	u16 lo_sidd = pi->smc_powertune_table.BapmVddCBaseLeakageLoSidd;
+	u16 hi_sidd, lo_sidd;
 	struct radeon_cac_tdp_table *cac_tdp_table =
 		rdev->pm.dpm.dyn_state.cac_tdp_table;
 
-- 
2.32.0

