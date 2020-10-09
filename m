Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 09173289C17
	for <lists+dri-devel@lfdr.de>; Sat, 10 Oct 2020 01:22:11 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 95CB16EE53;
	Fri,  9 Oct 2020 23:22:06 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-wr1-x444.google.com (mail-wr1-x444.google.com
 [IPv6:2a00:1450:4864:20::444])
 by gabe.freedesktop.org (Postfix) with ESMTPS id B07206EE51
 for <dri-devel@lists.freedesktop.org>; Fri,  9 Oct 2020 23:22:04 +0000 (UTC)
Received: by mail-wr1-x444.google.com with SMTP id m6so11914266wrn.0
 for <dri-devel@lists.freedesktop.org>; Fri, 09 Oct 2020 16:22:04 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ffwll.ch; s=google;
 h=from:to:cc:subject:date:message-id:mime-version
 :content-transfer-encoding;
 bh=WFjpd2LMWZKtw14WnfA3ImJlHGWj1wE23XHAJSgjLD8=;
 b=SVEOfIA7b3z8w4hrjoR3M15Z8aVNodhk01zfG/EdIGBh13ANzRuv7fr1zKOaU3Poi0
 nmgyZ4ec3/FTi5AU4WW9s8YopfFPkyUvIX5ku2WVAMFYRhnWLFP6RoMQWxkVs1V6Tzeg
 lrLRQf5X3YUPDhFJwL0UyyNMI6hTnFaL4pyTg=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:mime-version
 :content-transfer-encoding;
 bh=WFjpd2LMWZKtw14WnfA3ImJlHGWj1wE23XHAJSgjLD8=;
 b=QE8AmkfoyFpzl1Gk//Y0ByIQEuNY+j/7e10anVfNMbcmjiyrXH3PhTrWvAKU2i2sG7
 pNi71olrT9y7LIV1h5K7wdWPksulc/ZfBuZvcUi7BXMrGc/XXvkyQDvZIaZHNk1tLsaF
 ULq8ZLL9VFtBmpKLy/A/CN4ydLCrAaMbd08dtgDuPcmiCBjcDB56H9IUyDFWMO4cQeWl
 s80U0ZVoRppqqVMpbioX3dnvcYrhkLpaB+9sYmG25mANfEk+e9G/vxkdctjaX1m5WPKB
 CWYuB3eRDLqOT9jwolwoengiV8cwQplaF1TcLSobVs/DK2yWYEkFGhlR2pKQmAQN5s/D
 BYRA==
X-Gm-Message-State: AOAM532q6XahdlO5sN4yXDFfkK6cyhe/+JHb59TCsrURZqMGq5PJODlI
 CC3RLveDb2eXwoiw0gpPxci1YgE0eVxBPEdg
X-Google-Smtp-Source: ABdhPJzrEDEAdPmhrOl9nZmh2mCX3L6TOJuoTX/Rd//CRCoDpu/b6hnOvihW+Z+ZciKBYNfPl/fTKw==
X-Received: by 2002:a5d:40cb:: with SMTP id b11mr14341693wrq.254.1602285723143; 
 Fri, 09 Oct 2020 16:22:03 -0700 (PDT)
Received: from phenom.ffwll.local ([2a02:168:57f4:0:efd0:b9e5:5ae6:c2fa])
 by smtp.gmail.com with ESMTPSA id w1sm14302542wrp.95.2020.10.09.16.22.02
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Fri, 09 Oct 2020 16:22:02 -0700 (PDT)
From: Daniel Vetter <daniel.vetter@ffwll.ch>
To: DRI Development <dri-devel@lists.freedesktop.org>
Subject: [PATCH 1/3] drm/vkms: Set preferred depth correctly
Date: Sat, 10 Oct 2020 01:21:54 +0200
Message-Id: <20201009232156.3916879-1-daniel.vetter@ffwll.ch>
X-Mailer: git-send-email 2.28.0
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
Cc: Haneen Mohammed <hamohammed.sa@gmail.com>,
 Rodrigo Siqueira <rodrigosiqueiramelo@gmail.com>,
 Daniel Vetter <daniel.vetter@ffwll.ch>, Melissa Wen <melissa.srw@gmail.com>,
 Daniel Vetter <daniel.vetter@intel.com>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

The only thing we support is xrgb8888.

Signed-off-by: Daniel Vetter <daniel.vetter@intel.com>
Cc: Rodrigo Siqueira <rodrigosiqueiramelo@gmail.com>
Cc: Melissa Wen <melissa.srw@gmail.com>
Cc: Haneen Mohammed <hamohammed.sa@gmail.com>
Cc: Daniel Vetter <daniel@ffwll.ch>
---
 drivers/gpu/drm/vkms/vkms_drv.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/drivers/gpu/drm/vkms/vkms_drv.c b/drivers/gpu/drm/vkms/vkms_drv.c
index 726801ab44d4..eb4007443706 100644
--- a/drivers/gpu/drm/vkms/vkms_drv.c
+++ b/drivers/gpu/drm/vkms/vkms_drv.c
@@ -124,7 +124,7 @@ static int vkms_modeset_init(struct vkms_device *vkmsdev)
 	dev->mode_config.max_height = YRES_MAX;
 	dev->mode_config.cursor_width = 512;
 	dev->mode_config.cursor_height = 512;
-	dev->mode_config.preferred_depth = 24;
+	dev->mode_config.preferred_depth = 32;
 	dev->mode_config.helper_private = &vkms_mode_config_helpers;
 
 	return vkms_output_init(vkmsdev, 0);
-- 
2.28.0

_______________________________________________
dri-devel mailing list
dri-devel@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/dri-devel
