Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 3AE3984EE45
	for <lists+dri-devel@lfdr.de>; Fri,  9 Feb 2024 01:17:44 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 0AE2010EA8D;
	Fri,  9 Feb 2024 00:17:38 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=gmail.com header.i=@gmail.com header.b="alBPcwmm";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-ua1-f42.google.com (mail-ua1-f42.google.com
 [209.85.222.42])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 5C9D810EAAF
 for <dri-devel@lists.freedesktop.org>; Fri,  9 Feb 2024 00:17:35 +0000 (UTC)
Received: by mail-ua1-f42.google.com with SMTP id
 a1e0cc1a2514c-7d2e007751eso175471241.1
 for <dri-devel@lists.freedesktop.org>; Thu, 08 Feb 2024 16:17:35 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20230601; t=1707437854; x=1708042654; darn=lists.freedesktop.org;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:from:to:cc:subject:date
 :message-id:reply-to;
 bh=zGPCYfl6jkizLcJNy3cF1Tzjj2+VVbxR8rofDxR90Kw=;
 b=alBPcwmmmQ5rFcrg1/LqHnjN4msML5YOMIOPqosmOBRu20VMJ9jbDYiaP7Dk4frcHj
 9tux2BDDiyofwqAaEN2XrB+hfzWrZLeyWpOt1A77tYNIAluDtvORM+ThnF/UbMal6zD8
 k0ASda2DfDIEognJ1fnpQQzy4OvmnIcDtdTiQU2w0gM4Qf/5L6qYrhu1aXoMLvNIO1eh
 51jstGgjn6/vXuwMZdAFB9AI1htL/PpL18shrXy/jZRKP9xqNl+FWmKOlNR5KMXSkKf0
 QiHF3LwnNtXOnZ9VQPIsEBsgGb/31ogBhSZxgRd3lDoa6MBb2y2O8Nvl5iotKHoE1UQF
 LA1w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1707437854; x=1708042654;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=zGPCYfl6jkizLcJNy3cF1Tzjj2+VVbxR8rofDxR90Kw=;
 b=CAyGenVJD1pCXdeR/6RN3jf7gbViHg1biR0WpGM7nM/aB7JyaXxQMS+zhUjMaSK4O+
 vcRjMlM1N8GN7OLGrYeCI78rJtcGkXkKEuBGHD2PF2rgss39snHwJSLOwJb1XjwRioEp
 1EESi5tEjdOgUEPv5TDvqEInP+fZkJ43OJ64pd4hdWFhiuO0s60aH2AHkyminAr5HJIY
 yN+OHfQiOfyLMId5yHPkB0ft2w3Gy/QjB1kITyOUx5woyRs2UMtNInoJ4K4qGIzXNfmy
 D3yJwn+Zb2lTtXInmYYsGknucBdyjzZX8zNdKd1q4ZpAaV9ti0elAHo0KDKgaefY1WIO
 nZ0g==
X-Gm-Message-State: AOJu0YwaEujSoXTuKfxp5YYM2Y/cFpoP64iEuzpL/tpaEDukykkWjH3w
 IXs9deR9d5yGfTD5mlBrZbK/DM5yGiEae72UMmpW2pz41JUxs8J5
X-Google-Smtp-Source: AGHT+IFQLJIJJYHAosyjO/LKhn9BM1hYHw9cGKBoo4dKEQeGaxZAwSv0pHA/+6SsjUQ5jkLcnh+UCA==
X-Received: by 2002:a05:6102:32d1:b0:46d:606e:6323 with SMTP id
 o17-20020a05610232d100b0046d606e6323mr1147551vss.2.1707437854421; 
 Thu, 08 Feb 2024 16:17:34 -0800 (PST)
