Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 04E507F05D8
	for <lists+dri-devel@lfdr.de>; Sun, 19 Nov 2023 12:29:06 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 8FB3110E1E7;
	Sun, 19 Nov 2023 11:28:55 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-ed1-x52f.google.com (mail-ed1-x52f.google.com
 [IPv6:2a00:1450:4864:20::52f])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 3778210E1DA
 for <dri-devel@lists.freedesktop.org>; Sun, 19 Nov 2023 11:28:42 +0000 (UTC)
Received: by mail-ed1-x52f.google.com with SMTP id
 4fb4d7f45d1cf-5409bc907edso4725300a12.0
 for <dri-devel@lists.freedesktop.org>; Sun, 19 Nov 2023 03:28:41 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20230601; t=1700393320; x=1700998120; darn=lists.freedesktop.org;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:from:to:cc:subject:date
 :message-id:reply-to;
 bh=ihe5CWoYwzVYQa0PIBn4FXCZubjqfqZzL14QGGmAy2E=;
 b=Uo1YR0vk9ssKUoa38j7r3nz5rvyURP8LND59v2Qf8xS5ZqVS1ykA3u3X9F599f8CPS
 VUF5rb8xpwa22PAGayK8ugObsNF1Zb/Q3Y/gJqEKNhKlKAyoA8flY/6phjNL3YLC8S79
 IDhDuIlEOfc2ja9ZGnBb+L/db45wzm23fHd7yhUz9rfx8b5R4Z7P0yeJu1vPQnJ9Hv95
 VevQGSNO/pZ0fiafxYQ5UFi67t8CoU6fTp5tGnNc7INLqiwYKjHSfN70s1BIBl3ivAzo
 45fObhrHlj4ylauuuzgMWAMYij7MlcC1nQsNjFu1o6EPTb/H7fMOStvtFEE1184Yx7kr
 knDA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1700393320; x=1700998120;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=ihe5CWoYwzVYQa0PIBn4FXCZubjqfqZzL14QGGmAy2E=;
 b=M/+NYrWwm39yxAUH0vML6HYsImq+zEV3nNZEgeN5iXvN58Jnn7Pv+N95h5aMEp8ug/
 cOmws1duskgAl4bgNkelPivJZlZBrH8ApRebGuWZ/vl1LxHBrEVieA0rDFB1x/9PvVHZ
 Y/izE1vqnwQe2v1aQJZ5REeqn3q+mr3fbne56AfkDziIjXlRXw7dZ1MhhnyRPPcsVcrn
 tbcBpM00fcJEB9UpCmkiEOFvx5ODYjAaJOYeMoSvfZ+UsNgkzmptUAxSl+etJpgXGDuL
 SBwExxrin8Fo9hDk9BGJPg1Ndj8Mw+0O0/VNfdEGoBxihJhf6FaMGzCXjyiT8RdqbqAK
 1JIw==
X-Gm-Message-State: AOJu0YyelCazQ4SWwbKM9UBrfBc49Mlz2fMYJsJ/xcN3bJvcGrlMFQ7x
 8Oeiet8pBsaUpcmNiBb1viA=
X-Google-Smtp-Source: AGHT+IE+w9pgQvDl2Y3wxx8qGfyopeIAjzUYE/Lxfmit0zeTDVBO1PBeuPJks8PhZkZ7FJV0jaU+YQ==
X-Received: by 2002:a17:906:7396:b0:9fd:8da1:5c9f with SMTP id
 f22-20020a170906739600b009fd8da15c9fmr571228ejl.15.1700393320105; 
 Sun, 19 Nov 2023 03:28:40 -0800 (PST)
Received: from zotac.lan.
 (dynamic-2a01-0c23-bde4-3e00-2223-08ff-fe18-0310.c23.pool.telefonica.de.
 [2a01:c23:bde4:3e00:2223:8ff:fe18:310])
 by smtp.gmail.com with ESMTPSA id
 k22-20020a1709063fd600b009f8af454d0dsm2420378ejj.112.2023.11.19.03.28.39
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Sun, 19 Nov 2023 03:28:39 -0800 (PST)
From: Heiner Kallweit <hkallweit1@gmail.com>
To: Wolfram Sang <wsa@kernel.org>,
	Chun-Kuang Hu <chunkuang.hu@kernel.org>
Subject: [PATCH v3 12/20] drivers/gpu/drm/mediatek/mtk_hdmi_ddc.c: remove
 I2C_CLASS_DDC support
Date: Sun, 19 Nov 2023 12:28:17 +0100
Message-ID: <20231119112826.5115-13-hkallweit1@gmail.com>
X-Mailer: git-send-email 2.42.1
In-Reply-To: <20231119112826.5115-1-hkallweit1@gmail.com>
References: <20231119112826.5115-1-hkallweit1@gmail.com>
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

