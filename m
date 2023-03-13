Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id B3FFB6B7CA8
	for <lists+dri-devel@lfdr.de>; Mon, 13 Mar 2023 16:52:23 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 5D67310E5AB;
	Mon, 13 Mar 2023 15:52:06 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from smtp-out1.suse.de (smtp-out1.suse.de [IPv6:2001:67c:2178:6::1c])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 9512510E58D
 for <dri-devel@lists.freedesktop.org>; Mon, 13 Mar 2023 15:51:47 +0000 (UTC)
Received: from imap2.suse-dmz.suse.de (imap2.suse-dmz.suse.de [192.168.254.74])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature ECDSA (P-521) server-digest SHA512)
 (No client certificate requested)
 by smtp-out1.suse.de (Postfix) with ESMTPS id 515C922AE0;
 Mon, 13 Mar 2023 15:51:46 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.de; s=susede2_rsa;
 t=1678722706; h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
 mime-version:mime-version:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=RrI2Z623laCpkz5xcMwL8KspUXzsIgPKKjaFMh8wl0U=;
 b=wi8QMsI5aDOplZY/NoEJsVAlSpGSZ7Xb354KfzRV7zXDfr0ZfFfWIl+SF6BRm4XmDo1N2C
 OjA66cNc+VqYhm6p4vLkQO7UiOt9wit/9CNvMhP7tkG55kA/PsqGCHD55zcOylLF6a70Qr
 zXUSfuA1vw4330xlp5Zx5FG0yQFCUwU=
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed; d=suse.de;
 s=susede2_ed25519; t=1678722706;
 h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
 mime-version:mime-version:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=RrI2Z623laCpkz5xcMwL8KspUXzsIgPKKjaFMh8wl0U=;
 b=VN6Lcutmcpynay5pIsmC9uuTNoJNS5ExZKUPLPJXIvpdYJInd+iB9OD3R6RMoTScynQ7d/
 XnKdYjSpTRp6nLBQ==
Received: from imap2.suse-dmz.suse.de (imap2.suse-dmz.suse.de [192.168.254.74])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature ECDSA (P-521) server-digest SHA512)
 (No client certificate requested)
 by imap2.suse-dmz.suse.de (Postfix) with ESMTPS id 12BCB139F9;
 Mon, 13 Mar 2023 15:51:46 +0000 (UTC)
Received: from dovecot-director2.suse.de ([192.168.254.65])
 by imap2.suse-dmz.suse.de with ESMTPSA id KCCqA5JGD2RhegAAMHmgww
 (envelope-from <tzimmermann@suse.de>); Mon, 13 Mar 2023 15:51:46 +0000
From: Thomas Zimmermann <tzimmermann@suse.de>
To: javierm@redhat.com, maarten.lankhorst@linux.intel.com, mripard@kernel.org,
 airlied@gmail.com, daniel@ffwll.ch, linus.walleij@linaro.org
Subject: [PATCH v2 23/25] drm/mcde: Do not use dirty GEM FB handling
Date: Mon, 13 Mar 2023 16:51:36 +0100
Message-Id: <20230313155138.20584-24-tzimmermann@suse.de>
X-Mailer: git-send-email 2.39.2
In-Reply-To: <20230313155138.20584-1-tzimmermann@suse.de>
References: <20230313155138.20584-1-tzimmermann@suse.de>
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
Cc: linux-aspeed@lists.ozlabs.org, dri-devel@lists.freedesktop.org,
 linux-stm32@st-md-mailman.stormreply.com,
 Thomas Zimmermann <tzimmermann@suse.de>, linux-amlogic@lists.infradead.org,
 linux-sunxi@lists.linux.dev, linux-arm-kernel@lists.infradead.org
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

From: Linus Walleij <linus.walleij@linaro.org>

This driver has no way to handle damage, the reason the
drm_gem_fb_create_with_dirty() was used was because I had the
ambition that the driver would only send out updates to DSI
command displays whenever something changed, so as to
minimize traffic.

It turns out this ambition with command mode isn't working
in practice because all the MCDE does is to create a
continuous stream of DSI commands and while it is possible to
send single frame updates with it, it's not been worthwhile.
So we are just setting up continuous updates.

Reported-by: Thomas Zimmermann <tzimmermann@suse.de>
Link: https://lore.kernel.org/dri-devel/0e789778-03ca-e3cb-9c94-e8b55573894c@suse.de/
Signed-off-by: Linus Walleij <linus.walleij@linaro.org>
Reviewed-by: Thomas Zimmermann <tzimmermann@suse.de>
---
 drivers/gpu/drm/mcde/mcde_drv.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/drivers/gpu/drm/mcde/mcde_drv.c b/drivers/gpu/drm/mcde/mcde_drv.c
index 4aedb050d2a5..a592ad0d7886 100644
--- a/drivers/gpu/drm/mcde/mcde_drv.c
+++ b/drivers/gpu/drm/mcde/mcde_drv.c
@@ -94,7 +94,7 @@
 #define MCDE_PID_MAJOR_VERSION_MASK 0xFF000000
 
 static const struct drm_mode_config_funcs mcde_mode_config_funcs = {
-	.fb_create = drm_gem_fb_create_with_dirty,
+	.fb_create = drm_gem_fb_create,
 	.atomic_check = drm_atomic_helper_check,
 	.atomic_commit = drm_atomic_helper_commit,
 };
-- 
2.39.2

