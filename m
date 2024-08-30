Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 998AA9657F7
	for <lists+dri-devel@lfdr.de>; Fri, 30 Aug 2024 09:04:51 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id C667E10E81C;
	Fri, 30 Aug 2024 07:04:49 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=fail reason="signature verification failed" (2048-bit key; unprotected) header.d=linaro.org header.i=@linaro.org header.b="zpQt6K+c";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-ej1-f46.google.com (mail-ej1-f46.google.com
 [209.85.218.46])
 by gabe.freedesktop.org (Postfix) with ESMTPS id E36BD10E817
 for <dri-devel@lists.freedesktop.org>; Fri, 30 Aug 2024 07:04:42 +0000 (UTC)
Received: by mail-ej1-f46.google.com with SMTP id
 a640c23a62f3a-a867a564911so179270966b.2
 for <dri-devel@lists.freedesktop.org>; Fri, 30 Aug 2024 00:04:42 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=linaro.org; s=google; t=1725001481; x=1725606281; darn=lists.freedesktop.org;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:from:to:cc:subject:date
 :message-id:reply-to;
 bh=xfKg3et82GR8Ut+Mah5KVc5YDnZncDhvNa0IoupXc1A=;
 b=zpQt6K+cgn5Zweht00nAZAUnKldpDzsYSx98HheurIP7uVO7K0R9u2z+zWtkJ9pjgj
 gM/X19zU09jcUWMykbYSONoiUuSMM0XypLt8NlMlT8DfQILmQGw9ikko5aSX5ZJnOLGZ
 PUrCoKYlswGmDoWCi/Jg/RGeJkbQPJwLL3vmeqf/pzsfxkHUzBluXPx+zEw1dR51jFn7
 gnUhVq06EjtZUvYNpezz49WNBZKTAkJ33yFQKC0Bqd3Xqh4pkqcqyTkyJHKv7UiUZBEk
 97rHhEBU6Ip9ym1ewxjlpI6kCH0ep6j459kKDDtsmbziqeVVRHmstROxkzpzL86/NaCJ
 kuzQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1725001481; x=1725606281;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=xfKg3et82GR8Ut+Mah5KVc5YDnZncDhvNa0IoupXc1A=;
 b=Sgrvguqci7PDoEJak+QmaTYQWCC31qbs4E5dFhiIwRgnrzIvDDzsbPvb+w6zRk2233
 qX1iT+44jjDXRG6zm25HCkoZrm2HP3l764tWvNEvR1OqJcpd5mNeDB9f4f6TBibqomQ/
 FIyzWJHcuQRAF7hDOdOO9L85qE1UFUVCJhLZaXajIg9627u07WR9vduKEb0b+wqD4EgP
 zk1h07lYLlkLRZ6R/0Rs/tqffFlelexgXLoFV87mlwURkMmf7m9BxwWcl/33TeMPgv5Z
 6yVeVvkO5EcMXZou6Xc0SkxBV84KhGvGC9urMLrWuRSti+FkWRYSxFwqDvZjChPjcnu+
 eAZw==
X-Forwarded-Encrypted: i=1;
 AJvYcCXXik/FHZIv0U4/HZiaHiPrmcwW5PrnCPQYASKJ7gJWEbtZIIaaErwddMJJ1V5FIvwm0K72jI3VzAY=@lists.freedesktop.org
X-Gm-Message-State: AOJu0YxljO3wU9kKbqPVJi3F83q4rQfCYKD+MDo77EldKcsrqWGnFwTL
 s15HHf1GU1O6zGnmWrTCFCsw1oSGSccd8JK7j8dM3ESJV1dwXz0fFj2W3UZKZoo=
X-Google-Smtp-Source: AGHT+IECnqDtOxbvfOy9sPbk0lCyiNAqNWYzneroZfijzEEU+LtepnDur/LFnUatGwBb6xPr3tERGg==
X-Received: by 2002:a17:907:6d0a:b0:a86:7f6a:8779 with SMTP id
 a640c23a62f3a-a897fad4d42mr418259566b.57.1725001481050; 
 Fri, 30 Aug 2024 00:04:41 -0700 (PDT)
