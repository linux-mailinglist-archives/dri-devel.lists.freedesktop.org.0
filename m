Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id E11155839CA
	for <lists+dri-devel@lfdr.de>; Thu, 28 Jul 2022 09:48:05 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id CC79594355;
	Thu, 28 Jul 2022 07:48:03 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from smtp-out2.suse.de (smtp-out2.suse.de [IPv6:2001:67c:2178:6::1d])
 by gabe.freedesktop.org (Postfix) with ESMTPS id A809394355
 for <dri-devel@lists.freedesktop.org>; Thu, 28 Jul 2022 07:48:01 +0000 (UTC)
Received: from imap2.suse-dmz.suse.de (imap2.suse-dmz.suse.de [192.168.254.74])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature ECDSA (P-521) server-digest SHA512)
 (No client certificate requested)
 by smtp-out2.suse.de (Postfix) with ESMTPS id 6382F1FB0C;
 Thu, 28 Jul 2022 07:48:00 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.de; s=susede2_rsa;
 t=1658994480; h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
 mime-version:mime-version: content-transfer-encoding:content-transfer-encoding;
 bh=+SMw6cGv/tB+18YFJtPXOgz9/6X2jlbg/Z3ehNthGBU=;
 b=S5T3wCQ3yPPyJ+XCEQNXOTAW/J0OPDSxhXMILVWgnFfhGPBpxLYHXmwQR4Aj9Xaa3BiIGr
 LA3bvyVoLjSAsV90OCIQEfUVlMzWENGMGVZ1Bt+k955/1D8lwSKtGUUlRCK+vOtJSZPoRv
 ZJXQY7RsqgIQkHgcrI7NTQSaahhaugE=
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed; d=suse.de;
 s=susede2_ed25519; t=1658994480;
 h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
 mime-version:mime-version: content-transfer-encoding:content-transfer-encoding;
 bh=+SMw6cGv/tB+18YFJtPXOgz9/6X2jlbg/Z3ehNthGBU=;
 b=PDzN5jfyCRVJineHYOFws8V+WFZMv6jqNq4RSEoatZ1okR22CNIqVnF3pBCVGOkkYFkJJe
 I6vpiKBAK/i5WnAA==
Received: from imap2.suse-dmz.suse.de (imap2.suse-dmz.suse.de [192.168.254.74])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature ECDSA (P-521) server-digest SHA512)
 (No client certificate requested)
 by imap2.suse-dmz.suse.de (Postfix) with ESMTPS id 3485813A7E;
 Thu, 28 Jul 2022 07:48:00 +0000 (UTC)
Received: from dovecot-director2.suse.de ([192.168.254.65])
 by imap2.suse-dmz.suse.de with ESMTPSA id aYvoCzA/4mI6HQAAMHmgww
 (envelope-from <tzimmermann@suse.de>); Thu, 28 Jul 2022 07:48:00 +0000
From: Thomas Zimmermann <tzimmermann@suse.de>
To: airlied@redhat.com,
	sean@poorly.run,
	airlied@linux.ie,
	daniel@ffwll.ch
Subject: [PATCH] drm/udl: Enable damage clipping
Date: Thu, 28 Jul 2022 09:47:56 +0200
Message-Id: <20220728074756.6108-1-tzimmermann@suse.de>
X-Mailer: git-send-email 2.37.1
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

Call drm_plane_enable_fb_damage_clips() and give userspace a chance
of minimizing the updated display area.

Signed-off-by: Thomas Zimmermann <tzimmermann@suse.de>
---
 drivers/gpu/drm/udl/udl_modeset.c | 1 +
 1 file changed, 1 insertion(+)

diff --git a/drivers/gpu/drm/udl/udl_modeset.c b/drivers/gpu/drm/udl/udl_modeset.c
index e67c40a48fb4..ce427128f034 100644
--- a/drivers/gpu/drm/udl/udl_modeset.c
+++ b/drivers/gpu/drm/udl/udl_modeset.c
@@ -479,6 +479,7 @@ int udl_modeset_init(struct drm_device *dev)
 					   format_count, NULL, connector);
 	if (ret)
 		return ret;
+	drm_plane_enable_fb_damage_clips(&udl->display_pipe.plane);
 
 	drm_mode_config_reset(dev);
 
-- 
2.37.1

