Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id CB2E47E9AF9
	for <lists+dri-devel@lfdr.de>; Mon, 13 Nov 2023 12:24:25 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 4AE4210E351;
	Mon, 13 Nov 2023 11:24:13 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-lj1-x22d.google.com (mail-lj1-x22d.google.com
 [IPv6:2a00:1450:4864:20::22d])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 50E5E10E08A
 for <dri-devel@lists.freedesktop.org>; Mon, 13 Nov 2023 11:24:10 +0000 (UTC)
Received: by mail-lj1-x22d.google.com with SMTP id
 38308e7fff4ca-2c50ec238aeso60841101fa.0
 for <dri-devel@lists.freedesktop.org>; Mon, 13 Nov 2023 03:24:10 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20230601; t=1699874648; x=1700479448; darn=lists.freedesktop.org;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:from:to:cc:subject:date
 :message-id:reply-to;
 bh=suS4LCfsusePiDPKTqW40E2H77s8OXx5HVyNs+o+yDE=;
 b=AZTkHQI/9GVzspULMGH/sFy6qgU9BkA8amksFpvzMzY2yYHUyfA0jtlm8AZwcqp7yX
 Rdjn8Gi0QKvzc1pDXgymkRzfmrgvZWfAEHNtggrlkcxrggK8wfYW6Xk/Hncd2rU8Xr9b
 HU/ADk+o9JvUV2EZs3VhzORTYLKtw8nx6wY0ufbVn4qSYTkQh+PKZZj7994zwPaB0Ko7
 p9xWZh7YC5oz1EuqWtjYa7ZCsDLCswAeKrmpVTrjQaiG9EZyado0TK6t0p2EGuDnn7/X
 +XHMiAf1sLHVBs78nLeundcN+f13AEVdT6xU4TxQsmMPtwfsiE7g3RGtzGu5NkXEsbiy
 Vw8g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1699874648; x=1700479448;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=suS4LCfsusePiDPKTqW40E2H77s8OXx5HVyNs+o+yDE=;
 b=JQ+yhywzF8evtoy6v4wA+4T87LE+x2XtTEjGk9k8xS0gM5m4ez0Y40v4/MK1Ht7lFD
 ZAsIgsBQU2RYnhbwiC02bu32B9ZgUm63HiHLOSpELClJkxYhe33RAX6e95r9P+aBa70k
 yUkH/yM+F9fuAg3pE/ArlmNUZkRJx0y08LObE8YOcSBXlfzTN9o3zEv542E6BA62nqC2
 oy3isPMTFi9a1l98YWYG8Om24Sgyh/vt3mX8zc/yRl/q+SHN7IPLyvCLSh55zkogYWvC
 SFrA9tvOTcQrmE9DbdR+mlR29W8n4FR79DLmijC2sCpEsqcBRC7uzZZevDldqtloXSKm
 d+Ew==
X-Gm-Message-State: AOJu0Yx08qgaUX34gsPnIS/gTmxEwS0kpWyMCBep8XzZ3Sq1GSUJ4+7+
 BKoQ2pYUc5s8fE9WBPBFU38=
X-Google-Smtp-Source: AGHT+IF2LC+FtafvR61kuDtbo2rv3av6bi24h2BSF0FTWH3WvMa6H2hTWbFG6Bmtzn7VrYm9qOaXwA==
X-Received: by 2002:a2e:f0a:0:b0:2c6:f17d:ae84 with SMTP id
 10-20020a2e0f0a000000b002c6f17dae84mr4752809ljp.3.1699874648370; 
 Mon, 13 Nov 2023 03:24:08 -0800 (PST)
Received: from zotac.lan.
 (dynamic-2a01-0c22-6e16-fe00-2223-08ff-fe18-0310.c22.pool.telefonica.de.
 [2a01:c22:6e16:fe00:2223:8ff:fe18:310])
 by smtp.gmail.com with ESMTPSA id
 l19-20020a05600c4f1300b0040772138bb7sm13565787wmq.2.2023.11.13.03.24.07
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Mon, 13 Nov 2023 03:24:08 -0800 (PST)
From: Heiner Kallweit <hkallweit1@gmail.com>
To: Wolfram Sang <wsa@kernel.org>,
	Sui Jingfeng <suijingfeng@loongson.cn>
Subject: [PATCH 08/20] drivers/gpu/drm/loongson/lsdc_i2c.c: remove
 I2C_CLASS_DDC support
Date: Mon, 13 Nov 2023 12:23:32 +0100
Message-ID: <20231113112344.719-9-hkallweit1@gmail.com>
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
 

