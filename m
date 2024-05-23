Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 48ADB8CD29B
	for <lists+dri-devel@lfdr.de>; Thu, 23 May 2024 14:49:42 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 1996310E208;
	Thu, 23 May 2024 12:49:40 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=baylibre-com.20230601.gappssmtp.com header.i=@baylibre-com.20230601.gappssmtp.com header.b="R5lO5Yn0";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-wr1-f41.google.com (mail-wr1-f41.google.com
 [209.85.221.41])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 6D4B210E208
 for <dri-devel@lists.freedesktop.org>; Thu, 23 May 2024 12:49:31 +0000 (UTC)
Received: by mail-wr1-f41.google.com with SMTP id
 ffacd0b85a97d-354de3c5d00so913102f8f.1
 for <dri-devel@lists.freedesktop.org>; Thu, 23 May 2024 05:49:31 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=baylibre-com.20230601.gappssmtp.com; s=20230601; t=1716468570; x=1717073370;
 darn=lists.freedesktop.org; 
 h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
 :mime-version:subject:date:from:from:to:cc:subject:date:message-id
 :reply-to; bh=ZBEEdHfSM5OUHXjJOAmjPz7SL/vpjvoUncaFIjx2+EQ=;
 b=R5lO5Yn0MjglsgDd5Ra63G085QEmPq0Q7bvc/gcgfUaSa1OqAWiTVWiSQlRLok7kA6
 grGV5vf9gpF9A9lMgJw+J02l1fXWNB5JUrPOS9jTD737sE9cjZjqyF65oZ58/Fm5rFUD
 W4+rfE/OiPhiOl+tcA47KLcLcntaMZx5nhRtuWCiks3Nlvf3gGst56PJFJuKqarcYh2v
 klISbVqiprpDjTlJ646akDnlOOpv1FupE9YPmNuljK/6/IVLHX3fRTzhlhqeFouU4Q1W
 no/R2RGx3y2VujrochofCGU9sdN1c/9DyAKt9sK46z47n5CFXoV9+s5bAfFf8hTXS9TP
 7MnQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1716468570; x=1717073370;
 h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
 :mime-version:subject:date:from:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=ZBEEdHfSM5OUHXjJOAmjPz7SL/vpjvoUncaFIjx2+EQ=;
 b=sntdLne76YMtBKKO36RbvjX5IhpigKJ5RdzOGsvs755EQc3XNDaM7/6abkN7v0984m
 /gqlRlKHrbWmLHpZFPqrCLNEGQ2X7doGR08sNRlsHHoeGPj5jYwGygmvdmAF1Sp4sry9
 TsLTwWMiqY0Pua32tWF92b6Pu9cAZEK1hDS5VReIxFfOHYvxWLEbqJ0oclObVTZbhOAV
 UWkY3TVwCuwYo5M36D0eyc4jFgUlrZ68dvsBKJ6hxU22TscFaXz5yAsJ5uPxW+r9/SUB
 SKoF7lxuR0qhmO7MPIZQe26AdHLy7pifzLUYvDVubBsxW2cCkJN45Lk8bFw4gCqdEi8K
 ksKA==
X-Gm-Message-State: AOJu0YwTujmO3CYZMJuAkb0qC+Oa1paJbuvslTAIrqWO6bfOp/7c9zM0
 WBiFzlSck8mJUYJJosv+BROounFq7ZTPvypApjLCd0F9yvTn/UwfV70wWzcmIAA=
X-Google-Smtp-Source: AGHT+IGU4vZHSbVWgh8XHQMjlPrDicwM7zOwzh1RrdRHAYdu2gyP1avlcsEUbQ9zz2Hk0+AnCcAFcg==
X-Received: by 2002:adf:ee8a:0:b0:354:f622:fc5d with SMTP id
 ffacd0b85a97d-354f75219a7mr1846012f8f.20.1716468569818; 
 Thu, 23 May 2024 05:49:29 -0700 (PDT)
Received: from [127.0.1.1] ([93.5.22.158])
 by smtp.googlemail.com with ESMTPSA id
 ffacd0b85a97d-354faf3fa68sm1259611f8f.116.2024.05.23.05.49.28
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Thu, 23 May 2024 05:49:29 -0700 (PDT)
From: Alexandre Mergnat <amergnat@baylibre.com>
Date: Thu, 23 May 2024 14:49:16 +0200
Subject: [PATCH v4 03/15] dt-bindings: display: mediatek: color: add
 compatible for MT8365 SoC
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20231023-display-support-v4-3-ed82eb168fb1@baylibre.com>
References: <20231023-display-support-v4-0-ed82eb168fb1@baylibre.com>
In-Reply-To: <20231023-display-support-v4-0-ed82eb168fb1@baylibre.com>
To: Chun-Kuang Hu <chunkuang.hu@kernel.org>, 
 Philipp Zabel <p.zabel@pengutronix.de>, 
 Maarten Lankhorst <maarten.lankhorst@linux.intel.com>, 
 Maxime Ripard <mripard@kernel.org>, Thomas Zimmermann <tzimmermann@suse.de>, 
 David Airlie <airlied@gmail.com>, Daniel Vetter <daniel@ffwll.ch>, 
 Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>, 
 Conor Dooley <conor+dt@kernel.org>, 
 Matthias Brugger <matthias.bgg@gmail.com>, 
 AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>, 
 Jitao Shi <jitao.shi@mediatek.com>, CK Hu <ck.hu@mediatek.com>, 
 Catalin Marinas <catalin.marinas@arm.com>, Will Deacon <will@kernel.org>
