Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 97ACD629022
	for <lists+dri-devel@lfdr.de>; Tue, 15 Nov 2022 03:54:50 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 5691510E0DE;
	Tue, 15 Nov 2022 02:54:43 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from szxga01-in.huawei.com (szxga01-in.huawei.com [45.249.212.187])
 by gabe.freedesktop.org (Postfix) with ESMTPS id E288310E0DE
 for <dri-devel@lists.freedesktop.org>; Tue, 15 Nov 2022 02:54:38 +0000 (UTC)
Received: from kwepemi500016.china.huawei.com (unknown [172.30.72.54])
 by szxga01-in.huawei.com (SkyGuard) with ESMTP id 4NB9kJ04t7zmVtl;
 Tue, 15 Nov 2022 10:54:15 +0800 (CST)
Received: from huawei.com (10.175.100.227) by kwepemi500016.china.huawei.com
 (7.221.188.220) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id 15.1.2375.31; Tue, 15 Nov
 2022 10:54:35 +0800
From: Shang XiaoJing <shangxiaojing@huawei.com>
To: <FlorianSchandinat@gmx.de>, <deller@gmx.de>, <corbet@lwn.net>,
 <sfr@canb.auug.org.au>, <linux-fbdev@vger.kernel.org>,
 <dri-devel@lists.freedesktop.org>
Subject: [PATCH -next] fbdev: via: Fix section mismatch warning in
 via_core_init()
Date: Tue, 15 Nov 2022 10:53:06 +0800
Message-ID: <20221115025306.2602-1-shangxiaojing@huawei.com>
X-Mailer: git-send-email 2.17.1
MIME-Version: 1.0
Content-Type: text/plain
X-Originating-IP: [10.175.100.227]
X-ClientProxiedBy: dggems704-chm.china.huawei.com (10.3.19.181) To
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

Due to viafb_exit() with "__exit" tag, it should not be called by the
__init function via_core_init().

WARNING: modpost: drivers/video/fbdev/via/viafb.o: section mismatch in
reference: init_module (section: .init.text) -> viafb_exit (section:
.exit.text)

Fixes: ab885d8c7e15 ("fbdev: via: Fix error in via_core_init()")
Signed-off-by: Shang XiaoJing <shangxiaojing@huawei.com>
---
 drivers/video/fbdev/via/via-core.c | 1 -
 1 file changed, 1 deletion(-)

diff --git a/drivers/video/fbdev/via/via-core.c b/drivers/video/fbdev/via/via-core.c
index b2e3b5df38cd..b8cd04defc5e 100644
--- a/drivers/video/fbdev/via/via-core.c
+++ b/drivers/video/fbdev/via/via-core.c
@@ -734,7 +734,6 @@ static int __init via_core_init(void)
 	if (ret) {
 		viafb_gpio_exit();
 		viafb_i2c_exit();
-		viafb_exit();
 		return ret;
 	}
 
-- 
2.17.1

