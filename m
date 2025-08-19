Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 237C1B2C302
	for <lists+dri-devel@lfdr.de>; Tue, 19 Aug 2025 14:17:19 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id D5C3610E5D3;
	Tue, 19 Aug 2025 12:17:16 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=gmail.com header.i=@gmail.com header.b="m+REv+fJ";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-ej1-f48.google.com (mail-ej1-f48.google.com
 [209.85.218.48])
 by gabe.freedesktop.org (Postfix) with ESMTPS id F3A2010E5D1
 for <dri-devel@lists.freedesktop.org>; Tue, 19 Aug 2025 12:17:12 +0000 (UTC)
Received: by mail-ej1-f48.google.com with SMTP id
 a640c23a62f3a-afcb731ca8eso835407266b.0
 for <dri-devel@lists.freedesktop.org>; Tue, 19 Aug 2025 05:17:12 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20230601; t=1755605831; x=1756210631; darn=lists.freedesktop.org;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:from:to:cc:subject:date
 :message-id:reply-to;
 bh=XhbWfkMKF6hF66NOAL+RPoWVZuRp+fSGcoMAU/Szml0=;
 b=m+REv+fJ8D51u2vKI0cvT1Od6leQ9FDL4BG7N7izU9zobwCPoaMERjJyMEBIUa1fGh
 oq6A2yETfJILND//vTpRltOZNWnfQKQi7gpPfVUS5lGtqjJU7+pfgp3ZLlhVfoXhO+2K
 f+oCaWvY2EeZIdJxXszjktFRaC8kP6F6SNAD6WZxPHLicdIcw6hWCQK9MBSlrzeRoaXV
 5IsFEFGmI/MwXqJKzOSDeKN1xgBXBlmEkrPmDbFN5qjW+XGgYT7EaiiFPtryRI2ODxnc
 uvUYpxI4ACEbODGT/BLemSYmJ5sP8TBLW7LXe1NImuuvbXbWvpJdqeZHMysH9775sWwo
 prJQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1755605831; x=1756210631;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=XhbWfkMKF6hF66NOAL+RPoWVZuRp+fSGcoMAU/Szml0=;
 b=AZtcdrXBvAVtECGKSFhlAUgZw7wpbYW1orymwkZFvQ42D5zRa7yDT7ociYXvr59vx1
 u3GNmYQvEN8KhW13qStHNMcrrvbKIjq+YuG7yxrv+8BdHpkxnxD7hCQjdPFtiCv5kqZe
 dD4tUJon8SJCa+QRrtScJFZL2V/a7YbjMRdIUbk0seAte0iDkRVTS4l4N93tvLLkVQZA
 rZTEJdwWbaghVNKCYNz6TgRRkJOdg4RmHx0SHxIVyPtqK2ZQM/8DO7jzYwajvuUY2xfp
 u4ip09APqAJZgzOXk5jj2suhjiCxKMVFWTezQXqP1Hh/w9/Vmj7SXolVJ1ibXBDQ+Gf1
 sFCQ==
X-Forwarded-Encrypted: i=1;
 AJvYcCXxswPjRgKLraj8jzyRhIDuKEpKiXZ58cJ7Z+46o3ZW8E4nUgy9AG40USvTI5prAfiUVPXVAMO7AKk=@lists.freedesktop.org
X-Gm-Message-State: AOJu0Yw/Lz1AmCxsLAPHOYuX2sF/VmO0FQHsNzZan8adRAhPNtEOzvr5
 Y8+xEfq4/UXSQeZXphqlhq9iEGniEYvzJoNCAVBsIqdw2oH5oda3YstD
X-Gm-Gg: ASbGncvILxGD2iZRTjuot4Oa61+PsoS1EiF1cjNkxoI70E1lSDs2lI8XtlOwEpvu/q9
 bDj+A9ILI0yzgC7SWKuFZnfOQpj5z5ZxZZaweIGEjsFWm3d9BkQUfTkThhW5WogUU58yLvlwKQV
 R63Gf1+wZmbnI7jtbXTDsegCVLW/Yl7KsEz4xoIxg+Qe5VzjVgcu0WwGZd6UHVsuRrMFrHEexfi
 gAP+gOBA46nIX/jsoHjY0TbXXMj4TV+KuxwyNKI16kjXuU/9hiSjodnOWerFfrH+rsbFkx96jAQ
 Qcz1RZQjyRuoJgjAZhRb9km+Yy+3wbB5uMLkA80Uwjk4R2ZzBL/rCSYa0DF5GC6ME/PY/kjss3o
 IgyZyZGkijD0g8g==
X-Google-Smtp-Source: AGHT+IFsyn72hjdeQEsFRbU5nBWZrG6wCs9qdktkISE8s0ETQsL6XXo/oatl3CIX8p7Q4Fqo+MpW3A==
X-Received: by 2002:a17:907:9706:b0:ae3:f2a0:459f with SMTP id
 a640c23a62f3a-afddd1f0af0mr248773766b.54.1755605831408; 
 Tue, 19 Aug 2025 05:17:11 -0700 (PDT)
