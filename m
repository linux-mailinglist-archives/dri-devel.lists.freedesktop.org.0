Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 5326A7FD37A
	for <lists+dri-devel@lfdr.de>; Wed, 29 Nov 2023 11:03:47 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 97D4F10E3F4;
	Wed, 29 Nov 2023 10:03:45 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
X-Greylist: delayed 915 seconds by postgrey-1.36 at gabe;
 Wed, 29 Nov 2023 10:03:42 UTC
Received: from m12.mail.163.com (m12.mail.163.com [220.181.12.199])
 by gabe.freedesktop.org (Postfix) with ESMTP id 74C7510E3F4
 for <dri-devel@lists.freedesktop.org>; Wed, 29 Nov 2023 10:03:42 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=163.com;
 s=s110527; h=From:Subject:Date:Message-Id; bh=cFhWHU+t6DMgtDwgJl
 Z5+l4vJs2Iv3SA9Vi8myA7sUY=; b=nJ8bLVUQzElbyTd75mz7qF6ggFYzxuCUE9
 rBzRKyvQdch5T5D6mR4xhhP+d6+RUhzH/Ve+sJjkYI+bdLN0YciVROJkuUQA/lwT
 p5/mQSV9f85FtJAkKAFMdSS3apiD58njLT3GHLYp3Ur2C4XReiMxHLyNMQX99Vgi
 njhPVc+m0=
Received: from localhost.localdomain (unknown [39.144.190.126])
 by zwqz-smtp-mta-g3-4 (Coremail) with SMTP id _____wDn79nRCGdl0DYUBQ--.7696S2; 
 Wed, 29 Nov 2023 17:48:02 +0800 (CST)
From: Haoran Liu <liuhaoran14@163.com>
To: alain.volmat@foss.st.com
Subject: [PATCH] [drm/sti] sti_compositor: Add error handlingin
 sti_compositor_bind
Date: Wed, 29 Nov 2023 01:47:59 -0800
Message-Id: <20231129094759.32799-1-liuhaoran14@163.com>
X-Mailer: git-send-email 2.17.1
X-CM-TRANSID: _____wDn79nRCGdl0DYUBQ--.7696S2
X-Coremail-Antispam: 1Uf129KBjvdXoW7Jr1rKFy8Jw47Xr4rCw4rZrb_yoWkuwb_uw
 1qyrn7Grs8CF1jvw12kr4fAFyvvrs7ua10934ktas8t3yUX3ZxZFyvgF9xZayUZ347JFnI
 qw4xWFnxury7CjkaLaAFLSUrUUUUUb8apTn2vfkv8UJUUUU8Yxn0WfASr-VFAUDa7-sFnT
 9fnUUvcSsGvfC2KfnxnUUI43ZEXa7xRt6wuUUUUUU==
X-Originating-IP: [39.144.190.126]
X-CM-SenderInfo: xolxxtxrud0iqu6rljoofrz/xtbBchI3gletj5ACowACsT
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
Cc: Haoran Liu <liuhaoran14@163.com>, tzimmermann@suse.de,
 linux-kernel@vger.kernel.org, dri-devel@lists.freedesktop.org,
 mripard@kernel.org
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

Previously, the function sti_compositor_bind did not properly
handle potential failure scenarios of drm_vblank_init, which could
lead to unexpected behavior. This update adds a check for the
return value of drm_vblank_init.

Signed-off-by: Haoran Liu <liuhaoran14@163.com>
---
 drivers/gpu/drm/sti/sti_compositor.c | 7 ++++++-
 1 file changed, 6 insertions(+), 1 deletion(-)

diff --git a/drivers/gpu/drm/sti/sti_compositor.c b/drivers/gpu/drm/sti/sti_compositor.c
index 33487a1fed8f..beddbd1c48eb 100644
--- a/drivers/gpu/drm/sti/sti_compositor.c
+++ b/drivers/gpu/drm/sti/sti_compositor.c
@@ -69,6 +69,7 @@ static int sti_compositor_bind(struct device *dev,
 	struct drm_plane *primary = NULL;
 	struct sti_compositor_subdev_descriptor *desc = compo->data.subdev_desc;
 	unsigned int array_size = compo->data.nb_subdev;
+	int ret;
 
 	dev_priv->compo = compo;
 
@@ -145,7 +146,11 @@ static int sti_compositor_bind(struct device *dev,
 		}
 	}
 
-	drm_vblank_init(drm_dev, crtc_id);
+	ret = drm_vblank_init(drm_dev, crtc_id);
+	if (ret) {
+		DRM_ERROR("Failed to initialize vblank\n");
+		return ret;
+	}
 
 	return 0;
 }
-- 
2.17.1

