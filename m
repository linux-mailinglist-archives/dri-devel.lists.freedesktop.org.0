Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 7AA1078CA8A
	for <lists+dri-devel@lfdr.de>; Tue, 29 Aug 2023 19:17:36 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id A66DD10E3EF;
	Tue, 29 Aug 2023 17:17:32 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-ej1-x634.google.com (mail-ej1-x634.google.com
 [IPv6:2a00:1450:4864:20::634])
 by gabe.freedesktop.org (Postfix) with ESMTPS id CFAC910E3EC
 for <dri-devel@lists.freedesktop.org>; Tue, 29 Aug 2023 17:17:29 +0000 (UTC)
Received: by mail-ej1-x634.google.com with SMTP id
 a640c23a62f3a-99c3d3c3db9so598945366b.3
 for <dri-devel@lists.freedesktop.org>; Tue, 29 Aug 2023 10:17:29 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20221208; t=1693329448; x=1693934248;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:from:to:cc:subject:date
 :message-id:reply-to;
 bh=Rlz17GtutNw1PX6avQfyxd2FJLVbt0FbIToHal1G+vU=;
 b=UIFYLrNe0gh2pAwnM5MUnuNxEI2N+C+hDeO1RoxlyGw+Dv05W/dM9XAythdMCRIY6K
 Z9nxj4tt6ACJ68ny5AJEt3T2+Td3iRnGFXuDpEEGOKu1ZCi0/xj3r9ftMwbIkD3G91Uu
 U+ldak5sol1qkR+3XD7+yUG1TLmaye0xeGMRwwNqpywQVNXSCXTHRVBbLJQJvccZ/LA9
 LfsLtbCwvE6VCGJqblgyPJH3fqOZ+8kAGnBFIBXvtLQwOoeNKDHvfHDNfwl+3UeJYtEU
 h2pnzMnciPjnl0iSQaYBcpSKtOHjUkwuAJ9DiY+9OzRXC+sMbSIofwBZCO86tFcfg3tY
 qkyA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20221208; t=1693329448; x=1693934248;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=Rlz17GtutNw1PX6avQfyxd2FJLVbt0FbIToHal1G+vU=;
 b=A4jSMRv4iNnPiYGpc7wdGGPXkz452Bl6sOuoho3z3gqsmioHZnGmB/HF63Uj9YuYEt
 zcsmeenkgsFy52oj5k+VBUFpjR8uWSQr3ibvDMkuItZtsFpK5BIaPfkT2hnovkQnMgf/
 82fjFRlcmyGtbBIspdPOqz3l/T60gLChI/U0UfQTQb+psD05e963HaSSaWDbrqQnZYV5
 I5U0HzJOhaSxrmE1JJG8ztiI51j9fzPsFFxkf63GRF3VOANqWqn+e9QCnq+vYqqXfyHQ
 vYrPp/STg9EllFqAA367uvhZKUPZjS5XIJD17nhZVriNxdPGKFId9S5+7rvI9cavzCk1
 qZCQ==
X-Gm-Message-State: AOJu0Yzv3q5LZ3Dl8/KLr1OM9x4uU+CaZWTXQze6ujcxLZAuKuojzgrv
 5/kNAG3zonzoBVpCgx5IcA==
X-Google-Smtp-Source: AGHT+IFFkEkxU6fLi6B7Qfna18QFEfdVNppGwFK63NpwdhfSCbGPZ5uGzoW6mAq0vfuONXZvjcBGNA==
X-Received: by 2002:a17:906:8462:b0:9a5:81cf:57b5 with SMTP id
 hx2-20020a170906846200b009a581cf57b5mr8395816ejc.2.1693329448163; 
 Tue, 29 Aug 2023 10:17:28 -0700 (PDT)
Received: from U4.lan ([2001:9e8:b958:3410:8e0c:ed68:cd6c:7cb8])
 by smtp.gmail.com with ESMTPSA id
 a21-20020a1709062b1500b00993cc1242d4sm6115834ejg.151.2023.08.29.10.17.27
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Tue, 29 Aug 2023 10:17:27 -0700 (PDT)
From: Alex Bee <knaerzche@gmail.com>
To: Heiko Stuebner <heiko@sntech.de>, Rob Herring <robh+dt@kernel.org>,
 Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>,
 Conor Dooley <conor+dt@kernel.org>, David Airlie <airlied@gmail.com>,
 Daniel Vetter <daniel@ffwll.ch>, Lee Jones <lee@kernel.org>,
 Liam Girdwood <lgirdwood@gmail.com>, Mark Brown <broonie@kernel.org>,
 Michael Turquette <mturquette@baylibre.com>,
 Stephen Boyd <sboyd@kernel.org>, Vinod Koul <vkoul@kernel.org>,
 Kishon Vijay Abraham I <kishon@kernel.org>
Subject: [PATCH 04/31] dt-bindings: arm: rockchip: Add Geniatech XPI-3128
Date: Tue, 29 Aug 2023 19:16:20 +0200
Message-ID: <20230829171647.187787-5-knaerzche@gmail.com>
X-Mailer: git-send-email 2.42.0
In-Reply-To: <20230829171647.187787-1-knaerzche@gmail.com>
References: <20230829171647.187787-1-knaerzche@gmail.com>
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
Cc: devicetree@vger.kernel.org, alsa-devel@alsa-project.org,
 Elaine Zhang <zhangqing@rock-chips.com>, linux-kernel@vger.kernel.org,
 dri-devel@lists.freedesktop.org, Alex Bee <knaerzche@gmail.com>,
 linux-rockchip@lists.infradead.org, linux-phy@lists.infradead.org,
 Johan Jonker <jbx6244@gmail.com>, linux-clk@vger.kernel.org,
 linux-arm-kernel@lists.infradead.org
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

Add Geniatech XPI-3128, a RK3128 based single board computer.

Signed-off-by: Alex Bee <knaerzche@gmail.com>
---
 Documentation/devicetree/bindings/arm/rockchip.yaml | 5 +++++
 1 file changed, 5 insertions(+)

diff --git a/Documentation/devicetree/bindings/arm/rockchip.yaml b/Documentation/devicetree/bindings/arm/rockchip.yaml
index ecdb72a519cb..e4c1af691b7a 100644
--- a/Documentation/devicetree/bindings/arm/rockchip.yaml
+++ b/Documentation/devicetree/bindings/arm/rockchip.yaml
@@ -227,6 +227,11 @@ properties:
           - const: geekbuying,geekbox
           - const: rockchip,rk3368
 
+      - description: Geniatech XPI-3128
+        items:
+          - const: geniatech,xpi-3128
+          - const: rockchip,rk3128
+
       - description: Google Bob (Asus Chromebook Flip C101PA)
         items:
           - const: google,bob-rev13
-- 
2.42.0

