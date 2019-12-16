Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id F3316120F3B
	for <lists+dri-devel@lfdr.de>; Mon, 16 Dec 2019 17:21:44 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 0D07A6E0AF;
	Mon, 16 Dec 2019 16:21:41 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from youngberry.canonical.com (youngberry.canonical.com
 [91.189.89.112])
 by gabe.freedesktop.org (Postfix) with ESMTPS id AE73D6E0AF
 for <dri-devel@lists.freedesktop.org>; Mon, 16 Dec 2019 16:21:39 +0000 (UTC)
Received: from 1.general.cking.uk.vpn ([10.172.193.212] helo=localhost)
 by youngberry.canonical.com with esmtpsa
 (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128) (Exim 4.86_2)
 (envelope-from <colin.king@canonical.com>)
 id 1igt7o-0004Vj-Tk; Mon, 16 Dec 2019 16:21:37 +0000
From: Colin King <colin.king@canonical.com>
To: Patrik Jakobsson <patrik.r.jakobsson@gmail.com>,
 David Airlie <airlied@linux.ie>, Daniel Vetter <daniel@ffwll.ch>,
 Thomas Zimmermann <tzimmermann@suse.de>, dri-devel@lists.freedesktop.org
Subject: [PATCH][next] drm/gma500: fix null dereference of pointer fb before
 null check
Date: Mon, 16 Dec 2019 16:21:36 +0000
Message-Id: <20191216162136.270114-1-colin.king@canonical.com>
X-Mailer: git-send-email 2.24.0
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
Cc: kernel-janitors@vger.kernel.org, linux-kernel@vger.kernel.org
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

From: Colin Ian King <colin.king@canonical.com>

Pointer fb is being dereferenced when assigning dev before it
is null checked.  Fix this by only dereferencing dev after the
null check.

Fixes: 6b7ce2c4161a ("drm/gma500: Remove struct psb_fbdev")
Signed-off-by: Colin Ian King <colin.king@canonical.com>
---
 drivers/gpu/drm/gma500/accel_2d.c | 6 ++++--
 1 file changed, 4 insertions(+), 2 deletions(-)

diff --git a/drivers/gpu/drm/gma500/accel_2d.c b/drivers/gpu/drm/gma500/accel_2d.c
index b9e5a38632f7..adc0507545bf 100644
--- a/drivers/gpu/drm/gma500/accel_2d.c
+++ b/drivers/gpu/drm/gma500/accel_2d.c
@@ -228,8 +228,8 @@ static void psbfb_copyarea_accel(struct fb_info *info,
 {
 	struct drm_fb_helper *fb_helper = info->par;
 	struct drm_framebuffer *fb = fb_helper->fb;
-	struct drm_device *dev = fb->dev;
-	struct drm_psb_private *dev_priv = dev->dev_private;
+	struct drm_device *dev;
+	struct drm_psb_private *dev_priv;
 	uint32_t offset;
 	uint32_t stride;
 	uint32_t src_format;
@@ -238,6 +238,8 @@ static void psbfb_copyarea_accel(struct fb_info *info,
 	if (!fb)
 		return;
 
+	dev = fb->dev;
+	dev_priv = dev->dev_private;
 	offset = to_gtt_range(fb->obj[0])->offset;
 	stride = fb->pitches[0];
 
-- 
2.24.0

_______________________________________________
dri-devel mailing list
dri-devel@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/dri-devel
