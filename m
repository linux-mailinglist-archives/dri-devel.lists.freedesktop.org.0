Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id DFD3154081F
	for <lists+dri-devel@lfdr.de>; Tue,  7 Jun 2022 19:55:53 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 9FFA710EE62;
	Tue,  7 Jun 2022 17:55:51 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from ams.source.kernel.org (ams.source.kernel.org [145.40.68.75])
 by gabe.freedesktop.org (Postfix) with ESMTPS id A9F3110F394;
 Tue,  7 Jun 2022 17:55:49 +0000 (UTC)
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by ams.source.kernel.org (Postfix) with ESMTPS id 4B984B80B66;
 Tue,  7 Jun 2022 17:55:48 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id E1471C34119;
 Tue,  7 Jun 2022 17:55:43 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=k20201202; t=1654624547;
 bh=NXa1J+I2sAkxDWNmDYdzt2EPtQnTfLbT30iET12VL7w=;
 h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
 b=RBWLVvRs8aL1NYIgUlBsNw22dHkznxEEvNus5xohNSOhBVggaVQuVOVjKPPCntxBp
 DwThHQmXJbOT5hcLNUJoDM5SCWPV2lL9M/g1oszb/08cTHwZQoGZojtFHQ9UTm2Spx
 kmsK6cHsjDcxv8xGeu80Scn1U8vAl4EzQlWacAhjNjKkIMynknPuoIhEAU4X13FM7a
 ffYJXTip9scG6mJZB322aure0XtNWjDG8/vhBruuLKpT2jfQmmgsM6I5bdeepLT4Vc
 rzUJwgbZh/6+3yi0dxvUDOfnf+7yLdt8pyJwt33+v1l7E0JL5TFevEOmEueVPA94+N
 K4yhFOq9N0wuA==
From: Sasha Levin <sashal@kernel.org>
To: linux-kernel@vger.kernel.org,
	stable@vger.kernel.org
Subject: [PATCH AUTOSEL 5.17 59/60] drm/amd/pm: use bitmap_{from,
 to}_arr32 where appropriate
Date: Tue,  7 Jun 2022 13:52:56 -0400
Message-Id: <20220607175259.478835-59-sashal@kernel.org>
X-Mailer: git-send-email 2.35.1
In-Reply-To: <20220607175259.478835-1-sashal@kernel.org>
References: <20220607175259.478835-1-sashal@kernel.org>
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
Cc: David Hildenbrand <david@redhat.com>, airlied@linux.ie, lijo.lazar@amd.com,
 Rasmus Villemoes <linux@rasmusvillemoes.dk>, dri-devel@lists.freedesktop.org,
 Xiaomeng.Hou@amd.com, mario.limonciello@amd.com, darren.powell@amd.com,
 Alexander Gordeev <agordeev@linux.ibm.com>,
 Claudio Imbrenda <imbrenda@linux.ibm.com>, Sasha Levin <sashal@kernel.org>,
 evan.quan@amd.com, Yury Norov <yury.norov@gmail.com>,
 Janosch Frank <frankja@linux.ibm.com>, guchun.chen@amd.com,
 amd-gfx@lists.freedesktop.org,
 Christian Borntraeger <borntraeger@linux.ibm.com>, kenneth.feng@amd.com,
 tim.huang@amd.com, tao.zhou1@amd.com, Vasily Gorbik <gor@linux.ibm.com>,
 Heiko Carstens <hca@linux.ibm.com>, kevin1.wang@amd.com,
 Andy Shevchenko <andriy.shevchenko@linux.intel.com>, Jack.Gui@amd.com,
 Xinhui.Pan@amd.com, Sven Schnelle <svens@linux.ibm.com>,
 alexander.deucher@amd.com, christian.koenig@amd.com, Hawking.Zhang@amd.com
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

From: Yury Norov <yury.norov@gmail.com>

[ Upstream commit 525d6515604eb1373ce5e6372a6b6640953b2d6a ]

The smu_v1X_0_set_allowed_mask() uses bitmap_copy() to convert
bitmap to 32-bit array. This may be wrong due to endiannes issues.
Fix it by switching to bitmap_{from,to}_arr32.

CC: Alexander Gordeev <agordeev@linux.ibm.com>
CC: Andy Shevchenko <andriy.shevchenko@linux.intel.com>
CC: Christian Borntraeger <borntraeger@linux.ibm.com>
CC: Claudio Imbrenda <imbrenda@linux.ibm.com>
CC: David Hildenbrand <david@redhat.com>
CC: Heiko Carstens <hca@linux.ibm.com>
CC: Janosch Frank <frankja@linux.ibm.com>
CC: Rasmus Villemoes <linux@rasmusvillemoes.dk>
CC: Sven Schnelle <svens@linux.ibm.com>
CC: Vasily Gorbik <gor@linux.ibm.com>
Signed-off-by: Yury Norov <yury.norov@gmail.com>
Signed-off-by: Sasha Levin <sashal@kernel.org>
---
 drivers/gpu/drm/amd/pm/swsmu/smu11/smu_v11_0.c | 2 +-
 drivers/gpu/drm/amd/pm/swsmu/smu13/smu_v13_0.c | 2 +-
 2 files changed, 2 insertions(+), 2 deletions(-)

diff --git a/drivers/gpu/drm/amd/pm/swsmu/smu11/smu_v11_0.c b/drivers/gpu/drm/amd/pm/swsmu/smu11/smu_v11_0.c
index 4e9e2cf39859..5fcbec9dd45d 100644
--- a/drivers/gpu/drm/amd/pm/swsmu/smu11/smu_v11_0.c
+++ b/drivers/gpu/drm/amd/pm/swsmu/smu11/smu_v11_0.c
@@ -777,7 +777,7 @@ int smu_v11_0_set_allowed_mask(struct smu_context *smu)
 		goto failed;
 	}
 
-	bitmap_copy((unsigned long *)feature_mask, feature->allowed, 64);
+	bitmap_to_arr32(feature_mask, feature->allowed, 64);
 
 	ret = smu_cmn_send_smc_msg_with_param(smu, SMU_MSG_SetAllowedFeaturesMaskHigh,
 					  feature_mask[1], NULL);
diff --git a/drivers/gpu/drm/amd/pm/swsmu/smu13/smu_v13_0.c b/drivers/gpu/drm/amd/pm/swsmu/smu13/smu_v13_0.c
index b54790d3483e..4a5e91b59f0c 100644
--- a/drivers/gpu/drm/amd/pm/swsmu/smu13/smu_v13_0.c
+++ b/drivers/gpu/drm/amd/pm/swsmu/smu13/smu_v13_0.c
@@ -726,7 +726,7 @@ int smu_v13_0_set_allowed_mask(struct smu_context *smu)
 	if (bitmap_empty(feature->allowed, SMU_FEATURE_MAX) || feature->feature_num < 64)
 		goto failed;
 
-	bitmap_copy((unsigned long *)feature_mask, feature->allowed, 64);
+	bitmap_to_arr32(feature_mask, feature->allowed, 64);
 
 	ret = smu_cmn_send_smc_msg_with_param(smu, SMU_MSG_SetAllowedFeaturesMaskHigh,
 					      feature_mask[1], NULL);
-- 
2.35.1

