Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 7D258637009
	for <lists+dri-devel@lfdr.de>; Thu, 24 Nov 2022 02:53:10 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 6326710E24F;
	Thu, 24 Nov 2022 01:53:07 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from szxga03-in.huawei.com (szxga03-in.huawei.com [45.249.212.189])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 9335710E24F
 for <dri-devel@lists.freedesktop.org>; Thu, 24 Nov 2022 01:53:02 +0000 (UTC)
Received: from kwepemi500016.china.huawei.com (unknown [172.30.72.56])
 by szxga03-in.huawei.com (SkyGuard) with ESMTP id 4NHgsf43Q5zJnpy;
 Thu, 24 Nov 2022 09:49:42 +0800 (CST)
Received: from huawei.com (10.175.100.227) by kwepemi500016.china.huawei.com
 (7.221.188.220) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id 15.1.2375.31; Thu, 24 Nov
 2022 09:52:58 +0800
From: Shang XiaoJing <shangxiaojing@huawei.com>
To: <emma@anholt.net>, <mripard@kernel.org>, <airlied@gmail.com>,
 <daniel@ffwll.ch>, <bbrezillon@kernel.org>, <eric@anholt.net>,
 <dri-devel@lists.freedesktop.org>
Subject: [PATCH] drm/vc4: vec: Use pm_runtime_resume_and_get() in
 vc4_vec_encoder_enable()
Date: Thu, 24 Nov 2022 09:51:13 +0800
Message-ID: <20221124015113.18540-1-shangxiaojing@huawei.com>
X-Mailer: git-send-email 2.17.1
MIME-Version: 1.0
Content-Type: text/plain
X-Originating-IP: [10.175.100.227]
X-ClientProxiedBy: dggems703-chm.china.huawei.com (10.3.19.180) To
 kwepemi500016.china.huawei.com (7.221.188.220)
X-CFilter-Loop: Reflected
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
Cc: shangxiaojing@huawei.com
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

Commit f0601ef8631c ("drm/vc4: vec: Protect device resources after
removal") add fail path for vc4_vec_encoder_enable(), and will put
usage_counter only when pm_runtime_get_sync() succeeds. However,
pm_runtime_get_sync() will increment usage_counter even it failed. Fix
it by replacing it with pm_runtime_resume_and_get() to keep usage
counter balanced.

Fixes: e4b81f8c74c8 ("drm/vc4: Add support for the VEC (Video Encoder) IP")
Signed-off-by: Shang XiaoJing <shangxiaojing@huawei.com>
---
 drivers/gpu/drm/vc4/vc4_vec.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/drivers/gpu/drm/vc4/vc4_vec.c b/drivers/gpu/drm/vc4/vc4_vec.c
index 0b3333865702..f4e044ba09d4 100644
--- a/drivers/gpu/drm/vc4/vc4_vec.c
+++ b/drivers/gpu/drm/vc4/vc4_vec.c
@@ -367,7 +367,7 @@ static void vc4_vec_encoder_enable(struct drm_encoder *encoder,
 	if (!drm_dev_enter(drm, &idx))
 		return;
 
-	ret = pm_runtime_get_sync(&vec->pdev->dev);
+	ret = pm_runtime_resume_and_get(&vec->pdev->dev);
 	if (ret < 0) {
 		DRM_ERROR("Failed to retain power domain: %d\n", ret);
 		goto err_dev_exit;
-- 
2.17.1

