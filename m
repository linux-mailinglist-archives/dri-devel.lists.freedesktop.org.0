Return-Path: <dri-devel-bounces@lists.freedesktop.org>
Delivered-To: lists+dri-devel@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id 6MouGZuCg2llowMAu9opvQ
	(envelope-from <dri-devel-bounces@lists.freedesktop.org>)
	for <lists+dri-devel@lfdr.de>; Wed, 04 Feb 2026 18:32:11 +0100
X-Original-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id DC495EB012
	for <lists+dri-devel@lfdr.de>; Wed, 04 Feb 2026 18:32:10 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 028CA10E710;
	Wed,  4 Feb 2026 17:32:09 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (1024-bit key; unprotected) header.d=amarulasolutions.com header.i=@amarulasolutions.com header.b="gvU0rmz8";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-wr1-f42.google.com (mail-wr1-f42.google.com
 [209.85.221.42])
 by gabe.freedesktop.org (Postfix) with ESMTPS id CB67510E710
 for <dri-devel@lists.freedesktop.org>; Wed,  4 Feb 2026 17:32:07 +0000 (UTC)
Received: by mail-wr1-f42.google.com with SMTP id
 ffacd0b85a97d-435a11957f6so112116f8f.0
 for <dri-devel@lists.freedesktop.org>; Wed, 04 Feb 2026 09:32:07 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=amarulasolutions.com; s=google; t=1770226326; x=1770831126;
 darn=lists.freedesktop.org; 
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:from:to:cc:subject:date
 :message-id:reply-to;
 bh=n/hVz7nlruTnhdI8UkrlZIFLUp/mnqXEgc1farN/t6k=;
 b=gvU0rmz8mC9jeEGWKlz1Ug8NVYf/N7HiSJyO4ctV1jo6XCtgCdE8q1D78gKyhX0G1p
 GGSecmmSnFLk7VTOpMwFejB+Dc6S+TNBaIB/ZBsnn9S1IUF+sCKlbOLOVx4KOfMgHHIB
 DDCH7vZlYopIndMNeNTHDum5SfmfG5QCUdC7w=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1770226326; x=1770831126;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
 :to:cc:subject:date:message-id:reply-to;
 bh=n/hVz7nlruTnhdI8UkrlZIFLUp/mnqXEgc1farN/t6k=;
 b=Uxbnu4Mx+89P2s3RAwvjXHcMma5GZPvUQmDZro57AHDLGykJHKQC5jCXN01W+DjFWb
 AzlR7T0PQdrG/+rV50v72eeJGNc2vJnuumhy1phDOt5WpbZauusgrt57FMyQlYXDKS35
 kDQL55ds6olSwUFer4Ne/0pT2Z8ujjwaThUITmDDvv7QQrscYJArTeaJgRdvcewuZMZf
 x22B7BBMw0+rM+ZvFkLEIdzxUxmAv6PC4libaXtskqytpCBEpCL9l5FDHFwuzYA0fBZl
 o01YhSpg+D20P2xJLUgoHfiZ/qeUlpcAjMXWqJ968GJyI5pXjNFN4tzNTXUzNrGEaCHj
 XAsg==
X-Forwarded-Encrypted: i=1;
 AJvYcCXu14Cqrn4a9rzuPEgWUV0VK+mX06J1gizd0ZheRTy4hH1VTW/hMQWgGFvIVD3W0HGCI03IEP8KgE0=@lists.freedesktop.org
X-Gm-Message-State: AOJu0YyYFo5nwlwNOvcVRRZ9AQ2coVPcD4Lk22jVXZu8B2D8oduq+BiK
 pWOlEEEFPJuCVIVQXB5MGDOMen0pCw9xe6w3iMOcYadEKoT+2n1C/3l0hwSsl9+jiVg=
X-Gm-Gg: AZuq6aJibDEE5pfGR+p3TfrLEoEKeuB852u34mCDLCJMZnd+gQ0Qng89W+he9rkDNEa
 qfr832uLXJ0oqqCxpdGeS8LBASlT3ALmAwwKbpi26A4uHyqa0kFoakSJ7N2aar13TboTh1Dc6nv
 cCu3BPpxY405e/jbn2CHg3C/mo0CWkKR15Yb2CA1mv2IC0DlqpmcIv19+dcMZWx7xucoGzjqEk1
 0ePEgX3JAS7Qug4LTBbcU7n83CxlJTfoNX8nRv6fG7YiJWN3jsZPBhFNQrWGzrHlkTuW68bAGJi
 hN+heOxHqYUyxX2LuHcuTaIWDkI3RO1S0J4GIY1N1x6kX9v7ewuszvfevwgWSRVIV4jaDmNxeIK
 K1MZDnotfzFgKNWUaB/3DCYl///akfY4ydntuXUImZH3cposSJNT5JVz6N2oN3oHMNK5dy4YTYD
 PWEfNvYhGx9z1DFBn609DQK8mWuWe6+LaX1+cl73IX7hFqMQoLqnwODCo7gUKe6JgtWtcDtVfGP
 XWTIAiRl+Lj0yObIYVceuj6X5QSTWlbTKrTus+K/Ic3
