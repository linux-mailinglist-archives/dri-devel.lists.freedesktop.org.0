Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id A7689AAF5FD
	for <lists+dri-devel@lfdr.de>; Thu,  8 May 2025 10:49:07 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id AE6DC10E1BA;
	Thu,  8 May 2025 08:49:04 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (1024-bit key; unprotected) header.d=163.com header.i=@163.com header.b="H9M6ArdX";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from m16.mail.163.com (m16.mail.163.com [220.197.31.5])
 by gabe.freedesktop.org (Postfix) with ESMTP id 9769910E1BA
 for <dri-devel@lists.freedesktop.org>; Thu,  8 May 2025 08:49:02 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=163.com;
 s=s110527; h=From:To:Subject:Date:Message-ID:MIME-Version; bh=6/
 GBVBQrueQTOo52t7yMjK40fijXSgB6E0CqsPdt1Mk=; b=H9M6ArdXIQYy2OgWxL
 eBFybNt83os07Zjnn9xx1GBmZiOdeJHiWRWwl8/A98oPdkOvgSh9u5gyXKXAlKF6
 1GYmPJegOWzzEI67d6GMPCTY2ey9gbHhTb+qeKfYBnuICW8bGyV7G1NPN2cTZ5O6
 e16cKUZ8yziYwMhs0D80iooVE=
Received: from ProDesk.. (unknown [])
 by gzsmtp2 (Coremail) with SMTP id PSgvCgBXPpLNbxxo9EHWDA--.1700S2;
 Thu, 08 May 2025 16:48:16 +0800 (CST)
From: Andy Yan <andyshrk@163.com>
To: tzimmermann@suse.de
Cc: simona@ffwll.ch, mripard@kernel.org, dri-devel@lists.freedesktop.org,
 linux-kernel@vger.kernel.org, Andy Yan <andyshrk@163.com>
Subject: [PATCH] drm/gem-framebuffer: log errors when gem size < afbc_size
Date: Thu,  8 May 2025 16:47:57 +0800
Message-ID: <20250508084811.2472877-1-andyshrk@163.com>
X-Mailer: git-send-email 2.43.0
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-CM-TRANSID: PSgvCgBXPpLNbxxo9EHWDA--.1700S2
X-Coremail-Antispam: 1Uf129KBjvdXoWrKr4UGw4ftF48Cryftr4rGrg_yoWfXFc_Ca
 4xWr1DWw43CFyDZFs7ArZFy3s2yanY9Fs5Wa1Ygay3tr1UZw15JFyIqw45Gr1UJ3W3XryD
 Z3ZrZrWfAr1xujkaLaAFLSUrUUUUjb8apTn2vfkv8UJUUUU8Yxn0WfASr-VFAUDa7-sFnT
 9fnUUvcSsGvfC2KfnxnUUI43ZEXa7xRX0el7UUUUU==
X-Originating-IP: [58.22.7.114]
X-CM-SenderInfo: 5dqg52xkunqiywtou0bp/1tbiqBNHXmgcbek6oAAAsI
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

Let the user know what went wrong in drm_gem_fb_afbc_init
failure paths.

Signed-off-by: Andy Yan <andyshrk@163.com>
---

 drivers/gpu/drm/drm_gem_framebuffer_helper.c | 5 ++++-
 1 file changed, 4 insertions(+), 1 deletion(-)

diff --git a/drivers/gpu/drm/drm_gem_framebuffer_helper.c b/drivers/gpu/drm/drm_gem_framebuffer_helper.c
index 6f72e7a0f427..baf99a68bdb5 100644
--- a/drivers/gpu/drm/drm_gem_framebuffer_helper.c
+++ b/drivers/gpu/drm/drm_gem_framebuffer_helper.c
@@ -607,8 +607,11 @@ int drm_gem_fb_afbc_init(struct drm_device *dev,
 	if (ret < 0)
 		return ret;
 
-	if (objs[0]->size < afbc_fb->afbc_size)
+	if (objs[0]->size < afbc_fb->afbc_size) {
+		drm_dbg_kms(dev, "GEM object size (%zu) smaller than minimum afbc size (%u)\n",
+			    objs[0]->size, afbc_fb->afbc_size);
 		return -EINVAL;
+	}
 
 	return 0;
 }
-- 
2.43.0

