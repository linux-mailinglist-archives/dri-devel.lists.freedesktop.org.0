Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 80865B50AB7
	for <lists+dri-devel@lfdr.de>; Wed, 10 Sep 2025 04:05:50 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 5BA1610E352;
	Wed, 10 Sep 2025 02:05:48 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=gmail.com header.i=@gmail.com header.b="hPs9f3+B";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-pl1-f171.google.com (mail-pl1-f171.google.com
 [209.85.214.171])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 061BA10E352
 for <dri-devel@lists.freedesktop.org>; Wed, 10 Sep 2025 02:05:46 +0000 (UTC)
Received: by mail-pl1-f171.google.com with SMTP id
 d9443c01a7336-2570bf6058aso34426275ad.0
 for <dri-devel@lists.freedesktop.org>; Tue, 09 Sep 2025 19:05:46 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20230601; t=1757469946; x=1758074746; darn=lists.freedesktop.org;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:from:to:cc:subject:date
 :message-id:reply-to;
 bh=zo4VEbVAw3LffR1rR6U74a6Y8xtKLk5HFuoBic2yQiI=;
 b=hPs9f3+BjKIAJl1xGbTIZU+XkU75136gtsIwdfBfqXkdWbvqX8cayYalYtMqYq/H9e
 4PaN83hNMxYxBak3VS0PuDal04u/1VLaadVy+f88w6xIvauFVExoeEmFc30+rMdqnNmG
 0mMFN2d0OR6bPlPhevHQMyxjYv1iFe0n7F1uGZVrRUGSzT8t/pIfqZGHzKQiqVTmbyGn
 ALzeCRvbvd2UhZi3vYML702LKH3HY8bnRwtCwU66x9gHx8yjQ6w7lNoyFV7Xl4MHERKH
 sEy4O4Q73KKhKLLTo3umHAURig1Q+yfAUOs3ckKxHcb8qDswr0p+R8MyF3JL7ybjqPIa
 qYkA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1757469946; x=1758074746;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=zo4VEbVAw3LffR1rR6U74a6Y8xtKLk5HFuoBic2yQiI=;
 b=efKgDt8n74iaM0b700S1hXJ7WmsGQ1ewrIK3mRQhskuTG25dVb3D17ND47n+HE71Ni
 rFBjQJI6K2vZCrx57pE8wXYSoGhn3OUOiX6UJuus+Ueosl/i06MphXjU4A3uTIJL6gwz
 5Fd0TMmyN3z57buqbqD4na3dk5kg6cRxanABNTKxywo7+96TBtIKO6bwcXErBrQ8bk17
 gtJEwDGNAmWDyj4w3MPs0lMVpbohWn8BjrnCQ7ltz25KM2D6JCbAMw46nt6e2pdN0mrl
 TduHLvGDDp3FlbPMKtmESJNQeUTyKWCZoysXttoDOf8s8mYPELEvREFIblh3eUjp+MFw
 1LQg==
X-Forwarded-Encrypted: i=1;
 AJvYcCXa59lz1yQvQRlA7jjO3y8C4bz3rn/pGM3eOFyKT7y4jrqQnjYjmqul05+s9IdBhJgNw6HE/KO0wDI=@lists.freedesktop.org
X-Gm-Message-State: AOJu0Yzc/PnQory85EFD7PrTF+0inQhxYM2RZIvTg3pUBByMouEv6uMz
 UiPrxt49dJHAS/2pH0xJe57IhSR+BCLHOUzObF3JCybLdVgJ8OxLdCrZ
X-Gm-Gg: ASbGncuGJjrtW6diR0Itw4tNRRMweuNlWpP84pp/uyuWVfaNjc6V/txCaUTB2SY5kAm
 gcjg0hjKlpibOhuFsIO257fMYr7laQv26uaBH/1o+ezQIlQCptzcmfQgyahsIf6NtydDofsNH8k
 Uv0N2P6KXiJ0vlrRJsBc9b/enjuVkUFojZiSp3dZq7A56u4KdxwcpkwOwW7CARRXoZ2AKvIUVlW
 JK+o+d4YjkAw832p27mGjPkgN1vlSjcmKL1vLdk8SP+IaO4fFpfpi6I5gFBiL+IoZ9bd6TkSR7q
 nSGvj8B63tmhFdaww9oGjwmcYmeIzQwrlh7xkl2bKj24VrHBZ0BqsAmr2YpfAIIMtvLwYujDZY4
 WCrv+IPfZvA6UwFfgToT197kzeZChzIwtnOZJDUjh6zcQRht4E9s0IMBuGw==
X-Google-Smtp-Source: AGHT+IHwgIhELapLj8nq9Y1ltim4kH1wGUB2p36Co7UlpgEMhsiFminC6HNAiT+4BLErxh/4zd/+aw==
X-Received: by 2002:a17:902:d4d2:b0:24b:1f34:a64c with SMTP id
 d9443c01a7336-2516d52d12bmr169999525ad.10.1757469946427; 
 Tue, 09 Sep 2025 19:05:46 -0700 (PDT)
Received: from fabio-Precision-3551.. ([2804:14c:485:4b61:58b2:c9cb:20c8:e698])
 by smtp.gmail.com with ESMTPSA id
 d9443c01a7336-25a27422bb7sm10607735ad.30.2025.09.09.19.05.43
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Tue, 09 Sep 2025 19:05:46 -0700 (PDT)
From: Fabio Estevam <festevam@gmail.com>
To: shawnguo@kernel.org
Cc: robh@kernel.org, krzk+dt@kernel.org, conor+dt@kernel.org,
 dri-devel@lists.freedesktop.org, devicetree@vger.kernel.org,
 linux-arm-kernel@lists.infradead.org, imx@lists.linux.dev,
 kernel@pengutronix.de, Fabio Estevam <festevam@gmail.com>,
 Ahmad Fatoum <a.fatoum@pengutronix.de>
Subject: [PATCH RESEND v4 2/3] dt-bindings: lcdif: Expand the imx6sl/imx6sll
 fallbacks
Date: Tue,  9 Sep 2025 23:05:24 -0300
Message-Id: <20250910020525.342590-2-festevam@gmail.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20250910020525.342590-1-festevam@gmail.com>
References: <20250910020525.342590-1-festevam@gmail.com>
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

Signed-off-by: Fabio Estevam <festevam@gmail.com>
Acked-by: Rob Herring (Arm) <robh@kernel.org>
Reviewed-by: Ahmad Fatoum <a.fatoum@pengutronix.de>
---
 Documentation/devicetree/bindings/display/fsl,lcdif.yaml | 8 ++++++--
 1 file changed, 6 insertions(+), 2 deletions(-)

diff --git a/Documentation/devicetree/bindings/display/fsl,lcdif.yaml b/Documentation/devicetree/bindings/display/fsl,lcdif.yaml
index ce31b873fb95..d665f3241e97 100644
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

