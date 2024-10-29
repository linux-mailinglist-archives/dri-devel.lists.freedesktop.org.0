Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 612F09B48D9
	for <lists+dri-devel@lfdr.de>; Tue, 29 Oct 2024 13:02:59 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id CC12610E639;
	Tue, 29 Oct 2024 12:02:55 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=gmail.com header.i=@gmail.com header.b="ge17RNL0";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-pf1-f178.google.com (mail-pf1-f178.google.com
 [209.85.210.178])
 by gabe.freedesktop.org (Postfix) with ESMTPS id CA5A310E639
 for <dri-devel@lists.freedesktop.org>; Tue, 29 Oct 2024 12:02:52 +0000 (UTC)
Received: by mail-pf1-f178.google.com with SMTP id
 d2e1a72fcca58-71e6cec7227so4414516b3a.0
 for <dri-devel@lists.freedesktop.org>; Tue, 29 Oct 2024 05:02:52 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20230601; t=1730203372; x=1730808172; darn=lists.freedesktop.org;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:from:to:cc:subject:date
 :message-id:reply-to;
 bh=0AT+opKILsnoMVSAUc1Gmwyy4HAQ63QQQzsawGp/uow=;
 b=ge17RNL0MY6ILIYxo6rwdguoHpQdPMQQ4/DL4j3Pabdhz1e2FvRhqSgY+GEVoJnThf
 UiueRWR/SKl7Z4kwHUuwaY2J0KaI1aaIq7QeHrvJPtVicrotZC6p5DdmqX/pbqi3mrp8
 DrhEkDQF0chcKVEaaCrFTD7p8yf6ffritzYxQU/+iQ6um7PMRc0wDE9gWdBzg2Oaul/Q
 IsHdN+ppmGdeLsx++PklGzhdVFIhVhL8sDIQ9zxvP5zkZXU7ht3ks7glBLOqIF8XNHsb
 BZYhTL5CxLoDnxvrOqJjJynlMCi8S3lv7tvBL5W3i0WCZBD3+4FtjyiClsmfFeD1pXAH
 bO7g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1730203372; x=1730808172;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=0AT+opKILsnoMVSAUc1Gmwyy4HAQ63QQQzsawGp/uow=;
 b=i3Hd55dIq+0OeE3k1gLOt/Nvu8ntk12JDuvgTxHKYys2xiOQDBcGxqStDnYQx4GX4d
 FGouUB5MJF6lfdvc2jTnXBdLN5Q3K0Y8x6UTf8Uq0Zu4jJy3GttSQLGIhlrYs49JdC/9
 DefdejPZzbEV5QzZyJjFezlnaMMlCznSphEzrOJOqoicfiOSTNRQfZ2+dYvWt7BOpCTD
 P/5UuRPFn8cZ3HBsQO32NaRBoSQWvASJaxklgeE+XZdCz9N2zjLR2D6vrsvr1QZoJrhp
 zifnKTL0T5XhYPrtdVz+gVVzvP9jYUXFfm1pYYvJueYXFVEV5k82lZj0rGg+ZKnteStJ
 SKRw==
X-Forwarded-Encrypted: i=1;
 AJvYcCUgkxg079X+TQpCaLRG19muAI060CQkFG9JPI745juqPlE46IkVFMNh2ShO2q28aeAKIwvWqc6LxRg=@lists.freedesktop.org
X-Gm-Message-State: AOJu0YxOJAb2qwJdOq02PKK8cuBG47cG4AU3It7kmAxJ9wAJHm2kFG0L
 Hg5F/bTaEayK+RUV5H8is/93Qy/db6aKfUu1VXxdEf9z6lMfVPEr
X-Google-Smtp-Source: AGHT+IGSaPWzwYRZBKjWD9RrHpvpb6Xg8xbKX+Ux5F+Yk2959JKoj++AuEEpzabc99znDi3atvlmfA==
X-Received: by 2002:a05:6a00:1703:b0:71e:5d1d:1aa2 with SMTP id
 d2e1a72fcca58-72062fa0b5bmr16981266b3a.7.1730203371964; 
 Tue, 29 Oct 2024 05:02:51 -0700 (PDT)
Received: from fabio-Precision-3551.. ([2804:14c:485:4b61:c7e4:1ef3:7ef7:5ae0])
 by smtp.gmail.com with ESMTPSA id
 d2e1a72fcca58-72057a0b7d2sm7428830b3a.114.2024.10.29.05.02.48
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Tue, 29 Oct 2024 05:02:51 -0700 (PDT)
From: Fabio Estevam <festevam@gmail.com>
To: shawnguo@kernel.org
Cc: marex@denx.de, a.fatoum@pengutronix.de, andreas@kemnade.info,
 kernel@pengutronix.de, robh@kernel.org, krzk+dt@kernel.org,
 conor+dt@kernel.org, devicetree@vger.kernel.org, imx@lists.linux.dev,
 linux-arm-kernel@lists.infradead.org, dri-devel@lists.freedesktop.org,
 Fabio Estevam <festevam@denx.de>
Subject: [PATCH v2 2/3] dt-bindings: lcdif: Expand the imx6sl/imx6sll fallbacks
Date: Tue, 29 Oct 2024 09:02:35 -0300
Message-Id: <20241029120236.299040-2-festevam@gmail.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20241029120236.299040-1-festevam@gmail.com>
References: <20241029120236.299040-1-festevam@gmail.com>
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

imx6sl.dtsi and imx6sll.dtsi have the following lcdif entries:

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
Changes since v1:
- Newly introduced.

 .../devicetree/bindings/display/fsl,lcdif.yaml     | 14 +++++++++++++-
 1 file changed, 13 insertions(+), 1 deletion(-)

diff --git a/Documentation/devicetree/bindings/display/fsl,lcdif.yaml b/Documentation/devicetree/bindings/display/fsl,lcdif.yaml
index 836955de3bc9..08ce19638fbd 100644
--- a/Documentation/devicetree/bindings/display/fsl,lcdif.yaml
+++ b/Documentation/devicetree/bindings/display/fsl,lcdif.yaml
@@ -32,11 +32,23 @@ properties:
               - fsl,imx8mn-lcdif
               - fsl,imx8mq-lcdif
           - const: fsl,imx6sx-lcdif
+      - items:
+          - const: fsl,imx6sl-lcdif
+          - const: fsl,imx6sx-lcdif
+          - const: fsl,imx28-lcdif
+      - items:
+          - const: fsl,imx6sll-lcdif
+          - const: fsl,imx6sx-lcdif
+          - const: fsl,imx28-lcdif
+      - items:
+          - enum:
+              - fsl,imx6sl-lcdif
+              - fsl,imx6sll-lcdif
+          - const: fsl,imx28-lcdif
       - items:
           - enum:
               - fsl,imx6sx-lcdif
           - const: fsl,imx28-lcdif
-
   reg:
     maxItems: 1
 
-- 
2.34.1

