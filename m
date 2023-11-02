Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 011F37DEABA
	for <lists+dri-devel@lfdr.de>; Thu,  2 Nov 2023 03:35:17 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 9B9C810E074;
	Thu,  2 Nov 2023 02:35:10 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from s01.bc.feishu.cn (s01.bc.feishu.cn [103.149.242.17])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 947FF10E074
 for <dri-devel@lists.freedesktop.org>; Thu,  2 Nov 2023 02:35:07 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
 s=s1; d=dingdao-com.20200927.dkim.feishu.cn; t=1698892195;
 h=from:subject:mime-version:from:date:message-id:subject:to:cc:
 reply-to:content-type:mime-version:in-reply-to:message-id;
 bh=VcJzb/Hqi5REb/G4gr1LCv0xAGOo0i/tk2uVi1fPSUg=;
 b=cdLGaa+EAD9IcMUC+1blLk7FgqlUAwavLtbG/g1g3hZISxK5Y9LiSL5bNISD0w8PBh1bZn
 Usn0z9gCVFPS2yWA6RDSM4/1dPefbSpxb++/4j1+FDzAVQT10suDSPoeEb8tSpCr6ByK/A
 OU6Dnc08Rsav9oU0izHvHOnH59N3grpxTPB3mhqvR2gW4zkySUObMciFL+G5XKKN8eZs9W
 185zWxK70ROt6RNYL4LbnPLBQzKwb3Cbm3s6PqUJIzhZkKEvsfO9klSwd9bYZTI18nF9ZR
 3+21bhZhjM+cvLjXnJV+LChox7DsRyFcT5YxkY+ei8UxPDHEBMSuvlP+68D1MA==
Content-Type: text/plain; charset=UTF-8
Mime-Version: 1.0
Content-Transfer-Encoding: 7bit
X-Mailer: git-send-email 2.37.1
X-Original-From: Peng Hao <penghao@dingdao.com>
To: <maarten.lankhorst@linux.intel.com>, <mripard@kernel.org>, 
 <tzimmermann@suse.de>, <airlied@gmail.com>, <daniel@ffwll.ch>
From: "Peng Hao" <penghao@dingdao.com>
X-Lms-Return-Path: <lba+2654309a2+6b46fd+lists.freedesktop.org+penghao@dingdao.com>
Subject: [PATCH] gpu/drm/drm_framebuffer.c: Use Macro instead of actual number.
Date: Thu,  2 Nov 2023 10:29:46 +0800
Message-Id: <20231102022946.115603-1-penghao@dingdao.com>
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
Cc: penghao@dingdao.com, linux-kernel@vger.kernel.org,
 dri-devel@lists.freedesktop.org
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

Use Macro DRM_FORMAT_MAX_PLANES instead of 4, to improve modifiability.

Signed-off-by: Peng Hao <penghao@dingdao.com>
---
 drivers/gpu/drm/drm_framebuffer.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/drivers/gpu/drm/drm_framebuffer.c b/drivers/gpu/drm/drm_framebuffer.c
index 2dd97473ca10..bf283dae9090 100644
--- a/drivers/gpu/drm/drm_framebuffer.c
+++ b/drivers/gpu/drm/drm_framebuffer.c
@@ -254,7 +254,7 @@ static int framebuffer_check(struct drm_device *dev,
 		}
 	}
 
-	for (i = info->num_planes; i < 4; i++) {
+	for (i = info->num_planes; i < DRM_FORMAT_MAX_PLANES; i++) {
 		if (r->modifier[i]) {
 			drm_dbg_kms(dev, "non-zero modifier for unused plane %d\n", i);
 			return -EINVAL;
-- 
2.37.1
