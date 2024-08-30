Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id D77D9965827
	for <lists+dri-devel@lfdr.de>; Fri, 30 Aug 2024 09:15:46 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 45BA410E827;
	Fri, 30 Aug 2024 07:15:41 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from szxga03-in.huawei.com (szxga03-in.huawei.com [45.249.212.189])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 2AB8310E0D3
 for <dri-devel@lists.freedesktop.org>; Fri, 30 Aug 2024 01:14:06 +0000 (UTC)
Received: from mail.maildlp.com (unknown [172.19.163.252])
 by szxga03-in.huawei.com (SkyGuard) with ESMTP id 4Ww0RD4XbVzQqks;
 Fri, 30 Aug 2024 09:09:12 +0800 (CST)
Received: from kwepemd500012.china.huawei.com (unknown [7.221.188.25])
 by mail.maildlp.com (Postfix) with ESMTPS id 2FDCB1800C4;
 Fri, 30 Aug 2024 09:14:04 +0800 (CST)
Received: from huawei.com (10.90.53.73) by kwepemd500012.china.huawei.com
 (7.221.188.25) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.1258.34; Fri, 30 Aug
 2024 09:14:03 +0800
From: Li Zetao <lizetao1@huawei.com>
To: <alexander.deucher@amd.com>, <christian.koenig@amd.com>,
 <Xinhui.Pan@amd.com>, <airlied@gmail.com>, <daniel@ffwll.ch>,
 <kherbst@redhat.com>, <lyude@redhat.com>, <dakr@redhat.com>,
 <felix.kuehling@amd.com>, <zhenguo.yin@amd.com>,
 <srinivasan.shanmugam@amd.com>, <shashank.sharma@amd.com>,
 <Jesse.Zhang@amd.com>
CC: <lizetao1@huawei.com>, <amd-gfx@lists.freedesktop.org>,
 <dri-devel@lists.freedesktop.org>, <nouveau@lists.freedesktop.org>
Subject: [PATCH -next 1/3] drm/amd: use clamp() in amdgpu_pll_get_fb_ref_div()
Date: Fri, 30 Aug 2024 09:22:14 +0800
Message-ID: <20240830012216.603623-2-lizetao1@huawei.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20240830012216.603623-1-lizetao1@huawei.com>
References: <20240830012216.603623-1-lizetao1@huawei.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-Originating-IP: [10.90.53.73]
X-ClientProxiedBy: dggems702-chm.china.huawei.com (10.3.19.179) To
 kwepemd500012.china.huawei.com (7.221.188.25)
X-Mailman-Approved-At: Fri, 30 Aug 2024 07:15:39 +0000
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

When it needs to get a value within a certain interval, using clamp()
makes the code easier to understand than min(max()).

Signed-off-by: Li Zetao <lizetao1@huawei.com>
---
 drivers/gpu/drm/amd/amdgpu/amdgpu_pll.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/drivers/gpu/drm/amd/amdgpu/amdgpu_pll.c b/drivers/gpu/drm/amd/amdgpu/amdgpu_pll.c
index 0bb2466d539a..675aa138ea11 100644
--- a/drivers/gpu/drm/amd/amdgpu/amdgpu_pll.c
+++ b/drivers/gpu/drm/amd/amdgpu/amdgpu_pll.c
@@ -94,7 +94,7 @@ static void amdgpu_pll_get_fb_ref_div(struct amdgpu_device *adev, unsigned int n
 		ref_div_max = min(128 / post_div, ref_div_max);
 
 	/* get matching reference and feedback divider */
-	*ref_div = min(max(DIV_ROUND_CLOSEST(den, post_div), 1u), ref_div_max);
+	*ref_div = clamp(DIV_ROUND_CLOSEST(den, post_div), 1u, ref_div_max);
 	*fb_div = DIV_ROUND_CLOSEST(nom * *ref_div * post_div, den);
 
 	/* limit fb divider to its maximum */
-- 
2.34.1

