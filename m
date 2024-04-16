Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id D73B98A7042
	for <lists+dri-devel@lfdr.de>; Tue, 16 Apr 2024 17:53:32 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id F12F210F193;
	Tue, 16 Apr 2024 15:53:27 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=baylibre-com.20230601.gappssmtp.com header.i=@baylibre-com.20230601.gappssmtp.com header.b="loUL7hrC";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-ej1-f45.google.com (mail-ej1-f45.google.com
 [209.85.218.45])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 8B81410F185
 for <dri-devel@lists.freedesktop.org>; Tue, 16 Apr 2024 15:53:22 +0000 (UTC)
Received: by mail-ej1-f45.google.com with SMTP id
 a640c23a62f3a-a524ecaf215so402160666b.2
 for <dri-devel@lists.freedesktop.org>; Tue, 16 Apr 2024 08:53:22 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=baylibre-com.20230601.gappssmtp.com; s=20230601; t=1713282801; x=1713887601;
 darn=lists.freedesktop.org; 
 h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
 :mime-version:subject:date:from:from:to:cc:subject:date:message-id
 :reply-to; bh=rY9nQ8l4JTZHkXj0RAXQ+RxUAnmtTi/8jZw7waEm2L0=;
 b=loUL7hrC2kBp8RBcij7ETMfwZELzG382Pp8XbQGsGE9Orqx/zd4w7p7o/og8DeXbN1
 6uyztkKqVqeZlNKwQguKJbJoXbC0uFzFEuxsOMpSvLqbli0s0K06gpLw4fhUHyU4DeYz
 IDA/GPZ+6z3Po9zA1Spgb7hjNmXF0g2dXTPo33+YRtvyfeAYtJ3Rujngvgfp43WDe0Bx
 ajnAbCOxpbaHdU7C6FvzphFd1zINvwABSVHO6Pzm+0JVa7MuGpPkqN5MKHNwmmDz/NzI
 suWsjPE8bOJ/X+6TEihQ0mFb9pzONxVQ2+kXMIBbCPKM4KcRopkct8xuPuwuogUxXak3
 +utA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1713282801; x=1713887601;
 h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
 :mime-version:subject:date:from:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=rY9nQ8l4JTZHkXj0RAXQ+RxUAnmtTi/8jZw7waEm2L0=;
 b=j1O65O/bW9UJ1NVea4RYew9+lN1Ix1F97xxySQ2ECSEgYWQ4EqlzC6ysTBkapRB2FE
 KAzVRw/AS8zEPI9RQneFnemykNkKCrWEiRtR4xPTQjJrfceOYl/7dCoiV/U1mGwHspjW
 rZjkHjfQ/vhwRdJD+CrOYQEN4jYEjYd4ssZhgGGRoYZ0XYuKUYF+up51+bvoF+u1FNHl
 PAr0veMoV9spMoO7B6La6HfDSXqJnY7SQPlRWyDW9yC6I1CIGdr1BvD0WwsvpTTh9Nc1
 DUZqVO6Nsvr8gQFD69RJzesDgEVH1PPANOKc3XhKwrOKPYg8ZoagBBxe6VpZ/3nt+x3M
 vmZg==
X-Gm-Message-State: AOJu0YxZc7wYVbCes4xRVwLfRDl4SJyU1iiOZ9ObOOq8G/ZEXPK6/mjk
 siRebfSt4lJ6ue6ebSyPGQXKZ5KgggTUfuzHxeFpzUYIXRnik3Vv6GsNMWf7Mn8=
X-Google-Smtp-Source: AGHT+IFHhEszesK9q09DsR/2xkoSYe02wtLO0cXjArvzx9HgMzPqi6DEF0MkcuxXMCf+zXa2GmXu3A==
X-Received: by 2002:a17:906:d28f:b0:a55:33a9:7f10 with SMTP id
 ay15-20020a170906d28f00b00a5533a97f10mr2555951ejb.32.1713282800855; 
 Tue, 16 Apr 2024 08:53:20 -0700 (PDT)
Received: from [127.0.1.1] ([93.5.22.158])
 by smtp.googlemail.com with ESMTPSA id
 d12-20020a170906174c00b00a52567ca1b6sm4156691eje.94.2024.04.16.08.53.19
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Tue, 16 Apr 2024 08:53:20 -0700 (PDT)
From: Alexandre Mergnat <amergnat@baylibre.com>
Date: Tue, 16 Apr 2024 17:53:03 +0200
Subject: [PATCH v2 02/18] dt-bindings: display: mediatek: ccorr: add
 compatible for MT8365 SoC
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20231023-display-support-v2-2-33ce8864b227@baylibre.com>
References: <20231023-display-support-v2-0-33ce8864b227@baylibre.com>
In-Reply-To: <20231023-display-support-v2-0-33ce8864b227@baylibre.com>
To: Chun-Kuang Hu <chunkuang.hu@kernel.org>, 
 Philipp Zabel <p.zabel@pengutronix.de>, David Airlie <airlied@gmail.com>, 
 Daniel Vetter <daniel@ffwll.ch>, 
 Maarten Lankhorst <maarten.lankhorst@linux.intel.com>, 
 Maxime Ripard <mripard@kernel.org>, Thomas Zimmermann <tzimmermann@suse.de>, 
 Rob Herring <robh@kernel.org>, 
 Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>, 
 Conor Dooley <conor+dt@kernel.org>, 
 Matthias Brugger <matthias.bgg@gmail.com>, 
 AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>, 
 Jitao Shi <jitao.shi@mediatek.com>, CK Hu <ck.hu@mediatek.com>, 
 =?utf-8?q?Uwe_Kleine-K=C3=B6nig?= <u.kleine-koenig@pengutronix.de>, 
 Michael Turquette <mturquette@baylibre.com>, 
 Stephen Boyd <sboyd@kernel.org>, Catalin Marinas <catalin.marinas@arm.com>, 
 Will Deacon <will@kernel.org>
