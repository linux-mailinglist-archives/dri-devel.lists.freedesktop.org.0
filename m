Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id D4F4067BE0C
	for <lists+dri-devel@lfdr.de>; Wed, 25 Jan 2023 22:22:09 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 215F410E28F;
	Wed, 25 Jan 2023 21:21:49 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-yb1-xb30.google.com (mail-yb1-xb30.google.com
 [IPv6:2607:f8b0:4864:20::b30])
 by gabe.freedesktop.org (Postfix) with ESMTPS id EE3DD10E122
 for <dri-devel@lists.freedesktop.org>; Wed, 25 Jan 2023 21:09:21 +0000 (UTC)
Received: by mail-yb1-xb30.google.com with SMTP id u72so4049984ybi.7
 for <dri-devel@lists.freedesktop.org>; Wed, 25 Jan 2023 13:09:21 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=criticallink.com; s=google;
 h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
 :mime-version:subject:date:from:from:to:cc:subject:date:message-id
 :reply-to; bh=XIlJ/2ukO6pHCtcdtpAJK3BuzsSI7aObU3Ceo8jzibo=;
 b=hew6/wHKEd2bSIYdB1oHJMVs4Dh0UL2iunLR9fGVFeuNT9f+eNsW0gL1ll0pyq9X8j
 2alTe/LUx9cu6iTqeImb7gXJrLJk1wR1mGBNQnYh+S6JH2al1ZmeMV+MkLs/xYs5v6tQ
 7FwZzHh5Y5CpCVIkujsvjAHRu/VIhC+qT/G5G9UKyXPgoZJdWr3TXEBsvMNDYpAbtWzn
 u0F0BzqV5cL/amlthcvrEZEP1PkzDsI8bo++CKYyjy24F123kDayKBnG9K/ukDUJjdJl
 q41rS96FN4zKqzITWnzfo4/6Wb9n6UxAKFF+mVqlXSPdwvK12glyXIi/roOK2dIROrZ9
 5oVQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
 :mime-version:subject:date:from:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=XIlJ/2ukO6pHCtcdtpAJK3BuzsSI7aObU3Ceo8jzibo=;
 b=Ujw93LUq5IehW38/8KQYzdwqFSs9xHZlRQ9jNgGNMOAja16eMuaIAHsVFKR8p6ybom
 4LpjTArHKmKNtXL0QAh9LX1eKlCeprgd0F4f+Ylwi0E9bi8/pSLK/xyh3m9G7YpJj0jb
 DAG1h9BSphgdB4vk5Htmjbhpdl1WRhFn3ar92zULkJCm0pcwqN6TAnf5mSqIxsJKPOtL
 31v6f/M7mOZCpGk8McTuGIEb6qZo2aBM9+gzzsuxgGVvhIy6lVjliU9qYD8PCtAPQsKa
 xHlT/bfdUZrkALAhDUDASK29icPoJdCic5Oyp9AAbFK9Z4vA0O5cnqTD/4+Ow95OgImU
 ecKw==
X-Gm-Message-State: AFqh2kr6bleokaqnhterv8OGaQgvKojOMTA0YHDmgZmj/yZWoOR8dGtq
 G0G3htwZktXLs9ZYaEHcbxsAMw==
X-Google-Smtp-Source: AMrXdXuwelH5a8jOV8LQT5Lv8Wy+AN1a2r4YXqXenm+tK/4agPeqKvYOSp87jnGCYes7X1ENx66aKw==
X-Received: by 2002:a25:4d55:0:b0:6c9:c534:d91f with SMTP id
 a82-20020a254d55000000b006c9c534d91fmr20790518ybb.10.1674680961086; 
 Wed, 25 Jan 2023 13:09:21 -0800 (PST)
Received: from [127.0.1.1] (static-72-90-70-109.syrcny.fios.verizon.net.
 [72.90.70.109]) by smtp.gmail.com with ESMTPSA id
 q196-20020a3743cd000000b0070736988c10sm4177090qka.110.2023.01.25.13.09.19
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Wed, 25 Jan 2023 13:09:20 -0800 (PST)
From: Jonathan Cormier <jcormier@criticallink.com>
Date: Wed, 25 Jan 2023 16:09:11 -0500
Subject: [PATCH 3/4] DRM: BRIDGE: TFP410: Fix logic to configured polled HPD
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20230125-tfp410_i2c-v1-3-66a4d4e390b7@criticallink.com>
References: <20230125-tfp410_i2c-v1-0-66a4d4e390b7@criticallink.com>
In-Reply-To: <20230125-tfp410_i2c-v1-0-66a4d4e390b7@criticallink.com>
To: Andrzej Hajda <andrzej.hajda@intel.com>,
 Neil Armstrong <neil.armstrong@linaro.org>,
 Robert Foss <robert.foss@linaro.org>,
 Laurent Pinchart <Laurent.pinchart@ideasonboard.com>,
 Jonas Karlman <jonas@kwiboo.se>, Jernej Skrabec <jernej.skrabec@gmail.com>,
 David Airlie <airlied@gmail.com>, Daniel Vetter <daniel@ffwll.ch>,
 Rob Herring <robh+dt@kernel.org>,
 Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>,
 Tomi Valkeinen <tomi.valkeinen@ti.com>, Jyri Sarha <jsarha@ti.com>
