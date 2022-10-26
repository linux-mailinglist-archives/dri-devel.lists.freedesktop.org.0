Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 70EFB60E519
	for <lists+dri-devel@lfdr.de>; Wed, 26 Oct 2022 18:00:20 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id A9A9010E529;
	Wed, 26 Oct 2022 16:00:10 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from us-smtp-delivery-124.mimecast.com
 (us-smtp-delivery-124.mimecast.com [170.10.133.124])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 0BDBF10E3A8
 for <dri-devel@lists.freedesktop.org>; Wed, 26 Oct 2022 16:00:03 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1666800002;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=itig1DysDm1r5HC5ecqxAlDsypjxBSfKhMXt70+uPpQ=;
 b=RLrhsC4JBzPrf5wfFOTgLUloNs8HPfQ7QKxOBTR+nPJT3EOQLKQtudd6yoDxdmg5eDWU3K
 P7ykWQzRsr8ICdNfMIQwDalvTiWmIxr6X5tj1OxxI4SnVY2471P5XExDsfwhTzwpb96ZEb
 Nex1AmKfDrz/q5HQ/+sPprPSazWVG/E=
Received: from mail-ed1-f69.google.com (mail-ed1-f69.google.com
 [209.85.208.69]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_128_GCM_SHA256) id
 us-mta-354-CJ4H5N-ZM_OmrIS0p6Rxcg-1; Wed, 26 Oct 2022 12:00:00 -0400
X-MC-Unique: CJ4H5N-ZM_OmrIS0p6Rxcg-1
Received: by mail-ed1-f69.google.com with SMTP id
 w20-20020a05640234d400b0045d0d1afe8eso14354959edc.15
 for <dri-devel@lists.freedesktop.org>; Wed, 26 Oct 2022 09:00:00 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=itig1DysDm1r5HC5ecqxAlDsypjxBSfKhMXt70+uPpQ=;
 b=pm1zS5OjAQoK6g4zbF3sbVOhb+jxOgscVs73rCovY45J6niFL4kqLgbWdf/Ilf4wKD
 s/NddhFuXObUdGi6/nZcZVQhxKZ+88eA6rczdc9qFPkc65Showh0Rogwm8G9I97RKOza
 mEzQEMRb6FVpICR8DcBK7oiDIsgnXNUjVIamwoLAg1qQKNP3VN3kVkqz1bRI+eJeTc8w
 sbds1JdazOxkR56zeC5zuUqJs1M56PUtAjbrgLbwbdrQ45xpgCjMfbho8M4itj9ydgvx
 kgh726thrB1Oh+WKMqCJq/f7hIyG64AifSY8bjiNGObSSWw23xqEvbqThGi3GXB4tl2j
 fXHA==
X-Gm-Message-State: ACrzQf2ppTlMHmbJ80d0ZzbB1T30GpF9DNquCDp5IHgdYi2S6VN044Rq
 SH8mUahzlKtDWRY1JR7ctOddtGHq/7YYOpnSmN7lcEDYsDLfVXknzJIsu0K+EMnIElSZqQ8QqSh
 G3SW2vQl1kZTdhgncM1wU0W/jFHZX
X-Received: by 2002:a17:906:7304:b0:6ff:a76:5b09 with SMTP id
 di4-20020a170906730400b006ff0a765b09mr37544939ejc.193.1666799999556; 
 Wed, 26 Oct 2022 08:59:59 -0700 (PDT)
X-Google-Smtp-Source: AMsMyM6RAzeOky+aWicOwm978Au2a0Q8a4f3wMcSfD0JMt2cDzwU3i4EMkYFttEdSS0oSo40LYFJEA==
X-Received: by 2002:a17:906:7304:b0:6ff:a76:5b09 with SMTP id
 di4-20020a170906730400b006ff0a765b09mr37544925ejc.193.1666799999427; 
 Wed, 26 Oct 2022 08:59:59 -0700 (PDT)
