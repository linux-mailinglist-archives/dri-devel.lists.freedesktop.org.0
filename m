Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id DB19986008E
	for <lists+dri-devel@lfdr.de>; Thu, 22 Feb 2024 19:13:05 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id AA91A10E9E9;
	Thu, 22 Feb 2024 18:12:57 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=gmail.com header.i=@gmail.com header.b="nVjxmeRQ";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-wm1-f53.google.com (mail-wm1-f53.google.com
 [209.85.128.53])
 by gabe.freedesktop.org (Postfix) with ESMTPS id DCFEC10E30B
 for <dri-devel@lists.freedesktop.org>; Thu, 22 Feb 2024 16:44:38 +0000 (UTC)
Received: by mail-wm1-f53.google.com with SMTP id
 5b1f17b1804b1-4128fef00d6so909865e9.1
 for <dri-devel@lists.freedesktop.org>; Thu, 22 Feb 2024 08:44:38 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20230601; t=1708620277; x=1709225077; darn=lists.freedesktop.org;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:from:to:cc:subject:date
 :message-id:reply-to;
 bh=SJbQ3RMr2l9g2dwn49+72QIs9q2n9zDfNSkTMBZwZqU=;
 b=nVjxmeRQFC7HIBdDQZvJFA0tU0WCTlhmWp6Mm1FLvFkiAfHdkVLX27nTBy9IN2kI5F
 Whd2HPrezU595NRvTrrZyoOKYkz11eVL7Fgyh9WRCt3kt8/LCR6DXZPKtj51cMwyKJud
 gUBQ5BmTDBLydFavuzFG980CnP2g7/ljtl/MhmP02ypljCsHp26X+YeWq131LNVeB9nT
 STOLMQjFUWHaaUtxY3dxY/+dEyYjYbtNBOESELXP7cBOt9weP/OHcxNlgrwNzm5qinh+
 U1wbWuRzCFR77di+I7QU5bd0/Fbr/PKDGJJg+XEa6V9y9vfKqhqfnd0Kqn4excSg6ufH
 AW0g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1708620277; x=1709225077;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=SJbQ3RMr2l9g2dwn49+72QIs9q2n9zDfNSkTMBZwZqU=;
 b=k5HAWph71wjIYKOsq4HwGR3CRK0V+YD9WP4pcHR+YbNPkwtTC9gDGDRWGV3guCAkTW
 h2AwDa4LHhzUUkcsQ89ITsKhAJKMd2sNE82MKQ0e17/GbPtqDKlRAQJPQcuiU/5+moIW
 PastHItbLiJ+4SOpUGsOJEVKYkE58kOS+9640Gs+CWrUa+Y7GGlQk4T3WE8MynEkH+bN
 33Atcq8BhOqzm+BT/heqW8qADNoB8gN9jzEYthj4/FM1F+f1HFt9nJtWur+znmLyOTeh
 rvuWr9GAGw/8QjA5Z/ZSbRSMvQjGd3Mk9ddAHXBnVIvh3iAegqrNQ2s4y7Wjs3QDFPIk
 j4zA==
X-Forwarded-Encrypted: i=1;
 AJvYcCVsjjlH4VfETVO8M3g/FXTyz8wdrmXsUdA8musvMiaJJyAa9OxfMz3EGw7tgk6gkmGJ6rbk2GRuhFEx9EZ7kLtkWxizqNXMqLJbVVM1etbc
X-Gm-Message-State: AOJu0YwRMVuZuD5nlzacyiYNLc7IF29E1TJB3SALcIHvgWStPO6pdhHm
 K923ntsxnBGvRmaIfzw8i3epgPD9kJvFejSs7FZNcZ7zdNzzhyq5
X-Google-Smtp-Source: AGHT+IFzXwKQPSxSSxzZqbXiZzBKkMFdfxPv4JL+1o3Iq/5dLUL4kB+1nHUcUFbHgsQgjKD2SH3foA==
X-Received: by 2002:a05:600c:1c1e:b0:412:1d7d:6c51 with SMTP id
 j30-20020a05600c1c1e00b004121d7d6c51mr16054487wms.6.1708620277066; 
 Thu, 22 Feb 2024 08:44:37 -0800 (PST)
Received: from localhost.localdomain ([90.255.110.157])
 by smtp.googlemail.com with ESMTPSA id
 r2-20020a05600c35c200b004123b049f86sm22800420wmq.37.2024.02.22.08.44.36
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Thu, 22 Feb 2024 08:44:36 -0800 (PST)
From: Adam Green <greena88@gmail.com>
To: Jagan Teki <jagan@amarulasolutions.com>,
 Neil Armstrong <neil.armstrong@linaro.org>,
 Jessica Zhang <quic_jesszhan@quicinc.com>, Sam Ravnborg <sam@ravnborg.org>,
 David Airlie <airlied@gmail.com>, Daniel Vetter <daniel@ffwll.ch>,
 Maarten Lankhorst <maarten.lankhorst@linux.intel.com>,
 Maxime Ripard <mripard@kernel.org>,
 Thomas Zimmermann <tzimmermann@suse.de>, Rob Herring <robh+dt@kernel.org>,
 Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>,
 Conor Dooley <conor+dt@kernel.org>, dri-devel@lists.freedesktop.org,
 devicetree@vger.kernel.org, linux-kernel@vger.kernel.org
Cc: greena88@gmail.com
Subject: [PATCH v2 2/2] dt-bindings: display: st7701: Add Hardkernel ODROID-GO
 Ultra panel
Date: Thu, 22 Feb 2024 16:43:14 +0000
Message-ID: <20240222164332.3864716-3-greena88@gmail.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20240222164332.3864716-1-greena88@gmail.com>
References: <20240221194528.1855714-1-greena88@gmail.com>
 <20240222164332.3864716-1-greena88@gmail.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Mailman-Approved-At: Thu, 22 Feb 2024 18:12:56 +0000
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

The ODROID-GO Ultra panel is a panel specific to the Hardkernel
ODROID-GO Ultra. It is 5 inches in size (diagonally) with a
resolution of 480x854.

Signed-off-by: Adam Green <greena88@gmail.com>
---
 .../devicetree/bindings/display/panel/sitronix,st7701.yaml       | 1 +
 1 file changed, 1 insertion(+)

diff --git a/Documentation/devicetree/bindings/display/panel/sitronix,st7701.yaml b/Documentation/devicetree/bindings/display/panel/sitronix,st7701.yaml
index b348f5bf0a98..3eb306161f1a 100644
--- a/Documentation/devicetree/bindings/display/panel/sitronix,st7701.yaml
+++ b/Documentation/devicetree/bindings/display/panel/sitronix,st7701.yaml
@@ -30,6 +30,7 @@ properties:
           - anbernic,rg-arc-panel
           - densitron,dmt028vghmcmi-1a
           - elida,kd50t048a
+          - hardkernel,odroid-go-ultra-panel
           - techstar,ts8550b
       - const: sitronix,st7701
 
-- 
2.43.0

