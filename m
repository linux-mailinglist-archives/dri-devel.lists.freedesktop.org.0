Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 92604C038DC
	for <lists+dri-devel@lfdr.de>; Thu, 23 Oct 2025 23:34:11 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id BCDF210E94A;
	Thu, 23 Oct 2025 21:34:08 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=fail reason="signature verification failed" (2048-bit key; unprotected) header.d=gmail.com header.i=@gmail.com header.b="l5W0NaIM";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-pj1-f42.google.com (mail-pj1-f42.google.com
 [209.85.216.42])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 1489F10E94A
 for <dri-devel@lists.freedesktop.org>; Thu, 23 Oct 2025 21:34:07 +0000 (UTC)
Received: by mail-pj1-f42.google.com with SMTP id
 98e67ed59e1d1-33be037cf73so1493816a91.2
 for <dri-devel@lists.freedesktop.org>; Thu, 23 Oct 2025 14:34:07 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20230601; t=1761255246; x=1761860046; darn=lists.freedesktop.org;
 h=content-transfer-encoding:mime-version:message-id:date:subject:cc
 :to:from:from:to:cc:subject:date:message-id:reply-to;
 bh=q2pvfpdVDgSz+tiqLq0LEmu6krJe5n3X3t1r06M3DaI=;
 b=l5W0NaIMPp7CZiM3WM+0RIq+olADtwd+vM1/OcKl2L+150nInH8UVAnuXXkboBCzHS
 1l008tFKmeUNZ43kXV7bzUR+rgnvGANCadD77C4K0/PlcmY5t6DtGcrn8FPrsYLEfNg7
 OU3zyABqQNZVHyl+s5d6cKzcJCEZcURb2IDeBxytOP9U/mqJr9t4qQ+dxrjN5QgUENui
 Y0LJtiZrtvLXbjK1knUInLdiVgFkuv/5OATxIQRrDWCMy5bCaRJrE0MWb7p3IgoWZZRA
 rIysEa4hEGk3wb9k1DaQlUNJxr56sluAJ3jhclhO0VEidSkF7mEOB4Xqluj5VTw/Jt/+
 nHUA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1761255246; x=1761860046;
 h=content-transfer-encoding:mime-version:message-id:date:subject:cc
 :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
 :reply-to;
 bh=q2pvfpdVDgSz+tiqLq0LEmu6krJe5n3X3t1r06M3DaI=;
 b=hYiOHy+etyXRaoqcA4BqvOH8j+zPmzD79QqA2Uv6fm0DVYmz+XJMIKwyUgTMUh0ETy
 4gF6YsiCc24I+Gl5V4pqE4hdB9r/QVKASWBQrWtW2Lm+uwryQYmF7IPqqix7BJ14opRh
 DwuJOb1eOB7y8zt2Bg2uDRUq9A7D0frbu4OTi8UQH4dGdXTPsO1YL6uqjLCudHOPhSu0
 03Pu40E26UgeQY+VG4M4pmP+YbUTyFSPE5RFrVIHIHKZXAQjbyTKT9iedRILthKCyxzp
 pbah9BNqTkh6QIAwvuklR6KB+mYmRq00mDGvSzHmyHoGZCGGqYGd6quB2mtt1VLODPlk
 V26Q==
X-Gm-Message-State: AOJu0Yyo5ql0iyOrMKhX0+FCOXfmjrQVOJxjMec6Pg563w1mQ8v0n//J
 F3F0Blwzt0ySTipD0Ki1+WS6AQcSeLfcGM9hZsBXO8HoV9BmzGlv/ayY
X-Gm-Gg: ASbGncs2komDXx7gEpZoI0nOomE9/IP9TpmP2VsscZRE84z0zUX3xLHyh5o1KR1wgPp
 lGtwA8ttpbEI5Wk73a0J8XxwkLGsCxPUuq7qORCS2JpEDheThF/O0+9oOQR4hKD2Ul3OUblklnF
 ea0qANVoqEfzFK81GJQ+K2frV4PnFG9bgj9E0P5KRJtFveHS2gYkWujAjqAoMMNeZFSt/mUYYuu
 ZIaPgw1aRvVHrBFq2nf3y6r2aZV2IuRtnZ49n+UuNw1nFGtfp7SSiIqxBn76eZvRkg8UiXT+2+C
 4KY06AHi7vPQxFnkeuvwOnXK36TkpJc3HVEagobajIQxKcIOqDAz6KtjxoPN9nL2CFMYLAqhwaw
 iBCzMsSkh1ibhuL2Q4aBTjh+FxlLDqQsWjT04x5eh1oUINrmXPR9gLcpNqq2yA3j99FXSqig33b
 +xEh97GKTsIWbUp/8AJzNbPZovgPM/4Q==
