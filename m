Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id BB10258926D
	for <lists+dri-devel@lfdr.de>; Wed,  3 Aug 2022 20:51:10 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id ACB7B113591;
	Wed,  3 Aug 2022 18:50:56 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
X-Greylist: delayed 433 seconds by postgrey-1.36 at gabe;
 Wed, 03 Aug 2022 09:28:28 UTC
Received: from qq.com (smtpbg401.qq.com [113.96.223.41])
 by gabe.freedesktop.org (Postfix) with ESMTPS id E1E2C10EA0F;
 Wed,  3 Aug 2022 09:28:28 +0000 (UTC)
X-QQ-mid: bizesmtp66t1659518422tzylbcvz
Received: from localhost.localdomain ( [58.240.82.166])
 by bizesmtp.qq.com (ESMTP) with 
 id ; Wed, 03 Aug 2022 17:20:15 +0800 (CST)
X-QQ-SSF: 01400000002000C0K000B00C0000000
X-QQ-FEAT: SX/WFj88WPUxbTF4fAIy8feA+WbS0O/OdVIzxiN547FytXi3P1FLnwSOmn5Ue
 GLflUhkiIY0OHLxLWqNHfRMF1NyEPY299Fn9TpbE+qsJQvjLbyO9hE/r9hQJEzKE7aQi9yl
 kUY1OiWrmJtReOBNsVxA1j1fgtKTz9ik2D5Es8dIBfgkfRdHkPb/Wjiwokant2XroxS1PZL
 yhIQSbH9aS14LMec+cOSbLFV9f636CiavPxXwc1ONXb2+bEwSkOWMr8U2bhTwTNWH0nJj84
 6/0NgasvDcCWYGCBHWjcfNgomBtqYvf7Y6W8z8Zbd1H5Q+KTotX+Nv2u+oOOwgrFd3sMMk4
 hwqP3a63xmaL41XwJ0j/BFILIHlggrYZbiOnExPqtcaGg4/T1Xyi5Kdu+HFX/NXeW6iZ85V
X-QQ-GoodBg: 2
From: Zhen Ni <nizhen@uniontech.com>
To: airlied@linux.ie, daniel@ffwll.ch, evan.quan@amd.com,
 alexander.deucher@amd.com, christian.koenig@amd.com, Xinhui.Pan@amd.com
Subject: [PATCH 1/2] drm/amd/pm: Fix a potential gpu_metrics_table memory leak
Date: Wed,  3 Aug 2022 17:19:58 +0800
Message-Id: <20220803091959.10030-1-nizhen@uniontech.com>
X-Mailer: git-send-email 2.20.1
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-QQ-SENDSIZE: 520
Feedback-ID: bizesmtp:uniontech.com:qybgforeign:qybgforeign3
X-QQ-Bgrelay: 1
X-Mailman-Approved-At: Wed, 03 Aug 2022 18:50:35 +0000
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
Cc: Zhen Ni <nizhen@uniontech.com>, dri-devel@lists.freedesktop.org,
 amd-gfx@lists.freedesktop.org, linux-kernel@vger.kernel.org
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

Memory is allocated for gpu_metrics_table in
smu_v13_0_4_init_smc_tables(), but not freed in
smu_v13_0_4_fini_smc_tables(). This may cause memory leaks, fix it.

Signed-off-by: Zhen Ni <nizhen@uniontech.com>
---
 drivers/gpu/drm/amd/pm/swsmu/smu13/smu_v13_0_4_ppt.c | 3 +++
 1 file changed, 3 insertions(+)

diff --git a/drivers/gpu/drm/amd/pm/swsmu/smu13/smu_v13_0_4_ppt.c b/drivers/gpu/drm/amd/pm/swsmu/smu13/smu_v13_0_4_ppt.c
index 5a17b51aa0f9..7df360c25d51 100644
--- a/drivers/gpu/drm/amd/pm/swsmu/smu13/smu_v13_0_4_ppt.c
+++ b/drivers/gpu/drm/amd/pm/swsmu/smu13/smu_v13_0_4_ppt.c
@@ -190,6 +190,9 @@ static int smu_v13_0_4_fini_smc_tables(struct smu_context *smu)
 	kfree(smu_table->watermarks_table);
 	smu_table->watermarks_table = NULL;
 
+	kfree(smu_table->gpu_metrics_table);
+	smu_table->gpu_metrics_table = NULL;
+
 	return 0;
 }
 
-- 
2.20.1



