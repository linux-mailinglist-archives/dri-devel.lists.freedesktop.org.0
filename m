Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 67DC75FBE2F
	for <lists+dri-devel@lfdr.de>; Wed, 12 Oct 2022 01:11:19 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id D8DCF10E072;
	Tue, 11 Oct 2022 23:11:10 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from phobos.denx.de (phobos.denx.de [85.214.62.61])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 1989110E072
 for <dri-devel@lists.freedesktop.org>; Tue, 11 Oct 2022 23:11:07 +0000 (UTC)
Received: from tr.lan (ip-86-49-12-201.bb.vodafone.cz [86.49.12.201])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits))
 (No client certificate requested)
 (Authenticated sender: marex@denx.de)
 by phobos.denx.de (Postfix) with ESMTPSA id 4DD3184F00;
 Wed, 12 Oct 2022 01:11:03 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=denx.de;
 s=phobos-20191101; t=1665529864;
 bh=yEW+tkEuff3nzVnUoqcCLQiVufYXXZ2BrS3mZUbKEg4=;
 h=From:To:Cc:Subject:Date:From;
 b=TD6HA8pZ04BZPSoqMyKKwsBkWYydtOo+7QSwXHNShJnz1BlqkKRs6JHLoKQEfmuQR
 Z1n+DEdkBRAz+4+NSoq5tdajgsaHWBJtZYfU3GUDXvXmPNJTydUP/FnlNxtAg9g5tk
 nAvl7UStfPDegQ/FYqdAOctTmvK+o9cJryWMG8F2awc+ZQ/G9HqTJPrOJCY1iLanIW
 4oMevdAVLJl9+Ji/7jPRPpcZ7/VSHxzw84pYXh3eBwiEW0VxrLGstdF72myXd/4K4m
 fxVbVn7nEf558nPpttSv1ySoBo2aJ/tfZtUJtprec8fRMVNjRSMgxXYzYoioMegkxF
 GnJP8TNJzpqbQ==
From: Marek Vasut <marex@denx.de>
To: dri-devel@lists.freedesktop.org
Subject: [PATCH] drm/stm: Fix resolution bitmasks
Date: Wed, 12 Oct 2022 01:10:48 +0200
Message-Id: <20221011231048.505967-1-marex@denx.de>
X-Mailer: git-send-email 2.35.1
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Virus-Scanned: clamav-milter 0.103.6 at phobos.denx.de
X-Virus-Status: Clean
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
Cc: Marek Vasut <marex@denx.de>, Antonio Borneo <antonio.borneo@foss.st.com>,
 Benjamin Gaignard <benjamin.gaignard@foss.st.com>,
 Yannick Fertre <yannick.fertre@foss.st.com>,
 Alexandre Torgue <alexandre.torgue@foss.st.com>,
 Vincent Abriou <vincent.abriou@foss.st.com>,
 Philippe Cornu <philippe.cornu@foss.st.com>,
 Maxime Coquelin <mcoquelin.stm32@gmail.com>, Sam Ravnborg <sam@ravnborg.org>,
 linux-stm32@st-md-mailman.stormreply.com, linux-arm-kernel@lists.infradead.org
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

STM32MP15xx RM0436 Rev 6 "35.7.3 LTDC synchronization size configuration
register (LTDC_SSCR)" on page 1784 and onward indicates VSH and similar
bits are all [11:0] instead of [10:0] wide. Fix this.

[1] https://www.st.com/resource/en/reference_manual/DM00327659-.pdf

Fixes: b759012c5fa7 ("drm/stm: Add STM32 LTDC driver")
Signed-off-by: Marek Vasut <marex@denx.de>
---
Cc: Alexandre Torgue <alexandre.torgue@foss.st.com>
Cc: Antonio Borneo <antonio.borneo@foss.st.com>
Cc: Benjamin Gaignard <benjamin.gaignard@foss.st.com>
Cc: Maxime Coquelin <mcoquelin.stm32@gmail.com>
Cc: Philippe Cornu <philippe.cornu@foss.st.com>
Cc: Sam Ravnborg <sam@ravnborg.org>
Cc: Vincent Abriou <vincent.abriou@foss.st.com>
Cc: Yannick Fertre <yannick.fertre@foss.st.com>
Cc: linux-arm-kernel@lists.infradead.org
Cc: linux-stm32@st-md-mailman.stormreply.com
To: dri-devel@lists.freedesktop.org
---
 drivers/gpu/drm/stm/ltdc.c | 8 ++++----
 1 file changed, 4 insertions(+), 4 deletions(-)

diff --git a/drivers/gpu/drm/stm/ltdc.c b/drivers/gpu/drm/stm/ltdc.c
index 03c6becda795c..639ed00b44a57 100644
--- a/drivers/gpu/drm/stm/ltdc.c
+++ b/drivers/gpu/drm/stm/ltdc.c
@@ -111,16 +111,16 @@
 #define LTDC_L1FPF1R	(ldev->caps.layer_regs[24])	/* L1 Flexible Pixel Format 1 */
 
 /* Bit definitions */
-#define SSCR_VSH	GENMASK(10, 0)	/* Vertical Synchronization Height */
+#define SSCR_VSH	GENMASK(11, 0)	/* Vertical Synchronization Height */
 #define SSCR_HSW	GENMASK(27, 16)	/* Horizontal Synchronization Width */
 
-#define BPCR_AVBP	GENMASK(10, 0)	/* Accumulated Vertical Back Porch */
+#define BPCR_AVBP	GENMASK(11, 0)	/* Accumulated Vertical Back Porch */
 #define BPCR_AHBP	GENMASK(27, 16)	/* Accumulated Horizontal Back Porch */
 
-#define AWCR_AAH	GENMASK(10, 0)	/* Accumulated Active Height */
+#define AWCR_AAH	GENMASK(11, 0)	/* Accumulated Active Height */
 #define AWCR_AAW	GENMASK(27, 16)	/* Accumulated Active Width */
 
-#define TWCR_TOTALH	GENMASK(10, 0)	/* TOTAL Height */
+#define TWCR_TOTALH	GENMASK(11, 0)	/* TOTAL Height */
 #define TWCR_TOTALW	GENMASK(27, 16)	/* TOTAL Width */
 
 #define GCR_LTDCEN	BIT(0)		/* LTDC ENable */
-- 
2.35.1

