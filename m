Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 1F528B40973
	for <lists+dri-devel@lfdr.de>; Tue,  2 Sep 2025 17:46:47 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 4400F10E7A2;
	Tue,  2 Sep 2025 15:46:45 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=gmail.com header.i=@gmail.com header.b="LCrcRsS7";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-wm1-f44.google.com (mail-wm1-f44.google.com
 [209.85.128.44])
 by gabe.freedesktop.org (Postfix) with ESMTPS id A48C510E7A2
 for <dri-devel@lists.freedesktop.org>; Tue,  2 Sep 2025 15:46:44 +0000 (UTC)
Received: by mail-wm1-f44.google.com with SMTP id
 5b1f17b1804b1-45b86157e18so17936105e9.0
 for <dri-devel@lists.freedesktop.org>; Tue, 02 Sep 2025 08:46:44 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20230601; t=1756828003; x=1757432803; darn=lists.freedesktop.org;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:from:to:cc:subject:date
 :message-id:reply-to;
 bh=9qDZYWOWH5Nm8yxbrqXFYbkGArZ8+SY8u8XQGrfbmV8=;
 b=LCrcRsS7BPgZw+vtfAKsZLMfgtIFXv5SRIfkUKWAgBQMpqu6yZuQjvaRvl4yWInjbi
 D3qWAkcPqo+6WJDq4etq/A9O77cKKJK8n1MroBevMkV38eu6uv2dNkyxigZKG3upr8oE
 OLjqiLDi6NJIDo9UHXwGrw+yKcJvFoL50tbwRhH1Hx5lFLm9NMkuCYl7X1qqUxANRAYn
 kIGDmLK8OANPXHx7rTecWXYABclW1NABzx12JVxvH8RhJXJszHFOdDbWq7NVLaojAVHp
 E0p6GC+IlPmUP9Ljg4rBqGC8uNFHfUqHL8hTenogoPgrdudtMY+LanewhOTcCOOrPu18
 K+vA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1756828003; x=1757432803;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=9qDZYWOWH5Nm8yxbrqXFYbkGArZ8+SY8u8XQGrfbmV8=;
 b=jN/T0Mfs1giCWZ+tkI72i5xt5WC6/7ffNegk+6dMkify7Eg4rwz/d4SHFbBc8wXW1u
 kp1TmOKRhDfi2kJUR2rI/ry/PX2bBm7v6y0sNnBFck10PNz1mnK7thjGCYGH0aPLVabC
 fs224MlEvMZIgEGjpztEiooNNYpHw46I1gRJEObw98/32T9KGJJYu2U6Ue9+J15smHf1
 Dy29yczA8w02w52fyNghqcJ05QFLbLqlcl0k1grbbhfFkIKeWoekCRVVV10w2QmOO+MO
 E2Eh8qqq17tDPSPEDB3+a3c29rFWH3An8V2k7av2qU5JcPNGtQi41Sl9iCZM3MgCBVnH
 1v3g==
X-Forwarded-Encrypted: i=1;
 AJvYcCUDms1wpsQpG7f14Lj2gYu40IhDEeRCusCRGvKq3fpnY0U0EwJ8sjW+mXKXJGoPKnlSNewC4ZOvkCo=@lists.freedesktop.org
X-Gm-Message-State: AOJu0YwfCPDJ9PxCleeMzX1KihMzOBj9D1MTwFWqPr3k+0KMXpS+LBVP
 8L6x4mNLzcdQvj5kwEmlIzyNAUMQAxuSctlf7HuRf0kBtpGr0CuBSUFr
X-Gm-Gg: ASbGncvvyOl3wvOh6c4+isYbN1+G2UDxmfoZhzxb0YHFn0CVuKt/DIo4l46lEHtxwRE
 /kphVAyOk0FNFrA0OBy5wGiRTDjRIqByKRLR86T8o/tLpXeVzXJSrDWD5CbrxiZ9JM50xyuIA/q
 jflSRuXqL/29e/cboH9/VkdDOy4o/D0PGnIvLA69NMLDzDOvH3dyfQ135s1z1ktLXFvCXdbDLj6
 numZvHbDcmQ6qLUiqmEjOeeupqE473dmReHrlaD/XKWUCv/i7z31RRsgqSDPhDc6+YYHmPRfVwe
 VzStVuA+4mAq1yGIZAeXUo7QUA3ZwD7psDLRORjCTONUd6jHI4bR8eR+txkjC3WsxrKp4RoSTaM
 HUKLMNHB6CcWSJ6YFn/bG0rLSDsSQSzntEi1YFF1MP8a0N6Ah70aC+RjjzHWKnXCC/ecPjdyCTi
 ulUhjDu/9uVdf0cQ==
