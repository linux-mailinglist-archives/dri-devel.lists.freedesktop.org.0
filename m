Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id AACB75ED4FD
	for <lists+dri-devel@lfdr.de>; Wed, 28 Sep 2022 08:40:06 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 171CD10E282;
	Wed, 28 Sep 2022 06:39:58 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
X-Greylist: delayed 975 seconds by postgrey-1.36 at gabe;
 Wed, 28 Sep 2022 06:39:54 UTC
Received: from mail-m973.mail.163.com (mail-m973.mail.163.com [123.126.97.3])
 by gabe.freedesktop.org (Postfix) with ESMTP id 9BE8E10E290
 for <dri-devel@lists.freedesktop.org>; Wed, 28 Sep 2022 06:39:54 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=163.com;
 s=s110527; h=From:Subject:Date:Message-Id:MIME-Version; bh=PRqQy
 Goq9wOWzgyinUTHIHWFfyBK2VGJdHeSaidSayw=; b=SQtzEpegast2VoLmoC6v9
 9AEvPVntyyr+cyLnxxT8nOeoRWsUbqk0nTZatEgwv83GL9klT1OtUyirragTHymZ
 7ljUr7qRuAmM2ZWK+8540BytbCIy4pYhpG5PXqmO5HoX9D7c6ZybPBseg9B4CM99
 G6L4ZSyGXWPBFXT1wgF5M4=
Received: from localhost.localdomain (unknown [36.112.3.106])
 by smtp3 (Coremail) with SMTP id G9xpCgBHz4BH6DNjsnURhA--.18298S4;
 Wed, 28 Sep 2022 14:23:10 +0800 (CST)
From: Jianglei Nie <niejianglei2021@163.com>
To: gregkh@linuxfoundation.org, tzimmermann@suse.de,
 andriy.shevchenko@linux.intel.com, javierm@redhat.com, sam@ravnborg.org,
 steve@sk2.org, noralf@tronnes.org, u.kleine-koenig@pengutronix.de
Subject: [PATCH] staging: fbtft: core: fix potential memory leak in
 fbtft_probe_common()
Date: Wed, 28 Sep 2022 14:23:01 +0800
Message-Id: <20220928062301.6399-1-niejianglei2021@163.com>
X-Mailer: git-send-email 2.25.1
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-CM-TRANSID: G9xpCgBHz4BH6DNjsnURhA--.18298S4
X-Coremail-Antispam: 1Uf129KBjvdXoWrury8Ww1UtFW3WrWrXF15twb_yoWfCrXEvw
 1jvryxJrW8Cwn2kw48KFW5XFWSvr1fZr4rJFyUtas8Xay5ur15J3ykXwsxKa1Ut3yjq34S
 kr4rJr4jgw15WjkaLaAFLSUrUUUUUb8apTn2vfkv8UJUUUU8Yxn0WfASr-VFAUDa7-sFnT
 9fnUUvcSsGvfC2KfnxnUUI43ZEXa7xRKpnQ7UUUUU==
X-Originating-IP: [36.112.3.106]
X-CM-SenderInfo: xqlhyxxdqjzvrlsqjii6rwjhhfrp/1tbiPg6KjFxBuOAwbgAAst
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
Cc: Jianglei Nie <niejianglei2021@163.com>, linux-fbdev@vger.kernel.org,
 linux-staging@lists.linux.dev, linux-kernel@vger.kernel.org,
 dri-devel@lists.freedesktop.org
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

fbtft_probe_common() allocates a memory chunk for "info" with
fbtft_framebuffer_alloc(). When "display->buswidth == 0" is true, the
function returns without releasing the "info", which will lead to a
memory leak.

Fix it by calling fbtft_framebuffer_release() when "display->buswidth
== 0" is true.

Signed-off-by: Jianglei Nie <niejianglei2021@163.com>
---
 drivers/staging/fbtft/fbtft-core.c | 1 +
 1 file changed, 1 insertion(+)

diff --git a/drivers/staging/fbtft/fbtft-core.c b/drivers/staging/fbtft/fbtft-core.c
index afaba94d1d1c..ecf595aff786 100644
--- a/drivers/staging/fbtft/fbtft-core.c
+++ b/drivers/staging/fbtft/fbtft-core.c
@@ -1225,6 +1225,7 @@ int fbtft_probe_common(struct fbtft_display *display,
 
 	if (display->buswidth == 0) {
 		dev_err(dev, "buswidth is not set\n");
+		fbtft_framebuffer_release(info);
 		return -EINVAL;
 	}
 
-- 
2.25.1

