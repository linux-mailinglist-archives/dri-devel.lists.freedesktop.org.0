Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 2A208530E61
	for <lists+dri-devel@lfdr.de>; Mon, 23 May 2022 12:50:29 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 4FA8C10EB02;
	Mon, 23 May 2022 10:50:27 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-wm1-x32f.google.com (mail-wm1-x32f.google.com
 [IPv6:2a00:1450:4864:20::32f])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 123CB10EB02
 for <dri-devel@lists.freedesktop.org>; Mon, 23 May 2022 10:50:26 +0000 (UTC)
Received: by mail-wm1-x32f.google.com with SMTP id
 m32-20020a05600c3b2000b0039756bb41f2so33320wms.3
 for <dri-devel@lists.freedesktop.org>; Mon, 23 May 2022 03:50:25 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=baylibre-com.20210112.gappssmtp.com; s=20210112;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=BTipBQpMUHbzIB78SpRWE0aZpYF7CdaIwWlizpfEkA0=;
 b=ePI8JS1mctfDL3dO9htUkRnfmok+YrhIapLwhHYJPfR8R6GHhgxiX+EigQq0lWaOpa
 lUd2frUxdmDwV7VrhqQr91fhoNYg/dCnRsaUbXVQH/n0MSOxc2u6ym2Eo/FzjARm3FZZ
 gT+TczI/6Ypbtptd2PpNgkl04Scq72HVRoijaHEUnKF373aE9elxK0gAB/R0Up6QO3Xh
 jHMDPMiEaZfbkMsRtMjLLS+doUDFrhZavCPihsU9CxC8ITzIaWeNfpcDzlCiSHix1Kfb
 B1GW23MiJ0rJWCpI3iknt5r8G47/AngXfA0crnTiZtsLb3jjXWVeWCOZXcAjy/UlQFcP
 vVLQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=BTipBQpMUHbzIB78SpRWE0aZpYF7CdaIwWlizpfEkA0=;
 b=TPa0I2duYQTGdOOXZ9dg9ezgYv3SzmO7caL8DD54JW/iL40eZt+80RMO38Oaf0T5e4
 P22mo18njMtzOaUDXhg7LhlvGYCmrCNtMqz6bWF6CemfGxuN6rEWfg5ryUYByC/WENwf
 Dper07zYHuT6Y/GjPhHtWy0HwoOhwKmOdbWsEYVRZygzWWnWo0ZnmLx0kFTkIpQuUw2W
 HTO4+iTXQ2YGyO5NsOQmWun3PgjWWDRr+qEhPz+3RGWn/ExdMFf9bYZpnachjJJIOEtk
 9tuMn3dkhXAcmXeR4Yc0X+JrCyHxmS116cPj6ZOpSAbYwMITMVqL9qjcmkCgs5f8y63H
 9iPg==
X-Gm-Message-State: AOAM530Br8g8SEoM5xqO27Li6wng1t6y2bN3I42nfWD4ngxpQZE6qlTI
 0Argw42/Y971H3IL3cFLzJKvMA==
X-Google-Smtp-Source: ABdhPJygVo7Uq8Hm69+Q7YlNBB/Vn/rNG0nxqMPhhVn6Gufk9PmyiPIHQHKU66sNdjrJCeJcttYnEw==
X-Received: by 2002:a05:600c:348c:b0:397:4f69:775f with SMTP id
 a12-20020a05600c348c00b003974f69775fmr2120929wmq.24.1653303024598; 
 Mon, 23 May 2022 03:50:24 -0700 (PDT)
Received: from localhost.localdomain
 (2a02-8440-6141-9d1b-3074-96af-9642-0003.rev.sfr.net.
 [2a02:8440:6141:9d1b:3074:96af:9642:3])
 by smtp.gmail.com with ESMTPSA id
 n11-20020a7bc5cb000000b003942a244f38sm8453607wmk.17.2022.05.23.03.50.22
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Mon, 23 May 2022 03:50:24 -0700 (PDT)
From: Guillaume Ranquet <granquet@baylibre.com>
To: Chun-Kuang Hu <chunkuang.hu@kernel.org>,
 Philipp Zabel <p.zabel@pengutronix.de>, David Airlie <airlied@linux.ie>,
 Daniel Vetter <daniel@ffwll.ch>, Rob Herring <robh+dt@kernel.org>,
 Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>,
 Maarten Lankhorst <maarten.lankhorst@linux.intel.com>,
 Maxime Ripard <mripard@kernel.org>,
 Thomas Zimmermann <tzimmermann@suse.de>,
 Matthias Brugger <matthias.bgg@gmail.com>,
 Chunfeng Yun <chunfeng.yun@mediatek.com>,
 Kishon Vijay Abraham I <kishon@ti.com>, Vinod Koul <vkoul@kernel.org>,
 Helge Deller <deller@gmx.de>, CK Hu <ck.hu@mediatek.com>,
 Jitao shi <jitao.shi@mediatek.com>
Subject: [PATCH v10 03/21] drm/edid: Convert cea_sad helper struct to kernelDoc
Date: Mon, 23 May 2022 12:47:36 +0200
Message-Id: <20220523104758.29531-4-granquet@baylibre.com>
X-Mailer: git-send-email 2.35.1
In-Reply-To: <20220523104758.29531-1-granquet@baylibre.com>
References: <20220523104758.29531-1-granquet@baylibre.com>
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
Cc: devicetree@vger.kernel.org, linux-fbdev@vger.kernel.org,
 linux-kernel@vger.kernel.org, dri-devel@lists.freedesktop.org,
 linux-mediatek@lists.infradead.org, linux-phy@lists.infradead.org,
 linux-arm-kernel@lists.infradead.org
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

Signed-off-by: Guillaume Ranquet <granquet@baylibre.com>
---
 include/drm/drm_edid.h | 12 +++++++++---
 1 file changed, 9 insertions(+), 3 deletions(-)

diff --git a/include/drm/drm_edid.h b/include/drm/drm_edid.h
index 144c495b99c4..37c420423625 100644
--- a/include/drm/drm_edid.h
+++ b/include/drm/drm_edid.h
@@ -359,12 +359,18 @@ struct edid {
 
 #define EDID_PRODUCT_ID(e) ((e)->prod_code[0] | ((e)->prod_code[1] << 8))
 
-/* Short Audio Descriptor */
+/**
+ * struct cea_sad - Short Audio Descriptor.
+ * @format: See HDMI_AUDIO_CODING_TYPE_*.
+ * @channels: max number of channels - 1.
+ * @freq: See CEA_SAD_FREQ_*.
+ * @byte2: meaning depends on format.
+ */
 struct cea_sad {
 	u8 format;
-	u8 channels; /* max number of channels - 1 */
+	u8 channels;
 	u8 freq;
-	u8 byte2; /* meaning depends on format */
+	u8 byte2;
 };
 
 struct drm_encoder;
-- 
2.35.1

