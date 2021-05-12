Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 3E43837BC51
	for <lists+dri-devel@lfdr.de>; Wed, 12 May 2021 14:12:30 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id AAEC46EB86;
	Wed, 12 May 2021 12:12:26 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
X-Greylist: delayed 422 seconds by postgrey-1.36 at gabe;
 Wed, 12 May 2021 12:04:05 UTC
Received: from lucky1.263xmail.com (lucky1.263xmail.com [211.157.147.135])
 by gabe.freedesktop.org (Postfix) with ESMTPS id B1C596EB7C
 for <dri-devel@lists.freedesktop.org>; Wed, 12 May 2021 12:04:05 +0000 (UTC)
Received: from localhost (unknown [192.168.167.13])
 by lucky1.263xmail.com (Postfix) with ESMTP id 89558AC626;
 Wed, 12 May 2021 19:56:59 +0800 (CST)
X-MAIL-GRAY: 0
X-MAIL-DELIVERY: 1
X-ADDR-CHECKED4: 1
X-ANTISPAM-LEVEL: 2
X-ABS-CHECKED: 0
Received: from localhost.localdomain (unknown [124.126.19.250])
 by smtp.263.net (postfix) whith ESMTP id
 P1748T140588825409280S1620820610980711_; 
 Wed, 12 May 2021 19:57:01 +0800 (CST)
X-IP-DOMAINF: 1
X-UNIQUE-TAG: <794a1de435a0a63d4553be8fcf03f0c0>
X-RL-SENDER: penghaob@uniontech.com
X-SENDER: penghaob@uniontech.com
X-LOGIN-NAME: penghaob@uniontech.com
X-FST-TO: rodrigosiqueiramelo@gmail.com
X-RCPT-COUNT: 8
X-SENDER-IP: 124.126.19.250
X-ATTACHMENT-NUM: 0
X-System-Flag: 0
From: Hao Peng <penghaob@uniontech.com>
To: rodrigosiqueiramelo@gmail.com, melissa.srw@gmail.com,
 hamohammed.sa@gmail.com, daniel@ffwll.ch, airlied@linux.ie
Subject: [PATCH] drm:vkms: Add NULL value after free function In function
 vkms_exit, after kfree(default_config),
 give specific NULL value to pointer default_config to avoid wild pointer.
Date: Wed, 12 May 2021 19:55:54 +0800
Message-Id: <20210512115554.10431-1-penghaob@uniontech.com>
X-Mailer: git-send-email 2.20.1
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Mailman-Approved-At: Wed, 12 May 2021 12:12:25 +0000
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
Cc: Hao Peng <penghaob@uniontech.com>, linux-kernel@vger.kernel.org,
 dri-devel@lists.freedesktop.org
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

Signed-off-by: Hao Peng <penghaob@uniontech.com>
---
 drivers/gpu/drm/vkms/vkms_drv.c | 1 +
 1 file changed, 1 insertion(+)

diff --git a/drivers/gpu/drm/vkms/vkms_drv.c b/drivers/gpu/drm/vkms/vkms_drv.c
index 2173b82606f6..6c63201db5d0 100644
--- a/drivers/gpu/drm/vkms/vkms_drv.c
+++ b/drivers/gpu/drm/vkms/vkms_drv.c
@@ -227,6 +227,7 @@ static void __exit vkms_exit(void)
 		vkms_destroy(default_config);
 
 	kfree(default_config);
+	default_config = NULL;
 }
 
 module_init(vkms_init);
-- 
2.20.1



