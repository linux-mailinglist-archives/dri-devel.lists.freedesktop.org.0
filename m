Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 36CD67F0184
	for <lists+dri-devel@lfdr.de>; Sat, 18 Nov 2023 18:42:59 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 66FFE10E33C;
	Sat, 18 Nov 2023 17:42:38 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-wm1-x32f.google.com (mail-wm1-x32f.google.com
 [IPv6:2a00:1450:4864:20::32f])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 71502891D7
 for <dri-devel@lists.freedesktop.org>; Sat, 18 Nov 2023 17:42:35 +0000 (UTC)
Received: by mail-wm1-x32f.google.com with SMTP id
 5b1f17b1804b1-4083cd3917eso4655335e9.3
 for <dri-devel@lists.freedesktop.org>; Sat, 18 Nov 2023 09:42:35 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20230601; t=1700329354; x=1700934154; darn=lists.freedesktop.org;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:from:to:cc:subject:date
 :message-id:reply-to;
 bh=suS4LCfsusePiDPKTqW40E2H77s8OXx5HVyNs+o+yDE=;
 b=cOoCLqZ+jV6FySxU2yYDOm9nAyytoMZoJaGO4MzJ9WU+1TqyjkjsUxRoQI5HdmYU+v
 0qIK3C0/B7K1ATWHqs2PvvHr6DGgbLeA9EOiSTLwDK2EGb2MwOc3nZle9BJlUBsV4BVA
 hc9d/d7FbkvGNVJGput1MlZPCU6up+DBxW18ka1KYC9YkmFGhUefhqseJk0PzfHQbDwn
 R61JBgyLUVHqQJm89zo9wOVQ7WYDoMxliBd1FeSwvOB+FHEwgeQH4VABnxTuefcPxsIr
 spghp1h1zqT1T5IOKvEt6xk1WnX5cE0bRdjzsjclOlM0utEMiO7i9ccQgemNQY3hC32a
 QReQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1700329354; x=1700934154;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=suS4LCfsusePiDPKTqW40E2H77s8OXx5HVyNs+o+yDE=;
 b=U0lASHkCZczkto6P7SKzZ/MtKYVqrC2/jo43uD4l6PntL2XKB+uXtASGZayUjwNI93
 y1WvPqqxGaKreBRFJ24nWSeVMgiolsWJcIy2m1LC+8jPIEyCM0P8lpU6EQr98kbC1cUX
 FgxEe2QFkZ0JQ47lxZuV7Iu6x2qglSO4RRzFWK6p30Ms7CfuTrx1ktIvIo0WTyU+ad9Q
 V0aGRiqxd8JWa/xOYNB4TIL1c9JSDZw1zjCni+RcSoLBDuwiz5vS2UyYdthCKVt9MNtf
 0LcrDpz1ADdLlcyoX1EWPUy68pneL4T4s2BZdMyXnXDXn4irpGTrZ9rh4m+GgVxT9D4w
 zjhQ==
X-Gm-Message-State: AOJu0YyxQw93UIByVMrKcC0fGElzPyocE6kBHH7NCTKOSSXS7lbz6J8C
 fjtaZjlXhWR6lmBRTrimoNE=
X-Google-Smtp-Source: AGHT+IHFeQem3GC7lyXfhuux3W0nXFchU62Mp5yU1I3tjQqqacuqysAcTGeFS+2WghbyMr4dvj9rxw==
X-Received: by 2002:a05:600c:4712:b0:405:348e:aa43 with SMTP id
 v18-20020a05600c471200b00405348eaa43mr2139830wmo.12.1700329353750; 
 Sat, 18 Nov 2023 09:42:33 -0800 (PST)
Received: from zotac.lan.
 (dynamic-2a01-0c22-77bf-8300-2223-08ff-fe18-0310.c22.pool.telefonica.de.
 [2a01:c22:77bf:8300:2223:8ff:fe18:310])
 by smtp.gmail.com with ESMTPSA id
 y10-20020a05600c340a00b004068de50c64sm6964211wmp.46.2023.11.18.09.42.32
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Sat, 18 Nov 2023 09:42:33 -0800 (PST)
From: Heiner Kallweit <hkallweit1@gmail.com>
To: Wolfram Sang <wsa@kernel.org>,
	Sui Jingfeng <suijingfeng@loongson.cn>
Subject: [PATCH v2 08/20] drivers/gpu/drm/loongson/lsdc_i2c.c: remove
 I2C_CLASS_DDC support
Date: Sat, 18 Nov 2023 18:42:08 +0100
Message-ID: <20231118174221.851-9-hkallweit1@gmail.com>
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
 

