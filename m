Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id BE0256EAD89
	for <lists+dri-devel@lfdr.de>; Fri, 21 Apr 2023 16:57:09 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 139B610E175;
	Fri, 21 Apr 2023 14:57:06 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-ed1-x535.google.com (mail-ed1-x535.google.com
 [IPv6:2a00:1450:4864:20::535])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 01F9E10E175
 for <dri-devel@lists.freedesktop.org>; Fri, 21 Apr 2023 14:57:04 +0000 (UTC)
Received: by mail-ed1-x535.google.com with SMTP id
 4fb4d7f45d1cf-504ecbfddd5so2569037a12.0
 for <dri-devel@lists.freedesktop.org>; Fri, 21 Apr 2023 07:57:04 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=linaro.org; s=google; t=1682089023; x=1684681023;
 h=content-transfer-encoding:mime-version:message-id:date:subject:cc
 :to:from:from:to:cc:subject:date:message-id:reply-to;
 bh=uctUzwBZNxJlKpvlCCGIAPlY6l+7Y7RDinQUecvvB3o=;
 b=cpqNYtVyifWBpd7Olh6M27aSvswD+dUQz/fYK6h1wu/OC2xlMDRH8XDAnG3iJQBI0D
 26urFToMIi56QHNGa4WMAGDRaE1qKjdHGF4JySErBO1QIhveRbvjx7eTzYcJ3f2f+w1r
 twY0DSHEQbxpDerw7+XhnFryKRoAgu6hS+nYlJpWI64/fn98UQSfksvNd4ePVjDFKSbo
 9TL8k3L+yf/xY8scabRgTyLQYjCQTUlKie3aFhnW8noQhUyLEfbDJG7VGDJ/FwuxoxKH
 zyRn3zoEsgbd+ssdWhz5y2y9y2F4/vqzucbMHdUx/0+HxLAaHfLh3k+gFN2tXpDwq8tD
 qe2w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20221208; t=1682089023; x=1684681023;
 h=content-transfer-encoding:mime-version:message-id:date:subject:cc
 :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
 :reply-to;
 bh=uctUzwBZNxJlKpvlCCGIAPlY6l+7Y7RDinQUecvvB3o=;
 b=epnALH6mA6nRoBzxNIupSULNNzOhXvXna+IX9Ex50Usn16FkCYq9TdDmu0mqQnEQ8U
 8JiFN+q7iflwJNxRGg3BE77LC+fplX1c07GbVkPA35BW5ZVXgCZIBXMFIXNkxkPzH55n
 v2QKnme9tA5hnhJJbvUd84G8CnT8G3+vZ2QSEqM14OTKG/kcNC6+cwocl6VEaZO9aVMr
 4zNQk0mF65R4pCpfWIspBQVOSSqH/w3RuhmIFNeG3BaPs1x+p8g9Jlipu4WNHo4Y/foL
 FjV3waCuMS9M2MGj4wNxKJcGJCmYrzrnGhzi6VUpS8cFSGZyL53TYWbSKy7l8v64txMm
 wy8Q==
X-Gm-Message-State: AAQBX9eczPRnh1AFJTqX3vpkxTLN6hIdIYzms+jpEACRrYcBPCFQCCAp
 O/v6j3hwioxpDl7qsN+cGuwheA==
X-Google-Smtp-Source: AKy350b2REY5H1kl7TPN9WKhRxrc9GCLZbpAU2wbU/1Wwzj0x/BQ66ZPvwtnLFJvkl9omAcUfzsOeA==
X-Received: by 2002:a17:906:16d7:b0:94a:8ada:d109 with SMTP id
 t23-20020a17090616d700b0094a8adad109mr2517876ejd.77.1682089022753; 
 Fri, 21 Apr 2023 07:57:02 -0700 (PDT)
Received: from localhost.localdomain ([5.133.47.210])
 by smtp.gmail.com with ESMTPSA id
 15-20020a170906058f00b0095708428cdcsm1227625ejn.6.2023.04.21.07.57.01
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Fri, 21 Apr 2023 07:57:02 -0700 (PDT)
From: Srinivas Kandagatla <srinivas.kandagatla@linaro.org>
To: robdclark@gmail.com, quic_abhinavk@quicinc.com, sean@poorly.run,
 dmitry.baryshkov@linaro.org, airlied@gmail.com, daniel@ffwll.ch,
 lyude@redhat.com