Received: from rayden.urgonet (h-217-31-164-171.A175.priv.bahnhof.se.
 [217.31.164.171]) by smtp.gmail.com with ESMTPSA id
 a640c23a62f3a-a89892232c7sm178026866b.222.2024.08.30.00.04.39
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Fri, 30 Aug 2024 00:04:40 -0700 (PDT)
From: Jens Wiklander <jens.wiklander@linaro.org>
To: linux-kernel@vger.kernel.org, devicetree@vger.kernel.org,
 linux-media@vger.kernel.org, dri-devel@lists.freedesktop.org,
 linaro-mm-sig@lists.linaro.org, op-tee@lists.trustedfirmware.org,
 linux-arm-kernel@lists.infradead.org, linux-mediatek@lists.infradead.org
Cc: Olivier Masse <olivier.masse@nxp.com>,
 Thierry Reding <thierry.reding@gmail.com>, Yong Wu <yong.wu@mediatek.com>,
 Sumit Semwal <sumit.semwal@linaro.org>,
 Benjamin Gaignard <benjamin.gaignard@collabora.com>,
 Brian Starkey <Brian.Starkey@arm.com>, John Stultz <jstultz@google.com>,
 "T . J . Mercier" <tjmercier@google.com>,
 =?UTF-8?q?Christian=20K=C3=B6nig?= <christian.koenig@amd.com>,
 Sumit Garg <sumit.garg@linaro.org>,
 Matthias Brugger <matthias.bgg@gmail.com>,
 AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>,
 Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>,
 Conor Dooley <conor+dt@kernel.org>,
 Jens Wiklander <jens.wiklander@linaro.org>
Subject: [RFC PATCH 3/4] dt-bindings: reserved-memory: add linaro,
 restricted-heap
Date: Fri, 30 Aug 2024 09:03:50 +0200
Message-Id: <20240830070351.2855919-4-jens.wiklander@linaro.org>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20240830070351.2855919-1-jens.wiklander@linaro.org>
References: <20240830070351.2855919-1-jens.wiklander@linaro.org>
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

From: Olivier Masse <olivier.masse@nxp.com>

DMABUF reserved memory definition for OP-TEE secure data path feature.

Signed-off-by: Olivier Masse <olivier.masse@nxp.com>
Signed-off-by: Jens Wiklander <jens.wiklander@linaro.org>
---
 .../linaro,restricted-heap.yaml               | 56 +++++++++++++++++++
 1 file changed, 56 insertions(+)
 create mode 100644 Documentation/devicetree/bindings/reserved-memory/linaro,restricted-heap.yaml

diff --git a/Documentation/devicetree/bindings/reserved-memory/linaro,restricted-heap.yaml b/Documentation/devicetree/bindings/reserved-memory/linaro,restricted-heap.yaml
new file mode 100644
index 000000000000..0ab87cf02775
--- /dev/null
+++ b/Documentation/devicetree/bindings/reserved-memory/linaro,restricted-heap.yaml
@@ -0,0 +1,56 @@
+# SPDX-License-Identifier: (GPL-2.0 OR BSD-2-Clause)
+%YAML 1.2
+---
+$id: http://devicetree.org/schemas/reserved-memory/linaro,restricted-heap.yaml#
+$schema: http://devicetree.org/meta-schemas/core.yaml#
+
+title: Linaro Secure DMABUF Heap
+
+maintainers:
+  - Olivier Masse <olivier.masse@nxp.com>
+
+description:
+  Linaro OP-TEE firmware needs a reserved memory for the
+  Secure Data Path feature (aka SDP).
+  The purpose is to provide a restricted memory heap which allow
+  the normal world OS (REE) to allocate/free restricted buffers.
+  The TEE is reponsible for protecting the SDP memory buffers.
+  TEE Trusted Application can access restricted memory references
+  provided as parameters (DMABUF file descriptor).
+
+allOf:
+  - $ref: "reserved-memory.yaml"
+
+properties:
+  compatible:
+    const: linaro,restricted-heap
+
+  reg:
+    description:
+      Region of memory reserved for OP-TEE SDP feature
+
+  no-map:
+    $ref: /schemas/types.yaml#/definitions/flag
+    description:
+      Avoid creating a virtual mapping of the region as part of the OS'
+      standard mapping of system memory.
+
+unevaluatedProperties: false
+
+required:
+  - compatible
+  - reg
+  - no-map
+
+examples:
+  - |
+  reserved-memory {
+    #address-cells = <2>;
+    #size-cells = <2>;
+
+    sdp@3e800000 {
+      compatible = "linaro,restricted-heap";
+      no-map;
+      reg = <0 0x3E800000 0 0x00400000>;
+    };
+  };
-- 
2.34.1

