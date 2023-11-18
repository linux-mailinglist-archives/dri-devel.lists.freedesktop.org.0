Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 884EF7F017A
	for <lists+dri-devel@lfdr.de>; Sat, 18 Nov 2023 18:42:52 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 9F78210E33A;
	Sat, 18 Nov 2023 17:42:37 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-wm1-x32f.google.com (mail-wm1-x32f.google.com
 [IPv6:2a00:1450:4864:20::32f])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 85DEE10E332
 for <dri-devel@lists.freedesktop.org>; Sat, 18 Nov 2023 17:42:29 +0000 (UTC)
Received: by mail-wm1-x32f.google.com with SMTP id
 5b1f17b1804b1-408425c7c10so4783205e9.0
 for <dri-devel@lists.freedesktop.org>; Sat, 18 Nov 2023 09:42:29 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20230601; t=1700329348; x=1700934148; darn=lists.freedesktop.org;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:from:to:cc:subject:date
 :message-id:reply-to;
 bh=3j9ifWvhNZGTq3IiSm2aJzZT95r7nTZmkK8TlD5sXtw=;
 b=VQF7MMYJW/J/VHULzr+n0u0ZgYLAnIbHFwNHU8G4bw8LGp69m8PmVKsKN9nsgv6VWE
 9b1eB5r4S6hwo/SE8r8DIKsKGDGb/IGh0iHTslqYEhWs66QopbAGDkDzTeclbR7OzUZD
 etbk5j4fXg2r6xpH5ipsNm+iUvbplVYkhYwdfagL0vTjedfRINkiKe3w/BjH0Ba2Ld7G
 8sgzLWycJEwQiFkwebZnnTv+KAxyLWjCS3rlkJUzMu2EbzjEDNeJnT+OCIWCuA06Q8em
 qlnij2kQYhq6sbhFaHxPryOcMC+C8qbgFlynbUYfgim0la0oM8jgmrEe1Z8pKf6i7BlG
 BtUw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1700329348; x=1700934148;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=3j9ifWvhNZGTq3IiSm2aJzZT95r7nTZmkK8TlD5sXtw=;
 b=t+0yVqFNaoYx7Haej6Jds3ev2PudPs3WlUsggepcSIG7VzwF71Y7IkzPEEDjeaEEdX
 qT6oeOyFCcDB2aFT9ORjVENdj2If+fZtlQd0OX23WvnL4+7G4cRdTCtF1ik/uje4mL9K
 F+dJQL0yA/UNQpxjp5HDnkoE2D7C+xZMnkTekrWvtYOfcedthWL/oHFqt3xAAj5m0OLq
 yV2Z3eg44V+CxWJwQtrHs/SG5eI8epaKpTaq+Urt3GNSAeHNT5Em5Tu/mtKVkZauBpto
 OVmKdKXvAQwqU9mikDx/4ZUKMf+EDdtam7CDd/Jzoypj/1EfcfHF+uMCWjWjiZYvwzGP
 V6tQ==
X-Gm-Message-State: AOJu0YyvPschr+iWIsSZ5ru1c+96Mgto8xj3l7wc6VaLm7aoGmC2x9v7
 Q00MUtCBSAI4+sO2cnsWK88=
X-Google-Smtp-Source: AGHT+IE+/T5akrgcd8jfoxC+27DJiLMD9yywl/rsoQi2NbXCmSA/211Cuyy0UCxwYrsOXe7kSYSepw==
X-Received: by 2002:a05:600c:4f14:b0:406:f833:d853 with SMTP id
 l20-20020a05600c4f1400b00406f833d853mr1767049wmq.15.1700329347662; 
 Sat, 18 Nov 2023 09:42:27 -0800 (PST)
Received: from zotac.lan.
 (dynamic-2a01-0c22-77bf-8300-2223-08ff-fe18-0310.c22.pool.telefonica.de.
 [2a01:c22:77bf:8300:2223:8ff:fe18:310])
 by smtp.gmail.com with ESMTPSA id
 y10-20020a05600c340a00b004068de50c64sm6964211wmp.46.2023.11.18.09.42.26
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Sat, 18 Nov 2023 09:42:27 -0800 (PST)
From: Heiner Kallweit <hkallweit1@gmail.com>
To: Wolfram Sang <wsa@kernel.org>,
	Dave Airlie <airlied@redhat.com>
Subject: [PATCH v2 02/20] drivers/gpu/drm/mgag200/mgag200_i2c.c: remove
 I2C_CLASS_DDC support
Date: Sat, 18 Nov 2023 18:42:02 +0100
Message-ID: <20231118174221.851-3-hkallweit1@gmail.com>
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

