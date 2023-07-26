Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id DA8C6763EF3
	for <lists+dri-devel@lfdr.de>; Wed, 26 Jul 2023 20:50:23 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id DCCBB10E4A5;
	Wed, 26 Jul 2023 18:50:21 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-ej1-x632.google.com (mail-ej1-x632.google.com
 [IPv6:2a00:1450:4864:20::632])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 9125B10E4A2
 for <dri-devel@lists.freedesktop.org>; Wed, 26 Jul 2023 18:50:14 +0000 (UTC)
Received: by mail-ej1-x632.google.com with SMTP id
 a640c23a62f3a-99b9161b94aso4592266b.1
 for <dri-devel@lists.freedesktop.org>; Wed, 26 Jul 2023 11:50:14 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20221208; t=1690397413; x=1691002213;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:from:to:cc:subject:date
 :message-id:reply-to;
 bh=f62RqWYsatRt5RpRPjku57LO8s+uZRE+9DbIxaga5P8=;
 b=EZyK9oc/Vr5ReznYmiymcOox8FLRtpKEOT34Z3PnEDKE3Pf/tdzL7OP85NXdc0hjWY
 Aez4trkAUQ9LwCR4SF3XfGODHWOQIOin2g/aVj4Zyglk1e5OIWqsMry7pwIeo4i9BnOK
 OkKmLLSq4Ao3ZhgMrRUOcF2fPHrvsn6bnOfoDPUsCKlbVYXbajmmPxmO351iLG49gew3
 z2Nhq82RB9heKXpu/dwXzpD0bzuK37YcyI49/xrvNRDFcPmtexLi3injfb1BjZ2ACLsp
 K/c37eb+25eWsuz0NhLJ6ITJCbQ04hPdsiz8NvQoPnIzi8F4hWGV2PEQRtCzTQIu1loJ
 7WmQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20221208; t=1690397413; x=1691002213;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=f62RqWYsatRt5RpRPjku57LO8s+uZRE+9DbIxaga5P8=;
 b=OhNBMpZShT0KH3ppqoqh9IbPZLl6YDqM321wH13eqWh7NcTyzOFoVgemtRNrHP0jJY
 Lb5XcqL4AEzrFoo+jUGJVPlPv0xt/4gcDPBjhYxsQFRg4U4hMNOzn+TT6Z6QHX1DgtCj
 3sX2/1H6ANMuZe4RyeKrMcitOQGwJh1HOsseQnpT6VTcWtmOIIsmBFzyLcIJJOG/gQUk
 STo024D4PfpMC6Ta+gk0lsuxVAYVrBaRxcWIqq2fzPBq8A8s33iU1CFZ2PtoY82T1NCY
 nFHroQoxegP4rWzCKZtEAuItELRpGLe6CDyr778XNVbMAB6InwsDy0TReiG1sPyj+8Vj
 Fc/A==
X-Gm-Message-State: ABy/qLa4nbTreaVpZFEiXqI1QFZMEFvSplzqAGPrhluQK44H9i3K4Vqw
 nl/s9D3pzSTV6Yw6+4KMBiI=
X-Google-Smtp-Source: APBJJlHeFBkcAemKhyOTV1D25kEi0uNzpW2Hcam9+K/ey9aGbUr4D+3cnvihuDdXS17bIJ/uyP8l+A==
X-Received: by 2002:a17:906:c1:b0:975:63f4:4b with SMTP id
 1-20020a17090600c100b0097563f4004bmr29502eji.36.1690397412632; 
 Wed, 26 Jul 2023 11:50:12 -0700 (PDT)
Received: from localhost
 (p200300e41f1bd600f22f74fffe1f3a53.dip0.t-ipconnect.de.
 [2003:e4:1f1b:d600:f22f:74ff:fe1f:3a53])
 by smtp.gmail.com with ESMTPSA id
 n26-20020a170906165a00b00992b2c5598csm9872423ejd.128.2023.07.26.11.50.11
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Wed, 26 Jul 2023 11:50:12 -0700 (PDT)
From: Thierry Reding <thierry.reding@gmail.com>
To: Laurent Pinchart <laurent.pinchart@ideasonboard.com>,
 Neil Armstrong <neil.armstrong@linaro.org>,
 Sam Ravnborg <sam@ravnborg.org>, Rob Herring <robh+dt@kernel.org>,
 Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>,
 Conor Dooley <conor+dt@kernel.org>,
 Thierry Reding <thierry.reding@gmail.com>
Subject: [PATCH 2/3] dt-bindings: display: panel: Document Hydis HV070WX2-1E0
Date: Wed, 26 Jul 2023 20:50:09 +0200
Message-ID: <20230726185010.2294709-2-thierry.reding@gmail.com>
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

The Hydis HV070WX2-1E0 is a 7" WXGA (800x1280) TFT LCD LVDS panel that
is one of the variants used on Google Nexus 7.

Signed-off-by: Thierry Reding <treding@nvidia.com>
---
 Documentation/devicetree/bindings/display/panel/panel-lvds.yaml | 2 ++
 1 file changed, 2 insertions(+)

diff --git a/Documentation/devicetree/bindings/display/panel/panel-lvds.yaml b/Documentation/devicetree/bindings/display/panel/panel-lvds.yaml
index dbbf32a8be87..9f1016551e0b 100644
--- a/Documentation/devicetree/bindings/display/panel/panel-lvds.yaml
+++ b/Documentation/devicetree/bindings/display/panel/panel-lvds.yaml
@@ -44,6 +44,8 @@ properties:
           - chunghwa,claa070wp03xg
           # HannStar Display Corp. HSD101PWW2 10.1" WXGA (1280x800) LVDS panel
           - hannstar,hsd101pww2
+          # Hydis Technologies 7" WXGA (800x1280) TFT LCD LVDS panel
+          - hydis,hv070wx2-1e0
           - tbs,a711-panel
 
       - const: panel-lvds
-- 
2.41.0

