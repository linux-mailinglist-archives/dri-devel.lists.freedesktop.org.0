Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 6EBC35F1848
	for <lists+dri-devel@lfdr.de>; Sat,  1 Oct 2022 03:19:52 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 46F5910EE0E;
	Sat,  1 Oct 2022 01:19:49 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from us-smtp-delivery-124.mimecast.com
 (us-smtp-delivery-124.mimecast.com [170.10.133.124])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 6F8B210EE0E
 for <dri-devel@lists.freedesktop.org>; Sat,  1 Oct 2022 01:19:45 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1664587184;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=FflVPY5URLlO/QnD0oVlID0lCcDMEG9+FRQWDZ3uQVQ=;
 b=AJxXhK+hYSI9mFZHX3KazZ0gKoMg5cP9/UPE58ioxF3Bihi/kFlekRn0aXwqP2LBMQtfMO
 J15Qo0B2/vgOr56N+TxV/4Pu0fS6TZRrDLIDTa2zSZchvuH0cjSTw5yO6jCq76FyL8FZG+
 hrLgloyPsvrsiOSok7/lDYrYaqEarNw=
Received: from mail-ed1-f71.google.com (mail-ed1-f71.google.com
 [209.85.208.71]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_128_GCM_SHA256) id
 us-mta-210-M_8hNdBBO16Y4MI6THpF5Q-1; Fri, 30 Sep 2022 21:19:35 -0400
X-MC-Unique: M_8hNdBBO16Y4MI6THpF5Q-1
Received: by mail-ed1-f71.google.com with SMTP id
 s17-20020a056402521100b004511c8d59e3so4684278edd.11
 for <dri-devel@lists.freedesktop.org>; Fri, 30 Sep 2022 18:19:35 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
 :subject:date;
 bh=FflVPY5URLlO/QnD0oVlID0lCcDMEG9+FRQWDZ3uQVQ=;
 b=3QCFkiAL6zLJTq+UTJ1UqqBjtXKEltn7qeZ4zMhkUcyN0aWkrEdw/iw1nmmonrpJyx
 1R+YTlzNrwF4Z2ICwJ8/4FXXJnlSv8uWyxGSyTrnzn3qDzpp/+V2dEEAY3KhhJO4bz/I
 Kp50Yvv53dGfsbdX28/5idRzG481zn2iUtX94cyTlDq9l77wenMtfxqZvUZ+HbNQSpQL
 BH8/w+gI1xfCiLTZkYVYE/oL3jBBy1Wc6GaqB+nvnbwEEwWLEjZylc6MuhbelTqComrh
 vmSLSdo9bde7VCGe5dnoU0OyOdGCYP2fJs5uNnZ2C4e8j/Z6aCxeqF0fft+zp+xEWW/9
 wv7A==
X-Gm-Message-State: ACrzQf0HgKECnwRla6nz81nQGstv9YqYy+maHeRixS4hDfSkTjQs5Hlp
 2KAhCy+2o9E0i8ZRF3mbP05oyBRjsp2tpu/pEo8xP2ucQ5gBBVnQ0zcyGLXiRwcV4eEXxlaiHMM
 v2j1SKFfDM/BG5ZndvhnY0GJaJpP5
X-Received: by 2002:a17:906:7310:b0:782:cfd4:9c07 with SMTP id
 di16-20020a170906731000b00782cfd49c07mr8553111ejc.708.1664587174774; 
 Fri, 30 Sep 2022 18:19:34 -0700 (PDT)
X-Google-Smtp-Source: AMsMyM4x4xTB6S0FGXzv4kk/zNUKjUE/t9WGKOcAeGn0jSeAtcx2ggB6JSwppKVYxMJjyrcRCJ5xeQ==
X-Received: by 2002:a17:906:7310:b0:782:cfd4:9c07 with SMTP id
 di16-20020a170906731000b00782cfd49c07mr8553105ejc.708.1664587174628; 
 Fri, 30 Sep 2022 18:19:34 -0700 (PDT)
Received: from pollux.redhat.com ([2a02:810d:4b40:2ee8:642:1aff:fe31:a15c])
 by smtp.gmail.com with ESMTPSA id
 g18-20020a17090604d200b0073c8d4c9f38sm1927167eja.177.2022.09.30.18.19.33
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Fri, 30 Sep 2022 18:19:34 -0700 (PDT)
From: Danilo Krummrich <dakr@redhat.com>
To: daniel@ffwll.ch, airlied@linux.ie, tzimmermann@suse.de, mripard@kernel.org,
 liviu.dudau@arm.com, brian.starkey@arm.com
Subject: [PATCH drm-misc-next v3 7/7] drm/arm/hdlcd: remove calls to
 drm_mode_config_cleanup()
Date: Sat,  1 Oct 2022 03:19:05 +0200
Message-Id: <20221001011905.433408-8-dakr@redhat.com>
X-Mailer: git-send-email 2.37.3
In-Reply-To: <20221001011905.433408-1-dakr@redhat.com>
References: <20221001011905.433408-1-dakr@redhat.com>
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
 drivers/gpu/drm/arm/hdlcd_drv.c | 19 +++++++++++++------
 1 file changed, 13 insertions(+), 6 deletions(-)

diff --git a/drivers/gpu/drm/arm/hdlcd_drv.c b/drivers/gpu/drm/arm/hdlcd_drv.c
index 020c7d0c70a5..e242b6223d77 100644
--- a/drivers/gpu/drm/arm/hdlcd_drv.c
+++ b/drivers/gpu/drm/arm/hdlcd_drv.c
@@ -175,14 +175,21 @@ static const struct drm_mode_config_funcs hdlcd_mode_config_funcs = {
 	.atomic_commit = drm_atomic_helper_commit,
 };
 
-static void hdlcd_setup_mode_config(struct drm_device *drm)
+static int hdlcd_setup_mode_config(struct drm_device *drm)
 {
-	drm_mode_config_init(drm);
+	int ret;
+
+	ret = drmm_mode_config_init(drm);
+	if (ret)
+		return ret;
+
 	drm->mode_config.min_width = 0;
 	drm->mode_config.min_height = 0;
 	drm->mode_config.max_width = HDLCD_MAX_XRES;
 	drm->mode_config.max_height = HDLCD_MAX_YRES;
 	drm->mode_config.funcs = &hdlcd_mode_config_funcs;
+
+	return 0;
 }
 
 #ifdef CONFIG_DEBUG_FS
@@ -263,7 +270,10 @@ static int hdlcd_drm_bind(struct device *dev)
 
 	dev_set_drvdata(dev, drm);
 
-	hdlcd_setup_mode_config(drm);
+	ret = hdlcd_setup_mode_config(drm);
+	if (ret)
+		goto err_free;
+
 	ret = hdlcd_load(drm, 0);
 	if (ret)
 		goto err_free;
@@ -322,9 +332,7 @@ static int hdlcd_drm_bind(struct device *dev)
 	hdlcd_irq_uninstall(hdlcd);
 	of_reserved_mem_device_release(drm->dev);
 err_free:
-	drm_mode_config_cleanup(drm);
 	dev_set_drvdata(dev, NULL);
-
 	return ret;
 }
 
@@ -345,7 +353,6 @@ static void hdlcd_drm_unbind(struct device *dev)
 	if (pm_runtime_enabled(dev))
 		pm_runtime_disable(dev);
 	of_reserved_mem_device_release(dev);
-	drm_mode_config_cleanup(drm);
 	dev_set_drvdata(dev, NULL);
 }
 
-- 
2.37.3

