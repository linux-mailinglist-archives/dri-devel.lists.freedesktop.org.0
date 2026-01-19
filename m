Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 43C61D39CF0
	for <lists+dri-devel@lfdr.de>; Mon, 19 Jan 2026 04:31:02 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 7176110E33E;
	Mon, 19 Jan 2026 03:30:58 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=gmail.com header.i=@gmail.com header.b="h7BYnvA+";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-qk1-f176.google.com (mail-qk1-f176.google.com
 [209.85.222.176])
 by gabe.freedesktop.org (Postfix) with ESMTPS id A413110E339
 for <dri-devel@lists.freedesktop.org>; Mon, 19 Jan 2026 03:30:56 +0000 (UTC)
Received: by mail-qk1-f176.google.com with SMTP id
 af79cd13be357-8c52e25e644so356993685a.0
 for <dri-devel@lists.freedesktop.org>; Sun, 18 Jan 2026 19:30:56 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20230601; t=1768793456; x=1769398256; darn=lists.freedesktop.org;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:from:to:cc:subject:date
 :message-id:reply-to;
 bh=BJZwBKE1B5fG1xmzuppeSdMMZvJUhNtvUP/Jy0XEbK0=;
 b=h7BYnvA+lhnU5EWs6MwH+apDgMG3ABPcU8Zhxm4KjicSYm8Gw/9KpGFljQC1768CYy
 nNt+Cv7KYZU27s06VdrCOEv+cb4WoECR+Q015Jy1igVxwSkhqGE8OEcVgvQC8JOxIqkz
 alZgywUAHzSMfQUyjpaqUZOrhnJ95dQW+cZwihMQnBsG1ZX1UvK1nn0XBjXIsewJpuZ8
 m0bf+nyU/zev5X4HuYFg0uOugfYKe8YUnsQID0ecmMAE2zVTPqXq0bOjetlr4Z9LOMrS
 w7VBBltB7FI/ILS4W6ZTeQDQIfU384tACdMpW338mPg8MPS2/YukEAPrGpXpG3pLLpk9
 sfOw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1768793456; x=1769398256;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
 :to:cc:subject:date:message-id:reply-to;
 bh=BJZwBKE1B5fG1xmzuppeSdMMZvJUhNtvUP/Jy0XEbK0=;
 b=I3KBVf22pUkn9jclJXkmwQnyy74dKLtzduEDZmformPrbvZNVX6mTD1cZxX3J5MWwU
 /2MXAYowyHp/h504rGFspVs1tz7XB+G8OMVjrv7nmvTU12ynwBWq/o7rmvRm9E2jZHBC
 RKLzz8vgmkQmZEGJk63o7ecFklSmxnRCNGxPLJbgpeGhEiRqqfENLhZ2ZWkpYhEkKh/J
 gRK8V6Y6TFQkvHfQGutdgEaj04Zx4UCktdYDc3ij+bs82MrQwOOTIv6YFMVVGQlMhIb1
 /hWm7Ys0RdcUD7DdYdxLrYJCkdFBeXULQei22BC6OMqJ/ZaC/rrTaA2pXkzg+W9wEPqX
 qmNA==
X-Forwarded-Encrypted: i=1;
 AJvYcCXjMD3vzIXcyDCLJdwI1QSBmQwu6t6KeJOnmscdcmN+mDKS1YzI1sBpL5+i1xhUFo+D0fYrtTs0zu0=@lists.freedesktop.org
X-Gm-Message-State: AOJu0Yy5zrQG4uX5uYQxigKQB74a9pTtMtYyK1H29ZU6OUiSGumeTrAV
 /KtmHzcxRKoEoSfbw+I+y/c6/Izj2jI5LwJI3dml5zPcgaL6HlEDPclL
X-Gm-Gg: AY/fxX6jibjciMs7hJ9TW3qtV83jK6VSlh/1oz5qVEqXcPagDW8yVhPRNGKw6LmFqzi
 bN5K3ROl/2buN3lm686pP8wh4QALAjLjqYO4aHZtm5+Ge5DN9/vccTr2NXi5UtAm0A3UftdL1eu
 8WJMTXonR22rwvT0I2PQX/BqAHObnvr3fLrV1u3dluKn8SB4u9OIVgYmzfVSZMk+N6+dwssdSUy
 AkMBTWhkMjMnZDuwXdmeKH4BMw0p/DovtRcrZXqQaIaaBosTDzbPBb6XNS8PntSTTEJBU9gzE5r
 QlNRdC2PUwqGJwasGnHgE3b66/yuw5QW1L4NbvfaAgk66qsbUpVwTVHEx6eylDAfDLvr3tsjiFZ
 YUw+6BuZLLEQsoqKJ80yW/0J/dxSPKYX3kFmacpQMiSkP1QKnIeUMRd9FGfC51KFe11WzgghK6F
 M0i2Mt/BZIi8M4RP5GFIt8RdTc8zX8bMaMqEB8IdmIVaHkTUricuRXvypbhiWEdEaYdZM=
X-Received: by 2002:a05:620a:1a1d:b0:8c3:9be4:b209 with SMTP id
 af79cd13be357-8c6a68d8c70mr1274200585a.20.1768793455695; 
 Sun, 18 Jan 2026 19:30:55 -0800 (PST)
Received: from mighty.localdomain (nat-130-245-192-1.resnet.stonybrook.edu.
 [130.245.192.1]) by smtp.gmail.com with ESMTPSA id
 af79cd13be357-8c6a71ab20dsm724706885a.5.2026.01.18.19.30.54
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Sun, 18 Jan 2026 19:30:55 -0800 (PST)
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
 linux-hardening@vger.kernel.org
Subject: [PATCH v4 09/10] dt-bindings: omap: Add Samsung Galaxy Tab 2 10.1
Date: Sun, 18 Jan 2026 22:30:34 -0500
Message-ID: <20260119033035.57538-11-bavishimithil@gmail.com>
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

Add samsung-espresso10 codename for the 10 inch variant

Signed-off-by: Mithil Bavishi <bavishimithil@gmail.com>
---
 Documentation/devicetree/bindings/arm/ti/omap.yaml | 1 +
 1 file changed, 1 insertion(+)

diff --git a/Documentation/devicetree/bindings/arm/ti/omap.yaml b/Documentation/devicetree/bindings/arm/ti/omap.yaml
index d8774c676..f694dcbf2 100644
--- a/Documentation/devicetree/bindings/arm/ti/omap.yaml
+++ b/Documentation/devicetree/bindings/arm/ti/omap.yaml
@@ -145,6 +145,7 @@ properties:
               - motorola,xyboard-mz609
               - motorola,xyboard-mz617
               - samsung,espresso7
+              - samsung,espresso10
               - ti,omap4-panda
               - ti,omap4-sdp
           - const: ti,omap4430
-- 
2.43.0

