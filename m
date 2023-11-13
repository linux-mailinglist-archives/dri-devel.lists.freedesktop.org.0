Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 612F77E9B14
	for <lists+dri-devel@lfdr.de>; Mon, 13 Nov 2023 12:24:41 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 17D0710E35B;
	Mon, 13 Nov 2023 11:24:36 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-wm1-x335.google.com (mail-wm1-x335.google.com
 [IPv6:2a00:1450:4864:20::335])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 4C20610E081
 for <dri-devel@lists.freedesktop.org>; Mon, 13 Nov 2023 11:24:17 +0000 (UTC)
Received: by mail-wm1-x335.google.com with SMTP id
 5b1f17b1804b1-40859c466efso33255255e9.3
 for <dri-devel@lists.freedesktop.org>; Mon, 13 Nov 2023 03:24:17 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20230601; t=1699874656; x=1700479456; darn=lists.freedesktop.org;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:from:to:cc:subject:date
 :message-id:reply-to;
 bh=anw5D9jgaSVgoYwRFPH2zMk9qB9A7j/26DqujJWuba0=;
 b=LHF7S4ILBRjncW9F0TGCaIbKue3/nI57CSa4iCBi7yhCaxS6xdU0WwHJoowBGG1HWy
 wTwON8KyjWEJ0q7dX+Xc6SvyOXvCmNCGB1aDUCBQ5pirhAPCfDbESA6f+VdOw03ISPe9
 FZbI9ojrfaPAOOy8+rQuCJqbwhMZVxzPXJOOPgO4XspSptsAOxyD3hwJvEL8Mlv1RYBA
 T0q0sDujRHF9+eA0q0wtkJnPm6CwXgttJ7BBssJta9dFBPPSqvMPqLuBBaL7bIU2hUuo
 T3VUVsnx6d4BnQ8mLD5o392cZt+7MmMNS8AAuTM0TFBT/X8l0pGrvPwW+201feoApUQo
 y7AQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1699874656; x=1700479456;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=anw5D9jgaSVgoYwRFPH2zMk9qB9A7j/26DqujJWuba0=;
 b=i0D9KoXjrQ5oL+qbEd7ZY3n4UzKkj2wlj+6sE8xGeNBltFeYkMUTv91Smdf0Jpsa5Z
 7MflnEdzmlidcGZ+T0zMTYK/4LeUqzRdR8tbpmxxijTmzkaiL63fOHSPrrk5lb2yXz/4
 vOHNXuoiwXOJGPRs+O0hWmS+mGVK1e1FqnH0tuFbYyCbMc6M+4UzqA1LLvYKmBe0r1VT
 pvqr6WkQfzACXIldFe9zuyV3lTT9P7fBFaQyp5hihH+XcqtqyI2luaLKLgAu+U8jdvnx
 fUagYCMhAlxB4qoVO9/BXS/2rxxilOCM1krOWRO1oj2yuVgWJo7nUAH/0ZyYoepkJxnx
 MjvA==
X-Gm-Message-State: AOJu0YzFt6ejjgVvpCGxkpjCPfD6yYH+cx6SDNk0pJ382aIcjkTh2kQV
 XaaFFZDsBURNP7fhK4F8Hkg=
X-Google-Smtp-Source: AGHT+IGb+/PX8N/YBLSMktQPtV1TVThx5TMgiemxOvWo2/x4okWcnwzbKL/ul1BqwEI+X1zzPo4MTw==
X-Received: by 2002:a05:600c:4691:b0:401:38dc:8916 with SMTP id
 p17-20020a05600c469100b0040138dc8916mr5424949wmo.10.1699874655563; 
 Mon, 13 Nov 2023 03:24:15 -0800 (PST)
Received: from zotac.lan.
 (dynamic-2a01-0c22-6e16-fe00-2223-08ff-fe18-0310.c22.pool.telefonica.de.
 [2a01:c22:6e16:fe00:2223:8ff:fe18:310])
 by smtp.gmail.com with ESMTPSA id
 l19-20020a05600c4f1300b0040772138bb7sm13565787wmq.2.2023.11.13.03.24.14
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Mon, 13 Nov 2023 03:24:15 -0800 (PST)
From: Heiner Kallweit <hkallweit1@gmail.com>
To: Wolfram Sang <wsa@kernel.org>,
	Xinliang Liu <xinliang.liu@linaro.org>
Subject: [PATCH 16/20] drivers/gpu/drm/hisilicon/hibmc/hibmc_drm_i2c.c: remove
 I2C_CLASS_DDC support
Date: Mon, 13 Nov 2023 12:23:40 +0100
Message-ID: <20231113112344.719-17-hkallweit1@gmail.com>
X-Mailer: git-send-email 2.42.1
In-Reply-To: <20231113112344.719-1-hkallweit1@gmail.com>
References: <20231113112344.719-1-hkallweit1@gmail.com>
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
Cc: dri-devel@lists.freedesktop.org, linux-kernel@vger.kernel.org,
 Maxime Ripard <mripard@kernel.org>, John Stultz <jstultz@google.com>,
 Xinwei Kong <kong.kongxinwei@hisilicon.com>,
 Yongqin Liu <yongqin.liu@linaro.org>, linux-i2c@vger.kernel.org,
 Thomas Zimmermann <tzimmermann@suse.de>, Tian Tao <tiantao6@hisilicon.com>,
 Sumit Semwal <sumit.semwal@linaro.org>, Heiner Kallweit <hkallweit1@gmail.com>
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

After removal of the legacy EEPROM driver and I2C_CLASS_DDC support in
olpc_dcon there's no i2c client driver left supporting I2C_CLASS_DDC.
Class-based device auto-detection is a legacy mechanism and shouldn't
be used in new code. So we can remove this class completely now.

Preferably this series should be applied via the i2c tree.

Signed-off-by: Heiner Kallweit <hkallweit1@gmail.com>

---
 drivers/gpu/drm/hisilicon/hibmc/hibmc_drm_i2c.c |    1 -
 1 file changed, 1 deletion(-)

diff --git a/drivers/gpu/drm/hisilicon/hibmc/hibmc_drm_i2c.c b/drivers/gpu/drm/hisilicon/hibmc/hibmc_drm_i2c.c
index 410bd019b..e6e48651c 100644
--- a/drivers/gpu/drm/hisilicon/hibmc/hibmc_drm_i2c.c
+++ b/drivers/gpu/drm/hisilicon/hibmc/hibmc_drm_i2c.c
@@ -81,7 +81,6 @@ int hibmc_ddc_create(struct drm_device *drm_dev,
 		     struct hibmc_connector *connector)
 {
 	connector->adapter.owner = THIS_MODULE;
-	connector->adapter.class = I2C_CLASS_DDC;
 	snprintf(connector->adapter.name, I2C_NAME_SIZE, "HIS i2c bit bus");
 	connector->adapter.dev.parent = drm_dev->dev;
 	i2c_set_adapdata(&connector->adapter, connector);

