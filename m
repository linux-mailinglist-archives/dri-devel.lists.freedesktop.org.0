Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 796C39689D4
	for <lists+dri-devel@lfdr.de>; Mon,  2 Sep 2024 16:24:38 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 2538A10E316;
	Mon,  2 Sep 2024 14:24:35 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=huaqin-corp-partner-google-com.20230601.gappssmtp.com header.i=@huaqin-corp-partner-google-com.20230601.gappssmtp.com header.b="P5eTzKek";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-oo1-f52.google.com (mail-oo1-f52.google.com
 [209.85.161.52])
 by gabe.freedesktop.org (Postfix) with ESMTPS id C261910E2E5
 for <dri-devel@lists.freedesktop.org>; Mon,  2 Sep 2024 12:55:22 +0000 (UTC)
Received: by mail-oo1-f52.google.com with SMTP id
 006d021491bc7-5e174925b7bso294127eaf.0
 for <dri-devel@lists.freedesktop.org>; Mon, 02 Sep 2024 05:55:22 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=huaqin-corp-partner-google-com.20230601.gappssmtp.com; s=20230601;
 t=1725281722; x=1725886522; darn=lists.freedesktop.org; 
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:from:to:cc:subject:date
 :message-id:reply-to;
 bh=VPpt6ERaV9w0t5on/zQBb5NLjkmrrGxBn+wH2mAAexM=;
 b=P5eTzKekYCVIZlo07Bg5txu0PaqWJtuEC192Vva1kUkVo0f/f/QxrglAeQ1CiuArcq
 VPj0ZWLu5ZM1b88kRccm1BC3xzvOzOUwBNteeJoCPkHdTCEiSr56FZekg+v3/Nmgnv5Y
 lrjs+eUNCl1kD7RAIMXw/bQdkgBYtAWcz+zVNg7X4Wu48BehzI9sEQiYbk7WGxBdCMDv
 Kpw5pn38JYqgoU952f8GDBk/DqT2w1aYf7hLSYh2LnMhk3TnFjLkhRITsRxFgIORYhgt
 RMrE+yBw0QgMG8EERJYAzyNr9LFywCE/o7DBeb1e874F0W5gJZulyZf9xPQRr0nD+Dl8
 wZnA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1725281722; x=1725886522;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=VPpt6ERaV9w0t5on/zQBb5NLjkmrrGxBn+wH2mAAexM=;
 b=qCQ+sRXfXIoKgh5p3Ao6A3wrGA2bE7jbFzRgK70f/WPRB5tu/Gc8pXhJ/UM0Dm1FzL
 GDgVO3Rqd3NX2tLiKacRgtezvo2t3AYSF/Vhi7+Weklye78c52Yb5J8gHkt0+V4n+vds
 wBaO8NSEmTHHFQWo6TPf33hgbj4hWQZgZn2zfh1tHc5k7dUEJo6V3PwJ90j/lvJ7hdt2
 MiMWZp4mUxCh7Tioovz8KRlreuSG9NQbD19tXtV9e1lKb5s6AMSGjLVjrDZ8vbcuH9R/
 pikBH/RWMCutjp66hSQobxhEdlv+krsH9LMJ2luPiC23Bugb1FHiNPZ0Hj6fM4vYsxsx
 UCZg==
X-Gm-Message-State: AOJu0YwINML/Koye6AY94w17YkyPRs5oBvF8NfmaaZIWNOtSFZpv0O3R
 mU/L63/waX2lpjEUlPtz3Q+1QcIgtOgQghLNAN0Zyd6cl9Yw6qWWnlWtnrpOrTg=
X-Google-Smtp-Source: AGHT+IGr00NuDQhakxmJAzU0K4ojhOQayR1MHWGLdctFGDN+ZUiOb8N4gaCw9OaVLmU7bGwt9lpj8Q==
X-Received: by 2002:a05:6870:808c:b0:261:21e9:1f0f with SMTP id
 586e51a60fabf-277c81eceb5mr7979247fac.36.1725281721745; 
 Mon, 02 Sep 2024 05:55:21 -0700 (PDT)
Received: from zjn.huaqin.com ([116.66.212.162])
 by smtp.gmail.com with ESMTPSA id
 d2e1a72fcca58-715e55a99eesm6773955b3a.50.2024.09.02.05.55.18
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Mon, 02 Sep 2024 05:55:21 -0700 (PDT)
From: Jianeng Ceng <cengjianeng@huaqin.corp-partner.google.com>
To: angelogioacchino.delregno@collabora.com, matthias.bgg@gmail.com,
 robh@kernel.org, krzk+dt@kernel.org, conor+dt@kernel.org,
 knoxchiou@google.com, hsinyi@google.com
Cc: dri-devel@lists.freedesktop.org, devicetree@vger.kernel.org,
 linux-kernel@vger.kernel.org,
 Jianeng Ceng <cengjianeng@huaqin.corp-partner.google.com>
Subject: [PATCH v1 1/2] dt-bindings: arm: mediatek: Add MT8186 Ponyta
 Chromebook
Date: Mon,  2 Sep 2024 20:55:01 +0800
Message-Id: <20240902125502.1844374-2-cengjianeng@huaqin.corp-partner.google.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20240902125502.1844374-1-cengjianeng@huaqin.corp-partner.google.com>
References: <20240902125502.1844374-1-cengjianeng@huaqin.corp-partner.google.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Mailman-Approved-At: Mon, 02 Sep 2024 14:24:34 +0000
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

Add an entry for the MT8186 based Ponyta Chromebook (custom lable).

Signed-off-by: Jianeng Ceng <cengjianeng@huaqin.corp-partner.google.com>
---
 Documentation/devicetree/bindings/arm/mediatek.yaml | 11 +++++++++++
 1 file changed, 11 insertions(+)

diff --git a/Documentation/devicetree/bindings/arm/mediatek.yaml b/Documentation/devicetree/bindings/arm/mediatek.yaml
index 1d4bb50fcd8d..410145976272 100644
--- a/Documentation/devicetree/bindings/arm/mediatek.yaml
+++ b/Documentation/devicetree/bindings/arm/mediatek.yaml
@@ -257,6 +257,17 @@ properties:
           - const: google,steelix-sku393218
           - const: google,steelix
           - const: mediatek,mt8186
+      - description: Google Ponyta (Custom lable)
+        items:
+          - const: google,ponyta-sku0
+          - const: google,ponyta-sku2147483647
+          - const: google,ponyta
+          - const: mediatek,mt8186
+      - description: Google Ponyta (Custom lable)
+        items:
+          - const: google,ponyta-sku1
+          - const: google,ponyta
+          - const: mediatek,mt8186
       - description: Google Rusty (Lenovo 100e Chromebook Gen 4)
         items:
           - const: google,steelix-sku196609
-- 
2.34.1

