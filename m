Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 34803916AF9
	for <lists+dri-devel@lfdr.de>; Tue, 25 Jun 2024 16:50:43 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 381DA10E699;
	Tue, 25 Jun 2024 14:50:40 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=baylibre-com.20230601.gappssmtp.com header.i=@baylibre-com.20230601.gappssmtp.com header.b="k1YuOSS6";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-ej1-f41.google.com (mail-ej1-f41.google.com
 [209.85.218.41])
 by gabe.freedesktop.org (Postfix) with ESMTPS id D061C10E692
 for <dri-devel@lists.freedesktop.org>; Tue, 25 Jun 2024 14:50:34 +0000 (UTC)
Received: by mail-ej1-f41.google.com with SMTP id
 a640c23a62f3a-a72517e6225so325385866b.0
 for <dri-devel@lists.freedesktop.org>; Tue, 25 Jun 2024 07:50:34 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=baylibre-com.20230601.gappssmtp.com; s=20230601; t=1719327033; x=1719931833;
 darn=lists.freedesktop.org; 
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:from:to:cc:subject:date
 :message-id:reply-to;
 bh=y8FO99+jOTZQ4oml/X5Fq9PsFL65v7oiJC3yeWK0G1A=;
 b=k1YuOSS6B5QleNtvnKo4w5+q9BqdbQ5rGhL49FgmHtnGCcPCuHRGM6F6DRcZCLhjFs
 vVxV5tafSULxkg+Veih1E9NPUfBCNjrWe5TaMw16Cl232A/1QZ5pgSydTTWTdas8L5Vp
 bAo6qyOP3UvuBP5Ltk5sE+ONNztUoaCNCa/pAgLz4Pyix+ZtjsytSBXz0RBZVM/mXjDU
 wzNM5AVZITWhGmgmN1HeBl5J2dSjC9OuBlCa0aZSW3oOfcloEFvx26fiiqeA7g/NGUnn
 jE7dLcnOxk1xtS5jrMkbFIfSrVA4p+uLQP8OCwZ0IvAwU5V/ghRFqle25l05td3QSuez
 NF7A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1719327033; x=1719931833;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=y8FO99+jOTZQ4oml/X5Fq9PsFL65v7oiJC3yeWK0G1A=;
 b=mjBXxHDM0MVU929cOEOoogiaCe7hK6KfKwKvN7GkKgZ8EJUO1dJ+4qQlETwcV5W9Ak
 IT6oxFbZXiAjNyYEegyKng3U9IkJnUqqf2LUBX8fqQmc/mx7HaK3XyOMQ48HhEZCYAO3
 qw6i7BSXFnmHy0RPHBc+VGlRSeh5rWDJVDkXvXUGNrMbbPJS8fhoavloczOyLZ8gCmeW
 cTGDuDteB+QOE37/AoQARWUvdt20UbCeWHiTl3abvReEPPSveXXkhCPUW2PQl4VW4nso
 jGnRGyzEv+uPiwGabk3D3Ij6IY5JF8onSLR22Uquvu38lf6uH7bUjnNa4+DeY2UDHbnR
 MkrQ==
X-Forwarded-Encrypted: i=1;
 AJvYcCWjR4WziZWFAPg/FL5jj9bl5VWar6ropT/EntHHNvryv6O842bZ2rFjn5inV7bQJSlz4+3mzxmgBR85tyiVHTetM6VPkBt6Sdp+NFiBLb94
X-Gm-Message-State: AOJu0Yy6VQBHor/ukp39yWonia8wFPbtHrbGbpnOBYiEGCzZuti1JkjB
 OCFFz+uU2Ax5ZZfnJfkq7eoYCCxhNknrL1fbu0GS9ndWtWu6OcCyJoQhN1RstQA=
X-Google-Smtp-Source: AGHT+IHxhm8K+90t51Ou7UOGxTWXFK96sTe4GE9XHvjFI8vmoRSsxXRqZgmnKIRXFcaKJp4IiVaRvA==
X-Received: by 2002:a17:907:a681:b0:a72:80b8:ba64 with SMTP id
 a640c23a62f3a-a7280b8bdf7mr21897566b.25.1719327033159; 
 Tue, 25 Jun 2024 07:50:33 -0700 (PDT)
Received: from toaster.lan ([2a01:e0a:3c5:5fb1:b30c:4c5e:f49e:ab33])
 by smtp.googlemail.com with ESMTPSA id
 a640c23a62f3a-a724162f037sm355945066b.194.2024.06.25.07.50.32
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Tue, 25 Jun 2024 07:50:32 -0700 (PDT)
From: Jerome Brunet <jbrunet@baylibre.com>
To: Neil Armstrong <neil.armstrong@linaro.org>,
 Maarten Lankhorst <maarten.lankhorst@linux.intel.com>,
 Maxime Ripard <mripard@kernel.org>,
 Thomas Zimmermann <tzimmermann@suse.de>, David Airlie <airlied@gmail.com>,
 Daniel Vetter <daniel@ffwll.ch>
Cc: Jerome Brunet <jbrunet@baylibre.com>, Kevin Hilman <khilman@baylibre.com>,
 linux-amlogic@lists.infradead.org, linux-kernel@vger.kernel.org,
 devicetree@vger.kernel.org, Rob Herring <robh@kernel.org>,
 Krzysztof Kozlowski <krzk+dt@kernel.org>,
 Conor Dooley <conor+dt@kernel.org>, dri-devel@lists.freedesktop.org
Subject: [PATCH 1/2] dt-bindings: display: meson-dw-hdmi: add missing
 power-domain
Date: Tue, 25 Jun 2024 16:50:14 +0200
Message-ID: <20240625145017.1003346-2-jbrunet@baylibre.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20240625145017.1003346-1-jbrunet@baylibre.com>
References: <20240625145017.1003346-1-jbrunet@baylibre.com>
MIME-Version: 1.0
X-Patchwork-Bot: notify
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

All Amlogic instances of the Synopsys HDMI controller need a power domain
enabled. This is currently missing because the Amlogic HDMI driver directly
pokes the power domain controller registers, which it should not do.

Instead The HDMI controller should use the power controller.
Fix the bindings accordingly.

Signed-off-by: Jerome Brunet <jbrunet@baylibre.com>
---
 .../devicetree/bindings/display/amlogic,meson-dw-hdmi.yaml   | 5 +++++
 1 file changed, 5 insertions(+)

diff --git a/Documentation/devicetree/bindings/display/amlogic,meson-dw-hdmi.yaml b/Documentation/devicetree/bindings/display/amlogic,meson-dw-hdmi.yaml
index 0c85894648d8..84d68b8cfccc 100644
--- a/Documentation/devicetree/bindings/display/amlogic,meson-dw-hdmi.yaml
+++ b/Documentation/devicetree/bindings/display/amlogic,meson-dw-hdmi.yaml
@@ -71,6 +71,10 @@ properties:
       - const: iahb
       - const: venci
 
+  power-domains:
+    maxItems: 1
+    description: phandle to the associated power domain
+
   resets:
     minItems: 3
 
@@ -129,6 +133,7 @@ examples:
         reset-names = "hdmitx_apb", "hdmitx", "hdmitx_phy";
         clocks = <&clk_isfr>, <&clk_iahb>, <&clk_venci>;
         clock-names = "isfr", "iahb", "venci";
+        power-domains = <&pd_vpu>;
         #address-cells = <1>;
         #size-cells = <0>;
 
-- 
2.43.0