Subject: [PATCH] drm/msm/dp: unregister audio driver during unbind
Date: Fri, 21 Apr 2023 15:56:57 +0100
Message-Id: <20230421145657.12186-1-srinivas.kandagatla@linaro.org>
X-Mailer: git-send-email 2.21.0
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
Cc: quic_bjorande@quicinc.com, linux-arm-msm@vger.kernel.org,
 linux-kernel@vger.kernel.org, javierm@redhat.com,
 dri-devel@lists.freedesktop.org, quic_khsieh@quicinc.com,
 Srinivas Kandagatla <srinivas.kandagatla@linaro.org>, tzimmermann@suse.de,
 freedreno@lists.freedesktop.org, johan+linaro@kernel.org
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

while binding the code always registers a audio driver, however there
is no corresponding unregistration done in unbind. This leads to multiple
redundant audio platform devices if dp_display_bind and dp_display_unbind
happens multiple times during startup. On X13s platform this resulted in
6 to 9 audio codec device instead of just 3 codec devices for 3 dp ports.

Fix this by unregistering codecs on unbind.

Signed-off-by: Srinivas Kandagatla <srinivas.kandagatla@linaro.org>
---
 drivers/gpu/drm/msm/dp/dp_audio.c   | 12 ++++++++++++
 drivers/gpu/drm/msm/dp/dp_audio.h   |  2 ++
 drivers/gpu/drm/msm/dp/dp_display.c |  1 +
 3 files changed, 15 insertions(+)

diff --git a/drivers/gpu/drm/msm/dp/dp_audio.c b/drivers/gpu/drm/msm/dp/dp_audio.c
index 6666783e1468..1245c7aa49df 100644
--- a/drivers/gpu/drm/msm/dp/dp_audio.c
+++ b/drivers/gpu/drm/msm/dp/dp_audio.c
@@ -593,6 +593,18 @@ static struct hdmi_codec_pdata codec_data = {
 	.i2s = 1,
 };
 
+void dp_unregister_audio_driver(struct device *dev, struct dp_audio *dp_audio)
+{
+	struct dp_audio_private *audio_priv;
+
+	audio_priv = container_of(dp_audio, struct dp_audio_private, dp_audio);
+
+	if (audio_priv->audio_pdev) {
+		platform_device_unregister(audio_priv->audio_pdev);
+		audio_priv->audio_pdev = NULL;
+	}
+}
+
 int dp_register_audio_driver(struct device *dev,
 		struct dp_audio *dp_audio)
 {
diff --git a/drivers/gpu/drm/msm/dp/dp_audio.h b/drivers/gpu/drm/msm/dp/dp_audio.h
index 84e5f4a5d26b..4ab78880af82 100644
--- a/drivers/gpu/drm/msm/dp/dp_audio.h
+++ b/drivers/gpu/drm/msm/dp/dp_audio.h
@@ -53,6 +53,8 @@ struct dp_audio *dp_audio_get(struct platform_device *pdev,
 int dp_register_audio_driver(struct device *dev,
 		struct dp_audio *dp_audio);
 
+void dp_unregister_audio_driver(struct device *dev, struct dp_audio *dp_audio);
+
 /**
  * dp_audio_put()
  *
diff --git a/drivers/gpu/drm/msm/dp/dp_display.c b/drivers/gpu/drm/msm/dp/dp_display.c
index 3e13acdfa7e5..99a38dbe51c0 100644
--- a/drivers/gpu/drm/msm/dp/dp_display.c
+++ b/drivers/gpu/drm/msm/dp/dp_display.c
@@ -326,6 +326,7 @@ static void dp_display_unbind(struct device *dev, struct device *master,
 	kthread_stop(dp->ev_tsk);
 
 	dp_power_client_deinit(dp->power);
+	dp_unregister_audio_driver(dev, dp->audio);
 	dp_aux_unregister(dp->aux);
 	dp->drm_dev = NULL;
 	dp->aux->drm_dev = NULL;
-- 
2.21.0

