Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id D66BB8C2EE4
	for <lists+dri-devel@lfdr.de>; Sat, 11 May 2024 04:14:00 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id B56BF10E5D4;
	Sat, 11 May 2024 02:13:58 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=huaqin-corp-partner-google-com.20230601.gappssmtp.com header.i=@huaqin-corp-partner-google-com.20230601.gappssmtp.com header.b="cQruHSIC";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-pf1-f179.google.com (mail-pf1-f179.google.com
 [209.85.210.179])
 by gabe.freedesktop.org (Postfix) with ESMTPS id C73AE10E604
 for <dri-devel@lists.freedesktop.org>; Sat, 11 May 2024 02:13:57 +0000 (UTC)
Received: by mail-pf1-f179.google.com with SMTP id
 d2e1a72fcca58-6f457853950so2535771b3a.0
 for <dri-devel@lists.freedesktop.org>; Fri, 10 May 2024 19:13:57 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=huaqin-corp-partner-google-com.20230601.gappssmtp.com; s=20230601;
 t=1715393637; x=1715998437; darn=lists.freedesktop.org; 
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:from:to:cc:subject:date
 :message-id:reply-to;
 bh=buSGGfA578U0qsElcZ/pKHG9pDlMNRoK5dVeaixkId8=;
 b=cQruHSICJhnSJ/+B4uoGv6Up9v6DVcxVnKPhDzX1smvaQL0IWJiB4XPs9ZXMPRJdCt
 tpOiRZd91JkRlnEL28AyOGwWqS9zb2XuiHn9gM+C3J1HHC13Ke7m4U4ysrmnw09gBoTU
 6GQLjU+658xfwhnO7oFt7Snzan3sd4RaowKkFWL85sTAo8JbgJ/X30kNm0UBI1xgHGEG
 pmny/5+yX2M5LJU+8lOQsS9x+kfikLXe0KqWkiTGDMRGL7dnhZnQJUcJDXvFrO98deIq
 JWez8GsUtQ7J12PdCil4k0+1I1sGw3HGrIotpvll3vzQ1wA9KJd8OFPLoMHapZ6uzsPX
 nGvA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1715393637; x=1715998437;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=buSGGfA578U0qsElcZ/pKHG9pDlMNRoK5dVeaixkId8=;
 b=brjyGvQjv52Q0HZif0+hzsifs0qFVMO6glgXkGU+MCwWFA0VRhvMsBS2o+CFH2aOS7
 CYpeNhfSkG44oUrdMUzkay9NAKh6qVqVgNuggOvsqAqx7u8IJWdUx1T/8HuyoLZ/veEB
 4oGREI8X6kavNSrw1kk0luBA2/usccn/oa6PqLlXW6Eoala15JN8SSfnweXWKBD++Sfo
 Sw9Fsl9zrX/QYJ2MsdMfw4GbqVzKu2JY7rEg1PHQqCzaKO5AKgE0jrN3CQDvmo8u63Qe
 ZFUTZqK0cFMsSXixobw6YTUjzfsisE+vLi1s9KkN2Zelv8BRfsmYOnPuFxjkkGuxFNMm
 UFnA==
X-Forwarded-Encrypted: i=1;
 AJvYcCXQME+l/DCFVPsyd/X3y/p5Nx1i5bnDOkTg/yA7LscsuYo1N+QXFKo5EU6iYl7Ge+RBSWylST2t/zfVksqPmTq5SRaP6ql21/YVWcHqhFDR
X-Gm-Message-State: AOJu0Yx0DRwFRvI4Tt+dyv54Hmr5lXgKT1tJhqYwQkZgMYjOH8oZw4VA
 iJq1y9ABIZCOdGaF4RxmZVnQCELpBC97e7T9PLlopolzbeanvHiLE6+OBn5DmZg=
X-Google-Smtp-Source: AGHT+IHaDoWAAKehP+RA170JBuXHI0YWJevK2pZ3NDo17cxsNB8HHsCuonhvsfus8qnqVKaezmsR3A==
X-Received: by 2002:a05:6a20:8411:b0:1a7:a644:4485 with SMTP id
 adf61e73a8af0-1afde10f892mr6903617637.18.1715393636997; 
 Fri, 10 May 2024 19:13:56 -0700 (PDT)
Received: from localhost.localdomain ([116.66.212.162])
 by smtp.gmail.com with ESMTPSA id
 d2e1a72fcca58-6f4d2a9d9acsm3680340b3a.90.2024.05.10.19.13.54
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Fri, 10 May 2024 19:13:56 -0700 (PDT)
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
Subject: [PATCH v6 6/7] dt-bindings: display: panel: Add compatible for IVO
 t109nw41
Date: Sat, 11 May 2024 10:13:25 +0800
Message-Id: <20240511021326.288728-7-yangcong5@huaqin.corp-partner.google.com>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20240511021326.288728-1-yangcong5@huaqin.corp-partner.google.com>
References: <20240511021326.288728-1-yangcong5@huaqin.corp-partner.google.com>
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

