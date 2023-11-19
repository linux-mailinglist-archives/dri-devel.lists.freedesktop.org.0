Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 7DB7B7F05D1
	for <lists+dri-devel@lfdr.de>; Sun, 19 Nov 2023 12:29:03 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id EF15C10E1E8;
	Sun, 19 Nov 2023 11:28:53 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-ej1-x62e.google.com (mail-ej1-x62e.google.com
 [IPv6:2a00:1450:4864:20::62e])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 1F6C510E1CC
 for <dri-devel@lists.freedesktop.org>; Sun, 19 Nov 2023 11:28:47 +0000 (UTC)
Received: by mail-ej1-x62e.google.com with SMTP id
 a640c23a62f3a-9f27af23441so466719666b.2
 for <dri-devel@lists.freedesktop.org>; Sun, 19 Nov 2023 03:28:47 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20230601; t=1700393325; x=1700998125; darn=lists.freedesktop.org;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:from:to:cc:subject:date
 :message-id:reply-to;
 bh=mvYv7yv0Rz2qXj3RF4iM+eVeFbHCrgQ2kQmEmocPEPY=;
 b=VpCIsGl72hXd45z98EsX8meGao6Smo4HhpHNTV4Eyl9YQg5hOWZfGUZe6u9+oTADJt
 TqKvPvw6LjW+J1AQQW+M9oOTb521wKecUw95UDC5abplRTNTHaGEjdQgSLEvBGwgc545
 xY86823d1J5AtsiyfU98pGiUMvLOJjp691+MLJcZvjJ5SX8DRhkQBoamE2+NnfXjdLBE
 gKuOYUj02wqGLkGzu6ECYNkDmuD1A1rx2IILl5MxIx7aOly8MSk466Zlic5omtwKe2Iq
 IP1sVDcxvTWLKn7Gk1I0e0c2cZcXocA9Qz3uiZOCwtV+62P+OuhO2Qug6kBISXgkZhQ8
 P9Ug==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1700393325; x=1700998125;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=mvYv7yv0Rz2qXj3RF4iM+eVeFbHCrgQ2kQmEmocPEPY=;
 b=wyP2L4+A37MGy5Le1ldPLc5/L2eJ11iXqpmpAP/lxXEUP6GK/S/VWrbFMvY54BE/As
 22kTkkqLOCwtW9Fxe6pIONRCjVsWWQ/+9sM5P0c8wnVLvOCsulwKgHesXa7zmYN1xp/l
 lazBf8S+NpDSepfIXeLOU+f3NLnFkyjXeVEyXHeyK83jwCkvUsFFLJQV6dktPZ0h9Hd3
 IuWir1zUNgzwEsvFXwiUiJaWJkVDZ9VYP7ptzkAgN73t9josbzRU4192irRxN9R6AnZ2
 a2zPUfTm8w7hafBNxkVDIz/UF6RgcaBj7ZeLWDSWsuUGheFALqlDq7FOXO9s8mg1CG+4
 tmWQ==
X-Gm-Message-State: AOJu0Ywst5j+L/Iap3R1875dV095gYWDyG69qhYNd9lOBqAX+uCDEXAA
 X4eMWrBcHFLZobKHK5Y6TbA=
X-Google-Smtp-Source: AGHT+IEpB5ZnqGJppm4SyfFOjTFFzlNbJ5j1oKwnqCNhlB7TTiFFtmEVrL1Fkxgp4PWg2oSUQjk53Q==
X-Received: by 2002:a17:907:9394:b0:9d0:2e6b:f47f with SMTP id
 cm20-20020a170907939400b009d02e6bf47fmr3500186ejc.36.1700393325493; 
 Sun, 19 Nov 2023 03:28:45 -0800 (PST)
Received: from zotac.lan.
 (dynamic-2a01-0c23-bde4-3e00-2223-08ff-fe18-0310.c23.pool.telefonica.de.
 [2a01:c23:bde4:3e00:2223:8ff:fe18:310])
 by smtp.gmail.com with ESMTPSA id
 k22-20020a1709063fd600b009f8af454d0dsm2420378ejj.112.2023.11.19.03.28.44
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Sun, 19 Nov 2023 03:28:45 -0800 (PST)
From: Heiner Kallweit <hkallweit1@gmail.com>
To: Wolfram Sang <wsa@kernel.org>,
 Patrik Jakobsson <patrik.r.jakobsson@gmail.com>
