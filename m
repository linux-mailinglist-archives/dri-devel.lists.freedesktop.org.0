Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id ED6D37F1FAF
	for <lists+dri-devel@lfdr.de>; Mon, 20 Nov 2023 22:47:57 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id A4D9C10E1F9;
	Mon, 20 Nov 2023 21:47:50 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-wr1-x431.google.com (mail-wr1-x431.google.com
 [IPv6:2a00:1450:4864:20::431])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 077B110E1BB
 for <dri-devel@lists.freedesktop.org>; Mon, 20 Nov 2023 21:46:33 +0000 (UTC)
Received: by mail-wr1-x431.google.com with SMTP id
 ffacd0b85a97d-332c0c32d19so1647657f8f.3
 for <dri-devel@lists.freedesktop.org>; Mon, 20 Nov 2023 13:46:32 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20230601; t=1700516791; x=1701121591; darn=lists.freedesktop.org;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:from:to:cc:subject:date
 :message-id:reply-to;
 bh=UFS8KKprIzFM0zE+Ai6M4ORed6sy7M8DbezDgWX5KRQ=;
 b=J7aBbuW8APLDKvLfpWFmuchVyws+/aBhydDJc3JqaeX3NiOjMf/YOJrOKEnvyWtb8z
 K5/zzIkKbFaPnp3RZE5PAkA7VGAIEfoOu2jYGlnWIY1odpnsVxHh+imuWU8vRffC2WdL
 IyMeFi798VyVr9VT6DR+g512s5+yTkog5ozThoPFFVSPXuwdlng+pS1qOJgxhUAHaUIC
 OEK/B2CNxOnBz+eCk0qdDJPh0EOEJMiwe/sSBufjnsrujYLVCkr7nor5xvXkKwY8WpNp
 zCc9Ius9nnlnaYqIvpQvkv0aGlIcOegbWc1T6X9yNKwRIiBzQgU0wBFpRRjMGmyfahCW
 hV8A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1700516791; x=1701121591;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=UFS8KKprIzFM0zE+Ai6M4ORed6sy7M8DbezDgWX5KRQ=;
 b=HdH81wBf24kwym+Mz7GAOBKvQ53Xp+t1e/T5rN11XHpYIQbCYcUNdPI7UG4ac7iLV4
 InmLUS39TDGa1MdhZXG2z53seDBTSy4RMIHQ+31tc2d/nMdNNuMXMi1zpz1mTaQuyAJb
 /0coRcqy8qcNET2Rx5urQmTIj44bG161MzikphAkXAIdIKpQcOHMt5n75Chf+8S5ib/T
 D518PZ2bl1EipOo5Xz/ffjiyC78kCL7mDh3FjQwtgJ2WUJ92vXJKkyCO+AHoLT77K/cG
 W5n00lvYR1bOWFq8+tVpj240V8CCxTxRU+8EemOx0x/WdoSEWD92/XI/t0WH+wiwzLGU
 lOzg==
X-Gm-Message-State: AOJu0YwqhV8qOdnaNmhUzI7YWzG1zz8dbu/9+o/W/6JzcJvlXwbh9wxA
 PxomTO2TEHqHCd6o1mr6fVkGRrD7qzU=
X-Google-Smtp-Source: AGHT+IGIRCD7UdLrZN9lSzHXmAgpmrQY5+HhoNLOuQvKT6vBAsOc+D+u9/DgXsMWlG54R5krCGbd6A==
X-Received: by 2002:a5d:4151:0:b0:332:ca69:2fb5 with SMTP id
 c17-20020a5d4151000000b00332ca692fb5mr1904733wrq.11.1700516791362; 
 Mon, 20 Nov 2023 13:46:31 -0800 (PST)
Received: from zotac.lan.
 (dynamic-2a02-3100-9030-5a00-2223-08ff-fe18-0310.310.pool.telefonica.de.
 [2a02:3100:9030:5a00:2223:8ff:fe18:310])
 by smtp.gmail.com with ESMTPSA id
 i13-20020a5d584d000000b00332cb0937f4sm2667052wrf.33.2023.11.20.13.46.30
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Mon, 20 Nov 2023 13:46:31 -0800 (PST)
From: Heiner Kallweit <hkallweit1@gmail.com>
To: Wolfram Sang <wsa@kernel.org>,
	Maxime Ripard <mripard@kernel.org>
Subject: [PATCH v4 04/20] drivers/gpu/drm/sun4i/sun4i_hdmi_i2c.c: remove
 I2C_CLASS_DDC support
Date: Mon, 20 Nov 2023 22:46:07 +0100
Message-ID: <20231120214624.9378-5-hkallweit1@gmail.com>
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