Cc: dri-devel@lists.freedesktop.org, linux-mediatek@lists.infradead.org, 
 devicetree@vger.kernel.org, linux-kernel@vger.kernel.org, 
 linux-arm-kernel@lists.infradead.org, 
 Alexandre Mergnat <amergnat@baylibre.com>
X-Mailer: b4 0.12.2
X-Developer-Signature: v=1; a=openpgp-sha256; l=1050; i=amergnat@baylibre.com; 
 h=from:subject:message-id;
 bh=HN5/a0+R+JO3pVI4xH3O+AT/j542BX4M1WSoIvyPJ9s=; 
 b=owEBbQKS/ZANAwAKAStGSZ1+MdRFAcsmYgBmTztTadkyVemMx/MqAPbnK25Y1rtjyATSG8gU2vrq
 Su5Dn+2JAjMEAAEKAB0WIQQjG17X8+qqcA5g/osrRkmdfjHURQUCZk87UwAKCRArRkmdfjHURXw5D/
 4gvgJulo8RCU5wSOn+lQaGtmVqn7FJD6rHiNJckEy4zb3pfcDPgucVGSMrh1KokTOVufWjLN0w/TcF
 bVLttV6skzv/GEPPlqv1jFNjWf9N48i+obz8Z6wRFhDETvf3XvcR7/LXPqPnZWi/Ts3C+7+6SKYZYz
 BhW+CqE/5aOliJONAzhtQ1aOk0y2rfUeVLObj932UomPbBaNl32QaPBtb1pvxvJlx1caKHMOmVW/CZ
 z/D7qOYjRa+lKI9Dh+CSzVfQgZ/8tGclASeij3MPdik/Tbp7tOgB0IZvr/GgpOvVm9rCWBn1dQeP/M
 7y0IqSyG19Z0i70JCOqHkJWAkg/R5a3bvO6v3RlNLwb0wWrdIpL9hHu233BF10UILE5pchZLOhbU5v
 MIJjDX9Pj0bwzex94DcQEQ7lM/6uXDI7wTTg0mcMf57DfEb0SFKm89DWTZK5F7LD6xkY0l7w25tUOj
 CkcZOw+/lpprx4b+CZYGwkkZa3SpStFEuxW2lu29IFnnAN059dRnkmP6PqA+YkOGUgYzA/iTfLz6Fl
 LMf8+IkEAvBwRCAeqOvKiIPSz5IJut+kBJiMzZY5GrSSHoK27X4Y3SAZ/WQCeAa5HwSDQQVfWB3TMY
 QfaM9+N5kN4eN+rpWA0LX5TbhimGy053mjPPhq1WaNvBtAhucq/fksLKTCrw==
X-Developer-Key: i=amergnat@baylibre.com; a=openpgp;
 fpr=231B5ED7F3EAAA700E60FE8B2B46499D7E31D445
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

Document the display Color on MT8365, which is compatible
with that of the MT8173.

Acked-by: Rob Herring (Arm) <robh@kernel.org>
Reviewed-by: AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>
Signed-off-by: Alexandre Mergnat <amergnat@baylibre.com>
---
 Documentation/devicetree/bindings/display/mediatek/mediatek,color.yaml | 1 +
 1 file changed, 1 insertion(+)

diff --git a/Documentation/devicetree/bindings/display/mediatek/mediatek,color.yaml b/Documentation/devicetree/bindings/display/mediatek/mediatek,color.yaml
index 61d040a10c08..6160439ce4d7 100644
--- a/Documentation/devicetree/bindings/display/mediatek/mediatek,color.yaml
+++ b/Documentation/devicetree/bindings/display/mediatek/mediatek,color.yaml
@@ -40,6 +40,7 @@ properties:
               - mediatek,mt8188-disp-color
               - mediatek,mt8192-disp-color
               - mediatek,mt8195-disp-color
+              - mediatek,mt8365-disp-color
           - const: mediatek,mt8173-disp-color
   reg:
     maxItems: 1

-- 
2.25.1

