Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id A399470C655
	for <lists+dri-devel@lfdr.de>; Mon, 22 May 2023 21:17:11 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id A206310E241;
	Mon, 22 May 2023 19:17:06 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from smtp-out2.suse.de (smtp-out2.suse.de [IPv6:2001:67c:2178:6::1d])
 by gabe.freedesktop.org (Postfix) with ESMTPS id D8A1410E241;
 Mon, 22 May 2023 19:17:04 +0000 (UTC)
Received: from imap2.suse-dmz.suse.de (imap2.suse-dmz.suse.de [192.168.254.74])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature ECDSA (P-521) server-digest SHA512)
 (No client certificate requested)
 by smtp-out2.suse.de (Postfix) with ESMTPS id 5EA6F200F5;
 Mon, 22 May 2023 19:17:03 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.de; s=susede2_rsa;
 t=1684783023; h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
 mime-version:mime-version: content-transfer-encoding:content-transfer-encoding;
 bh=xmIdxT03UVobCKfaCN9uYaVEfm0QPYjapbye8Mp+k+4=;
 b=F4cbHme+FhHEddO17KqKbsI916+PWsECrj+vZl0mhAjCQjKdQWcrv/Qh1z0VkSZ3OmmCP0
 h9AawPcezNf3Jgf1kr+GlVbfkyGCsDct2NXZ8J6AqskwHQLfMTzebGGSM7UY3ZVe0gEGfq
 Kv6yRXkmxgaQ3r51tGbSGjgMGrHx87w=
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed; d=suse.de;
 s=susede2_ed25519; t=1684783023;
 h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
 mime-version:mime-version: content-transfer-encoding:content-transfer-encoding;
 bh=xmIdxT03UVobCKfaCN9uYaVEfm0QPYjapbye8Mp+k+4=;
 b=pyt9rnC82hVP43TWHzshaF9e6ac+X+45JvLz0PSxPVVvivqqVLmeYWBf4y3R2N6qBL7RCt
 PqhE0X5K0a2DFYAQ==
Received: from imap2.suse-dmz.suse.de (imap2.suse-dmz.suse.de [192.168.254.74])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature ECDSA (P-521) server-digest SHA512)
 (No client certificate requested)
 by imap2.suse-dmz.suse.de (Postfix) with ESMTPS id 278B513336;
 Mon, 22 May 2023 19:17:03 +0000 (UTC)
Received: from dovecot-director2.suse.de ([192.168.254.65])
 by imap2.suse-dmz.suse.de with ESMTPSA id 6JGnCK+/a2THNgAAMHmgww
 (envelope-from <tzimmermann@suse.de>); Mon, 22 May 2023 19:17:03 +0000
From: Thomas Zimmermann <tzimmermann@suse.de>
To: robdclark@gmail.com, quic_abhinavk@quicinc.com,
 dmitry.baryshkov@linaro.org, sean@poorly.run, airlied@gmail.com,
 daniel@ffwll.ch
Subject: [PATCH] drm/msm: Use struct fb_info.screen_buffer
Date: Mon, 22 May 2023 21:17:01 +0200
Message-Id: <20230522191701.13406-1-tzimmermann@suse.de>
X-Mailer: git-send-email 2.40.1
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
Cc: linux-arm-msm@vger.kernel.org, freedreno@lists.freedesktop.org,
 Thomas Zimmermann <tzimmermann@suse.de>, dri-devel@lists.freedesktop.org
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

The fbdev framebuffer is in system memory. Store the address in
the field 'screen_buffer'. Fixes the following sparse warning.

../drivers/gpu/drm/msm/msm_fbdev.c:124:26: warning: incorrect type in assignment (different address spaces)
../drivers/gpu/drm/msm/msm_fbdev.c:124:26:    expected char [noderef] __iomem *screen_base
../drivers/gpu/drm/msm/msm_fbdev.c:124:26:    got void *

Signed-off-by: Thomas Zimmermann <tzimmermann@suse.de>
---
 drivers/gpu/drm/msm/msm_fbdev.c | 6 +++---
 1 file changed, 3 insertions(+), 3 deletions(-)

diff --git a/drivers/gpu/drm/msm/msm_fbdev.c b/drivers/gpu/drm/msm/msm_fbdev.c
index 2ebc86381e1c..ce0ba6d1979a 100644
--- a/drivers/gpu/drm/msm/msm_fbdev.c
+++ b/drivers/gpu/drm/msm/msm_fbdev.c
@@ -121,9 +121,9 @@ static int msm_fbdev_create(struct drm_fb_helper *helper,
 
 	drm_fb_helper_fill_info(fbi, helper, sizes);
 
-	fbi->screen_base = msm_gem_get_vaddr(bo);
-	if (IS_ERR(fbi->screen_base)) {
-		ret = PTR_ERR(fbi->screen_base);
+	fbi->screen_buffer = msm_gem_get_vaddr(bo);
+	if (IS_ERR(fbi->screen_buffer)) {
+		ret = PTR_ERR(fbi->screen_buffer);
 		goto fail;
 	}
 	fbi->screen_size = bo->size;
-- 
2.40.1

