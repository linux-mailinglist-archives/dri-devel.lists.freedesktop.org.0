Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 05A744E3F4F
	for <lists+dri-devel@lfdr.de>; Tue, 22 Mar 2022 14:17:50 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id F0DD410E5B5;
	Tue, 22 Mar 2022 13:17:47 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-wm1-x333.google.com (mail-wm1-x333.google.com
 [IPv6:2a00:1450:4864:20::333])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 5F85310E5B5
 for <dri-devel@lists.freedesktop.org>; Tue, 22 Mar 2022 13:17:46 +0000 (UTC)
Received: by mail-wm1-x333.google.com with SMTP id
 j13-20020a05600c1c0d00b0038c8f94aac2so2440819wms.3
 for <dri-devel@lists.freedesktop.org>; Tue, 22 Mar 2022 06:17:46 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20210112;
 h=from:to:cc:subject:date:message-id:mime-version
 :content-transfer-encoding;
 bh=jcAdwOq2j8TeBjwzI2tou0LSfgzuwTQMKqdxGJIlwp0=;
 b=TttRMwIfyGxRo3uySO3TfdJcJqv1JwCSHALjOFXVWa5YwAcuamAovg3NYawB0EAdDR
 QDaceYwqAAGIruXnmKP3dTRHgrkaoIGzlZUVr0wM22xY5TiUWlZVD6G9kheRVShT4Fjt
 /rTsSZrh9LVtp8JA+SPlbsJ+6EMF1hSNaGUU3pwpbgag5TAFDitfmEnAPlBSMtBOWRzn
 fVFMcjbAEpiiXVRjryBSHy1jK2wCpTs4GAyrYCwqdNnECuemsLxRMOOxL2EE3itKVluF
 Xs+9R3j7zMrPNW8CQsq0YhRnNWQLnd3//eSq/ojChZEQejx/f7xCFxEr9VI6Iyp7kmM1
 ZutA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:mime-version
 :content-transfer-encoding;
 bh=jcAdwOq2j8TeBjwzI2tou0LSfgzuwTQMKqdxGJIlwp0=;
 b=PLTWxG07HYnWyirESXalhkorwwp9ouJjuY7c+orB126hZdxqcN5RZ6YSfksuoWtaWV
 Iwb2YzmgPW7TQsnxYIBONB+l0dwotwNUSYUABUwGYmB+u8RuUxBXBptruh1IsRJfTS6l
 1az+DeNvlVCvTr34TqapBTleTtj0eRffL5b6F5yj+cv4T1o1+O+49kFTKq9M7EOqJV3t
 rhUYqK5fePeTnnkoDWi3Y6c3Qyl+YHjedDoZYObTXXRy8HCDAioaQuGDnJzjjAvyAlDs
 RO+uFtNLJq2BFeXsqfY2OHyShb9fYbUO6mX13Zyy0c1OV5Wls6IRjz59moxqtobJWNbD
 XQVA==
X-Gm-Message-State: AOAM531nRcZ9j/QJ9oKfVrtgPFrijzRWgFSo1s/OIhgf0wD6fO689KOD
 uLSY9URllsqrnTS8mpzxXZa59BKDJgg=
X-Google-Smtp-Source: ABdhPJxUnzkGrIxyrBeINocbJwCwlaky72oWAPCd9n8ZqwcnMT0acxEOTGI7qjICMd76lLYCieYACg==
X-Received: by 2002:a05:600c:1d0f:b0:38c:8ff8:e703 with SMTP id
 l15-20020a05600c1d0f00b0038c8ff8e703mr3807494wms.202.1647955064372; 
 Tue, 22 Mar 2022 06:17:44 -0700 (PDT)
Received: from workstation.suse.de (81-226-149-122-no518.tbcn.telia.com.
 [81.226.149.122]) by smtp.gmail.com with ESMTPSA id
 l13-20020a05600002ad00b00203d64c5289sm17978437wry.112.2022.03.22.06.17.43
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Tue, 22 Mar 2022 06:17:43 -0700 (PDT)
From: Patrik Jakobsson <patrik.r.jakobsson@gmail.com>
To: dri-devel@lists.freedesktop.org
Subject: [PATCH 1/7] drm/gma500: Use managed drmm_mode_config_init()
Date: Tue, 22 Mar 2022 14:17:36 +0100
Message-Id: <20220322131742.11566-1-patrik.r.jakobsson@gmail.com>
X-Mailer: git-send-email 2.35.1
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
Cc: daniel.vetter@ffwll.ch, sam@ravnborg.org, tzimmermann@suse.de
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

Signed-off-by: Patrik Jakobsson <patrik.r.jakobsson@gmail.com>
---
 drivers/gpu/drm/gma500/framebuffer.c | 4 ++--
 1 file changed, 2 insertions(+), 2 deletions(-)

diff --git a/drivers/gpu/drm/gma500/framebuffer.c b/drivers/gpu/drm/gma500/framebuffer.c
index 45df9de22007..2b99c996fdc2 100644
--- a/drivers/gpu/drm/gma500/framebuffer.c
+++ b/drivers/gpu/drm/gma500/framebuffer.c
@@ -514,7 +514,8 @@ void psb_modeset_init(struct drm_device *dev)
 	struct pci_dev *pdev = to_pci_dev(dev->dev);
 	int i;
 
-	drm_mode_config_init(dev);
+	if (drmm_mode_config_init(dev))
+		return;
 
 	dev->mode_config.min_width = 0;
 	dev->mode_config.min_height = 0;
@@ -546,6 +547,5 @@ void psb_modeset_cleanup(struct drm_device *dev)
 	if (dev_priv->modeset) {
 		drm_kms_helper_poll_fini(dev);
 		psb_fbdev_fini(dev);
-		drm_mode_config_cleanup(dev);
 	}
 }
-- 
2.35.1

