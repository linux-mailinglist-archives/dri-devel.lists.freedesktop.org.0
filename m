Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id E5F053B91C1
	for <lists+dri-devel@lfdr.de>; Thu,  1 Jul 2021 14:43:35 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 829416EAD9;
	Thu,  1 Jul 2021 12:43:23 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from smtp-out2.suse.de (smtp-out2.suse.de [195.135.220.29])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 505D56EAD7
 for <dri-devel@lists.freedesktop.org>; Thu,  1 Jul 2021 12:43:21 +0000 (UTC)
Received: from imap.suse.de (imap-alt.suse-dmz.suse.de [192.168.254.47])
 (using TLSv1.2 with cipher ECDHE-ECDSA-AES128-GCM-SHA256 (128/128 bits))
 (No client certificate requested)
 by smtp-out2.suse.de (Postfix) with ESMTPS id EA198204CA;
 Thu,  1 Jul 2021 12:43:19 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.de; s=susede2_rsa;
 t=1625143399; h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
 mime-version:mime-version:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=flowueWeGn04FlH5BEjFLTRoziYYj3NllM6A0SoU/wQ=;
 b=2CQcD8Yu/KlkERm6fa080mjdFvCS6HKfqwHhZZfLaoq7P+FxSxzYyRy/15ytrEFOp7HQNO
 SgcyXm8B+PvHNEDNfiBzlrLa8rWCGZDAzee9rPNyKLw1wCBv0dHKPuuYGgYZx0IYsS5DI3
 +vWvJkP7bSlQsu8djp1FtHjpguKRyE4=
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed; d=suse.de;
 s=susede2_ed25519; t=1625143399;
 h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
 mime-version:mime-version:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=flowueWeGn04FlH5BEjFLTRoziYYj3NllM6A0SoU/wQ=;
 b=WR+w1CKTW8wOKNWOk05z/k3Fsp8cwgpCReh7y5uaa5Yp9P7XVMGvm3GR5ujx+2fs6uuRqG
 93O2cdoZGcmuXPAQ==
Received: from imap3-int (imap-alt.suse-dmz.suse.de [192.168.254.47])
 by imap.suse.de (Postfix) with ESMTP id BE4C111CD4;
 Thu,  1 Jul 2021 12:43:19 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.de; s=susede2_rsa;
 t=1625143399; h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
 mime-version:mime-version:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=flowueWeGn04FlH5BEjFLTRoziYYj3NllM6A0SoU/wQ=;
 b=2CQcD8Yu/KlkERm6fa080mjdFvCS6HKfqwHhZZfLaoq7P+FxSxzYyRy/15ytrEFOp7HQNO
 SgcyXm8B+PvHNEDNfiBzlrLa8rWCGZDAzee9rPNyKLw1wCBv0dHKPuuYGgYZx0IYsS5DI3
 +vWvJkP7bSlQsu8djp1FtHjpguKRyE4=
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed; d=suse.de;
 s=susede2_ed25519; t=1625143399;
 h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
 mime-version:mime-version:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=flowueWeGn04FlH5BEjFLTRoziYYj3NllM6A0SoU/wQ=;
 b=WR+w1CKTW8wOKNWOk05z/k3Fsp8cwgpCReh7y5uaa5Yp9P7XVMGvm3GR5ujx+2fs6uuRqG
 93O2cdoZGcmuXPAQ==
Received: from director2.suse.de ([192.168.254.72]) by imap3-int with ESMTPSA
 id YPt7LWe43WAmKwAALh3uQQ
 (envelope-from <tzimmermann@suse.de>); Thu, 01 Jul 2021 12:43:19 +0000
From: Thomas Zimmermann <tzimmermann@suse.de>
To: daniel@ffwll.ch,
	airlied@redhat.com
