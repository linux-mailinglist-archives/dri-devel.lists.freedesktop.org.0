Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 7F0F27F5B62
	for <lists+dri-devel@lfdr.de>; Thu, 23 Nov 2023 10:41:23 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id E767810E705;
	Thu, 23 Nov 2023 09:41:11 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-ej1-x62a.google.com (mail-ej1-x62a.google.com
 [IPv6:2a00:1450:4864:20::62a])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 4F00A10E6FB;
 Thu, 23 Nov 2023 09:40:58 +0000 (UTC)
Received: by mail-ej1-x62a.google.com with SMTP id
 a640c23a62f3a-9ff26d7c0a6so87001366b.2; 
 Thu, 23 Nov 2023 01:40:58 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20230601; t=1700732457; x=1701337257; darn=lists.freedesktop.org;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:from:to:cc:subject:date
 :message-id:reply-to;
 bh=clBWu+ZkOHv5aLxF4Jumr7Rdkfthd/rp2JM9TiGQIuQ=;
 b=jhblB7qPc9opZFUKN2EHXpCLSD2g25XyXQ4H1DI0nRsPpLG0Y/RHZFeQxNmtAWUp53
 qa8xLiMQaoEJGFXu9X3IgRxguiH6RolJDRsycQdWN7b6OSZkie7/Z4CVh+jLxi3kJwgT
 XYTQdibo+15QSST9wKe8yzbokKq2k1hQAHOyPJufqkUT6VFvpJUFsUVzmA4rZ2u63I88
 uARHVP3oQN68QXTrcefDr25NE5fnE5Pwzh8BkIdoo4DkHcboWg3tv7o/rwUfa2YJiOf0
 D1AB8Vxo0mUq9+QsoslLlcrypfPOY1uyLhG5ns5FgXhyvVxtbadEONqS3Pki6NA8UWTV
 WeCg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1700732457; x=1701337257;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=clBWu+ZkOHv5aLxF4Jumr7Rdkfthd/rp2JM9TiGQIuQ=;
 b=f1ObZxVP82U79C268+vcS7s2jo6l/kR9LNZOiA9vF+OsWRdZUeWhbw/D3oLDpwkXjF
 AETXhO6MTHEbE+zvEDo4Vvq1rae5ec6MrkPI7Yaec0/TFrDkHhMtzAxc/IYCeUpe7ZwG
 2TuWQuXXz/GPc0hrK0iPHttVx47Y6ONnr8qBJDAngnCEY3UwytZIxUnjdD9UP8LkdINu
 zflB+eBEjUI60VApIHRJ4snSC9Jc4g0h7F8M/xlxIgxqyWOiBNzNTSywaiwtz8wR3UAT
 ar/sl8aOCpXF8IiBG4Ia7NvfhiULqArNa1VCssoSKkgSklxRtdWhAmkDZ7r5DQZ/pPm0
 W3fw==
X-Gm-Message-State: AOJu0Yy02qs+cmUT4hDq8sdn7cEjnitmFEvnI2BvjghxU6gHsJF/ChYC
 OZ78+2k6TI1pqIsw1Jzd3eI=
X-Google-Smtp-Source: AGHT+IHq8vY/hRvfYfdj8oyzjE1msXHk0E43hTKOhiKHBd9IaWBYhWspiL+jJRvOCphRN+F9o76e6Q==
X-Received: by 2002:a17:907:9207:b0:9fa:ca0c:ac42 with SMTP id
 ka7-20020a170907920700b009faca0cac42mr3054539ejb.64.1700732456620; 
 Thu, 23 Nov 2023 01:40:56 -0800 (PST)
Received: from zotac.lan.
 (dynamic-2a01-0c23-c0f2-3200-2223-08ff-fe18-0310.c23.pool.telefonica.de.
 [2a01:c23:c0f2:3200:2223:8ff:fe18:310])
 by smtp.gmail.com with ESMTPSA id
 s9-20020a1709066c8900b009e5ce1acb01sm546199ejr.103.2023.11.23.01.40.55
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Thu, 23 Nov 2023 01:40:56 -0800 (PST)
From: Heiner Kallweit <hkallweit1@gmail.com>
To: Wolfram Sang <wsa@kernel.org>,
	Rob Clark <robdclark@gmail.com>
Subject: [PATCH v5 14/20] drivers/gpu/drm/msm/hdmi/hdmi_i2c.c: remove
 I2C_CLASS_DDC support
Date: Thu, 23 Nov 2023 10:40:34 +0100
Message-ID: <20231123094040.592-15-hkallweit1@gmail.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20231123094040.592-1-hkallweit1@gmail.com>
References: <20231123094040.592-1-hkallweit1@gmail.com>
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
Cc: freedreno@lists.freedesktop.org, Thomas Zimmermann <tzimmermann@suse.de>,
 Abhinav Kumar <quic_abhinavk@quicinc.com>, dri-devel@lists.freedesktop.org,
 linux-kernel@vger.kernel.org, linux-i2c@vger.kernel.org,
 linux-arm-msm@vger.kernel.org, Dmitry Baryshkov <dmitry.baryshkov@linaro.org>,
 Marijn Suijten <marijn.suijten@somainline.org>, Sean Paul <sean@poorly.run>,
 Heiner Kallweit <hkallweit1@gmail.com>
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

After removal of the legacy EEPROM driver and I2C_CLASS_DDC support in
olpc_dcon there's no i2c client driver left supporting I2C_CLASS_DDC.
Class-based device auto-detection is a legacy mechanism and shouldn't
be used in new code. So we can remove this class completely now.

Preferably this series should be applied via the i2c tree.

Acked-by: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
Acked-by: Thomas Zimmermann <tzimmermann@suse.de>
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