Received: from xeon.. ([188.163.112.76]) by smtp.gmail.com with ESMTPSA id
 a640c23a62f3a-afcdce72cbbsm1012018666b.35.2025.08.19.05.17.09
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Tue, 19 Aug 2025 05:17:11 -0700 (PDT)
From: Svyatoslav Ryhel <clamor95@gmail.com>
To: Thierry Reding <thierry.reding@gmail.com>,
 Thierry Reding <treding@nvidia.com>,
 Mikko Perttunen <mperttunen@nvidia.com>,
 Jonathan Hunter <jonathanh@nvidia.com>,
 Sowjanya Komatineni <skomatineni@nvidia.com>,
 Luca Ceresoli <luca.ceresoli@bootlin.com>,
 David Airlie <airlied@gmail.com>, Simona Vetter <simona@ffwll.ch>,
 Maarten Lankhorst <maarten.lankhorst@linux.intel.com>,
 Maxime Ripard <mripard@kernel.org>,
 Thomas Zimmermann <tzimmermann@suse.de>, Rob Herring <robh@kernel.org>,
 Krzysztof Kozlowski <krzk+dt@kernel.org>,
 Conor Dooley <conor+dt@kernel.org>,
 Peter De Schrijver <pdeschrijver@nvidia.com>,
 Prashant Gaikwad <pgaikwad@nvidia.com>,
 Michael Turquette <mturquette@baylibre.com>,
 Stephen Boyd <sboyd@kernel.org>,
 Mauro Carvalho Chehab <mchehab@kernel.org>,
 Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
 Svyatoslav Ryhel <clamor95@gmail.com>, Dmitry Osipenko <digetx@gmail.com>,
 Charan Pedumuru <charan.pedumuru@gmail.com>
Cc: linux-media@vger.kernel.org, linux-tegra@vger.kernel.org,
 dri-devel@lists.freedesktop.org, devicetree@vger.kernel.org,
 linux-kernel@vger.kernel.org, linux-clk@vger.kernel.org,
 linux-staging@lists.linux.dev
Subject: [PATCH v1 17/19] dt-bindings: display: tegra: document Tegra20 and
 Tegra30 CSI
Date: Tue, 19 Aug 2025 15:16:29 +0300
Message-ID: <20250819121631.84280-18-clamor95@gmail.com>
X-Mailer: git-send-email 2.48.1
In-Reply-To: <20250819121631.84280-1-clamor95@gmail.com>
References: <20250819121631.84280-1-clamor95@gmail.com>
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

Document CSI hw block found in Tegra20 and Tegra30 SoC.

Signed-off-by: Svyatoslav Ryhel <clamor95@gmail.com>
---
 .../display/tegra/nvidia,tegra210-csi.yaml    | 78 +++++++++++++++----
 1 file changed, 63 insertions(+), 15 deletions(-)

diff --git a/Documentation/devicetree/bindings/display/tegra/nvidia,tegra210-csi.yaml b/Documentation/devicetree/bindings/display/tegra/nvidia,tegra210-csi.yaml
index fa07a40d1004..a5669447a33b 100644
--- a/Documentation/devicetree/bindings/display/tegra/nvidia,tegra210-csi.yaml
+++ b/Documentation/devicetree/bindings/display/tegra/nvidia,tegra210-csi.yaml
@@ -16,30 +16,78 @@ properties:
 
   compatible:
     enum:
+      - nvidia,tegra20-csi
+      - nvidia,tegra30-csi
       - nvidia,tegra210-csi
 
   reg:
     maxItems: 1
 
-  clocks:
-    items:
-      - description: module clock
-      - description: A/B lanes clock
-      - description: C/D lanes clock
-      - description: E lane clock
-      - description: test pattern generator clock
-
-  clock-names:
-    items:
-      - const: csi
-      - const: cilab
-      - const: cilcd
-      - const: cile
-      - const: csi_tpg
+  clocks: true
+  clock-names: true
 
   power-domains:
     maxItems: 1
 
+allOf:
+  - if:
+      properties:
+        compatible:
+          contains:
+            enum:
+              - nvidia,tegra20-csi
+    then:
+      properties:
+        clocks:
+          items:
+            - description: module clock
+
+        clock-names:
+          items:
+            - const: csi
+  - if:
+      properties:
+        compatible:
+          contains:
+            enum:
+              - nvidia,tegra30-csi
+    then:
+      properties:
+        clocks:
+          items:
+            - description: module clock
+            - description: PAD A clock
+            - description: PAD B clock
+
+        clock-names:
+          items:
+            - const: csi
+            - const: csia_pad
+            - const: csib_pad
+  - if:
+      properties:
+        compatible:
+          contains:
+            enum:
+              - nvidia,tegra210-csi
+    then:
+      properties:
+        clocks:
+          items:
+            - description: module clock
+            - description: A/B lanes clock
+            - description: C/D lanes clock
+            - description: E lane clock
+            - description: test pattern generator clock
+
+        clock-names:
+          items:
+            - const: csi
+            - const: cilab
+            - const: cilcd
+            - const: cile
+            - const: csi_tpg
+
 additionalProperties: false
 
 required:
-- 
2.48.1

