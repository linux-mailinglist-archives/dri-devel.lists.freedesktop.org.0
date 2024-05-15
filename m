Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 41E9B8C5EE8
	for <lists+dri-devel@lfdr.de>; Wed, 15 May 2024 03:47:19 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 336D410E7A2;
	Wed, 15 May 2024 01:47:17 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=huaqin-corp-partner-google-com.20230601.gappssmtp.com header.i=@huaqin-corp-partner-google-com.20230601.gappssmtp.com header.b="0kPlcH5a";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-pf1-f174.google.com (mail-pf1-f174.google.com
 [209.85.210.174])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 1114410E794
 for <dri-devel@lists.freedesktop.org>; Wed, 15 May 2024 01:47:13 +0000 (UTC)
Received: by mail-pf1-f174.google.com with SMTP id
 d2e1a72fcca58-6f666caf9abso1464493b3a.1
 for <dri-devel@lists.freedesktop.org>; Tue, 14 May 2024 18:47:13 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=huaqin-corp-partner-google-com.20230601.gappssmtp.com; s=20230601;
 t=1715737633; x=1716342433; darn=lists.freedesktop.org; 
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:from:to:cc:subject:date
 :message-id:reply-to;
 bh=1O2w+j7oF+If/RyjWtMiKcWw/CJB57vGrA60jH80G4s=;
 b=0kPlcH5arY1bsUJbVCEA+2xDzKUKsfT8JNqPizSMcAfKgZIJu3PqzEnZTsAjnHtLSY
 6kFNWLNOjOeVHC306S/jtP5P2YnKJup+0TF60cFEM6ZyR/tg0vqEvDPGBIP3z4g/SOjC
 bavsei8fTvazcVERNZjw9rhojKfewc/Br3CVsjFsFZGWo34jeptLJ04hGaEEEm8LxYjY
 CAq8v4AJ4leiUGI477GIgnZmGmtyfkSRQ5S8eMX/7UE7ZO6lG1mmypJX2DC2QBPvARjw
 aNkX21wTpcJnnAU6L5RgpyO8/d5ef5UWnn8M21LT+X7jF+XHuW1MyaBuowNpjISUw+2Z
 0+Tg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1715737633; x=1716342433;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=1O2w+j7oF+If/RyjWtMiKcWw/CJB57vGrA60jH80G4s=;
 b=YBJYISmPwAsJTM0P4StcaJG9NcUYkV5a1wnix8Jix7dkoqXufB5fDP1kIoswfYpgYF
 /tT8Wd/6WG8rYhAT8WRt1w0EXtBuJ9CS3o1OANzS8PnE6ALexMBrSEYi7/4uRhSs8ird
 7Xl3PO0ZG241+mdhP5jgPtrS+WBBUCI1CyyVEtywhUap/5vanYcBgVbKQMkM+bIaphYX
 x/pfMW301WdBBjt9AdvjIRdaJrszz0LqAWMNKkxoP5giVknA9a2RAtb+wGuGbJHoFdGH
 G/7TN5jgb+n0HY/Vgbh2n80p6igEgXtYacELhtFP249Nv8vii0SW/KLepuFSYgOon+R/
 4mmA==
X-Forwarded-Encrypted: i=1;
 AJvYcCUzIFxiK3FEq8xyOwHuvhbEzHu1OdDkcQv0yTAcynhA7jB57AO1/HLdOEILzD6+TH/Uep3iqhAEFBf2mMNNfnVMQTFAyyEQrVV34MXgn9La
X-Gm-Message-State: AOJu0Yy1FptTPs+qTLK10YS34Dp07isvC3l88VrQx18jT+KsWb6uLFyp
 XvUmZVdqs7O6lUx3VTKxbOq6aJEMR42LTRhiC+vUHNCi0+weEtlnC1GbL30Rs2k=
