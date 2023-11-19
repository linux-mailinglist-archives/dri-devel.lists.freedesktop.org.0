Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id D6C517F0525
	for <lists+dri-devel@lfdr.de>; Sun, 19 Nov 2023 11:15:10 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 70C9810E1A4;
	Sun, 19 Nov 2023 10:14:58 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-ej1-x629.google.com (mail-ej1-x629.google.com
 [IPv6:2a00:1450:4864:20::629])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 0ABE910E19D
 for <dri-devel@lists.freedesktop.org>; Sun, 19 Nov 2023 10:14:55 +0000 (UTC)
Received: by mail-ej1-x629.google.com with SMTP id
 a640c23a62f3a-9e62ab773f1so474983366b.0
 for <dri-devel@lists.freedesktop.org>; Sun, 19 Nov 2023 02:14:54 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20230601; t=1700388893; x=1700993693; darn=lists.freedesktop.org;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:from:to:cc:subject:date
 :message-id:reply-to;
 bh=UFS8KKprIzFM0zE+Ai6M4ORed6sy7M8DbezDgWX5KRQ=;
 b=AJcB7RALb3yAPj3MXGZgcKhWuX8ABWBlLnpYY/r6n+ZxeVcTYaUhG/U6xOChKYkuss
 4OGdBdwAveqCG6hHF4WzOuUOOMC1V/xZPeNPXpSrcLPEUjqovwYeFqe7uhoF1o7okl5i
 QJT2XqfNlruIeRbNvq/SJ/MN1VzrJaie+RBrDlAegzCQ108COi1VCGRz1N639YoR6vCT
 BazI8XGfpvdc6IyAj+1KF9sTS8XPBHZksKHCiGIMcEI+OaYPFCSoFAUMk0JHgFLscHEt
 Pn8WSDK9hUvYB+YmRZP5Md2d/8gPIhjgUbhyKgya+JXZdawkIbxv0eNSc59UXsZSUcsU
 HQaw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1700388893; x=1700993693;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=UFS8KKprIzFM0zE+Ai6M4ORed6sy7M8DbezDgWX5KRQ=;
 b=Uw6e3b/hLzn5/av68ZN07w3RqXJnQwwehDt3gJT4BoU3xG6bST+DJ9lKlr9Jnm8a81
 GPonCsMpjwDcFNi6xeJMa+6fgR9f4durdwlXvoSea/8ZR+rtSsv6Ze1zd7+k958wYYAh
 P1Q7jPNEjQq4Ny+00jKXbU2rrt4YbXXwA9+ktskcPIXxDCfKMIsrvcNrAA+Fz2TdQkj9
 Sj4bvm/IBut33QrnWVHnxLerMElZQHkQ4+qzMaG9XlnhGDI2iC1XguQYFPdNPi9iTXPU
 c6UjPSuMpkSzgA4Utx1MxJ3ElJv4O8X9Qyi1LEXwchDhoIuNpf+/zXLL2EZ9O2gNR4Qi
 BD1g==
X-Gm-Message-State: AOJu0YwcwxwSb28hBycwtsU6LPfTLyuwe65gtaC8YupKmC5dLCw5L0HZ
 /QkoMhZ7aFf8CQ6jqoj0BVc=
X-Google-Smtp-Source: AGHT+IFcb1Rra71IEq6JfJPC58ag489QhCbPNIPTSnf82g6F4cllHuVlGQs/WMup357oql3Lum0POQ==
X-Received: by 2002:a17:906:158:b0:9fd:a833:996e with SMTP id
 24-20020a170906015800b009fda833996emr416969ejh.77.1700388893152; 
 Sun, 19 Nov 2023 02:14:53 -0800 (PST)
Received: from zotac.lan.
 (dynamic-2a01-0c23-bde4-3e00-2223-08ff-fe18-0310.c23.pool.telefonica.de.
 [2a01:c23:bde4:3e00:2223:8ff:fe18:310])
 by smtp.gmail.com with ESMTPSA id
 p20-20020a17090628d400b009928b4e3b9fsm2743581ejd.114.2023.11.19.02.14.52
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Sun, 19 Nov 2023 02:14:52 -0800 (PST)
From: Heiner Kallweit <hkallweit1@gmail.com>
To: Wolfram Sang <wsa@kernel.org>,
	Maxime Ripard <mripard@kernel.org>
Subject: [PATCH v3 04/20] drivers/gpu/drm/sun4i/sun4i_hdmi_i2c.c: remove
 I2C_CLASS_DDC support
Date: Sun, 19 Nov 2023 11:14:29 +0100
Message-ID: <20231119101445.4737-5-hkallweit1@gmail.com>
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

