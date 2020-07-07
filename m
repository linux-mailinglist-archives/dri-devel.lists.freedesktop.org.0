Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 1D856216846
	for <lists+dri-devel@lfdr.de>; Tue,  7 Jul 2020 10:24:25 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id B749C89BFF;
	Tue,  7 Jul 2020 08:24:19 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mx2.suse.de (mx2.suse.de [195.135.220.15])
 by gabe.freedesktop.org (Postfix) with ESMTPS id E1D6C89BE8
 for <dri-devel@lists.freedesktop.org>; Tue,  7 Jul 2020 08:24:16 +0000 (UTC)
X-Virus-Scanned: by amavisd-new at test-mx.suse.de
Received: from relay2.suse.de (unknown [195.135.221.27])
 by mx2.suse.de (Postfix) with ESMTP id EDE70B1B2;
 Tue,  7 Jul 2020 08:24:15 +0000 (UTC)
From: Thomas Zimmermann <tzimmermann@suse.de>
To: airlied@redhat.com, daniel@ffwll.ch, sam@ravnborg.org,
 emil.velikov@collabora.com, kraxel@redhat.com, john.p.donnelly@oracle.com,
 lyude@redhat.com
Subject: [PATCH 2/7] drm/mgag200: Move PLL setup out of mode-setting function
Date: Tue,  7 Jul 2020 10:24:06 +0200
Message-Id: <20200707082411.6583-3-tzimmermann@suse.de>
X-Mailer: git-send-email 2.27.0
In-Reply-To: <20200707082411.6583-1-tzimmermann@suse.de>
References: <20200707082411.6583-1-tzimmermann@suse.de>
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

Makes the code slightly more flexible. No functional changes.

Signed-off-by: Thomas Zimmermann <tzimmermann@suse.de>
---
 drivers/gpu/drm/mgag200/mgag200_mode.c | 5 ++---
 1 file changed, 2 insertions(+), 3 deletions(-)

diff --git a/drivers/gpu/drm/mgag200/mgag200_mode.c b/drivers/gpu/drm/mgag200/mgag200_mode.c
index 9037057d3b3a..d9612f531e52 100644
--- a/drivers/gpu/drm/mgag200/mgag200_mode.c
+++ b/drivers/gpu/drm/mgag200/mgag200_mode.c
@@ -712,7 +712,7 @@ static int mga_g200er_set_plls(struct mga_device *mdev, long clock)
 	return 0;
 }
 
-static int mga_crtc_set_plls(struct mga_device *mdev, long clock)
+static int mgag200_crtc_set_plls(struct mga_device *mdev, long clock)
 {
 	u8 misc;
 
@@ -1110,8 +1110,6 @@ static void mgag200_set_mode_regs(struct mga_device *mdev,
 	WREG_ECRT(0x05, crtcext5);
 
 	WREG8(MGA_MISC_OUT, misc);
-
-	mga_crtc_set_plls(mdev, mode->clock);
 }
 
 static u8 mgag200_get_bpp_shift(struct mga_device *mdev,
@@ -1614,6 +1612,7 @@ mgag200_simple_display_pipe_enable(struct drm_simple_display_pipe *pipe,
 
 	mgag200_set_format_regs(mdev, fb);
 	mgag200_set_mode_regs(mdev, adjusted_mode);
+	mgag200_crtc_set_plls(mdev, adjusted_mode->clock);
 
 	if (mdev->type == G200_ER)
 		mgag200_g200er_reset_tagfifo(mdev);
-- 
2.27.0

_______________________________________________
dri-devel mailing list
dri-devel@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/dri-devel