X-Received: by 2002:a05:6000:26ce:b0:435:9851:d940 with SMTP id
 ffacd0b85a97d-43618061743mr4794667f8f.59.1770226326280; 
 Wed, 04 Feb 2026 09:32:06 -0800 (PST)
Received: from dario-ThinkPad-P14s-Gen-5.amarulasolutions.com ([2.196.42.58])
 by smtp.gmail.com with ESMTPSA id
 ffacd0b85a97d-436180640f2sm7241565f8f.39.2026.02.04.09.32.03
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Wed, 04 Feb 2026 09:32:04 -0800 (PST)
From: Dario Binacchi <dario.binacchi@amarulasolutions.com>
To: linux-kernel@vger.kernel.org
Cc: linux-amarula@amarulasolutions.com,
 Dario Binacchi <dario.binacchi@amarulasolutions.com>,
 Rob Herring <robh@kernel.org>, Conor Dooley <conor+dt@kernel.org>,
 David Airlie <airlied@gmail.com>, Jessica Zhang <jesszhan0024@gmail.com>,
 Krzysztof Kozlowski <krzk+dt@kernel.org>,
 Maarten Lankhorst <maarten.lankhorst@linux.intel.com>,
 Maxime Ripard <mripard@kernel.org>, Michael Walle <mwalle@kernel.org>,
 Neil Armstrong <neil.armstrong@linaro.org>,
 Simona Vetter <simona@ffwll.ch>, Thomas Zimmermann <tzimmermann@suse.de>,
 devicetree@vger.kernel.org, dri-devel@lists.freedesktop.org
Subject: [PATCH v4 3/4] dt-bindings: ili9806e: add Rocktech RK050HR345-CT106A
 display
Date: Wed,  4 Feb 2026 18:31:19 +0100
Message-ID: <20260204173154.337674-4-dario.binacchi@amarulasolutions.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20260204173154.337674-1-dario.binacchi@amarulasolutions.com>
References: <20260204173154.337674-1-dario.binacchi@amarulasolutions.com>
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
X-Rspamd-Server: lfdr
X-Spamd-Result: default: False [1.69 / 15.00];
	SUSPICIOUS_RECIPS(1.50)[];
	MID_CONTAINS_FROM(1.00)[];
	R_MISSING_CHARSET(0.50)[];
	DMARC_POLICY_ALLOW(-0.50)[amarulasolutions.com,none];
	R_SPF_ALLOW(-0.20)[+ip4:131.252.210.177:c];
	R_DKIM_ALLOW(-0.20)[amarulasolutions.com:s=google];
	MAILLIST(-0.20)[mailman];
	RWL_MAILSPIKE_GOOD(-0.10)[131.252.210.177:from];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	RCVD_TLS_LAST(0.00)[];
	MIME_TRACE(0.00)[0:+];
	RCPT_COUNT_TWELVE(0.00)[16];
	FORGED_SENDER(0.00)[dario.binacchi@amarulasolutions.com,dri-devel-bounces@lists.freedesktop.org];
	FORWARDED(0.00)[dri-devel@lists.freedesktop.org];
	FORGED_RECIPIENTS(0.00)[m:linux-kernel@vger.kernel.org,m:linux-amarula@amarulasolutions.com,m:dario.binacchi@amarulasolutions.com,m:robh@kernel.org,m:conor+dt@kernel.org,m:airlied@gmail.com,m:jesszhan0024@gmail.com,m:krzk+dt@kernel.org,m:maarten.lankhorst@linux.intel.com,m:mripard@kernel.org,m:mwalle@kernel.org,m:neil.armstrong@linaro.org,m:simona@ffwll.ch,m:tzimmermann@suse.de,m:devicetree@vger.kernel.org,m:conor@kernel.org,m:krzk@kernel.org,s:lists@lfdr.de];
	RCVD_COUNT_THREE(0.00)[4];
	ARC_NA(0.00)[];
	FREEMAIL_CC(0.00)[amarulasolutions.com,kernel.org,gmail.com,linux.intel.com,linaro.org,ffwll.ch,suse.de,vger.kernel.org,lists.freedesktop.org];
	DKIM_TRACE(0.00)[amarulasolutions.com:+];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	FORGED_SENDER_FORWARDING(0.00)[];
	PREVIOUSLY_DELIVERED(0.00)[dri-devel@lists.freedesktop.org];
	FROM_NEQ_ENVFROM(0.00)[dario.binacchi@amarulasolutions.com,dri-devel-bounces@lists.freedesktop.org];
	FROM_HAS_DN(0.00)[];
	TO_DN_SOME(0.00)[];
	NEURAL_HAM(-0.00)[-1.000];
	TAGGED_RCPT(0.00)[dri-devel,dt];
	FORGED_RECIPIENTS_FORWARDING(0.00)[];
	ASN(0.00)[asn:6366, ipnet:131.252.0.0/16, country:US];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	FORGED_SENDER_MAILLIST(0.00)[]
