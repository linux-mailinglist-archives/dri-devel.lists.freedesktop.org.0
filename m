Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 11FFC9B5290
	for <lists+dri-devel@lfdr.de>; Tue, 29 Oct 2024 20:16:57 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 06CF610E6EB;
	Tue, 29 Oct 2024 19:16:55 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=gmail.com header.i=@gmail.com header.b="hdJLHpjO";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-pg1-f181.google.com (mail-pg1-f181.google.com
 [209.85.215.181])
 by gabe.freedesktop.org (Postfix) with ESMTPS id CDA4710E6EA
 for <dri-devel@lists.freedesktop.org>; Tue, 29 Oct 2024 19:16:51 +0000 (UTC)
Received: by mail-pg1-f181.google.com with SMTP id
 41be03b00d2f7-7db54269325so4358477a12.2
 for <dri-devel@lists.freedesktop.org>; Tue, 29 Oct 2024 12:16:51 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20230601; t=1730229411; x=1730834211; darn=lists.freedesktop.org;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:from:to:cc:subject:date
 :message-id:reply-to;
 bh=Go75F5WGin7Ix/MZ1KEJuNCfk0dx2TFxpmOXy5zXdWs=;
 b=hdJLHpjO4zMHNZ15q2Lqjb6WLIWPBI5Kt4tlyT3SaO8RC1BgJWVHK9uGuyFguUk2hY
 ziBQzGtLsyrO7Kxa2zIM7v+ME4MDBGumbg8Cnlgaa6YWzISYA/uLlnGCwP+Bbu9HfeRm
 K2W2YiUEjlogIglt5cePcIq9l/P1KAQ2hlAJC0/0EBq6Tu+ubUQXVTjyY2A65ZEfJAux
 PhbCnz+H+mB0RozKk47EOX28UyzwsiqlYSAp92+gBlYhnMQ3XI9tiQkh6BetSo55hss/
 SkU87UMuqpOpUsss3mXpubxwOQZhDtaQjjhZlPQn5k8HhfSEXg0/wRyQMLIqGcP2moWz
 nbtg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1730229411; x=1730834211;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=Go75F5WGin7Ix/MZ1KEJuNCfk0dx2TFxpmOXy5zXdWs=;
 b=kMdOha2IlayLm4ksv0wFq4h58GjIsXnnLFI4NnZM1W9jRbtN5eNWeY61vqVI1Avkwr
 TNxUXxE3nJ5Ysbj4JiIwfyaHUoycDNhychOHJyx69on95jHB/PNAHLqreOJqokqzs8x8
 ajKEgnqqvrHEuYCHwIy0wz0TfRUKHZpHVm61FWu3pC4kvYCWgUH4LlR7mSkgS7qIj9WY
 n090EY41gC63GCpcW1DFPmNQwIFkuaons9VRNiMu3STEhc6Ng4CmiJNVsrvnYOBMW5sI
 hp9kM6CGx/Ua7pf5qhbQgrt/YvtZjcnYjcbTPFrMqx7Tcrr3R4fqw/loPJOvJsVr5PpI
 JXpQ==
X-Forwarded-Encrypted: i=1;
 AJvYcCXkoDxfcD2oWAxAH/Elz4OaAsOxOUv4RH19lLVuwAplHpkbhFsytNm7ljFBereROhYXjFd5i9oFVAg=@lists.freedesktop.org
X-Gm-Message-State: AOJu0Yz6JSKIP54B1faAuQRrRCyV9tfNze1BT2sfi2c7cQiLJeAsRnoj
 fClGCRg7hUtzuvr6TQ++MZil5uLsHm+IoZfxgcNCI7jdt+kjXnyY
X-Google-Smtp-Source: AGHT+IFenngeaT6t8iIEBhKoMZoPByKBmWfPEehMYTOwuzAHWbQ1Z6ZF1XwcmALtKo2mLUrDVAj/Zw==
X-Received: by 2002:a05:6a21:3a41:b0:1d9:237a:2d56 with SMTP id
 adf61e73a8af0-1d9a8512cedmr15070567637.48.1730229411268; 
 Tue, 29 Oct 2024 12:16:51 -0700 (PDT)
