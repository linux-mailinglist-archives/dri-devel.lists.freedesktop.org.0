Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id C9D27122F52
	for <lists+dri-devel@lfdr.de>; Tue, 17 Dec 2019 15:52:47 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 96E406EA09;
	Tue, 17 Dec 2019 14:52:37 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from bhuna.collabora.co.uk (bhuna.collabora.co.uk
 [IPv6:2a00:1098:0:82:1000:25:2eeb:e3e3])
 by gabe.freedesktop.org (Postfix) with ESMTPS id ABAC96EA01
 for <dri-devel@lists.freedesktop.org>; Tue, 17 Dec 2019 14:52:25 +0000 (UTC)
Received: from [127.0.0.1] (localhost [127.0.0.1])
 (Authenticated sender: andrzej.p) with ESMTPSA id C923B2927DB
From: Andrzej Pietrasiewicz <andrzej.p@collabora.com>
To: dri-devel@lists.freedesktop.org
Subject: [PATCHv5 06/34] drm/komeda: Move checking src coordinates to
 komeda_fb_create
Date: Tue, 17 Dec 2019 15:49:52 +0100
Message-Id: <20191217145020.14645-7-andrzej.p@collabora.com>
X-Mailer: git-send-email 2.17.1
In-Reply-To: <20191217145020.14645-1-andrzej.p@collabora.com>
References: <20191213173350.GJ624164@phenom.ffwll.local>
 <20191217145020.14645-1-andrzej.p@collabora.com>
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
Cc: Ayan Halder <Ayan.Halder@arm.com>, kernel@collabora.com,
 David Airlie <airlied@linux.ie>, Liviu Dudau <liviu.dudau@arm.com>,
 Sandy Huang <hjc@rock-chips.com>,
 Andrzej Pietrasiewicz <andrzej.p@collabora.com>,
 James Wang <james.qian.wang@arm.com>,
 Mihail Atanassov <mihail.atanassov@arm.com>, Sean Paul <sean@poorly.run>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

Next step towards unifying afbc and non-afbc cases as much as possible.

Signed-off-by: Andrzej Pietrasiewicz <andrzej.p@collabora.com>
---
 .../drm/arm/display/komeda/komeda_framebuffer.c    | 14 +++++++++-----
 1 file changed, 9 insertions(+), 5 deletions(-)

diff --git a/drivers/gpu/drm/arm/display/komeda/komeda_framebuffer.c b/drivers/gpu/drm/arm/display/komeda/komeda_framebuffer.c
index 2f993a9cfb8b..5a1e5f621a8f 100644
--- a/drivers/gpu/drm/arm/display/komeda/komeda_framebuffer.c
+++ b/drivers/gpu/drm/arm/display/komeda/komeda_framebuffer.c
@@ -106,9 +106,6 @@ komeda_fb_none_afbc_size_check(struct komeda_dev *mdev, struct komeda_fb *kfb,
 	u32 i, block_h;
 	u64 min_size;
 
-	if (komeda_fb_check_src_coords(kfb, 0, 0, fb->width, fb->height))
-		return -EINVAL;
-
 	for (i = 0; i < info->num_planes; i++) {
 		obj = drm_gem_object_lookup(file, mode_cmd->handles[i]);
 		if (!obj) {
@@ -167,10 +164,17 @@ komeda_fb_create(struct drm_device *dev, struct drm_file *file,
 
 	drm_helper_mode_fill_fb_struct(dev, &kfb->base, mode_cmd);
 
-	if (kfb->base.modifier)
+	if (kfb->base.modifier) {
 		ret = komeda_fb_afbc_size_check(kfb, file, mode_cmd);
-	else
+	} else {
+		if (komeda_fb_check_src_coords(kfb, 0, 0, kfb->base.width,
+					       kfb->base.height)) {
+			kfree(kfb);
+			return ERR_PTR(-EINVAL);
+		}
+
 		ret = komeda_fb_none_afbc_size_check(mdev, kfb, file, mode_cmd);
+	}
 	if (ret < 0)
 		goto err_cleanup;
 
-- 
2.17.1

_______________________________________________
dri-devel mailing list
dri-devel@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/dri-devel
