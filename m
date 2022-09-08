Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id C7E425B260A
	for <lists+dri-devel@lfdr.de>; Thu,  8 Sep 2022 20:44:03 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 880AE10EBB2;
	Thu,  8 Sep 2022 18:43:52 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from m12-18.163.com (m12-18.163.com [220.181.12.18])
 by gabe.freedesktop.org (Postfix) with ESMTP id A743E10EBB2
 for <dri-devel@lists.freedesktop.org>; Thu,  8 Sep 2022 18:43:48 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=163.com;
 s=s110527; h=From:Subject:Date:Message-Id:MIME-Version; bh=VLk+4
 dXxapQmWBdTRbZy57Jgwx0nYoiESWlgu108ej0=; b=jcifshi5YglJz/5vXVt6N
 75pxlzlIRif1JAU0hC6K7tLgA15nmBNnyf3JtEYSaZ2LgIUwIU4upzjTJ2Tdpar0
 O6JiJGURah7lrEWQnZlCts9FuPAuI7Dqpyqc5EVSEQhCtvk1XsGp31HShjE9HhEQ
 deKOCYGnUY9Eu+YNpYykT8=
Received: from f00160-VMware-Virtual-Platform.localdomain (unknown
 [1.203.67.201])
 by smtp14 (Coremail) with SMTP id EsCowACnZQJWNxpjnWENEg--.58041S4;
 Fri, 09 Sep 2022 02:41:34 +0800 (CST)
From: Jingyu Wang <jingyuwang_vip@163.com>
To: maarten.lankhorst@linux.intel.com, mripard@kernel.org, tzimmermann@suse.de,
 airlied@linux.ie, daniel@ffwll.ch
Subject: [PATCH] drm: remove unnecessary conditionals
Date: Fri,  9 Sep 2022 02:41:22 +0800
Message-Id: <20220908184122.76272-1-jingyuwang_vip@163.com>
X-Mailer: git-send-email 2.34.1
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-CM-TRANSID: EsCowACnZQJWNxpjnWENEg--.58041S4
X-Coremail-Antispam: 1Uf129KBjvdXoWrtrWfAF1kGr1fuF1fKFWDXFb_yoW3Crb_G3
 W8XrWqqr4Du3yqvrsxAF13ZFyjya1Dur4fWryqqasIyrnrXrnrZr9rXrykZw1UGa17CF9x
 u3WxJr1fAFn2gjkaLaAFLSUrUUUUUb8apTn2vfkv8UJUUUU8Yxn0WfASr-VFAUDa7-sFnT
 9fnUUvcSsGvfC2KfnxnUUI43ZEXa7sRib11tUUUUU==
X-Originating-IP: [1.203.67.201]
X-CM-SenderInfo: 5mlqw5xxzd0whbyl1qqrwthudrp/xtbBaR52F1Xly449FAAAsK
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
Cc: Jingyu Wang <jingyuwang_vip@163.com>, linux-kernel@vger.kernel.org,
 dri-devel@lists.freedesktop.org
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

iput() has already handled null and non-null parameter, so it is no
need to use if().

Signed-off-by: Jingyu Wang <jingyuwang_vip@163.com>
---
 drivers/gpu/drm/drm_drv.c | 6 ++----
 1 file changed, 2 insertions(+), 4 deletions(-)

diff --git a/drivers/gpu/drm/drm_drv.c b/drivers/gpu/drm/drm_drv.c
index 8214a0b1ab7f..beec45a89ca5 100644
--- a/drivers/gpu/drm/drm_drv.c
+++ b/drivers/gpu/drm/drm_drv.c
@@ -530,10 +530,8 @@ static struct inode *drm_fs_inode_new(void)
 
 static void drm_fs_inode_free(struct inode *inode)
 {
-	if (inode) {
-		iput(inode);
-		simple_release_fs(&drm_fs_mnt, &drm_fs_cnt);
-	}
+	iput(inode);
+	simple_release_fs(&drm_fs_mnt, &drm_fs_cnt);
 }
 
 /**

base-commit: 5957ac6635a1a12d4aa2661bbf04d3085a73372a
-- 
2.34.1