X-Google-Smtp-Source: AGHT+IEtB4CRNoYlNU8a2N2xb8vVK5N1RMyfVtjB+ogMObqYoH2IHATftuTVgtI5S1tCKDolbYvLJw==
X-Received: by 2002:a05:6a21:2781:b0:1af:d057:af9a with SMTP id
 adf61e73a8af0-1afde1c5d1amr13050610637.55.1715737633524; 
 Tue, 14 May 2024 18:47:13 -0700 (PDT)
Received: from localhost.localdomain ([116.66.212.162])
 by smtp.gmail.com with ESMTPSA id
 d9443c01a7336-1ef0c1368desm105582145ad.233.2024.05.14.18.47.10
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Tue, 14 May 2024 18:47:13 -0700 (PDT)
From: Cong Yang <yangcong5@huaqin.corp-partner.google.com>
To: sam@ravnborg.org, neil.armstrong@linaro.org, daniel@ffwll.ch,
 dianders@chromium.org, linus.walleij@linaro.org,
 krzysztof.kozlowski+dt@linaro.org, robh+dt@kernel.org, conor+dt@kernel.org,
 airlied@gmail.com
Cc: dmitry.baryshkov@linaro.org, dri-devel@lists.freedesktop.org,
 devicetree@vger.kernel.org, linux-kernel@vger.kernel.org,
 xuxinxiong@huaqin.corp-partner.google.com,
 Cong Yang <yangcong5@huaqin.corp-partner.google.com>,
 Conor Dooley <conor.dooley@microchip.com>
Subject: [v7 6/7] dt-bindings: display: panel: Add compatible for IVO t109nw41
Date: Wed, 15 May 2024 09:46:42 +0800
Message-Id: <20240515014643.2715010-7-yangcong5@huaqin.corp-partner.google.com>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20240515014643.2715010-1-yangcong5@huaqin.corp-partner.google.com>
References: <20240515014643.2715010-1-yangcong5@huaqin.corp-partner.google.com>
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

The IVO t109nw41 is a 11.0" WUXGA TFT LCD panel with himax-hx83102
controller. Hence, we add a new compatible with panel specific config.

Signed-off-by: Cong Yang <yangcong5@huaqin.corp-partner.google.com>
Acked-by: Conor Dooley <conor.dooley@microchip.com>
---
Chage since V7:

- No change.

V6: https://lore.kernel.org/all/20240511021326.288728-7-yangcong5@huaqin.corp-partner.google.com

Chage since V6:

- No change.

V5: https://lore.kernel.org/all/20240509015207.3271370-7-yangcong5@huaqin.corp-partner.google.com

Chage since V5:

- No change.

V4: https://lore.kernel.org/all/20240507135234.1356855-7-yangcong5@huaqin.corp-partner.google.com

Chage since V4:

- No change.

V3: https://lore.kernel.org/all/20240424023010.2099949-7-yangcong5@huaqin.corp-partner.google.com

Chage since V3:

- Update commit message.

V2: https://lore.kernel.org/all/20240422090310.3311429-7-yangcong5@huaqin.corp-partner.google.com/

---
 .../devicetree/bindings/display/panel/himax,hx83102.yaml        | 2 ++
 1 file changed, 2 insertions(+)

diff --git a/Documentation/devicetree/bindings/display/panel/himax,hx83102.yaml b/Documentation/devicetree/bindings/display/panel/himax,hx83102.yaml
index baf8b053e375..c649fb085833 100644
--- a/Documentation/devicetree/bindings/display/panel/himax,hx83102.yaml
+++ b/Documentation/devicetree/bindings/display/panel/himax,hx83102.yaml
@@ -18,6 +18,8 @@ properties:
       - enum:
           # Boe nv110wum-l60 11.0" WUXGA TFT LCD panel
           - boe,nv110wum-l60
+          # IVO t109nw41 11.0" WUXGA TFT LCD panel
+          - ivo,t109nw41
           # STARRY himax83102-j02 10.51" WUXGA TFT LCD panel
           - starry,himax83102-j02
       - const: himax,hx83102
-- 
2.25.1

