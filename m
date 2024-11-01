Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 4AA1A9B92A1
	for <lists+dri-devel@lfdr.de>; Fri,  1 Nov 2024 14:54:34 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id B45AE10E9DA;
	Fri,  1 Nov 2024 13:54:32 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=gmail.com header.i=@gmail.com header.b="XrVUS0hK";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-pf1-f178.google.com (mail-pf1-f178.google.com
 [209.85.210.178])
 by gabe.freedesktop.org (Postfix) with ESMTPS id A0F2B10E9D8
 for <dri-devel@lists.freedesktop.org>; Fri,  1 Nov 2024 13:54:30 +0000 (UTC)
Received: by mail-pf1-f178.google.com with SMTP id
 d2e1a72fcca58-720cb6ac25aso807002b3a.3
 for <dri-devel@lists.freedesktop.org>; Fri, 01 Nov 2024 06:54:30 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20230601; t=1730469270; x=1731074070; darn=lists.freedesktop.org;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:from:to:cc:subject:date
 :message-id:reply-to;
 bh=ZU7MAARj0sncxwFgqQLvOZGjw24c60A4QeqGtRoxeC4=;
 b=XrVUS0hKg8nIbveljIKL/PUPpCZBnsFOdmeqDgPzpWaTYpIZxrNC9JIN3/R6wzSSbc
 jUuXRR/O1VNI4d8Xzq8d/CSXWYuRzKAWQwqMREKES4iOQmdh0n+6n+5Z0UQRiCADdEiV
 gpnr02CjqXQE3Z0QFZokbbZk8dfV1zUpVu/bIX5QW3t9ER7hSWx+LIRnwJrprzUTEylw
 /cy4ph9Cf6YwP0jhKeEi6bK/wspmp+uWhyUncz2ulc6qglQeLlPBzxu4g3GyTpJjAPYX
 h2cyV/Tu8jop4lwp19EZtSPdkwQbJatnmzSWZFNgftyHJXZohcxPuFwemFHqyHFjqIEq
 RMRA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1730469270; x=1731074070;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=ZU7MAARj0sncxwFgqQLvOZGjw24c60A4QeqGtRoxeC4=;
 b=Z0SPCUh25peHtfnA5Q6ItMQhP7F4S7h+dvrqbYHreH/jIaJdLbFDo0fnzVL3m+galc
 OcOOPQObAE6rwU9fy0xj6UrIZe2fI6xwf9P2jwQO+aw8x8P9ggive2PmWltH1nMWVEDf
 45tiBedldhKJEINLqj7TvHiSzrh0F3kF/faASOF+vU5jYPPifE+3KONqL4V+jlfhIFBI
 i/CLF7m3fnP3eEmHm7qBcGPmix9Mu7fR6/OEz8sd9hyWnfzFGm7rj4Oacxr8RzOt6IxC
 dPl+ecREHagNBJ4UgyUM7WnRohlAFmYvnOB4GbVA07m+m6dXj2ErAlGzIImuRz2nwfgt
 q1Hg==
X-Forwarded-Encrypted: i=1;
 AJvYcCUDg5hcjeRt+u6eRC4Z/kfKAd9+fGLMhIQxVp7f83tkLrgSH6wPCbpy8X3BHIT8SXExQBODv4s8PK8=@lists.freedesktop.org
X-Gm-Message-State: AOJu0Yy08ELD2X4fE3RL3t2rKuDhPKQrF0raJ2Am8IF/M66UusHOdOvy
 Ib1AbeR2XJS+VXN1J3xP8zj3WGzMLqo2zfxC5bupqL9/i62fDdBDauaX/w==
X-Google-Smtp-Source: AGHT+IFNvODyOXFIZrFt2e8iiDHQo2FUGoSfpLAmSpRo47uVpMec5MwoTYVpy0Ef1+U4+wcnRG9sbA==
X-Received: by 2002:a05:6a00:3e16:b0:720:2dbf:9f60 with SMTP id
 d2e1a72fcca58-72062fd6edfmr33829235b3a.16.1730469269993; 
 Fri, 01 Nov 2024 06:54:29 -0700 (PDT)
Received: from fabio-Precision-3551.. ([2804:14c:485:4b61:f81d:d4e5:9f89:77f2])
 by smtp.gmail.com with ESMTPSA id
 d2e1a72fcca58-720bc1eb3a7sm2656270b3a.81.2024.11.01.06.54.26
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Fri, 01 Nov 2024 06:54:29 -0700 (PDT)
From: Fabio Estevam <festevam@gmail.com>
To: shawnguo@kernel.org
Cc: marex@denx.de, a.fatoum@pengutronix.de, andreas@kemnade.info,
 kernel@pengutronix.de, robh@kernel.org, krzk+dt@kernel.org,
 conor+dt@kernel.org, devicetree@vger.kernel.org, imx@lists.linux.dev,
 linux-arm-kernel@lists.infradead.org, dri-devel@lists.freedesktop.org,
 Fabio Estevam <festevam@denx.de>
Subject: [PATCH v4 2/3] dt-bindings: lcdif: Expand the imx6sl/imx6sll fallbacks
Date: Fri,  1 Nov 2024 10:54:05 -0300
Message-Id: <20241101135406.47836-2-festevam@gmail.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20241101135406.47836-1-festevam@gmail.com>
References: <20241101135406.47836-1-festevam@gmail.com>
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
Changes since v3:
- None.

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

