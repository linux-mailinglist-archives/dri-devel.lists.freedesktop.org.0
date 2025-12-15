Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 03D61CBD419
	for <lists+dri-devel@lfdr.de>; Mon, 15 Dec 2025 10:48:07 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 9846610E3C4;
	Mon, 15 Dec 2025 09:47:58 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=gmail.com header.i=@gmail.com header.b="LDw1/TGA";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-lf1-f53.google.com (mail-lf1-f53.google.com
 [209.85.167.53])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 42F1A10E3CE
 for <dri-devel@lists.freedesktop.org>; Mon, 15 Dec 2025 09:47:56 +0000 (UTC)
Received: by mail-lf1-f53.google.com with SMTP id
 2adb3069b0e04-5957db5bdedso4164524e87.2
 for <dri-devel@lists.freedesktop.org>; Mon, 15 Dec 2025 01:47:56 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20230601; t=1765792075; x=1766396875; darn=lists.freedesktop.org;
 h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
 :mime-version:subject:date:from:from:to:cc:subject:date:message-id
 :reply-to; bh=g554CpaKOJYrfnF3kgR3vkqE8z4cQfcBTMePardbJIE=;
 b=LDw1/TGAPVtbF/ENe/kHJKkI5e7rOlyk25WLEou9LbB/DaU5XLnFa7PcgOCLlkVw26
 wG408SpYle+993WC8zIRdDZM8XsoTu/SvRsE3NTn39TN3odLb20lbJYexOeDsGSjhG1M
 qBmAargF8OfSvEjHuqaxqRvL9ndAzewPYvWd7R7D7oEWtSMvD4hCuz5cyuORYOt44yz7
 YUUeEvk6GUVLx2A6WO+wWc2si3yJGn4WjHe5UV2js0tYvNNM/JaUBI8wVtsLgI03yr8A
 YLDO9W0AH5tN3Ssimzck8UPkJ9bw8uXOJiYYAx8kTR3iHBa3ijPItVaOm4uRBeBSqq4r
 eFfQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1765792075; x=1766396875;
 h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
 :mime-version:subject:date:from:x-gm-gg:x-gm-message-state:from:to
 :cc:subject:date:message-id:reply-to;
 bh=g554CpaKOJYrfnF3kgR3vkqE8z4cQfcBTMePardbJIE=;
 b=j3migyj7YvvyYYo6GjgkAtPGH4s+UyCAgyybjRebMD3s7tNR115z/x6LRSemO9Y3L+
 xRPqNGrm1daPz+VZn3jszDxRAPA+f33dElEa0ERm0Zu9tQ3V1/cT50JYpIRqO68Gu7+I
 SVQ1+/68fEgzLkef9q0qo7RwB9Kdls5rKJ307TMGm8zs0HUThAtbL1urhYTmcnnI7nOU
 3kVHIgsKRrLFA1fdcZiyAaan7zvuQgfzccS35uVpyvFCnA+o66TETpOD/vSZ3mCk0293
 hhpOhoYMAFUhDSwSGD8yRZdO3yqvwATcCuU7lOJmBoszu+GlwqNYCpP6BIQix71NJJvP
 42/A==
X-Gm-Message-State: AOJu0YwGoJcB9VLXmLNX2jb+2vPFcpEsuZ1BgjIF/at9kxlaACcAtQRU
 o/mVJvq7fsfLA506MxJwvcXRdxtBBVGjQCXsJIMy+6ta7uHDC5Jdz7J1
X-Gm-Gg: AY/fxX4mSaVl99+6j4sSvwlZhwF7fGBjUU0mM1hOva0mWnS7ZPib/jSLObBTPjiB9D8
 THN1nYLaZUeWhOMvc1U38xD3O0l80UE9v/TPZD2UMRHmchh+8MwvS7HdSUw8RNAop5yc2EZMK8H
 72TvbFszsfT5UE19ejRILH2i8Z1TIeDjuAleiVbz6PBv/QyYcYKhagZO9T1+hM8XayW9WehqHVO
 4jGAQYsesYV2zPBnuBGE5uyEKDsaKw21kGjAa0dn4Y3VcjVlcPHNqjEX70Nq0rK64c2GBZRWyYH
 OPGTPDOx3g+aQrCz+kFSroEZiHuun//cGYQdG5lHycg2Duj4YQfyTaIHtCrA0riCLJW/zgdO7/3
 cwRMxz3fuCWbXHb4859aMixfHEh3qEIBwU3kLJEuvlU+q2bozgqv+C30xrnYPD8xCDWsGtVMP3V
 W+JUqFv09utItThF2GJ7uncgMghILzp0rmaMUWlucnfQtnPC10cnAqO/gL
X-Google-Smtp-Source: AGHT+IHq6/ltwcpwzlMuZ4ctniBxHUBG6W9nDfRQn41gCXLc1DmWlN5fsdQeqKb8QAQRFt4aosqehQ==
X-Received: by 2002:a05:6512:15a8:b0:57c:2474:371f with SMTP id
 2adb3069b0e04-598faa7c05amr3191323e87.45.1765792074446; 
 Mon, 15 Dec 2025 01:47:54 -0800 (PST)
