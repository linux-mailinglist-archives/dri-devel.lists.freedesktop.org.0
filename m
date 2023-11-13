Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 8761C7E9B0C
	for <lists+dri-devel@lfdr.de>; Mon, 13 Nov 2023 12:24:36 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id D79C410E350;
	Mon, 13 Nov 2023 11:24:24 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-wm1-x32a.google.com (mail-wm1-x32a.google.com
 [IPv6:2a00:1450:4864:20::32a])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 888E810E353
 for <dri-devel@lists.freedesktop.org>; Mon, 13 Nov 2023 11:24:13 +0000 (UTC)
Received: by mail-wm1-x32a.google.com with SMTP id
 5b1f17b1804b1-40842752c6eso35114825e9.1
 for <dri-devel@lists.freedesktop.org>; Mon, 13 Nov 2023 03:24:13 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20230601; t=1699874652; x=1700479452; darn=lists.freedesktop.org;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:from:to:cc:subject:date
 :message-id:reply-to;
 bh=ihe5CWoYwzVYQa0PIBn4FXCZubjqfqZzL14QGGmAy2E=;
 b=i4XRB2UtSBixmVdFcojHTHFbx5yFnqaRA2pqHbq+vOI8uk28OmneAf/LPoZIsiBbIa
 Hn75Nvc20u+xPf0quHFErWG0x3Suf7YbuYT6PHCFnOI0czVmYWNchmqZ89v/E5gTC/dy
 KGjT2n9CdSVo7SdaWQETl81XRaMBBUxknDpV9SmKUvbKpnJtO8mYZJnjVGHT43QSt8jd
 QmLYVqmvun021QnIl54oT8TjmfAXZMJ8riTKiuVrRUQvj4e8ykU7P7p+kLlAlvpB7tcJ
 lroJrjbkbjthrCfugAm0e40icQgVWE0yIVUDVspHQbcfqmBrZcNroyh6tVromJ/qK88d
 QYYg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1699874652; x=1700479452;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=ihe5CWoYwzVYQa0PIBn4FXCZubjqfqZzL14QGGmAy2E=;
 b=iFTCEMwAVTaH59atHMi/pokhxFeiXhLokgvTq+JGLLKdt1at9bpHd1/GJjQ0/iYZcc
 7LWCBYH73BSGEJiLuIO95CSwBOgzTyYrZib8NvNj1TJQw4uent/qzbqdPoYP4hNXhDAK
 dW2HfHzTLYei4/lbGf+r/K+/oEF6LnEGv3Cu8/eUpesb/pHbVauyX32D5U04K8XCvrP3
 noWtRA8fx6z99b48ID5xv1c4hzrTWY3bwwUB0zBDbPFu1tlSsvDbsJpI8OnlRSP36R1V
 P1nEK+8V0TvmZ5X21pe6UMWN0AoRR9WTvmrSJolHz1yeAT2JpFHYKyTK/6CE67g6re/1
 U9hQ==
X-Gm-Message-State: AOJu0Yxt+LnNnY2ZNw7TEWmucMhgIMDSGn/nMBBPW3QG+S6IpUvg5Rh5
 6e8Ezcpnd+EIPHGz6POYMJw=
X-Google-Smtp-Source: AGHT+IEb96vRjjDVhf2WWvt4ATSMI0ZIHMZT2M821fnApL0F6zP0tqP/mZlSqQGsQCCeZ+/3gKjOXw==
X-Received: by 2002:a05:600c:4f09:b0:405:336b:8307 with SMTP id
 l9-20020a05600c4f0900b00405336b8307mr5644653wmq.7.1699874651755; 
 Mon, 13 Nov 2023 03:24:11 -0800 (PST)
Received: from zotac.lan.
 (dynamic-2a01-0c22-6e16-fe00-2223-08ff-fe18-0310.c22.pool.telefonica.de.
 [2a01:c22:6e16:fe00:2223:8ff:fe18:310])
 by smtp.gmail.com with ESMTPSA id
 l19-20020a05600c4f1300b0040772138bb7sm13565787wmq.2.2023.11.13.03.24.10
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Mon, 13 Nov 2023 03:24:11 -0800 (PST)
From: Heiner Kallweit <hkallweit1@gmail.com>
To: Wolfram Sang <wsa@kernel.org>,
	Chun-Kuang Hu <chunkuang.hu@kernel.org>
Subject: [PATCH 12/20] drivers/gpu/drm/mediatek/mtk_hdmi_ddc.c: remove
 I2C_CLASS_DDC support
Date: Mon, 13 Nov 2023 12:23:36 +0100
Message-ID: <20231113112344.719-13-hkallweit1@gmail.com>
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
Cc: linux-kernel@vger.kernel.org, dri-devel@lists.freedesktop.org,
 linux-mediatek@lists.infradead.org, linux-i2c@vger.kernel.org,
 Matthias Brugger <matthias.bgg@gmail.com>,
 AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>,
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

