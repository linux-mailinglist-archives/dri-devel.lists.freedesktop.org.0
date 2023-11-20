Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 039207F1F9C
	for <lists+dri-devel@lfdr.de>; Mon, 20 Nov 2023 22:47:04 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 9E18610E1ED;
	Mon, 20 Nov 2023 21:46:54 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-wr1-x434.google.com (mail-wr1-x434.google.com
 [IPv6:2a00:1450:4864:20::434])
 by gabe.freedesktop.org (Postfix) with ESMTPS id CCA5C10E1EC
 for <dri-devel@lists.freedesktop.org>; Mon, 20 Nov 2023 21:46:45 +0000 (UTC)
Received: by mail-wr1-x434.google.com with SMTP id
 ffacd0b85a97d-32f78dcf036so3595672f8f.0
 for <dri-devel@lists.freedesktop.org>; Mon, 20 Nov 2023 13:46:45 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20230601; t=1700516804; x=1701121604; darn=lists.freedesktop.org;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:from:to:cc:subject:date
 :message-id:reply-to;
 bh=mvYv7yv0Rz2qXj3RF4iM+eVeFbHCrgQ2kQmEmocPEPY=;
 b=l5gx3bsnLR2CrgC77kM3UVXPuNe4v7bCj/vFwXfyp+yC0PqaY+/xupYtpmYzTOWQ53
 1EvVXEI1zzMEBHDuBV1Z85DuYf7WC29We6mqsL24JhqCgl9q6aTffS2ouIla4/zNBGn5
 mBuPoOV92VPZCmU7+gbjTXXFJfScKEocnSBHOU1uAGWPqT41z9tEUpXugUdkD4pQCqqi
 RP9RdNcaOOtnwpn7fFedTER8yMddrBe+0udB7htZP7lXL8/yaKWWBd/yftdEgYlRl3Mv
 N4kw3C0dkiyJDMEiyBWeW4d5/97zPXNrCxkNjK9UZ2m8tVrpFPRv64/uoIWmQkpSiGyM
 SSNg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1700516804; x=1701121604;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=mvYv7yv0Rz2qXj3RF4iM+eVeFbHCrgQ2kQmEmocPEPY=;
 b=nQnMGoLR/MdGAKCtSaNvdSO22A8Vb97SB8FazTta8Ob98DX0R5ypJNzLHYKkY+hQVx
 cp/67LOeZzuzeKxE9vJd2WHYWBbk7dCkDckbyiux9Kap8P+F8LLqX58jLK0ZgudKDnLI
 Qmz1kBSOV1bnr0lne2FR39scnw585CGmDcXV7/b5a3DZ0rmsAYvjrSno2eSlwPAbeIub
 GLkZJKLsi8RaO8Q/2KiyY+K4H6/Bc5k0G25VEea3yLDBvywN+BX03Qs6133FhWvv42q6
 qcD+38bi9jCZnyJc8o/W8xjH2S9wRp5i5nW6foFa0EM+CJ+L5mkf1pfE6BnDvmuvmP7F
 7xbQ==
X-Gm-Message-State: AOJu0Yy7V06SsGKZKCyCDLRhGNt+5oNSuqp/xGhcRJDhzwkaTd5tkAd0
 b2rk8IroQBo177U8ITerdDFQSxHcMTTNYw==
X-Google-Smtp-Source: AGHT+IFhVjIKyJHoTFDY1S25E30i9YBHBvrq3sray80zY0SoXNdaGxfljpNF4jtOS6XdTV+AbxDGhw==
X-Received: by 2002:a5d:6da6:0:b0:32d:a366:7073 with SMTP id
 u6-20020a5d6da6000000b0032da3667073mr659505wrs.14.1700516804106; 
 Mon, 20 Nov 2023 13:46:44 -0800 (PST)
Received: from zotac.lan.
 (dynamic-2a02-3100-9030-5a00-2223-08ff-fe18-0310.310.pool.telefonica.de.
 [2a02:3100:9030:5a00:2223:8ff:fe18:310])
 by smtp.gmail.com with ESMTPSA id
 i13-20020a5d584d000000b00332cb0937f4sm2667052wrf.33.2023.11.20.13.46.43
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Mon, 20 Nov 2023 13:46:43 -0800 (PST)
From: Heiner Kallweit <hkallweit1@gmail.com>
To: Wolfram Sang <wsa@kernel.org>,
 Patrik Jakobsson <patrik.r.jakobsson@gmail.com>
Subject: [PATCH v4 18/20] drivers/gpu/drm/gma500: remove I2C_CLASS_DDC support
Date: Mon, 20 Nov 2023 22:46:21 +0100
Message-ID: <20231120214624.9378-19-hkallweit1@gmail.com>
X-Mailer: git-send-email 2.42.1
In-Reply-To: <20231120214624.9378-1-hkallweit1@gmail.com>
References: <20231120214624.9378-1-hkallweit1@gmail.com>
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

