Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 48B4DB13DEE
	for <lists+dri-devel@lfdr.de>; Mon, 28 Jul 2025 17:10:03 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id B669E10E50F;
	Mon, 28 Jul 2025 15:10:00 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
X-Greylist: delayed 1034 seconds by postgrey-1.36 at gabe;
 Mon, 28 Jul 2025 11:40:01 UTC
Received: from szxga02-in.huawei.com (szxga02-in.huawei.com [45.249.212.188])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 30E6710E339;
 Mon, 28 Jul 2025 11:40:01 +0000 (UTC)
Received: from mail.maildlp.com (unknown [172.19.88.194])
 by szxga02-in.huawei.com (SkyGuard) with ESMTP id 4brGJk1QsKztSxB;
 Mon, 28 Jul 2025 19:21:42 +0800 (CST)
Received: from kwepemp100011.china.huawei.com (unknown [7.202.195.41])
 by mail.maildlp.com (Postfix) with ESMTPS id 43BEE140257;
 Mon, 28 Jul 2025 19:22:45 +0800 (CST)
Received: from kwepemp200018.china.huawei.com (7.202.194.226) by
 kwepemp100011.china.huawei.com (7.202.195.41) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.1544.11; Mon, 28 Jul 2025 19:22:44 +0800
Received: from localhost.localdomain (10.175.101.6) by
 kwepemp200018.china.huawei.com (7.202.194.226) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.1544.11; Mon, 28 Jul 2025 19:22:44 +0800
From: Fanhua Li <lifanhua5@huawei.com>
To: <dri-devel@lists.freedesktop.org>, <nouveau@lists.freedesktop.org>
CC: <liuyongqiang13@huawei.com>, <lyude@redhat.com>, <dakr@kernel.org>,
 <airlied@gmail.com>, <simona@ffwll.ch>, <airlied@redhat.com>,
 <linux-kernel@vger.kernel.org>, <suhui@nfschina.com>
Subject: [PATCH] drm/nouveau/nvif: Fix potential memory leak in
 nvif_vmm_ctor().
Date: Mon, 28 Jul 2025 19:50:27 +0800
Message-ID: <20250728115027.50878-1-lifanhua5@huawei.com>
X-Mailer: git-send-email 2.43.0
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-Originating-IP: [10.175.101.6]
X-ClientProxiedBy: kwepems100001.china.huawei.com (7.221.188.238) To
 kwepemp200018.china.huawei.com (7.202.194.226)
X-Mailman-Approved-At: Mon, 28 Jul 2025 15:09:48 +0000
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

When the nvif_vmm_type is invalid, we will return error directly
without freeing the args in nvif_vmm_ctor(), which leading a memory
leak. Fix it by setting the ret -EINVAL and goto done.

Reported-by: kernel test robot <lkp@intel.com>
Closes: https://lore.kernel.org/all/202312040659.4pJpMafN-lkp@intel.com/
Fixes: 6b252cf42281 ("drm/nouveau: nvkm/vmm: implement raw ops to manage uvmm")
Signed-off-by: Fanhua Li <lifanhua5@huawei.com>
---
 drivers/gpu/drm/nouveau/nvif/vmm.c | 3 ++-
 1 file changed, 2 insertions(+), 1 deletion(-)

diff --git a/drivers/gpu/drm/nouveau/nvif/vmm.c b/drivers/gpu/drm/nouveau/nvif/vmm.c
index 99296f03371a..07c1ebc2a941 100644
--- a/drivers/gpu/drm/nouveau/nvif/vmm.c
+++ b/drivers/gpu/drm/nouveau/nvif/vmm.c
@@ -219,7 +219,8 @@ nvif_vmm_ctor(struct nvif_mmu *mmu, const char *name, s32 oclass,
 	case RAW: args->type = NVIF_VMM_V0_TYPE_RAW; break;
 	default:
 		WARN_ON(1);
-		return -EINVAL;
+		ret = -EINVAL;
+		goto done;
 	}
 
 	memcpy(args->data, argv, argc);
-- 
2.43.0

