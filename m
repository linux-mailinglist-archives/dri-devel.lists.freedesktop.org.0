Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 2B0C07F0197
	for <lists+dri-devel@lfdr.de>; Sat, 18 Nov 2023 18:43:54 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id C2EC110E33F;
	Sat, 18 Nov 2023 17:43:51 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-wm1-x32e.google.com (mail-wm1-x32e.google.com
 [IPv6:2a00:1450:4864:20::32e])
 by gabe.freedesktop.org (Postfix) with ESMTPS id C55A810E343
 for <dri-devel@lists.freedesktop.org>; Sat, 18 Nov 2023 17:42:39 +0000 (UTC)
Received: by mail-wm1-x32e.google.com with SMTP id
 5b1f17b1804b1-40853c639abso4729095e9.0
 for <dri-devel@lists.freedesktop.org>; Sat, 18 Nov 2023 09:42:39 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20230601; t=1700329358; x=1700934158; darn=lists.freedesktop.org;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:from:to:cc:subject:date
 :message-id:reply-to;
 bh=ihe5CWoYwzVYQa0PIBn4FXCZubjqfqZzL14QGGmAy2E=;
 b=hmw8Nr7juuEcku7jIAbcK1czf4dMRmbbIK0W0jheGusR54NMKqSfRxbK8Do1yb+vFd
 IKfGLsSv+ZTTpeK0uHvESMynYJRmbmGt/5MnxXo98H6PpTPO2c4/UhbqZDpCLvUnjHTi
 GpjGmYZO8JazHjUi8ET/7I0BBv4GRvDMpTyPK0NPto3nIFxPNTAJfKmCLvQQGmNFzOaf
 pOCKJ3s/4bhB0cIcF55GFUU8APxNA6dTKqVmFP618+OWvT3g++eYOBXgVLxHWT1ldzFE
 IoB79R96Vtn5KIpF6rvvssqrjg/E80GvfXKm5RP/QbliVOg4dYe9O8e3ioCexPaKLgfw
 Blbw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1700329358; x=1700934158;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=ihe5CWoYwzVYQa0PIBn4FXCZubjqfqZzL14QGGmAy2E=;
 b=Ikzmlt+QanhEsQ9WYWADLQk3haWk/ePDSR9V3DpZgyMb+AZZmBiv6MxM3EqUA3MWza
 XzbM4Q4T9VeMlQxj9qlztF0XRwGftb8JLE2efAPM2chlTkEJb0i45+52oxyJoQY6uzML
 bgHSs016Paj5F29Qw/emVTEALNldu/BnF/EsNtpI7HPJTxDzBh9Vf86zdKhMaSkjn+6Z
 zD0VY2BvcHbBGr/B96MhvXJJwQxLlEcljWugYmgpBsEQspApiUofDNkltq38GE2EfvnV
 5/2l5NxkVjj10dSFULe1VNT8Av/9T5CFODRYjnHCjEvU6Iqa0n6kC2GszB+qgSN2IV1m
 U4cA==
X-Gm-Message-State: AOJu0YzdlxiWc1MygESD1H6qhL2thcmqc09uRfqZdshamltgJ2mNtXlI
 XCLuJpCHJkoZwK7/TeRMKpM=
X-Google-Smtp-Source: AGHT+IE8c5V85RdvcwMzWAbBlQPGXZHeMjHZ0eSrzhGIJjdv16HbHYiNDOuMRSlBwb03Yc7GkrviVQ==
X-Received: by 2002:a05:600c:22da:b0:409:136:469f with SMTP id
 26-20020a05600c22da00b004090136469fmr2103392wmg.38.1700329357997; 
 Sat, 18 Nov 2023 09:42:37 -0800 (PST)
Received: from zotac.lan.
 (dynamic-2a01-0c22-77bf-8300-2223-08ff-fe18-0310.c22.pool.telefonica.de.
 [2a01:c22:77bf:8300:2223:8ff:fe18:310])
 by smtp.gmail.com with ESMTPSA id
 y10-20020a05600c340a00b004068de50c64sm6964211wmp.46.2023.11.18.09.42.36
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Sat, 18 Nov 2023 09:42:37 -0800 (PST)
From: Heiner Kallweit <hkallweit1@gmail.com>
To: Wolfram Sang <wsa@kernel.org>,
	Chun-Kuang Hu <chunkuang.hu@kernel.org>
Subject: [PATCH v2 12/20] drivers/gpu/drm/mediatek/mtk_hdmi_ddc.c: remove
 I2C_CLASS_DDC support
Date: Sat, 18 Nov 2023 18:42:12 +0100
Message-ID: <20231118174221.851-13-hkallweit1@gmail.com>
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

