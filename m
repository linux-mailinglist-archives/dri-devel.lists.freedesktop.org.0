Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id B6D4965E674
	for <lists+dri-devel@lfdr.de>; Thu,  5 Jan 2023 09:07:46 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 44FBA10E6BF;
	Thu,  5 Jan 2023 08:07:40 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from smtp-out1.suse.de (smtp-out1.suse.de [IPv6:2001:67c:2178:6::1c])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 16C0410E6BF
 for <dri-devel@lists.freedesktop.org>; Thu,  5 Jan 2023 08:07:38 +0000 (UTC)
Received: from imap2.suse-dmz.suse.de (imap2.suse-dmz.suse.de [192.168.254.74])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature ECDSA (P-521) server-digest SHA512)
 (No client certificate requested)
 by smtp-out1.suse.de (Postfix) with ESMTPS id 9E8AF6B7DC;
 Thu,  5 Jan 2023 08:07:36 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.de; s=susede2_rsa;
 t=1672906056; h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
 mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding;
 bh=aZyy1Qep+m3vtWrm4eFSK9t8nOLoqtSHodk3Ft/dxXs=;
 b=hT6xHfP/ZtNaWU7/1QNZKxGhB+bQthBrxXTKMxHVnTWM/FYEijgMzb9qfA7iPtvf4jLq+C
 zjjyFDJAas466tBWkPYBriXlp91cunN5ojWjAmghmuF4uyHfULTrzDs4hMxqgWmxVuzwkn
 gPbFzZTS2sWCjfe+19Ws+7/Rjf0RlYo=
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed; d=suse.de;
 s=susede2_ed25519; t=1672906056;
 h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
 mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding;
 bh=aZyy1Qep+m3vtWrm4eFSK9t8nOLoqtSHodk3Ft/dxXs=;
 b=N29YK9ASSLwT3LB3VNlqSKmg1dmiPlyS8+J7XP7Kelja8Y83onCRduxPnefusuBuZL6qYc
 lr3sa7ro42JaWECA==
Received: from imap2.suse-dmz.suse.de (imap2.suse-dmz.suse.de [192.168.254.74])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature ECDSA (P-521) server-digest SHA512)
 (No client certificate requested)
 by imap2.suse-dmz.suse.de (Postfix) with ESMTPS id 6679713338;
 Thu,  5 Jan 2023 08:07:36 +0000 (UTC)
Received: from dovecot-director2.suse.de ([192.168.254.65])
 by imap2.suse-dmz.suse.de with ESMTPSA id eU71F0iFtmNZEQAAMHmgww
 (envelope-from <tzimmermann@suse.de>); Thu, 05 Jan 2023 08:07:36 +0000
From: Thomas Zimmermann <tzimmermann@suse.de>
To: mripard@kernel.org, emma@anholt.net, airlied@gmail.com, daniel@ffwll.ch
Subject: [PATCH] drm/vc4: Start console with 32 bpp / 24 depth
Date: Thu,  5 Jan 2023 09:07:34 +0100
Message-Id: <20230105080734.23554-1-tzimmermann@suse.de>
X-Mailer: git-send-email 2.39.0
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
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
Cc: =?UTF-8?q?Ma=C3=ADra=20Canal?= <mcanal@igalia.com>,
 Thomas Zimmermann <tzimmermann@suse.de>, dri-devel@lists.freedesktop.org,
 Javier Martinez Canillas <javierm@redhat.com>
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

Invoke the generic console emulation with a 32 bits per pixel. The
preferred color depth is 24, so the current value of 16 bpp is too
small. This results in the following error message

vc4-drm gpu: [drm] bpp/depth value of 16/24 not supported
vc4-drm gpu: [drm] No compatible format found
------------[ cut here ]------------
WARNING: CPU: 2 PID: 66 at drivers/gpu/drm/drm_atomic.c:1604 __drm_atomic_helper_set_config+0x2e8/0x314 [drm]

The problem has been present for a long, but has only now surfaced
as commit 37c90d589dc0 ("drm/fb-helper: Fix single-probe color-format
selection") attempts to improve selection of the color format.

See [1] for the initial bug report.

Reported-by: Maíra Canal <mcanal@igalia.com>
Signed-off-by: Thomas Zimmermann <tzimmermann@suse.de>
Tested-by: Maíra Canal <mcanal@igalia.com>
Fixes: 37c90d589dc0 ("drm/fb-helper: Fix single-probe color-format selection")
Cc: Thomas Zimmermann <tzimmermann@suse.de>
Cc: Javier Martinez Canillas <javierm@redhat.com>
Cc: Maarten Lankhorst <maarten.lankhorst@linux.intel.com>
Cc: Maxime Ripard <mripard@kernel.org>
Link: https://lore.kernel.org/dri-devel/20230102112927.26565-1-tzimmermann@suse.de/T/#mb09eb6f615f4b0302c78f250b4241ee48d1915f8 # 1
---
 drivers/gpu/drm/vc4/vc4_drv.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/drivers/gpu/drm/vc4/vc4_drv.c b/drivers/gpu/drm/vc4/vc4_drv.c
index 0ccaee57fe9a..64423b79982f 100644
--- a/drivers/gpu/drm/vc4/vc4_drv.c
+++ b/drivers/gpu/drm/vc4/vc4_drv.c
@@ -387,7 +387,7 @@ static int vc4_drm_bind(struct device *dev)
 	if (ret < 0)
 		goto unbind_all;
 
-	drm_fbdev_generic_setup(drm, 16);
+	drm_fbdev_generic_setup(drm, 32);
 
 	return 0;
 
-- 
2.39.0

