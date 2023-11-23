Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id C513A7F5B5B
	for <lists+dri-devel@lfdr.de>; Thu, 23 Nov 2023 10:41:19 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 5383610E700;
	Thu, 23 Nov 2023 09:41:10 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-ed1-x52d.google.com (mail-ed1-x52d.google.com
 [IPv6:2a00:1450:4864:20::52d])
 by gabe.freedesktop.org (Postfix) with ESMTPS id A1BD410E6FB
 for <dri-devel@lists.freedesktop.org>; Thu, 23 Nov 2023 09:40:56 +0000 (UTC)
Received: by mail-ed1-x52d.google.com with SMTP id
 4fb4d7f45d1cf-54a95657df3so1021926a12.0
 for <dri-devel@lists.freedesktop.org>; Thu, 23 Nov 2023 01:40:56 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20230601; t=1700732455; x=1701337255; darn=lists.freedesktop.org;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:from:to:cc:subject:date
 :message-id:reply-to;
 bh=ibtPu02kEx2LQ9A0jvCmJB7jA/c3boGIvN0NginjoG8=;
 b=Ko99wVoFedTagzaxV25ZL925BixAWgtD1aL7NRjjWQ3ex9UrL5/qnB9h/tuK3Ldv5Q
 /tjpsaY8VOnWV8hFTzNb8Y6Mq1Mdt2X4+0r/qWgl5Bdlk1DYwgHQKkqSKXQTFB/vvNt2
 TT2UkS0cbE3JQPVnO1gOGyjsnfxe2Np+U2luBmPd0Xmzk7TjNJJu7mvxZnmzD2nj+++7
 Lk0d8aGgAixKOhDlPXQbMgXlPlKC7zfr+aa+a/IbSn0GohXIWl9kpAq8Kqkvw6XmxVaH
 +5kxgtdkuWN4kdwko4dv55QVprD0uoNZkt4Px1whhCJx/dHXwUuD+UOgsgTZOzoAiIXB
 O0yQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1700732455; x=1701337255;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=ibtPu02kEx2LQ9A0jvCmJB7jA/c3boGIvN0NginjoG8=;
 b=ih9Hiqd6570Kifnu635h/l63YfKT351Mx9Z8wllu3ntNTwMMG+qldLOCf7ka8q4bcp
 nPTZo84nvqWOtKNe/Kxljy12cCDxE6XgOOapC/v05P5yeQf+iqy54vk5RmlKX9LCzbbh
 COem1vKsIudSGhbm3BWxxm4WQ8ySesMnwAXAoqiViTMaBWcvO78ANa7mPxqkIrgSt0Op
 B1thr5H/xM1o3Fo/M9g+lVVl024XWr/yCePHdKNEV2TWYnpEDbuxpTtZfPqhpopmCm4s
 Fa/VjGJ3mb7or0zPebf7uRmQt/1ghis6a2mKVX0R9XjLThpK2vMMu9VSIITJr6WGHTmL
 R0Mw==
X-Gm-Message-State: AOJu0Yx3kr6HgADu4cB219aaFxrojJHdB1d2LU3CcU8DFMLVNU+yg5mu
 xSF9PriDWRbVXIHIxuuS23M=
X-Google-Smtp-Source: AGHT+IEhOkC6xnGbAR37vpV6MkHztMHFrS18pW2+Z/6tkJJXSA5ZZsQMtb3qt5G6Cp1hpv+vQnc4XQ==
X-Received: by 2002:a17:906:51d5:b0:9bf:7ae7:fd6c with SMTP id
 v21-20020a17090651d500b009bf7ae7fd6cmr3174848ejk.10.1700732455026; 
 Thu, 23 Nov 2023 01:40:55 -0800 (PST)
Received: from zotac.lan.
 (dynamic-2a01-0c23-c0f2-3200-2223-08ff-fe18-0310.c23.pool.telefonica.de.
 [2a01:c23:c0f2:3200:2223:8ff:fe18:310])
 by smtp.gmail.com with ESMTPSA id
 s9-20020a1709066c8900b009e5ce1acb01sm546199ejr.103.2023.11.23.01.40.54
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Thu, 23 Nov 2023 01:40:54 -0800 (PST)
From: Heiner Kallweit <hkallweit1@gmail.com>
To: Wolfram Sang <wsa@kernel.org>,
	Chun-Kuang Hu <chunkuang.hu@kernel.org>
Subject: [PATCH v5 12/20] drivers/gpu/drm/mediatek/mtk_hdmi_ddc.c: remove
 I2C_CLASS_DDC support
Date: Thu, 23 Nov 2023 10:40:32 +0100
Message-ID: <20231123094040.592-13-hkallweit1@gmail.com>
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
Cc: Thomas Zimmermann <tzimmermann@suse.de>, linux-kernel@vger.kernel.org,
 dri-devel@lists.freedesktop.org, linux-mediatek@lists.infradead.org,
 linux-i2c@vger.kernel.org, Matthias Brugger <matthias.bgg@gmail.com>,
 AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>,
 linux-arm-kernel@lists.infradead.org, Heiner Kallweit <hkallweit1@gmail.com>
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

After removal of the legacy EEPROM driver and I2C_CLASS_DDC support in
olpc_dcon there's no i2c client driver left supporting I2C_CLASS_DDC.
Class-based device auto-detection is a legacy mechanism and shouldn't
be used in new code. So we can remove this class completely now.

Preferably this series should be applied via the i2c tree.

Reviewed-by: AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>
Acked-by: Thomas Zimmermann <tzimmermann@suse.de>
Signed-off-by: Heiner Kallweit <hkallweit1@gmail.com>

---
 drivers/gpu/drm/mediatek/mtk_hdmi_ddc.c |    1 -
 1 file changed, 1 deletion(-)

diff --git a/drivers/gpu/drm/mediatek/mtk_hdmi_ddc.c b/drivers/gpu/drm/mediatek/mtk_hdmi_ddc.c
index d675c954b..54e46e440 100644
--- a/drivers/gpu/drm/mediatek/mtk_hdmi_ddc.c
+++ b/drivers/gpu/drm/mediatek/mtk_hdmi_ddc.c
@@ -297,7 +297,6 @@ static int mtk_hdmi_ddc_probe(struct platform_device *pdev)
 
 	strscpy(ddc->adap.name, "mediatek-hdmi-ddc", sizeof(ddc->adap.name));
 	ddc->adap.owner = THIS_MODULE;
-	ddc->adap.class = I2C_CLASS_DDC;
 	ddc->adap.algo = &mtk_hdmi_ddc_algorithm;
 	ddc->adap.retries = 3;
 	ddc->adap.dev.of_node = dev->of_node;

