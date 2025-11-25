Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 06243C85424
	for <lists+dri-devel@lfdr.de>; Tue, 25 Nov 2025 14:52:47 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 6355810E067;
	Tue, 25 Nov 2025 13:52:45 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=linaro.org header.i=@linaro.org header.b="jizoSlZw";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-wm1-f45.google.com (mail-wm1-f45.google.com
 [209.85.128.45])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 0AF0210E067
 for <dri-devel@lists.freedesktop.org>; Tue, 25 Nov 2025 13:52:44 +0000 (UTC)
Received: by mail-wm1-f45.google.com with SMTP id
 5b1f17b1804b1-477b1cc8fb4so31669255e9.1
 for <dri-devel@lists.freedesktop.org>; Tue, 25 Nov 2025 05:52:43 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=linaro.org; s=google; t=1764078762; x=1764683562; darn=lists.freedesktop.org;
 h=content-disposition:mime-version:message-id:subject:cc:to:from:date
 :from:to:cc:subject:date:message-id:reply-to;
 bh=5qoiP6TwSt3WsRHm0Qt9S7E0jYs8oQ+YtHQFRGroW9I=;
 b=jizoSlZwVJq+1Q+Qu51HXJVHDQpIVEJ+SQDuOGwjb3p56tOsRjyFAoONMOOpSPAmBn
 dNlkDQTTz3bwmW0AvP1Bxc2SwELGcwmyOQuiWnaymmJAZvPTguAJiOpmfiX/CUGjx/TF
 1E+cd5vd+b0qPpXYU8QvKNH0Q4BgRyTkzql6KowTsnF2NUBttLqELmDE7/+ATCLB9g4B
 0HnPhCIJkVgw9J34does4IkSf2LtrvC68EmcrhIm5pphNWXZGBjVL7t929MF3ExTYgYw
 f8ZwJvMvctcmX6GHdhkEumkFsTDP1PPyit9D+3WgZX6dzR0MCcHEC/ThOtPV8fDNA4/V
 Y0aA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1764078762; x=1764683562;
 h=content-disposition:mime-version:message-id:subject:cc:to:from:date
 :x-gm-gg:x-gm-message-state:from:to:cc:subject:date:message-id
 :reply-to;
 bh=5qoiP6TwSt3WsRHm0Qt9S7E0jYs8oQ+YtHQFRGroW9I=;
 b=lXcFnmrAmTcT3pFatBPPISMnw+6WY2EvRXdh6sm0AjYYMotHgFH6l+Xx0BXrs9Ez5L
 eo3a2OFi4moEaBV3UdVDjjX4ypZdS3eFpc/eW64FKvnH9+0jiGAGXKNgmPzmSMTKl85S
 PKRG530407UunJ7cWwTfxUsuWBH6TgQg2FnA9E/n46lpeFjZG7QaNE+YiTpNn9v/rAZm
 v4Cp4AN6gkiQdS2vnFJK+6AjMJoe1GqYKpiqnANuuefRTcMOzNUlAcyvPtVcLIlW/3YF
 I7Cszz5bS8eZv+kyKxLePCvsUjbXUB82Jfpaux+LHsIPsGYDjD6wFbRhiw8xfDkARu3S
 SmeA==
X-Forwarded-Encrypted: i=1;
 AJvYcCUSwBN5CtANbk99AE2sXdGJJnKeaWmawSfgu4fiK6aAjLYgclB9j4Iu1FVlvTn/fC7Y0x8Jhl8mTpw=@lists.freedesktop.org
X-Gm-Message-State: AOJu0Yx/ZVJMgAmmUg0/0i7PAzjEAto9J0vcGSGPrAPHm730WIwo1CZf
 ENSrOeKcMG7hBFOgJpZb38iqRSpvj3dtpRleiIqiJuk8fMZA333rAUsPLW+KKwAE+RM=
X-Gm-Gg: ASbGncv1SeMmRjXwTLst3w+aJQZrxQUqAQDb/MXXbSDsSYdY3XdWAekZqoqoZSE66YF
 EZNrd68iMnKjZy2G7G6k5p7DtP+5kXA6Y7e+SsphMecuVtLGl9BNANRmK/OUDreysEUNCgUaz1j
 AoPo5KxBeqkWxFSP0kybVYNzrH/HJ41YHa1oPzlZ9QUlS4Gqcf/3cHKNThBBc9kMdHY/sOJ6m+X
 QMLtSjYQIBXcoKNxQA+XldXkkO47KgeK5F0qba1uX8ehB9R1mbRAXhnjv98Aqnu3IA1xIcltSDv
 OTOk0qBf36RfOrbYdFqjLQKI+ubVX5jvfHa9DjD5A+IcrjXBu48Qie8lnLV55Il6nWLWzVvLHjz
 KxhYtSEbc9LkgKT6Ad6RJUsZv339cJVFA3XLLHcsD0FK00t2wfEx+9eZIwEsg3Oz1y6KMkPi+T3
 L1NJ0PemDl0gUGXdMF
