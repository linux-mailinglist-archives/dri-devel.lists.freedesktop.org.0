Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 6E20060E4DC
	for <lists+dri-devel@lfdr.de>; Wed, 26 Oct 2022 17:36:40 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 1AAE610E3BD;
	Wed, 26 Oct 2022 15:35:04 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from us-smtp-delivery-124.mimecast.com
 (us-smtp-delivery-124.mimecast.com [170.10.129.124])
 by gabe.freedesktop.org (Postfix) with ESMTPS id EF81010E567
 for <dri-devel@lists.freedesktop.org>; Wed, 26 Oct 2022 15:34:55 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1666798495;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=ejOPhJEJNpELka6gD2XD7ypHfsFu2fomcMBYmFfmxuI=;
 b=f4GK+j5FtFUck0/6gY3I3rygPKWDsElmuxjT+Mf1b4K/EVUI2B5R4OvIQe3wIuwdfhHkzi
 yTngzCODCKiigzcKxtiLzHMHdNpZvZVoiM4pMHLcHSVw9xMChmtGzsB2uFAn/87RoreQKK
 hoWpOduA0PJvqSWbab064/2w6p5iv1k=
Received: from mail-ed1-f69.google.com (mail-ed1-f69.google.com
 [209.85.208.69]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_128_GCM_SHA256) id
 us-mta-533-ccv3Ol0AOxSaC6R2_Ivs_g-1; Wed, 26 Oct 2022 11:34:53 -0400
X-MC-Unique: ccv3Ol0AOxSaC6R2_Ivs_g-1
Received: by mail-ed1-f69.google.com with SMTP id
 c9-20020a05640227c900b0045d4a88c750so14176527ede.12
 for <dri-devel@lists.freedesktop.org>; Wed, 26 Oct 2022 08:34:53 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=ejOPhJEJNpELka6gD2XD7ypHfsFu2fomcMBYmFfmxuI=;
 b=P1FcBxghWQ5eygvLBiMrXk39tFMlQrVpHaXT4UPxchyh5XewoPEvpVbmdhOwnqnSJh
 RcD4qjWFqEFvEcFpPs9VrqunQeIIBQT95k+BapExuCsCPJritw9F3iETRVXXrdqOxW+N
 Q7YAVtk5oU7Tv/bF56bUm8sncwe7czqHSPHp9y1F3RilpTvlnr3Osww81Zbcqf6fT50y
 No2zD3I1LmlDmwBZGjVSc9T55tEV9DjpZZAcJA+nO/yqtyU3Zaq61T2Zt+zvMMu5PqJF
 Eff9IXjAPj4K1rYnIB00tH0OkFIURNa/EQSFT5D1IG/7UtMctDoIKy0JUrIREHHk2ZUi
 LTxA==
X-Gm-Message-State: ACrzQf3GTUC/7LqMEQp3sQGYzD5zY7VAduDk5eVa75fYuhiQOIbR1x+H
 +akPXwLClZFLrs+54DzAObOKzJgbF+FTHMp5X10jB711MMKwmKJEArJBlyLlxfQqqVfSjgyIvL+
 Z2xMFkp8MuoP0DJCapZ11tYIExvTX
X-Received: by 2002:a17:906:2f87:b0:78a:c0d5:d019 with SMTP id
 w7-20020a1709062f8700b0078ac0d5d019mr37917825eji.158.1666798492571; 
 Wed, 26 Oct 2022 08:34:52 -0700 (PDT)
X-Google-Smtp-Source: AMsMyM5EBkDZr7mSHI/IJXrOR7VYqX6OqCiEF3KuvriT6LLy2miYkg3LlwMcfHJamXcTxJp1LQpWvw==
X-Received: by 2002:a17:906:2f87:b0:78a:c0d5:d019 with SMTP id
 w7-20020a1709062f8700b0078ac0d5d019mr37917812eji.158.1666798492434; 
 Wed, 26 Oct 2022 08:34:52 -0700 (PDT)
Received: from pollux.. ([2a02:810d:4b40:2ee8:642:1aff:fe31:a15c])
 by smtp.gmail.com with ESMTPSA id
 b12-20020a1709063f8c00b0078d4e39d87esm3114855ejj.225.2022.10.26.08.34.51
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Wed, 26 Oct 2022 08:34:52 -0700 (PDT)
From: Danilo Krummrich <dakr@redhat.com>
To: daniel@ffwll.ch, airlied@linux.ie, tzimmermann@suse.de, mripard@kernel.org,
 liviu.dudau@arm.com, brian.starkey@arm.com
Subject: [PATCH drm-misc-next v4 4/4] drm/arm/hdlcd: remove calls to
 drm_mode_config_cleanup()
Date: Wed, 26 Oct 2022 17:34:31 +0200
Message-Id: <20221026153431.72033-5-dakr@redhat.com>
X-Mailer: git-send-email 2.37.3
In-Reply-To: <20221026153431.72033-1-dakr@redhat.com>
References: <20221026153431.72033-1-dakr@redhat.com>
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
index 120c87934a91..49c977cdae40 100644
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
@@ -255,7 +262,10 @@ static int hdlcd_drm_bind(struct device *dev)
 
 	dev_set_drvdata(dev, drm);
 
-	hdlcd_setup_mode_config(drm);
+	ret = hdlcd_setup_mode_config(drm);
+	if (ret)
+		goto err_free;
+
 	ret = hdlcd_load(drm, 0);
 	if (ret)
 		goto err_free;
@@ -314,9 +324,7 @@ static int hdlcd_drm_bind(struct device *dev)
 	hdlcd_irq_uninstall(hdlcd);
 	of_reserved_mem_device_release(drm->dev);
 err_free:
-	drm_mode_config_cleanup(drm);
 	dev_set_drvdata(dev, NULL);
-
 	return ret;
 }
 
@@ -337,7 +345,6 @@ static void hdlcd_drm_unbind(struct device *dev)
 	if (pm_runtime_enabled(dev))
 		pm_runtime_disable(dev);
 	of_reserved_mem_device_release(dev);
-	drm_mode_config_cleanup(drm);
 	dev_set_drvdata(dev, NULL);
 }
 
-- 
2.37.3

