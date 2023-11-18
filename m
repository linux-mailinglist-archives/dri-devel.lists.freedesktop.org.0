Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 009DA7F0193
	for <lists+dri-devel@lfdr.de>; Sat, 18 Nov 2023 18:43:35 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 4A67910E339;
	Sat, 18 Nov 2023 17:43:32 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-wm1-x333.google.com (mail-wm1-x333.google.com
 [IPv6:2a00:1450:4864:20::333])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 9207610E343
 for <dri-devel@lists.freedesktop.org>; Sat, 18 Nov 2023 17:42:43 +0000 (UTC)
Received: by mail-wm1-x333.google.com with SMTP id
 5b1f17b1804b1-4084e49a5e5so5443215e9.3
 for <dri-devel@lists.freedesktop.org>; Sat, 18 Nov 2023 09:42:43 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20230601; t=1700329362; x=1700934162; darn=lists.freedesktop.org;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:from:to:cc:subject:date
 :message-id:reply-to;
 bh=anw5D9jgaSVgoYwRFPH2zMk9qB9A7j/26DqujJWuba0=;
 b=HIWsSFySi7xqF7lIO+9z/e1SQ4AkV2TSun3VrUMM5Aq9KY17vWVgLk749Eh1mLernJ
 hQVYKlmhCYpsDKbnPRXatCyPkoADLBDq0Lj/8nvDKgyOC/nTGRmZA5pj3hcwgRnviD11
 2tXr+EsxJZxzqgEMStPqY4ZrVeBJwyuLTOu1gieinmpNoFv7zbQcP1DhCiczWug52KZt
 W5a5SbJDQhDbEkRhquiNe3n4CAN/R1JBWH2K7KJHvnRcnGlCcaMJZNtVOhPi0Kz/h7W9
 HJ5ow/iIntS7zRoeJSU51o9xRjoxYhkoo+UycCAuIcRevX1LR240GuZHDc8XNCaNYiCE
 D3CQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1700329362; x=1700934162;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=anw5D9jgaSVgoYwRFPH2zMk9qB9A7j/26DqujJWuba0=;
 b=hJQsRYqjsHXku3JkSmL+JmJagoXdJzVnWMV4qi+sC8cPaVSdAxdYfP0ORliPYqDNcI
 cSTIfoeylBNBm6wfuGCFO1Zrg+YZU+Vm2464vMar9COMvvEEEIWR4kR/4ZSvuUPp3v1+
 BKfLckTtxDXJdj1bKvz+z1bf/TCk7UbmcenOYXjma4N+N5DaMB2x9YlD9ahcjCk7VEKW
 fvpYYOCWlkr27ZCxaU2EQQ0to1/+CFoF1/5h6LyDy0iIiOpqLHX9B3Mq72U/nDF7KZvo
 jXnGZ+pRI/wVItflChw96bpkOqPbozrcsi2rAGrBhSQUCh2qrPxbzrVcCqykK/6pZSVp
 sang==
X-Gm-Message-State: AOJu0YynB5fcB8D8wgeaJ+XZ/yq/Bv3NMPzrIneB4COg5+GEheTbTndh
 6JwP95p3kdO8uq7MjkQwmes=
X-Google-Smtp-Source: AGHT+IGt7l6o5PwKsvFViCwmf1r0WoQMwWrQxBmVxuyxOMjlfRS4f3YKQ2XLunb2gXYw1covaoaGKg==
X-Received: by 2002:a05:600c:468f:b0:40a:4429:a994 with SMTP id
 p15-20020a05600c468f00b0040a4429a994mr2234920wmo.28.1700329361729; 
 Sat, 18 Nov 2023 09:42:41 -0800 (PST)
Received: from zotac.lan.
 (dynamic-2a01-0c22-77bf-8300-2223-08ff-fe18-0310.c22.pool.telefonica.de.
 [2a01:c22:77bf:8300:2223:8ff:fe18:310])
 by smtp.gmail.com with ESMTPSA id
 y10-20020a05600c340a00b004068de50c64sm6964211wmp.46.2023.11.18.09.42.40
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Sat, 18 Nov 2023 09:42:41 -0800 (PST)
From: Heiner Kallweit <hkallweit1@gmail.com>
To: Wolfram Sang <wsa@kernel.org>,
	Xinliang Liu <xinliang.liu@linaro.org>
Subject: [PATCH v2 16/20] drivers/gpu/drm/hisilicon/hibmc/hibmc_drm_i2c.c:
 remove I2C_CLASS_DDC support
Date: Sat, 18 Nov 2023 18:42:16 +0100
Message-ID: <20231118174221.851-17-hkallweit1@gmail.com>
X-Mailer: git-send-email 2.42.1
In-Reply-To: <20231118174221.851-1-hkallweit1@gmail.com>
References: <20231118174221.851-1-hkallweit1@gmail.com>
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

