Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 104837F0169
	for <lists+dri-devel@lfdr.de>; Sat, 18 Nov 2023 18:42:45 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id DCF4C88FAE;
	Sat, 18 Nov 2023 17:42:35 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-wm1-x329.google.com (mail-wm1-x329.google.com
 [IPv6:2a00:1450:4864:20::329])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 94C4010E177
 for <dri-devel@lists.freedesktop.org>; Sat, 18 Nov 2023 17:42:31 +0000 (UTC)
Received: by mail-wm1-x329.google.com with SMTP id
 5b1f17b1804b1-40859dee28cso5420915e9.0
 for <dri-devel@lists.freedesktop.org>; Sat, 18 Nov 2023 09:42:31 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20230601; t=1700329350; x=1700934150; darn=lists.freedesktop.org;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:from:to:cc:subject:date
 :message-id:reply-to;
 bh=2A7KgJeMP1lI74vlMRztf0ZeAIQKlR0j/L1YwdkkguA=;
 b=nXTyofjICM1m2IKAfL++M2bi4IvcRxRwfuOP/N9LCZvy+uF/IV7HG72UITCkTmKamf
 KncM0+0xUpa2QCXslPst/ogxD4/qdFeoSo/qE1OwUZdSVL/8CGB40qDVJEIUMRcwMV5t
 6fCi88JEfJYiQzltApUlFUMT5NUVZfVX59mgLUCP2UWEg5H1oV0WV42jkBa6poB+2wII
 36kiwCMcGklrmfc09RtGyt+9eX+iOmwEwD7N8uSQqu3wD2DU7XXRGTv9kHaN6/lIXtB1
 8AMzQ+R1+U/c45/nrHef3v3ytPrmqrDeqpanhAyA/Y5ox0Ki+ynmDhUZ/Ms2T53rmgmK
 FgNQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1700329350; x=1700934150;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=2A7KgJeMP1lI74vlMRztf0ZeAIQKlR0j/L1YwdkkguA=;
 b=Qc3TNcLgWAzKkrz8tONlJE+3sUYVAW3ZMGCYhtr9Yz8cV1kmv9ZmrTscrtDH74CMsG
 NX/9Ny5Er0LHRe5xKMuQ07l7Vs+1ZcPpFAEiA+ffRyz8FdpZjdB2Z+kn3DJ4V0bAWMVe
 5jbf8ZeV37TlKw1eKIRp58mdtftnMoXXtdcCDg9f3zXx0hVfaW5492OBzxYYPfu8EtXJ
 OZsMdwZavq1JEgjIBFz9XyCOnVP2N2ZBBkqv0ZoaBOlX92SvZS/Uzc4yqfjTDde2wBda
 VjC2T/qCw0XvQOxQ6bS1+hqN0/tbpviUrGqMShOAKUFV6cDiXMlq82J9TZiWZrxYcnQf
 OAvw==
X-Gm-Message-State: AOJu0YwMEPn/FtP5mdPBPJ1Ww7TYqTOEA1nnqpQOGG6/Lxp+LhcT/iJi
 eGc1QQf7u+Qc0FYIjLPcezs=
X-Google-Smtp-Source: AGHT+IFhcmh+HF8fxApZE0ppjzudwwON5aQtR0W323i40dvMUD5YGJYLj4L/jEO65VvDn1fpwc/WhA==
X-Received: by 2002:a7b:cd97:0:b0:408:3b8d:f7e8 with SMTP id
 y23-20020a7bcd97000000b004083b8df7e8mr2221493wmj.33.1700329349862; 
 Sat, 18 Nov 2023 09:42:29 -0800 (PST)
Received: from zotac.lan.
 (dynamic-2a01-0c22-77bf-8300-2223-08ff-fe18-0310.c22.pool.telefonica.de.
 [2a01:c22:77bf:8300:2223:8ff:fe18:310])
 by smtp.gmail.com with ESMTPSA id
 y10-20020a05600c340a00b004068de50c64sm6964211wmp.46.2023.11.18.09.42.29
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Sat, 18 Nov 2023 09:42:29 -0800 (PST)
From: Heiner Kallweit <hkallweit1@gmail.com>
To: Wolfram Sang <wsa@kernel.org>,
	Maxime Ripard <mripard@kernel.org>
Subject: [PATCH v2 04/20] drivers/gpu/drm/sun4i/sun4i_hdmi_i2c.c: remove
 I2C_CLASS_DDC support
Date: Sat, 18 Nov 2023 18:42:04 +0100
Message-ID: <20231118174221.851-5-hkallweit1@gmail.com>
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

