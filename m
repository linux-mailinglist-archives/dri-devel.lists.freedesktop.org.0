Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id AD0BDB40975
	for <lists+dri-devel@lfdr.de>; Tue,  2 Sep 2025 17:46:57 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id CD19710E7B5;
	Tue,  2 Sep 2025 15:46:50 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=gmail.com header.i=@gmail.com header.b="cG7bxvC/";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-wm1-f44.google.com (mail-wm1-f44.google.com
 [209.85.128.44])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 9522710E7B5
 for <dri-devel@lists.freedesktop.org>; Tue,  2 Sep 2025 15:46:49 +0000 (UTC)
Received: by mail-wm1-f44.google.com with SMTP id
 5b1f17b1804b1-45b7c56a987so18072505e9.1
 for <dri-devel@lists.freedesktop.org>; Tue, 02 Sep 2025 08:46:49 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20230601; t=1756828008; x=1757432808; darn=lists.freedesktop.org;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:from:to:cc:subject:date
 :message-id:reply-to;
 bh=h4LUm3xzftHp/xE2ENw2BOhVhXc1ZcghNq/wiRAVNUo=;
 b=cG7bxvC/+LQVmzbBXfKjxWF5smoC1hVCUPuxQKJoIt8MTVOCUJ8R+p9mUYDWhqmXr8
 +iOMscvUSYO+gRc2e4x+1MjgHvTw6DLuL2xlYtI4Fs7izK3hTnDlNj9eF72jrzZGKzN5
 E2qztnhNgoipgA4TczsJK3Ab2Iwab1eu1705N49hcGXkxcZ3Lgrheky62g3GJdCkz1dV
 IWDaVJcAL0xCDO7/642a0aGJ66zokd0o8mxCQGipspHc/x7kc9qDDwM2s3ykJrJKmfue
 yO6uDOvzr9Uf+qCU7wl+7ArioOCQmpjfHqdc5CpF7YbB7gt7XK/t/gTOMKz0qPzqh2RP
 Tc8Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1756828008; x=1757432808;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=h4LUm3xzftHp/xE2ENw2BOhVhXc1ZcghNq/wiRAVNUo=;
 b=onjva82eDli5XhXZOZaH1ghrhx8Z+4ZJX8glHUTlwI6taJ4NvB8sTlSNWCpk9tIr+4
 8Owoz4wCMjGmlDfy68+J/iSetX1r+j3fGCaxTigLPgj4Sm2cjcJmc0yQAV6+Pz7ChkSr
 s1g5AgsyXDsqh5RguTcaX39sQ3Xd0tvQAylNBUgTX6gZiwVv4aJpoWJfA9Fj7h5QOyXk
 +YQsvOISoV8jryb84Y81b3WzJYO0fLzgcCIlcd1b/WaDaTaf8a4BTK8Y5oK//BnNUGAc
 CBZ5fk3c5ZIYJhg5X2gTxr2k20l3/4/35pnerJEaKg6De2ewmzxY569bDVmMDaNY3/2l
 pgvQ==
X-Forwarded-Encrypted: i=1;
 AJvYcCXf1ZzCnFEuUTs+hAxCAulraYhQQuq1zqOyPtbaajJf2oxEN59Ph2zpJ2QW9TryImAjYYkopizHFVY=@lists.freedesktop.org
X-Gm-Message-State: AOJu0YyXwXA1s+Kyb7hIHG78wQY6lZqzeNe/qjFF2ZvrNz7ibLCpfFt9
 kvcdkyEODSyWW/ZBcfuGJEGbnRsj4eF0OeUJJXyfvuT1mYIodc6I5nXF
X-Gm-Gg: ASbGncuN201sM7Rs6Q4+Ti8PSBD+SXnQslSj8+MC61qvgVKTCUiVfvLGkmzqkwuc39L
 f8RBQpM+pXq67rP6PTDTRgPR9cISntebOfP1zXobgPGxlLFIMpvyotgADKHG0OxIZZsd8xyQcjO
 iabptpuRJB16j/vR+JpQo4HAPHioBqpE4tfkR0EcOO/iBE71sOCVvRx74kul64cKEZYLQqdb4QJ
 3NRrSLDELSJ1Dx7FX8dL3ksdPBirTCS34Mm7vDLxYt4NTzwUVCDTg1XnX4lxWocbZdGgcdqbf7F
 VZRpGRrXbb91SvJtetz6IuPcsEAlZIgXgMbSh8iy4TvVLE3e2KPCta3jS/AiO9wHo3vkmTeDsfv
 R2uI01TJqtmwg9TRdDSViTpN/WLG3INXIemxVd2XZwoJuhjTA+INNek8+coBOb5z3paGWm1aXIV
 FDDoIAhENXt4t/SA==
X-Google-Smtp-Source: AGHT+IH1ceyRh0TFSkY7cElx5alHVXNEHIyhpSLS5qn4WT0MeK4fu88w2CD9wveL/P6+3CQyGvCJWA==
X-Received: by 2002:a05:600c:1f94:b0:45b:772b:12b9 with SMTP id
 5b1f17b1804b1-45b855336dcmr103786195e9.15.1756828007780; 
 Tue, 02 Sep 2025 08:46:47 -0700 (PDT)
