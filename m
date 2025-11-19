Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id C3AD3C7165A
	for <lists+dri-devel@lfdr.de>; Wed, 19 Nov 2025 23:58:02 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 91A7A10E273;
	Wed, 19 Nov 2025 22:58:00 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=gmail.com header.i=@gmail.com header.b="ka0RHctj";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-oa1-f50.google.com (mail-oa1-f50.google.com
 [209.85.160.50])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 31F8010E26D
 for <dri-devel@lists.freedesktop.org>; Wed, 19 Nov 2025 22:57:57 +0000 (UTC)
Received: by mail-oa1-f50.google.com with SMTP id
 586e51a60fabf-3ec314aaae5so109449fac.0
 for <dri-devel@lists.freedesktop.org>; Wed, 19 Nov 2025 14:57:57 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20230601; t=1763593076; x=1764197876; darn=lists.freedesktop.org;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:from:to:cc:subject:date
 :message-id:reply-to;
 bh=ojyXh9J+hBwCNMVLciyvICBaCTIpiiyWT0C0jl060F0=;
 b=ka0RHctjBblrH92Blayiq4Mwi7EY3rQMm02nkD7h/5//0hRDQfF3wVsC5jpyMurzAP
 c33eCIekENiczZj/srMP1K4JqC4tSq4EiQeJVocPen7nincDOZi5CpYIPyU0Z6SvW8jZ
 cmaQDIHx1BBIHs3wy8NgaPMXQCmu1ElLZ8OhaJd50aOuLbymiMne+alfYlAEo3e1Wsit
 a60SGfV6AQVcqw6tVIlsUpOua2v8eep9cBFgBorx5kPT9+T08M8BGMZbV0sCd6kPLFov
 PBD5femvvyANT2MKJEz/+n/ViuSKMyjvbb+cGq25V8wxy315yDoWXQ3gvm8+kqsXrEXE
 FrWQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1763593076; x=1764197876;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
 :to:cc:subject:date:message-id:reply-to;
 bh=ojyXh9J+hBwCNMVLciyvICBaCTIpiiyWT0C0jl060F0=;
 b=VrREsT1VLKaM4cjKOUOfQDsvDYOCKX6wPRJjbciRqMYyS5aLWSZOa3z+t/vFho21z1
 FEmde3xCQBKrdHrCo+qkdvXR15/JPSm9rJoBqx3luFek19wOVdq/UHxG+ZTGKzhz4p+5
 94uA35DFhwLhCV/ByiIaVokw75zW1esAYv5GP18Q6Nr2oCmWcx0b5i3kNBktUJ75GZE9
 z2oxk4DnKRYyOtnDkSyCRhgvtnKDG7TRyjujlZw01etSm93x8yFUsneJJlIYCQ5Rrjjd
 FiCpuR4ZMxXwGeFit9x8zIt67Q2t8Vw/kIyrZb7Y+tlULU8bKInPS67Xtlc733G2abbQ
 oyaA==
X-Forwarded-Encrypted: i=1;
 AJvYcCXkYm7kic+P5aqk5dOP/xuL3SGWZ6GxrUr8q1cXg/CTJv0DFotCQcvEvvA+hyveM40vCxGqR6Uw/Gc=@lists.freedesktop.org
X-Gm-Message-State: AOJu0Yx9By1f6lgzgVcEYC/DFmvcjJl+qaUoIfFWVh6eeVV5cMDOCwyU
 08Ax3ePnO+7hov+aWEjOd0WR5wX3hz3fIqz8aP4btKmcM/hb3+lGpVaD
X-Gm-Gg: ASbGncvO3nc5WLDKuwGexl8xU233QdcF1s8m52kVeaPxdpVBT2tjo/ElxrKJTiT0qea
 8UdiWBiKe63HbtRkatB1Q4sk+BxhbBntm+lPPRWlokFbFE7hDLsfB95pFHI/+Ck9O1RyZjnqcG8
 GvIig/kQn1Roql1Uv36m80JNgNmTT0VFqB8vEQEyhakv5OXBhSrzXmrYqyL69Y9LGa4T/XN1qcH
 9LDuFoCzn6De1voEMQaFex6a/qcqkUmYB3/pl3CQ0wfUQe7P9GJUnBbU5ItQTZupZZ31P0dEmY+
 KIZwXnWnd/VJowq2iyRvsWN41PGgtf9DzJGMtqh8X25iG7UyPm/qOGFNhl5e37EroP6CZe352ww
 vdbdxnF9GxWIQzROGDYXckH6+LtifLFL7g95wjSTu0mqzcpWK23NlRJ2c4kHjcVBG9GvEhLvrFT
 xS+IaPbTlX/fVVqibbTnR9Jdo0pT30wA==
