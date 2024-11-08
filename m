Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id C86E99C3096
	for <lists+dri-devel@lfdr.de>; Sun, 10 Nov 2024 03:31:07 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 9892810E3A5;
	Sun, 10 Nov 2024 02:30:59 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=gmail.com header.i=@gmail.com header.b="E5saXHRg";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-pf1-f174.google.com (mail-pf1-f174.google.com
 [209.85.210.174])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 191D810EA38
 for <dri-devel@lists.freedesktop.org>; Fri,  8 Nov 2024 20:05:50 +0000 (UTC)
Received: by mail-pf1-f174.google.com with SMTP id
 d2e1a72fcca58-71e8235f0b6so2205218b3a.3
 for <dri-devel@lists.freedesktop.org>; Fri, 08 Nov 2024 12:05:50 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20230601; t=1731096349; x=1731701149; darn=lists.freedesktop.org;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:from:to:cc:subject:date
 :message-id:reply-to;
 bh=UJU01u6dvTS6Al7pIDua0EgkQVSaf8CKKCyoeDXy9CI=;
 b=E5saXHRg54D7RmvGO+srF2J3RWTbTnCfXT++l/sOrRRJtpH0KgY6F8DeLs470RphnK
 fKCJJ1+2osYQQT/puyZ2dO0ku5JMXO0aGCa+xVIYm5NoZ4d5odKuEVccQzm8qGA4pwk8
 dibQS8wn3o9qqHb3MJwEpvpqeXN8x1KHC8nTHQNxZ/8YaCaiybDQW1Qd14W5DTQfMuib
 Z630xuXjbCwE65vQitXNKZaJ3XMoXViLWD/tijNBGeU84JRAVff8sQL39/KamrRgqAs4
 DZPsR6O2l0HHV1ynpcPsdKELXcDDB39gRBsquPf7w7+rZFHrR0Dh9XpWIesVvtv1/lmI
 9pSw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1731096349; x=1731701149;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=UJU01u6dvTS6Al7pIDua0EgkQVSaf8CKKCyoeDXy9CI=;
 b=p0+a+fKpJ4H6AUOO9cp3CCWH1hf90RsSEENka0dtwFQb6aKvT1mkZOH5BrhBywMY2h
 8Twg4L+jBWSMCpzlR7kOaMklgmjRoYjmxg6WUgwSuq3az6YT6dcH5iUPe4x6AFqa+daq
 VhI+hlsk8CPTO3MJivCgxPgWBd6IAZySLmuGb+jYxXjmua9GctG4iEj6M302GlhEa8EF
 QpfoXPZk3C/a0baWTYQXtLhUlaiTulxGeCLLPH1qajD7V3ydG1DMpj52VYHT2Lx93/c2
 5qi9/CIv5j48qKKTblYUphjK2tUBANFJxuiCdyb+eSwvn/FM+uaBPeVsTxHSMD6G1SY8
 +IZA==
X-Forwarded-Encrypted: i=1;
 AJvYcCU6W0yDAuEJJLz5vC9drD7hVu88xv2jz0iBCPwwksXrN+ADmywcNOxsLuntxOxZIW4jYLDEETZFvn4=@lists.freedesktop.org
X-Gm-Message-State: AOJu0Yyktrb602Eu0Alxwvce/u/onWdOKl4KE2+X8HY9eCxVS0qpbcL+
 WnTOkMPhGuwYcKd1/3by+tgtPu2VB0+1wLMfNDTqzSnuAemqogi+
X-Google-Smtp-Source: AGHT+IFvTazhOJ5wkdfiOQQjdutHEfc5qvJgtEFjjHS+9rcD6OLqullknv0nr1Gd3emk4tX0050mbA==
X-Received: by 2002:a05:6a21:7882:b0:1db:ff9a:c9bf with SMTP id
 adf61e73a8af0-1dc22b90c69mr5519540637.39.1731096349468; 
 Fri, 08 Nov 2024 12:05:49 -0800 (PST)
Received: from mighty.kangaroo-insen.ts.net ([120.88.183.182])
 by smtp.gmail.com with ESMTPSA id
 d2e1a72fcca58-72407a56a30sm4323418b3a.188.2024.11.08.12.05.41
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Fri, 08 Nov 2024 12:05:49 -0800 (PST)
From: Mithil Bavishi <bavishimithil@gmail.com>
To: Aaro Koskinen <aaro.koskinen@iki.fi>,
 Andreas Kemnade <andreas@kemnade.info>,
 Kevin Hilman <khilman@baylibre.com>, Roger Quadros <rogerq@kernel.org>,
 Tony Lindgren <tony@atomide.com>, Rob Herring <robh@kernel.org>,
 Krzysztof Kozlowski <krzk+dt@kernel.org>,
 Conor Dooley <conor+dt@kernel.org>,
 Neil Armstrong <neil.armstrong@linaro.org>, Robert Foss <rfoss@kernel.org>,
 Laurent Pinchart <Laurent.pinchart@ideasonboard.com>,
 Jonas Karlman <jonas@kwiboo.se>, Jernej Skrabec <jernej.skrabec@gmail.com>,
 Maarten Lankhorst <maarten.lankhorst@linux.intel.com>,
 Maxime Ripard <mripard@kernel.org>,
 Thomas Zimmermann <tzimmermann@suse.de>, David Airlie <airlied@gmail.com>,
 Simona Vetter <simona@ffwll.ch>, Jessica Zhang <quic_jesszhan@quicinc.com>,
 Mithil Bavishi <bavishimithil@gmail.com>,
 Lad Prabhakar <prabhakar.mahadev-lad.rj@bp.renesas.com>,
 Thierry Reding <thierry.reding@gmail.com>
Cc: linux-omap@vger.kernel.org, devicetree@vger.kernel.org,
 linux-kernel@vger.kernel.org, dri-devel@lists.freedesktop.org,
 linux-hardening@vger.kernel.org
Subject: [PATCH v3 07/10] dt-bindings: omap: Add Samsung Galaxy Tab 2 7.0
Date: Fri,  8 Nov 2024 20:04:36 +0000
Message-ID: <20241108200440.7562-8-bavishimithil@gmail.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20241108200440.7562-1-bavishimithil@gmail.com>
References: <20241108200440.7562-1-bavishimithil@gmail.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Mailman-Approved-At: Sun, 10 Nov 2024 02:30:58 +0000
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

Add samsung-espresso7 codename for the 7 inch variant

Signed-off-by: Mithil Bavishi <bavishimithil@gmail.com>
---
 Documentation/devicetree/bindings/arm/ti/omap.yaml | 1 +
 1 file changed, 1 insertion(+)

diff --git a/Documentation/devicetree/bindings/arm/ti/omap.yaml b/Documentation/devicetree/bindings/arm/ti/omap.yaml
index 93e04a109..32978dd9e 100644
--- a/Documentation/devicetree/bindings/arm/ti/omap.yaml
+++ b/Documentation/devicetree/bindings/arm/ti/omap.yaml
@@ -138,6 +138,7 @@ properties:
               - motorola,xyboard-mz617
               - ti,omap4-panda
               - ti,omap4-sdp
+              - samsung,espresso7
           - const: ti,omap4430
           - const: ti,omap4
 
-- 
2.43.0

