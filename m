Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 440AF635C3A
	for <lists+dri-devel@lfdr.de>; Wed, 23 Nov 2022 12:54:27 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id C69E010E374;
	Wed, 23 Nov 2022 11:54:00 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from smtp-out2.suse.de (smtp-out2.suse.de [IPv6:2001:67c:2178:6::1d])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 7CBC610E231
 for <dri-devel@lists.freedesktop.org>; Wed, 23 Nov 2022 11:53:52 +0000 (UTC)
Received: from imap2.suse-dmz.suse.de (imap2.suse-dmz.suse.de [192.168.254.74])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature ECDSA (P-521) server-digest SHA512)
 (No client certificate requested)
 by smtp-out2.suse.de (Postfix) with ESMTPS id 1E6201F8C7;
 Wed, 23 Nov 2022 11:53:51 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.de; s=susede2_rsa;
 t=1669204431; h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
 mime-version:mime-version:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=Gf3YaGtEexv0SFFzbllG0pEizFggOGmPzjVdwHBP1d8=;
 b=WoHkAmKF/mOFiawBxB+stMX37dENl3ij+fmjkSQnhpertga4taZeZMSNvHKd7IxHrJmAGS
 VNYhJ7kvHZkS9VeJe0mNUDlmrcmcnsGaalkoyJZKQokR8F7dS5Wf5nIpFEDVnBpjhZ+1Ol
 /nunqgYVRwfoWtFtm4rbtSA7xJYuZTg=
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed; d=suse.de;
 s=susede2_ed25519; t=1669204431;
 h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
 mime-version:mime-version:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=Gf3YaGtEexv0SFFzbllG0pEizFggOGmPzjVdwHBP1d8=;
 b=Jq3m5ij0sBDRxRcxnaIObXVzEnHv2WspzTupiOVxtAmU5g0r+co9ZlIVDEC+bX05BNIY+E
 WC8W41PJgkfEj4Bw==
Received: from imap2.suse-dmz.suse.de (imap2.suse-dmz.suse.de [192.168.254.74])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature ECDSA (P-521) server-digest SHA512)
 (No client certificate requested)
 by imap2.suse-dmz.suse.de (Postfix) with ESMTPS id CA6CE13B03;
 Wed, 23 Nov 2022 11:53:50 +0000 (UTC)
Received: from dovecot-director2.suse.de ([192.168.254.65])
 by imap2.suse-dmz.suse.de with ESMTPSA id uCaRMM4JfmMwVwAAMHmgww
 (envelope-from <tzimmermann@suse.de>); Wed, 23 Nov 2022 11:53:50 +0000
From: Thomas Zimmermann <tzimmermann@suse.de>
To: daniel@ffwll.ch, airlied@gmail.com, mripard@kernel.org,
 maarten.lankhorst@linux.intel.com, xinliang.liu@linaro.org,
 tiantao6@hisilicon.com, jstultz@google.com, kong.kongxinwei@hisilicon.com,
 puck.chen@hisilicon.com, paul.kocialkowski@bootlin.com, javierm@redhat.com,
 airlied@redhat.com, kraxel@redhat.com
Subject: [PATCH v2 1/7] drm/hisilicon/hibmc: Fix preferred depth and bpp
Date: Wed, 23 Nov 2022 12:53:42 +0100
Message-Id: <20221123115348.2521-2-tzimmermann@suse.de>
X-Mailer: git-send-email 2.38.1
In-Reply-To: <20221123115348.2521-1-tzimmermann@suse.de>
References: <20221123115348.2521-1-tzimmermann@suse.de>
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
Cc: Daniel Vetter <daniel.vetter@ffwll.ch>,
 Thomas Zimmermann <tzimmermann@suse.de>, dri-devel@lists.freedesktop.org,
 virtualization@lists.linux-foundation.org
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

Set the preferred color depth to 24 bits and the fbdev bpp to 32
bits. This will signal XRGB8888 as default format to clients.

Signed-off-by: Thomas Zimmermann <tzimmermann@suse.de>
Reviewed-by: Javier Martinez Canillas <javierm@redhat.com>
Acked-by: Daniel Vetter <daniel.vetter@ffwll.ch>
---
 drivers/gpu/drm/hisilicon/hibmc/hibmc_drm_drv.c | 4 ++--
 1 file changed, 2 insertions(+), 2 deletions(-)

diff --git a/drivers/gpu/drm/hisilicon/hibmc/hibmc_drm_drv.c b/drivers/gpu/drm/hisilicon/hibmc/hibmc_drm_drv.c
index 22053c613644a..0c4aa4d9b0a77 100644
--- a/drivers/gpu/drm/hisilicon/hibmc/hibmc_drm_drv.c
+++ b/drivers/gpu/drm/hisilicon/hibmc/hibmc_drm_drv.c
@@ -106,7 +106,7 @@ static int hibmc_kms_init(struct hibmc_drm_private *priv)
 	dev->mode_config.max_width = 1920;
 	dev->mode_config.max_height = 1200;
 
-	dev->mode_config.preferred_depth = 32;
+	dev->mode_config.preferred_depth = 24;
 	dev->mode_config.prefer_shadow = 1;
 
 	dev->mode_config.funcs = (void *)&hibmc_mode_funcs;
@@ -340,7 +340,7 @@ static int hibmc_pci_probe(struct pci_dev *pdev,
 		goto err_unload;
 	}
 
-	drm_fbdev_generic_setup(dev, dev->mode_config.preferred_depth);
+	drm_fbdev_generic_setup(dev, 32);
 
 	return 0;
 
-- 
2.38.1

