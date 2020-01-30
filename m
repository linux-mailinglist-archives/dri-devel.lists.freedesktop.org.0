Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id A8F3B14E327
	for <lists+dri-devel@lfdr.de>; Thu, 30 Jan 2020 20:25:18 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 4D44A6E8E0;
	Thu, 30 Jan 2020 19:25:15 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-yb1-xb41.google.com (mail-yb1-xb41.google.com
 [IPv6:2607:f8b0:4864:20::b41])
 by gabe.freedesktop.org (Postfix) with ESMTPS id B10066E8E0
 for <dri-devel@lists.freedesktop.org>; Thu, 30 Jan 2020 19:25:14 +0000 (UTC)
Received: by mail-yb1-xb41.google.com with SMTP id o199so1948229ybc.4
 for <dri-devel@lists.freedesktop.org>; Thu, 30 Jan 2020 11:25:14 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=poorly.run; s=google;
 h=from:to:cc:subject:date:message-id:mime-version
 :content-transfer-encoding;
 bh=xqLc/hiOsciiuReeei4PXbgfrPt2jGOWmt/3LtzVX+A=;
 b=DgRjlq3+8uQ60Z4tZCeDI0XkrzyloKfvhUsMa2JS2PIDqrvsT8vNPnJKkzCFxpDXdg
 zNfMU5tYYw26ODXUUcOV+ncqGdHYZTDHZm+gplAaRAJnYla6/12srb8veAqa1itI/572
 IOL4515vgO3xWVjo4hGUHMK8NYXvRKZFHyRBg58rixOCnVQCIbJwMurKfUxZPJ6x7tpz
 csX9SZ2LSYEVMjxH4gD7ehi2IZDwfkEh9FTqBHhjhlzZTjtoyNjEQZCDIwzv5XsjgI2u
 l2WStydYRiGLfVsAawn9AUDhXHBlWmNKw2vg0OYQBcdaskTFnkStHR30VUkzGRw3eA5z
 qx9g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:mime-version
 :content-transfer-encoding;
 bh=xqLc/hiOsciiuReeei4PXbgfrPt2jGOWmt/3LtzVX+A=;
 b=USC3FCGrrBFvwA9AskbtkR7lsXf0EGlk8MLPHNFlBFAiNnrVR6ZljHLg8UamdKJ+Bw
 e/9nII0Bw2Q5YVGBXzytR9LWHiWY9oS50q9kzE0tL572gvINrv1Hc7VYsn3G+tEw/XvS
 U2aBGfrWaYfbqqVRD5M50rXpd6LqQV9r1fZLeS9/qc5TVe0epzNw8z4A7t0pbfnw7Xxn
 uKTv416om5+tWkQtk5Hj4Ll8KVmLYsZ/9j0VJfnGAmvV+bS0lvyl4M6MfFcbCRPdxk0B
 Uf5KPwrpb0DmW674CQH5TgF+CAzXjXresceEzj3ZGKBSGR5Cias/M4ue2iEPmNOBuDTb
 dDCw==
X-Gm-Message-State: APjAAAX7IrEI4tgdVFCYTiLkmUFQWnHKEt3pSpLYnfXeYs4QR0ao0Zhr
 gENfhrWt7MbeRxTUWALeHU0NzECJQ/k=
X-Google-Smtp-Source: APXvYqx+ZkhVmVEkjn3RME81x0M11aBuvdISwPw+4I0dmwSnJ11ZrG50bodS1GIP/bPXGsAVyBL5Ew==
X-Received: by 2002:a25:d74c:: with SMTP id o73mr5252636ybg.102.1580412313620; 
 Thu, 30 Jan 2020 11:25:13 -0800 (PST)
Received: from localhost ([2620:0:1013:11:1e1:4760:6ce4:fc64])
 by smtp.gmail.com with ESMTPSA id q62sm2879183ywg.76.2020.01.30.11.25.12
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Thu, 30 Jan 2020 11:25:13 -0800 (PST)
From: Sean Paul <sean@poorly.run>
To: dri-devel@lists.freedesktop.org
Subject: [PATCH] drm/mediatek: Ensure the cursor plane is on top of other
 overlays
Date: Thu, 30 Jan 2020 14:24:55 -0500
Message-Id: <20200130192511.81205-1-sean@poorly.run>
X-Mailer: git-send-email 2.25.0.341.g760bfbb309-goog
MIME-Version: 1.0
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
Cc: dcastagna@chromium.org, Matthias Brugger <matthias.bgg@gmail.com>,
 Sean Paul <seanpaul@chromium.org>, linux-mediatek@lists.infradead.org,
 linux-arm-kernel@lists.infradead.org
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

From: Sean Paul <seanpaul@chromium.org>

Currently the cursor is placed on the first overlay plane, which means
it will be at the bottom of the stack when the hw does the compositing
with anything other than primary plane. Since mtk doesn't support plane
zpos, change the cursor location to the top-most plane.

Signed-off-by: Sean Paul <seanpaul@chromium.org>
---
 drivers/gpu/drm/mediatek/mtk_drm_crtc.c | 8 +++++---
 1 file changed, 5 insertions(+), 3 deletions(-)

diff --git a/drivers/gpu/drm/mediatek/mtk_drm_crtc.c b/drivers/gpu/drm/mediatek/mtk_drm_crtc.c
index 0dfcd1787e651..4ac76b9613926 100644
--- a/drivers/gpu/drm/mediatek/mtk_drm_crtc.c
+++ b/drivers/gpu/drm/mediatek/mtk_drm_crtc.c
@@ -689,11 +689,12 @@ static int mtk_drm_crtc_num_comp_planes(struct mtk_drm_crtc *mtk_crtc,
 }
 
 static inline
-enum drm_plane_type mtk_drm_crtc_plane_type(unsigned int plane_idx)
+enum drm_plane_type mtk_drm_crtc_plane_type(unsigned int plane_idx,
+					    unsigned int num_planes)
 {
 	if (plane_idx == 0)
 		return DRM_PLANE_TYPE_PRIMARY;
-	else if (plane_idx == 1)
+	else if (plane_idx == (num_planes - 1))
 		return DRM_PLANE_TYPE_CURSOR;
 	else
 		return DRM_PLANE_TYPE_OVERLAY;
@@ -712,7 +713,8 @@ static int mtk_drm_crtc_init_comp_planes(struct drm_device *drm_dev,
 		ret = mtk_plane_init(drm_dev,
 				&mtk_crtc->planes[mtk_crtc->layer_nr],
 				BIT(pipe),
-				mtk_drm_crtc_plane_type(mtk_crtc->layer_nr),
+				mtk_drm_crtc_plane_type(mtk_crtc->layer_nr,
+							num_planes),
 				mtk_ddp_comp_supported_rotations(comp));
 		if (ret)
 			return ret;
-- 
Sean Paul, Software Engineer, Google / Chromium OS

_______________________________________________
dri-devel mailing list
dri-devel@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/dri-devel