Received: from localhost
 (p200300e41f1c4d00f22f74fffe1f3a53.dip0.t-ipconnect.de.
 [2003:e4:1f1c:4d00:f22f:74ff:fe1f:3a53])
 by smtp.gmail.com with UTF8SMTPSA id
 5b1f17b1804b1-45b7e898b99sm202121435e9.19.2025.09.02.08.46.43
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Tue, 02 Sep 2025 08:46:43 -0700 (PDT)
From: Thierry Reding <thierry.reding@gmail.com>
To: Thierry Reding <thierry.reding@gmail.com>,
 David Airlie <airlied@gmail.com>, Simona Vetter <simona@ffwll.ch>,
 Sumit Semwal <sumit.semwal@linaro.org>
Cc: Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>,
 Conor Dooley <conor+dt@kernel.org>,
 Benjamin Gaignard <benjamin.gaignard@collabora.com>,
 Brian Starkey <Brian.Starkey@arm.com>, John Stultz <jstultz@google.com>,
 "T.J. Mercier" <tjmercier@google.com>,
 Andrew Morton <akpm@linux-foundation.org>,
 David Hildenbrand <david@redhat.com>, Mike Rapoport <rppt@kernel.org>,
 dri-devel@lists.freedesktop.org, devicetree@vger.kernel.org,
 linux-tegra@vger.kernel.org, linaro-mm-sig@lists.linaro.org,
 linux-mm@kvack.org
Subject: [PATCH 2/9] dt-bindings: display: tegra: Document memory regions
Date: Tue,  2 Sep 2025 17:46:22 +0200
Message-ID: <20250902154630.4032984-3-thierry.reding@gmail.com>
X-Mailer: git-send-email 2.50.0
In-Reply-To: <20250902154630.4032984-1-thierry.reding@gmail.com>
References: <20250902154630.4032984-1-thierry.reding@gmail.com>
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

From: Thierry Reding <treding@nvidia.com>

Add the memory-region and memory-region-names properties to the bindings
for the display controllers and the host1x engine found on various Tegra
generations. These memory regions are used to access firmware-provided
framebuffer memory as well as the video protection region.

Signed-off-by: Thierry Reding <treding@nvidia.com>
---
 .../bindings/display/tegra/nvidia,tegra186-dc.yaml     | 10 ++++++++++
 .../bindings/display/tegra/nvidia,tegra20-dc.yaml      | 10 +++++++++-
 .../bindings/display/tegra/nvidia,tegra20-host1x.yaml  |  7 +++++++
 3 files changed, 26 insertions(+), 1 deletion(-)

diff --git a/Documentation/devicetree/bindings/display/tegra/nvidia,tegra186-dc.yaml b/Documentation/devicetree/bindings/display/tegra/nvidia,tegra186-dc.yaml
index ce4589466a18..881bfbf4764d 100644
--- a/Documentation/devicetree/bindings/display/tegra/nvidia,tegra186-dc.yaml
+++ b/Documentation/devicetree/bindings/display/tegra/nvidia,tegra186-dc.yaml
@@ -57,6 +57,16 @@ properties:
       - const: dma-mem # read-0
       - const: read-1
 
+  memory-region:
+    minItems: 1
+    maxItems: 2
+
+  memory-region-names:
+    items:
+      enum: [ framebuffer, protected ]
+    minItems: 1
+    maxItems: 2
+
   nvidia,outputs:
     description: A list of phandles of outputs that this display
       controller can drive.
diff --git a/Documentation/devicetree/bindings/display/tegra/nvidia,tegra20-dc.yaml b/Documentation/devicetree/bindings/display/tegra/nvidia,tegra20-dc.yaml
index 69be95afd562..a012644eeb7d 100644
--- a/Documentation/devicetree/bindings/display/tegra/nvidia,tegra20-dc.yaml
+++ b/Documentation/devicetree/bindings/display/tegra/nvidia,tegra20-dc.yaml
@@ -65,7 +65,15 @@ properties:
     items:
       - description: phandle to the core power domain
 
-  memory-region: true
+  memory-region:
+    minItems: 1
+    maxItems: 2
+
+  memory-region-names:
+    items:
+      enum: [ framebuffer, protected ]
+    minItems: 1
+    maxitems: 2
 
   nvidia,head:
     $ref: /schemas/types.yaml#/definitions/uint32
diff --git a/Documentation/devicetree/bindings/display/tegra/nvidia,tegra20-host1x.yaml b/Documentation/devicetree/bindings/display/tegra/nvidia,tegra20-host1x.yaml
index 3563378a01af..f45be30835a8 100644
--- a/Documentation/devicetree/bindings/display/tegra/nvidia,tegra20-host1x.yaml
+++ b/Documentation/devicetree/bindings/display/tegra/nvidia,tegra20-host1x.yaml
@@ -96,6 +96,13 @@ properties:
     items:
       - description: phandle to the HEG or core power domain
 
+  memory-region:
+    maxItems: 1
+
+  memory-region-names:
+    items:
+      - const: protected
+
 required:
   - compatible
   - interrupts
-- 
2.50.0

