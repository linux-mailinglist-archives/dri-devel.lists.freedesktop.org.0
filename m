Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id C55F643B151
	for <lists+dri-devel@lfdr.de>; Tue, 26 Oct 2021 13:34:53 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id D06CC6E42C;
	Tue, 26 Oct 2021 11:34:49 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-qv1-xf35.google.com (mail-qv1-xf35.google.com
 [IPv6:2607:f8b0:4864:20::f35])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 6BEA76E425
 for <dri-devel@lists.freedesktop.org>; Tue, 26 Oct 2021 11:34:35 +0000 (UTC)
Received: by mail-qv1-xf35.google.com with SMTP id o20so9280034qvk.7
 for <dri-devel@lists.freedesktop.org>; Tue, 26 Oct 2021 04:34:35 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20210112;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=4h5zssoprQVwUD/a+0iu7NgShrwtvdhuvMV0VoWpIVI=;
 b=Z0+Vmb9SA3GDGHWzGshFG2cbmaX3YObyMVExUokXNje/LEUkMcLV4WYwbCeyU/Y6ji
 QEwLhNVikeMQavW4bF9VzdUH9v2cJ7MVLDXDdxBHkgIZtUHMei8q27YEzLdUU5nvTqLD
 5fpKEtd+sBTsiOrPHi4Q6X++ytudP1inXfQQ8CWy1gAgJ46NpoSXB8QAkBlxKFQA4aS7
 vLKuQ9z2SOq9stYZ5qBF/aApjJO8CIoZQAPa0TcuUA00HyJmReax1/Vm+BelMYBQ0TcO
 rkbYXBVfI88M3iYmgkgWeYFCcpY2mYwkN0+Uiyr3W4i7tkqKtmObiBwdP39Tw7kRZfGG
 6Gdg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=4h5zssoprQVwUD/a+0iu7NgShrwtvdhuvMV0VoWpIVI=;
 b=oprp+JaWbPpo3i38+krQpwASqw0355NhpOaf6kK7R15vB0qulk1Ri7lvewi9myMYpc
 Mn6FaUFSD1WtY00ZRdN8NJpSTQ2MdZPgyFISEFZ7ogpGASgx4GX9UoJdgGECIg2XwNVp
 XNadaHbfdvrP6oYRdl06u35sWAdMAeYROWc8eKSwHkAIBqEG67U/jtnFQb6GnvsMYSsK
 VoQV+EfuhaqJDAbxNpnLDM55EOpy1d1jsmHrYXF90N6guvvgW5d6+zmod6G7v/x5FqXV
 arupxE8LEb7ODNrYwtiX2vClRtv3fWAFCxIcaLomao6iixqoT9j3ujgDU7gI0/ddqql7
 GBdg==
X-Gm-Message-State: AOAM531fTdPia3+drH9TuWA9/R5uTFDIxlTXnis5s9f17y+lYiS98Euu
 Rd4UlvMxYnkMa8Ln7sXg0Zo=
X-Google-Smtp-Source: ABdhPJyFYSzLutIYA+4K2QxblxTKk5KJU3m/tlDZRfeVO2Ghg5lVIxoqYInFjfQtSHYnFT6xkxuyRQ==
X-Received: by 2002:a0c:ec52:: with SMTP id n18mr12604617qvq.6.1635248074307; 
 Tue, 26 Oct 2021 04:34:34 -0700 (PDT)
Received: from localhost.localdomain ([2804:431:c7f4:5469:b11e:67b8:49d2:1744])
 by smtp.googlemail.com with ESMTPSA id f3sm11117691qko.32.2021.10.26.04.34.31
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Tue, 26 Oct 2021 04:34:34 -0700 (PDT)
From: Igor Torrente <igormtorrente@gmail.com>
To: rodrigosiqueiramelo@gmail.com, melissa.srw@gmail.com, ppaalanen@gmail.com,
 tzimmermann@suse.de
Cc: Igor Torrente <igormtorrente@gmail.com>, hamohammed.sa@gmail.com,
 daniel@ffwll.ch, airlied@linux.ie, contact@emersion.fr,
 leandro.ribeiro@collabora.com, dri-devel@lists.freedesktop.org
Subject: [PATCH v2 3/8] drm: vkms: Replace hardcoded value of
 `vkms_composer.map` to DRM_FORMAT_MAX_PLANES
Date: Tue, 26 Oct 2021 08:34:03 -0300
Message-Id: <20211026113409.7242-4-igormtorrente@gmail.com>
X-Mailer: git-send-email 2.30.2
In-Reply-To: <20211026113409.7242-1-igormtorrente@gmail.com>
References: <20211026113409.7242-1-igormtorrente@gmail.com>
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

