Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id E833B7F1F8C
	for <lists+dri-devel@lfdr.de>; Mon, 20 Nov 2023 22:46:54 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id AE07F10E1E5;
	Mon, 20 Nov 2023 21:46:50 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-wr1-x432.google.com (mail-wr1-x432.google.com
 [IPv6:2a00:1450:4864:20::432])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 5CF4C10E1B9
 for <dri-devel@lists.freedesktop.org>; Mon, 20 Nov 2023 21:46:31 +0000 (UTC)
Received: by mail-wr1-x432.google.com with SMTP id
 ffacd0b85a97d-32faea0fa1fso2864778f8f.1
 for <dri-devel@lists.freedesktop.org>; Mon, 20 Nov 2023 13:46:31 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20230601; t=1700516790; x=1701121590; darn=lists.freedesktop.org;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:from:to:cc:subject:date
 :message-id:reply-to;
 bh=H76sh9TJa21kiF09BweriFrW/UpEK7sOhe75l5gn76g=;
 b=Km5ODfGIUYv/m/A488BzNCGuN8O2FHY94a/N9ebvrsEoA7N1P5s7KFBWGVkQ6P8+XI
 hIv0ejYLWzHV13dGSH1r9CitqYWsFOXMYhFPD2BFNRjQ+ozSBDCJlY0vEQqIpnvl/kf2
 +0996Le9KrD+hQwTC0Q1lyG/c9XjzPmkwog8R4aZF+5cFQVBJhRfY/DlwJQRkQ56vcjH
 4RfNPsjHHOkz1huLXj0UN85qAk6aT9yfosEzzRNkOYIsv1d+EEcWauDLnlJy6tQ8mvaJ
 9pybdegKQyY6V3hlsemBvz4VGpj9yMDjfchsdguV1OLTwuEpVzpd+VTzVIeS6psVgqjw
 zYYQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1700516790; x=1701121590;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=H76sh9TJa21kiF09BweriFrW/UpEK7sOhe75l5gn76g=;
 b=h5smORrFwWDb/NkEdUQCaJKtgj9fXwhiw0V+QKNhK5/TzcBcTw6tR4a+uQ7Jehaixt
 sMZJCQKMUSF+EHz5nZ+HQ/gLJI54ifBhZHMPah/CTTLu8r7uFMtZnRiHsiWovDTJy9d3
 MuV631ikoiRCaGXyMKsgosltat0cisgrOsJwEeO2lt5b13+SmZrRYzflgZlEDLzgl7e/
 KxqcoLhy6Frf9hpdp314zJ6ywn0nKvAdICiEO6LQ8k2sDZITd40C9ENqOMUufvuAbSQP
 tJ2D3U3IlOe9CWAM6MozeBtIKNJQLvEqGOc0DwQTpygLWJDEyxec5sNygXc+WJ3Zl/4D
 z0gg==
X-Gm-Message-State: AOJu0YykA8Zs0e2WdssWOyKHLf3bDydXQ2khaSYB58pxbtZ08ma3UJ/A
 1cV3DwMZduTc9awuSdjggrE=
X-Google-Smtp-Source: AGHT+IE2ErATm2xBrVPTmReU5ycJuHnLDpRJNW4Slun/A9h1smmlE3tedG4RsPPOlF2k6luf9dWXyw==
X-Received: by 2002:a5d:648b:0:b0:332:c726:ed5c with SMTP id
 o11-20020a5d648b000000b00332c726ed5cmr612415wri.32.1700516789457; 
 Mon, 20 Nov 2023 13:46:29 -0800 (PST)
Received: from zotac.lan.
 (dynamic-2a02-3100-9030-5a00-2223-08ff-fe18-0310.310.pool.telefonica.de.
 [2a02:3100:9030:5a00:2223:8ff:fe18:310])
 by smtp.gmail.com with ESMTPSA id
 i13-20020a5d584d000000b00332cb0937f4sm2667052wrf.33.2023.11.20.13.46.28
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Mon, 20 Nov 2023 13:46:29 -0800 (PST)
From: Heiner Kallweit <hkallweit1@gmail.com>
To: Wolfram Sang <wsa@kernel.org>,
	Dave Airlie <airlied@redhat.com>
Subject: [PATCH v4 02/20] drivers/gpu/drm/mgag200/mgag200_i2c.c: remove
 I2C_CLASS_DDC support
Date: Mon, 20 Nov 2023 22:46:05 +0100
Message-ID: <20231120214624.9378-3-hkallweit1@gmail.com>
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
Cc: Jocelyn Falempe <jfalempe@redhat.com>, dri-devel@lists.freedesktop.org,
 linux-kernel@vger.kernel.org, Maxime Ripard <mripard@kernel.org>,
 linux-i2c@vger.kernel.org, Thomas Zimmermann <tzimmermann@suse.de>,
 Heiner Kallweit <hkallweit1@gmail.com>
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

After removal of the legacy EEPROM driver and I2C_CLASS_DDC support in
olpc_dcon there's no i2c client driver left supporting I2C_CLASS_DDC.
Class-based device auto-detection is a legacy mechanism and shouldn't
be used in new code. So we can remove this class completely now.

Preferably this series should be applied via the i2c tree.

Reviewed-by: Thomas Zimmermann <tzimmermann@suse.de>
Signed-off-by: Heiner Kallweit <hkallweit1@gmail.com>

---
 drivers/gpu/drm/mgag200/mgag200_i2c.c |    1 -
 1 file changed, 1 deletion(-)

diff --git a/drivers/gpu/drm/mgag200/mgag200_i2c.c b/drivers/gpu/drm/mgag200/mgag200_i2c.c
index 0c48bdf3e..423eb302b 100644
--- a/drivers/gpu/drm/mgag200/mgag200_i2c.c
+++ b/drivers/gpu/drm/mgag200/mgag200_i2c.c
@@ -106,7 +106,6 @@ int mgag200_i2c_init(struct mga_device *mdev, struct mga_i2c_chan *i2c)
 	i2c->data = BIT(info->i2c.data_bit);
 	i2c->clock = BIT(info->i2c.clock_bit);
 	i2c->adapter.owner = THIS_MODULE;
-	i2c->adapter.class = I2C_CLASS_DDC;
 	i2c->adapter.dev.parent = dev->dev;
 	i2c->dev = dev;
 	i2c_set_adapdata(&i2c->adapter, i2c);

