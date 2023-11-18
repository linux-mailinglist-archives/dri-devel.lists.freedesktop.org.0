Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id CA3CF7F0198
	for <lists+dri-devel@lfdr.de>; Sat, 18 Nov 2023 18:43:55 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 82EEB10E341;
	Sat, 18 Nov 2023 17:43:52 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-wm1-x335.google.com (mail-wm1-x335.google.com
 [IPv6:2a00:1450:4864:20::335])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 8542A10E347
 for <dri-devel@lists.freedesktop.org>; Sat, 18 Nov 2023 17:42:46 +0000 (UTC)
Received: by mail-wm1-x335.google.com with SMTP id
 5b1f17b1804b1-40906fc54fdso4732235e9.0
 for <dri-devel@lists.freedesktop.org>; Sat, 18 Nov 2023 09:42:46 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20230601; t=1700329365; x=1700934165; darn=lists.freedesktop.org;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:from:to:cc:subject:date
 :message-id:reply-to;
 bh=GFB7iCk0Bd2syBjc9Ptoymcq6fnpGc3VauDL49PiFhg=;
 b=FJL+gRqVD6hr4yN5cOh8Fbeg4pE27yoSStJgud8W+wUhTMfw+kcJVb6mNrwE/gICWq
 sUTgssTxNIDkpQFnulohiJDyGfWirZSNP8rWmLAKSk3oBYqUWe5kgYZ9xdcf+ObiJMfc
 CoCIIzzmuC0BCmsOE9P+vbgVAxT1FHxh2+sF+dGyNHUzAy11yCUduQHKSoyEjovpfbV8
 oe7L2Rd/+kmpa6Vs4py4MYyQzQ8KFxzkWcrpcjkdF5AD+9xQnBn1dLBKR5ciao/ApOA/
 F/3LMWebBaVoqqI6o7W6cyH+l999iRhoDsq/5W+W3PAx1tErOUEBxOiGLz4y5TL7hdqh
 lRWQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1700329365; x=1700934165;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=GFB7iCk0Bd2syBjc9Ptoymcq6fnpGc3VauDL49PiFhg=;
 b=pKeM8tWC53j7pbc9juzO9s7mKnloD/5Wl+8MkLlbyzpnbQdacRp4jd8bICfwKpBVzW
 ArGvVxU3NwVH6P0HvtpEfAhwPjy1eBhrDOEaV07GQDquvWajz2cNtUqIlD/tu5G9C43S
 i8hwByxiOybFUV25YYEfuMqY6sbk6bO65NicpHnSjjP/GEnzytoZYX11GOETNdTwG0Fe
 biw7Ym9sIPR8B0pfxRpObQbq5Dn9EyI+OfRjnVbYOVWHNh2Uoyqy2cPYtcaya6ZJQjlu
 GrrbFhjPwiL+n0+4zrzUokVuVlBDMBOkcl3ynvQi/vOhQ/jOMefx1esQ8ny5rGz+ipJY
 h1Iw==
X-Gm-Message-State: AOJu0YyeoI0uZ1g6bo16ThgQSTXfUGN9zBWFFoED07V3OUILO/nrK0Bk
 AkCoiOosBmd8kNq7x9Bar8o=
X-Google-Smtp-Source: AGHT+IG1bPAOgl9NUb3ZPEvQdEyTHO+knTlvlp83e0Ttem8msHJ/hnBaJ5EBV2Fub43robL8FmGQHA==
X-Received: by 2002:a05:600c:4ec8:b0:409:5580:bc9f with SMTP id
 g8-20020a05600c4ec800b004095580bc9fmr2199231wmq.34.1700329364830; 
 Sat, 18 Nov 2023 09:42:44 -0800 (PST)
Received: from zotac.lan.
 (dynamic-2a01-0c22-77bf-8300-2223-08ff-fe18-0310.c22.pool.telefonica.de.
 [2a01:c22:77bf:8300:2223:8ff:fe18:310])
 by smtp.gmail.com with ESMTPSA id
 y10-20020a05600c340a00b004068de50c64sm6964211wmp.46.2023.11.18.09.42.44
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Sat, 18 Nov 2023 09:42:44 -0800 (PST)
From: Heiner Kallweit <hkallweit1@gmail.com>
To: Wolfram Sang <wsa@kernel.org>,
 Maarten Lankhorst <maarten.lankhorst@linux.intel.com>
Subject: [PATCH v2 19/20] drivers/gpu/drm/display: remove I2C_CLASS_DDC support
Date: Sat, 18 Nov 2023 18:42:19 +0100
Message-ID: <20231118174221.851-20-hkallweit1@gmail.com>
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
Cc: Thomas Zimmermann <tzimmermann@suse.de>, dri-devel@lists.freedesktop.org,
 linux-kernel@vger.kernel.org, Maxime Ripard <mripard@kernel.org>,
 linux-i2c@vger.kernel.org, Alex Deucher <alexander.deucher@amd.com>,
 Heiner Kallweit <hkallweit1@gmail.com>
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

After removal of the legacy EEPROM driver and I2C_CLASS_DDC support in
olpc_dcon there's no i2c client driver left supporting I2C_CLASS_DDC.
Class-based device auto-detection is a legacy mechanism and shouldn't
be used in new code. So we can remove this class completely now.

Preferably this series should be applied via the i2c tree.

Acked-by: Alex Deucher <alexander.deucher@amd.com>
Signed-off-by: Heiner Kallweit <hkallweit1@gmail.com>

---
 drivers/gpu/drm/display/drm_dp_helper.c       |    1 -
 drivers/gpu/drm/display/drm_dp_mst_topology.c |    1 -
 2 files changed, 2 deletions(-)

diff --git a/drivers/gpu/drm/display/drm_dp_helper.c b/drivers/gpu/drm/display/drm_dp_helper.c
index f3680f4e6..ac901f4b4 100644
--- a/drivers/gpu/drm/display/drm_dp_helper.c
+++ b/drivers/gpu/drm/display/drm_dp_helper.c
@@ -2102,7 +2102,6 @@ int drm_dp_aux_register(struct drm_dp_aux *aux)
 	if (!aux->ddc.algo)
 		drm_dp_aux_init(aux);
 
-	aux->ddc.class = I2C_CLASS_DDC;
 	aux->ddc.owner = THIS_MODULE;
 	aux->ddc.dev.parent = aux->dev;
 
diff --git a/drivers/gpu/drm/display/drm_dp_mst_topology.c b/drivers/gpu/drm/display/drm_dp_mst_topology.c
index 0e0d0e76d..4376e2c1f 100644
--- a/drivers/gpu/drm/display/drm_dp_mst_topology.c
+++ b/drivers/gpu/drm/display/drm_dp_mst_topology.c
@@ -5803,7 +5803,6 @@ static int drm_dp_mst_register_i2c_bus(struct drm_dp_mst_port *port)
 	aux->ddc.algo_data = aux;
 	aux->ddc.retries = 3;
 
-	aux->ddc.class = I2C_CLASS_DDC;
 	aux->ddc.owner = THIS_MODULE;
 	/* FIXME: set the kdev of the port's connector as parent */
 	aux->ddc.dev.parent = parent_dev;

