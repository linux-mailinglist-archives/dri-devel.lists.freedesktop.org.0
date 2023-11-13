Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id E1B007E9B06
	for <lists+dri-devel@lfdr.de>; Mon, 13 Nov 2023 12:24:32 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id B3B7010E349;
	Mon, 13 Nov 2023 11:24:23 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-wm1-x334.google.com (mail-wm1-x334.google.com
 [IPv6:2a00:1450:4864:20::334])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 984C810E34B
 for <dri-devel@lists.freedesktop.org>; Mon, 13 Nov 2023 11:24:12 +0000 (UTC)
Received: by mail-wm1-x334.google.com with SMTP id
 5b1f17b1804b1-4084e49a5e5so37220125e9.3
 for <dri-devel@lists.freedesktop.org>; Mon, 13 Nov 2023 03:24:12 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20230601; t=1699874651; x=1700479451; darn=lists.freedesktop.org;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:from:to:cc:subject:date
 :message-id:reply-to;
 bh=x0UShpfjCPfBIWng5J4/pQaeext1SYGd0ovoJY2VHzk=;
 b=hjUmG32FYoOaOoIEQUKSmext4PDa2aFb2kyQnnxxD1dQU8eIzvnFMNn8LsDips6F91
 DjnP/ugtfVS27WBryXzcFIom1nfLps3Ltcw7M1YoKSAW2V90y/rNl55RfG+6GrBINi4H
 WM7BsbUzr2OHdCOElOAk9pwrGgrL9xVVyDTd8YRzoCEgKkZh0Hx1rLWskJizRn3hx7aH
 FqdUv+HHGQyPx2R2BW7cILwcZoUXIZxAuZMHtbaht6NZYyJ7bSEBgG1RpX2C/z391RkU
 Se6yE949b+jn2rZh6LuOKzYN6E06IdYxm1VsUuBwjM25kSlkyo2ZIwzIPfbb5Qr82k3i
 u00Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1699874651; x=1700479451;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=x0UShpfjCPfBIWng5J4/pQaeext1SYGd0ovoJY2VHzk=;
 b=PcvJtz1Rt/CFTSEG1235MzY5sNsS9/GjRGVNGfuoGMca/C1y4VVm7zNK0OU/SHhw/o
 7SY3QFGcyWP5rUpkCSX2thltYhzXBG6fOLWYM2EJc/i/ho9raPV+M0fd9atHTAokrCCS
 G50M/+ErI8sVUyrczFDWrmXQb4i8lGlKk12ppLw0zcrvF1bUwU+JJSu0XhZzNkwfqKVt
 8i2zANQ9dSBL7AMveEW+9WXukh7aHXxPM6D3HlsGta1282RLVzIQJtx57lTUDoYzbly4
 wokVCY9m+wqiFfAvJa96HL2dhZo8tqVo8zDSs6WU6IATUTf6mcdyxAD96h8tIfgzGEwA
 y5vg==
X-Gm-Message-State: AOJu0YzvpQZ5YdiTEqLg28lwUruIrZuuABw20E1jbEJ9F/Roej//l29c
 fekVrrh3FmOVyaiDDGVq8lo=
X-Google-Smtp-Source: AGHT+IGFHS306bbRiz2f+lNTVzDFOlLgNqhmA6tscwfIyFuanprmk3KxQkw7tNj8GMTBgarDSCdngg==
X-Received: by 2002:a05:600c:21c2:b0:40a:463c:1d8c with SMTP id
 x2-20020a05600c21c200b0040a463c1d8cmr5105398wmj.21.1699874650883; 
 Mon, 13 Nov 2023 03:24:10 -0800 (PST)
Received: from zotac.lan.
 (dynamic-2a01-0c22-6e16-fe00-2223-08ff-fe18-0310.c22.pool.telefonica.de.
 [2a01:c22:6e16:fe00:2223:8ff:fe18:310])
 by smtp.gmail.com with ESMTPSA id
 l19-20020a05600c4f1300b0040772138bb7sm13565787wmq.2.2023.11.13.03.24.10
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Mon, 13 Nov 2023 03:24:10 -0800 (PST)
From: Heiner Kallweit <hkallweit1@gmail.com>
To: Wolfram Sang <wsa@kernel.org>,
	Andrzej Hajda <andrzej.hajda@intel.com>
Subject: [PATCH 11/20] drivers/gpu/drm/bridge/synopsys/dw-hdmi.c: remove
 I2C_CLASS_DDC support
Date: Mon, 13 Nov 2023 12:23:35 +0100
Message-ID: <20231113112344.719-12-hkallweit1@gmail.com>
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

