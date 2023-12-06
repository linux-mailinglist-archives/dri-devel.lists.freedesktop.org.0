Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 8A106806905
	for <lists+dri-devel@lfdr.de>; Wed,  6 Dec 2023 08:57:38 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 895F610E697;
	Wed,  6 Dec 2023 07:57:28 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from zg8tndyumtaxlji0oc4xnzya.icoremail.net
 (zg8tndyumtaxlji0oc4xnzya.icoremail.net [46.101.248.176])
 by gabe.freedesktop.org (Postfix) with ESMTP id D5CBB10E68D
 for <dri-devel@lists.freedesktop.org>; Wed,  6 Dec 2023 07:45:00 +0000 (UTC)
Received: from localhost.localdomain (unknown [10.190.70.17])
 by mail-app3 (Coremail) with SMTP id cC_KCgD3_99KInBl+Mp+AA--.11318S4;
 Wed, 06 Dec 2023 15:27:11 +0800 (CST)
From: Dinghao Liu <dinghao.liu@zju.edu.cn>
To: dinghao.liu@zju.edu.cn
Subject: [PATCH] drm/plane: fix error handling in __drm_universal_plane_init
Date: Wed,  6 Dec 2023 15:27:01 +0800
Message-Id: <20231206072701.13276-1-dinghao.liu@zju.edu.cn>
X-Mailer: git-send-email 2.17.1
X-CM-TRANSID: cC_KCgD3_99KInBl+Mp+AA--.11318S4
X-Coremail-Antispam: 1UD129KBjvJXoW7tr48Jw4UuFW8GF18CF4fuFg_yoW8Gw1kpa
 1UCFyYkr1jywsrKrZrAFsFvFW3Wa1fGry7uryUZwsxK3W5Kr9xJ348Aa47CFyqkw47Ww13
 tr9xAr1DAF15Ar7anT9S1TB71UUUUUUqnTZGkaVYY2UrUUUUjbIjqfuFe4nvWSU5nxnvy2
 9KBjDU0xBIdaVrnRJUUUkI1xkIjI8I6I8E6xAIw20EY4v20xvaj40_Wr0E3s1l1IIY67AE
 w4v_Jr0_Jr4l8cAvFVAK0II2c7xJM28CjxkF64kEwVA0rcxSw2x7M28EF7xvwVC0I7IYx2
 IY67AKxVWDJVCq3wA2z4x0Y4vE2Ix0cI8IcVCY1x0267AKxVWxJr0_GcWl84ACjcxK6I8E
 87Iv67AKxVW0oVCq3wA2z4x0Y4vEx4A2jsIEc7CjxVAFwI0_GcCE3s1le2I262IYc4CY6c
 8Ij28IcVAaY2xG8wAqx4xG64xvF2IEw4CE5I8CrVC2j2WlYx0E2Ix0cI8IcVAFwI0_Jr0_
 Jr4lYx0Ex4A2jsIE14v26r1j6r4UMcvjeVCFs4IE7xkEbVWUJVW8JwACjcxG0xvY0x0EwI
 xGrwACjI8F5VA0II8E6IAqYI8I648v4I1l42xK82IYc2Ij64vIr41l42xK82IY6x8ErcxF
 aVAv8VW8uw4UJr1UMxC20s026xCaFVCjc4AY6r1j6r4UMI8I3I0E5I8CrVAFwI0_Jr0_Jr
 4lx2IqxVCjr7xvwVAFwI0_JrI_JrWlx4CE17CEb7AF67AKxVWUtVW8ZwCIc40Y0x0EwIxG
 rwCI42IY6xIIjxv20xvE14v26r1j6r1xMIIF0xvE2Ix0cI8IcVCY1x0267AKxVWUJVW8Jw
 CI42IY6xAIw20EY4v20xvaj40_Jr0_JF4lIxAIcVC2z280aVAFwI0_Jr0_Gr1lIxAIcVC2
 z280aVCY1x0267AKxVW8JVW8JrUvcSsGvfC2KfnxnUUI43ZEXa7VUbXdbUUUUUU==
X-CM-SenderInfo: qrrzjiaqtzq6lmxovvfxof0/1tbiAgoTBmVsUQg4xgAcsv
X-Mailman-Approved-At: Wed, 06 Dec 2023 07:57:25 +0000
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
Cc: Thomas Zimmermann <tzimmermann@suse.de>, linux-kernel@vger.kernel.org,
 dri-devel@lists.freedesktop.org, Maxime Ripard <mripard@kernel.org>
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

__drm_universal_plane_init() frees plane->format_types and
plane->modifiers on failure. However, sometimes its callers
will free these two pointers again, which may lead to a
double-free. One possible call chain is:

mdp5_plane_init
  |-> drm_universal_plane_init
  |     |-> __drm_universal_plane_init (first free)
  |
  |-> mdp5_plane_destroy
        |-> drm_plane_cleanup (second free)

Fix this by setting the two pointers to NULL after kfree.

Signed-off-by: Dinghao Liu <dinghao.liu@zju.edu.cn>
---
 drivers/gpu/drm/drm_plane.c | 3 +++
 1 file changed, 3 insertions(+)

diff --git a/drivers/gpu/drm/drm_plane.c b/drivers/gpu/drm/drm_plane.c
index 24e7998d1731..1331b8224920 100644
--- a/drivers/gpu/drm/drm_plane.c
+++ b/drivers/gpu/drm/drm_plane.c
@@ -304,6 +304,7 @@ static int __drm_universal_plane_init(struct drm_device *dev,
 	if (format_modifier_count && !plane->modifiers) {
 		DRM_DEBUG_KMS("out of memory when allocating plane\n");
 		kfree(plane->format_types);
+		plane->format_types = NULL;
 		drm_mode_object_unregister(dev, &plane->base);
 		return -ENOMEM;
 	}
@@ -317,6 +318,8 @@ static int __drm_universal_plane_init(struct drm_device *dev,
 	if (!plane->name) {
 		kfree(plane->format_types);
 		kfree(plane->modifiers);
+		plane->format_types = NULL;
+		plane->modifiers = NULL;
 		drm_mode_object_unregister(dev, &plane->base);
 		return -ENOMEM;
 	}
-- 
2.17.1