X-Rspamd-Queue-Id: DC495EB012
X-Rspamd-Action: no action

Document the Rocktech 5" 480x854 panel based on the Ilitek ILI9806E
controller.

This panel uses SPI for control and an RGB interface for display
data, so adjust the binding requirements accordingly.

Reviewed-by: Rob Herring (Arm) <robh@kernel.org>
Signed-off-by: Dario Binacchi <dario.binacchi@amarulasolutions.com>

---

(no changes since v3)

Changes in v3:
- Add Reviewed-by tag of Rob Herring

Changes in v2:
- Restore vdd-supply as required for both DSI and SPI types
- Dop useless settings in case of rocktech,rk050hr345-ct106a

 .../display/panel/ilitek,ili9806e.yaml        | 38 ++++++++++++++++++-
 1 file changed, 36 insertions(+), 2 deletions(-)

diff --git a/Documentation/devicetree/bindings/display/panel/ilitek,ili9806e.yaml b/Documentation/devicetree/bindings/display/panel/ilitek,ili9806e.yaml
index f80307579485..2080d9e0ffac 100644
--- a/Documentation/devicetree/bindings/display/panel/ilitek,ili9806e.yaml
+++ b/Documentation/devicetree/bindings/display/panel/ilitek,ili9806e.yaml
@@ -4,7 +4,7 @@
 $id: http://devicetree.org/schemas/display/panel/ilitek,ili9806e.yaml#
 $schema: http://devicetree.org/meta-schemas/core.yaml#
 
-title: Ilitek ILI9806E based MIPI-DSI panels
+title: Ilitek ILI9806E based panels
 
 maintainers:
   - Michael Walle <mwalle@kernel.org>
@@ -18,6 +18,7 @@ properties:
       - enum:
           - densitron,dmt028vghmcmi-1d
           - ortustech,com35h3p70ulc
+          - rocktech,rk050hr345-ct106a
       - const: ilitek,ili9806e
 
   reg:
@@ -30,11 +31,24 @@ required:
   - compatible
   - reg
   - vdd-supply
-  - vccio-supply
   - reset-gpios
   - backlight
   - port
 
+if:
+  properties:
+    compatible:
+      contains:
+        enum:
+          - rocktech,rk050hr345-ct106a
+then:
+  $ref: /schemas/spi/spi-peripheral-props.yaml#
+  required:
+    - spi-max-frequency
+else:
+  required:
+    - vccio-supply
+
 unevaluatedProperties: false
 
 examples:
@@ -60,5 +74,25 @@ examples:
             };
         };
     };
+  - |
+    #include <dt-bindings/gpio/gpio.h>
+
+    spi {
+        #address-cells = <1>;
+        #size-cells = <0>;
 
+        panel@0 {
+            compatible = "rocktech,rk050hr345-ct106a", "ilitek,ili9806e";
+            reg = <0>;
+            vdd-supply = <&reg_vdd_panel>;
+            spi-max-frequency = <10000000>;
+            reset-gpios = <&gpiob 6 GPIO_ACTIVE_LOW>;
+            backlight = <&backlight>;
+            port {
+                panel_in_rgb: endpoint {
+                    remote-endpoint = <&ltdc_out_rgb>;
+                };
+            };
+        };
+    };
 ...
-- 
2.43.0

