Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id AE0DD46EEC5
	for <lists+dri-devel@lfdr.de>; Thu,  9 Dec 2021 17:58:34 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 4E19E10E967;
	Thu,  9 Dec 2021 16:53:47 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
X-Greylist: delayed 1173 seconds by postgrey-1.36 at gabe;
 Thu, 09 Dec 2021 09:20:53 UTC
Received: from szxga08-in.huawei.com (szxga08-in.huawei.com [45.249.212.255])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 57F9489169
 for <dri-devel@lists.freedesktop.org>; Thu,  9 Dec 2021 09:20:53 +0000 (UTC)
Received: from canpemm500007.china.huawei.com (unknown [172.30.72.55])
 by szxga08-in.huawei.com (SkyGuard) with ESMTP id 4J8nxr74yJz1DJyF;
 Thu,  9 Dec 2021 16:58:24 +0800 (CST)
Received: from localhost (10.174.179.215) by canpemm500007.china.huawei.com
 (7.192.104.62) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id 15.1.2308.20; Thu, 9 Dec
 2021 17:01:16 +0800
From: YueHaibing <yuehaibing@huawei.com>
To: <sam@ravnborg.org>, <b.zolnierkie@samsung.com>
Subject: [PATCH -next] video: fbdev: controlfb: Fix COMPILE_TEST build
Date: Thu, 9 Dec 2021 17:01:13 +0800
Message-ID: <20211209090113.37756-1-yuehaibing@huawei.com>
X-Mailer: git-send-email 2.10.2.windows.1
MIME-Version: 1.0
Content-Type: text/plain
X-Originating-IP: [10.174.179.215]
X-ClientProxiedBy: dggems705-chm.china.huawei.com (10.3.19.182) To
 canpemm500007.china.huawei.com (7.192.104.62)
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
Cc: linux-fbdev@vger.kernel.org, YueHaibing <yuehaibing@huawei.com>,
 linux-kernel@vger.kernel.org, dri-devel@lists.freedesktop.org
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

If PPC_BOOK3S, PPC_PMAC and PPC32 is n, COMPILE_TEST build fails:

drivers/video/fbdev/controlfb.c:70:0: error: "pgprot_cached_wthru" redefined [-Werror]
 #define pgprot_cached_wthru(prot) (prot)

In file included from ./arch/powerpc/include/asm/pgtable.h:20:0,
                 from ./include/linux/pgtable.h:6,
                 from ./include/linux/mm.h:33,
                 from drivers/video/fbdev/controlfb.c:37:
./arch/powerpc/include/asm/nohash/pgtable.h:243:0: note: this is the location of the previous definition
 #define pgprot_cached_wthru(prot) (__pgprot((pgprot_val(prot) & ~_PAGE_CACHE_CTL) | \

Fixes: a07a63b0e24d ("video: fbdev: controlfb: add COMPILE_TEST support")
Signed-off-by: YueHaibing <yuehaibing@huawei.com>
---
 drivers/video/fbdev/controlfb.c | 2 ++
 1 file changed, 2 insertions(+)

diff --git a/drivers/video/fbdev/controlfb.c b/drivers/video/fbdev/controlfb.c
index 509311471d51..bd59e7b11ed5 100644
--- a/drivers/video/fbdev/controlfb.c
+++ b/drivers/video/fbdev/controlfb.c
@@ -67,7 +67,9 @@
 #define out_8(addr, val)	(void)(val)
 #define in_le32(addr)		0
 #define out_le32(addr, val)	(void)(val)
+#ifndef pgprot_cached_wthru
 #define pgprot_cached_wthru(prot) (prot)
+#endif
 #else
 static void invalid_vram_cache(void __force *addr)
 {
-- 
2.17.1

