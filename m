Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 231E3540869
	for <lists+dri-devel@lfdr.de>; Tue,  7 Jun 2022 19:58:35 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 86B2410ED28;
	Tue,  7 Jun 2022 17:58:32 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from dfw.source.kernel.org (dfw.source.kernel.org
 [IPv6:2604:1380:4641:c500::1])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 8A09410EF4F;
 Tue,  7 Jun 2022 17:58:31 +0000 (UTC)
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by dfw.source.kernel.org (Postfix) with ESMTPS id 12B9B6183C;
 Tue,  7 Jun 2022 17:58:31 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id D386DC385A5;
 Tue,  7 Jun 2022 17:58:26 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=k20201202; t=1654624710;
 bh=9iiuiFCgsrm+sHgYub5Z3TgK2n+4XPqxCQptH1jhPjk=;
 h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
 b=t7HIzojV9pbVj632EfADTafC+6gG6p/4HUEW1GSdAj31KOam4ZWPXmXMNnsbluXfp
 8atyQUNqQ61eLb+92ffTf9Kno2hmBjLjS5HTV85ijPaDOKUfDPYromvWYvvLIghwdd
 cuvMXwP+6OFczxz2lOT25UF+qnJp65Aq9GfsdNCq/RekvjPUcCPY4nMSuBx6NSm41I
 HPUFTjAzpmPiH6C42y4GVogyNVYboVhWEkdKjU3e8ZQ/vNAt/S2ORTONn4WeJ5nhUH
 QEPYTmS77pwG+2F4BgCVVUwvk2hPWhs1Hwp58w9/DhAmWTXXta4XpBOQ5hADYLaO08
 Y2ZOd3JEZQLQw==
From: Sasha Levin <sashal@kernel.org>
To: linux-kernel@vger.kernel.org,
	stable@vger.kernel.org
Subject: [PATCH AUTOSEL 5.15 50/51] drm/amd/pm: use bitmap_{from,
 to}_arr32 where appropriate
Date: Tue,  7 Jun 2022 13:55:49 -0400
Message-Id: <20220607175552.479948-50-sashal@kernel.org>
X-Mailer: git-send-email 2.35.1
In-Reply-To: <20220607175552.479948-1-sashal@kernel.org>
References: <20220607175552.479948-1-sashal@kernel.org>
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
index 87b055466a33..e6c93396434f 100644
--- a/drivers/gpu/drm/amd/pm/swsmu/smu11/smu_v11_0.c
+++ b/drivers/gpu/drm/amd/pm/swsmu/smu11/smu_v11_0.c
@@ -772,7 +772,7 @@ int smu_v11_0_set_allowed_mask(struct smu_context *smu)
 		goto failed;
 	}
 
-	bitmap_copy((unsigned long *)feature_mask, feature->allowed, 64);
+	bitmap_to_arr32(feature_mask, feature->allowed, 64);
 
 	ret = smu_cmn_send_smc_msg_with_param(smu, SMU_MSG_SetAllowedFeaturesMaskHigh,
 					  feature_mask[1], NULL);
diff --git a/drivers/gpu/drm/amd/pm/swsmu/smu13/smu_v13_0.c b/drivers/gpu/drm/amd/pm/swsmu/smu13/smu_v13_0.c
index 8d4aa16b2ae7..6211570fb64f 100644
--- a/drivers/gpu/drm/amd/pm/swsmu/smu13/smu_v13_0.c
+++ b/drivers/gpu/drm/amd/pm/swsmu/smu13/smu_v13_0.c
@@ -721,7 +721,7 @@ int smu_v13_0_set_allowed_mask(struct smu_context *smu)
 	if (bitmap_empty(feature->allowed, SMU_FEATURE_MAX) || feature->feature_num < 64)
 		goto failed;
 
-	bitmap_copy((unsigned long *)feature_mask, feature->allowed, 64);
+	bitmap_to_arr32(feature_mask, feature->allowed, 64);
 
 	ret = smu_cmn_send_smc_msg_with_param(smu, SMU_MSG_SetAllowedFeaturesMaskHigh,
 					      feature_mask[1], NULL);
-- 
2.35.1

