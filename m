Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 0FC4443A15A
	for <lists+dri-devel@lfdr.de>; Mon, 25 Oct 2021 21:37:11 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id F01476E202;
	Mon, 25 Oct 2021 19:37:07 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-ua1-x930.google.com (mail-ua1-x930.google.com
 [IPv6:2607:f8b0:4864:20::930])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 9A9AC6E207
 for <dri-devel@lists.freedesktop.org>; Mon, 25 Oct 2021 19:37:04 +0000 (UTC)
Received: by mail-ua1-x930.google.com with SMTP id f24so5307477uav.12
 for <dri-devel@lists.freedesktop.org>; Mon, 25 Oct 2021 12:37:04 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20210112;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=4h5zssoprQVwUD/a+0iu7NgShrwtvdhuvMV0VoWpIVI=;
 b=AfFIH3PNBuyuiRd7wt9SbKOfVrU39AWSS0wMW64L31R7mkj/gIdjKFd7yyNB1xQtX8
 UMvVanm23vGqCakOy/fdazF/bUTiJPXI3HOQ9f9NCz+j1sZ1n41aYY6vwGkBVfaZc3CR
 vf1moKvOUoUedAMtwFZXhIVhBSi/1W1ycgwWBopc8sXWPxvLR+qgx8FeUpuMkGmDdpfF
 A5zW1TuG4JMDFw8PZhmPPJt96ZH3Nl2fqTquSTL/nsajjxB+j38DNNErkE1MG/xRdXyD
 9pxP9q57JFqc1ZQ6S9OfxhFvtFUC37JvIP3WPs9Vu69gJbumrqTR/1dOXwrHNah3teCc
 L5uQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=4h5zssoprQVwUD/a+0iu7NgShrwtvdhuvMV0VoWpIVI=;
 b=J0k94xmq/T4v1tRQKH5aW55t8isEXJvSy9NNeTN3wIpXkq4A+pDTdhFJmT5M/5kNjj
 ZR3oPwvsnJZ6mmMXN/rIxJrdTU5sSw1SCAYaCFLvOOQbEV5uFUv1vdS61LVNTvCMcYS4
 b/Gwtv49UKNqzvbuEeLcjC2y9JKF61fxCQmUXbPoWo5sKDIawnMwLYSlmxT6Ug/1V0ps
 lxf/aWNYllaX7kVHLtjN0huJ/EtFfcSf1g9Pah4Hm9oD4YyXbl13I0MyY1b65klzYaGs
 UstX5qnQ+gSwi+yN65DlOAvZaQX2bTeE+XbsvL61sNfQw6qzjz/zoPkZz9ntCKtf9uLA
 eeUw==
X-Gm-Message-State: AOAM531STu295pjYOtq72ArAU6UB2FVvfcIm+39oMiRBadM4kfHM7EVf
 MBovpm5CUrjpGS3kQgX0aCI=
X-Google-Smtp-Source: ABdhPJwKa8WuN24vWFE+ZjfJvyn0cipMm9CoKlqLtaZwmLUbo7Rzu+Wpx4BcJOY5MG+PtJbIcBYp1A==
X-Received: by 2002:a67:ed5a:: with SMTP id m26mr17102156vsp.35.1635190623644; 
 Mon, 25 Oct 2021 12:37:03 -0700 (PDT)
Received: from localhost.localdomain ([2804:431:c7f4:5469:b11e:67b8:49d2:1744])
 by smtp.googlemail.com with ESMTPSA id k1sm10722013uaq.0.2021.10.25.12.37.00
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Mon, 25 Oct 2021 12:37:03 -0700 (PDT)
From: Igor Torrente <igormtorrente@gmail.com>
To: rodrigosiqueiramelo@gmail.com, melissa.srw@gmail.com, ppaalanen@gmail.com,
 tzimmermann@suse.de
Cc: Igor Torrente <igormtorrente@gmail.com>, hamohammed.sa@gmail.com,
 daniel@ffwll.ch, airlied@linux.ie, contact@emersion.fr,
 leandro.ribeiro@collabora.com, dri-devel@lists.freedesktop.org
Subject: [PATCH v2 3/8] drm: vkms: Replace hardcoded value of
 `vkms_composer.map` to DRM_FORMAT_MAX_PLANES
Date: Mon, 25 Oct 2021 16:34:39 -0300
Message-Id: <20211025193444.131207-4-igormtorrente@gmail.com>
X-Mailer: git-send-email 2.30.2
In-Reply-To: <20211025193444.131207-1-igormtorrente@gmail.com>
References: <20211025193444.131207-1-igormtorrente@gmail.com>
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
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

The `map` vector at `vkms_composer` uses a hardcoded value to define its
size.

If someday the maximum number of planes increases, this hardcoded value
can be a problem.

This value is being replaced with the DRM_FORMAT_MAX_PLANES macro.

Signed-off-by: Igor Torrente <igormtorrente@gmail.com>
---
 drivers/gpu/drm/vkms/vkms_drv.h | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/drivers/gpu/drm/vkms/vkms_drv.h b/drivers/gpu/drm/vkms/vkms_drv.h
index d48c23d40ce5..64e62993b06f 100644
--- a/drivers/gpu/drm/vkms/vkms_drv.h
+++ b/drivers/gpu/drm/vkms/vkms_drv.h
@@ -28,7 +28,7 @@ struct vkms_writeback_job {
 struct vkms_composer {
 	struct drm_framebuffer fb;
 	struct drm_rect src, dst;
-	struct dma_buf_map map[4];
+	struct dma_buf_map map[DRM_FORMAT_MAX_PLANES];
 	unsigned int offset;
 	unsigned int pitch;
 	unsigned int cpp;
-- 
2.30.2

