Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 7C0E19C309B
	for <lists+dri-devel@lfdr.de>; Sun, 10 Nov 2024 03:31:13 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 6BF6A10E3BA;
	Sun, 10 Nov 2024 02:31:09 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=gmail.com header.i=@gmail.com header.b="g2jvTQFW";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-pf1-f175.google.com (mail-pf1-f175.google.com
 [209.85.210.175])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 4C68810EA38
 for <dri-devel@lists.freedesktop.org>; Fri,  8 Nov 2024 20:05:33 +0000 (UTC)
Received: by mail-pf1-f175.google.com with SMTP id
 d2e1a72fcca58-71e681bc315so1964462b3a.0
 for <dri-devel@lists.freedesktop.org>; Fri, 08 Nov 2024 12:05:33 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20230601; t=1731096333; x=1731701133; darn=lists.freedesktop.org;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:from:to:cc:subject:date
 :message-id:reply-to;
 bh=+DQrmyvUoy8Qxlg/sWb3GUfwZsisNLmKE8ES1NvInQY=;
 b=g2jvTQFWaeVB+ILCEqVCVIlpJvE6GHHWPG2zKQTgOf78GvmNFhZCBuHeU9sFo2GjdU
 qjljv0idEghTVuHN/0wMpADgT6iKALK98dJ8sIgktQQcKGC0o2YLTSJQL/DlgCtONxhS
 mx/IXynU+8cAkxp2sBew6ZGDafx7THFLVsb9s6UMS1kcJnmKINJfFGgw46o2XxKq75am
 wiN93gz+oCUf7D76iUf9UuYE6+nlt0ySOXCwiHgzTs3Bh5R6Ewtlo1teD3QqC0D64bOx
 VtuiBlFeubVRcA4ELkzg4F4OQ346fagqGkHtoUkMuz8WDcQ5wm6TX3VnCMBFzt/u5RMu
 gjPA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1731096333; x=1731701133;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=+DQrmyvUoy8Qxlg/sWb3GUfwZsisNLmKE8ES1NvInQY=;
 b=MPsaaFrZ46F8y2c6GoP/K25Fnn3sKjVcXo1WR0clCaF8Qj5MO0fgzm/QYJUHVdUfgp
 +Jmb0BSgAanK1AVTSwh8p4RRw+qxSo0j1dQaiNe9xvVrSKW2qOKx12CoDralBPMlW+9d
 Ke0I/zOJt004TGIN2vRuWWR+zJJOZkYdvaAg9PrnPU8z0/10sqYaVHa0zbw9Q57rIQD+
 6GoedQAPuz0JKn7irMVIcDYAjhgh4ndkN9hrfcWc6gU5VSLjv+9x8RwoHvDTTWLt3g40
 Knmi9yeZ4Fz+eP9C5p6y23elPsRSjxPaF1RbrUu/lUJh+g8V9Fjoqpjlyx1yxmxp8pdO
 yOuw==
X-Forwarded-Encrypted: i=1;
 AJvYcCUlxGSaH9R38wFzzFYb7lHSFfnVQO6HOVVYv2IteYz9mDx194y+6t/KPScE39if6pAMUHERyhKU5SI=@lists.freedesktop.org
X-Gm-Message-State: AOJu0YyIADzRfKCrhAfUhDCCjCHjzYeRtULZ6pj5Sm5NR7d5U1w592yW
 FCEcmO/EaQvI12yptlEGV310+sS5WGvs3HbU7G0FlfcSp9Zm7d4X
X-Google-Smtp-Source: AGHT+IEBDpjZzXfnVHwO2ss0VK89kVwX/FZLVLrryxr3xjlDKEYrfiwufADuBXcAKyGSEpGJlvWSXw==
X-Received: by 2002:a05:6a00:1943:b0:71e:41a6:a0c6 with SMTP id
 d2e1a72fcca58-724140a4ec8mr6229167b3a.13.1731096332673; 
 Fri, 08 Nov 2024 12:05:32 -0800 (PST)
Received: from mighty.kangaroo-insen.ts.net ([120.88.183.182])
 by smtp.gmail.com with ESMTPSA id
 d2e1a72fcca58-72407a56a30sm4323418b3a.188.2024.11.08.12.05.23
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Fri, 08 Nov 2024 12:05:32 -0800 (PST)
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
Subject: [PATCH v3 05/10] dt-bindings: display: panel-lvds: Add compatible for
 Samsung LTN101AL03 Panel
Date: Fri,  8 Nov 2024 20:04:34 +0000
Message-ID: <20241108200440.7562-6-bavishimithil@gmail.com>
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

The LTN101AL03 is a 10.1 inch 800x1280, 24 bit, VESA Compatible, TFT display panel

Signed-off-by: Mithil Bavishi <bavishimithil@gmail.com>
---
 Documentation/devicetree/bindings/display/panel/panel-lvds.yaml | 2 ++
 1 file changed, 2 insertions(+)

diff --git a/Documentation/devicetree/bindings/display/panel/panel-lvds.yaml b/Documentation/devicetree/bindings/display/panel/panel-lvds.yaml
index 0cdd05d10..82bcaec68 100644
--- a/Documentation/devicetree/bindings/display/panel/panel-lvds.yaml
+++ b/Documentation/devicetree/bindings/display/panel/panel-lvds.yaml
@@ -52,6 +52,8 @@ properties:
           - hydis,hv070wx2-1e0
           # Samsung LTN070NL01 7.0" WSVGA (1024x600) TFT LCD LVDS panel
           - samsung,ltn070nl01
+          # Samsung LTN101AL03 10.1" WXGA (800x1280) TFT LCD LVDS panel
+          - samsung,ltn101al03
           - tbs,a711-panel
 
       - const: panel-lvds
-- 
2.43.0

