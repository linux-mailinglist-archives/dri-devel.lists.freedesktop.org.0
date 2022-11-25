Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id B095A638579
	for <lists+dri-devel@lfdr.de>; Fri, 25 Nov 2022 09:46:25 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 6935F10E025;
	Fri, 25 Nov 2022 08:46:20 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from szxga01-in.huawei.com (szxga01-in.huawei.com [45.249.212.187])
 by gabe.freedesktop.org (Postfix) with ESMTPS id AD64410E704;
 Fri, 25 Nov 2022 06:37:40 +0000 (UTC)
Received: from kwepemi500009.china.huawei.com (unknown [172.30.72.57])
 by szxga01-in.huawei.com (SkyGuard) with ESMTP id 4NJQ6q5fFczqSdm;
 Fri, 25 Nov 2022 14:33:39 +0800 (CST)
Received: from huawei.com (10.67.175.85) by kwepemi500009.china.huawei.com
 (7.221.188.199) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id 15.1.2375.31; Fri, 25 Nov
 2022 14:37:36 +0800
From: Xia Fukun <xiafukun@huawei.com>
To: <jani.nikula@linux.intel.com>, <airlied@gmail.com>, <daniel@ffwll.ch>,
 <ville.syrjala@linux.intel.com>, <lucas.demarchi@intel.com>,
 <joonas.lahtinen@linux.intel.com>
Subject: [PATCH] drm/i915/bios: fix a memory leak in generate_lfp_data_ptrs
Date: Fri, 25 Nov 2022 14:34:28 +0800
Message-ID: <20221125063428.69486-1-xiafukun@huawei.com>
X-Mailer: git-send-email 2.17.1
MIME-Version: 1.0
Content-Type: text/plain
X-Originating-IP: [10.67.175.85]
X-ClientProxiedBy: dggems703-chm.china.huawei.com (10.3.19.180) To
 kwepemi500009.china.huawei.com (7.221.188.199)
X-CFilter-Loop: Reflected
X-Mailman-Approved-At: Fri, 25 Nov 2022 08:46:16 +0000
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
Cc: tvrtko.ursulin@linux.intel.com, intel-gfx@lists.freedesktop.org,
 linux-kernel@vger.kernel.org, dri-devel@lists.freedesktop.org,
 rodrigo.vivi@intel.com, xiafukun@huawei.com
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

When (size != 0 || ptrs->lvds_ entries != 3), the program tries to
free() the ptrs. However, the ptrs is not created by calling kzmalloc(),
but is obtained by pointer offset operation.
This may lead to memory leaks or undefined behavior.

Fix this by replacing the arguments of kfree() with ptrs_block.

Fixes: a87d0a847607 ("drm/i915/bios: Generate LFP data table pointers if the VBT lacks them")
Signed-off-by: Xia Fukun <xiafukun@huawei.com>
---
 drivers/gpu/drm/i915/display/intel_bios.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/drivers/gpu/drm/i915/display/intel_bios.c b/drivers/gpu/drm/i915/display/intel_bios.c
index 28bdb936cd1f..edbdb949b6ce 100644
--- a/drivers/gpu/drm/i915/display/intel_bios.c
+++ b/drivers/gpu/drm/i915/display/intel_bios.c
@@ -414,7 +414,7 @@ static void *generate_lfp_data_ptrs(struct drm_i915_private *i915,
 		ptrs->lvds_entries++;
 
 	if (size != 0 || ptrs->lvds_entries != 3) {
-		kfree(ptrs);
+		kfree(ptrs_block);
 		return NULL;
 	}
 
-- 
2.17.1

