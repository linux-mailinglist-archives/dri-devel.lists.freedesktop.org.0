Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 4A026763EF4
	for <lists+dri-devel@lfdr.de>; Wed, 26 Jul 2023 20:50:28 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 6B3D010E4A7;
	Wed, 26 Jul 2023 18:50:26 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-ed1-x52a.google.com (mail-ed1-x52a.google.com
 [IPv6:2a00:1450:4864:20::52a])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 93C0510E4A5
 for <dri-devel@lists.freedesktop.org>; Wed, 26 Jul 2023 18:50:15 +0000 (UTC)
Received: by mail-ed1-x52a.google.com with SMTP id
 4fb4d7f45d1cf-5221b90f763so131220a12.0
 for <dri-devel@lists.freedesktop.org>; Wed, 26 Jul 2023 11:50:15 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20221208; t=1690397414; x=1691002214;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:from:to:cc:subject:date
 :message-id:reply-to;
 bh=0rexRK7W4l8v0wLlIEa95N82SjV397HKJ5Yeg85wQoY=;
 b=rHR7Fjr5s2ZyL+v0ZiEN80ULCDHd60Ht0s/fUebR0wpKmD816gIlrKyhzYVh34VWeK
 olQd2SVyUEyVegm3+6VY9T/sQ9tiJ0Fa9QPoiEo623j7KwAO0WSymOkWDXENoUlswFtv
 4gqNuLQO7eTh2wvNuVu1wjbikJNzJdpDOt+QL00nkrI3iGHx44Ji95MqYIa3s/ajLCqD
 6zfDmhJt5KE9A0iz4Q1CvHDhNPKKATx0Az7X9xmFaf4kKeZZPGT7C8QhkGAsvjPGAIOq
 aC6EMwDvlvO28eeT1gPh0E4IQxbnZKCJDOuJFzF+ky7rGE5pK9wHA6eM5zEb8uttxcO4
 0PHg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20221208; t=1690397414; x=1691002214;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=0rexRK7W4l8v0wLlIEa95N82SjV397HKJ5Yeg85wQoY=;
 b=UCu7YGBoUkdkcVKBBh2cFizX2mHSHVB/TYZ+dgSIG4lpo8RrABCBnn/JbQlLT3o2CG
 FOKVcthZPpXoB0gcRkpoERTiOqXvywrEdWR60y2R6XM3cm3ndZrxTlCSzl2psTt3dBP+
 xukfdV2+8QJEoN7/1+RGZjLdEYxGrYbNXmZEqleaWHukXMkhMAaXG/hNyqDD77NzqO7h
 OGP7Wqvir0PvPn1aB0WTpBN1o7gct+vATet2u5D4S8Sb/6ketBiVpf5vAQu7aVdrunli
 TGOf2CynGB5IyQDQGD0MaHtuIqW+GoHaElCMaC37e25RgFEPvmLXSHPU1gdrfDoJ1B1b
 vXZw==
X-Gm-Message-State: ABy/qLZb9zBYJ7KENh3WRrrQzizPrrdoMZB5pa2xZYkyOtcY8V2qAdiI
 jBPONXjuZ8hh027lOBbenjQ=
X-Google-Smtp-Source: APBJJlGZiZsN3m/zLesWuzj3qD6L6x58aHU5GUGbJfofk0Nt6MwuHCNScHOJP/779XTprGirtVjL4w==
X-Received: by 2002:aa7:da81:0:b0:522:2f8c:8953 with SMTP id
 q1-20020aa7da81000000b005222f8c8953mr17289eds.39.1690397413610; 
 Wed, 26 Jul 2023 11:50:13 -0700 (PDT)
Received: from localhost
 (p200300e41f1bd600f22f74fffe1f3a53.dip0.t-ipconnect.de.
 [2003:e4:1f1b:d600:f22f:74ff:fe1f:3a53])
 by smtp.gmail.com with ESMTPSA id
 ba28-20020a0564021adc00b0051e2670d599sm9124151edb.4.2023.07.26.11.50.13
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Wed, 26 Jul 2023 11:50:13 -0700 (PDT)
From: Thierry Reding <thierry.reding@gmail.com>
To: Laurent Pinchart <laurent.pinchart@ideasonboard.com>,
 Neil Armstrong <neil.armstrong@linaro.org>,
 Sam Ravnborg <sam@ravnborg.org>, Rob Herring <robh+dt@kernel.org>,
 Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>,
 Conor Dooley <conor+dt@kernel.org>,
 Thierry Reding <thierry.reding@gmail.com>
Subject: [PATCH 3/3] ARM: tegra: Provide specific compatible string for Nexus
 7 panel
Date: Wed, 26 Jul 2023 20:50:10 +0200
Message-ID: <20230726185010.2294709-3-thierry.reding@gmail.com>
X-Mailer: git-send-email 2.41.0
In-Reply-To: <20230726185010.2294709-1-thierry.reding@gmail.com>
References: <20230726185010.2294709-1-thierry.reding@gmail.com>
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
Cc: linux-tegra@vger.kernel.org, devicetree@vger.kernel.org,
 Svyatoslav Ryhel <clamor95@gmail.com>, dri-devel@lists.freedesktop.org,
 Jon Hunter <jonathanh@nvidia.com>
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

From: Thierry Reding <treding@nvidia.com>

panel-lvds alone is not a valid compatible string and we always need a
specific compatible string as well. Nexus 7 can come with one of (at
least) two panels, so pick one of them as the specific compatible
string.

Signed-off-by: Thierry Reding <treding@nvidia.com>
---
 .../nvidia/tegra30-asus-nexus7-grouper-common.dtsi   | 12 ++++--------
 1 file changed, 4 insertions(+), 8 deletions(-)

diff --git a/arch/arm/boot/dts/nvidia/tegra30-asus-nexus7-grouper-common.dtsi b/arch/arm/boot/dts/nvidia/tegra30-asus-nexus7-grouper-common.dtsi
index 4fa6b20c4fdb..a9342e04b14b 100644
--- a/arch/arm/boot/dts/nvidia/tegra30-asus-nexus7-grouper-common.dtsi
+++ b/arch/arm/boot/dts/nvidia/tegra30-asus-nexus7-grouper-common.dtsi
@@ -1092,15 +1092,11 @@ cpu3: cpu@3 {
 
 	display-panel {
 		/*
-		 * Nexus 7 supports two compatible panel models:
-		 *
-		 *  1. hydis,hv070wx2-1e0
-		 *  2. chunghwa,claa070wp03xg
-		 *
-		 * We want to use timing which is optimized for Nexus 7,
-		 * hence we need to customize the timing.
+		 * Some device variants come with a Hydis HV070WX2-1E0, but
+		 * since they are all largely compatible, we'll go with the
+		 * Chunghwa one here.
 		 */
-		compatible = "panel-lvds";
+		compatible = "chunghwa,claa070wp03xg", "panel-lvds";
 
 		width-mm = <94>;
 		height-mm = <150>;
-- 
2.41.0

