Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 8F8254CA906
	for <lists+dri-devel@lfdr.de>; Wed,  2 Mar 2022 16:25:06 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id EB22710E32F;
	Wed,  2 Mar 2022 15:24:51 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from letterbox.kde.org (letterbox.kde.org
 [IPv6:2001:41c9:1:41e::242])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 609F010E11D
 for <dri-devel@lists.freedesktop.org>; Wed,  2 Mar 2022 15:24:45 +0000 (UTC)
Received: from vertex.localdomain (pool-108-36-85-85.phlapa.fios.verizon.net
 [108.36.85.85]) (Authenticated sender: zack)
 by letterbox.kde.org (Postfix) with ESMTPSA id 7317C2872A2;
 Wed,  2 Mar 2022 15:24:43 +0000 (GMT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kde.org; s=users;
 t=1646234684; bh=4F+X8uCueyglrdMPtpqYPHzWxJyIY+coz153bAv64Es=;
 h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
 b=cRZ1Ib/2xpoqWMfsHeACmcfrl93ooVNYLBgZe1p5jWgOhz9LR0La+Rkzyl/zMARRx
 mg1UT+E4sXAey+hHPej9OL2MQS2xX81H264DAWG2G5xPYx4KvPnyLg7VoDZSoSp0Ot
 PmuQofqJ9KqnvIDjBmnXv2MCZK54v76Y1SUXChL7m7C+WlDeknEF4jIMl5IVhPqgEM
 +kay10V2UqM8+yDFAHibEYNgBtooWIe0fXLbR6v6lZlfCf1AaoTQheongo4rZ0I2F7
 PUJ8rwpfiXVYIcRrT0Z3yb5HHs+LRcg4SVsmTa6tMLUfUgcQwnL9U/p0rBeaVxRYYo
 +HZlBuLaxGjoA==
From: Zack Rusin <zack@kde.org>
To: dri-devel@lists.freedesktop.org
Subject: [PATCH 6/8] drm/vmwgfx: Initialize drm_mode_fb_cmd2
Date: Wed,  2 Mar 2022 10:24:24 -0500
Message-Id: <20220302152426.885214-7-zack@kde.org>
X-Mailer: git-send-email 2.32.0
In-Reply-To: <20220302152426.885214-1-zack@kde.org>
References: <20220302152426.885214-1-zack@kde.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
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
Reply-To: Zack Rusin <zackr@vmware.com>
Cc: krastevm@vmware.com, stable@vger.kernel.org, mombasawalam@vmware.com,
 Daniel Vetter <daniel.vetter@intel.com>
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

From: Zack Rusin <zackr@vmware.com>

Transition to drm_mode_fb_cmd2 from drm_mode_fb_cmd left the structure
unitialized. drm_mode_fb_cmd2 adds a few additional members, e.g. flags
and modifiers which were never initialized. Garbage in those members
can cause random failures during the bringup of the fbcon.

Initializing the structure fixes random blank screens after bootup due
to flags/modifiers mismatches during the fbcon bring up.

Fixes: dabdcdc9822a ("drm/vmwgfx: Switch to mode_cmd2")
Signed-off-by: Zack Rusin <zackr@vmware.com>
Cc: Daniel Vetter <daniel.vetter@intel.com>
Cc: <stable@vger.kernel.org> # v4.10+
Reviewed-by: Martin Krastev <krastevm@vmware.com>
Reviewed-by: Maaz Mombasawala <mombasawalam@vmware.com>
---
 drivers/gpu/drm/vmwgfx/vmwgfx_fb.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/drivers/gpu/drm/vmwgfx/vmwgfx_fb.c b/drivers/gpu/drm/vmwgfx/vmwgfx_fb.c
index 8ee34576c7d0..adf17c740656 100644
--- a/drivers/gpu/drm/vmwgfx/vmwgfx_fb.c
+++ b/drivers/gpu/drm/vmwgfx/vmwgfx_fb.c
@@ -483,7 +483,7 @@ static int vmw_fb_kms_detach(struct vmw_fb_par *par,
 
 static int vmw_fb_kms_framebuffer(struct fb_info *info)
 {
-	struct drm_mode_fb_cmd2 mode_cmd;
+	struct drm_mode_fb_cmd2 mode_cmd = {0};
 	struct vmw_fb_par *par = info->par;
 	struct fb_var_screeninfo *var = &info->var;
 	struct drm_framebuffer *cur_fb;
-- 
2.32.0

