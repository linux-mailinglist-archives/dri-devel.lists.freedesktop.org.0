Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id A7BF535DB9A
	for <lists+dri-devel@lfdr.de>; Tue, 13 Apr 2021 11:49:16 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 0A66D89BAC;
	Tue, 13 Apr 2021 09:49:13 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-wr1-x434.google.com (mail-wr1-x434.google.com
 [IPv6:2a00:1450:4864:20::434])
 by gabe.freedesktop.org (Postfix) with ESMTPS id D6C2589B97
 for <dri-devel@lists.freedesktop.org>; Tue, 13 Apr 2021 09:49:11 +0000 (UTC)
Received: by mail-wr1-x434.google.com with SMTP id e7so6808333wrs.11
 for <dri-devel@lists.freedesktop.org>; Tue, 13 Apr 2021 02:49:11 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ffwll.ch; s=google;
 h=from:to:cc:subject:date:message-id:mime-version
 :content-transfer-encoding;
 bh=w7ucKXrJnIzMOthJlOHj471QYeurlAAFSPpADM6ZH3I=;
 b=lHZKFi8p2s2gQf3z6OTx8EPk7FhTUspBjLx0lknmL9wPZ/OK0T9ykLVrdVBredNgtd
 RUXjoCF0oDM3Fcm1gbcBCK3YyntijYmvKJQHS1LmpYEZoxlM3p2guhVKo7I6yLGbRYwO
 YmmMkB3UZ3jDJCnOcLxAD18bU7jItd2NRDhdE=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:mime-version
 :content-transfer-encoding;
 bh=w7ucKXrJnIzMOthJlOHj471QYeurlAAFSPpADM6ZH3I=;
 b=hY5g5Cn91TDaRjEOtxi0t1wcVdPJ2r32Q7zeADxtFVJ8Z73fW40RfTyhnma/LdIIVf
 TTh0lgHxZfMtzMsuA9VOmXTwcYhuu5QHoBBHR2vsT3Ip2a8KWDMaR0Em/qrDVF2OYLs3
 W0Y+zMSFjmaJa7X90xQM0W+0tNamtj7DeAI8SXQ4h8BIqHmfHSLE66skB3Lcw8sJy4Ag
 UkHkgy3ZSmTxRM/RqbezdUpJ+pfiK4G4KyErS44W937oYmFN5JMg8u02xy7zaN2Mw4gS
 3NIHAvbgSo4Gl/5apWbRg/cugWuwaxIEpvCsVsJqVcEu1R6T+9D4e8ool9BkZW40tYtS
 XRWA==
X-Gm-Message-State: AOAM530AIrew64s4hQdH9hDyfIiezwR8a0NknpKgilAXnMv44G1JmuTr
 KKmJNlcsWv+N6GcLy02NyWftBBEPIMfdUg==
X-Google-Smtp-Source: ABdhPJyNLLLWdmsj1IxqYWpBcGq07B4aRAR8sF7LBNNc6mpuO6LExejBrYGHG/1qTAx9/nQJk+b2Cg==
X-Received: by 2002:a5d:658c:: with SMTP id q12mr35540551wru.30.1618307350470; 
 Tue, 13 Apr 2021 02:49:10 -0700 (PDT)
Received: from phenom.ffwll.local ([2a02:168:57f4:0:efd0:b9e5:5ae6:c2fa])
 by smtp.gmail.com with ESMTPSA id 64sm1956458wmz.7.2021.04.13.02.49.09
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Tue, 13 Apr 2021 02:49:09 -0700 (PDT)
From: Daniel Vetter <daniel.vetter@ffwll.ch>
To: DRI Development <dri-devel@lists.freedesktop.org>
Subject: [PATCH 01/12] drm/arm: Don't set allow_fb_modifiers explicitly
Date: Tue, 13 Apr 2021 11:48:52 +0200
Message-Id: <20210413094904.3736372-1-daniel.vetter@ffwll.ch>
X-Mailer: git-send-email 2.31.0
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
Cc: Daniel Vetter <daniel.vetter@ffwll.ch>,
 Intel Graphics Development <intel-gfx@lists.freedesktop.org>,
 Liviu Dudau <liviu.dudau@arm.com>,
 "James \(Qian\) Wang" <james.qian.wang@arm.com>,
 Daniel Vetter <daniel.vetter@intel.com>,
 Mihail Atanassov <mihail.atanassov@arm.com>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

Since

commit 890880ddfdbe256083170866e49c87618b706ac7
Author: Paul Kocialkowski <paul.kocialkowski@bootlin.com>
Date:   Fri Jan 4 09:56:10 2019 +0100

    drm: Auto-set allow_fb_modifiers when given modifiers at plane init

this is done automatically as part of plane init, if drivers set the
modifier list correctly. Which is the case here for both komeda and
malidp.

Signed-off-by: Daniel Vetter <daniel.vetter@intel.com>
Cc: "James (Qian) Wang" <james.qian.wang@arm.com>
Cc: Liviu Dudau <liviu.dudau@arm.com>
Cc: Mihail Atanassov <mihail.atanassov@arm.com>
Cc: Brian Starkey <brian.starkey@arm.com>
---
 drivers/gpu/drm/arm/display/komeda/komeda_kms.c | 1 -
 drivers/gpu/drm/arm/malidp_drv.c                | 1 -
 2 files changed, 2 deletions(-)

diff --git a/drivers/gpu/drm/arm/display/komeda/komeda_kms.c b/drivers/gpu/drm/arm/display/komeda/komeda_kms.c
index aeda4e5ec4f4..ff45f23f3d56 100644
--- a/drivers/gpu/drm/arm/display/komeda/komeda_kms.c
+++ b/drivers/gpu/drm/arm/display/komeda/komeda_kms.c
@@ -247,7 +247,6 @@ static void komeda_kms_mode_config_init(struct komeda_kms_dev *kms,
 	config->min_height	= 0;
 	config->max_width	= 4096;
 	config->max_height	= 4096;
-	config->allow_fb_modifiers = true;
 
 	config->funcs = &komeda_mode_config_funcs;
 	config->helper_private = &komeda_mode_config_helpers;
diff --git a/drivers/gpu/drm/arm/malidp_drv.c b/drivers/gpu/drm/arm/malidp_drv.c
index d83c7366b348..de59f3302516 100644
--- a/drivers/gpu/drm/arm/malidp_drv.c
+++ b/drivers/gpu/drm/arm/malidp_drv.c
@@ -403,7 +403,6 @@ static int malidp_init(struct drm_device *drm)
 	drm->mode_config.max_height = hwdev->max_line_size;
 	drm->mode_config.funcs = &malidp_mode_config_funcs;
 	drm->mode_config.helper_private = &malidp_mode_config_helpers;
-	drm->mode_config.allow_fb_modifiers = true;
 
 	ret = malidp_crtc_init(drm);
 	if (ret)
-- 
2.31.0

_______________________________________________
dri-devel mailing list
dri-devel@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/dri-devel