Received: from fabio-Precision-3551.. ([2804:14c:485:4b61:190a:1425:254d:1e7a])
 by smtp.gmail.com with ESMTPSA id
 41be03b00d2f7-7edc8661061sm7842346a12.17.2024.10.29.12.16.47
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Tue, 29 Oct 2024 12:16:50 -0700 (PDT)
From: Fabio Estevam <festevam@gmail.com>
To: shawnguo@kernel.org
Cc: marex@denx.de, a.fatoum@pengutronix.de, andreas@kemnade.info,
 kernel@pengutronix.de, robh@kernel.org, krzk+dt@kernel.org,
 conor+dt@kernel.org, devicetree@vger.kernel.org, imx@lists.linux.dev,
 linux-arm-kernel@lists.infradead.org, dri-devel@lists.freedesktop.org,
 Fabio Estevam <festevam@denx.de>
Subject: [PATCH v3 2/3] dt-bindings: lcdif: Expand the imx6sl/imx6sll fallbacks
Date: Tue, 29 Oct 2024 16:16:39 -0300
Message-Id: <20241029191640.379315-2-festevam@gmail.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20241029191640.379315-1-festevam@gmail.com>
References: <20241029191640.379315-1-festevam@gmail.com>
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

From: Fabio Estevam <festevam@denx.de>

mx6sl.dtsi and imx6sll.dtsi have the following lcdif entries:

compatible = "fsl,imx6sl-lcdif", "fsl,imx28-lcdif";

This causes dt-schema warnings as the current binding only
allow 'fsl,imx6sx-lcdif' as fallback.

['fsl,imx6sl-lcdif', 'fsl,imx28-lcdif'] is too long
['fsl,imx6sll-lcdif', 'fsl,imx28-lcdif'] is too long

The imx6sx-lcdif programming model has more advanced features, such
as overlay plane and the CRC32 support than the imx28-lcdif IP.

Expand the imx6sl/imx6sll lcdif fallbacks to accept a less specific
fsl,imx28-lcdif fallback:

compatible = "fsl,imx6sl-lcdif", "fsl,imx6sx-lcdif", "fsl,imx28-lcdif";

This helps keeping DT compatibility as well as using the more advanced
lcdif features found on imx6sl and imx6sll.

Signed-off-by: Fabio Estevam <festevam@denx.de>
---
Changes since v2:
- Make the three compatible entres the only valid combination
for imx6sl and imx6sll (Andreas).

 Documentation/devicetree/bindings/display/fsl,lcdif.yaml | 8 ++++++--
 1 file changed, 6 insertions(+), 2 deletions(-)

diff --git a/Documentation/devicetree/bindings/display/fsl,lcdif.yaml b/Documentation/devicetree/bindings/display/fsl,lcdif.yaml
index ad0cca562463..72e509bc975b 100644
--- a/Documentation/devicetree/bindings/display/fsl,lcdif.yaml
+++ b/Documentation/devicetree/bindings/display/fsl,lcdif.yaml
@@ -23,14 +23,18 @@ properties:
           - fsl,imx93-lcdif
       - items:
           - enum:
-              - fsl,imx6sl-lcdif
-              - fsl,imx6sll-lcdif
               - fsl,imx6ul-lcdif
               - fsl,imx7d-lcdif
               - fsl,imx8mm-lcdif
               - fsl,imx8mn-lcdif
               - fsl,imx8mq-lcdif
           - const: fsl,imx6sx-lcdif
+      - items:
+          - enum:
+              - fsl,imx6sl-lcdif
+              - fsl,imx6sll-lcdif
+          - const: fsl,imx6sx-lcdif
+          - const: fsl,imx28-lcdif
       - items:
           - enum:
               - fsl,imx6sx-lcdif
-- 
2.34.1

