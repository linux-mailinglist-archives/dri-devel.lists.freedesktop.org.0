Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id B58DA6B46FB
	for <lists+dri-devel@lfdr.de>; Fri, 10 Mar 2023 15:47:58 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 056F210E8DE;
	Fri, 10 Mar 2023 14:47:57 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-oa1-f47.google.com (mail-oa1-f47.google.com
 [209.85.160.47])
 by gabe.freedesktop.org (Postfix) with ESMTPS id E153F10E8FC
 for <dri-devel@lists.freedesktop.org>; Fri, 10 Mar 2023 14:47:54 +0000 (UTC)
Received: by mail-oa1-f47.google.com with SMTP id
 586e51a60fabf-176d1a112bfso6060183fac.5
 for <dri-devel@lists.freedesktop.org>; Fri, 10 Mar 2023 06:47:54 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112; t=1678459674;
 h=content-transfer-encoding:mime-version:message-id:date:subject:cc
 :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
 :reply-to;
 bh=6cw44gWatMHAFXsp5Bf1XmtOCAdzF/BFR6Jh05S7SHc=;
 b=f4HxTyhJ2fQQokE91WLqe0LWCBEMY6FtpmfaTd8njqVinONdx3Z9ll6BJW0F/rRh+T
 /Z2+UYit3vQEsSXP8OH/jrRyaSTia1b9Dtyc8s9zV/XFC044UgghSaR6+Ez9GP3KRoHM
 yRff+J2vL4tFKj+wQBUyHzkzquWrnAhsLwnGLdoz3w88O2sgpBv/SL/Tv6juFBqBXzZj
 BjKk+wCFmeWw7FcgTbcuC2p5gO4n6074TgpppafWOfwGZwcSD+857visr8+EwMjCSUGJ
 dEjZq7ZBArgNm1lcj9AEJmkr2mUcg2PdgcWZFTXZhovu/DxvpyvUt2awuubBEJmSDyhW
 A2iA==
X-Gm-Message-State: AO0yUKXPIUS7B8aRI5pI52IHN2Qqq+7BFNpk0Pj2ErkoegMi50QZTSP+
 cwk3z7s/ghUZ7nLYgePL2w==
X-Google-Smtp-Source: AK7set+Zj6vvg/AmICk7/oD81/eKSnxwP1Wq1NCl/JJzCI3tJ2URV59x6Vj6oI0pjCaRj+pBsB4pjQ==
X-Received: by 2002:a05:6870:9724:b0:176:4631:3c0d with SMTP id
 n36-20020a056870972400b0017646313c0dmr16556971oaq.34.1678459673974; 
 Fri, 10 Mar 2023 06:47:53 -0800 (PST)
Received: from robh_at_kernel.org (66-90-144-107.dyn.grandenetworks.net.
 [66.90.144.107]) by smtp.gmail.com with ESMTPSA id
 j21-20020a056870d45500b0017697dfc20fsm118605oag.12.2023.03.10.06.47.53
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Fri, 10 Mar 2023 06:47:53 -0800 (PST)
Received: (nullmailer pid 1546147 invoked by uid 1000);
 Fri, 10 Mar 2023 14:47:30 -0000
From: Rob Herring <robh@kernel.org>
To: Lee Jones <lee@kernel.org>, Daniel Thompson <daniel.thompson@linaro.org>,
 Jingoo Han <jingoohan1@gmail.com>, Helge Deller <deller@gmx.de>
Subject: [PATCH] backlight: hx8357: Use of_property_present() for testing DT
 property presence
Date: Fri, 10 Mar 2023 08:47:30 -0600
Message-Id: <20230310144730.1546101-1-robh@kernel.org>
X-Mailer: git-send-email 2.39.2
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
Cc: devicetree@vger.kernel.org, linux-fbdev@vger.kernel.org,
 linux-kernel@vger.kernel.org, dri-devel@lists.freedesktop.org
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

It is preferred to use typed property access functions (i.e.
of_property_read_<type> functions) rather than low-level
of_get_property/of_find_property functions for reading properties. As
part of this, convert of_get_property/of_find_property calls to the
recently added of_property_present() helper when we just want to test
for presence of a property and nothing more.

Signed-off-by: Rob Herring <robh@kernel.org>
---
 drivers/video/backlight/hx8357.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/drivers/video/backlight/hx8357.c b/drivers/video/backlight/hx8357.c
index 9b50bc96e00f..f76d2469d490 100644
--- a/drivers/video/backlight/hx8357.c
+++ b/drivers/video/backlight/hx8357.c
@@ -617,7 +617,7 @@ static int hx8357_probe(struct spi_device *spi)
 		return -EINVAL;
 	}
 
-	if (of_find_property(spi->dev.of_node, "im-gpios", NULL)) {
+	if (of_property_present(spi->dev.of_node, "im-gpios")) {
 		lcd->use_im_pins = 1;
 
 		for (i = 0; i < HX8357_NUM_IM_PINS; i++) {
-- 
2.39.2

