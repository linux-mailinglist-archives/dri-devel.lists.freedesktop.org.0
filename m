Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 4FC4525BDD1
	for <lists+dri-devel@lfdr.de>; Thu,  3 Sep 2020 10:50:39 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id E65246E5A0;
	Thu,  3 Sep 2020 08:50:16 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from m176150.mail.qiye.163.com (m176150.mail.qiye.163.com
 [59.111.176.150])
 by gabe.freedesktop.org (Postfix) with ESMTPS id AADDE6E4A6
 for <dri-devel@lists.freedesktop.org>; Wed,  2 Sep 2020 13:16:25 +0000 (UTC)
Received: from vivo.com (wm-10.qy.internal [127.0.0.1])
 by m176150.mail.qiye.163.com (Hmail) with ESMTP id 6F7961A3510;
 Wed,  2 Sep 2020 21:15:46 +0800 (CST)
Message-ID: <AAcACwD5DZmWG17*Ufm844pi.1.1599052546447.Hmail.bernard@vivo.com>
To: David Airlie <airlied@linux.ie>, Daniel Vetter <daniel@ffwll.ch>, 
 Bernard Zhao <bernard@vivo.com>, dri-devel@lists.freedesktop.org, 
 linux-kernel@vger.kernel.org
Subject: =?UTF-8?B?W3JlLXNlbmRdW1BBVENIXSBkcm0vdmlhOiByZWR1Y2Ugbm8gbmVlZCBtdXRleF9sb2NrIGFyZWE=?=
X-Priority: 3
X-Mailer: HMail Webmail Server V2.0 Copyright (c) 2016-163.com
X-Originating-IP: 157.0.31.124
MIME-Version: 1.0
Received: from bernard@vivo.com( [157.0.31.124) ] by ajax-webmail (
 [127.0.0.1] ) ; Wed, 2 Sep 2020 21:15:46 +0800 (GMT+08:00)
From: Bernard <bernard@vivo.com>
Date: Wed, 2 Sep 2020 21:15:46 +0800 (GMT+08:00)
X-HM-Spam-Status: e1kfGhgUHx5ZQUpXWQgYFAkeWUFZS1VLWVdZKFlBSE83V1ktWUFJV1kPCR
 oVCBIfWUFZHhpOSkJPTB1LH01CVkpOQkJLTklOT01OSklVEwETFhoSFyQUDg9ZV1kWGg8SFR0UWU
 FZT0tIVUpKS0hKQ1VKS0tZBg++
X-HM-Sender-Digest: e1kMHhlZQQ8JDh5XWRIfHhUPWUFZRzo6GDo4DD9OPyEWLDxKTFEuHRZD
 T08LElVKVUpOQkJLTklOT01CS0NVMxYaEhdVGR4JFRoJHzsNEg0UVRgUFkVZV1kSC1lBWUpOTFVL
 VUhKVUpJT1lXWQgBWUFJTE1JNwY+
X-HM-Tid: 0a744ef5819c93b4kuws6f7961a3510
X-Mailman-Approved-At: Thu, 03 Sep 2020 08:50:07 +0000
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
Cc: opensource.kernel@vivo.com
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

In function via_mem_alloc`s error branch, DRM_ERROR is protected
in the mutex_lock(&dev->struct_mutex) area.
From the code, we see that DRM_ERROR is just an error log print
without any struct element, there is no need to protect this.

Signed-off-by: Bernard Zhao <bernard@vivo.com>
---
 drivers/gpu/drm/via/via_mm.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/drivers/gpu/drm/via/via_mm.c b/drivers/gpu/drm/via/via_mm.c
index 45cc9e900260..dae1bacd86c1 100644
--- a/drivers/gpu/drm/via/via_mm.c
+++ b/drivers/gpu/drm/via/via_mm.c
@@ -129,9 +129,9 @@ int via_mem_alloc(struct drm_device *dev, void *data,
 	mutex_lock(&dev->struct_mutex);
 	if (0 == ((mem->type == VIA_MEM_VIDEO) ? dev_priv->vram_initialized :
 		      dev_priv->agp_initialized)) {
+		mutex_unlock(&dev->struct_mutex);
 		DRM_ERROR
 		    ("Attempt to allocate from uninitialized memory manager.\n");
-		mutex_unlock(&dev->struct_mutex);
 		return -EINVAL;
 	}
 
-- 
2.26.2



_______________________________________________
dri-devel mailing list
dri-devel@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/dri-devel
