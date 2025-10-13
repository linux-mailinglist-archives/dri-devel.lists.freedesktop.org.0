Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 49C1BBD6436
	for <lists+dri-devel@lfdr.de>; Mon, 13 Oct 2025 22:52:24 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 7E73F10E515;
	Mon, 13 Oct 2025 20:52:22 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=gmail.com header.i=@gmail.com header.b="YAfwEPEE";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-pj1-f44.google.com (mail-pj1-f44.google.com
 [209.85.216.44])
 by gabe.freedesktop.org (Postfix) with ESMTPS id E74FC10E515
 for <dri-devel@lists.freedesktop.org>; Mon, 13 Oct 2025 20:52:20 +0000 (UTC)
Received: by mail-pj1-f44.google.com with SMTP id
 98e67ed59e1d1-32eb76b9039so5942452a91.1
 for <dri-devel@lists.freedesktop.org>; Mon, 13 Oct 2025 13:52:20 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20230601; t=1760388740; x=1760993540; darn=lists.freedesktop.org;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:from:to:cc:subject:date
 :message-id:reply-to;
 bh=LxZ/iMk0sFlFcogYti23NV41Ls4gRV33Q62yrcsixBo=;
 b=YAfwEPEEjhOhKpeLzTFds4VOVkkMAMJJTSUThkfLSskJ6Szt1XN17QK2yatCwNNGfK
 9gfGnrM+pIL/VLvpYtUiz6OcM0zbkV2HrajsXoMLl8iKObm9MpyxCaw7cP2LfilWDnGe
 P/MjFOhl9RUisibqKLlebi4oG762O4lPcBogymvxOa5uzY/ZM9Rb/yDVw3D0t5zEo9sd
 UHnrDvNzVKU+n99mhXzXxsUdiymU2fbQ6Ti1kZjCpXJtBYqCbvFpB/fGUSnaDUW58uVy
 VfZPevhMwOF5wZjJ4YNKSjwONiN4jw2Vz1pG20hjnS7Av+B9YDJt2ykj0SSGCH6IImRQ
 yGKQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1760388740; x=1760993540;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=LxZ/iMk0sFlFcogYti23NV41Ls4gRV33Q62yrcsixBo=;
 b=bWU/KpliXYrPrQKmSjy+WwANOCe7RMu7uFBpeiHgYyx8bur9dEJp5Go1hWWUZUM0+q
 GJ9YlUIhSp6We9xUU4RHBU+Zit27uodAAassxXcomrtPKtBUu4hZnjfFtI84gHulTfUe
 Mp9h8rBZGh5fEACV+s82oo2Jv65IhotPDfX5LCevV1EY7sVBQrgw/tlSmG7iNkbkdQQJ
 kNftLOCQxs+trUAEddTM1FoZcsyVdbioCq3h0lS31ZfmUHqoIfEgSElLoV2Fw9idu/jZ
 174O3FgsGX/Qp825VuTQ1+duy/jQUTuoWfbGVONNEPHAiE85Zn+0CDNt2YPtDxMuDhsO
 aEnQ==
X-Forwarded-Encrypted: i=1;
 AJvYcCVEUCAPl2eQheXtBzXSuIFDHwtJeWMSwmv8pWgtkzXujYqocUfWHAMAk+hm2GRJm1/g0Xp+QwbXwYE=@lists.freedesktop.org
X-Gm-Message-State: AOJu0YwGe1/etDpqCPVCRKP1aBY2YTxA3BgWAKx+zxcnm9p8xEE2yA4w
 V+yUw+yAKtimFGTZolLyAgtu8L2UJZAYuAIbmqbuHhwvR72zMRNBSMxu
X-Gm-Gg: ASbGnctecJ+lTKcAuMlISv9jS1wAkQukYYngjUlBuyO341Z2BQ1IhBkzdBHfbtyZojo
 /KFXy5h5k/XrDq0UN4M0CfAmd9a8KFVGYpdwXeF7h7lyWAO0TpXqPgv3xHSzitYticzF/9fgXko
 pqhF5fu4f61q0FfMD+CaOD4cn5PCBJj7qQLZqV/1CByGxllwJBHd1uB7pTr9bwvaqWjmJAATREU
 GxRAcj0mjNEt2poJvtEln6LhQjYPakKAr+dWnSRBQ9WzzQVxEMV4hDG428eUuOWjZmId65cf3aB
 HcZOoVZpesQL9IW5JDcZtshjswBHNk7kbs0eCLLG3JKKqR2TLNhT+XS8+uRzRV3NekVwOujdB9l
 CdgvsnOFS/n9EwFMifiW2f7H5pRGOpqUb/xAYdFDh8OzOgYw7gNVFEHw=
X-Google-Smtp-Source: AGHT+IGoPwwLuuZSmqvJkvje9JpdAVuLDDPRbWWI2juN47Cw6JrjLQfw15al6qeoEvpbB9EAopUh4w==
X-Received: by 2002:a17:90b:4ac7:b0:32e:e150:8937 with SMTP id
 98e67ed59e1d1-33b510f8f23mr35543703a91.6.1760388740438; 
 Mon, 13 Oct 2025 13:52:20 -0700 (PDT)
Received: from fabio-Precision-3551.. ([2804:14c:485:4b61:cc82:37a1:ecfc:e51c])
 by smtp.gmail.com with ESMTPSA id
 98e67ed59e1d1-33b61acc413sm13445147a91.20.2025.10.13.13.52.15
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Mon, 13 Oct 2025 13:52:20 -0700 (PDT)
From: Fabio Estevam <festevam@gmail.com>
To: victor.liu@nxp.com
Cc: marex@denx.de, stefan@agner.ch, airlied@gmail.com, simona@ffwll.ch,
 maarten.lankhorst@linux.intel.com, mripard@kernel.org, tzimmermann@suse.de,
 robh@kernel.org, krzk+dt@kernel.org, conor+dt@kernel.org,
 dri-devel@lists.freedesktop.org, devicetree@vger.kernel.org,
 shawnguo@kernel.org, imx@lists.linux.dev,
 linux-arm-kernel@lists.infradead.org, Fabio Estevam <festevam@gmail.com>,
 Ahmad Fatoum <a.fatoum@pengutronix.de>, Frank Li <Frank.Li@nxp.com>
Subject: [PATCH RESEND v4 2/3] dt-bindings: lcdif: Expand the imx6sl/imx6sll
 fallbacks
Date: Mon, 13 Oct 2025 17:51:54 -0300
Message-Id: <20251013205155.1187947-2-festevam@gmail.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20251013205155.1187947-1-festevam@gmail.com>
References: <20251013205155.1187947-1-festevam@gmail.com>
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
Reviewed-by: Frank Li <Frank.Li@nxp.com>
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

