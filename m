Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 8612CD39CEB
	for <lists+dri-devel@lfdr.de>; Mon, 19 Jan 2026 04:30:56 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id E386510E32F;
	Mon, 19 Jan 2026 03:30:54 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=gmail.com header.i=@gmail.com header.b="CsGsS82K";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-qv1-f51.google.com (mail-qv1-f51.google.com
 [209.85.219.51])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 239CA10E341
 for <dri-devel@lists.freedesktop.org>; Mon, 19 Jan 2026 03:30:49 +0000 (UTC)
Received: by mail-qv1-f51.google.com with SMTP id
 6a1803df08f44-88a288811a4so40642936d6.3
 for <dri-devel@lists.freedesktop.org>; Sun, 18 Jan 2026 19:30:49 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20230601; t=1768793448; x=1769398248; darn=lists.freedesktop.org;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:from:to:cc:subject:date
 :message-id:reply-to;
 bh=xT+OlgLwisjDHGRQGA0CO4AmF6Wqh7tGvnECOOk06AE=;
 b=CsGsS82K/qqkPZxbPRxg+RSiOjwV0MYrl7wv1LTaZCCDXOk55iKMDBlgYFNgcUw1W0
 EF14Zrd4IR2+BtnY5vCp7KXVlFc4WQwIJ/F0mDWkZP6UTuH+gnFi2hBjyQ2/OAJbcy+I
 R9TVkjgvB0mkZ+j8WoXDSR3fQtTP5Z08J/sqT3PMc6P92bgcWeKn7/nkLQ5/g9yQaAWi
 mFWbeljGpXvKyCdn5LRnQeyNZ/qILVWLumB6dRsjmCyTeSBjJuHKIktI4sgpBs0/rqfP
 kJmFU35MypuRlHxBzvfWMKXnbzptpQKLfkDjZm10PqsSDMsrd652t4kEAFORi/HljmD0
 4uOg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1768793448; x=1769398248;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
 :to:cc:subject:date:message-id:reply-to;
 bh=xT+OlgLwisjDHGRQGA0CO4AmF6Wqh7tGvnECOOk06AE=;
 b=IKdBnC+899rWMxq0Oo9/WiPnyfZZE95NQ7cK0KLsUEoJKzjECyBZbsHLWWScZB7NdP
 R7k77dlGy0gFtQDrGikJYRaFNYkXC0b9wWnx1GQYvVLa3jmnWNJ7Zr/ACiP7HCNOmAeK
 BC2tl4JrsbXGLJb06c6nQwOuwBfdqS8mu5Rcoa+6caog+dDYHDE2oSNCih1ephB2e5Ym
 mtnlIoY9wxgtLr1ATqVmst5nYqWm0mXH/zmk6npVezfuCriMQ88bIs3kdjFDn8JiVzNr
 3CLMxjJQpGMqeW5JWobEr6Jy8dae6lbNv2lGlUk62A6PIqF54s1RQhNKSTvvyAq8HZGk
 1eLA==
X-Forwarded-Encrypted: i=1;
 AJvYcCVRTsR6W1zwaNEKhRpKhWSjyvYjx3UxZzuXWbcjOTESTsKoaGJKo1brxuF6UETI47XkdWaJhhZAXvY=@lists.freedesktop.org
X-Gm-Message-State: AOJu0YxlbbO+aJ1uvfRG1oHBLOqRiemeXrALxtx7OLzTiGxc9q3nPakH
 pSmCvHuxZFMLOP67bsIxy9+7pBUhHCX9mq+elVnu2WenDgTz6+x+a5MW
