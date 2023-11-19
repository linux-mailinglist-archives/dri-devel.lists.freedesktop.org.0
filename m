Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 1CC467F053B
	for <lists+dri-devel@lfdr.de>; Sun, 19 Nov 2023 11:15:21 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 4931910E1AF;
	Sun, 19 Nov 2023 10:15:00 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-ej1-x636.google.com (mail-ej1-x636.google.com
 [IPv6:2a00:1450:4864:20::636])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 06E0410E19D
 for <dri-devel@lists.freedesktop.org>; Sun, 19 Nov 2023 10:14:58 +0000 (UTC)
Received: by mail-ej1-x636.google.com with SMTP id
 a640c23a62f3a-991c786369cso474449566b.1
 for <dri-devel@lists.freedesktop.org>; Sun, 19 Nov 2023 02:14:57 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20230601; t=1700388896; x=1700993696; darn=lists.freedesktop.org;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:from:to:cc:subject:date
 :message-id:reply-to;
 bh=suS4LCfsusePiDPKTqW40E2H77s8OXx5HVyNs+o+yDE=;
 b=R8Nfkg0RQoEAuxIgP8zOZqmnsL8sHY5vtVdnS/T2j/fn2o2RADKbO4ZvTpXh9v4Kb+
 /M0Nnx3kG5+zlAtCU66kbl5Vg+hU1f3C7+HEUW6jN6J2KgQBWDErd5zSk5Rt46rxNTnx
 VRsL+BCpglezfnPy/tIkfIVE1VsRsbbbApw8F8zDCj0bwy5WTYiKV25JnwoRuZmNFy6l
 Elq5GiPE7flV2Z6rWsszTijhcfhXrXdrFXTqUee2d078VSqOAhnANO7Y9Up6QcjNsnuL
 y12WUuaNX9K19bnH1CMKL2zOolyVMeP3+tOHRfmkmMCPOFBMqMuslStRM75lGTLxhSJV
 +t1A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1700388896; x=1700993696;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=suS4LCfsusePiDPKTqW40E2H77s8OXx5HVyNs+o+yDE=;
 b=Q3lEbQ9wdYAhYx3WTRELhjWlJI1eswLgOztxWhnyyl7lNPZun8nS80Mi1aEds8wYmq
 IfD7f9OWE/3PJxUtoIMhBI752UYxGL2VfgoSABgqe4qWmejaqiFEUnKX8DBG+5Uga89u
 zM30iWCbEM2GC3F0JwX8WZetJt2mycWAn5dx30ung8L3NSt1f7lvLDKS1cbFhD5H2Usf
 DY5GRmue9wJuj1s100EdxtIs4uKqxWK2pWJ+mcKR9mVKBQwpiseaRv9+IV4EYWW8yd/K
 RZh54XGCrV7qhS5J/5UwnSkuttiJ9rLe8Y7Nuysfoss6pRbGK7imMhdn/Q+uIKm0L2wR
 lNHA==
X-Gm-Message-State: AOJu0YyPSz7Uwx43QWxZl/9XR6MIgY0WhkZBKB+5K1GuRopusOYTl3V4
 MHtI0/3zHIrqlcM6DzLtl4U=
X-Google-Smtp-Source: AGHT+IGNzCPy8DY6OUpPEzcikwvV3TQNAAHEQOERuY2DqLuCmbBKa7aBRaSFRQKH6eGa/KeJALv/Hg==
X-Received: by 2002:a17:906:8f:b0:9c7:5db4:c943 with SMTP id
 15-20020a170906008f00b009c75db4c943mr3606445ejc.40.1700388896314; 
 Sun, 19 Nov 2023 02:14:56 -0800 (PST)
Received: from zotac.lan.
 (dynamic-2a01-0c23-bde4-3e00-2223-08ff-fe18-0310.c23.pool.telefonica.de.
 [2a01:c23:bde4:3e00:2223:8ff:fe18:310])
 by smtp.gmail.com with ESMTPSA id
 p20-20020a17090628d400b009928b4e3b9fsm2743581ejd.114.2023.11.19.02.14.55
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Sun, 19 Nov 2023 02:14:55 -0800 (PST)
From: Heiner Kallweit <hkallweit1@gmail.com>
To: Wolfram Sang <wsa@kernel.org>,
	Sui Jingfeng <suijingfeng@loongson.cn>
Subject: [PATCH v3 08/20] drivers/gpu/drm/loongson/lsdc_i2c.c: remove
 I2C_CLASS_DDC support
Date: Sun, 19 Nov 2023 11:14:33 +0100
Message-ID: <20231119101445.4737-9-hkallweit1@gmail.com>
X-Mailer: git-send-email 2.42.1
In-Reply-To: <20231119101445.4737-1-hkallweit1@gmail.com>
References: <20231119101445.4737-1-hkallweit1@gmail.com>
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
 

