Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 8C3D188A2F2
	for <lists+dri-devel@lfdr.de>; Mon, 25 Mar 2024 14:50:16 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 51CDD10E8B8;
	Mon, 25 Mar 2024 13:50:13 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=gmail.com header.i=@gmail.com header.b="MI9Zh74V";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-ot1-f44.google.com (mail-ot1-f44.google.com
 [209.85.210.44])
 by gabe.freedesktop.org (Postfix) with ESMTPS id BB83B10E137
 for <dri-devel@lists.freedesktop.org>; Mon, 25 Mar 2024 13:50:09 +0000 (UTC)
Received: by mail-ot1-f44.google.com with SMTP id
 46e09a7af769-6e6a9e2e2b6so2411742a34.1
 for <dri-devel@lists.freedesktop.org>; Mon, 25 Mar 2024 06:50:09 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20230601; t=1711374608; x=1711979408; darn=lists.freedesktop.org;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:from:to:cc:subject:date
 :message-id:reply-to;
 bh=lTa5nbcCR6s5PUGPSt2FliWbNyzghkPZuzdDT4iQreY=;
 b=MI9Zh74VRCUYkniCtgo3WrABmEvxARgpWwETaX3do84862eGyZdAkiVeTBuj2o2zuH
 21Co5NmOr/hakHt8K+KsLNkUc1XIA05mfcRRzc7SEyEHc/y66jksTu/83HpQ7lQ3N65I
 CyhuMbee+8PwbTMrTatMLh0q4FIDwaIPaE85LyBhQ5wnjiwOAASUoNKlcEcy9xuHwG4M
 lTWSsXlQ6JMjh/qLiMm02alCGIIGlXlhm05QRjMHozhv+lrQAN9DQ8i0D3l7i3Zwbjn/
 N0kMjcT2yljp/zZMksgw1YG50twn/cwt+AfQQcK7EmXjgvo6pIvz9WHsZvLbTzh3QmcO
 A/Hw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1711374608; x=1711979408;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=lTa5nbcCR6s5PUGPSt2FliWbNyzghkPZuzdDT4iQreY=;
 b=lZ6zNRILxm3bGDVeJG3g2OU+xlN2LPAhM9PusnGTHCUEQK1qNUSj4rJpP13Ngvj9fe
 92Wm+D6amfC1D3P59KLbw7p+p8/Le/bjYE6GBmsK62kbSSo+2XJhOPQtBaXf6yI6g25l
 iOADFgdJOjaKbr5LTgIxHTCCE5Lrpk/2bBSgvUJLrGAjLngqghVbmXNqWDyjO2s2z0SR
 ScIR5A02lvhK83RBY9vA5FpZZi9GcEAQsMgu29m/LthZcok7g1mpvo4aeeUZMpWC5umO
 aQ/fkHRz19Ge9KVsb+RtFgF5gMscJOq2nX2CEFVZZSmov320i5hTrp02MxthjockJO94
 cotw==
X-Gm-Message-State: AOJu0Yx5o2RlFHxXT76kS5fjoMA4TxH0hdXInr7EiJkXaWTw5ACr1Bcj
 9fzG6FmVspgMkFyoqltilJT4SqMYHWAreTj17KzujYTYN5dycHMK
X-Google-Smtp-Source: AGHT+IF7XHsaP6m6/3Dc/nu1JlamhXyyy25YMxWiLxoadqRdsCgcTmEF1RLsTJdNBcfYMZK0qlHYJA==
X-Received: by 2002:a05:6830:117:b0:6e6:6ea1:9820 with SMTP id
 i23-20020a056830011700b006e66ea19820mr8618855otp.14.1711374608661; 
 Mon, 25 Mar 2024 06:50:08 -0700 (PDT)
Received: from localhost.localdomain ([75.28.21.198])
 by smtp.gmail.com with ESMTPSA id
 z8-20020a05683010c800b006e673e2d2a3sm1118250oto.77.2024.03.25.06.50.08
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Mon, 25 Mar 2024 06:50:08 -0700 (PDT)
From: Chris Morgan <macroalpha82@gmail.com>
To: linux-rockchip@lists.infradead.org
Cc: dri-devel@lists.freedesktop.org, devicetree@vger.kernel.org,
 daniel@ffwll.ch, airlied@gmail.com, sam@ravnborg.org,
 quic_jesszhan@quicinc.com, neil.armstrong@linaro.org, megi@xff.cz,
 kernel@puri.sm, agx@sigxcpu.org, heiko@sntech.de, conor+dt@kernel.org,
 krzysztof.kozlowski+dt@linaro.org, robh@kernel.org,
 Chris Morgan <macromorgan@hotmail.com>
Subject: [PATCH 2/5] dt-bindings: display: Add GameForce Chi Panel
Date: Mon, 25 Mar 2024 08:49:56 -0500
Message-Id: <20240325134959.11807-3-macroalpha82@gmail.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20240325134959.11807-1-macroalpha82@gmail.com>
References: <20240325134959.11807-1-macroalpha82@gmail.com>
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

From: Chris Morgan <macromorgan@hotmail.com>

The GameForce Chi panel is a panel specific to the GameForce Chi
handheld device that measures 3.5" diagonally with a resolution of
640x480.

Signed-off-by: Chris Morgan <macromorgan@hotmail.com>
---
 .../devicetree/bindings/display/panel/rocktech,jh057n00900.yaml | 2 ++
 1 file changed, 2 insertions(+)

diff --git a/Documentation/devicetree/bindings/display/panel/rocktech,jh057n00900.yaml b/Documentation/devicetree/bindings/display/panel/rocktech,jh057n00900.yaml
index 6ec471284f97..4ae152cc55e0 100644
--- a/Documentation/devicetree/bindings/display/panel/rocktech,jh057n00900.yaml
+++ b/Documentation/devicetree/bindings/display/panel/rocktech,jh057n00900.yaml
@@ -22,6 +22,8 @@ properties:
     enum:
       # Anberic RG353V-V2 5.0" 640x480 TFT LCD panel
       - anbernic,rg353v-panel-v2
+      # GameForce Chi 3.5" 640x480 TFT LCD panel
+      - gameforce,chi-panel
       # Powkiddy RGB10MAX3 5.0" 720x1280 TFT LCD panel
       - powkiddy,rgb10max3-panel
       # Powkiddy RGB30 3.0" 720x720 TFT LCD panel
-- 
2.34.1

