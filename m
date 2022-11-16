Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 29E3362C394
	for <lists+dri-devel@lfdr.de>; Wed, 16 Nov 2022 17:09:55 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 000FA10E4CF;
	Wed, 16 Nov 2022 16:09:30 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from smtp-out1.suse.de (smtp-out1.suse.de [IPv6:2001:67c:2178:6::1c])
 by gabe.freedesktop.org (Postfix) with ESMTPS id EB06E10E4CE
 for <dri-devel@lists.freedesktop.org>; Wed, 16 Nov 2022 16:09:21 +0000 (UTC)
Received: from imap2.suse-dmz.suse.de (imap2.suse-dmz.suse.de [192.168.254.74])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature ECDSA (P-521) server-digest SHA512)
 (No client certificate requested)
 by smtp-out1.suse.de (Postfix) with ESMTPS id 9A14922098;
 Wed, 16 Nov 2022 16:09:20 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.de; s=susede2_rsa;
 t=1668614960; h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
 mime-version:mime-version:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=lAtkQiFgQLAFTvjdJRCf7otT9z7SpVUnaTH14yZcJbc=;
 b=NWG7lAIxHmqyzjGORqfO2dEaLHsP77KARJOW7lcX3qUCnPhIzMhPlecay7xqtthNDVoS4N
 JirOxKv742ucgmMSIdPIzOMA1GruCUl4hVSOteLq2TW7lCmyUygf3jyvccACimIBwTJZc1
 f4FghklyL71H2a3fnLaPH26xPjWEg8U=
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed; d=suse.de;
 s=susede2_ed25519; t=1668614960;
 h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
 mime-version:mime-version:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=lAtkQiFgQLAFTvjdJRCf7otT9z7SpVUnaTH14yZcJbc=;
 b=LyYmrgi7YzSki+A922TxabhFuisRVA678QyKmZi4zbCqVwVrWDN1lIjEYmI3rM2EvIXmLE
 /Z73TH4VYgb7UCBA==
Received: from imap2.suse-dmz.suse.de (imap2.suse-dmz.suse.de [192.168.254.74])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature ECDSA (P-521) server-digest SHA512)
 (No client certificate requested)
 by imap2.suse-dmz.suse.de (Postfix) with ESMTPS id 516F913AC7;
 Wed, 16 Nov 2022 16:09:20 +0000 (UTC)
Received: from dovecot-director2.suse.de ([192.168.254.65])
 by imap2.suse-dmz.suse.de with ESMTPSA id uLIEEzALdWP/fwAAMHmgww
 (envelope-from <tzimmermann@suse.de>); Wed, 16 Nov 2022 16:09:20 +0000
From: Thomas Zimmermann <tzimmermann@suse.de>
To: daniel@ffwll.ch, airlied@gmail.com, mripard@kernel.org,
 maarten.lankhorst@linux.intel.com, xinliang.liu@linaro.org,
 tiantao6@hisilicon.com, jstultz@google.com, kong.kongxinwei@hisilicon.com,
 puck.chen@hisilicon.com, paul.kocialkowski@bootlin.com, javierm@redhat.com,
 airlied@redhat.com, kraxel@redhat.com
Subject: [PATCH 5/7] drm/simpledrm: Set preferred depth from format of scanout
 buffer
Date: Wed, 16 Nov 2022 17:09:15 +0100
Message-Id: <20221116160917.26342-6-tzimmermann@suse.de>
X-Mailer: git-send-email 2.38.1
In-Reply-To: <20221116160917.26342-1-tzimmermann@suse.de>
References: <20221116160917.26342-1-tzimmermann@suse.de>
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
Cc: Thomas Zimmermann <tzimmermann@suse.de>, dri-devel@lists.freedesktop.org,
 virtualization@lists.linux-foundation.org
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

Set the preferred depth from the format of the scanout buffer. The
value cannot be hardcoded, as the scanout buffer's is only known at
runtime. Also derive the fbdev emulations bpp value from the scanout
format.

Signed-off-by: Thomas Zimmermann <tzimmermann@suse.de>
---
 drivers/gpu/drm/tiny/simpledrm.c | 4 ++--
 1 file changed, 2 insertions(+), 2 deletions(-)

diff --git a/drivers/gpu/drm/tiny/simpledrm.c b/drivers/gpu/drm/tiny/simpledrm.c
index 162eb44dcba89..30e928d627e8f 100644
--- a/drivers/gpu/drm/tiny/simpledrm.c
+++ b/drivers/gpu/drm/tiny/simpledrm.c
@@ -739,7 +739,7 @@ static struct simpledrm_device *simpledrm_device_create(struct drm_driver *drv,
 	dev->mode_config.max_width = max_width;
 	dev->mode_config.min_height = height;
 	dev->mode_config.max_height = max_height;
-	dev->mode_config.preferred_depth = format->cpp[0] * 8;
+	dev->mode_config.preferred_depth = format->depth;
 	dev->mode_config.funcs = &simpledrm_mode_config_funcs;
 
 	/* Primary plane */
@@ -834,7 +834,7 @@ static int simpledrm_probe(struct platform_device *pdev)
 	if (ret)
 		return ret;
 
-	drm_fbdev_generic_setup(dev, 0);
+	drm_fbdev_generic_setup(dev, drm_format_info_bpp(sdev->format, 0));
 
 	return 0;
 }
-- 
2.38.1