X-Forwarded-Encrypted: i=1;
 AJvYcCXaG+0KPNKYwMBnfTafKLbOXco7l5jk14UkfdoUmWkFNv1s2BK0jO1hpo2hPxs7cdfZn+kuIVs7tzRkkSvGk2X/8+R6QtNFjIMK7wecD7SPPPDozRkcusqQ9LQrDIyF39qH77hGHhcrUOgHD0coAjfjMU2TU8STy4s27BVf0LamXUiIcJTfMaLL3MD7GAOKcFVh/fkIiKclRyTcXrkSLP6afSQUI3ZSWUTsizAMWG2mEtsvNo0E0gJF1o1uMSJSprUH8mFggE3lwhaaj1t64k0TW93zE84nrr/FSGslcvXXhHs48V0t5y1/5gW7TItpXgonWucgQyBgrJPBtI08BSalSPDM+FVPJ56joZjt4EK7T2Hri0erRpe6/kJ2WPIL2aQpNyYIvvNH5vYsWmDJDzlXKi3N4XqorpfnDGwldpy6KpolhhkkYdy9lzzcaz9QFG3cZRolQoBIuSA1R84tVGFLbQVO1ealOoLGbSAliGI2HCLYmwbUAhHwiFCDKjpqMdykelO9V0M+eV5i04LZb3yHYHXwexuoagxjbKARCjdWUDggDRSycwOFz5U+/6zflGrSR0SfpcHpEVpV
Received: from localhost ([2607:fea8:52a3:d200::42b6])
 by smtp.gmail.com with ESMTPSA id
 ks23-20020a056214311700b0068c87402da6sm291099qvb.14.2024.02.08.16.17.33
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Thu, 08 Feb 2024 16:17:33 -0800 (PST)
From: Richard Acayan <mailingradian@gmail.com>
To: Neil Armstrong <neil.armstrong@linaro.org>,
 Jessica Zhang <quic_jesszhan@quicinc.com>, Sam Ravnborg <sam@ravnborg.org>,
 David Airlie <airlied@gmail.com>, Daniel Vetter <daniel@ffwll.ch>,
 Maarten Lankhorst <maarten.lankhorst@linux.intel.com>,
 Maxime Ripard <mripard@kernel.org>,
 Thomas Zimmermann <tzimmermann@suse.de>, Rob Herring <robh@kernel.org>,
 Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>,
 Conor Dooley <conor+dt@kernel.org>, Bjorn Andersson <andersson@kernel.org>,
 Konrad Dybcio <konrad.dybcio@linaro.org>,
 Thierry Reding <thierry.reding@gmail.com>, dri-devel@lists.freedesktop.org,
 devicetree@vger.kernel.org, linux-arm-msm@vger.kernel.org
Cc: Richard Acayan <mailingradian@gmail.com>
Subject: [PATCH 1/3] dt-bindings: display: panel-simple-dsi: add s6e3fa7
 ams559nk06 compat
Date: Thu,  8 Feb 2024 19:16:42 -0500
Message-ID: <20240209001639.387374-7-mailingradian@gmail.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20240209001639.387374-6-mailingradian@gmail.com>
References: <20240209001639.387374-6-mailingradian@gmail.com>
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
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

The Samsung S6E3FA7 display controller and AMS559NK06 panel are used for
the display in Pixel 3a devices. Add the compatible for it.

Signed-off-by: Richard Acayan <mailingradian@gmail.com>
---
 .../devicetree/bindings/display/panel/panel-simple-dsi.yaml     | 2 ++
 1 file changed, 2 insertions(+)

diff --git a/Documentation/devicetree/bindings/display/panel/panel-simple-dsi.yaml b/Documentation/devicetree/bindings/display/panel/panel-simple-dsi.yaml
index f9160d7bac3c..d3abd7f4ebcd 100644
--- a/Documentation/devicetree/bindings/display/panel/panel-simple-dsi.yaml
+++ b/Documentation/devicetree/bindings/display/panel/panel-simple-dsi.yaml
@@ -50,6 +50,8 @@ properties:
       - panasonic,vvx10f004b00
         # Panasonic 10" WUXGA TFT LCD panel
       - panasonic,vvx10f034n00
+        # Samsung s6e3fa7 1080x2220 based AMS559NK06 AMOLED panel
+      - samsung,s6e3fa7-ams559nk06
         # Samsung s6e3fc2x01 1080x2340 AMOLED panel
       - samsung,s6e3fc2x01
         # Samsung sofef00 1080x2280 AMOLED panel
-- 
2.43.0

