Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 48F3243A14F
	for <lists+dri-devel@lfdr.de>; Mon, 25 Oct 2021 21:37:03 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id C916389CF4;
	Mon, 25 Oct 2021 19:36:59 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-ua1-x936.google.com (mail-ua1-x936.google.com
 [IPv6:2607:f8b0:4864:20::936])
 by gabe.freedesktop.org (Postfix) with ESMTPS id A9ACF89CF4
 for <dri-devel@lists.freedesktop.org>; Mon, 25 Oct 2021 19:36:58 +0000 (UTC)
Received: by mail-ua1-x936.google.com with SMTP id f4so24459886uad.4
 for <dri-devel@lists.freedesktop.org>; Mon, 25 Oct 2021 12:36:58 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20210112;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=g8AjUosguFFwtSTTUN5QcdLFCu3iDK1fKV4GOcMHHcY=;
 b=PcFs/wEZ8VbxCwliv/507Hskt3Tv4UKYeemuI4UqTdrbbsNSUr77o2qmmmm8veIpOU
 L7BTaLKeNRglTJlWBkS+BcovqQzHdCPqnjRqaYDv16pZeVLDzTYEmsZ9nacC4111Zcfn
 JyaN+U+y9SpQeut3Sd+edrj0KkOGxA+SdurMwcAinP3rPQ/aoO81o41mouHeVEDzDGIW
 nkiI79WpaXten0IEE+fhz8xPprhNA74wfQfVG5RyOedDQ+OpkqWDEqj+9x5yggc1Anib
 IL2WhHGrwuq3akF2auf2gNUKxa1mLGdm/pAdN29QPFJY1qRPRF5knJE10cL0GmkGet8Y
 q8MQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=g8AjUosguFFwtSTTUN5QcdLFCu3iDK1fKV4GOcMHHcY=;
 b=s+vJTHAkPMD6AY0yz+Hj38QujwXbMzSMsGNkDl2DUqPtntuuDV2r3djiwaie1qIDpa
 auXNzRou6FCP82D6MWKlAdEl1j/fXKiLSTmGazNyfZv7+VveAFtop5zMMFxZMZHM65kn
 s1phPr5cToRgAXWgNPT2LvmiKq594IeggC4lrZ1HQYVFYcDyJiPXhaVXALFHEAiAVIRn
 rpV9UhBAwcuCzW29mu263hyqWqRMcVbQAQF/cJEqpFVGRffPU6dSBfX0U2jMi3YnDYFE
 eMNO0OVHoedEjzsSKTK8mJ27vT3vOAkxbljbVU6SMvkV7gRjU8VYDlOCTiPFdfbCZ+Cm
 oTsA==
X-Gm-Message-State: AOAM533eTFpA1beIER7JdzINcf0q8+tPHczvKa28TgnCywj3jYe2ZPcn
 txqaBNUfXsyf3UAY80EG6nA=
X-Google-Smtp-Source: ABdhPJxbIFVEYUhGCmCqLkmeJIKfqKSxp4Bt9YHB2j6AjqyrxO8wYtK4xzn/gHvg9xXj6E+uc6prZw==
X-Received: by 2002:ab0:344e:: with SMTP id a14mr17215149uaq.63.1635190617719; 
 Mon, 25 Oct 2021 12:36:57 -0700 (PDT)
Received: from localhost.localdomain ([2804:431:c7f4:5469:b11e:67b8:49d2:1744])
 by smtp.googlemail.com with ESMTPSA id k1sm10722013uaq.0.2021.10.25.12.36.54
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Mon, 25 Oct 2021 12:36:57 -0700 (PDT)
From: Igor Torrente <igormtorrente@gmail.com>
To: rodrigosiqueiramelo@gmail.com, melissa.srw@gmail.com, ppaalanen@gmail.com,
 tzimmermann@suse.de
Cc: Igor Torrente <igormtorrente@gmail.com>, hamohammed.sa@gmail.com,
 daniel@ffwll.ch, airlied@linux.ie, contact@emersion.fr,
 leandro.ribeiro@collabora.com, dri-devel@lists.freedesktop.org
Subject: [PATCH v2 1/8] drm: vkms: Replace the deprecated drm_mode_config_init
Date: Mon, 25 Oct 2021 16:34:37 -0300
Message-Id: <20211025193444.131207-2-igormtorrente@gmail.com>
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

The `drm_mode_config_init` was deprecated since c3b790e commit, and it's
being replaced by the `drmm_mode_config_init`.

Signed-off-by: Igor Torrente <igormtorrente@gmail.com>
---
V2: Change the code style(Thomas Zimmermann).
---
 drivers/gpu/drm/vkms/vkms_drv.c | 6 +++++-
 1 file changed, 5 insertions(+), 1 deletion(-)

diff --git a/drivers/gpu/drm/vkms/vkms_drv.c b/drivers/gpu/drm/vkms/vkms_drv.c
index 0ffe5f0e33f7..ee4d96dabe19 100644
--- a/drivers/gpu/drm/vkms/vkms_drv.c
+++ b/drivers/gpu/drm/vkms/vkms_drv.c
@@ -140,8 +140,12 @@ static const struct drm_mode_config_helper_funcs vkms_mode_config_helpers = {
 static int vkms_modeset_init(struct vkms_device *vkmsdev)
 {
 	struct drm_device *dev = &vkmsdev->drm;
+	int ret;
+
+	ret = drmm_mode_config_init(dev);
+	if (ret < 0)
+		return ret;
 
-	drm_mode_config_init(dev);
 	dev->mode_config.funcs = &vkms_mode_funcs;
 	dev->mode_config.min_width = XRES_MIN;
 	dev->mode_config.min_height = YRES_MIN;
-- 
2.30.2