Subject: [PATCH 4/4] drm/mgag200: Constify LUT for programming bpp
Date: Thu,  1 Jul 2021 14:43:16 +0200
Message-Id: <20210701124316.20818-5-tzimmermann@suse.de>
X-Mailer: git-send-email 2.32.0
In-Reply-To: <20210701124316.20818-1-tzimmermann@suse.de>
References: <20210701124316.20818-1-tzimmermann@suse.de>
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
Cc: Thomas Zimmermann <tzimmermann@suse.de>, dri-devel@lists.freedesktop.org
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

Declare constant LUT for bpp programming as static const. Removes mutable
data from device structure.

Signed-off-by: Thomas Zimmermann <tzimmermann@suse.de>
---
 drivers/gpu/drm/mgag200/mgag200_drv.h  |  2 --
 drivers/gpu/drm/mgag200/mgag200_mode.c | 16 ++++++----------
 2 files changed, 6 insertions(+), 12 deletions(-)

diff --git a/drivers/gpu/drm/mgag200/mgag200_drv.h b/drivers/gpu/drm/mgag200/mgag200_drv.h
index 75ae1809fb5a..f7a0537c0d0a 100644
--- a/drivers/gpu/drm/mgag200/mgag200_drv.h
+++ b/drivers/gpu/drm/mgag200/mgag200_drv.h
@@ -166,8 +166,6 @@ struct mga_device {
 
 	enum mga_type			type;
 
-	int bpp_shifts[4];
-
 	int fb_mtrr;
 
 	union {
diff --git a/drivers/gpu/drm/mgag200/mgag200_mode.c b/drivers/gpu/drm/mgag200/mgag200_mode.c
index 9d576240faed..3b3059f471c2 100644
--- a/drivers/gpu/drm/mgag200/mgag200_mode.c
+++ b/drivers/gpu/drm/mgag200/mgag200_mode.c
@@ -1137,10 +1137,11 @@ static void mgag200_set_mode_regs(struct mga_device *mdev,
 	WREG8(MGA_MISC_OUT, misc);
 }
 
-static u8 mgag200_get_bpp_shift(struct mga_device *mdev,
-				const struct drm_format_info *format)
+static u8 mgag200_get_bpp_shift(const struct drm_format_info *format)
 {
-	return mdev->bpp_shifts[format->cpp[0] - 1];
+	static const u8 bpp_shift[] = {0, 1, 0, 2};
+
+	return bpp_shift[format->cpp[0] - 1];
 }
 
 /*
@@ -1152,7 +1153,7 @@ static u32 mgag200_calculate_offset(struct mga_device *mdev,
 				    const struct drm_framebuffer *fb)
 {
 	u32 offset = fb->pitches[0] / fb->format->cpp[0];
-	u8 bppshift = mgag200_get_bpp_shift(mdev, fb->format);
+	u8 bppshift = mgag200_get_bpp_shift(fb->format);
 
 	if (fb->format->cpp[0] * 8 == 24)
 		offset = (offset * 3) >> (4 - bppshift);
@@ -1189,7 +1190,7 @@ static void mgag200_set_format_regs(struct mga_device *mdev,
 
 	bpp = format->cpp[0] * 8;
 
-	bppshift = mgag200_get_bpp_shift(mdev, format);
+	bppshift = mgag200_get_bpp_shift(format);
 	switch (bpp) {
 	case 24:
 		scale = ((1 << bppshift) * 3) - 1;
@@ -1699,11 +1700,6 @@ int mgag200_modeset_init(struct mga_device *mdev)
 	size_t format_count = ARRAY_SIZE(mgag200_simple_display_pipe_formats);
 	int ret;
 
-	mdev->bpp_shifts[0] = 0;
-	mdev->bpp_shifts[1] = 1;
-	mdev->bpp_shifts[2] = 0;
-	mdev->bpp_shifts[3] = 2;
-
 	mgag200_init_regs(mdev);
 
 	ret = drmm_mode_config_init(dev);
-- 
2.32.0

