Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id A74D17F5B46
	for <lists+dri-devel@lfdr.de>; Thu, 23 Nov 2023 10:41:05 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 9582110E6F8;
	Thu, 23 Nov 2023 09:40:53 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-ej1-x635.google.com (mail-ej1-x635.google.com
 [IPv6:2a00:1450:4864:20::635])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 9A20510E034
 for <dri-devel@lists.freedesktop.org>; Thu, 23 Nov 2023 09:40:47 +0000 (UTC)
Received: by mail-ej1-x635.google.com with SMTP id
 a640c23a62f3a-a03a9009572so79612966b.3
 for <dri-devel@lists.freedesktop.org>; Thu, 23 Nov 2023 01:40:47 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20230601; t=1700732446; x=1701337246; darn=lists.freedesktop.org;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:from:to:cc:subject:date
 :message-id:reply-to;
 bh=Wi4R483zknpMUwj3cvaLHx1vmpa1j9N3buw1XNODPJU=;
 b=Jlp6sHupHD+V4Y8Ur4RhKFQboynJlBEGwbE5PminTTIhYD9XWp8tjmemMzgyN7TdE/
 cTi+5oBAwyfU8o//7JADl5EaK96aeqIsmlaEpEmiUksgotaz6TElASmh2HA2ISav9Tst
 aBZn4ssxdD8vp7xgAdrlRjoIMGApeSEhMCEHtR0yAjoZsDckODpAVSY3Jmn0sQc9kwtm
 hb8MMMQeOGDeH9WxV5R35bv8tO83oAw3aYJwfEtejxuYIPO8k/rhE/j84gl3lu9L7mQX
 VBVzrsOEodFRdSjINdN3v38WxDxbhavqSWOIvHv0c3oI7DJtwIYCOVdzbOy/S6URaBDw
 CkMw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1700732446; x=1701337246;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=Wi4R483zknpMUwj3cvaLHx1vmpa1j9N3buw1XNODPJU=;
 b=d04pvGCETgDOArOtuZ0cj5cTn7Ea2w/Zof+jfAKYR6wH3wIGCZaA7apXSep8g9CWp8
 aCzzjgnlnkBhz6ACsEBgCZgTO0VCZDsmCWRnxVgheo/ijRGWYE+R1LlIldNGEAyor9T6
 +VaLe+5dcXDa7LC/QnYrBcqh6NP20qLx+niqpIquhQUTNO+5FkI2huB4op+kJH8+7OOd
 Z/jZPwjVQv3fq1KmQL0eIb/YHxizGKWt8xFUTTSBt3WwwXPFBcwWWziVjXZ9i37ZLjiv
 SnjZ4OX4djwzEKdzv5nscxQXMUrgb1RTcAZJ4lrbURQr6F9ck4JDPdfPcu9Tt2XocDXq
 aUSw==
X-Gm-Message-State: AOJu0YzYgCtdl7IEQ5QsL3zZ48MTskueWmDZZHLcjUAjsX6QXWeHrOAm
 nSbWYKJFcf3AWEXZdCdg6oc=
X-Google-Smtp-Source: AGHT+IEtwKDYnzg1xKgfKy0ud4LFwlV0rfc9uAkIx75F9WsQAVnCrYCvhXmBXTNqAzq4Kf4OfYEh4Q==
X-Received: by 2002:a17:906:7c57:b0:9fc:9b28:7ffc with SMTP id
 g23-20020a1709067c5700b009fc9b287ffcmr3285748ejp.17.1700732445589; 
 Thu, 23 Nov 2023 01:40:45 -0800 (PST)
Received: from zotac.lan.
 (dynamic-2a01-0c23-c0f2-3200-2223-08ff-fe18-0310.c23.pool.telefonica.de.
 [2a01:c23:c0f2:3200:2223:8ff:fe18:310])
 by smtp.gmail.com with ESMTPSA id
 s9-20020a1709066c8900b009e5ce1acb01sm546199ejr.103.2023.11.23.01.40.44
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Thu, 23 Nov 2023 01:40:45 -0800 (PST)
From: Heiner Kallweit <hkallweit1@gmail.com>
To: Wolfram Sang <wsa@kernel.org>,
	Sandy Huang <hjc@rock-chips.com>
Subject: [PATCH v5 01/20] drivers/gpu/drm/rockchip: remove I2C_CLASS_DDC
 support
Date: Thu, 23 Nov 2023 10:40:21 +0100
Message-ID: <20231123094040.592-2-hkallweit1@gmail.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20231123094040.592-1-hkallweit1@gmail.com>
References: <20231123094040.592-1-hkallweit1@gmail.com>
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
 Maxime Ripard <mripard@kernel.org>, linux-rockchip@lists.infradead.org,
 linux-i2c@vger.kernel.org, Thomas Zimmermann <tzimmermann@suse.de>,
 linux-arm-kernel@lists.infradead.org, Heiner Kallweit <hkallweit1@gmail.com>
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

After removal of the legacy EEPROM driver and I2C_CLASS_DDC support in
olpc_dcon there's no i2c client driver left supporting I2C_CLASS_DDC.
Class-based device auto-detection is a legacy mechanism and shouldn't
be used in new code. So we can remove this class completely now.

Preferably this series should be applied via the i2c tree.

Acked-by: Heiko Stuebner <heiko@sntech.de>
Acked-by: Thomas Zimmermann <tzimmermann@suse.de>
Signed-off-by: Heiner Kallweit <hkallweit1@gmail.com>

---
 drivers/gpu/drm/rockchip/inno_hdmi.c   |    1 -
 drivers/gpu/drm/rockchip/rk3066_hdmi.c |    1 -
 2 files changed, 2 deletions(-)

diff --git a/drivers/gpu/drm/rockchip/inno_hdmi.c b/drivers/gpu/drm/rockchip/inno_hdmi.c
index 6e5b922a1..a7739b27c 100644
--- a/drivers/gpu/drm/rockchip/inno_hdmi.c
+++ b/drivers/gpu/drm/rockchip/inno_hdmi.c
@@ -793,7 +793,6 @@ static struct i2c_adapter *inno_hdmi_i2c_adapter(struct inno_hdmi *hdmi)
 	init_completion(&i2c->cmp);
 
 	adap = &i2c->adap;
-	adap->class = I2C_CLASS_DDC;
 	adap->owner = THIS_MODULE;
 	adap->dev.parent = hdmi->dev;
 	adap->dev.of_node = hdmi->dev->of_node;
diff --git a/drivers/gpu/drm/rockchip/rk3066_hdmi.c b/drivers/gpu/drm/rockchip/rk3066_hdmi.c
index fa6e592e0..7a3f71aa2 100644
--- a/drivers/gpu/drm/rockchip/rk3066_hdmi.c
+++ b/drivers/gpu/drm/rockchip/rk3066_hdmi.c
@@ -725,7 +725,6 @@ static struct i2c_adapter *rk3066_hdmi_i2c_adapter(struct rk3066_hdmi *hdmi)
 	init_completion(&i2c->cmpltn);
 
 	adap = &i2c->adap;
-	adap->class = I2C_CLASS_DDC;
 	adap->owner = THIS_MODULE;
 	adap->dev.parent = hdmi->dev;
 	adap->dev.of_node = hdmi->dev->of_node;

