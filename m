Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 4E3CD359828
	for <lists+dri-devel@lfdr.de>; Fri,  9 Apr 2021 10:43:22 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 52A396E488;
	Fri,  9 Apr 2021 08:43:17 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-wr1-x42a.google.com (mail-wr1-x42a.google.com
 [IPv6:2a00:1450:4864:20::42a])
 by gabe.freedesktop.org (Postfix) with ESMTPS id EFB916E488
 for <dri-devel@lists.freedesktop.org>; Fri,  9 Apr 2021 08:43:16 +0000 (UTC)
Received: by mail-wr1-x42a.google.com with SMTP id j5so3820194wrn.4
 for <dri-devel@lists.freedesktop.org>; Fri, 09 Apr 2021 01:43:16 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=baylibre-com.20150623.gappssmtp.com; s=20150623;
 h=from:to:cc:subject:date:message-id:mime-version
 :content-transfer-encoding;
 bh=SxAVnkvMBucxc7nVmzkehM55ix3ppr1nutixxEdT8mc=;
 b=hzi/nQIm8IbBk14mZiIsufRcM2Cw+6f99hud3p8ZpsCLObKl7z1S650qtmxg5CMtaD
 RIJ9RjLF8E7L1KpF7o/zuDQmpn7JKmqEcVY8fYIbiGHqEeQfDKW1ZBx3l/ijasZ+aJ4x
 b7Am0q/FC5+lKR4GLkRYGODR4ffE+C25mAOiBDtkerPcyM5yBctoW94hYBre/MJfelFz
 UNlUxeKGJ8qtQwcaoofpFf5zZ2iWx0y9MOzAXUJhG6pMomlWGcKkXGYXHAASPDtCJeMd
 M01f4oOBLkQX5TTVD+MmLwWEALjMO9ylf6sRR6ZLXO7BRvyH2YX6+PCmfXrsjF2zyLYI
 rgfQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:mime-version
 :content-transfer-encoding;
 bh=SxAVnkvMBucxc7nVmzkehM55ix3ppr1nutixxEdT8mc=;
 b=edxUMKgktKZLkQlzvHojcuxo3RY84IoPi/p8II9xEs8dL4PG8mI1g3uojFoecnQLiU
 1/NSyfY2PabwolLYzttyxsDfz1tgifoz029mSUpHjVjF1nYrqclIJ67c289pkm4iVYuB
 FAt93hMsdGd9ca94HIa9zcteWKkbXS1SWSzQTM50k/KpkuZZrZ0YPd4c6Rd9tZ92xsPx
 g02oHeqyIFsKG3N3LY7fMIWK8w8g1TjIhHfe8NtQ9PTa5ZS+wfoKlHg/LxaFztMoVvV6
 DktuzTa/eNFS3LZij/Lgo29TmnEMOrLG/RA+GTW5jBOrjRuJrUefiJJyal6PJU+5yyp8
 KaWg==
X-Gm-Message-State: AOAM5312eRT9OAMytoMOYZNFgBUnUWxJuk/VnJUfAVZAW6Jae9Co1e5o
 wL/As5YYSC0zQosmuehQNGLE8w==
X-Google-Smtp-Source: ABdhPJyH5BhpUZCaFcVaAl1X3duZCpaxmI4fJOW8UUTkeb23ThLiMR1Qt0/IhBcS9m7rAYQjbh655A==
X-Received: by 2002:a5d:5152:: with SMTP id u18mr15986534wrt.289.1617957795526; 
 Fri, 09 Apr 2021 01:43:15 -0700 (PDT)
Received: from localhost.localdomain ([2a01:e0a:90c:e290:d6f1:3413:d06b:d6a2])
 by smtp.gmail.com with ESMTPSA id
 w7sm3545504wro.43.2021.04.09.01.43.14
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Fri, 09 Apr 2021 01:43:14 -0700 (PDT)
From: Neil Armstrong <narmstrong@baylibre.com>
To: chunkuang.hu@kernel.org,
	p.zabel@pengutronix.de,
	matthias.bgg@gmail.com
Subject: [PATCH] gpu/drm: mediatek: hdmi: check for valid modes on MT8167
Date: Fri,  9 Apr 2021 10:43:08 +0200
Message-Id: <20210409084308.481185-1-narmstrong@baylibre.com>
X-Mailer: git-send-email 2.25.1
MIME-Version: 1.0
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
Cc: Neil Armstrong <narmstrong@baylibre.com>, linux-kernel@vger.kernel.org,
 dri-devel@lists.freedesktop.org, Fabien Parent <fparent@baylibre.com>,
 linux-mediatek@lists.infradead.org, linux-arm-kernel@lists.infradead.org
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

On MT8167, only CEA modes and anything using a clock below 148500 is
supported for HDMI. This change adds some checks to make sure the
video format is OK for MT8167.

Signed-off-by: Fabien Parent <fparent@baylibre.com>
Signed-off-by: Neil Armstrong <narmstrong@baylibre.com>
---
 drivers/gpu/drm/mediatek/mtk_hdmi.c | 17 +++++++++++++++++
 1 file changed, 17 insertions(+)

diff --git a/drivers/gpu/drm/mediatek/mtk_hdmi.c b/drivers/gpu/drm/mediatek/mtk_hdmi.c
index 8ee55f9e2954..991e2e935b93 100644
--- a/drivers/gpu/drm/mediatek/mtk_hdmi.c
+++ b/drivers/gpu/drm/mediatek/mtk_hdmi.c
@@ -148,6 +148,8 @@ struct hdmi_audio_param {
 
 struct mtk_hdmi_conf {
 	bool tz_disabled;
+	unsigned long max_mode_clock;
+	bool cea_modes_only;
 };
 
 struct mtk_hdmi {
@@ -1259,6 +1261,13 @@ static int mtk_hdmi_conn_mode_valid(struct drm_connector *conn,
 			return MODE_BAD;
 	}
 
+	if (hdmi->conf->cea_modes_only && !drm_match_cea_mode(mode))
+		return MODE_BAD;
+
+	if (hdmi->conf->max_mode_clock &&
+	    mode->clock > hdmi->conf->max_mode_clock)
+		return MODE_CLOCK_HIGH;
+
 	if (mode->clock < 27000)
 		return MODE_CLOCK_LOW;
 	if (mode->clock > 297000)
@@ -1810,10 +1819,18 @@ static const struct mtk_hdmi_conf mtk_hdmi_conf_mt2701 = {
 	.tz_disabled = true,
 };
 
+static const struct mtk_hdmi_conf mtk_hdmi_conf_mt8167 = {
+	.max_mode_clock = 148500,
+	.cea_modes_only = true,
+};
+
 static const struct of_device_id mtk_drm_hdmi_of_ids[] = {
 	{ .compatible = "mediatek,mt2701-hdmi",
 	  .data = &mtk_hdmi_conf_mt2701,
 	},
+	{ .compatible = "mediatek,mt8167-hdmi",
+	  .data = &mtk_hdmi_conf_mt8167,
+	},
 	{ .compatible = "mediatek,mt8173-hdmi",
 	},
 	{}
-- 
2.25.1

_______________________________________________
dri-devel mailing list
dri-devel@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/dri-devel
