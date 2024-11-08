Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 9CA899C309D
	for <lists+dri-devel@lfdr.de>; Sun, 10 Nov 2024 03:31:14 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id B615E10E3C4;
	Sun, 10 Nov 2024 02:31:09 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=gmail.com header.i=@gmail.com header.b="Ku4lv8Rc";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-pf1-f182.google.com (mail-pf1-f182.google.com
 [209.85.210.182])
 by gabe.freedesktop.org (Postfix) with ESMTPS id A3A5910EA37
 for <dri-devel@lists.freedesktop.org>; Fri,  8 Nov 2024 20:05:08 +0000 (UTC)
Received: by mail-pf1-f182.google.com with SMTP id
 d2e1a72fcca58-71e592d7f6eso2001026b3a.3
 for <dri-devel@lists.freedesktop.org>; Fri, 08 Nov 2024 12:05:08 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20230601; t=1731096308; x=1731701108; darn=lists.freedesktop.org;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:from:to:cc:subject:date
 :message-id:reply-to;
 bh=fiygXowfj2xS0ANkI4lNzcEmZTYJF85QwdGr+dM89hQ=;
 b=Ku4lv8RccX6ihLuJoezVbAXcepSAJoEzhGilx1vmgjaPV6AYo03yWp3SvAkXMe45wY
 qj7ne5YaChuHvvXhxRRVh0DDUHST/aDjOX9c9qzY+NuRXqjRpHAQGA/knXIMzeKfMVOa
 JIdxwzA7Pbkji7Z0+r5lqGfjw6OrcMz+GVlwmNDuazfXfYm1GZPsA7mQjBh8zUuj0UUU
 6T0cIGsZD6CNBEck7ma02unoRYbOYJxQiIPpl1AKxsxskmbUpHH7RKOmHT6N7glOhECx
 rCyPe5o1ocs3FHQq9KHuo8/l5Y1IA6/RMe9qFoyc3EokJBDuH9C2Yw0I4h3lEakfXPt1
 6hOA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1731096308; x=1731701108;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=fiygXowfj2xS0ANkI4lNzcEmZTYJF85QwdGr+dM89hQ=;
 b=UtWOIZJhvZ2MCiLrOxnkIYuTExkOIJHSPfqoEVQchVAO+zoVrk9aa+N3AZfK0VqOg8
 XOzU0glT+tocABpKdx16kr+Y8ORWfcI8ye9jIGztHlupaQpYPCS6+BhWftQlU9WqPrUz
 4RWilkFMyEqQBXd0uIvdLwLKkBSNd7Eu3X1jhHvqJ6XBI/bwawLpS8j6ovZkrhsQnrLQ
 5u6b/caTpfFmx4uQXTJtbtSMfejZS/NwrK8UCDnqIJoQBcxLULkmpkExUs3OuBlEPR1s
 1fmhlJqCN+lGq5OtqO2db4z76hjf3PJNP+zSiRg6clhpTARj0+2B5euwa6b0/e++P+5A
 pvqw==
X-Forwarded-Encrypted: i=1;
 AJvYcCVLlRzZufCXzIe6ZxMD8W0Q5ZuuAJRtpNxbeJ1jFDgsfBz7C7rL79VKJGta9UDxfyamid/U4Pbg/Ck=@lists.freedesktop.org
X-Gm-Message-State: AOJu0YyPoS+TmH75y3vkpSi5Y5Fv6sFy4vUKaHwD2KNs6axRVTIuGe84
 8vZkcqKIo6EYFldPCtf5MKTWp3gEoknVmsVOmTt/VIjz6wBFkUA1
X-Google-Smtp-Source: AGHT+IHFVcWsj4wQxT4Lvx+sGGBEcUtl52l528efG+ad5oEcb6k9RWZbAuObnKv7LbWbEMApNtaWGQ==
X-Received: by 2002:a05:6a00:1a89:b0:71e:2a0:b0b8 with SMTP id
 d2e1a72fcca58-7241327d630mr4861845b3a.1.1731096308018; 
 Fri, 08 Nov 2024 12:05:08 -0800 (PST)
Received: from mighty.kangaroo-insen.ts.net ([120.88.183.182])
 by smtp.gmail.com with ESMTPSA id
 d2e1a72fcca58-72407a56a30sm4323418b3a.188.2024.11.08.12.05.00
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Fri, 08 Nov 2024 12:05:07 -0800 (PST)
From: Mithil Bavishi <bavishimithil@gmail.com>
To: Aaro Koskinen <aaro.koskinen@iki.fi>,
 Andreas Kemnade <andreas@kemnade.info>,
 Kevin Hilman <khilman@baylibre.com>, Roger Quadros <rogerq@kernel.org>,
 Tony Lindgren <tony@atomide.com>, Rob Herring <robh@kernel.org>,
 Krzysztof Kozlowski <krzk+dt@kernel.org>,
 Conor Dooley <conor+dt@kernel.org>,
 Neil Armstrong <neil.armstrong@linaro.org>, Robert Foss <rfoss@kernel.org>,
 Laurent Pinchart <Laurent.pinchart@ideasonboard.com>,
 Jonas Karlman <jonas@kwiboo.se>, Jernej Skrabec <jernej.skrabec@gmail.com>,
 Maarten Lankhorst <maarten.lankhorst@linux.intel.com>,
 Maxime Ripard <mripard@kernel.org>,
 Thomas Zimmermann <tzimmermann@suse.de>, David Airlie <airlied@gmail.com>,
 Simona Vetter <simona@ffwll.ch>, Jessica Zhang <quic_jesszhan@quicinc.com>,
 Mithil Bavishi <bavishimithil@gmail.com>,
 Lad Prabhakar <prabhakar.mahadev-lad.rj@bp.renesas.com>,
 Thierry Reding <thierry.reding@gmail.com>
Cc: linux-omap@vger.kernel.org, devicetree@vger.kernel.org,
 linux-kernel@vger.kernel.org, dri-devel@lists.freedesktop.org,
 linux-hardening@vger.kernel.org
Subject: [PATCH v3 02/10] dt-bindings: vendor-prefixes: Add Doestek
Date: Fri,  8 Nov 2024 20:04:31 +0000
Message-ID: <20241108200440.7562-3-bavishimithil@gmail.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20241108200440.7562-1-bavishimithil@gmail.com>
References: <20241108200440.7562-1-bavishimithil@gmail.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Mailman-Approved-At: Sun, 10 Nov 2024 02:30:58 +0000
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

Add vendor prefix for Doestek Co., Ltd.
Link: http://www.doestek.co.kr/

Signed-off-by: Mithil Bavishi <bavishimithil@gmail.com>
---
 Documentation/devicetree/bindings/vendor-prefixes.yaml | 2 ++
 1 file changed, 2 insertions(+)

diff --git a/Documentation/devicetree/bindings/vendor-prefixes.yaml b/Documentation/devicetree/bindings/vendor-prefixes.yaml
index b320a39de..3ef4c948a 100644
--- a/Documentation/devicetree/bindings/vendor-prefixes.yaml
+++ b/Documentation/devicetree/bindings/vendor-prefixes.yaml
@@ -392,6 +392,8 @@ patternProperties:
     description: D-Link Corporation
   "^dmo,.*":
     description: Data Modul AG
+  "^doestek,*":
+    description: Doestek Co., Ltd.
   "^domintech,.*":
     description: Domintech Co., Ltd.
   "^dongwoon,.*":
-- 
2.43.0

