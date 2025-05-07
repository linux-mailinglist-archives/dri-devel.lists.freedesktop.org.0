Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id C93B0AAECD8
	for <lists+dri-devel@lfdr.de>; Wed,  7 May 2025 22:22:42 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id C1E9010E89B;
	Wed,  7 May 2025 20:22:36 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=gmail.com header.i=@gmail.com header.b="OxtCaknX";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-ot1-f50.google.com (mail-ot1-f50.google.com
 [209.85.210.50])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 32BCD10E89B
 for <dri-devel@lists.freedesktop.org>; Wed,  7 May 2025 20:22:35 +0000 (UTC)
Received: by mail-ot1-f50.google.com with SMTP id
 46e09a7af769-72b7a53ceb6so197419a34.0
 for <dri-devel@lists.freedesktop.org>; Wed, 07 May 2025 13:22:35 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20230601; t=1746649354; x=1747254154; darn=lists.freedesktop.org;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:from:to:cc:subject:date
 :message-id:reply-to;
 bh=seKIm/ljynfx7Gt5G3g1qPbmhqkI57NM8oBXOLDsPF8=;
 b=OxtCaknX0CXBPm+pOVQTUUHXqf8G8R7Nm53g3Y9+D02NY/nnOTX14FN/uC51RMwmgP
 eGW/P9myxWwaZnlRGM2T2c3hA3i3qbGn9CA2Cm0EZmf4kr0F0Iyi93I3kYK6e+rV8mHJ
 YPPNkAVmfz+Bao72gdL7c9FJTinyHYnFkyvNlI2TsC+pnhcCE8UeqBgpDOXtR6N5xXtC
 ceQAXCRrwBF7H0LotzvgjhER3Eu3zRv8zAbQjVVIKCInXNUuG9ftJlT8NCfNMBdQYz4S
 y/pkSojo7EeVxeYg36/1B6ztsY3mm6c4rxK/UEFkTgd/A60SkOAsjQkygdH5RBkLWgf9
 tawQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1746649354; x=1747254154;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=seKIm/ljynfx7Gt5G3g1qPbmhqkI57NM8oBXOLDsPF8=;
 b=GvN/guJg2dy38W8YAQp4iw++OCXBLXeanwpr0AJksv3FOum1sY48yTX4EPXeB/CWEK
 xlOCczDFSRmDD+N9h9e8CKx7Q4XpesQgHR6IcSAA+PoDUyFaOsFWWCl7t9hRrFsi9w24
 86SHnjxGqhaTBoDu0Eqtej41QxEj4l7WtshXQhRE19nFeAxTe1f2QiT7kyyO5KNDEFfJ
 /gBNK0GW2sK6KRNOX1XKyzCNHGtbMj2NFOa+jq2mcYjfBM0Xn2GZY8hLUGEL4BiZm/i7
 290o5q7qi7AvdaK5qVj4CCpd5RFmofmn9yYKl9iUsnOCY3V2Vdur27aGetFEgtXEPy42
 yFcw==
X-Forwarded-Encrypted: i=1;
 AJvYcCX45xiPqtJMowyi8v9O+LfIGJwPSAu+pN+IRKL8LsBV507GzMhMnxmMgYs6inFWiClRNzA4PeTB6oc=@lists.freedesktop.org
X-Gm-Message-State: AOJu0YwFkuoldpzsLcEWab11nfcj1HMhbZ1tWzUcwHbj07xXmNwr3DoC
 4Ncfq3bseMt+yA3e78+uQF7xSCp6w8pSpfxEBJdGQAXc/ClXogDi
X-Gm-Gg: ASbGnctHaH4GypYY82NO1BHfgDUlzL0Qpw2QylvaSEO9VHfAqkxssyM4G7J08kM57WG
 0nT7LNQnzPTU4+mC3cw208TMHyr3YoyEfTh3PxhgZ6yDBS2KhB50OzfMEJUeLQ1uFEOsV8hd2kh
 WiLrFGKBj+sKgef13UlimKwlCzWcZB6L4bw1Rmg7sRufl8LraTv3fvf3Qtn+uwItMLd8XFSfeOm
 AvJrZ3n9Wk9iyTiPkgVW2Zq0zZShkBHzH01MiN5O5qb8AfTTZzPUQr3ZI4KiQvRvsSHkfjWPjfw
 yCvSllD17GPEXmxrH+SVkI28Sa+wIgUq71mnQ1NNm+EFBhMAc0C8wNgXKCdH1NxydZYfOPg=
