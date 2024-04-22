Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 5792D8AC84B
	for <lists+dri-devel@lfdr.de>; Mon, 22 Apr 2024 11:03:53 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 6869E10F2C1;
	Mon, 22 Apr 2024 09:03:51 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=huaqin-corp-partner-google-com.20230601.gappssmtp.com header.i=@huaqin-corp-partner-google-com.20230601.gappssmtp.com header.b="EFxROiv+";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-oa1-f48.google.com (mail-oa1-f48.google.com
 [209.85.160.48])
 by gabe.freedesktop.org (Postfix) with ESMTPS id B185F1128FF
 for <dri-devel@lists.freedesktop.org>; Mon, 22 Apr 2024 09:03:50 +0000 (UTC)
Received: by mail-oa1-f48.google.com with SMTP id
 586e51a60fabf-238fd648224so2218039fac.2
 for <dri-devel@lists.freedesktop.org>; Mon, 22 Apr 2024 02:03:50 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=huaqin-corp-partner-google-com.20230601.gappssmtp.com; s=20230601;
 t=1713776630; x=1714381430; darn=lists.freedesktop.org; 
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:from:to:cc:subject:date
 :message-id:reply-to;
 bh=j4yhfc/0Xvld8cEQVKIWw5SRb/C5QHjhTbLUB/06J8I=;
 b=EFxROiv+Su3EcsBTExUpDUYcu9TAhTZtAfDH2DLytDhNrHCLXW7PAxmeR6gsAof4BF
 HYfwWlWc3rEl4+RZgczyWtVHD7p09DVVBMoS+kTuzC+OJsxhTSyF95nzVui6IhW7U9DK
 DjLDzPAWuLFK/nmpg1lSelI9zk2qwxfKTy4CVmdXQ581iR6q8pkpZT8Wg6D9Ie89TNRo
 /v4otWPCqXvoC5oWzzLLDbdbYdkTsIPK9BsmWM7QHIfsLxBHfNHLTpRWcPloSmJ0BEjI
 44qiuWXwLbBYOxhVJviJLMj/8Vdip6mNHUlBmGMx2vgkDA7u6CuQCX01EmlkbnmxUG+K
 ifUg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1713776630; x=1714381430;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=j4yhfc/0Xvld8cEQVKIWw5SRb/C5QHjhTbLUB/06J8I=;
 b=PwnD7dBSTR7MdNoeMyjcvwH8gbAX75rUvjI884ycJdAkWyfaaNrlLFxHCoyL+JH/4J
 C4nw+IubHzpzSJ50nhsfSQofKw9rSJsC4XLWscgdCV/q0spP/PXUjdwV/vJzpE5Ge4YH
 vJnmXlRcxQB80uGlr531KYA3qQPodkqfDfE+bMEd71jjPpBWMbwmhvyblZSohvpNITjO
 5XvfmtCzJuyNe3Kh56K234RnUJxOroJhW2t/kFYOHcJE0Jt2JMUtP8dl21GIakXbyV+K
 siYmRBmGiF46svNl3xSqduDa0lZgRAmncgGhkbU5Nnp8tLZ8anjhoXompFn3ELDmLCcK
 EElw==
X-Gm-Message-State: AOJu0YxLqtTdkDtMt47OHxIpMMKQkj0covO4pe6BRWtqvE2Rd//MwR7j
 2WU2Jjpz2MIlzT7vNTpFZNllZ37GpNYQPXfU7kqOmpBQl/c47y085nIFV6aCTVI=
X-Google-Smtp-Source: AGHT+IEukExEYER3CO2AOrEmi++wHZk0VIqHFMC/hyUrUwPFKlp5PfARglTzWPr3wYUxAPg7cEj6cg==
X-Received: by 2002:a05:6870:6ec6:b0:22a:b358:268 with SMTP id
 qv6-20020a0568706ec600b0022ab3580268mr10954092oab.25.1713776629937; 
 Mon, 22 Apr 2024 02:03:49 -0700 (PDT)
Received: from localhost.localdomain ([116.66.212.162])
 by smtp.gmail.com with ESMTPSA id
 by42-20020a056a0205aa00b005fdd11c0874sm1919137pgb.64.2024.04.22.02.03.47
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Mon, 22 Apr 2024 02:03:49 -0700 (PDT)
From: Cong Yang <yangcong5@huaqin.corp-partner.google.com>
To: sam@ravnborg.org, neil.armstrong@linaro.org, daniel@ffwll.ch,
 dianders@chromium.org, linus.walleij@linaro.org,
 krzysztof.kozlowski+dt@linaro.org, robh+dt@kernel.org, conor+dt@kernel.org,
 airlied@gmail.com
Cc: dri-devel@lists.freedesktop.org, devicetree@vger.kernel.org,
 linux-kernel@vger.kernel.org, xuxinxiong@huaqin.corp-partner.google.com,
 Cong Yang <yangcong5@huaqin.corp-partner.google.com>
Subject: [PATCH v2 6/7] dt-bindings: display: panel: Add compatible for IVO
 t109nw41
Date: Mon, 22 Apr 2024 17:03:09 +0800
Message-Id: <20240422090310.3311429-7-yangcong5@huaqin.corp-partner.google.com>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20240422090310.3311429-1-yangcong5@huaqin.corp-partner.google.com>
References: <20240422090310.3311429-1-yangcong5@huaqin.corp-partner.google.com>
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

The IVO t109nw41 is a 11.0" WUXGA TFT LCD panel, which fits in nicely
with the existing himax-hx83102 driver. Hence, we add a new compatible
with panel specific config.

Signed-off-by: Cong Yang <yangcong5@huaqin.corp-partner.google.com>
---
 .../devicetree/bindings/display/panel/himax,hx83102.yaml        | 2 ++
 1 file changed, 2 insertions(+)

diff --git a/Documentation/devicetree/bindings/display/panel/himax,hx83102.yaml b/Documentation/devicetree/bindings/display/panel/himax,hx83102.yaml
index 86c349bbbb7b..780521aaae9b 100644
--- a/Documentation/devicetree/bindings/display/panel/himax,hx83102.yaml
+++ b/Documentation/devicetree/bindings/display/panel/himax,hx83102.yaml
@@ -17,6 +17,8 @@ properties:
     enum:
         # Boe nv110wum-l60 11.0" WUXGA TFT LCD panel
       - boe,nv110wum-l60
+        # IVO t109nw41 11.0" WUXGA TFT LCD panel
+      - ivo,t109nw41
         # STARRY himax83102-j02 10.51" WUXGA TFT LCD panel
       - starry,himax83102-j02
 
-- 
2.25.1

