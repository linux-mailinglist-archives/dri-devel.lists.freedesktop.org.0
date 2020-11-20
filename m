Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id C46122BA75A
	for <lists+dri-devel@lfdr.de>; Fri, 20 Nov 2020 11:26:12 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 048896E8A5;
	Fri, 20 Nov 2020 10:26:00 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mx2.suse.de (mx2.suse.de [195.135.220.15])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 5C4106E8A1
 for <dri-devel@lists.freedesktop.org>; Fri, 20 Nov 2020 10:25:50 +0000 (UTC)
X-Virus-Scanned: by amavisd-new at test-mx.suse.de
Received: from relay2.suse.de (unknown [195.135.221.27])
 by mx2.suse.de (Postfix) with ESMTP id 74068AEEE;
 Fri, 20 Nov 2020 10:25:48 +0000 (UTC)
From: Thomas Zimmermann <tzimmermann@suse.de>
To: daniel@ffwll.ch, airlied@linux.ie, sam@ravnborg.org, mripard@kernel.org,
 maarten.lankhorst@linux.intel.com, christian.koenig@amd.com,
 ville.syrjala@linux.intel.com
Subject: [PATCH v2 06/10] drm/fb-helper: Separate shadow-buffer flushing and
 calling dirty callback
Date: Fri, 20 Nov 2020 11:25:41 +0100
Message-Id: <20201120102545.4047-7-tzimmermann@suse.de>
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

Flushing the shadow framebuffer and invoking the dirty callback are two
separate operations, so do them seprately. The flush operation is paired
with calls to vmap and vunmap. They are not needed for the dirty callback,
which performs its own invocations if necessary.

Signed-off-by: Thomas Zimmermann <tzimmermann@suse.de>
---
 drivers/gpu/drm/drm_fb_helper.c | 4 +---
 1 file changed, 1 insertion(+), 3 deletions(-)

diff --git a/drivers/gpu/drm/drm_fb_helper.c b/drivers/gpu/drm/drm_fb_helper.c
index c9018ffff5f9..bdfdf60e7bd8 100644
--- a/drivers/gpu/drm/drm_fb_helper.c
+++ b/drivers/gpu/drm/drm_fb_helper.c
@@ -417,13 +417,11 @@ static void drm_fb_helper_damage_work(struct work_struct *work)
 		if (ret)
 			return;
 		drm_fb_helper_damage_blit_real(helper, &clip_copy, &map);
+		drm_client_buffer_vunmap(helper->buffer);
 	}
 
 	if (helper->fb->funcs->dirty)
 		helper->fb->funcs->dirty(helper->fb, NULL, 0, 0, &clip_copy, 1);
-
-	if (helper->buffer)
-		drm_client_buffer_vunmap(helper->buffer);
 }
 
 /**
-- 
2.29.2

_______________________________________________
dri-devel mailing list
dri-devel@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/dri-devel
