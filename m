Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 45C118BE4C7
	for <lists+dri-devel@lfdr.de>; Tue,  7 May 2024 15:53:21 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 42D0C10F944;
	Tue,  7 May 2024 13:53:19 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=huaqin-corp-partner-google-com.20230601.gappssmtp.com header.i=@huaqin-corp-partner-google-com.20230601.gappssmtp.com header.b="s3HpOecb";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-il1-f180.google.com (mail-il1-f180.google.com
 [209.85.166.180])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 2460410F944
 for <dri-devel@lists.freedesktop.org>; Tue,  7 May 2024 13:53:17 +0000 (UTC)
Received: by mail-il1-f180.google.com with SMTP id
 e9e14a558f8ab-36c947ff642so9503895ab.2
 for <dri-devel@lists.freedesktop.org>; Tue, 07 May 2024 06:53:17 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=huaqin-corp-partner-google-com.20230601.gappssmtp.com; s=20230601;
 t=1715089996; x=1715694796; darn=lists.freedesktop.org; 
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:from:to:cc:subject:date
 :message-id:reply-to;
 bh=YRLLQgZNrYl6aBdDwC8zCW2rb525AGUm7KQlD+QKN8s=;
 b=s3HpOecbOX74Kgneh7CTEOTMfcsT0E7Varf5nWBWQpqIZIXLvdX7GMPEn6NKYBA1t1
 CEcrTrghngUZZ+NlFxud2/slQtIRr3ewpBjjps9ucyF7ebflNqKODvMvC8HU8gEWYlO/
 Wo/oXLlKoUM0sNBHHxlJH8W9DytYuSOFGx2V1rBgbD1A+DFa8M/z96USYn7KOqCEjdx9
 PTRSGVoqtSHaIcGJV2J/KeSzEaEgXUb0vFeVMlHuq0J246j1YPnmwbFBgFjyH3KEbeh1
 9q9/dSN2znkyiPMv1ob2pCJ7vWnklYcrt8E/O1z1iz3QhTHoy61osIiDtt9fBC9i3PSd
 rhVA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1715089996; x=1715694796;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=YRLLQgZNrYl6aBdDwC8zCW2rb525AGUm7KQlD+QKN8s=;
 b=LeGrZKegsewNo03oiGHdIegwnrpZs7LY+P47yYBb5QN5Z8vsgONShobJJ/S/yJBqev
 BsE4HsWYimcIWeEjg7d7hCMKFh/gONfVF7hkMUwKUYuzVkq+PSLTvpRUwwelTxPYjn/1
 nXgTlokqvbFV2tEBWofMiAN16NsNvHKKf+12uTScsBDP4wSKKpbP36KAfoM2ayoWlzhF
 02CMeRwmnUOMxcPIB0jJDD017fDFfgYu+I+gjwI0+H2lLlXnFbZp0B/b7740NAxUHJb7
 Lx4owSa5BLyp6658Jxyxh9bPL1//owJKTAHayDMVNVJsRzZVMDiRYKX0IOIgbYRPpQne
 Z7iQ==
X-Gm-Message-State: AOJu0Yy9VFfEXZe02UJaafVHkaz4nphtWYVlZK8xwTUYtJ5FCcEz6o1L
 rJVn3zK16CADCKtBY8A8E8LPi0CUe5/ifq3eb9wrnkywakhabcjNWkp40CvkYUg=
X-Google-Smtp-Source: AGHT+IHc4r1U7Ta+XPtKwX/5kY5lBnxwzZ+rmvwhMf42hHN3z0hGF5Zk0LA2SvP0MHmm3rHamg9HHg==
X-Received: by 2002:a05:6e02:174b:b0:36a:3c07:9caf with SMTP id
 y11-20020a056e02174b00b0036a3c079cafmr15721916ill.30.1715089996261; 
 Tue, 07 May 2024 06:53:16 -0700 (PDT)
Received: from localhost.localdomain ([116.66.212.162])
 by smtp.gmail.com with ESMTPSA id
 e7-20020a63e007000000b005dc8702f0a9sm9850542pgh.1.2024.05.07.06.53.13
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Tue, 07 May 2024 06:53:15 -0700 (PDT)
From: Cong Yang <yangcong5@huaqin.corp-partner.google.com>
To: sam@ravnborg.org, neil.armstrong@linaro.org, daniel@ffwll.ch,
 dianders@chromium.org, linus.walleij@linaro.org,
 krzysztof.kozlowski+dt@linaro.org, robh+dt@kernel.org, conor+dt@kernel.org,
 airlied@gmail.com
Cc: dri-devel@lists.freedesktop.org, devicetree@vger.kernel.org,
 linux-kernel@vger.kernel.org, xuxinxiong@huaqin.corp-partner.google.com,
 Cong Yang <yangcong5@huaqin.corp-partner.google.com>
Subject: [PATCH v4 6/7] dt-bindings: display: panel: Add compatible for IVO
 t109nw41
Date: Tue,  7 May 2024 21:52:33 +0800
Message-Id: <20240507135234.1356855-7-yangcong5@huaqin.corp-partner.google.com>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20240507135234.1356855-1-yangcong5@huaqin.corp-partner.google.com>
References: <20240507135234.1356855-1-yangcong5@huaqin.corp-partner.google.com>
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
index 53a6ace75ada..f65b47cad0d4 100644
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