X-Google-Smtp-Source: AGHT+IHALZ6h0iSHrJndLa4ejWvNDTzp2WRFgVlLimexXrna9Pc67+SeUmi8bDDRLkq9QHonddAS4w==
X-Received: by 2002:a05:6830:33f8:b0:72a:b2a:476 with SMTP id
 46e09a7af769-7321b364c5dmr525759a34.3.1746649354490; 
 Wed, 07 May 2025 13:22:34 -0700 (PDT)
Received: from localhost.localdomain ([2600:1700:fb0:1bcf:e46c:46ba:cecd:a52c])
 by smtp.gmail.com with ESMTPSA id
 46e09a7af769-732109df2dcsm725945a34.9.2025.05.07.13.22.33
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Wed, 07 May 2025 13:22:34 -0700 (PDT)
From: Chris Morgan <macroalpha82@gmail.com>
To: linux-sunxi@lists.linux.dev
Cc: devicetree@vger.kernel.org, dri-devel@lists.freedesktop.org,
 ryan@testtoast.com, macromorgan@hotmail.com, p.zabel@pengutronix.de,
 tzimmermann@suse.de, maarten.lankhorst@linux.intel.com, simona@ffwll.ch,
 airlied@gmail.com, mripard@kernel.org, samuel@sholland.org,
 jernej.skrabec@gmail.com, wens@csie.org, conor+dt@kernel.org,
 krzk+dt@kernel.org, robh@kernel.org
Subject: [PATCH V9 09/24] dt-bindings: allwinner: add H616 DE33 mixer binding
Date: Wed,  7 May 2025 15:19:28 -0500
Message-ID: <20250507201943.330111-10-macroalpha82@gmail.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20250507201943.330111-1-macroalpha82@gmail.com>
References: <20250507201943.330111-1-macroalpha82@gmail.com>
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

From: Chris Morgan <macromorgan@hotmail.com>

The Allwinner H616 and variants have a new display engine revision
(DE33).

The mixer configuration registers are significantly different to the DE3
and DE2 revisions, being split into separate top and display blocks,
therefore a fallback for the mixer compatible is not provided.

Add a display engine mixer binding for the DE33.

Signed-off-by: Ryan Walklin <ryan@testtoast.com>
Signed-off-by: Chris Morgan <macromorgan@hotmail.com>
---
Changelog v2..v3:
- Separate content into three patches for three separate subsystems

Changelog v5..v6:
- Increase reg maxItems to 3 and add conditional for h616-de33

Changelog v8..v9:
- Correct conditional logic for reg items as it was not working for me
  when using dtbs_check
- Add reg-names property and description for the registers used by the
  DE33 mixer
- Removed Acked and Reviewed tags so that change can be re-reviewed.
---
 .../allwinner,sun8i-a83t-de2-mixer.yaml       | 34 +++++++++++++++++--
 1 file changed, 32 insertions(+), 2 deletions(-)

diff --git a/Documentation/devicetree/bindings/display/allwinner,sun8i-a83t-de2-mixer.yaml b/Documentation/devicetree/bindings/display/allwinner,sun8i-a83t-de2-mixer.yaml
index b75c1ec686ad..cbd18fd83e52 100644
--- a/Documentation/devicetree/bindings/display/allwinner,sun8i-a83t-de2-mixer.yaml
+++ b/Documentation/devicetree/bindings/display/allwinner,sun8i-a83t-de2-mixer.yaml
@@ -24,9 +24,11 @@ properties:
       - allwinner,sun50i-a64-de2-mixer-0
       - allwinner,sun50i-a64-de2-mixer-1
       - allwinner,sun50i-h6-de3-mixer-0
+      - allwinner,sun50i-h616-de33-mixer-0
 
-  reg:
-    maxItems: 1
+  reg: true
+
+  reg-names: true
 
   clocks:
     items:
@@ -61,6 +63,34 @@ properties:
     required:
       - port@1
 
+allOf:
+  - if:
+      properties:
+        compatible:
+          contains:
+            enum:
+              - allwinner,sun50i-h616-de33-mixer-0
+    then:
+      properties:
+        reg:
+          description: |
+            Registers for controlling individual layers of the display
+            engine (layers), global control (top), and display blending
+            control (display). Names are from Allwinner BSP kernel.
+          maxItems: 3
+        reg-names:
+          items:
+            - const: layers
+            - const: top
+            - const: display
+      required:
+        - reg-names
+
+    else:
+      properties:
+        reg:
+          maxItems: 1
+
 required:
   - compatible
   - reg
-- 
2.43.0

