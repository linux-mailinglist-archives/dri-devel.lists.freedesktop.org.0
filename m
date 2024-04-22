Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 3A2678AC848
	for <lists+dri-devel@lfdr.de>; Mon, 22 Apr 2024 11:03:44 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 510CF10F4D7;
	Mon, 22 Apr 2024 09:03:42 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=huaqin-corp-partner-google-com.20230601.gappssmtp.com header.i=@huaqin-corp-partner-google-com.20230601.gappssmtp.com header.b="PRMR9iXy";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-oa1-f51.google.com (mail-oa1-f51.google.com
 [209.85.160.51])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 5A63410F4DB
 for <dri-devel@lists.freedesktop.org>; Mon, 22 Apr 2024 09:03:41 +0000 (UTC)
Received: by mail-oa1-f51.google.com with SMTP id
 586e51a60fabf-233f389a61eso2060155fac.3
 for <dri-devel@lists.freedesktop.org>; Mon, 22 Apr 2024 02:03:41 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=huaqin-corp-partner-google-com.20230601.gappssmtp.com; s=20230601;
 t=1713776620; x=1714381420; darn=lists.freedesktop.org; 
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:from:to:cc:subject:date
 :message-id:reply-to;
 bh=LUQGG/clLJZnAtvPMOoTwY8ItLAOtc+n6AjmJmzIfBY=;
 b=PRMR9iXyU8mXZfh244jdd/0r1FANtblqRlSgSwn8glVRNkT+KNEtA7IMr7M/TpPjgd
 dxQAJvQB5IXe4WFuhYhPxWULKldwfUeMDODD1i/bI+ojKJBxJj+gX41qV1yWKtIWsZnh
 nl5SFGA6Y5wa/CynuEvG5yOuXEDcQEUeFXbwSOFu3Xd7KwwSLj/wyKkvBdtTo1C29tci
 fF2jANOinj3b3/xOWDAgcTGr82nRh5iVEKnUZzUFToruIvq5RhAdBSrgqcEmgWCx47JB
 59L03TTR8nd078shBzsOF+SJP0xGkRhH/Ab5RJREC5oW4oIAhhIc+1MAW8hXcboVSmAg
 gVJA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1713776620; x=1714381420;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=LUQGG/clLJZnAtvPMOoTwY8ItLAOtc+n6AjmJmzIfBY=;
 b=MJa4VFliNlVVh3n9jhmDptJZyG26dRUVCJKpecZVRaN/pCgIbO/Cxomyd2vwCYF5Zv
 ZZiQ4wgLuM0I4xtJ5L7zvs+fqkKZzlwgYde2Fl7ufP9L62AA0UlBH7eDdqRKdlNXOYcV
 tk/PoB9A1E65+Yq+j3WcLQ0hLun25If0HE4tQ9/JjSPihMxCwXKtG+rkdmTAcbI5KHul
 UDuiNR9xFIkxzDqfW0SwiWcD2XxQbNh9ApatGJly096FwZTQE5435AvIdUz9d5sZoza/
 K1ClzbCON2a2JU9aOA0z/WghjbUlZaWW0a2DMcfi+bjrMS1I3szioGa7Ra5CbrhldDnT
 8IMA==
X-Gm-Message-State: AOJu0YwXQmw1RcQrVhw3XiMk0WGZ3JRWcYO68/22L4II7yKcXq+NTnXc
 1DhiiQYQfm+rEFczBYBRnURERoPnh1Rj7qKnmQE8JBZlbSNKPwErZ5CramuaKMY=
X-Google-Smtp-Source: AGHT+IEVycp3aE84ZI9v6SvOp72fnGMHJ9wpmeuHO8eo0YEEN+3cTZF/H30yn+rU0sWSJY6bMwHS0g==
X-Received: by 2002:a05:6871:50d:b0:233:f233:c3ee with SMTP id
 s13-20020a056871050d00b00233f233c3eemr11509815oal.50.1713776620440; 
 Mon, 22 Apr 2024 02:03:40 -0700 (PDT)
Received: from localhost.localdomain ([116.66.212.162])
 by smtp.gmail.com with ESMTPSA id
 by42-20020a056a0205aa00b005fdd11c0874sm1919137pgb.64.2024.04.22.02.03.37
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Mon, 22 Apr 2024 02:03:40 -0700 (PDT)
From: Cong Yang <yangcong5@huaqin.corp-partner.google.com>
To: sam@ravnborg.org, neil.armstrong@linaro.org, daniel@ffwll.ch,
 dianders@chromium.org, linus.walleij@linaro.org,
 krzysztof.kozlowski+dt@linaro.org, robh+dt@kernel.org, conor+dt@kernel.org,
 airlied@gmail.com
Cc: dri-devel@lists.freedesktop.org, devicetree@vger.kernel.org,
 linux-kernel@vger.kernel.org, xuxinxiong@huaqin.corp-partner.google.com,
 Cong Yang <yangcong5@huaqin.corp-partner.google.com>
Subject: [PATCH v2 4/7] dt-bindings: display: panel: Add compatible for BOE
 nv110wum-l60
Date: Mon, 22 Apr 2024 17:03:07 +0800
Message-Id: <20240422090310.3311429-5-yangcong5@huaqin.corp-partner.google.com>
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

The BOE nv110wum-l60 is a 11.0" WUXGA TFT LCD panel, which fits in nicely
with the existing himax-hx83102 driver. Hence, we add a new compatible
with panel specific config.

Signed-off-by: Cong Yang <yangcong5@huaqin.corp-partner.google.com>
---
 .../devicetree/bindings/display/panel/himax,hx83102.yaml        | 2 ++
 1 file changed, 2 insertions(+)

diff --git a/Documentation/devicetree/bindings/display/panel/himax,hx83102.yaml b/Documentation/devicetree/bindings/display/panel/himax,hx83102.yaml
index 2e0cd6998ba8..86c349bbbb7b 100644
--- a/Documentation/devicetree/bindings/display/panel/himax,hx83102.yaml
+++ b/Documentation/devicetree/bindings/display/panel/himax,hx83102.yaml
@@ -15,6 +15,8 @@ allOf:
 properties:
   compatible:
     enum:
+        # Boe nv110wum-l60 11.0" WUXGA TFT LCD panel
+      - boe,nv110wum-l60
         # STARRY himax83102-j02 10.51" WUXGA TFT LCD panel
       - starry,himax83102-j02
 
-- 
2.25.1

