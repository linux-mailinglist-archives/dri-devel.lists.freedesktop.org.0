Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id D9FA77F0192
	for <lists+dri-devel@lfdr.de>; Sat, 18 Nov 2023 18:43:33 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id B72BA10E334;
	Sat, 18 Nov 2023 17:43:31 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-wm1-x32e.google.com (mail-wm1-x32e.google.com
 [IPv6:2a00:1450:4864:20::32e])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 90C7B10E343;
 Sat, 18 Nov 2023 17:42:41 +0000 (UTC)
Received: by mail-wm1-x32e.google.com with SMTP id
 5b1f17b1804b1-40859c466efso4638455e9.3; 
 Sat, 18 Nov 2023 09:42:41 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20230601; t=1700329360; x=1700934160; darn=lists.freedesktop.org;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:from:to:cc:subject:date
 :message-id:reply-to;
 bh=RwYQsxTIlPnpbp305mlbq5GplvUv/n/Jh48i1GH8+AY=;
 b=Dj5mNAgVCiN7+tr1JHvw6X5kvAjMRF7A5Wvq6JobJSCmb41i513vjP1H0wUoJwOiFN
 k38/D2bpYemph/A7rAuIUr5JMmlvinGy3156HDVM2kYcFAlKuom+CgoMhU1krRsFwKk1
 BJMpBoMqLn+S8Z++48vFQOVl3KTWsGvlS0ntz3339YAPURr0XhxhRzPSvBih4gGFEcPP
 WM6udrLoeVaMBXfDKI7aB4g+XPG/1Q06XvnZheeyyIJgELOQViG1tlTJ5Fy8+VObN7o9
 jlqu+hh3o3I0jPUxRxBgxhU/s4laFlRjRqbrREnS8DmIiscDl/1+8RX4j56AolYE3+r7
 CBLQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1700329360; x=1700934160;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=RwYQsxTIlPnpbp305mlbq5GplvUv/n/Jh48i1GH8+AY=;
 b=Rr9srXeEMULUst1RMDnn9tEzsN7Lk8YQmaaVT2HrIdPdSQDkHmegVg4ys/8/fkXiiY
 YFNVBZCVvJAjM1lQ5aTQZ9HRXmU+2lcTJUONtMlHqWMzpmjNK9FGUHxAeRgJ+PWuEN2e
 Qrl627EjBiS8KM3L+J37I3sA9VhwOOzgfvsp92CGsKuR4GEy87F72f3P10nlIGaKcwEA
 cDbSOfasK979A1Iva2qaSQYsVrX8yy92OECs6jtpz5QL4PJ4VhcFQ4+DNxmkCVbgeoA9
 gBslWSlmbeVuSM2fiVCKKA9wo/XzfnTi7tsSquff2JnDBvc/7V1E5G/MqXA10HTs3vLL
 ywvA==
X-Gm-Message-State: AOJu0Yy0i7RCcmCHeq9qLvKb399JsGBdZIcoK1Fz6OODk3kkR7QHFiIG
 nvCA/5z4mEAjf1cM9mgTuIU=
X-Google-Smtp-Source: AGHT+IEDEAp2JxX1TrsPD+58kjm/UMuphpwbs1HtNIKAuhJlTjYYuA4bjSnwRduobt/RGzGOZOWLeQ==
X-Received: by 2002:a05:600c:4f01:b0:40a:5b3c:403 with SMTP id
 l1-20020a05600c4f0100b0040a5b3c0403mr2242232wmq.14.1700329359934; 
 Sat, 18 Nov 2023 09:42:39 -0800 (PST)
Received: from zotac.lan.
 (dynamic-2a01-0c22-77bf-8300-2223-08ff-fe18-0310.c22.pool.telefonica.de.
 [2a01:c22:77bf:8300:2223:8ff:fe18:310])
 by smtp.gmail.com with ESMTPSA id
 y10-20020a05600c340a00b004068de50c64sm6964211wmp.46.2023.11.18.09.42.39
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Sat, 18 Nov 2023 09:42:39 -0800 (PST)
From: Heiner Kallweit <hkallweit1@gmail.com>
To: Wolfram Sang <wsa@kernel.org>,
	Rob Clark <robdclark@gmail.com>
Subject: [PATCH v2 14/20] drivers/gpu/drm/msm/hdmi/hdmi_i2c.c: remove
 I2C_CLASS_DDC support
Date: Sat, 18 Nov 2023 18:42:14 +0100
Message-ID: <20231118174221.851-15-hkallweit1@gmail.com>
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
Cc: freedreno@lists.freedesktop.org, Abhinav Kumar <quic_abhinavk@quicinc.com>,
 dri-devel@lists.freedesktop.org, linux-kernel@vger.kernel.org,
 linux-i2c@vger.kernel.org, linux-arm-msm@vger.kernel.org,
 Dmitry Baryshkov <dmitry.baryshkov@linaro.org>,
 Marijn Suijten <marijn.suijten@somainline.org>, Sean Paul <sean@poorly.run>,
 Heiner Kallweit <hkallweit1@gmail.com>
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

After removal of the legacy EEPROM driver and I2C_CLASS_DDC support in
olpc_dcon there's no i2c client driver left supporting I2C_CLASS_DDC.
Class-based device auto-detection is a legacy mechanism and shouldn't
be used in new code. So we can remove this class completely now.

Preferably this series should be applied via the i2c tree.

Signed-off-by: Heiner Kallweit <hkallweit1@gmail.com>

---
 drivers/gpu/drm/msm/hdmi/hdmi_i2c.c |    1 -
 1 file changed, 1 deletion(-)

diff --git a/drivers/gpu/drm/msm/hdmi/hdmi_i2c.c b/drivers/gpu/drm/msm/hdmi/hdmi_i2c.c
index de182c004..7aa500d24 100644
--- a/drivers/gpu/drm/msm/hdmi/hdmi_i2c.c
+++ b/drivers/gpu/drm/msm/hdmi/hdmi_i2c.c
@@ -249,7 +249,6 @@ struct i2c_adapter *msm_hdmi_i2c_init(struct hdmi *hdmi)
 
 
 	i2c->owner = THIS_MODULE;
-	i2c->class = I2C_CLASS_DDC;
 	snprintf(i2c->name, sizeof(i2c->name), "msm hdmi i2c");
 	i2c->dev.parent = &hdmi->pdev->dev;
 	i2c->algo = &msm_hdmi_i2c_algorithm;