Received: from pollux.. ([2a02:810d:4b40:2ee8:642:1aff:fe31:a15c])
 by smtp.gmail.com with ESMTPSA id
 i17-20020a17090685d100b00773f3ccd989sm3211326ejy.68.2022.10.26.08.59.58
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Wed, 26 Oct 2022 08:59:58 -0700 (PDT)
From: Danilo Krummrich <dakr@redhat.com>
To: daniel@ffwll.ch, airlied@linux.ie, tzimmermann@suse.de, mripard@kernel.org,
 liviu.dudau@arm.com, brian.starkey@arm.com
Subject: [PATCH drm-misc-next v3 5/5] drm/arm/malidp: remove calls to
 drm_mode_config_cleanup()
Date: Wed, 26 Oct 2022 17:59:34 +0200
Message-Id: <20221026155934.125294-6-dakr@redhat.com>
X-Mailer: git-send-email 2.37.3
In-Reply-To: <20221026155934.125294-1-dakr@redhat.com>
References: <20221026155934.125294-1-dakr@redhat.com>
MIME-Version: 1.0
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Transfer-Encoding: 8bit
Content-Type: text/plain; charset="US-ASCII"; x-default=true
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
Cc: Danilo Krummrich <dakr@redhat.com>, linux-kernel@vger.kernel.org,
 dri-devel@lists.freedesktop.org
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

drm_mode_config_init() simply calls drmm_mode_config_init(), hence
cleanup is automatically handled through registering
drm_mode_config_cleanup() with drmm_add_action_or_reset().

While at it, get rid of the deprecated drm_mode_config_init() and
replace it with drmm_mode_config_init() directly.

Signed-off-by: Danilo Krummrich <dakr@redhat.com>
---
 drivers/gpu/drm/arm/malidp_drv.c | 20 ++++++--------------
 1 file changed, 6 insertions(+), 14 deletions(-)

diff --git a/drivers/gpu/drm/arm/malidp_drv.c b/drivers/gpu/drm/arm/malidp_drv.c
index 678c5b0d8014..bebaa5a07e27 100644
--- a/drivers/gpu/drm/arm/malidp_drv.c
+++ b/drivers/gpu/drm/arm/malidp_drv.c
@@ -396,7 +396,9 @@ static int malidp_init(struct drm_device *drm)
 	struct malidp_drm *malidp = drm_to_malidp(drm);
 	struct malidp_hw_device *hwdev = malidp->dev;
 
-	drm_mode_config_init(drm);
+	ret = drmm_mode_config_init(drm);
+	if (ret)
+		goto out;
 
 	drm->mode_config.min_width = hwdev->min_line_size;
 	drm->mode_config.min_height = hwdev->min_line_size;
@@ -407,24 +409,16 @@ static int malidp_init(struct drm_device *drm)
 
 	ret = malidp_crtc_init(drm);
 	if (ret)
-		goto crtc_fail;
+		goto out;
 
 	ret = malidp_mw_connector_init(drm);
 	if (ret)
-		goto crtc_fail;
-
-	return 0;
+		goto out;
 
-crtc_fail:
-	drm_mode_config_cleanup(drm);
+out:
 	return ret;
 }
 
-static void malidp_fini(struct drm_device *drm)
-{
-	drm_mode_config_cleanup(drm);
-}
-
 static int malidp_irq_init(struct platform_device *pdev)
 {
 	int irq_de, irq_se, ret = 0;
@@ -874,7 +868,6 @@ static int malidp_bind(struct device *dev)
 bind_fail:
 	of_node_put(malidp->crtc.port);
 	malidp->crtc.port = NULL;
-	malidp_fini(drm);
 query_hw_fail:
 	pm_runtime_put(dev);
 	if (pm_runtime_enabled(dev))
@@ -902,7 +895,6 @@ static void malidp_unbind(struct device *dev)
 	component_unbind_all(dev, drm);
 	of_node_put(malidp->crtc.port);
 	malidp->crtc.port = NULL;
-	malidp_fini(drm);
 	pm_runtime_put(dev);
 	if (pm_runtime_enabled(dev))
 		pm_runtime_disable(dev);
-- 
2.37.3

