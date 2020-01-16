Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 0289613E561
	for <lists+dri-devel@lfdr.de>; Thu, 16 Jan 2020 18:14:29 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id D396A6EE22;
	Thu, 16 Jan 2020 17:14:26 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
 by gabe.freedesktop.org (Postfix) with ESMTPS id BEA856EE21;
 Thu, 16 Jan 2020 17:14:25 +0000 (UTC)
Received: from sasha-vm.mshome.net (c-73-47-72-35.hsd1.nh.comcast.net
 [73.47.72.35])
 (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
 (No client certificate requested)
 by mail.kernel.org (Postfix) with ESMTPSA id DA682246B9;
 Thu, 16 Jan 2020 17:14:24 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=default; t=1579194865;
 bh=993pg9XMBYHt9nnaRXdF+Najd/DaGCdU+bws4zSlLE8=;
 h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
 b=lV5AQg4oRGoiTdVTOwK/fDMf3eKkPS//X9gHEhNjltPbTaPHBllfs88bNYtC9j8jV
 pt+RRGbEyGr+veG+xZMMaR0zIOKLa23KspChR3l4iRIDAL6HN9dMCNqlinTLaYovU1
 ZNU72T8xNn+hzxCUDJF8fyIciUzQAQDibYZpkj2k=
From: Sasha Levin <sashal@kernel.org>
To: linux-kernel@vger.kernel.org,
	stable@vger.kernel.org
Subject: [PATCH AUTOSEL 4.19 659/671] drm/radeon: fix bad DMA from
 INTERRUPT_CNTL2
Date: Thu, 16 Jan 2020 12:04:57 -0500
Message-Id: <20200116170509.12787-396-sashal@kernel.org>
X-Mailer: git-send-email 2.20.1
In-Reply-To: <20200116170509.12787-1-sashal@kernel.org>
References: <20200116170509.12787-1-sashal@kernel.org>
MIME-Version: 1.0
X-stable: review
X-Patchwork-Hint: Ignore
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
Cc: Sam Bobroff <sbobroff@linux.ibm.com>,
 Alex Deucher <alexander.deucher@amd.com>, dri-devel@lists.freedesktop.org,
 amd-gfx@lists.freedesktop.org, Sasha Levin <sashal@kernel.org>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

From: Sam Bobroff <sbobroff@linux.ibm.com>

[ Upstream commit 62d91dd2851e8ae2ca552f1b090a3575a4edf759 ]

The INTERRUPT_CNTL2 register expects a valid DMA address, but is
currently set with a GPU MC address.  This can cause problems on
systems that detect the resulting DMA read from an invalid address
(found on a Power8 guest).

Instead, use the DMA address of the dummy page because it will always
be safe.

Fixes: d8f60cfc9345 ("drm/radeon/kms: Add support for interrupts on r6xx/r7xx chips (v3)")
Fixes: 25a857fbe973 ("drm/radeon/kms: add support for interrupts on SI")
Fixes: a59781bbe528 ("drm/radeon: add support for interrupts on CIK (v5)")
Signed-off-by: Sam Bobroff <sbobroff@linux.ibm.com>
Signed-off-by: Alex Deucher <alexander.deucher@amd.com>
Signed-off-by: Sasha Levin <sashal@kernel.org>
---
 drivers/gpu/drm/radeon/cik.c  | 4 ++--
 drivers/gpu/drm/radeon/r600.c | 4 ++--
 drivers/gpu/drm/radeon/si.c   | 4 ++--
 3 files changed, 6 insertions(+), 6 deletions(-)

diff --git a/drivers/gpu/drm/radeon/cik.c b/drivers/gpu/drm/radeon/cik.c
index ebce4601a305..827d551962d9 100644
--- a/drivers/gpu/drm/radeon/cik.c
+++ b/drivers/gpu/drm/radeon/cik.c
@@ -6965,8 +6965,8 @@ static int cik_irq_init(struct radeon_device *rdev)
 	}
 
 	/* setup interrupt control */
-	/* XXX this should actually be a bus address, not an MC address. same on older asics */
-	WREG32(INTERRUPT_CNTL2, rdev->ih.gpu_addr >> 8);
+	/* set dummy read address to dummy page address */
+	WREG32(INTERRUPT_CNTL2, rdev->dummy_page.addr >> 8);
 	interrupt_cntl = RREG32(INTERRUPT_CNTL);
 	/* IH_DUMMY_RD_OVERRIDE=0 - dummy read disabled with msi, enabled without msi
 	 * IH_DUMMY_RD_OVERRIDE=1 - dummy read controlled by IH_DUMMY_RD_EN
diff --git a/drivers/gpu/drm/radeon/r600.c b/drivers/gpu/drm/radeon/r600.c
index e06e2d8feab3..a724bb87cfad 100644
--- a/drivers/gpu/drm/radeon/r600.c
+++ b/drivers/gpu/drm/radeon/r600.c
@@ -3690,8 +3690,8 @@ int r600_irq_init(struct radeon_device *rdev)
 	}
 
 	/* setup interrupt control */
-	/* set dummy read address to ring address */
-	WREG32(INTERRUPT_CNTL2, rdev->ih.gpu_addr >> 8);
+	/* set dummy read address to dummy page address */
+	WREG32(INTERRUPT_CNTL2, rdev->dummy_page.addr >> 8);
 	interrupt_cntl = RREG32(INTERRUPT_CNTL);
 	/* IH_DUMMY_RD_OVERRIDE=0 - dummy read disabled with msi, enabled without msi
 	 * IH_DUMMY_RD_OVERRIDE=1 - dummy read controlled by IH_DUMMY_RD_EN
diff --git a/drivers/gpu/drm/radeon/si.c b/drivers/gpu/drm/radeon/si.c
index 85c604d29235..639f0698f961 100644
--- a/drivers/gpu/drm/radeon/si.c
+++ b/drivers/gpu/drm/radeon/si.c
@@ -5993,8 +5993,8 @@ static int si_irq_init(struct radeon_device *rdev)
 	}
 
 	/* setup interrupt control */
-	/* set dummy read address to ring address */
-	WREG32(INTERRUPT_CNTL2, rdev->ih.gpu_addr >> 8);
+	/* set dummy read address to dummy page address */
+	WREG32(INTERRUPT_CNTL2, rdev->dummy_page.addr >> 8);
 	interrupt_cntl = RREG32(INTERRUPT_CNTL);
 	/* IH_DUMMY_RD_OVERRIDE=0 - dummy read disabled with msi, enabled without msi
 	 * IH_DUMMY_RD_OVERRIDE=1 - dummy read controlled by IH_DUMMY_RD_EN
-- 
2.20.1

_______________________________________________
dri-devel mailing list
dri-devel@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/dri-devel
