Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 92316550232
	for <lists+dri-devel@lfdr.de>; Sat, 18 Jun 2022 04:57:16 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 7AB7B113206;
	Sat, 18 Jun 2022 02:57:08 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from m15112.mail.126.com (m15112.mail.126.com [220.181.15.112])
 by gabe.freedesktop.org (Postfix) with ESMTP id 99187113206
 for <dri-devel@lists.freedesktop.org>; Sat, 18 Jun 2022 02:57:06 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=126.com;
 s=s110527; h=From:Subject:Date:Message-Id:MIME-Version; bh=Y2R0w
 LWoS3MlLi/kilNMf914qQrU9POFF5jg8cOKHx0=; b=LYPCGa8upCP5Yy3flrbhF
 D1nrL9Wfzi1wUM0sUooiKt8cwngQ0YCjUSOaiebuLI2yQPlmuXJ1+Z4CQe0lg0Et
 cXx/kxJP24Y8kVwPKelIMPXCRMYLrMaPc0H/4Sy3hQrlyypsKEyO2CViDmDDn9iz
 XhmCtObl+7tmlZplZNWdgI=
Received: from localhost.localdomain (unknown [124.16.139.61])
 by smtp2 (Coremail) with SMTP id DMmowAD3SATvPq1ifd5nDg--.23620S2;
 Sat, 18 Jun 2022 10:56:48 +0800 (CST)
From: Liang He <windhl@126.com>
To: deller@gmx.de,
	christophe.leroy@csgroup.eu
Subject: [PATCH] video: fbdev: Fix refcount leak bug in valkyriefb.c
Date: Sat, 18 Jun 2022 10:56:47 +0800
Message-Id: <20220618025647.4057077-1-windhl@126.com>
X-Mailer: git-send-email 2.25.1
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-CM-TRANSID: DMmowAD3SATvPq1ifd5nDg--.23620S2
X-Coremail-Antispam: 1Uf129KBjvdXoW7Jw4UJF17Jw1kWw1fCFyrCrg_yoW3Krb_uF
 1kZrZrGryUtr10gw1vgr45uryYvFWxWF1xZFn7t393Cry7Zr15Xr1Ivr1Ik34DW348GF98
 ZrnFgr10yw1S9jkaLaAFLSUrUUUUUb8apTn2vfkv8UJUUUU8Yxn0WfASr-VFAUDa7-sFnT
 9fnUUvcSsGvfC2KfnxnUUI43ZEXa7xRtLvKUUUUUU==
X-Originating-IP: [124.16.139.61]
X-CM-SenderInfo: hzlqvxbo6rjloofrz/xtbBGgEkF1-HZUnXDAAAsH
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
Cc: windhl@126.com, linux-kernel@vger.kernel.org,
 dri-devel@lists.freedesktop.org
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

In valkyriefb_init(), of_find_node_by_name() will return a node pointer
with refcount incremented. We should use of_node_put() in fail path or
when it is not used anymore.

Signed-off-by: Liang He <windhl@126.com>
---
 drivers/video/fbdev/valkyriefb.c | 3 +++
 1 file changed, 3 insertions(+)

diff --git a/drivers/video/fbdev/valkyriefb.c b/drivers/video/fbdev/valkyriefb.c
index a6c9d4f26669..20d727a8069d 100644
--- a/drivers/video/fbdev/valkyriefb.c
+++ b/drivers/video/fbdev/valkyriefb.c
@@ -334,10 +334,13 @@ int __init valkyriefb_init(void)
 			return 0;
 
 		if (of_address_to_resource(dp, 0, &r)) {
+			of_node_put(dp);
 			printk(KERN_ERR "can't find address for valkyrie\n");
 			return 0;
 		}
 
+		of_node_put(dp);
+
 		frame_buffer_phys = r.start;
 		cmap_regs_phys = r.start + 0x304000;
 	}
-- 
2.25.1