X-Google-Smtp-Source: AGHT+IF3YGWDNWYMokVO+WXERUpBjg0IQ+EhQnmcd8t7unNBGwlJ5PPtm2xykzvuMO9uNrjZL1vC5Q==
X-Received: by 2002:a17:90b:3e43:b0:339:cece:a99 with SMTP id
 98e67ed59e1d1-33bcf86c699mr37737123a91.13.1761255246585; 
 Thu, 23 Oct 2025 14:34:06 -0700 (PDT)
Received: from iku.. ([2401:4900:1c06:ef2:36b5:9454:6fa:e888])
 by smtp.gmail.com with ESMTPSA id
 98e67ed59e1d1-33fb017249asm3450734a91.14.2025.10.23.14.34.00
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Thu, 23 Oct 2025 14:34:05 -0700 (PDT)
From: Prabhakar <prabhakar.csengg@gmail.com>
X-Google-Original-From: Prabhakar <prabhakar.mahadev-lad.rj@bp.renesas.com>
To: Biju Das <biju.das.jz@bp.renesas.com>, David Airlie <airlied@gmail.com>,
 Simona Vetter <simona@ffwll.ch>,
 Maarten Lankhorst <maarten.lankhorst@linux.intel.com>,
 Maxime Ripard <mripard@kernel.org>,
 Thomas Zimmermann <tzimmermann@suse.de>, Rob Herring <robh@kernel.org>,
 Krzysztof Kozlowski <krzk+dt@kernel.org>,
 Conor Dooley <conor+dt@kernel.org>,
 Geert Uytterhoeven <geert+renesas@glider.be>,
 Magnus Damm <magnus.damm@gmail.com>,
 Laurent Pinchart <laurent.pinchart+renesas@ideasonboard.com>
Cc: dri-devel@lists.freedesktop.org, linux-renesas-soc@vger.kernel.org,
 devicetree@vger.kernel.org, linux-kernel@vger.kernel.org,
 Prabhakar <prabhakar.csengg@gmail.com>,
 Fabrizio Castro <fabrizio.castro.jz@renesas.com>,
 Lad Prabhakar <prabhakar.mahadev-lad.rj@bp.renesas.com>,
 Conor Dooley <conor.dooley@microchip.com>
Subject: [PATCH v2] dt-bindings: display: renesas,
 rzg2l-du: Add support for RZ/V2N SoC
Date: Thu, 23 Oct 2025 22:33:50 +0100
Message-ID: <20251023213350.681602-1-prabhakar.mahadev-lad.rj@bp.renesas.com>
X-Mailer: git-send-email 2.43.0
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

From: Lad Prabhakar <prabhakar.mahadev-lad.rj@bp.renesas.com>

Document support for the DU IP found on the Renesas RZ/V2N (R9A09G056) SoC.
The DU IP is functionally identical to that on the RZ/V2H(P) SoC, so no
driver changes are needed. The existing `renesas,r9a09g057-du` compatible
will be used as a fallback for the RZ/V2N SoC.

Signed-off-by: Lad Prabhakar <prabhakar.mahadev-lad.rj@bp.renesas.com>
Reviewed-by: Laurent Pinchart <laurent.pinchart+renesas@ideasonboard.com>
Acked-by: Conor Dooley <conor.dooley@microchip.com>
Reviewed-by: Geert Uytterhoeven <geert+renesas@glider.be>
---
v1->v2
- Added Reviewed-by and Acked-by tags.

v1: https://lore.kernel.org/all/20250609231905.511904-1-prabhakar.mahadev-lad.rj@bp.renesas.com/
---
 .../devicetree/bindings/display/renesas,rzg2l-du.yaml          | 3 +++
 1 file changed, 3 insertions(+)

diff --git a/Documentation/devicetree/bindings/display/renesas,rzg2l-du.yaml b/Documentation/devicetree/bindings/display/renesas,rzg2l-du.yaml
index 1e32d14b6edb..2cc66dcef870 100644
--- a/Documentation/devicetree/bindings/display/renesas,rzg2l-du.yaml
+++ b/Documentation/devicetree/bindings/display/renesas,rzg2l-du.yaml
@@ -25,6 +25,9 @@ properties:
           - enum:
               - renesas,r9a07g054-du    # RZ/V2L
           - const: renesas,r9a07g044-du # RZ/G2L fallback
+      - items:
+          - const: renesas,r9a09g056-du # RZ/V2N
+          - const: renesas,r9a09g057-du # RZ/V2H(P) fallback
 
   reg:
     maxItems: 1
-- 
2.43.0