X-Google-Smtp-Source: AGHT+IEkoK4IKUSKkADKn3nl7MMZN9fnLRgr8FuZfcsJqIloseBEgJ9BYQnnl0mgNPa4iiUW2K74ZQ==
X-Received: by 2002:a05:6871:825:b0:3d4:fe66:28f6 with SMTP id
 586e51a60fabf-3eca16b166cmr140484fac.27.1763593076280; 
 Wed, 19 Nov 2025 14:57:56 -0800 (PST)
Received: from localhost.localdomain ([2600:1700:fb0:1bc0::54])
 by smtp.gmail.com with ESMTPSA id
 586e51a60fabf-3ec9dcfe28csm346496fac.22.2025.11.19.14.57.55
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Wed, 19 Nov 2025 14:57:55 -0800 (PST)
From: Chris Morgan <macroalpha82@gmail.com>
To: linux-rockchip@lists.infradead.org
Cc: mripard@kernel.org, devicetree@vger.kernel.org, conor+dt@kernel.org,
 rfoss@kernel.org, tzimmermann@suse.de, jonas@kwiboo.se,
 neil.armstrong@linaro.org, heiko@sntech.de,
 sebastian.reichel@collabora.com, jernej.skrabec@gmail.com,
 dri-devel@lists.freedesktop.org, andrzej.hajda@intel.com,
 andy.yan@rock-chips.com, krzk+dt@kernel.org, robh@kernel.org,
 Laurent.pinchart@ideasonboard.com, cristian.ciocaltea@collabora.com,
 Chris Morgan <macromorgan@hotmail.com>,
 Conor Dooley <conor.dooley@microchip.com>
Subject: [PATCH V3 1/3] dt-bindings: display: rockchip: Add no-hpd for
 dw-hdmi-qp controller
Date: Wed, 19 Nov 2025 16:55:24 -0600
Message-ID: <20251119225526.70588-2-macroalpha82@gmail.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20251119225526.70588-1-macroalpha82@gmail.com>
References: <20251119225526.70588-1-macroalpha82@gmail.com>
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

From: Chris Morgan <macromorgan@hotmail.com>

Add an attribute of "no-hpd" for the Rockchip dw-hdmi-qp controller.
This is used to describe implementations where the HPD pin is not
connected or used for other purposes, such as in the RK3588S based
Gameforce Ace which repurposed the GPIO for an additional face
button.

The "no-hpd" option was chosen to be consistent with other devices
which already define this parameter for broken or missing hpd
functionality.

Acked-by: Conor Dooley <conor.dooley@microchip.com>
Signed-off-by: Chris Morgan <macromorgan@hotmail.com>
---
 .../display/rockchip/rockchip,rk3588-dw-hdmi-qp.yaml        | 6 ++++++
 1 file changed, 6 insertions(+)

diff --git a/Documentation/devicetree/bindings/display/rockchip/rockchip,rk3588-dw-hdmi-qp.yaml b/Documentation/devicetree/bindings/display/rockchip/rockchip,rk3588-dw-hdmi-qp.yaml
index 96b4b088eebe..07342838cd52 100644
--- a/Documentation/devicetree/bindings/display/rockchip/rockchip,rk3588-dw-hdmi-qp.yaml
+++ b/Documentation/devicetree/bindings/display/rockchip/rockchip,rk3588-dw-hdmi-qp.yaml
@@ -69,6 +69,12 @@ properties:
       - const: main
       - const: hpd
 
+  no-hpd:
+    type: boolean
+    description:
+      The HPD pin is not present or used for another purpose, and the EDID
+      must be polled instead to determine if a device is attached.
+
   phys:
     maxItems: 1
     description: The HDMI/eDP PHY
-- 
2.43.0

