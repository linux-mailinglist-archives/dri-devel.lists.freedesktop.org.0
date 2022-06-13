Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 64BCE547F79
	for <lists+dri-devel@lfdr.de>; Mon, 13 Jun 2022 08:24:37 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 48B0A10E2E8;
	Mon, 13 Jun 2022 06:24:35 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from szxga03-in.huawei.com (szxga03-in.huawei.com [45.249.212.189])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 69C6E10E2E8
 for <dri-devel@lists.freedesktop.org>; Mon, 13 Jun 2022 06:24:34 +0000 (UTC)
Received: from dggpemm500021.china.huawei.com (unknown [172.30.72.57])
 by szxga03-in.huawei.com (SkyGuard) with ESMTP id 4LM1jz2xC7zDqtM;
 Mon, 13 Jun 2022 14:24:07 +0800 (CST)
Received: from dggpemm500007.china.huawei.com (7.185.36.183) by
 dggpemm500021.china.huawei.com (7.185.36.109) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2375.24; Mon, 13 Jun 2022 14:24:29 +0800
Received: from huawei.com (10.175.103.91) by dggpemm500007.china.huawei.com
 (7.185.36.183) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id 15.1.2375.24; Mon, 13 Jun
 2022 14:24:29 +0800
From: Yang Yingliang <yangyingliang@huawei.com>
To: <linux-kernel@vger.kernel.org>, <dri-devel@lists.freedesktop.org>
Subject: [PATCH -next] drm/syncobj: add missing error return code in
 drm_syncobj_transfer_to_timeline()
Date: Mon, 13 Jun 2022 14:34:54 +0800
Message-ID: <20220613063454.2609364-1-yangyingliang@huawei.com>
X-Mailer: git-send-email 2.25.1
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-Originating-IP: [10.175.103.91]
X-ClientProxiedBy: dggems703-chm.china.huawei.com (10.3.19.180) To
 dggpemm500007.china.huawei.com (7.185.36.183)
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
Cc: daniel.vetter@ffwll.ch, christian.koenig@amd.com
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

If dma_fence_unwrap_merge() fails, it should return error code
in drm_syncobj_transfer_to_timeline()

Fixes: ec8d985ff26f ("drm: use dma_fence_unwrap_merge() in drm_syncobj")
Reported-by: Hulk Robot <hulkci@huawei.com>
Signed-off-by: Yang Yingliang <yangyingliang@huawei.com>
---
 drivers/gpu/drm/drm_syncobj.c | 4 +++-
 1 file changed, 3 insertions(+), 1 deletion(-)

diff --git a/drivers/gpu/drm/drm_syncobj.c b/drivers/gpu/drm/drm_syncobj.c
index bbad9e4696e7..0c2be8360525 100644
--- a/drivers/gpu/drm/drm_syncobj.c
+++ b/drivers/gpu/drm/drm_syncobj.c
@@ -874,8 +874,10 @@ static int drm_syncobj_transfer_to_timeline(struct drm_file *file_private,
 
 	fence = dma_fence_unwrap_merge(tmp);
 	dma_fence_put(tmp);
-	if (!fence)
+	if (!fence) {
+		ret = -ENOMEM;
 		goto err_put_timeline;
+	}
 
 	chain = dma_fence_chain_alloc();
 	if (!chain) {
-- 
2.25.1

