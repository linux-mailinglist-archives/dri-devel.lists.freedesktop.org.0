Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 891913D0F59
	for <lists+dri-devel@lfdr.de>; Wed, 21 Jul 2021 15:17:12 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 48C286E959;
	Wed, 21 Jul 2021 13:17:09 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from smtp-out1.suse.de (smtp-out1.suse.de [195.135.220.28])
 by gabe.freedesktop.org (Postfix) with ESMTPS id B4F976E959
 for <dri-devel@lists.freedesktop.org>; Wed, 21 Jul 2021 13:17:07 +0000 (UTC)
Received: from imap2.suse-dmz.suse.de (imap2.suse-dmz.suse.de [192.168.254.74])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature ECDSA (P-521) server-digest SHA512)
 (No client certificate requested)
 by smtp-out1.suse.de (Postfix) with ESMTPS id 6665B2250F;
 Wed, 21 Jul 2021 13:17:06 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.de; s=susede2_rsa;
 t=1626873426; h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
 mime-version:mime-version: content-transfer-encoding:content-transfer-encoding;
 bh=en8PnrfyZpoKhdT7a1I/BEW/feKEZYXxxWyeQkMBV1g=;
 b=GGRxR0Y48XtfK6LmuGuePzkWe6W8mHhBQ84bcbEgW2VI/2ZwQAObXp4xkrkq+RijNq67zT
 gCeFzAQpeux5rnMn6/b+2JoTqm52RwLXP1xEwtFl/0HnihIrklYOq1nTmc978yII58gVcP
 /DF83vHiFbSqJLRqUKz8u8Y3rIbpaEA=
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed; d=suse.de;
 s=susede2_ed25519; t=1626873426;
 h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
 mime-version:mime-version: content-transfer-encoding:content-transfer-encoding;
 bh=en8PnrfyZpoKhdT7a1I/BEW/feKEZYXxxWyeQkMBV1g=;
 b=XzkUaZmL76gMku6qf3jhfVG/cbQjGIGTtI+P4p5QVtcC7lMLatuVeaK3GylnyF2YBKQRnq
 I7wVoJ74uf/9w+AA==
Received: from imap2.suse-dmz.suse.de (imap2.suse-dmz.suse.de [192.168.254.74])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature ECDSA (P-521) server-digest SHA512)
 (No client certificate requested)
 by imap2.suse-dmz.suse.de (Postfix) with ESMTPS id 16785139F8;
 Wed, 21 Jul 2021 13:17:06 +0000 (UTC)
Received: from dovecot-director2.suse.de ([192.168.254.65])
 by imap2.suse-dmz.suse.de with ESMTPSA id ZGNsA1Ie+GD9YAAAMHmgww
 (envelope-from <tzimmermann@suse.de>); Wed, 21 Jul 2021 13:17:06 +0000
From: Thomas Zimmermann <tzimmermann@suse.de>
To: xinliang.liu@linaro.org, tiantao6@hisilicon.com, john.stultz@linaro.org,
 kong.kongxinwei@hisilicon.com, puck.chen@hisilicon.com, airlied@linux.ie,
 daniel@ffwll.ch, maxime@cerno.tech, sam@ravnborg.org
Subject: [PATCH] drm/hisilicon/hibmc: Remove variable 'priv' from
 hibmc_unload()
Date: Wed, 21 Jul 2021 15:17:04 +0200
Message-Id: <20210721131704.10306-1-tzimmermann@suse.de>
X-Mailer: git-send-email 2.32.0
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
 Thomas Zimmermann <tzimmermann@suse.de>, dri-devel@lists.freedesktop.org
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

The variable 'priv' got introduced in commit 39a364a19e03
("drm/hisilicon/hibmc: Convert to Linux IRQ interfaces") by accident.
It's unused; remove it. Fixes a compiler warning.

Signed-off-by: Thomas Zimmermann <tzimmermann@suse.de>
Fixes: 39a364a19e03 ("drm/hisilicon/hibmc: Convert to Linux IRQ interfaces")
Reported-by: Dave Airlie <airlied@gmail.com>
Cc: Thomas Zimmermann <tzimmermann@suse.de>
Cc: Tian Tao <tiantao6@hisilicon.com>
Cc: Maxime Ripard <maxime@cerno.tech>
Cc: Daniel Vetter <daniel.vetter@ffwll.ch>
Cc: Sam Ravnborg <sam@ravnborg.org>
---
 drivers/gpu/drm/hisilicon/hibmc/hibmc_drm_drv.c | 1 -
 1 file changed, 1 deletion(-)

diff --git a/drivers/gpu/drm/hisilicon/hibmc/hibmc_drm_drv.c b/drivers/gpu/drm/hisilicon/hibmc/hibmc_drm_drv.c
index f73a8e0ea12e..610fc8e135f9 100644
--- a/drivers/gpu/drm/hisilicon/hibmc/hibmc_drm_drv.c
+++ b/drivers/gpu/drm/hisilicon/hibmc/hibmc_drm_drv.c
@@ -249,7 +249,6 @@ static int hibmc_hw_init(struct hibmc_drm_private *priv)
 
 static int hibmc_unload(struct drm_device *dev)
 {
-	struct hibmc_drm_private *priv = to_hibmc_drm_private(dev);
 	struct pci_dev *pdev = to_pci_dev(dev->dev);
 
 	drm_atomic_helper_shutdown(dev);
-- 
2.32.0

