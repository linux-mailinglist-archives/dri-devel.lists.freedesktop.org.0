Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 014D77F05C5
	for <lists+dri-devel@lfdr.de>; Sun, 19 Nov 2023 12:28:57 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 6759B10E1DA;
	Sun, 19 Nov 2023 11:28:43 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-ed1-x52b.google.com (mail-ed1-x52b.google.com
 [IPv6:2a00:1450:4864:20::52b])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 170A010E1CF
 for <dri-devel@lists.freedesktop.org>; Sun, 19 Nov 2023 11:28:35 +0000 (UTC)
Received: by mail-ed1-x52b.google.com with SMTP id
 4fb4d7f45d1cf-53d8320f0easo4884548a12.3
 for <dri-devel@lists.freedesktop.org>; Sun, 19 Nov 2023 03:28:35 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20230601; t=1700393313; x=1700998113; darn=lists.freedesktop.org;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:from:to:cc:subject:date
 :message-id:reply-to;
 bh=UFS8KKprIzFM0zE+Ai6M4ORed6sy7M8DbezDgWX5KRQ=;
 b=R0kVnAJBLRxJHS7dFLI1DO0PzNV2sOBs2nCAx2hRiQtGWmEyBgsRP2q7VdWZ0Ot/sr
 dzP/R2+tOxxptuyRIQLghBDmAZsmMbazqGu5rcnQEszOujYMPJW+C+hUjYUOoy72uNla
 SJgs/EOJyMXJc3AqhP8IQp0qK3hP++f1hrfMmHpOAE/MDlHl56uYOfq3gBv9uDSDVEDs
 TjFZM5gnYt5uqZhiF+U3N8ne3AYVZ539w8Tey3tJ0F5mvMPcI/JmC+qCewoKYuopVvDD
 936KVtZKKqLmzBHpHcZQPVedTC5fAQIPHnqUI22WQpRtvlVJtMnOGT1gRu32m0p1U0du
 zaaA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1700393313; x=1700998113;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=UFS8KKprIzFM0zE+Ai6M4ORed6sy7M8DbezDgWX5KRQ=;
 b=g3xTcJujTKd4w0gCctoLja7eSeuWTDDT4NFM1EZPhVw20aPkInjJcjY2rwpY+OiyXj
 Cbw3WRo4WJGwKcxJzusrNY39Vn+HqGocadjUig1JV/qiQyolX7USi5WDlrfbNfRjXVXW
 lPv7ghujSW8ptFC1LLT3OQaGoRD71hfvD7/wJDzenF+pFWWspxa8XKJ7t4cfXoW3gtmI
 NrAWUVLnyOTkkReOMmV+G7lL+BHZbvnMizrnzGVxHNOWgI2817DVIXyMi68Wxr48Wq9y
 QYdxp4vxDGVtaStjETNVIudJY310wA7kZTh8RwHcYED2lw85lJW7rPjrkbohXf9ck3Eu
 y6rA==
X-Gm-Message-State: AOJu0YxZpil62NG+Jbog9uLYwEWlINxa6TOg33cwV9XpJfSklat7rogg
 t1eq4MiN3y1QKdtvjQGrjeiJAoerbGEQ6w==
X-Google-Smtp-Source: AGHT+IGsco/wc6xKX5vo5lzmFcA2w842hBPgh5O17c6HmrxwSBPZRu/jKD563TwiQ42AUE9ZznEjpw==
X-Received: by 2002:a17:907:8b93:b0:9c7:6087:49a7 with SMTP id
 tb19-20020a1709078b9300b009c7608749a7mr3289054ejc.43.1700393313184; 
 Sun, 19 Nov 2023 03:28:33 -0800 (PST)
Received: from zotac.lan.
 (dynamic-2a01-0c23-bde4-3e00-2223-08ff-fe18-0310.c23.pool.telefonica.de.
 [2a01:c23:bde4:3e00:2223:8ff:fe18:310])
 by smtp.gmail.com with ESMTPSA id
 k22-20020a1709063fd600b009f8af454d0dsm2420378ejj.112.2023.11.19.03.28.32
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Sun, 19 Nov 2023 03:28:32 -0800 (PST)
From: Heiner Kallweit <hkallweit1@gmail.com>
To: Wolfram Sang <wsa@kernel.org>,
	Maxime Ripard <mripard@kernel.org>
Subject: [PATCH v3 04/20] drivers/gpu/drm/sun4i/sun4i_hdmi_i2c.c: remove
 I2C_CLASS_DDC support
Date: Sun, 19 Nov 2023 12:28:09 +0100
Message-ID: <20231119112826.5115-5-hkallweit1@gmail.com>
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
Cc: Samuel Holland <samuel@sholland.org>, dri-devel@lists.freedesktop.org,
 linux-kernel@vger.kernel.org, Jernej Skrabec <jernej.skrabec@gmail.com>,
 Chen-Yu Tsai <wens@csie.org>, linux-i2c@vger.kernel.org,
 Thomas Zimmermann <tzimmermann@suse.de>, linux-sunxi@lists.linux.dev,
 linux-arm-kernel@lists.infradead.org, Heiner Kallweit <hkallweit1@gmail.com>
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

After removal of the legacy EEPROM driver and I2C_CLASS_DDC support in
olpc_dcon there's no i2c client driver left supporting I2C_CLASS_DDC.
Class-based device auto-detection is a legacy mechanism and shouldn't
be used in new code. So we can remove this class completely now.

Preferably this series should be applied via the i2c tree.

Acked-by: Jernej Skrabec <jernej.skrabec@gmail.com>
Signed-off-by: Heiner Kallweit <hkallweit1@gmail.com>

---
 drivers/gpu/drm/sun4i/sun4i_hdmi_i2c.c |    1 -
 1 file changed, 1 deletion(-)

diff --git a/drivers/gpu/drm/sun4i/sun4i_hdmi_i2c.c b/drivers/gpu/drm/sun4i/sun4i_hdmi_i2c.c
index d1a65a921..f5f62eb0e 100644
--- a/drivers/gpu/drm/sun4i/sun4i_hdmi_i2c.c
+++ b/drivers/gpu/drm/sun4i/sun4i_hdmi_i2c.c
@@ -302,7 +302,6 @@ int sun4i_hdmi_i2c_create(struct device *dev, struct sun4i_hdmi *hdmi)
 		return -ENOMEM;
 
 	adap->owner = THIS_MODULE;
-	adap->class = I2C_CLASS_DDC;
 	adap->algo = &sun4i_hdmi_i2c_algorithm;
 	strscpy(adap->name, "sun4i_hdmi_i2c adapter", sizeof(adap->name));
 	i2c_set_adapdata(adap, hdmi);

