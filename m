Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 4F49E5BD306
	for <lists+dri-devel@lfdr.de>; Mon, 19 Sep 2022 19:01:47 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 6A39610E121;
	Mon, 19 Sep 2022 17:01:36 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-ej1-x62b.google.com (mail-ej1-x62b.google.com
 [IPv6:2a00:1450:4864:20::62b])
 by gabe.freedesktop.org (Postfix) with ESMTPS id AC5AD10E071
 for <dri-devel@lists.freedesktop.org>; Mon, 19 Sep 2022 17:00:06 +0000 (UTC)
Received: by mail-ej1-x62b.google.com with SMTP id lc7so260600ejb.0
 for <dri-devel@lists.freedesktop.org>; Mon, 19 Sep 2022 10:00:06 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=baylibre-com.20210112.gappssmtp.com; s=20210112;
 h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
 :mime-version:subject:date:from:from:to:cc:subject:date;
 bh=7ewVwlqmSZNgETsEvZqoFNhQps11G0ZAn5b60e+kwmE=;
 b=ltJHkE9qpYoLEDSN5DAx3cZgruYpelRbpwQcuaGdFUMLM3WJOSSnmHPjq0mpUqr1/z
 gQmz4aIu1+C2XCgAurWgLJcYErvdR4pZCHRjigSIHMdLj1hHPhb1eZ0uKCN3yalxK9qu
 GQSLKUQSOH+ZG7+yYGBOCRSOxQjRklDOiAYlzLZkIXtvsZWEgeOzyAm7yN5N0KoblI5a
 Chf8ShDsXCqZKzCoTAj9MlcgaigL68bvRigo9a2jipo46Rdg4R3ClF/1eroZSV1j3O6z
 CgcSBUC0Z9qbQQR/6dtC3LdupnvTBwtPW3JXZNgAEGC0PifQtmrhh69LHGp9uY59knMO
 qdZQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
 :mime-version:subject:date:from:x-gm-message-state:from:to:cc
 :subject:date;
 bh=7ewVwlqmSZNgETsEvZqoFNhQps11G0ZAn5b60e+kwmE=;
 b=A2Hf4sHvQZRzZW9lUBPH1X/n18bhos4D5Tp9/kISaM4o0ikPCry8Gt9Q/Gk9HEJwhr
 Vdo+oA6v31R9msfBN7uorIm/31KC/3bFUzlYh33Iyfhdx8HQova6c7vSg3blJ13bo9kO
 kA1ZzQloXIl9NnhhPG2C2p7aaJUj5/DQu9Zt3fa2MsgOirRFwKpKuRdpnnAq+hLYyFqa
 E+4XAvDFzdJ73Ih2kJYbf7Hed6vm+O44SaOM0JU8RZ5qnEIf9U1EUHBvzMND2fbAjsED
 zKhii+PntqlqMp2i3BkLgsujYZ4s39U3QR1nHwC5YF7CtXAXv2kwaacSlqFP4IKpOfLm
 D8Yg==
X-Gm-Message-State: ACrzQf1KEeo4Sz4GGLKq57ETSKDuBGemU6nJO4/HZrrTsvQ3MKqnJ0mL
 7OPKNYb00mJCe/dpreugYGqlSw==
X-Google-Smtp-Source: AMsMyM67IRRVMY+Suw0izTU3sRzUSrYIHC8PsOPjPY/v4kIJUR1V+xpsamXrdF60dn5nXvO6vgqnpA==
X-Received: by 2002:a17:907:72d5:b0:77d:5d01:4f4f with SMTP id
 du21-20020a17090772d500b0077d5d014f4fmr13945767ejc.285.1663606804603; 
 Mon, 19 Sep 2022 10:00:04 -0700 (PDT)