Subject: [PATCH v3 18/20] drivers/gpu/drm/gma500: remove I2C_CLASS_DDC support
Date: Sun, 19 Nov 2023 12:28:23 +0100
Message-ID: <20231119112826.5115-19-hkallweit1@gmail.com>
X-Mailer: git-send-email 2.42.1
In-Reply-To: <20231119112826.5115-1-hkallweit1@gmail.com>
References: <20231119112826.5115-1-hkallweit1@gmail.com>
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
 Maxime Ripard <mripard@kernel.org>, linux-i2c@vger.kernel.org,
 Thomas Zimmermann <tzimmermann@suse.de>,
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
 drivers/gpu/drm/gma500/cdv_intel_dp.c      |    1 -
 drivers/gpu/drm/gma500/intel_gmbus.c       |    1 -
 drivers/gpu/drm/gma500/oaktrail_hdmi_i2c.c |    1 -
 drivers/gpu/drm/gma500/psb_intel_sdvo.c    |    1 -
 4 files changed, 4 deletions(-)

diff --git a/drivers/gpu/drm/gma500/cdv_intel_dp.c b/drivers/gpu/drm/gma500/cdv_intel_dp.c
index 8992a9507..dd1eb7e98 100644
--- a/drivers/gpu/drm/gma500/cdv_intel_dp.c
+++ b/drivers/gpu/drm/gma500/cdv_intel_dp.c
@@ -855,7 +855,6 @@ cdv_intel_dp_i2c_init(struct gma_connector *connector,
 
 	memset(&intel_dp->adapter, '\0', sizeof (intel_dp->adapter));
 	intel_dp->adapter.owner = THIS_MODULE;
-	intel_dp->adapter.class = I2C_CLASS_DDC;
 	strncpy (intel_dp->adapter.name, name, sizeof(intel_dp->adapter.name) - 1);
 	intel_dp->adapter.name[sizeof(intel_dp->adapter.name) - 1] = '\0';
 	intel_dp->adapter.algo_data = &intel_dp->algo;
diff --git a/drivers/gpu/drm/gma500/intel_gmbus.c b/drivers/gpu/drm/gma500/intel_gmbus.c
index 09cedabf4..aa4550985 100644
--- a/drivers/gpu/drm/gma500/intel_gmbus.c
+++ b/drivers/gpu/drm/gma500/intel_gmbus.c
@@ -411,7 +411,6 @@ int gma_intel_setup_gmbus(struct drm_device *dev)
 		struct intel_gmbus *bus = &dev_priv->gmbus[i];
 
 		bus->adapter.owner = THIS_MODULE;
-		bus->adapter.class = I2C_CLASS_DDC;
 		snprintf(bus->adapter.name,
 			 sizeof(bus->adapter.name),
 			 "gma500 gmbus %s",
diff --git a/drivers/gpu/drm/gma500/oaktrail_hdmi_i2c.c b/drivers/gpu/drm/gma500/oaktrail_hdmi_i2c.c
index fc9a34ed5..6daa6669e 100644
--- a/drivers/gpu/drm/gma500/oaktrail_hdmi_i2c.c
+++ b/drivers/gpu/drm/gma500/oaktrail_hdmi_i2c.c
@@ -168,7 +168,6 @@ static struct i2c_adapter oaktrail_hdmi_i2c_adapter = {
 	.name		= "oaktrail_hdmi_i2c",
 	.nr		= 3,
 	.owner		= THIS_MODULE,
-	.class		= I2C_CLASS_DDC,
 	.algo		= &oaktrail_hdmi_i2c_algorithm,
 };
 
diff --git a/drivers/gpu/drm/gma500/psb_intel_sdvo.c b/drivers/gpu/drm/gma500/psb_intel_sdvo.c
index d6fd5d726..e4f914dec 100644
--- a/drivers/gpu/drm/gma500/psb_intel_sdvo.c
+++ b/drivers/gpu/drm/gma500/psb_intel_sdvo.c
@@ -2426,7 +2426,6 @@ psb_intel_sdvo_init_ddc_proxy(struct psb_intel_sdvo *sdvo,
 			  struct drm_device *dev)
 {
 	sdvo->ddc.owner = THIS_MODULE;
-	sdvo->ddc.class = I2C_CLASS_DDC;
 	snprintf(sdvo->ddc.name, I2C_NAME_SIZE, "SDVO DDC proxy");
 	sdvo->ddc.dev.parent = dev->dev;
 	sdvo->ddc.algo_data = sdvo;

