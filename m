Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 3EA7B2E2B05
	for <lists+dri-devel@lfdr.de>; Fri, 25 Dec 2020 10:43:50 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id DA00F89C97;
	Fri, 25 Dec 2020 09:42:17 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
X-Greylist: delayed 1908 seconds by postgrey-1.36 at gabe;
 Fri, 25 Dec 2020 03:37:32 UTC
Received: from mail-m965.mail.126.com (mail-m965.mail.126.com [123.126.96.5])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 53B5B895C1
 for <dri-devel@lists.freedesktop.org>; Fri, 25 Dec 2020 03:37:32 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=126.com;
 s=s110527; h=From:Subject:Date:Message-Id; bh=Nw5xV856oasZ0yZ8Qa
 S2cPa7Iztpyngt2ba/DsSD//k=; b=RJFY6CovY0aG9kNSIQeMmC7oNLS50HdIG2
 dnoqh/uAf4JJ20fCc0Lpuc2s8VQIqrckSK5ZunOXAdWkU3xoC/uc7JKHns8qYXsM
 NNsDeG5gha7yF0lKjloL0P63GjvDHcwU8Dh8BTVcQTHWux8I5R2G0E3ozgDhmAYB
 7Fc7xWMYg=
Received: from localhost.localdomain (unknown [36.112.86.14])
 by smtp10 (Coremail) with SMTP id NuRpCgD3_iIAV+VfaArNiQ--.28060S2;
 Fri, 25 Dec 2020 11:05:37 +0800 (CST)
From: Defang Bo <bodefang@126.com>
To: 603571786@qq.com, tomi.valkeinen@ti.com, airlied@linux.ie,
 dri-devel@lists.freedesktop.org, linux-kernel@vger.kernel.org
Subject: [PATCH] drm/omapdrm: don't deref error pointer in the
 omap_fbdev_create error path
Date: Fri, 25 Dec 2020 11:05:29 +0800
Message-Id: <1608865530-2166206-1-git-send-email-bodefang@126.com>
X-Mailer: git-send-email 2.7.4
X-CM-TRANSID: NuRpCgD3_iIAV+VfaArNiQ--.28060S2
X-Coremail-Antispam: 1Uf129KBjvdXoWrtryUKw18tr13GryktFW8WFg_yoWkZFX_W3
 4kurn3J3W2kF17Cr13AayqvrWIk3W3Zr4rJw48Kan3Gry3u3WrXFW3Zr9rXrWrXF4UWr95
 Cwn7JrZ8J34xGjkaLaAFLSUrUUUUUb8apTn2vfkv8UJUUUU8Yxn0WfASr-VFAUDa7-sFnT
 9fnUUvcSsGvfC2KfnxnUUI43ZEXa7IUb2Q6JUUUUU==
X-Originating-IP: [36.112.86.14]
X-CM-SenderInfo: pergvwxdqjqiyswou0bp/1tbikgEG11pECE0KAwAAsQ
X-Mailman-Approved-At: Fri, 25 Dec 2020 09:42:09 +0000
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
Cc: bodefang <bodefang@126.com>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

From: bodefang <bodefang@126.com>

Similar to commit <789d4c300>("drm/msm: don't deref error pointer in the msm_fbdev_create error path")
the error pointer returned by omap_framebuffer_init gets passed to drm_framebuffer_remove.
The latter handles only Null pointers,thus a nasty crash will occur.

Signed-off-by: bodefang <bodefang@126.com>
---
 drivers/gpu/drm/omapdrm/omap_fbdev.c | 8 ++------
 1 file changed, 2 insertions(+), 6 deletions(-)

diff --git a/drivers/gpu/drm/omapdrm/omap_fbdev.c b/drivers/gpu/drm/omapdrm/omap_fbdev.c
index 3f6cfc2..372afd4 100644
--- a/drivers/gpu/drm/omapdrm/omap_fbdev.c
+++ b/drivers/gpu/drm/omapdrm/omap_fbdev.c
@@ -141,8 +141,7 @@ static int omap_fbdev_create(struct drm_fb_helper *helper,
 		 * to unref the bo:
 		 */
 		drm_gem_object_put(fbdev->bo);
-		ret = PTR_ERR(fb);
-		goto fail;
+		return PTR_ERR(fb);
 	}
 
 	/* note: this keeps the bo pinned.. which is perhaps not ideal,
@@ -200,10 +199,7 @@ static int omap_fbdev_create(struct drm_fb_helper *helper,
 
 fail:
 
-	if (ret) {
-		if (fb)
-			drm_framebuffer_remove(fb);
-	}
+	drm_framebuffer_remove(fb);
 
 	return ret;
 }
-- 
2.7.4

_______________________________________________
dri-devel mailing list
dri-devel@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/dri-devel