X-Mailer: b4 0.11.3-dev-d001f
X-Developer-Signature: v=1; a=openpgp-sha256; l=1011;
 i=jcormier@criticallink.com; h=from:subject:message-id;
 bh=8yPmLc4MapEEF5TA4azj668v9knGK86XMIMeNijF8zA=;
 b=owEBbQKS/ZANAwAKAdzX/S4LNuuqAcsmYgBj0Zp7jQtFzb/QD4rwpxlFkn3rgUOVtazLT1vpJcQy
 ZQGYCw6JAjMEAAEKAB0WIQT/MozqCeZtYxNnVN/c1/0uCzbrqgUCY9GaewAKCRDc1/0uCzbrqv/ZD/
 9d20xQAe/I+AxKXbgTpc3ZqHdekbCzul+TQfOMxr/CXNaJoL0quQlxyo/HkWH2N8iJE7juctDYyvek
 DpWpBtbJDip3JmPY3zPMwo4vXSYz8ClK0rm7QrbgbjnE2P7HtAr/z4Ra6LrqwETr8KN9dOSQU4UtWL
 R1w48hMc7B8vGcdbKDIp1Eh4eyh1glKqeoIShAWxqOpbZh0pYhweUH8/bZ+nXuVEfbUSWhLOWYda0S
 XSW51z5ESc+oYrh+qMdrRstQDtOK98AWPjiP3uiIrNeVYzhx5QSNvq6DCcF1tYvoCTW2jx3WJQWFht
 6e6hYwGwrMy2VIKJO6HJNvIZUf62nGYhFHCLIa+pm9LWQZgQWBmbA+KJ0jYgbAKUGPOj5kuoV4iy+k
 OQQUO8mnN5BG/iEPEu7BJsgzk0jl8/5bFYwZM5zFny/piLG3FeBmXGWfU9GIPwRDE5PBHSiHiab0+L
 ykWUisXADPOmgKeJ6t1F9mCOdYYFVtFs81u06yPMh1J9SZjxo0EA7F2wq6mVFDgFbnOZwMzS4s1xMb
 uOBEQ9bJ/Y3QuhTPl6+Dol6DK24NskNAeyeoD7QJkB5eOTUxhsmS+eFY66nyhjD+BsHL4IIosdLbFg
 seWimd7mB/SKtNpL2tVb7/byl9Tkyvwi/JU55FQEXfMcUVHkYXzBEMwbzRrA==
X-Developer-Key: i=jcormier@criticallink.com; a=openpgp;
 fpr=FF328CEA09E66D63136754DFDCD7FD2E0B36EBAA
X-Mailman-Approved-At: Wed, 25 Jan 2023 21:21:46 +0000
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
Cc: Jonathan Cormier <jcormier@criticallink.com>, devicetree@vger.kernel.org,
 Bob Duke <bduke@criticallink.com>, linux-kernel@vger.kernel.org,
 dri-devel@lists.freedesktop.org,
 Michael Williamson <michael.williamson@criticallink.com>
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

From: Michael Williamson <michael.williamson@criticallink.com>

The logic to configure polling (vs async/irq notification) of hot-plug
events was not correct.  If the connected bridge requires polling,
then inform the upstream bridge we also require polling.

Signed-off-by: Michael Williamson <michael.williamson@criticallink.com>
Signed-off-by: Jonathan Cormier <jcormier@criticallink.com>
---
 drivers/gpu/drm/bridge/ti-tfp410.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/drivers/gpu/drm/bridge/ti-tfp410.c b/drivers/gpu/drm/bridge/ti-tfp410.c
index 323a6d9ed188..837e1f81a0ff 100644
--- a/drivers/gpu/drm/bridge/ti-tfp410.c
+++ b/drivers/gpu/drm/bridge/ti-tfp410.c
@@ -155,7 +155,7 @@ static int tfp410_attach(struct drm_bridge *bridge,
 		return -ENODEV;
 	}
 
-	if (dvi->next_bridge->ops & DRM_BRIDGE_OP_DETECT)
+	if (dvi->next_bridge->ops & DRM_BRIDGE_OP_HPD)
 		dvi->connector.polled = DRM_CONNECTOR_POLL_HPD;
 	else
 		dvi->connector.polled = DRM_CONNECTOR_POLL_CONNECT | DRM_CONNECTOR_POLL_DISCONNECT;

-- 
2.25.1
