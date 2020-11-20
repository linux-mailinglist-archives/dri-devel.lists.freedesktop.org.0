Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 120F62BA756
	for <lists+dri-devel@lfdr.de>; Fri, 20 Nov 2020 11:26:07 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 2164A6E8AC;
	Fri, 20 Nov 2020 10:25:56 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mx2.suse.de (mx2.suse.de [195.135.220.15])
 by gabe.freedesktop.org (Postfix) with ESMTPS id B23906E8B2
 for <dri-devel@lists.freedesktop.org>; Fri, 20 Nov 2020 10:25:50 +0000 (UTC)
X-Virus-Scanned: by amavisd-new at test-mx.suse.de
Received: from relay2.suse.de (unknown [195.135.221.27])
 by mx2.suse.de (Postfix) with ESMTP id EB7D8AEFB;
 Fri, 20 Nov 2020 10:25:48 +0000 (UTC)
From: Thomas Zimmermann <tzimmermann@suse.de>
To: daniel@ffwll.ch, airlied@linux.ie, sam@ravnborg.org, mripard@kernel.org,
 maarten.lankhorst@linux.intel.com, christian.koenig@amd.com,
 ville.syrjala@linux.intel.com
Subject: [PATCH v2 09/10] drm/fb-helper: Copy dma-buf map before flushing
 shadow fb
Date: Fri, 20 Nov 2020 11:25:44 +0100
Message-Id: <20201120102545.4047-10-tzimmermann@suse.de>
X-Mailer: git-send-email 2.29.2
In-Reply-To: <20201120102545.4047-1-tzimmermann@suse.de>
References: <20201120102545.4047-1-tzimmermann@suse.de>
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
Cc: Thomas Zimmermann <tzimmermann@suse.de>, dri-devel@lists.freedesktop.org
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

Copy the vmap()'ed instance of struct dma_buf_map before modifying it,
in case the implementation of vunmap() depends on the exact address.

Signed-off-by: Thomas Zimmermann <tzimmermann@suse.de>
---
 drivers/gpu/drm/drm_fb_helper.c | 5 +++--
 1 file changed, 3 insertions(+), 2 deletions(-)

diff --git a/drivers/gpu/drm/drm_fb_helper.c b/drivers/gpu/drm/drm_fb_helper.c
index b36d9852cdf7..d972ce75d180 100644
--- a/drivers/gpu/drm/drm_fb_helper.c
+++ b/drivers/gpu/drm/drm_fb_helper.c
@@ -395,14 +395,15 @@ static int drm_fb_helper_damage_blit(struct drm_fb_helper *fb_helper,
 				     struct drm_clip_rect *clip)
 {
 	struct drm_client_buffer *buffer = fb_helper->buffer;
-	struct dma_buf_map map;
+	struct dma_buf_map map, dst;
 	int ret;
 
 	ret = drm_client_buffer_vmap(buffer, &map);
 	if (ret)
 		return ret;
 
-	drm_fb_helper_damage_blit_real(fb_helper, clip, &map);
+	dst = map;
+	drm_fb_helper_damage_blit_real(fb_helper, clip, &dst);
 
 	drm_client_buffer_vunmap(buffer);
 
-- 
2.29.2

_______________________________________________
dri-devel mailing list
dri-devel@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/dri-devel