Cc: dri-devel@lists.freedesktop.org, linux-mediatek@lists.infradead.org, 
 devicetree@vger.kernel.org, linux-kernel@vger.kernel.org, 
 linux-arm-kernel@lists.infradead.org, linux-pwm@vger.kernel.org, 
 linux-clk@vger.kernel.org, Alexandre Mergnat <amergnat@baylibre.com>
X-Mailer: b4 0.12.2
X-Developer-Signature: v=1; a=openpgp-sha256; l=972; i=amergnat@baylibre.com; 
 h=from:subject:message-id;
 bh=IeDOCl06JfjlPFghfO35UROWR8m1btVVgKsMaQNA6d0=; 
 b=owEBbQKS/ZANAwAKAStGSZ1+MdRFAcsmYgBmHp7q+HnTXMENk4xikmBtAqBzPzqGGoQTN87rhFQk
 sL5tZI2JAjMEAAEKAB0WIQQjG17X8+qqcA5g/osrRkmdfjHURQUCZh6e6gAKCRArRkmdfjHURYtPD/
 9Qm+/9xOYNXV0ZxQe+5NoZUD6q0aKZfjTzUxCwH02q5XEjsHWdaLH6zWsDsPkVwMuCKzKcizClDjvx
 NynHcFjOS+89EVdprokd+qZoM14inG7kJ4axYW7ozOAcB6gbOAwBtOmpUsR5/XK9c+iw2vNy4AxL8U
 B4BVG6AfwKhlx0RNzBLgomixGSAddHxIpr5jf0YnvB2LX5z6sBO8FK5P2G3nIbNTu9Q/3q8A6/IrMi
 7md5PGdAKiTK6v2Sl6kdlhKJMUtkNtlPdvvebkfNGOrCSdfnQjhoGG4E+vlHIKBlYIfmLNtQh1tjp2
 xEPAETS0seMkLxfQNT+D574GNpaY3HaHZ9fKa9W+fqad0nBI02IcRjyssJZeDbcz4xAYiw4t1OCIN2
 jyfO79XA6cgbDmS6x+uh/RE3RYZyMNu5O/OILPXtsUVGOvwFqHJnXgCK0Zeh2qHi8jo5GlK/lW8+RH
 0rPz/NkrQRr8Mgs+5xTxN+8cqwvtXvnZh9d8qf3vkjlqcWH5i1lm60sQFjxUcJv8k5ohXBz5hOB2Eg
 zlo5360N1S08YLYo8RpTi3k4bA33I0BRki4k3XzyxiuvjGKtlngWsAMta4R5sSKjbtJWUNAXTxWF3m
 /FiP6xYGFesR7PHXVNjoui9oFDOnQ583ecoKMc1WodBAyB0gxsnDLH7VS5aw==
X-Developer-Key: i=amergnat@baylibre.com; a=openpgp;
 fpr=231B5ED7F3EAAA700E60FE8B2B46499D7E31D445
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

Document the display Color Correction on MT8365, which is compatible
with that of the MT8183.

Signed-off-by: Alexandre Mergnat <amergnat@baylibre.com>
---
 Documentation/devicetree/bindings/display/mediatek/mediatek,ccorr.yaml | 3 +++
 1 file changed, 3 insertions(+)

diff --git a/Documentation/devicetree/bindings/display/mediatek/mediatek,ccorr.yaml b/Documentation/devicetree/bindings/display/mediatek/mediatek,ccorr.yaml
index 8c2a737237f2..9f8366763831 100644
--- a/Documentation/devicetree/bindings/display/mediatek/mediatek,ccorr.yaml
+++ b/Documentation/devicetree/bindings/display/mediatek/mediatek,ccorr.yaml
@@ -24,6 +24,9 @@ properties:
       - enum:
           - mediatek,mt8183-disp-ccorr
           - mediatek,mt8192-disp-ccorr
+      - items:
+          - const: mediatek,mt8365-disp-ccorr
+          - const: mediatek,mt8183-disp-ccorr
       - items:
           - enum:
               - mediatek,mt8186-disp-ccorr

-- 
2.25.1

