Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id E8AF58C71EF
	for <lists+dri-devel@lfdr.de>; Thu, 16 May 2024 09:21:26 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id EFD2710E70C;
	Thu, 16 May 2024 07:21:24 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=huaqin-corp-partner-google-com.20230601.gappssmtp.com header.i=@huaqin-corp-partner-google-com.20230601.gappssmtp.com header.b="eJj4ihlQ";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-pf1-f169.google.com (mail-pf1-f169.google.com
 [209.85.210.169])
 by gabe.freedesktop.org (Postfix) with ESMTPS id D786410E725
 for <dri-devel@lists.freedesktop.org>; Thu, 16 May 2024 07:21:23 +0000 (UTC)
Received: by mail-pf1-f169.google.com with SMTP id
 d2e1a72fcca58-6f47787a0c3so6947219b3a.0
 for <dri-devel@lists.freedesktop.org>; Thu, 16 May 2024 00:21:23 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=huaqin-corp-partner-google-com.20230601.gappssmtp.com; s=20230601;
 t=1715844083; x=1716448883; darn=lists.freedesktop.org; 
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:from:to:cc:subject:date
 :message-id:reply-to;
 bh=0Ykc8X+nmmZoVxXuDzZ7nDLHl9gXoWIqf3Er06OJcnc=;
 b=eJj4ihlQ8p+cmG8GQ7axEIYM9v74FOn9IRsxL0n0TYQjN1yWGdRvErKk+KEnTg1hgB
 I2it7q6fs6Ykzr4VLFJbf+Sr1R5i7QWZryPVSzfMqu+PAWQivtdGvoLhhT3oVmjNgwn3
 bt1NA9hWT3mNAF7a6DMFiGQeCSbI+aZOsdMHYfcnFi4+lLsqjt8Y38lWk5IT/YXumlb6
 j0u/odomvZPpl73r7vZ8S04Gn5mAJGXGc+k4G1TZg0URaP8ZkI097zJJzCCDdvOi2rlD
 5JhdzSXVJDXdQYFDmGz0Gx76N0qGejO9h/2vizCZp5VNiEhKwuiMPqSh2jbDynpPrms2
 1qBQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1715844083; x=1716448883;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=0Ykc8X+nmmZoVxXuDzZ7nDLHl9gXoWIqf3Er06OJcnc=;
 b=kisPgaaw5T3/76Q5WNJij9FAtpzyrhWo1gDCip+VU1TWlvOCDRSxZZg4RquqDmRktq
 L2wloiYEOr+Luxq6doyqXTatN7puoIvbSkADmICD8G+gRHVTOQNUscUy3ew8kdXPyDRe
 zjFMs4dZxJXt+QZn4fOoUmPobPyFo1oKjVV/3QKSXlr7f03FwTkMrIhVI0An4Mx9laZz
 Z6ORCKcdMbl09SmrH4b9VxQeyvuGi00mV459BJuOnQFfbXCoeHX13TSxTZkz8VZOa5zb
 xy0Wx4MCD/hpjt50JnFhV6I7BUUExAFU/8pEtXSj5I7Jg/h9JvXTXZuY9tnW7YypJdvq
 T3zA==
X-Forwarded-Encrypted: i=1;
 AJvYcCXwwTJFtrLiwKju0HwvL768yg1DuvdMLTdkP4RhnVzz5om38fc9dPBG2oWPAYiCWzJboQm6d/gpcgvQUE5V9bRFLiDQCchLk7f20bjg3QKr
X-Gm-Message-State: AOJu0YxnK530esnEruuJueMcz0hbhQpDpuYPSJJNpRRTGAlxoPYLPSiS
 vYH8/+zNpKY341ery0x6vGPZ/joB6ESRvi5QnnsR45dL09ml3i4Pg32/P97NrmU=
X-Google-Smtp-Source: AGHT+IGgE+hx8R/pCPucaQOs4aOObgTlt+Rwb1dunW29jhy/EcKEoe+E1JmASK4+sCVMq054NdIOPg==
X-Received: by 2002:a05:6a00:9284:b0:6f0:c79f:cd7e with SMTP id
 d2e1a72fcca58-6f4e015fa18mr22748069b3a.0.1715844083133; 
 Thu, 16 May 2024 00:21:23 -0700 (PDT)
Received: from yc.huaqin.com ([116.66.212.162])
 by smtp.gmail.com with ESMTPSA id
 d2e1a72fcca58-6f4d2a663a3sm12318724b3a.41.2024.05.16.00.21.20
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Thu, 16 May 2024 00:21:22 -0700 (PDT)
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
Subject: [PATCH v8 5/6] dt-bindings: display: panel: Add compatible for IVO
 t109nw41
Date: Thu, 16 May 2024 15:20:38 +0800
Message-Id: <20240516072039.1287065-6-yangcong5@huaqin.corp-partner.google.com>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20240516072039.1287065-1-yangcong5@huaqin.corp-partner.google.com>
References: <20240516072039.1287065-1-yangcong5@huaqin.corp-partner.google.com>
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
Chage since V8:

- No change.

V7: https://lore.kernel.org/all/20240515014643.2715010-7-yangcong5@huaqin.corp-partner.google.com

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

