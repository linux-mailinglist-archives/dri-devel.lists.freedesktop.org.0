Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id AD4223A2671
	for <lists+dri-devel@lfdr.de>; Thu, 10 Jun 2021 10:19:27 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 35A1F6E52C;
	Thu, 10 Jun 2021 08:19:24 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from szxga02-in.huawei.com (szxga02-in.huawei.com [45.249.212.188])
 by gabe.freedesktop.org (Postfix) with ESMTPS id A8A036E866;
 Thu, 10 Jun 2021 08:19:22 +0000 (UTC)
Received: from dggeme758-chm.china.huawei.com (unknown [172.30.72.53])
 by szxga02-in.huawei.com (SkyGuard) with ESMTP id 4G0xdB6w0Cz6xDF;
 Thu, 10 Jun 2021 16:16:14 +0800 (CST)
Received: from huawei.com (10.67.174.47) by dggeme758-chm.china.huawei.com
 (10.3.19.104) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id 15.1.2176.2; Thu, 10
 Jun 2021 16:19:19 +0800
From: He Ying <heying24@huawei.com>
To: <alexander.deucher@amd.com>, <christian.koenig@amd.com>,
 <Xinhui.Pan@amd.com>, <airlied@linux.ie>, <daniel@ffwll.ch>,
 <airlied@redhat.com>, <bskeggs@redhat.com>, <matthew.auld@intel.com>,
 <Ramesh.Errabolu@amd.com>, <mchehab+huawei@kernel.org>, <Dennis.Li@amd.com>,
 <funfunctor@folklore1984.net>
Subject: [PATCH -next] drm/amdgpu: Use DIV_ROUND_UP_ULL instead of DIV_ROUND_UP
Date: Thu, 10 Jun 2021 04:20:05 -0400
Message-ID: <20210610082005.86876-1-heying24@huawei.com>
X-Mailer: git-send-email 2.17.1
MIME-Version: 1.0
Content-Type: text/plain
X-Originating-IP: [10.67.174.47]
X-ClientProxiedBy: dggems706-chm.china.huawei.com (10.3.19.183) To
 dggeme758-chm.china.huawei.com (10.3.19.104)
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
Cc: heying24@huawei.com, dri-devel@lists.freedesktop.org,
 amd-gfx@lists.freedesktop.org, linux-kernel@vger.kernel.org
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

When compiling the kernel for MIPS with CONFIG_DRM_AMDGPU = y, errors are
encountered as follows:

drivers/gpu/drm/amd/amdgpu/amdgpu_vram_mgr.o: In function `amdgpu_vram_mgr_new':
amdgpu_vram_mgr.c:(.text+0x740): undefined reference to `__udivdi3'

Making a 64 bit division by a/b (a is uint64_t) is not supported by default
in linux kernel space. Instead, using do_div is OK for this situation. For
this problem, using DIV_ROUND_UP_ULL instead of DIV_ROUND_UP is better.

Fixes: 6a7f76e70fac ("drm/amdgpu: add VRAM manager v2")
Reported-by: Hulk Robot <hulkci@huawei.com>
Signed-off-by: He Ying <heying24@huawei.com>
---
 drivers/gpu/drm/amd/amdgpu/amdgpu_vram_mgr.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/drivers/gpu/drm/amd/amdgpu/amdgpu_vram_mgr.c b/drivers/gpu/drm/amd/amdgpu/amdgpu_vram_mgr.c
index 9a6df02477ce..436ec246a7da 100644
--- a/drivers/gpu/drm/amd/amdgpu/amdgpu_vram_mgr.c
+++ b/drivers/gpu/drm/amd/amdgpu/amdgpu_vram_mgr.c
@@ -407,7 +407,7 @@ static int amdgpu_vram_mgr_new(struct ttm_resource_manager *man,
 #endif
 		pages_per_node = max_t(uint32_t, pages_per_node,
 				       tbo->page_alignment);
-		num_nodes = DIV_ROUND_UP(PFN_UP(mem_bytes), pages_per_node);
+		num_nodes = DIV_ROUND_UP_ULL(PFN_UP(mem_bytes), pages_per_node);
 	}
 
 	node = kvmalloc(struct_size(node, mm_nodes, num_nodes),
-- 
2.17.1

