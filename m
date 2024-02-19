Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 42AE185A2AB
	for <lists+dri-devel@lfdr.de>; Mon, 19 Feb 2024 13:00:18 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id E6C1710E17C;
	Mon, 19 Feb 2024 12:00:14 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=marliere.net header.i=@marliere.net header.b="qkL+tNUb";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-pl1-f181.google.com (mail-pl1-f181.google.com
 [209.85.214.181])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 3785D10E17C
 for <dri-devel@lists.freedesktop.org>; Mon, 19 Feb 2024 12:00:14 +0000 (UTC)
Received: by mail-pl1-f181.google.com with SMTP id
 d9443c01a7336-1d95d67ff45so29971705ad.2
 for <dri-devel@lists.freedesktop.org>; Mon, 19 Feb 2024 04:00:14 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1708344014; x=1708948814;
 h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
 :mime-version:subject:date:dkim-signature:from:x-gm-message-state
 :from:to:cc:subject:date:message-id:reply-to;
 bh=haRjgjClnBjya1hn/kXkmNJwZcsnCLiTNm2A48TJj2I=;
 b=G21jQgKfAQXzcb8FY2YF1ZT2/S5uzMhcOhSalApXbrDw62uIkEmJ7A348+yzQwTDtW
 kt9ovJos5WysaGqMCvqm3pZVcs2hA4yyzeEalJmAxkNk84RB/OB0B86MgA7k0Zj472f0
 1yzR/UGBYtnemJvHjwzqp9tx9zRxWiLKfxvKeT/ZPewTRlIT0Rt/iuQiUlm3GO/6/PxN
 p/mVHiKFQ16CJpu4oeVm5PcP6XdFCEDSNcDyAgwdOkT2JdRq5Iy/EILin9ZOn+PumAvt
 hZ3BFLdc699duZkDt0o4PLockj97W6V9yd6nevdLHaviFUTaUcdFDA+bk5WK36uVwIh+
 LIaw==
X-Gm-Message-State: AOJu0YxGHGo7qxbS4bybFKUGUcwTy+ICoYOlKXN0hdGgqwZpqR5MD/jD
 RL1mhDiib2kDIuctm1bNOs6xDEmkPlSw6vq+SY2Gsx0q1POkJ00o
X-Google-Smtp-Source: AGHT+IHpP8ZQkzVZGA724rm5IY8BShrmDVlMjxj4PtnkrX0AYah52rqOinVekUWURDe4fWZAw0c/rw==
X-Received: by 2002:a17:902:ec8b:b0:1dc:11f:d954 with SMTP id
 x11-20020a170902ec8b00b001dc011fd954mr1174732plg.54.1708344013304; 
 Mon, 19 Feb 2024 04:00:13 -0800 (PST)
Received: from mail.marliere.net ([24.199.118.162])
 by smtp.gmail.com with ESMTPSA id
 f19-20020a170902e99300b001d944b3c5f1sm4230209plb.178.2024.02.19.04.00.12
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Mon, 19 Feb 2024 04:00:12 -0800 (PST)
From: "Ricardo B. Marliere" <ricardo@marliere.net>
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=marliere.net;
 s=2024; t=1708344011;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=haRjgjClnBjya1hn/kXkmNJwZcsnCLiTNm2A48TJj2I=;
 b=qkL+tNUbSQysejjyPo2IADm5Uiy+7XE4eRkam3bEIrzBgumLuTqCcm1vFxwf97IyXyNVIq
 pdYaw1jk/+XQ1oHe4bc7ltuRr/8pVZTGWUwlS45C2f/cj3FYdTp63h/+Fi67Q+HnOKCCxy
 7hbaSNgdQ161QNQZT98Z8gRRHqZ3F+vwjD4xytxUjJMu9m9VLZ+reIfKzaxACIrtlKSpfs
 Z7mJNFT70whvSrEPJXjgpUGgCV0HSxwXOBj86TVuW9s1bjB2aOhcgevj9FjVFo18vnHev6
 EFJq06G2xHWr7dsgFCSKq09ZDIdpWPm8sTJWJCKTTAwtYiwAIotimvW/oxXasg==
Authentication-Results: ORIGINATING;
 auth=pass smtp.auth=ricardo@marliere.net smtp.mailfrom=ricardo@marliere.net
