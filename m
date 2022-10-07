Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 267955F7841
	for <lists+dri-devel@lfdr.de>; Fri,  7 Oct 2022 14:50:11 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id ADC0510E0F8;
	Fri,  7 Oct 2022 12:50:01 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-ej1-x636.google.com (mail-ej1-x636.google.com
 [IPv6:2a00:1450:4864:20::636])
 by gabe.freedesktop.org (Postfix) with ESMTPS id B00A610E0F8
 for <dri-devel@lists.freedesktop.org>; Fri,  7 Oct 2022 12:49:55 +0000 (UTC)
Received: by mail-ej1-x636.google.com with SMTP id b2so11113225eja.6
 for <dri-devel@lists.freedesktop.org>; Fri, 07 Oct 2022 05:49:55 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20210112;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:from:to:cc:subject:date
 :message-id:reply-to;
 bh=R1/Q7FM/6wVesragT+lLg++XOxeD1OeWXwDpmo+CaG4=;
 b=gaNnBrbV3Xpns8rk5Qd2ry9waUgicBEUDrQg2WurXif06s4ezs2estOIDdE2FEIiOA
 ObAzX3FwLvIYWmXxhhqpyItjUUQScNGn+4XGhSzOGzlYBzLlns9ejTj0T/ai0qtMrXm0
 Zs1/YqHVjQUvudyKHj8viF3OLGZ5ql6YW21PKR9A5J4+QgtG2KJt3h+W8A7N1lGQNkp1
 sHguNhGwf/DvgLRpiTo1kgkxhBwNK0FcB76BZyUHCkrVmspiVcbzteV/l1hVi2y2CO9G
 lnaJOupMuhh4zBKgdvVBPcT898mjZnGQgdSb5feisnV1/WUzlZXCsCG2XzBijUwbxr4+
 H2+A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=R1/Q7FM/6wVesragT+lLg++XOxeD1OeWXwDpmo+CaG4=;
 b=kTS2hRoQ1yYPy3GFK3U9Q3pIQskUUHz57vEM2Wl4Uv+VE60bAzPMpRTWtIVnYsYa8p
 UAb25TkTet2EnAyykxfsUY05p1bkQBXEm2Wsgqv3HbFYPm7h8t2/32H/lAOzatibgI8B
 u9BoPK3rsm2OqP/nbrbQson6kSBTaV+A1ukgo4UbX+wVCbTLrJujaWvpT2YIFUAl7Sr0
 moncmZU8sTqIty3mrHq/OXOp6VEyFTrh+0/PrfR6iOh72BqlhN493UwEUUxmb6tWbsfC
 Bw8t3bJ1JY5hfJspNEebyrYbECyVe6C5t06i8KyuOa3aDpvJXabnV9tcQkEhm9chVilR
 k1Mw==
X-Gm-Message-State: ACrzQf3AWlBsz4xx8V57t8jzSlOM/79lnmm5+iNm/R9izf1h369mk7MT
 hdhRVFQogf5dNcVAg4EYIr0htWv4rec=
X-Google-Smtp-Source: AMsMyM6j/Lz5Ph/6n8cFQ5VxJzYs0uHKqNXN6rVCej8vqUFmcXN0/IqXNi/OGIs9ykHYRMPeWm5aJg==
X-Received: by 2002:a17:906:5d11:b0:787:807e:5b8a with SMTP id
 g17-20020a1709065d1100b00787807e5b8amr3895992ejt.559.1665146993991; 
 Fri, 07 Oct 2022 05:49:53 -0700 (PDT)
Received: from localhost
 (p200300e41f201d00f22f74fffe1f3a53.dip0.t-ipconnect.de.
 [2003:e4:1f20:1d00:f22f:74ff:fe1f:3a53])
 by smtp.gmail.com with ESMTPSA id
 w22-20020a1709067c9600b007812ba2a360sm1186786ejo.149.2022.10.07.05.49.52
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Fri, 07 Oct 2022 05:49:53 -0700 (PDT)
From: Thierry Reding <thierry.reding@gmail.com>
To: David Airlie <airlied@linux.ie>, Daniel Vetter <daniel@ffwll.ch>,
 Rob Herring <robh+dt@kernel.org>,
 Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>,
 Thierry Reding <thierry.reding@gmail.com>
Subject: [PATCH v2 1/7] dt-bindings: display: simple-framebuffer: Support
 system memory framebuffers
Date: Fri,  7 Oct 2022 14:49:40 +0200
Message-Id: <20221007124946.406808-2-thierry.reding@gmail.com>
X-Mailer: git-send-email 2.37.3
In-Reply-To: <20221007124946.406808-1-thierry.reding@gmail.com>
References: <20221007124946.406808-1-thierry.reding@gmail.com>
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
Cc: devicetree@vger.kernel.org, dri-devel@lists.freedesktop.org,
 Jon Hunter <jonathanh@nvidia.com>, Thomas Zimmermann <tzimmermann@suse.de>,
 linux-tegra@vger.kernel.org, Robin Murphy <robin.murphy@arm.com>
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

From: Thierry Reding <treding@nvidia.com>

In order to support framebuffers residing in system memory, allow the
memory-region property to override the framebuffer memory specification
in the "reg" property.

Signed-off-by: Thierry Reding <treding@nvidia.com>
---
 .../devicetree/bindings/display/simple-framebuffer.yaml      | 5 +++++
 1 file changed, 5 insertions(+)

diff --git a/Documentation/devicetree/bindings/display/simple-framebuffer.yaml b/Documentation/devicetree/bindings/display/simple-framebuffer.yaml
index dd64f70b5014..3e9857eb002e 100644
--- a/Documentation/devicetree/bindings/display/simple-framebuffer.yaml
+++ b/Documentation/devicetree/bindings/display/simple-framebuffer.yaml
@@ -63,6 +63,11 @@ properties:
   reg:
     description: Location and size of the framebuffer memory
 
+  memory-region:
+    maxItems: 1
+    description: Phandle to a node describing the memory to be used for the
+      framebuffer. If present, overrides the "reg" property (if one exists).
+
   clocks:
     description: List of clocks used by the framebuffer.
 
-- 
2.37.3

