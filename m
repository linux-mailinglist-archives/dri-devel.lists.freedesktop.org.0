Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id D8B177E9AEC
	for <lists+dri-devel@lfdr.de>; Mon, 13 Nov 2023 12:24:18 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 7450110E346;
	Mon, 13 Nov 2023 11:24:09 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-lj1-x22f.google.com (mail-lj1-x22f.google.com
 [IPv6:2a00:1450:4864:20::22f])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 60F7510E066
 for <dri-devel@lists.freedesktop.org>; Mon, 13 Nov 2023 11:24:04 +0000 (UTC)
Received: by mail-lj1-x22f.google.com with SMTP id
 38308e7fff4ca-2c523ac38fbso55119821fa.0
 for <dri-devel@lists.freedesktop.org>; Mon, 13 Nov 2023 03:24:04 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20230601; t=1699874642; x=1700479442; darn=lists.freedesktop.org;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:from:to:cc:subject:date
 :message-id:reply-to;
 bh=3j9ifWvhNZGTq3IiSm2aJzZT95r7nTZmkK8TlD5sXtw=;
 b=FgcLJWEzrCjXg6tMIZ7OpCsGMvQYn+RvjZ8h+GzJllzyrHkJpzwPwcWVydNqeEQqJB
 IZ2zyJSTLlf4HR70yo6popbx3vawh/gvIjcgGCWToaT1fprIRXxFNQCa8/sgC3rmTaKg
 W8lcUDtZOHdRrD5E9Y5JLrY1+B8pwq4CGnEHILPshUU8iqRpqqwVY5RAAq3eNbaWRmRe
 h+U1YMoE79PCjuadWqyTXFXEGcY1TGkEOiDfKiJqOQa6wTxBNscfWjBhado3pvDf4M2j
 mn2bBrUd9ecRyn25/8jYbdMAeiXerzzu5pjWydokHiBpYK3X2z/rOncLPYnaC6s9/dsl
 VcJA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1699874642; x=1700479442;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=3j9ifWvhNZGTq3IiSm2aJzZT95r7nTZmkK8TlD5sXtw=;
 b=NUc8IAK89PMZ+m2pBLCHgnJ7my0hU11vpf2mj6do4TkvK6BcW7D0AdlIW5u9voDeXC
 bFqrToRrKsUPKNLnCgEt2uxgX1CgxRXWws3U16jRykkfOcj8f/G7Xri7CS54ur/n6ebJ
 vRssSCgrj798pHOnjY/+AcqEdTdFReyaVKF/5E2h901lmgD3Qzc6hreDRPWhyrkhzp2L
 P/wglTCmsM6Zho/b11/ifUfBAIuYPjg8aLPnAMSyqLPyDVVdXQtyLcyd2eQECkXUZDLR
 If8RvPxr/uDgCtiul3XE4x1d4iJpBk6qRLp/stROvJJtUN+4tCgSPV00KURnJgun+zv9
 nqYQ==
X-Gm-Message-State: AOJu0YxBUC9M6Ch+MI5r7qSd5qwOb3p2LXTUszgWyvqwuXYDNR4IQ/0v
 6cRa7zJoMqDhMsZ7mt6dqGE=
X-Google-Smtp-Source: AGHT+IE36bB2OzfEe98E4kghGaMPiIC5IuFFaTAdSXGE7DLScBaoAyzyOno2sf4r1XZ7tYHmWv/iyg==
X-Received: by 2002:a2e:9d95:0:b0:2c6:ee98:de85 with SMTP id
 c21-20020a2e9d95000000b002c6ee98de85mr4239843ljj.23.1699874642417; 
 Mon, 13 Nov 2023 03:24:02 -0800 (PST)
Received: from zotac.lan.
 (dynamic-2a01-0c22-6e16-fe00-2223-08ff-fe18-0310.c22.pool.telefonica.de.
 [2a01:c22:6e16:fe00:2223:8ff:fe18:310])
 by smtp.gmail.com with ESMTPSA id
 l19-20020a05600c4f1300b0040772138bb7sm13565787wmq.2.2023.11.13.03.24.01
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Mon, 13 Nov 2023 03:24:01 -0800 (PST)
From: Heiner Kallweit <hkallweit1@gmail.com>
To: Wolfram Sang <wsa@kernel.org>,
	Dave Airlie <airlied@redhat.com>
Subject: [PATCH 02/20] drivers/gpu/drm/mgag200/mgag200_i2c.c: remove
 I2C_CLASS_DDC support
Date: Mon, 13 Nov 2023 12:23:26 +0100
Message-ID: <20231113112344.719-3-hkallweit1@gmail.com>
X-Mailer: git-send-email 2.42.1
In-Reply-To: <20231113112344.719-1-hkallweit1@gmail.com>
References: <20231113112344.719-1-hkallweit1@gmail.com>
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

