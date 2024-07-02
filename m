Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 998F3923E54
	for <lists+dri-devel@lfdr.de>; Tue,  2 Jul 2024 15:02:13 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 14BBA10E11C;
	Tue,  2 Jul 2024 13:02:12 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=huaqin-corp-partner-google-com.20230601.gappssmtp.com header.i=@huaqin-corp-partner-google-com.20230601.gappssmtp.com header.b="ouHPKJkE";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-pf1-f179.google.com (mail-pf1-f179.google.com
 [209.85.210.179])
 by gabe.freedesktop.org (Postfix) with ESMTPS id E07B810E112
 for <dri-devel@lists.freedesktop.org>; Tue,  2 Jul 2024 13:02:10 +0000 (UTC)
Received: by mail-pf1-f179.google.com with SMTP id
 d2e1a72fcca58-707f9c3bd02so2760323b3a.0
 for <dri-devel@lists.freedesktop.org>; Tue, 02 Jul 2024 06:02:10 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=huaqin-corp-partner-google-com.20230601.gappssmtp.com; s=20230601;
 t=1719925330; x=1720530130; darn=lists.freedesktop.org; 
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:from:to:cc:subject:date
 :message-id:reply-to;
 bh=DEarth7Zvjah/4aEloYMlgeIzn5JDGZaQzKTKVskKkc=;
 b=ouHPKJkE2QujYBKMWDjnrbEKBwScBZ6X636V9Qq/O1aaeERVmYfACIW10mcLFnyL8r
 6OgM43mUFqkOKoU7fDRE2amXfv8t7Rjx68Go6mRgFCumGHPOqS+TEIhPICRgh0mZJdxz
 nIFBBENSt6BVKi4/bh2il/RSbu7yICl8Yaqab+lQ15x8y7PGuisGl6+vzX0S2ca47T1w
 eFafMZnVtVRGD6BIpFx0gsWsEGQptDmPmgw6jA4kBzOL3ytjGucCiCIeiZuCrAIwNmd7
 hh6WC6FPGb8vMnBiLrm00BVnqi1mkGeabnta39zH94N/Bjjje5444cNy/ecupWA1ZaqP
 QdUA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1719925330; x=1720530130;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=DEarth7Zvjah/4aEloYMlgeIzn5JDGZaQzKTKVskKkc=;
 b=W0D0+EqA1tQ0FybYbjC7s3jtwHuXxm3Pa+/mxcEGFoiBOyo1Qz62VQpEk7DL+2jhiI
 Qbjt/5/o/ro75OCwCzU9puLpoHO1gZt2i87Dw4XT53Wv1YedBp0mJSTFWVzQBmlLnzgj
 ddvOHsz7bWesNjYd9jGy+sMvgKjfRWF+SUxHBd13pCJYJYE4JwvCXK0bIJweyCBHPVMR
 NMRvpwHhduJQBppnlArySXLLPQZP6gs691Gtq6m6cZAhyKtdhMpShoV+P9QybkXKwJFd
 6uTgDJub+/Qmqvj5ZzSEcorV5nA5kigERoLwVJ7tpOy7RPpx44+439fUt504/3T4sJ8c
 UNnw==
X-Forwarded-Encrypted: i=1;
 AJvYcCWxZZ5ynSdB//JrxC7Bag2ooZq58pk4IG+jSDl9f+lXuN2VexNYydWv4nVk5cnOetWksnXueZiNQqGBp3CsGeiVRHpzrYkeE5EAvUxtEW46
X-Gm-Message-State: AOJu0YwuVQg9sGK5B+qzSBPjMcbi7gld6fNBDoW3Vx4LyJgqWwn/rjL2
 eYfNBhaB7/UTgO/Kcx71Le8kNuYZVC/KONX270WRAXCRK2BjrI4UoVWWSsYymNY=
X-Google-Smtp-Source: AGHT+IG5SAPwAceG5TK6MQ0BWXKUM4tQCTZWen4CjFJAF4c/+bQPO1zJUXNeuDD/lwi/4iugDsvixw==
X-Received: by 2002:a05:6a20:3948:b0:1bd:deac:c052 with SMTP id
 adf61e73a8af0-1bef60e3be5mr7899722637.1.1719925328953; 
 Tue, 02 Jul 2024 06:02:08 -0700 (PDT)
Received: from yc.huaqin.com ([116.66.212.162])
 by smtp.gmail.com with ESMTPSA id
 41be03b00d2f7-72c6c8ec50csm6233111a12.59.2024.07.02.06.02.04
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Tue, 02 Jul 2024 06:02:07 -0700 (PDT)
From: Cong Yang <yangcong5@huaqin.corp-partner.google.com>
To: sam@ravnborg.org, neil.armstrong@linaro.org, daniel@ffwll.ch,
 dianders@chromium.org, linus.walleij@linaro.org, swboyd@chromium.org,
 airlied@gmail.com, dmitry.baryshkov@linaro.org,
 krzysztof.kozlowski+dt@linaro.org, robh+dt@kernel.org, conor+dt@kernel.org
Cc: lvzhaoxiong@huaqin.corp-partner.google.com,
 dri-devel@lists.freedesktop.org, devicetree@vger.kernel.org,
 linux-kernel@vger.kernel.org,
 Cong Yang <yangcong5@huaqin.corp-partner.google.com>
Subject: [PATCH v1 1/2] dt-bindings: display: panel: Add compatible for melfas
 lmfbx101117480
Date: Tue,  2 Jul 2024 21:01:37 +0800
Message-Id: <20240702130138.2543711-2-yangcong5@huaqin.corp-partner.google.com>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20240702130138.2543711-1-yangcong5@huaqin.corp-partner.google.com>
References: <20240702130138.2543711-1-yangcong5@huaqin.corp-partner.google.com>
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

The Melfas lmfbx101117480 is a 10.1" WXGA TFT LCD panel with jadard-jd9365da
controller. Hence, we add a new compatible with panel specific config.

Signed-off-by: Cong Yang <yangcong5@huaqin.corp-partner.google.com>
---
 .../devicetree/bindings/display/panel/jadard,jd9365da-h3.yaml    | 1 +
 1 file changed, 1 insertion(+)

diff --git a/Documentation/devicetree/bindings/display/panel/jadard,jd9365da-h3.yaml b/Documentation/devicetree/bindings/display/panel/jadard,jd9365da-h3.yaml
index 3d5bede98cf1..b8783eba3ddc 100644
--- a/Documentation/devicetree/bindings/display/panel/jadard,jd9365da-h3.yaml
+++ b/Documentation/devicetree/bindings/display/panel/jadard,jd9365da-h3.yaml
@@ -18,6 +18,7 @@ properties:
       - enum:
           - chongzhou,cz101b4001
           - kingdisplay,kd101ne3-40ti
+          - melfas,lmfbx101117480
           - radxa,display-10hd-ad001
           - radxa,display-8hd-ad002
       - const: jadard,jd9365da-h3
-- 
2.25.1