Date: Mon, 19 Feb 2024 09:00:51 -0300
Subject: [PATCH drm-misc 1/3] drm/dp: constify the struct device_type usage
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20240219-device_cleanup-drm-v1-1-e2f2acb38bff@marliere.net>
References: <20240219-device_cleanup-drm-v1-0-e2f2acb38bff@marliere.net>
In-Reply-To: <20240219-device_cleanup-drm-v1-0-e2f2acb38bff@marliere.net>
To: Maarten Lankhorst <maarten.lankhorst@linux.intel.com>, 
 Maxime Ripard <mripard@kernel.org>, Thomas Zimmermann <tzimmermann@suse.de>, 
 David Airlie <airlied@gmail.com>, Daniel Vetter <daniel@ffwll.ch>, 
 Hans de Goede <hdegoede@redhat.com>
Cc: dri-devel@lists.freedesktop.org, linux-kernel@vger.kernel.org, 
 Greg Kroah-Hartman <gregkh@linuxfoundation.org>, 
 "Ricardo B. Marliere" <ricardo@marliere.net>
X-Developer-Signature: v=1; a=openpgp-sha256; l=1135; i=ricardo@marliere.net; 
 h=from:subject:message-id;
 bh=cGE1aXmbUEcCZqNxBm1s72ykW3IRXfETFVI2UY/p55s=; 
 b=owEBbQKS/ZANAwAKAckLinxjhlimAcsmYgBl00L1k052ApVj3eKMw9G3Ku1/NjhsrLFY6W6ht
 ItWIhyt15eJAjMEAAEKAB0WIQQDCo6eQk7jwGVXh+HJC4p8Y4ZYpgUCZdNC9QAKCRDJC4p8Y4ZY
 pudYEACsGPi2u6bKrs3VW9TMpjmsDX2fTJjiVoC4jM994qt17r42Irs2YKFXYtzzrzELtZjybWK
 TRkRQgDJAkHnJONZAbwx6mRRIeRWu4ydtuJ8k5NqhQ5MjA5o/dSXBSOEQ3lmU9iIqPdlf9QBwCg
 dSxUGUZFbLpF+S1jXcaP46DIhVXSOIUHcS4rgs17JFNoL1GAV6jbpFEbfWJZktvfW41nGcvi1/c
 BRCdrXyDukn91tKrjiRs57l+yPzXSM4vNroIHaKD17CHaL0OvisXpZZAwX5TeEr6QX7wekyi7Kk
 cmUyqrDs67x7CQsMcLYAsaGKKSHDobFZ5DE1mZLv/P3ng08ImSb7INKQDPRF+Nz9AAITjHMoTrM
 p0SbvF9zA1WK55B04H3PIhN4D+LAS4eZgkDj8as2dRSEabTmtRAvf9y5VKwu5A6MzLpqW8SpCN0
 zMuKaxhtB+QDYPchjs0D2cMFjAxQhIlKQEFVmKgfsQjpWRx4hPJKRt1E+5fGwx0K3q0evKLInXR
 8IxskXFN7ogFQBHI8Ee1yIViObkacXdjFIVlULXU3LYbmKgCv0ZV2TUIFxiuuC8Y49eCyXcJzlD
 gZzGhkLTK6wpCAsrgroBrQrfDfmAW0YNmOecqU8iaAgIhTKTZEhhvOAKzK07FTn3ZA5o7Nf6Yl0
 ehjiK5gLQebjTKQ==
X-Developer-Key: i=ricardo@marliere.net; a=openpgp;
 fpr=030A8E9E424EE3C0655787E1C90B8A7C638658A6
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

Since commit aed65af1cc2f ("drivers: make device_type const"), the driver
core can properly handle constant struct device_type. Move the
dp_aux_device_type_type variable to be a constant structure as well,
placing it into read-only memory which can not be modified at runtime.

Cc: Greg Kroah-Hartman <gregkh@linuxfoundation.org>
Signed-off-by: Ricardo B. Marliere <ricardo@marliere.net>
---
 drivers/gpu/drm/display/drm_dp_aux_bus.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/drivers/gpu/drm/display/drm_dp_aux_bus.c b/drivers/gpu/drm/display/drm_dp_aux_bus.c
index 5afc26be9d2a..f4c66937ef79 100644
--- a/drivers/gpu/drm/display/drm_dp_aux_bus.c
+++ b/drivers/gpu/drm/display/drm_dp_aux_bus.c
@@ -166,7 +166,7 @@ static int dp_aux_ep_dev_modalias(const struct device *dev, struct kobj_uevent_e
 	return of_device_uevent_modalias(dev, env);
 }
 
-static struct device_type dp_aux_device_type_type = {
+static const struct device_type dp_aux_device_type_type = {
 	.groups		= dp_aux_ep_dev_groups,
 	.uevent		= dp_aux_ep_dev_modalias,
 	.release	= dp_aux_ep_dev_release,

-- 
2.43.0

