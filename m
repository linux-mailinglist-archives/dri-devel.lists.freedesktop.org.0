Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 72BDF7F0190
	for <lists+dri-devel@lfdr.de>; Sat, 18 Nov 2023 18:43:07 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id C9B3410E343;
	Sat, 18 Nov 2023 17:42:43 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-wm1-x335.google.com (mail-wm1-x335.google.com
 [IPv6:2a00:1450:4864:20::335])
 by gabe.freedesktop.org (Postfix) with ESMTPS id C1F2610E33E
 for <dri-devel@lists.freedesktop.org>; Sat, 18 Nov 2023 17:42:38 +0000 (UTC)
Received: by mail-wm1-x335.google.com with SMTP id
 5b1f17b1804b1-40a46ea95f0so5327375e9.2
 for <dri-devel@lists.freedesktop.org>; Sat, 18 Nov 2023 09:42:38 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20230601; t=1700329357; x=1700934157; darn=lists.freedesktop.org;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:from:to:cc:subject:date
 :message-id:reply-to;
 bh=x0UShpfjCPfBIWng5J4/pQaeext1SYGd0ovoJY2VHzk=;
 b=lnqm68TY7T35IHn+waJLriotQRev9L4RPCnOBo9r2BKNf5AyTTJ7+m1R57URResLJ+
 OPOlLjBsnBi27obBM7MtDoONEkLL1Ftv0q3NwvuwCLpa7+wC+a/NCr2lAac+LWNe/RBS
 75TVaQKHvHMA8N9yFtCPZ5G0m653SyVizRhFcsBr2E+sjxSVeWCmQoeCT8k/lV0ei9Mp
 QHA4f6r3EGqYaZovTMgIMp0k9tsFHN7mjYYOVFbP67gfkHLBCnfN41U7k+wV+y3caRfS
 j7MpXl3hmJyIJMf4EvQZ51Y1gy7Vi2+vOji6nmdEjgD/zM+hJMGsgc1QwCteg81+tiFs
 9o0w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1700329357; x=1700934157;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=x0UShpfjCPfBIWng5J4/pQaeext1SYGd0ovoJY2VHzk=;
 b=pi7nVwRi0EzB59fwNteWv7fn3vlL5aHTIuYXGK027Bo9SrMbGRu6eIJTqoc4Vth1Qy
 Pm+aKh7I0R/ar54+J5SXGF4f7kERaRvQ8n2vl6eZ0Gj+RaxMcaYw5NzJTSJv4a9Kpjps
 c743yVoPWAaCbo/nhgZxG6/Noufe00CbGwiGuaj7vSrTPRkf4wYNBOdKAHWlmugeh+zy
 Pn4xJYPeLjR7l/9LjFgaeMsvusI4JGR28xkfXHpb7M/HHBXBpI5TdAWxCoUsnaUPWGxZ
 fe/Xv7LGDArrrtQUVPJfii3pzQMhAfpueHqp2LctfPKEW1LIl7jRmPucKtdObwQQdWiC
 HJOw==
X-Gm-Message-State: AOJu0YwQ0v+AmiLot+iKiCTpJfxGuORlNgXJ4239qjHlBFXO5+M0LFid
 2rWqaoOo+hKVxUtYKQSRCDQ=
X-Google-Smtp-Source: AGHT+IEYtipVOmHkmNUNcpfhd7yRWRn/fCm6xuayGvnoz64EspqjxwBcgwutFlkQhj/M1VwINT6WNw==
X-Received: by 2002:a05:600c:470a:b0:405:4a78:a892 with SMTP id
 v10-20020a05600c470a00b004054a78a892mr1927675wmo.9.1700329356850; 
 Sat, 18 Nov 2023 09:42:36 -0800 (PST)
Received: from zotac.lan.
 (dynamic-2a01-0c22-77bf-8300-2223-08ff-fe18-0310.c22.pool.telefonica.de.
 [2a01:c22:77bf:8300:2223:8ff:fe18:310])
 by smtp.gmail.com with ESMTPSA id
 y10-20020a05600c340a00b004068de50c64sm6964211wmp.46.2023.11.18.09.42.35
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Sat, 18 Nov 2023 09:42:36 -0800 (PST)
From: Heiner Kallweit <hkallweit1@gmail.com>
To: Wolfram Sang <wsa@kernel.org>,
	Andrzej Hajda <andrzej.hajda@intel.com>
Subject: [PATCH v2 11/20] drivers/gpu/drm/bridge/synopsys/dw-hdmi.c: remove
 I2C_CLASS_DDC support
Date: Sat, 18 Nov 2023 18:42:11 +0100
Message-ID: <20231118174221.851-12-hkallweit1@gmail.com>
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

