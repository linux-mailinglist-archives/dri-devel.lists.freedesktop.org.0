Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 16E35387D4F
	for <lists+dri-devel@lfdr.de>; Tue, 18 May 2021 18:24:30 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 4CCA66EC2E;
	Tue, 18 May 2021 16:24:27 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
X-Greylist: delayed 455 seconds by postgrey-1.36 at gabe;
 Tue, 18 May 2021 10:35:05 UTC
Received: from vps5.brixit.nl (vps5.brixit.nl [192.81.221.234])
 by gabe.freedesktop.org (Postfix) with ESMTPS id C5CDC6E869
 for <dri-devel@lists.freedesktop.org>; Tue, 18 May 2021 10:35:05 +0000 (UTC)
Received: from localhost.localdomain (unknown [77.239.252.99])
 (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
 (No client certificate requested)
 by vps5.brixit.nl (Postfix) with ESMTPSA id 1A3F56075F;
 Tue, 18 May 2021 10:27:28 +0000 (UTC)
From: Alexey Minnekhanov <alexeymin@postmarketos.org>
To: Rob Clark <robdclark@gmail.com>, Sean Paul <sean@poorly.run>,
 David Airlie <airlied@linux.ie>, Daniel Vetter <daniel@ffwll.ch>,
 linux-arm-msm@vger.kernel.org (open list:DRM DRIVER FOR MSM ADRENO GPU),
 dri-devel@lists.freedesktop.org (open list:DRM DRIVER FOR MSM ADRENO GPU),
 freedreno@lists.freedesktop.org (open list:DRM DRIVER FOR MSM ADRENO GPU),
 linux-kernel@vger.kernel.org (open list)
Subject: [PATCH] drm/msm: Init mm_list before accessing it for use_vram path
Date: Tue, 18 May 2021 13:26:24 +0300
Message-Id: <20210518102624.1193955-1-alexeymin@postmarketos.org>
X-Mailer: git-send-email 2.26.3
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Mailman-Approved-At: Tue, 18 May 2021 16:24:25 +0000
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
Cc: Alexey Minnekhanov <alexeymin@postmarketos.org>,
 ~postmarketos/upstreaming@lists.sr.ht
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

Fix NULL pointer dereference caused by update_inactive()
trying to list_del() an uninitialized mm_list who's
prev/next pointers are NULL.

Signed-off-by: Alexey Minnekhanov <alexeymin@postmarketos.org>
---
 drivers/gpu/drm/msm/msm_gem.c | 7 +++++++
 1 file changed, 7 insertions(+)

diff --git a/drivers/gpu/drm/msm/msm_gem.c b/drivers/gpu/drm/msm/msm_gem.c
index b199942266a26..b8c873fc63a78 100644
--- a/drivers/gpu/drm/msm/msm_gem.c
+++ b/drivers/gpu/drm/msm/msm_gem.c
@@ -1227,6 +1227,13 @@ static struct drm_gem_object *_msm_gem_new(struct drm_device *dev,
 
 		to_msm_bo(obj)->vram_node = &vma->node;
 
+		/* Call chain get_pages() -> update_inactive() tries to
+		 * access msm_obj->mm_list, but it is not initialized yet.
+		 * To avoid NULL pointer dereference error, initialize
+		 * mm_list to be empty.
+		 */
+		INIT_LIST_HEAD(&msm_obj->mm_list);
+
 		msm_gem_lock(obj);
 		pages = get_pages(obj);
 		msm_gem_unlock(obj);
-- 
2.26.3

