Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 755DA7F5B68
	for <lists+dri-devel@lfdr.de>; Thu, 23 Nov 2023 10:41:27 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id A7A2610E6F3;
	Thu, 23 Nov 2023 09:41:25 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-ed1-x52a.google.com (mail-ed1-x52a.google.com
 [IPv6:2a00:1450:4864:20::52a])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 2ACAB10E6F6
 for <dri-devel@lists.freedesktop.org>; Thu, 23 Nov 2023 09:40:53 +0000 (UTC)
Received: by mail-ed1-x52a.google.com with SMTP id
 4fb4d7f45d1cf-548f0b7ab11so937133a12.1
 for <dri-devel@lists.freedesktop.org>; Thu, 23 Nov 2023 01:40:53 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20230601; t=1700732451; x=1701337251; darn=lists.freedesktop.org;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:from:to:cc:subject:date
 :message-id:reply-to;
 bh=NE3vmdF0wanDhCYGlSWZub+/X2exFV1gowAmEM/g0Pw=;
 b=B3bRZK6xZRT/cRBCNHCAS0aNePvpihgdYzN/GOG7zxHhbus1xzZFQVXIF3j8yrvpTT
 A1p3/9ML9tAcHyZMHGwgw0kEBapfZ/wfmdKJ2F/QP+J7N4atGC0dK9lJXlkOgusudFEy
 OlVdZI7iMBlkXEfrJb2xV8n+of7A3P8rAw8KfLoMKRtDHaa8jx28VrU0qdKpD7taBFVZ
 c78IWNe27GbGLjhG3B6nGyMmn0VNwRbItToW0mSt5bCJQMorC36Loun0vUUqgxYUog5Z
 f0mfNUNCzEzIQL4JzQl0avEH4qVmnhvYXxWRPGNwt6SDoKOMzI6n1v5x3hw37jGYxdKE
 21zw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1700732451; x=1701337251;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=NE3vmdF0wanDhCYGlSWZub+/X2exFV1gowAmEM/g0Pw=;
 b=R6B3/vzpuwewGSL1zCUZl0Y/y9QS8+b0CXwOMXWCg+J48eZbLB8gzh35Crnk/uFd2Q
 HS/+/TyonUgTJ6k6hk9PzQfaGwsU2DVU71wHQEpmsqVFnjfMYmvnW27Xh8/0VTbuqor2
 W2gGktTrdKNDlq/U0NowuRKflCu6ekypql1+vSgjnBTVgIfPD9zR7mj9YcDHSVm3m+wY
 /y5Gea082WgaZqYkO18jlOiILN9LKLRRDkWQpnDGe49Vt7khdCnRFEFHpDcn++qS+dR0
 ue/fgePYBg8hbip4xKoHhbjxPOFln3vPXtW3BLIb/qZRv/439Z50cnmPFGpv/uaPctq8
 XTDg==
X-Gm-Message-State: AOJu0YzPRs2idhDINScfqyE5KTgZQD6Igi2ErsQNo2wgbOg41gBqSKwT
 WgLayT+v1SM7e+e7JPy7J+s=
X-Google-Smtp-Source: AGHT+IEsOmKWsqrRI9wn8tyepMe2HWVZeZdZCX+kXs5QK5xUIlIuKwnFMGVkK2jR0mQNB43pWbZGag==
X-Received: by 2002:a17:907:30d0:b0:9fe:6508:a051 with SMTP id
 vl16-20020a17090730d000b009fe6508a051mr1921733ejb.71.1700732451429; 
 Thu, 23 Nov 2023 01:40:51 -0800 (PST)
Received: from zotac.lan.
 (dynamic-2a01-0c23-c0f2-3200-2223-08ff-fe18-0310.c23.pool.telefonica.de.
 [2a01:c23:c0f2:3200:2223:8ff:fe18:310])
 by smtp.gmail.com with ESMTPSA id
 s9-20020a1709066c8900b009e5ce1acb01sm546199ejr.103.2023.11.23.01.40.50
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Thu, 23 Nov 2023 01:40:51 -0800 (PST)
From: Heiner Kallweit <hkallweit1@gmail.com>
To: Wolfram Sang <wsa@kernel.org>,
	Sui Jingfeng <suijingfeng@loongson.cn>
Subject: [PATCH v5 08/20] drivers/gpu/drm/loongson/lsdc_i2c.c: remove
 I2C_CLASS_DDC support
Date: Thu, 23 Nov 2023 10:40:28 +0100
Message-ID: <20231123094040.592-9-hkallweit1@gmail.com>
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

Acked-by: Thomas Zimmermann <tzimmermann@suse.de>
Signed-off-by: Heiner Kallweit <hkallweit1@gmail.com>

---
 drivers/gpu/drm/loongson/lsdc_i2c.c |    1 -
 1 file changed, 1 deletion(-)

diff --git a/drivers/gpu/drm/loongson/lsdc_i2c.c b/drivers/gpu/drm/loongson/lsdc_i2c.c
index 9625d0b1d..ce90c2553 100644
--- a/drivers/gpu/drm/loongson/lsdc_i2c.c
+++ b/drivers/gpu/drm/loongson/lsdc_i2c.c
@@ -154,7 +154,6 @@ int lsdc_create_i2c_chan(struct drm_device *ddev,
 	adapter = &li2c->adapter;
 	adapter->algo_data = &li2c->bit;
 	adapter->owner = THIS_MODULE;
-	adapter->class = I2C_CLASS_DDC;
 	adapter->dev.parent = ddev->dev;
 	adapter->nr = -1;
 

