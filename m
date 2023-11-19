Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 46F9D7F05CB
	for <lists+dri-devel@lfdr.de>; Sun, 19 Nov 2023 12:28:59 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id E677410E1E0;
	Sun, 19 Nov 2023 11:28:43 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-ej1-x62c.google.com (mail-ej1-x62c.google.com
 [IPv6:2a00:1450:4864:20::62c])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 3C72E10E1D1
 for <dri-devel@lists.freedesktop.org>; Sun, 19 Nov 2023 11:28:38 +0000 (UTC)
Received: by mail-ej1-x62c.google.com with SMTP id
 a640c23a62f3a-9bf86b77a2aso469973066b.0
 for <dri-devel@lists.freedesktop.org>; Sun, 19 Nov 2023 03:28:38 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20230601; t=1700393316; x=1700998116; darn=lists.freedesktop.org;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:from:to:cc:subject:date
 :message-id:reply-to;
 bh=suS4LCfsusePiDPKTqW40E2H77s8OXx5HVyNs+o+yDE=;
 b=QqtvF9y+7YCM94Ee2gys1QLUz6hsaGCkqYApO80dQ5K1P3FzQ9FLgVL4qDTohQasM7
 fi1ocZa8Sv2GW35E75HFWlVWY/qHOsMehvZqScr/XW6CxweH5tc2XsU3k8W6ziov8sx2
 LAa7TOG/jnGsl/RiInHXZmRZnyezysZqH1tke8sc3dDeJ/WpvSV+qJfBPVh9SuvS+aBW
 +dkc69F81cpr4Uf7jSanVsjLJjWwKPfM3YrUbFbw2y5AVAeaSKD4lBXhVvL+qCglbEiO
 D+LuKJEuKYrMwrd6tifdLOksNagvXm6BS8m6ajRrdUBl7SmwJQuag8y0vLljdCTHkMxJ
 lSyQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1700393316; x=1700998116;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=suS4LCfsusePiDPKTqW40E2H77s8OXx5HVyNs+o+yDE=;
 b=IHMWp7S/rihi6BVD0+22AJ8hyxSFSLoG+tKu1IKQhJG/2PuWAhJXSWk+UXbkCXepU2
 kUxOm1mJ61aYTm8QhXQgL4j8Trw7bFD7kRXZm+ogHev2FJNDbVrQRwbvxPWOShEgnV+s
 ai4XUiuepj5YfnTH/CvJxDBxarafKze1upm9KRyUXuTH9KQoNxPgQJ5o7z6q3S21kRy/
 1Yw+laN0naNkwVLODe3dmWKw7gZwJ/eyCxpCZpINmAJ8OZOFM/HS2HeuWJLhWHffwLOb
 KTR9UeDAWTUa/GSzICrijcwyKJ/OKFmTklD1xQiEi0DA8m9JpPBtqF05lDd7pA+ZOpZf
 +CHg==
X-Gm-Message-State: AOJu0YxEoC9x5CAV7b95nruE4ZtsW9mbKhVSiSFjt9x2tR8pb9OIEZz/
 FQUWzR2r13+VMwTXYQ480Ws=
X-Google-Smtp-Source: AGHT+IFAzJyXCJEw3gxpP4VAZc4O/kxe4jDCoc7MCgJsBx9nZyrHJVYwUkbM5vIdYXckmNcBLAEJ4A==
X-Received: by 2002:a17:906:51c5:b0:9e7:2d0b:8c41 with SMTP id
 v5-20020a17090651c500b009e72d0b8c41mr3246047ejk.0.1700393316640; 
 Sun, 19 Nov 2023 03:28:36 -0800 (PST)
Received: from zotac.lan.
 (dynamic-2a01-0c23-bde4-3e00-2223-08ff-fe18-0310.c23.pool.telefonica.de.
 [2a01:c23:bde4:3e00:2223:8ff:fe18:310])
 by smtp.gmail.com with ESMTPSA id
 k22-20020a1709063fd600b009f8af454d0dsm2420378ejj.112.2023.11.19.03.28.35
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Sun, 19 Nov 2023 03:28:36 -0800 (PST)
From: Heiner Kallweit <hkallweit1@gmail.com>
To: Wolfram Sang <wsa@kernel.org>,
	Sui Jingfeng <suijingfeng@loongson.cn>
Subject: [PATCH v3 08/20] drivers/gpu/drm/loongson/lsdc_i2c.c: remove
 I2C_CLASS_DDC support
Date: Sun, 19 Nov 2023 12:28:13 +0100
Message-ID: <20231119112826.5115-9-hkallweit1@gmail.com>
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
 