Received: from [127.0.0.1]
 (2a02-8440-6340-f287-3074-96af-9642-0003.rev.sfr.net.
 [2a02:8440:6340:f287:3074:96af:9642:3])
 by smtp.gmail.com with ESMTPSA id
 cf16-20020a0564020b9000b0044fc3c0930csm20424246edb.16.2022.09.19.10.00.02
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Mon, 19 Sep 2022 10:00:04 -0700 (PDT)
From: Guillaume Ranquet <granquet@baylibre.com>
Date: Mon, 19 Sep 2022 18:56:08 +0200
Subject: [PATCH v1 10/17] drm/mediatek: hdmi: add frame_colorimetry flag
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit
Message-Id: <20220919-v1-10-4844816c9808@baylibre.com>
References: <20220919-v1-0-4844816c9808@baylibre.com>
In-Reply-To: <20220919-v1-0-4844816c9808@baylibre.com>
To: Vinod Koul <vkoul@kernel.org>, Stephen Boyd <sboyd@kernel.org>,
 David Airlie <airlied@linux.ie>, 
 Rob Herring <robh+dt@kernel.org>, Philipp Zabel <p.zabel@pengutronix.de>,
 Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>,
 Daniel Vetter <daniel@ffwll.ch>, 
 Chunfeng Yun <chunfeng.yun@mediatek.com>, CK Hu <ck.hu@mediatek.com>,
 Jitao shi <jitao.shi@mediatek.com>, 
 Chun-Kuang Hu <chunkuang.hu@kernel.org>,
 Michael Turquette <mturquette@baylibre.com>, 
 Kishon Vijay Abraham I <kishon@ti.com>,
 Matthias Brugger <matthias.bgg@gmail.com>
X-Mailer: b4 0.10.0-dev
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
Cc: devicetree@vger.kernel.org, Guillaume Ranquet <granquet@baylibre.com>,
 Mattijs Korpershoek <mkorpershoek@baylibre.com>, linux-kernel@vger.kernel.org,
 dri-devel@lists.freedesktop.org, linux-clk@vger.kernel.org,
 linux-mediatek@lists.infradead.org, linux-phy@lists.infradead.org,
 Pablo Sun <pablo.sun@mediatek.com>, linux-arm-kernel@lists.infradead.org
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

Add a flag to indicate support for frame colorimetry.

Signed-off-by: Guillaume Ranquet <granquet@baylibre.com>

diff --git a/drivers/gpu/drm/mediatek/mtk_hdmi_common.c b/drivers/gpu/drm/mediatek/mtk_hdmi_common.c
index 30407603d693..9fe086e2cd7c 100644
--- a/drivers/gpu/drm/mediatek/mtk_hdmi_common.c
+++ b/drivers/gpu/drm/mediatek/mtk_hdmi_common.c
@@ -120,6 +120,17 @@ int mtk_hdmi_setup_avi_infoframe(struct mtk_hdmi *hdmi, u8 *buffer, size_t bufsz
 		return err;
 	}
 
+	if (hdmi->conf->has_frame_colorimetry) {
+		frame.colorimetry = hdmi->colorimtery;
+		if (frame.colorimetry == HDMI_COLORIMETRY_EXTENDED)
+			frame.extended_colorimetry = hdmi->extended_colorimetry;
+
+		/* quantiation range:limited or full */
+		if (frame.colorspace == HDMI_COLORSPACE_RGB)
+			frame.quantization_range = hdmi->quantization_range;
+		else
+			frame.ycc_quantization_range = hdmi->ycc_quantization_range;
+	}
 	err = hdmi_avi_infoframe_pack(&frame, buffer, bufsz);
 
 	if (err < 0) {
diff --git a/drivers/gpu/drm/mediatek/mtk_hdmi_common.h b/drivers/gpu/drm/mediatek/mtk_hdmi_common.h
index 62a14435be69..75a9b62dccee 100644
--- a/drivers/gpu/drm/mediatek/mtk_hdmi_common.h
+++ b/drivers/gpu/drm/mediatek/mtk_hdmi_common.h
@@ -33,6 +33,7 @@ struct mtk_hdmi_conf {
 	bool cea_modes_only;
 	bool has_cec;
 	bool has_connector;
+	bool has_frame_colorimetry;
 	unsigned long max_mode_clock;
 	const struct drm_bridge_funcs *bridge_funcs;
 	void (*mtk_hdmi_output_init)(struct mtk_hdmi *hdmi);

-- 
b4 0.10.0-dev
