Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 612B07E9AF2
	for <lists+dri-devel@lfdr.de>; Mon, 13 Nov 2023 12:24:22 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id EDF5E10E34A;
	Mon, 13 Nov 2023 11:24:11 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-lj1-x233.google.com (mail-lj1-x233.google.com
 [IPv6:2a00:1450:4864:20::233])
 by gabe.freedesktop.org (Postfix) with ESMTPS id A3DC410E08A
 for <dri-devel@lists.freedesktop.org>; Mon, 13 Nov 2023 11:24:06 +0000 (UTC)
Received: by mail-lj1-x233.google.com with SMTP id
 38308e7fff4ca-2c72e275d96so58624601fa.2
 for <dri-devel@lists.freedesktop.org>; Mon, 13 Nov 2023 03:24:06 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20230601; t=1699874645; x=1700479445; darn=lists.freedesktop.org;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:from:to:cc:subject:date
 :message-id:reply-to;
 bh=2A7KgJeMP1lI74vlMRztf0ZeAIQKlR0j/L1YwdkkguA=;
 b=ZT57/40tYY4WPRIYww7Har/qc4sTUhwHUCJOdfOwJjiyJ8f3mapgSB3S07fRptJrYh
 qlK80nIT9O5D5knEHNPIXIjnqQOvwZa7mE4EIFByCauuC0gFR4x232VotrXUHQAQKWkJ
 qbjRNcyNjrpzDW2Sg222F97XjpYBLdMW5VTR0YVweB8dk4cMINB3JXwxuRJa/5gaO9z9
 X7RBP5DQYOB7Nl1HETFN8zll1ik/Oze4d2+3h+gx52eLQ1LxyJ8tVRIkH2DQ7iDbkhXw
 UniDWuRM/XW9lLdYSwCu4bEf3IJHwmfQMsGTnaeqeKealx3duOcBURMw0YCchyqC47hE
 oOcw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1699874645; x=1700479445;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=2A7KgJeMP1lI74vlMRztf0ZeAIQKlR0j/L1YwdkkguA=;
 b=S7eOSA5hj1CxS5OL6LlH3MDnmh1rupBdInTEjIFtkxXLyhZ4vWNBvACd7AqWne9/pP
 otswrf/u5y6UKg9xDTs4Q6BpijJEf/0YbcGl8NflzPVCyYgZqr1diiko5BK/C9VX62z/
 ckV/UagvBkVFIQIXy3z2koAfaLq/EUk6lMn/ClBHQr5cgQ6KUhwj867prCpcfRyUmAlF
 agb8gIs/LdBxIwzgnpXLPwvteOSsFePP4rnKft/CbmTp5lghvo1BQl6/Zb3Ll/qMq3Tj
 +r5Wavz9ShqT7sVzPS05crNOWwS1eqJ/r6woIxkgtosmp9Hj21RZIfMkzGlHCrpFafJ3
 M5yg==
X-Gm-Message-State: AOJu0YxdxTZU34GfxjUJG8tPDUXymzuiymvLWlU25gf/4l4CtPyyH+GK
 NpXcwqjioPOSaEboQdcebRM=
X-Google-Smtp-Source: AGHT+IE/vWt8sIluAJGbzp4DA3YgSD9QnVjHE9gZQVa6sNYXW8a/yNVaWFtAUhPLeeYxcoE+kXqeow==
X-Received: by 2002:a2e:8954:0:b0:2c7:7b65:60b5 with SMTP id
 b20-20020a2e8954000000b002c77b6560b5mr5041996ljk.30.1699874644560; 
 Mon, 13 Nov 2023 03:24:04 -0800 (PST)
Received: from zotac.lan.
 (dynamic-2a01-0c22-6e16-fe00-2223-08ff-fe18-0310.c22.pool.telefonica.de.
 [2a01:c22:6e16:fe00:2223:8ff:fe18:310])
 by smtp.gmail.com with ESMTPSA id
 l19-20020a05600c4f1300b0040772138bb7sm13565787wmq.2.2023.11.13.03.24.03
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Mon, 13 Nov 2023 03:24:04 -0800 (PST)
From: Heiner Kallweit <hkallweit1@gmail.com>
To: Wolfram Sang <wsa@kernel.org>,
	Maxime Ripard <mripard@kernel.org>
Subject: [PATCH 04/20] drivers/gpu/drm/sun4i/sun4i_hdmi_i2c.c: remove
 I2C_CLASS_DDC support
Date: Mon, 13 Nov 2023 12:23:28 +0100
Message-ID: <20231113112344.719-5-hkallweit1@gmail.com>
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