Received: from [192.168.1.168] (83-233-6-197.cust.bredband2.com.
 [83.233.6.197]) by smtp.gmail.com with ESMTPSA id
 2adb3069b0e04-598f2f37ae8sm5397546e87.15.2025.12.15.01.47.53
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Mon, 15 Dec 2025 01:47:53 -0800 (PST)
From: Marcus Folkesson <marcus.folkesson@gmail.com>
Date: Mon, 15 Dec 2025 10:46:49 +0100
Subject: [PATCH v3 7/7] dt-bindings: display: sitronix,st7571: add example
 for SPI
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20251215-st7571-split-v3-7-d5f3205c3138@gmail.com>
References: <20251215-st7571-split-v3-0-d5f3205c3138@gmail.com>
In-Reply-To: <20251215-st7571-split-v3-0-d5f3205c3138@gmail.com>
To: Maarten Lankhorst <maarten.lankhorst@linux.intel.com>, 
 Maxime Ripard <mripard@kernel.org>, Thomas Zimmermann <tzimmermann@suse.de>, 
 David Airlie <airlied@gmail.com>, Simona Vetter <simona@ffwll.ch>, 
 Javier Martinez Canillas <javierm@redhat.com>, 
 Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>, 
 Conor Dooley <conor+dt@kernel.org>
Cc: dri-devel@lists.freedesktop.org, linux-kernel@vger.kernel.org, 
 devicetree@vger.kernel.org, Marcus Folkesson <marcus.folkesson@gmail.com>
X-Mailer: b4 0.14.3
X-Developer-Signature: v=1; a=openpgp-sha256; l=1230;
 i=marcus.folkesson@gmail.com; h=from:subject:message-id;
 bh=sExmmnvYaPANXPnzO5I3PgHRYBCnpqGofgWH94UH1sM=;
 b=owEBbQKS/ZANAwAKAYiATm9ZXVIyAcsmYgBpP9k4iLYRf6pbd/ZVDpkkKqBsnqpGyKf2nvXlG
 MFX9dXbKrWJAjMEAAEKAB0WIQQFUaLotmy1TWTBLGWIgE5vWV1SMgUCaT/ZOAAKCRCIgE5vWV1S
 MtEHEADAyrbyRjTklwJ/2m4/bO/eCRWhZBtPQmDhuDWmBUAM2z2hP3rz7synGw57lPV7QFHRDx0
 UVUCKPOkIhOINM89+J5vdWaINjQkUoH95xpE4pHbC/yb9EX61NRD7vbbZF5AR8ig172tl/aWQVd
 n8rEIpJ9437Z7xAeBWlXEAT6xIVCpNxzVSpx2o27r86fgV4UibqTBupm1R2P2zfMcBXyuoaLhdP
 B7UpKhBskDXWgDtsQAODYw6BVlxE7gPe+Ae7Flmi6G5zreW+3sjHva+ZDJlut3gt0PKikHCV5h9
 i8lx3ulXeuEZYGBMT3lDtMibfValJWbScFpfxCgcP0c0Z080TJUrHzA0KLaCcNddkj4YZfBuPmQ
 A4J1ZKFKyYQ3RKRaRqxiv5bL+gcc41pn7jHXCWuBO8M2oEleVG+5RMeWnAObLZ6Z7pYiVZIU4I1
 slQNpnuorO/nGNE+IsW3TxYADGynRuM6Dy0+YfvcvU6VCUVkJ+zCr+feR2+IXSeqLahE3VzgaTm
 KaC4cbxM+ksOfTGlrLrmqk4SgMpCcuNq9TDxG62ZSXDUUnsz9Nam8/DpJN4eO0JsTENb8WyGE6u
 d1vsqxp9+jALYz88+Ese96rDqGr6PdP27JJm+WvY0qunbIwot3WYxbU5usRNi8fEj3PzNsPMyEB
 6aA8xZgDS25XnLw==
X-Developer-Key: i=marcus.folkesson@gmail.com; a=openpgp;
 fpr=AB91D46C7E0F6E6FB2AB640EC0FE25D598F6C127
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

Add example for using st7571 with SPI.

Signed-off-by: Marcus Folkesson <marcus.folkesson@gmail.com>
---
 .../bindings/display/sitronix,st7571.yaml          | 25 ++++++++++++++++++++++
 1 file changed, 25 insertions(+)

diff --git a/Documentation/devicetree/bindings/display/sitronix,st7571.yaml b/Documentation/devicetree/bindings/display/sitronix,st7571.yaml
index b83721eb4b7f..1931a47c4217 100644
--- a/Documentation/devicetree/bindings/display/sitronix,st7571.yaml
+++ b/Documentation/devicetree/bindings/display/sitronix,st7571.yaml
@@ -76,3 +76,28 @@ examples:
         };
       };
     };
+
+    spi {
+      #address-cells = <1>;
+      #size-cells = <0>;
+
+      display@0 {
+        compatible = "sitronix,st7571";
+        reg = <0>;
+        reset-gpios = <&gpio0 3 GPIO_ACTIVE_LOW>;
+        width-mm = <37>;
+        height-mm = <27>;
+
+        panel-timing {
+          hactive = <128>;
+          vactive = <96>;
+          hback-porch = <0>;
+          vback-porch = <0>;
+          clock-frequency = <0>;
+          hfront-porch = <0>;
+          hsync-len = <0>;
+          vfront-porch = <0>;
+          vsync-len = <0>;
+        };
+      };
+    };

-- 
2.51.2

