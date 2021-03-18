Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id B22BF33FDA6
	for <lists+dri-devel@lfdr.de>; Thu, 18 Mar 2021 04:17:04 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id A9C046E40C;
	Thu, 18 Mar 2021 03:16:59 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from m12-17.163.com (m12-17.163.com [220.181.12.17])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 4DBE16E40C
 for <dri-devel@lists.freedesktop.org>; Thu, 18 Mar 2021 03:16:57 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=163.com;
 s=s110527; h=From:Subject:Date:Message-Id:MIME-Version; bh=W12mF
 x5zwkYJm0lwqakEsOPM1rg3JP/KCo5hL6AZCko=; b=RDolLNaif5hswbP3WO+Tw
 bKbWuMeUwBBJr2h10bnsTMbGLQF90xJPH2iTzhSxeSoPrgov9f6UVvP5oYGpzqHz
 0hSBwfaqgi2N5Mv6s6KqlMAex/zll4lHFlsd54QjBoQf4WElVyyYjP3wRDdnHDqQ
 SSTM0z+vSYDHWXz/bYFZ+I=
Received: from COOL-20200911ZP.ccdomain.com (unknown [218.94.48.178])
 by smtp13 (Coremail) with SMTP id EcCowADX3JQXxlJg+FZgqg--.26427S2;
 Thu, 18 Mar 2021 11:16:49 +0800 (CST)
From: ChunyouTang <tangchunyou@163.com>
To: gustavoars@kernel.org,
	sam@ravnborg.org
Subject: [PATCH v2] drivers/video/fbdev:modify 'if (addrp == NULL)' to 'if
 (!addr)
Date: Thu, 18 Mar 2021 11:16:36 +0800
Message-Id: <20210318031636.552-1-tangchunyou@163.com>
X-Mailer: git-send-email 2.30.0.windows.1
MIME-Version: 1.0
X-CM-TRANSID: EcCowADX3JQXxlJg+FZgqg--.26427S2
X-Coremail-Antispam: 1Uf129KBjvJXoW7uF1xZFyrWFy5ZryUZw4xJFb_yoW8tw1UpF
 W5KFyFyF18Gws3WayxAFWvya42grn3tFW2yryxuw1a9a15Zr15X343G342gF9rArWrA343
 A3WDK3W8Gw4UJFJanT9S1TB71UUUUUUqnTZGkaVYY2UrUUUUjbIjqfuFe4nvWSU5nxnvy2
 9KBjDUYxBIdaVFxhVjvjDU0xZFpf9x07jxPEfUUUUU=
X-Originating-IP: [218.94.48.178]
X-CM-SenderInfo: 5wdqwu5kxq50rx6rljoofrz/xtbBRQFZUVPAKkRtgwAAsf
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
Cc: linux-fbdev@vger.kernel.org, tangchunyou@yulong.com,
 linux-kernel@vger.kernel.org, dri-devel@lists.freedesktop.org
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

From: tangchunyou <tangchunyou@yulong.com>

modify 'if (addrp == NULL)' to 'if (!addr)

Signed-off-by: tangchunyou <tangchunyou@yulong.com>
---
 drivers/video/fbdev/offb.c | 16 ++++++++--------
 1 file changed, 8 insertions(+), 8 deletions(-)

diff --git a/drivers/video/fbdev/offb.c b/drivers/video/fbdev/offb.c
index cd1042f..52d86e3 100644
--- a/drivers/video/fbdev/offb.c
+++ b/drivers/video/fbdev/offb.c
@@ -305,9 +305,9 @@ static void __iomem *offb_map_reg(struct device_node *np, int index,
 	unsigned int flags;
 
 	addrp = of_get_pci_address(np, index, &asize, &flags);
-	if (addrp == NULL)
+	if (!addrp)
 		addrp = of_get_address(np, index, &asize, &flags);
-	if (addrp == NULL)
+	if (!addrp)
 		return NULL;
 	if ((flags & (IORESOURCE_IO | IORESOURCE_MEM)) == 0)
 		return NULL;
@@ -412,7 +412,7 @@ static void __init offb_init_fb(const char *name,
 
 	info = framebuffer_alloc(sizeof(u32) * 16, NULL);
 
-	if (info == NULL) {
+	if (!info) {
 		release_mem_region(res_start, res_size);
 		return;
 	}
@@ -555,25 +555,25 @@ static void __init offb_init_nodriver(struct device_node *dp, int no_real_node)
 #endif
 
 	pp = of_get_property(dp, "linux,bootx-depth", &len);
-	if (pp == NULL)
+	if (!pp)
 		pp = of_get_property(dp, "depth", &len);
 	if (pp && len == sizeof(u32))
 		depth = be32_to_cpup(pp);
 
 	pp = of_get_property(dp, "linux,bootx-width", &len);
-	if (pp == NULL)
+	if (!pp)
 		pp = of_get_property(dp, "width", &len);
 	if (pp && len == sizeof(u32))
 		width = be32_to_cpup(pp);
 
 	pp = of_get_property(dp, "linux,bootx-height", &len);
-	if (pp == NULL)
+	if (!pp)
 		pp = of_get_property(dp, "height", &len);
 	if (pp && len == sizeof(u32))
 		height = be32_to_cpup(pp);
 
 	pp = of_get_property(dp, "linux,bootx-linebytes", &len);
-	if (pp == NULL)
+	if (!pp)
 		pp = of_get_property(dp, "linebytes", &len);
 	if (pp && len == sizeof(u32) && (*pp != 0xffffffffu))
 		pitch = be32_to_cpup(pp);
@@ -593,7 +593,7 @@ static void __init offb_init_nodriver(struct device_node *dp, int no_real_node)
 	 * the "address" property. If none match, we pick the biggest
 	 */
 	up = of_get_property(dp, "linux,bootx-addr", &len);
-	if (up == NULL)
+	if (!up)
 		up = of_get_property(dp, "address", &len);
 	if (up && len == sizeof(u32))
 		addr_prop = *up;
-- 
1.9.1


_______________________________________________
dri-devel mailing list
dri-devel@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/dri-devel
