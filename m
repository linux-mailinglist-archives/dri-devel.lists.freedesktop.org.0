Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 53F36A666B2
	for <lists+dri-devel@lfdr.de>; Tue, 18 Mar 2025 04:07:03 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 0E8BE10E00C;
	Tue, 18 Mar 2025 03:07:00 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (1024-bit key; unprotected) header.d=163.com header.i=@163.com header.b="jbT7LfI6";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from m16.mail.163.com (m16.mail.163.com [117.135.210.3])
 by gabe.freedesktop.org (Postfix) with ESMTP id 06CBB10E00C
 for <dri-devel@lists.freedesktop.org>; Tue, 18 Mar 2025 03:06:50 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=163.com;
 s=s110527; h=From:Subject:Date:Message-Id:MIME-Version; bh=JBeRk
 4co3+uSwf3WyPiW0R5ciRcTZIeouYHkX7tcL/M=; b=jbT7LfI6YLXA/yB/bquep
 MIveH48+rPGOj40pF0za/gsvuHmtcpGvxupndfQDTs+cbfez/cg802SfIcC5D4uD
 BBtqGNhVODF8aQuPzHOnzIYc95vNRJiWNIOUs/y1PKfn/+ANJ1r/sQKdkkQQMPg9
 2DWal+EpPiEWpRyqorrdG8=
Received: from icess-ProLiant-DL380-Gen10.. (unknown [])
 by gzga-smtp-mtada-g0-0 (Coremail) with SMTP id
 _____wDXnt8_49hnT9OMAA--.10535S4; 
 Tue, 18 Mar 2025 11:06:40 +0800 (CST)
From: Haoxiang Li <haoxiang_li2024@163.com>
To: airlied@redhat.com
Cc: dri-devel@lists.freedesktop.org, linux-kernel@vger.kernel.org,
 Haoxiang Li <haoxiang_li2024@163.com>, stable@vger.kernel.org
Subject: [PATCH RESEND] agp: Fix a potential memory leak bug in
 agp_amdk7_probe()
Date: Tue, 18 Mar 2025 11:06:37 +0800
Message-Id: <20250318030637.1572350-1-haoxiang_li2024@163.com>
X-Mailer: git-send-email 2.25.1
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-CM-TRANSID: _____wDXnt8_49hnT9OMAA--.10535S4
X-Coremail-Antispam: 1Uf129KBjvdXoW7GF4DCF47tFyktw17JF17trb_yoWDXFb_G3
 yUAr9293s5AFW8ur1akw4F9rWF9a1rXryku3ZFgwnxAFy3Zr4xXanrWFs5WF17ursrCFy7
 t34DXr4Uuw1IyjkaLaAFLSUrUUUUjb8apTn2vfkv8UJUUUU8Yxn0WfASr-VFAUDa7-sFnT
 9fnUUvcSsGvfC2KfnxnUUI43ZEXa7sRWlkxJUUUUU==
X-Originating-IP: [183.174.60.14]
X-CM-SenderInfo: xkdr5xpdqjszblsqjki6rwjhhfrp/1tbiqAETbmfX849cAgADsF
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

Variable "bridge" is allocated by agp_alloc_bridge() and
have to be released by agp_put_bridge() if something goes
wrong. In this patch, add the missing call of agp_put_bridge()
in agp_amdk7_probe() to prevent potential memory leak bug.

Fixes: 1da177e4c3f4 ("Linux-2.6.12-rc2")
Cc: stable@vger.kernel.org
Signed-off-by: Haoxiang Li <haoxiang_li2024@163.com>
---
 drivers/char/agp/amd-k7-agp.c | 1 +
 1 file changed, 1 insertion(+)

diff --git a/drivers/char/agp/amd-k7-agp.c b/drivers/char/agp/amd-k7-agp.c
index 795c8c9ff680..40e1fc462dca 100644
--- a/drivers/char/agp/amd-k7-agp.c
+++ b/drivers/char/agp/amd-k7-agp.c
@@ -441,6 +441,7 @@ static int agp_amdk7_probe(struct pci_dev *pdev,
 			gfxcard = pci_get_class(PCI_CLASS_DISPLAY_VGA<<8, gfxcard);
 			if (!gfxcard) {
 				dev_info(&pdev->dev, "no AGP VGA controller\n");
+				agp_put_bridge(bridge);
 				return -ENODEV;
 			}
 			cap_ptr = pci_find_capability(gfxcard, PCI_CAP_ID_AGP);
-- 
2.25.1