X-Gm-Gg: AY/fxX59jcRFKrukM8TDexK0LbDhMjrpQf9Uxku2NwOQoagFB4/tQv55H6x92ydWJlc
 5dm98CWbWvu++kAr5L7ulyjU3dDCzYMWx7YqMTzDVK/5n4HnvR/Jm9aKkPGN9MXv6WHo/FVVhdo
 KgQVN2NTwzlEfVjiaavBKcacFz4u5N1UDYP6pN+Zm1SGotUsE91M3mUCloEdRkNSH+IFG6AT5wy
 J6PDHpkRfyu58i4OsgbLkPv9tl7fvyeaiyq4xdilZcBr9zBE0R9UHSaY55FRyMAuXaqDMktdi+W
 3y/bm4G4+oA1BJBkaqEjAsspTGdq5OvefOCu5ff0LUdqxt/I9VrxszsoNxisyLZqABQcMUuc3N/
 2i46hklRzK9pD4sTVfVVJyV1/XTUpdXFWcdqCAUyayIAcOQL4MuDQAHL+GnyoySvvRaEDgaSH7Y
 5aGO8AJol83vZB+EztMpqbxCkkV27lj2+Gg3IjdWF7TN4Cwlrj4kQujsrISTRc4wba/lc=
X-Received: by 2002:a05:6214:1d25:b0:7d2:e1e6:f79f with SMTP id
 6a1803df08f44-8942dda1871mr127151346d6.47.1768793448154; 
 Sun, 18 Jan 2026 19:30:48 -0800 (PST)
Received: from mighty.localdomain (nat-130-245-192-1.resnet.stonybrook.edu.
 [130.245.192.1]) by smtp.gmail.com with ESMTPSA id
 af79cd13be357-8c6a71ab20dsm724706885a.5.2026.01.18.19.30.47
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Sun, 18 Jan 2026 19:30:47 -0800 (PST)
From: Mithil Bavishi <bavishimithil@gmail.com>
To: aaro.koskinen@iki.fi, andreas@kemnade.info, khilman@baylibre.com,
 rogerq@kernel.org, tony@atomide.com, robh@kernel.org, krzk+dt@kernel.org,
 conor+dt@kernel.org, neil.armstrong@linaro.org, rfoss@kernel.org,
 laurent.pinchart@ideasonboard.com, jonas@kwiboo.se,
 jernej.skrabec@gmail.com, maarten.lankhorst@linux.intel.com,
 mripard@kernel.org, tzimmermann@suse.de, airlied@gmail.com,
 simona@ffwll.ch, quic_jesszhan@quicinc.com, bavishimithil@gmail.com,
 prabhakar.mahadev-lad.rj@bp.renesas.com, thierry.reding@gmail.com
Cc: linux-omap@vger.kernel.org, devicetree@vger.kernel.org,
 linux-kernel@vger.kernel.org, dri-devel@lists.freedesktop.org,
 linux-hardening@vger.kernel.org,
 Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
Subject: [PATCH v4 04/10] dt-bindings: display: panel-lvds: Add compatible for
 Samsung LTN070NL01 Panel
Date: Sun, 18 Jan 2026 22:30:29 -0500
Message-ID: <20260119033035.57538-6-bavishimithil@gmail.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20260119033035.57538-1-bavishimithil@gmail.com>
References: <20260119033035.57538-1-bavishimithil@gmail.com>
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

The LTN070NL01 is a 7.0 inch 1024x600, 24 bit, VESA Compatible, TFT
display panel

Signed-off-by: Mithil Bavishi <bavishimithil@gmail.com>
Acked-by: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
---
 Documentation/devicetree/bindings/display/panel/panel-lvds.yaml | 2 ++
 1 file changed, 2 insertions(+)

diff --git a/Documentation/devicetree/bindings/display/panel/panel-lvds.yaml b/Documentation/devicetree/bindings/display/panel/panel-lvds.yaml
index dbc01e640..68c16c1ae 100644
--- a/Documentation/devicetree/bindings/display/panel/panel-lvds.yaml
+++ b/Documentation/devicetree/bindings/display/panel/panel-lvds.yaml
@@ -58,6 +58,8 @@ properties:
           - hydis,hv070wx2-1e0
           # Jenson Display BL-JT60050-01A 7" WSVGA (1024x600) color TFT LCD LVDS panel
           - jenson,bl-jt60050-01a
+          # Samsung LTN070NL01 7.0" WSVGA (1024x600) TFT LCD LVDS panel
+          - samsung,ltn070nl01
           - tbs,a711-panel
           # Winstar WF70A8SYJHLNGA 7" WSVGA (1024x600) color TFT LCD LVDS panel
           - winstar,wf70a8syjhlnga
-- 
2.43.0