X-Google-Smtp-Source: AGHT+IExMFPzaEj2t7R/V1HwC9wLFLjVdHnT+Jc3arjZhnTf+cI6vhU+qt5I6EYqSjZLnH2q9pLpiw==
X-Received: by 2002:a05:600c:3545:b0:477:7ab8:aba with SMTP id
 5b1f17b1804b1-47904ac3ca4mr24955445e9.1.1764078762464; 
 Tue, 25 Nov 2025 05:52:42 -0800 (PST)
Received: from localhost ([196.207.164.177])
 by smtp.gmail.com with UTF8SMTPSA id
 5b1f17b1804b1-477bf1f365fsm254495315e9.8.2025.11.25.05.52.41
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Tue, 25 Nov 2025 05:52:41 -0800 (PST)
Date: Tue, 25 Nov 2025 16:52:39 +0300
From: Dan Carpenter <dan.carpenter@linaro.org>
To: AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>
Cc: Chun-Kuang Hu <chunkuang.hu@kernel.org>,
 Philipp Zabel <p.zabel@pengutronix.de>,
 David Airlie <airlied@gmail.com>, Simona Vetter <simona@ffwll.ch>,
 Matthias Brugger <matthias.bgg@gmail.com>, CK Hu <ck.hu@mediatek.com>,
 Louis-Alexis Eyraud <louisalexis.eyraud@collabora.com>,
 dri-devel@lists.freedesktop.org, linux-mediatek@lists.infradead.org,
 linux-kernel@vger.kernel.org, linux-arm-kernel@lists.infradead.org,
 kernel-janitors@vger.kernel.org
Subject: [PATCH next] drm/mediatek: Fix platform_get_irq() error checking
Message-ID: <aSW0p5sqnJVJsqDO@stanley.mountain>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
X-Mailer: git-send-email haha only kidding
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
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

The platform_get_irq() function returns negative error codes on failure
and positive non-zero IRQ numbers on success.  It never returns NULL. Fix
the error checking to look for negatives, and change "hdmi->irq" from
unsigned int to just int.

Fixes: 8d0f79886273 ("drm/mediatek: Introduce HDMI/DDC v2 for MT8195/MT8188")
Signed-off-by: Dan Carpenter <dan.carpenter@linaro.org>
---
 drivers/gpu/drm/mediatek/mtk_hdmi_common.c | 2 +-
 drivers/gpu/drm/mediatek/mtk_hdmi_common.h | 2 +-
 2 files changed, 2 insertions(+), 2 deletions(-)

diff --git a/drivers/gpu/drm/mediatek/mtk_hdmi_common.c b/drivers/gpu/drm/mediatek/mtk_hdmi_common.c
index e78eb0876f16..bd7f8c56ec9c 100644
--- a/drivers/gpu/drm/mediatek/mtk_hdmi_common.c
+++ b/drivers/gpu/drm/mediatek/mtk_hdmi_common.c
@@ -303,7 +303,7 @@ static int mtk_hdmi_dt_parse_pdata(struct mtk_hdmi *hdmi, struct platform_device
 		return dev_err_probe(dev, ret, "Failed to get clocks\n");
 
 	hdmi->irq = platform_get_irq(pdev, 0);
-	if (!hdmi->irq)
+	if (hdmi->irq < 0)
 		return hdmi->irq;
 
 	hdmi->regs = device_node_to_regmap(dev->of_node);
diff --git a/drivers/gpu/drm/mediatek/mtk_hdmi_common.h b/drivers/gpu/drm/mediatek/mtk_hdmi_common.h
index de5e064585f8..7a644bbf5843 100644
--- a/drivers/gpu/drm/mediatek/mtk_hdmi_common.h
+++ b/drivers/gpu/drm/mediatek/mtk_hdmi_common.h
@@ -168,7 +168,7 @@ struct mtk_hdmi {
 	bool audio_enable;
 	bool powered;
 	bool enabled;
-	unsigned int irq;
+	int irq;
 	enum hdmi_hpd_state hpd;
 	hdmi_codec_plugged_cb plugged_cb;
 	struct device *codec_dev;
-- 
2.51.0

