Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id A9E997F5B4C
	for <lists+dri-devel@lfdr.de>; Thu, 23 Nov 2023 10:41:11 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 1F0F410E6FD;
	Thu, 23 Nov 2023 09:40:55 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-ej1-x630.google.com (mail-ej1-x630.google.com
 [IPv6:2a00:1450:4864:20::630])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 4AD3810E034
 for <dri-devel@lists.freedesktop.org>; Thu, 23 Nov 2023 09:40:48 +0000 (UTC)
Received: by mail-ej1-x630.google.com with SMTP id
 a640c23a62f3a-a00a9d677fcso81649066b.0
 for <dri-devel@lists.freedesktop.org>; Thu, 23 Nov 2023 01:40:48 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20230601; t=1700732447; x=1701337247; darn=lists.freedesktop.org;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:from:to:cc:subject:date
 :message-id:reply-to;
 bh=H76sh9TJa21kiF09BweriFrW/UpEK7sOhe75l5gn76g=;
 b=ceeVkcjjz3+88818xLARgtUTL7kn8YpDOnxG7iXHxqMvlSmGpiWoHxoGBmC6nViwo6
 phDlw0du2fPft+hkNixP2040RXSAMARczsYleGXlLojOAjRw7LF4bW/N7JKcOTN+YGdL
 8/LUauq2OLw84kGOERbDf+UAb+DfKAxlKt/efiN6YIda+r46scQYEFFADdT02ACeKjND
 Bjr/BhZDMEiTIhJ3XmIjt1SizVpF/cdvflmkbbmDM8dqQ7wXlDYio17g4XZ4clVUrTQW
 sM1eseD19wuMDvU8CGeWX4PgcHv3VbBPfvHlFNfXcC90Wl7dhoL8FwSkv8S8qgzrf5V+
 bUJA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1700732447; x=1701337247;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=H76sh9TJa21kiF09BweriFrW/UpEK7sOhe75l5gn76g=;
 b=drenv/x7JElf8CDl9qi79w3VL1MLX/XLqNncvIag43ZrkYZ9w+wH6+M0ifZ7mxJ545
 m/8m8y5gB5BNWsjhxI0Li1HFzIu2rplCHAecN2/4V8w7EPWNCQouJgaQAHTmTDfQKgEj
 CpX0cFTnql43/ghfahdG8Nz3wi7Son3LVYcIoE2SHPW7NbAI7BkdRV7x3nb8IfCziw8F
 9J8otYF+y2GOcw7te9oRZrVCjik6IR17lD2SCp4RLdcjZxCUHkhZYjOS9v8J+dcQjU0p
 8B5Hn9urry3g0Fr9bOEoSohJm9M+Xh5vOu/RwPQkQJIPh1cJH/ds6evjrbZk7N1ZrjcW
 1wgw==
X-Gm-Message-State: AOJu0YycYLLhiMwB9I9HuZnVk5KIq9XTgrA1ytKagEoJiGGNCeqT1D8M
 +kmdobZWvm8kZK3MI/gshjA=
X-Google-Smtp-Source: AGHT+IEn690wfubKb/UyQpCV8u5r9s/J7YoDjXMPpmRF+BSrF8lwfJHZHGsK4X3ZCynniFHKeVNcKA==
X-Received: by 2002:a17:906:14d:b0:9e0:5d5c:aa6d with SMTP id
 13-20020a170906014d00b009e05d5caa6dmr3302730ejh.20.1700732446363; 
 Thu, 23 Nov 2023 01:40:46 -0800 (PST)
Received: from zotac.lan.
 (dynamic-2a01-0c23-c0f2-3200-2223-08ff-fe18-0310.c23.pool.telefonica.de.
 [2a01:c23:c0f2:3200:2223:8ff:fe18:310])
 by smtp.gmail.com with ESMTPSA id
 s9-20020a1709066c8900b009e5ce1acb01sm546199ejr.103.2023.11.23.01.40.45
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Thu, 23 Nov 2023 01:40:46 -0800 (PST)
From: Heiner Kallweit <hkallweit1@gmail.com>
To: Wolfram Sang <wsa@kernel.org>,
	Dave Airlie <airlied@redhat.com>
Subject: [PATCH v5 02/20] drivers/gpu/drm/mgag200/mgag200_i2c.c: remove
 I2C_CLASS_DDC support
Date: Thu, 23 Nov 2023 10:40:22 +0100
Message-ID: <20231123094040.592-3-hkallweit1@gmail.com>
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

