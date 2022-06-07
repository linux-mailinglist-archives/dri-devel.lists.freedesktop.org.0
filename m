Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 50C035407E1
	for <lists+dri-devel@lfdr.de>; Tue,  7 Jun 2022 19:53:00 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id DFB4A10F328;
	Tue,  7 Jun 2022 17:52:57 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from ams.source.kernel.org (ams.source.kernel.org [145.40.68.75])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 8FC1210F348;
 Tue,  7 Jun 2022 17:52:56 +0000 (UTC)
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by ams.source.kernel.org (Postfix) with ESMTPS id 2EF27B82348;
 Tue,  7 Jun 2022 17:52:55 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 37CC9C385A5;
 Tue,  7 Jun 2022 17:52:50 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=k20201202; t=1654624373;
 bh=LYQzyA3EYOwaI3hpcICIfprp+dWtUSLsCT350YaAutI=;
 h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
 b=mVutd+eVskD4IIqimz2qMaSVPzAvbiR++yEYPYXpijjMSp5Jj02FgPbMdEymHbxWr
 8uo2NfrMFm8WGsXTMd+bkV0IeQQoPZIAFnsJ2dN39el3I23/IdKkXjqAp0VipB5i33
 91CaQgBTZ6sPS6FmcDBOi9fhT8Au/CpetRgG9xVLyGFW16JbZeFhzk2O8bvvuNMKtz
 lCiVBVmg/uIAXL2b7VUv5s2ovlGXaVQtYpPVMm9xrspjCbq1UyhC/smhNaUXCfq7Yk
 1pEY31Jujygcak3dpuMrvdtpSbiD9R9S9tR1MVEIW4MNiEWy7ZMrSEVcc9P9cnEGvm
 ApmmO3BnVVDZw==
From: Sasha Levin <sashal@kernel.org>
To: linux-kernel@vger.kernel.org,
	stable@vger.kernel.org
Subject: [PATCH AUTOSEL 5.18 67/68] drm/amd/pm: use bitmap_{from,
 to}_arr32 where appropriate
Date: Tue,  7 Jun 2022 13:48:33 -0400
Message-Id: <20220607174846.477972-67-sashal@kernel.org>
X-Mailer: git-send-email 2.35.1
In-Reply-To: <20220607174846.477972-1-sashal@kernel.org>
References: <20220607174846.477972-1-sashal@kernel.org>
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
index b87f550af26b..5f8809f6990d 100644
--- a/drivers/gpu/drm/amd/pm/swsmu/smu11/smu_v11_0.c
+++ b/drivers/gpu/drm/amd/pm/swsmu/smu11/smu_v11_0.c
@@ -781,7 +781,7 @@ int smu_v11_0_set_allowed_mask(struct smu_context *smu)
 		goto failed;
 	}
 
-	bitmap_copy((unsigned long *)feature_mask, feature->allowed, 64);
+	bitmap_to_arr32(feature_mask, feature->allowed, 64);
 
 	ret = smu_cmn_send_smc_msg_with_param(smu, SMU_MSG_SetAllowedFeaturesMaskHigh,
 					  feature_mask[1], NULL);
diff --git a/drivers/gpu/drm/amd/pm/swsmu/smu13/smu_v13_0.c b/drivers/gpu/drm/amd/pm/swsmu/smu13/smu_v13_0.c
index cf09e30bdfe0..747430ce6394 100644
--- a/drivers/gpu/drm/amd/pm/swsmu/smu13/smu_v13_0.c
+++ b/drivers/gpu/drm/amd/pm/swsmu/smu13/smu_v13_0.c
@@ -730,7 +730,7 @@ int smu_v13_0_set_allowed_mask(struct smu_context *smu)
 	    feature->feature_num < 64)
 		return -EINVAL;
 
-	bitmap_copy((unsigned long *)feature_mask, feature->allowed, 64);
+	bitmap_to_arr32(feature_mask, feature->allowed, 64);
 
 	ret = smu_cmn_send_smc_msg_with_param(smu, SMU_MSG_SetAllowedFeaturesMaskHigh,
 					      feature_mask[1], NULL);
-- 
2.35.1

