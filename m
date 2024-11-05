Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 67A199BE035
	for <lists+dri-devel@lfdr.de>; Wed,  6 Nov 2024 09:18:29 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 0C13A10E678;
	Wed,  6 Nov 2024 08:18:22 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from szxga04-in.huawei.com (szxga04-in.huawei.com [45.249.212.190])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 5CB1D10E5BE;
 Tue,  5 Nov 2024 14:30:43 +0000 (UTC)
Received: from mail.maildlp.com (unknown [172.19.88.234])
 by szxga04-in.huawei.com (SkyGuard) with ESMTP id 4XjVdv6nMqz2Fbrp;
 Tue,  5 Nov 2024 22:12:19 +0800 (CST)
Received: from kwepemd200012.china.huawei.com (unknown [7.221.188.145])
 by mail.maildlp.com (Postfix) with ESMTPS id E1AC014011F;
 Tue,  5 Nov 2024 22:13:59 +0800 (CST)
Received: from huawei.com (10.67.175.84) by kwepemd200012.china.huawei.com
 (7.221.188.145) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.1258.34; Tue, 5 Nov
 2024 22:13:58 +0800
From: Zicheng Qu <quzicheng@huawei.com>
To: <harry.wentland@amd.com>, <sunpeng.li@amd.com>,
 <Rodrigo.Siqueira@amd.com>, <alexander.deucher@amd.com>,
 <christian.koenig@amd.com>, <Xinhui.Pan@amd.com>, <airlied@gmail.com>,
 <simona@ffwll.ch>, <Alvin.Lee2@amd.com>, <chiahsuan.chung@amd.com>,
 <alex.hung@amd.com>, <wenjing.liu@amd.com>, <Dillon.Varone@amd.com>,
 <george.shen@amd.com>, <mwen@igalia.com>, <yi-lchen@amd.com>,
 <martin.leung@amd.com>, <yongqiang.sun@amd.com>, <tony.cheng@amd.com>,
 <amd-gfx@lists.freedesktop.org>, <dri-devel@lists.freedesktop.org>,
 <linux-kernel@vger.kernel.org>
CC: <tanghui20@huawei.com>, <zhangqiao22@huawei.com>,
 <judy.chenhui@huawei.com>, <quzicheng@huawei.com>
Subject: [PATCH 2/2] drm/amd/display: Fix incorrect power gating configuration
 for DOMAIN11
Date: Tue, 5 Nov 2024 14:02:56 +0000
Message-ID: <20241105140256.2465614-3-quzicheng@huawei.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20241105140256.2465614-1-quzicheng@huawei.com>
References: <20241105140256.2465614-1-quzicheng@huawei.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-Originating-IP: [10.67.175.84]
X-ClientProxiedBy: dggems702-chm.china.huawei.com (10.3.19.179) To
 kwepemd200012.china.huawei.com (7.221.188.145)
X-Mailman-Approved-At: Wed, 06 Nov 2024 08:18:14 +0000
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

The current implementation incorrectly updates DOMAIN11_PG_CONFIG with
DOMAIN9_POWER_FORCEON, which is not the intended behavior. This patch
corrects the power gating configuration by updating DOMAIN11_PG_CONFIG
with DOMAIN11_POWER_FORCEON, preventing potential issues related to
power management.

Fixes: 46825fcfbe16 ("drm/amd/display: avoid power gate domains that doesn't exist")
Signed-off-by: Zicheng Qu <quzicheng@huawei.com>
---
 drivers/gpu/drm/amd/display/dc/hwss/dcn20/dcn20_hwseq.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/drivers/gpu/drm/amd/display/dc/hwss/dcn20/dcn20_hwseq.c b/drivers/gpu/drm/amd/display/dc/hwss/dcn20/dcn20_hwseq.c
index 67a77274d813..bc21eb0b2760 100644
--- a/drivers/gpu/drm/amd/display/dc/hwss/dcn20/dcn20_hwseq.c
+++ b/drivers/gpu/drm/amd/display/dc/hwss/dcn20/dcn20_hwseq.c
@@ -327,7 +327,7 @@ void dcn20_enable_power_gating_plane(
 	if (REG(DOMAIN9_PG_CONFIG))
 		REG_UPDATE(DOMAIN9_PG_CONFIG, DOMAIN9_POWER_FORCEON, force_on);
 	if (REG(DOMAIN11_PG_CONFIG))
-		REG_UPDATE(DOMAIN11_PG_CONFIG, DOMAIN9_POWER_FORCEON, force_on);
+		REG_UPDATE(DOMAIN11_PG_CONFIG, DOMAIN11_POWER_FORCEON, force_on);
 
 	/* DCS0/1/2/3/4/5 */
 	REG_UPDATE(DOMAIN16_PG_CONFIG, DOMAIN16_POWER_FORCEON, force_on);
-- 
2.34.1

