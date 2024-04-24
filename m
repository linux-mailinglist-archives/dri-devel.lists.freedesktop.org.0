Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id B32078AFE72
	for <lists+dri-devel@lfdr.de>; Wed, 24 Apr 2024 04:30:58 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 14CC010FB78;
	Wed, 24 Apr 2024 02:30:56 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=huaqin-corp-partner-google-com.20230601.gappssmtp.com header.i=@huaqin-corp-partner-google-com.20230601.gappssmtp.com header.b="iPgmOGAz";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-ot1-f50.google.com (mail-ot1-f50.google.com
 [209.85.210.50])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 21C4410FB78
 for <dri-devel@lists.freedesktop.org>; Wed, 24 Apr 2024 02:30:55 +0000 (UTC)
Received: by mail-ot1-f50.google.com with SMTP id
 46e09a7af769-6ea2436de79so3420373a34.1
 for <dri-devel@lists.freedesktop.org>; Tue, 23 Apr 2024 19:30:55 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=huaqin-corp-partner-google-com.20230601.gappssmtp.com; s=20230601;
 t=1713925854; x=1714530654; darn=lists.freedesktop.org; 
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:from:to:cc:subject:date
 :message-id:reply-to;
 bh=2MnjlgBDGHiJT1b3SIjLYv8ukjj45prcH3kNNtWQHt4=;
 b=iPgmOGAzHYmlh8njvdprOJk1Fe/ZYXqq7pr5Z2CL5hMqP8fX1MYIzhVtPR+xZLUlxF
 9ndR5gqx/iTuuKuinkn6/FpwJ6MBRyguPlS1HhPRBesbZBVmmOTjnDsbAufDjKAe224s
 SLw5zMGqSUgzbC6uQVWUkCposQ82SAJE30peqM71p7jAMjw8jeQcE0nVxRKyOoVhuPv9
 LF2mlAAFsBAb+3OUk4jcrASI0K6o5H4hg3X+oD9ag8F17a8084uPFpMqaqqMjYeU0ADv
 kaAQ+CBX8AfDWGlWQ2lb06/hQMQebkREJiNffVBHGgQ8XPm0zhbv44bGjbhawTMakRMQ
 wK0w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1713925854; x=1714530654;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=2MnjlgBDGHiJT1b3SIjLYv8ukjj45prcH3kNNtWQHt4=;
 b=VVjrUDxoGLfqEdLKa6AvhlSF0zI0A1dNhxNIbbJamrTNXkZxwnaAIBqa4i06hkJ7q5
 Rw3KpF81rXCkxEeq+Mzr3+4eDyR956sPFW5PwgFZv2TZXg6n7X90J0ZhH33rm0iCg5O+
 sRH0TtiBthDjFy/JmHDIhfNtsKDVY4/oWck0WdwufYtlumY9c5q9XAV58h5X1wOZ3KD/
 1TWj56uWjI1SwIwglpm9hSmWZ2aLRkKTK5ZAAdPl/lZQZWf3q/QDLJgmNfrTkaezFYkN
 VhrQINuJvfJVsHyO+JxmagV7x7t7Hf1k0Xz6XdCz1/WT05mxHnpQeuLDba3s+KfVd+I3
 EWpg==
X-Gm-Message-State: AOJu0YzbBoNmzjXs55HBNLTsllZaWWENLmLLke2yfe9V8QmSicYJ39hR
 nManG8PDkiSzQIVpdsLBs/CdPUfzqw7Kj55EEiWslnpJDVvEJHYDUwlitpgH6yQ=
X-Google-Smtp-Source: AGHT+IEkSEvmufTo31NovuwbAJDzl/ptr7DRtDxY5kNTsiK//D2/6Diten8VqKV66h6nr3R0+n2taA==
X-Received: by 2002:a05:6830:619:b0:6eb:cca1:26e4 with SMTP id
 w25-20020a056830061900b006ebcca126e4mr1559527oti.0.1713925854331; 
 Tue, 23 Apr 2024 19:30:54 -0700 (PDT)
Received: from localhost.localdomain ([116.66.212.162])
 by smtp.gmail.com with ESMTPSA id
 m2-20020a638c02000000b005e857e39b10sm10179385pgd.56.2024.04.23.19.30.51
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Tue, 23 Apr 2024 19:30:53 -0700 (PDT)
From: Cong Yang <yangcong5@huaqin.corp-partner.google.com>
To: sam@ravnborg.org, neil.armstrong@linaro.org, daniel@ffwll.ch,
 dianders@chromium.org, linus.walleij@linaro.org,
 krzysztof.kozlowski+dt@linaro.org, robh+dt@kernel.org, conor+dt@kernel.org,
 airlied@gmail.com
Cc: dri-devel@lists.freedesktop.org, devicetree@vger.kernel.org,
 linux-kernel@vger.kernel.org, xuxinxiong@huaqin.corp-partner.google.com,
 Cong Yang <yangcong5@huaqin.corp-partner.google.com>
Subject: [PATCH v3 6/7] dt-bindings: display: panel: Add compatible for IVO
 t109nw41
Date: Wed, 24 Apr 2024 10:30:09 +0800
Message-Id: <20240424023010.2099949-7-yangcong5@huaqin.corp-partner.google.com>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20240424023010.2099949-1-yangcong5@huaqin.corp-partner.google.com>
References: <20240424023010.2099949-1-yangcong5@huaqin.corp-partner.google.com>
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
---
Chage since V3:

- Update commit message.

V2: https://lore.kernel.org/all/20240422090310.3311429-7-yangcong5@huaqin.corp-partner.google.com/

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

