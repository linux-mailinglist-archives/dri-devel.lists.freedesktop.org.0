Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 80B157F05A9
	for <lists+dri-devel@lfdr.de>; Sun, 19 Nov 2023 12:28:42 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id F23A210E1CE;
	Sun, 19 Nov 2023 11:28:35 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-ej1-x634.google.com (mail-ej1-x634.google.com
 [IPv6:2a00:1450:4864:20::634])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 46FA010E1CE
 for <dri-devel@lists.freedesktop.org>; Sun, 19 Nov 2023 11:28:33 +0000 (UTC)
Received: by mail-ej1-x634.google.com with SMTP id
 a640c23a62f3a-9df8d0c2505so656999866b.0
 for <dri-devel@lists.freedesktop.org>; Sun, 19 Nov 2023 03:28:33 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20230601; t=1700393311; x=1700998111; darn=lists.freedesktop.org;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:from:to:cc:subject:date
 :message-id:reply-to;
 bh=3j9ifWvhNZGTq3IiSm2aJzZT95r7nTZmkK8TlD5sXtw=;
 b=VfWwM/NFyhDtVm7wBEBoGPYtoj45i5vMyBObE6rEE/yDvjmGxw+CXbIk8QdB1GTauk
 q/Bd/qn9fnY4mSUIsZeBTg1+h7sfGi/7UOCqKZh3c5pYyzqt8J/TlTlLizt5AZWzST/S
 esHegIMlhiZM1zoqdYKVZ/06Gk+pcdEp0xp3Mb/a6lgY3qZvNqGySiEv7NK4TiW8x9W7
 DNFFNXFiZZpXvEoDdHoquhC84OiZYr/3/bg8UbTiYKNDobngsaCHiwTZkCOvELDoAc+e
 e8+/YniTqLRYaxt9bwypoT8Lfhj75Dm366d3GXnmvVesFRUL4tC9S/TtNR/n45sn9+gy
 08jA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1700393311; x=1700998111;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=3j9ifWvhNZGTq3IiSm2aJzZT95r7nTZmkK8TlD5sXtw=;
 b=ZQxYYrApY1GBhWDvCTwJxemODov4WaNtwHGvXVUxnxQFNwK1+uWulpPO/aBf6TD4XC
 VGgGY6R1Du2hytKgvhapTCWn2euAt1vqllPy6KeNAWmGeEY+1FTYjHaySmCqe3zozGge
 RWf2sFLQ6/2CebDblUuHzqBG7tL1nfqPX6HofbHl+KKBGndOPTo1p2WXGWKmiTW2UQku
 6eiA7dHi+OCSPXFY5X613FQ6+JhbsNWht/yuMeeTLlp7g/sRA5JxLDcnTFymcaQabTy+
 RR3QF6unfBsLFpNc4/CcwszvSjmP+WKIYI6nXxRO2yjlbYyevK4tI4UjmAvK8tfJ6Irw
 tRGQ==
X-Gm-Message-State: AOJu0Ywj2Sma0cB0D9iB0X0FaSp3ewnTL3CnrHw93q0HeX28gs5q9nt8
 JZPf3+khH6OJFSfBtWawb9D+ub2FzrIFsw==
X-Google-Smtp-Source: AGHT+IEolPQnFux6ptEBdIgIWLfFvK+a9fTJaZAE2jvnmd47z8KPXEbmFvRb3A0Nnlw8LWex2IJNnw==
X-Received: by 2002:a17:906:2215:b0:9a1:f1b2:9f2e with SMTP id
 s21-20020a170906221500b009a1f1b29f2emr4088533ejs.2.1700393311373; 
 Sun, 19 Nov 2023 03:28:31 -0800 (PST)
Received: from zotac.lan.
 (dynamic-2a01-0c23-bde4-3e00-2223-08ff-fe18-0310.c23.pool.telefonica.de.
 [2a01:c23:bde4:3e00:2223:8ff:fe18:310])
 by smtp.gmail.com with ESMTPSA id
 k22-20020a1709063fd600b009f8af454d0dsm2420378ejj.112.2023.11.19.03.28.30
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Sun, 19 Nov 2023 03:28:31 -0800 (PST)
From: Heiner Kallweit <hkallweit1@gmail.com>
To: Wolfram Sang <wsa@kernel.org>,
	Dave Airlie <airlied@redhat.com>
Subject: [PATCH v3 02/20] drivers/gpu/drm/mgag200/mgag200_i2c.c: remove
 I2C_CLASS_DDC support
Date: Sun, 19 Nov 2023 12:28:07 +0100
Message-ID: <20231119112826.5115-3-hkallweit1@gmail.com>
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