X-Google-Smtp-Source: AGHT+IFcgEUq9qD0GZO46TpNwavpzh+hTQklCsGnRUm93f3x88gh4dc9vHpbCmQtmoM4+DhaY2NGrQ==
X-Received: by 2002:a05:6000:290b:b0:3c7:df1d:3d9 with SMTP id
 ffacd0b85a97d-3d1dfa19a4dmr10655884f8f.39.1756828002702; 
 Tue, 02 Sep 2025 08:46:42 -0700 (PDT)
Received: from localhost
 (p200300e41f1c4d00f22f74fffe1f3a53.dip0.t-ipconnect.de.
 [2003:e4:1f1c:4d00:f22f:74ff:fe1f:3a53])
 by smtp.gmail.com with UTF8SMTPSA id
 ffacd0b85a97d-3d85f80d8casm6829077f8f.54.2025.09.02.08.46.38
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Tue, 02 Sep 2025 08:46:38 -0700 (PDT)
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
Subject: [PATCH 1/9] dt-bindings: reserved-memory: Document Tegra VPR
Date: Tue,  2 Sep 2025 17:46:21 +0200
Message-ID: <20250902154630.4032984-2-thierry.reding@gmail.com>
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

The Video Protection Region (VPR) found on NVIDIA Tegra chips is a
region of memory that is protected from CPU accesses. It is used to
decode and play back DRM protected content.

It is a standard reserved memory region that can exist in two forms:
static VPR where the base address and size are fixed (uses the "reg"
property to describe the memory) and a resizable VPR where only the
size is known upfront and the OS can allocate it wherever it can be
accomodated.

Signed-off-by: Thierry Reding <treding@nvidia.com>
---
 .../nvidia,tegra-video-protection-region.yaml | 55 +++++++++++++++++++
 1 file changed, 55 insertions(+)
 create mode 100644 Documentation/devicetree/bindings/reserved-memory/nvidia,tegra-video-protection-region.yaml

diff --git a/Documentation/devicetree/bindings/reserved-memory/nvidia,tegra-video-protection-region.yaml b/Documentation/devicetree/bindings/reserved-memory/nvidia,tegra-video-protection-region.yaml
new file mode 100644
index 000000000000..c13292a791bb
--- /dev/null
+++ b/Documentation/devicetree/bindings/reserved-memory/nvidia,tegra-video-protection-region.yaml
@@ -0,0 +1,55 @@
+# SPDX-License-Identifier: (GPL-2.0 OR BSD-2-Clause)
+%YAML 1.2
+---
+$id: http://devicetree.org/schemas/reserved-memory/nvidia,tegra-video-protection-region.yaml#
+$schema: http://devicetree.org/meta-schemas/core.yaml#
+
+title: NVIDIA Tegra Video Protection Region (VPR)
+
+maintainers:
+  - Thierry Reding <thierry.reding@gmail.com>
+  - Jon Hunter <jonathanh@nvidia.com>
+
+description: |
+  NVIDIA Tegra chips have long supported a mechanism to protect a single,
+  contiguous memory region from non-secure memory accesses. Typically this
+  region is used for decoding and playback of DRM protected content. Various
+  devices, such as the display controller and multimedia engines (video
+  decoder) can access this region in a secure way. Access from the CPU is
+  generally forbidden.
+
+  Two variants exist for VPR: one is fixed in both the base address and size,
+  while the other is resizable. Fixed VPR can be described by just a "reg"
+  property specifying the base address and size, whereas the resizable VPR
+  is defined by a size/alignment pair of properties. For resizable VPR the
+  memory is reusable by the rest of the system when it's unused for VPR and
+  therefore the "reusable" property must be specified along with it. For a
+  fixed VPR, the memory is permanently protected, and therefore it's not
+  reusable and must also be marked as "no-map" to prevent any (including
+  speculative) accesses to it.
+
+allOf:
+  - $ref: reserved-memory.yaml
+
+properties:
+  compatible:
+    const: nvidia,tegra-video-protection-region
+
+dependencies:
+  size: [alignment, reusable]
+  alignment: [size, reusable]
+  reusable: [alignment, size]
+
+  reg: [no-map]
+  no-map: [reg]
+
+unevaluatedProperties: false
+
+oneOf:
+  - required:
+      - compatible
+      - reg
+
+  - required:
+      - compatible
+      - size
-- 
2.50.0

