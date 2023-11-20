Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 4CC6D7F1FB0
	for <lists+dri-devel@lfdr.de>; Mon, 20 Nov 2023 22:47:58 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id D6A9110E1FC;
	Mon, 20 Nov 2023 21:47:50 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-wr1-x430.google.com (mail-wr1-x430.google.com
 [IPv6:2a00:1450:4864:20::430])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 969B810E1EE
 for <dri-devel@lists.freedesktop.org>; Mon, 20 Nov 2023 21:46:39 +0000 (UTC)
Received: by mail-wr1-x430.google.com with SMTP id
 ffacd0b85a97d-32d9effe314so3483845f8f.3
 for <dri-devel@lists.freedesktop.org>; Mon, 20 Nov 2023 13:46:39 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20230601; t=1700516798; x=1701121598; darn=lists.freedesktop.org;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:from:to:cc:subject:date
 :message-id:reply-to;
 bh=MYIXvkWgZP3jTqRawAZ0bvfdTUgjzQkomxaiR6ITIUY=;
 b=J4B7dyBFtBmUMg2SwGCewhTR8H1oqwFa6tMqoGjJtovYExgAkztMcfCdArDklFRgh3
 3hUDgcFGRmIgMkMEOawtvxpsLEg6W+kQLHAS1TzcBScZp2RiJBKO7dT0xp542XAZoNkG
 TFEzBMywRLND/mk7MFQo3XlXk842N/M4rRN9kHnY/VgydNwItMr06PCm8fRUuQyFq6ty
 xKHvXxrf+soJnFbrPdUNYKOmWAujgPmECMnhZGze91qgvEqgsbtB+n15cFBlv3zK2Xtk
 QAyT7QRn+Wkyv3s97HBGo4M8U/q/pXnD4pWvc1MSTqvs83QDgj7r1At8L3nCGw+FTbqw
 6gbg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1700516798; x=1701121598;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=MYIXvkWgZP3jTqRawAZ0bvfdTUgjzQkomxaiR6ITIUY=;
 b=hnOEKS8127E7FC1TiJjfDPDE2ypOXTbwM3XQT4RMferDZW+UW5vfyppeWo7lIvBj4y
 +XZFLWjMsyHYvunKHLKho78jk8L2a7v9bc8qU5pANJOg5f4ZJDKUA/vDy4d34iooiDyG
 s+pnsS88eON6oVaALwZICv4Bnf6O3ILhPbZS5woh2nfnNEtPjJgdhZMmFVtbjrZ5cS/R
 IWNmf8GRRoX28zxr0MZvfccMe9q8DTDWrBMU5ucEnWlu6NKNy7v7z0SDpsMJpuskjczT
 2pOoOsVCoq9dK6TMbxGG9rnSM/cBri92O6nxC0YjVfPmJVU5q7Fg3J66g1zIasOdUakD
 37+w==
X-Gm-Message-State: AOJu0YwtkDXya2h3W7ZfYhnHNvdSKOt808ZzRZI8x2OtuXkYEicz4PEA
 lR9YYR/5BW2OgwP43Xlx8zA=
X-Google-Smtp-Source: AGHT+IFKwgcCGvl+3GjRXi3JOaMzRX6/rxJnUMyqVb00sOOqmTwTqVycHrl5HKcsMJsrsDJpaUNpzw==
X-Received: by 2002:a5d:574e:0:b0:32f:810e:8a3f with SMTP id
 q14-20020a5d574e000000b0032f810e8a3fmr5245352wrw.14.1700516797921; 
 Mon, 20 Nov 2023 13:46:37 -0800 (PST)
Received: from zotac.lan.
 (dynamic-2a02-3100-9030-5a00-2223-08ff-fe18-0310.310.pool.telefonica.de.
 [2a02:3100:9030:5a00:2223:8ff:fe18:310])
 by smtp.gmail.com with ESMTPSA id
 i13-20020a5d584d000000b00332cb0937f4sm2667052wrf.33.2023.11.20.13.46.37
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Mon, 20 Nov 2023 13:46:37 -0800 (PST)
From: Heiner Kallweit <hkallweit1@gmail.com>
To: Wolfram Sang <wsa@kernel.org>,
	Andrzej Hajda <andrzej.hajda@intel.com>
Subject: [PATCH v4 11/20] drivers/gpu/drm/bridge/synopsys/dw-hdmi.c: remove
 I2C_CLASS_DDC support
Date: Mon, 20 Nov 2023 22:46:14 +0100
Message-ID: <20231120214624.9378-12-hkallweit1@gmail.com>
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
Cc: Maxime Ripard <mripard@kernel.org>,
 Neil Armstrong <neil.armstrong@linaro.org>, Robert Foss <rfoss@kernel.org>,
 Jonas Karlman <jonas@kwiboo.se>, dri-devel@lists.freedesktop.org,
 linux-kernel@vger.kernel.org, Jernej Skrabec <jernej.skrabec@gmail.com>,
 linux-i2c@vger.kernel.org, Thomas Zimmermann <tzimmermann@suse.de>,
 Heiner Kallweit <hkallweit1@gmail.com>,
 Laurent Pinchart <Laurent.pinchart@ideasonboard.com>
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

After removal of the legacy EEPROM driver and I2C_CLASS_DDC support in
olpc_dcon there's no i2c client driver left supporting I2C_CLASS_DDC.
Class-based device auto-detection is a legacy mechanism and shouldn't
be used in new code. So we can remove this class completely now.

Preferably this series should be applied via the i2c tree.

Reviewed-by: Neil Armstrong <neil.armstrong@linaro.org>
Signed-off-by: Heiner Kallweit <hkallweit1@gmail.com>

---
 drivers/gpu/drm/bridge/synopsys/dw-hdmi.c |    1 -
 1 file changed, 1 deletion(-)

diff --git a/drivers/gpu/drm/bridge/synopsys/dw-hdmi.c b/drivers/gpu/drm/bridge/synopsys/dw-hdmi.c
index 52d91a0df..aca5bb086 100644
--- a/drivers/gpu/drm/bridge/synopsys/dw-hdmi.c
+++ b/drivers/gpu/drm/bridge/synopsys/dw-hdmi.c
@@ -515,7 +515,6 @@ static struct i2c_adapter *dw_hdmi_i2c_adapter(struct dw_hdmi *hdmi)
 	init_completion(&i2c->cmp);
 
 	adap = &i2c->adap;
-	adap->class = I2C_CLASS_DDC;
 	adap->owner = THIS_MODULE;
 	adap->dev.parent = hdmi->dev;
 	adap->algo = &dw_hdmi_algorithm;

