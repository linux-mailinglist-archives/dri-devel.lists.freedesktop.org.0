Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 9AE989580BA
	for <lists+dri-devel@lfdr.de>; Tue, 20 Aug 2024 10:19:22 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id D90B410E4FD;
	Tue, 20 Aug 2024 08:19:19 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (1024-bit key; unprotected) header.d=chromium.org header.i=@chromium.org header.b="a0DJINeX";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-pf1-f175.google.com (mail-pf1-f175.google.com
 [209.85.210.175])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 6039510E4E6
 for <dri-devel@lists.freedesktop.org>; Tue, 20 Aug 2024 08:07:15 +0000 (UTC)
Received: by mail-pf1-f175.google.com with SMTP id
 d2e1a72fcca58-713eeb4e4bcso1664585b3a.0
 for <dri-devel@lists.freedesktop.org>; Tue, 20 Aug 2024 01:07:15 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=chromium.org; s=google; t=1724141235; x=1724746035;
 darn=lists.freedesktop.org; 
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:from:to:cc:subject:date
 :message-id:reply-to;
 bh=KkKGSAKuHmkOcXhq4rTBRZZbsedAQGMKKV0Dw3RFXH8=;
 b=a0DJINeXPviO/uAHVSZFZcuZlh72/1AFrUjNs5K/u4bIdWBJhA/AhVDyW6M6BieSmM
 ar9/OvOYbyQ8evFtpi41IpxrWQVwu9Tktgshfu9fX+6ijPPoBYcsF6CVVJ1LalBsDKjI
 Cvax4q0Z1bTOhcxIks9X99RCQ6DRnqNGKN5TA=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1724141235; x=1724746035;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=KkKGSAKuHmkOcXhq4rTBRZZbsedAQGMKKV0Dw3RFXH8=;
 b=Xfjy+ZTFEaSudSKvY9BPlYzQyMya2PxkW85EXg4S+nUz+MBkSn+5pxD01xovmPPpOV
 Ar0EG9PLBKP6WEmWcTL1s9qWuHEUAQFbNJi3kAbaHkLobHrplJEmsNksICbgDF6GHnlP
 Q1ukabC43ukcyM0GOnrnqlWEHenG8D0CP6og5sUzQB3aytEorVj9KrZRv0/T2R6w2oVZ
 y5JNjkXXf3CG03QtnLICTPwUl49XT1y/1E2SEAwNjHY15PUxshi5kij4XI9UpTeIM2r2
 rS6wl82QGhaHuyQ/h5YrSMagh18xcRAX5EzfbKSLxcnY4fOTxrfjO1laGQFT4lPpvCjH
 iT5w==
X-Gm-Message-State: AOJu0Yy8PCQJOobwEWOxbFdCpe/n56pE2fpgmiRNspr57nBTJKO/6aXs
 3az3hbs+nCwoS/MrerAaozhi0pe33iL6lOikY6bBPJf+2sCEAjmuObz6Y+NzRw==
X-Google-Smtp-Source: AGHT+IHwKaoQ6zqgeUDaUr0M0mia8HrEnOi0MHVVZtaxLErdruMh0fQ5zoE5wSNwv2WofQFKlv2X/w==
X-Received: by 2002:a05:6a00:2e1c:b0:710:5a64:30d5 with SMTP id
 d2e1a72fcca58-713c4da0349mr17959374b3a.6.1724141234688; 
 Tue, 20 Aug 2024 01:07:14 -0700 (PDT)
Received: from localhost (185.174.143.34.bc.googleusercontent.com.
 [34.143.174.185]) by smtp.gmail.com with UTF8SMTPSA id
 41be03b00d2f7-7c6b61c7202sm8829978a12.31.2024.08.20.01.07.10
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Tue, 20 Aug 2024 01:07:14 -0700 (PDT)
From: Rohit Agarwal <rohiagar@chromium.org>
To: chunkuang.hu@kernel.org, p.zabel@pengutronix.de, airlied@gmail.com,
 daniel@ffwll.ch, maarten.lankhorst@linux.intel.com, mripard@kernel.org,
 tzimmermann@suse.de, robh@kernel.org, krzk+dt@kernel.org,
 conor+dt@kernel.org, matthias.bgg@gmail.com,
 angelogioacchino.delregno@collabora.com, ck.hu@mediatek.com,
 jitao.shi@mediatek.com
Cc: dri-devel@lists.freedesktop.org, linux-mediatek@lists.infradead.org,
 devicetree@vger.kernel.org, linux-kernel@vger.kernel.org,
 linux-arm-kernel@lists.infradead.org, Rohit Agarwal <rohiagar@chromium.org>
Subject: [PATCH 1/3] dt-bindings: display: mediatek: dpi: Add power domains
Date: Tue, 20 Aug 2024 08:06:57 +0000
Message-ID: <20240820080659.2136906-2-rohiagar@chromium.org>
X-Mailer: git-send-email 2.46.0.295.g3b9ea8a38a-goog
In-Reply-To: <20240820080659.2136906-1-rohiagar@chromium.org>
References: <20240820080659.2136906-1-rohiagar@chromium.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Mailman-Approved-At: Tue, 20 Aug 2024 08:19:19 +0000
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

Add power domain binding to the mediatek DPI controller.

Signed-off-by: Rohit Agarwal <rohiagar@chromium.org>
---
 .../devicetree/bindings/display/mediatek/mediatek,dpi.yaml     | 3 +++
 1 file changed, 3 insertions(+)

diff --git a/Documentation/devicetree/bindings/display/mediatek/mediatek,dpi.yaml b/Documentation/devicetree/bindings/display/mediatek/mediatek,dpi.yaml
index 5ca7679d5427..10b8572dd922 100644
--- a/Documentation/devicetree/bindings/display/mediatek/mediatek,dpi.yaml
+++ b/Documentation/devicetree/bindings/display/mediatek/mediatek,dpi.yaml
@@ -62,6 +62,9 @@ properties:
       - const: default
       - const: sleep
 
+  power-domains:
+    maxItems: 1
+
   port:
     $ref: /schemas/graph.yaml#/properties/port
     description:
-- 
2.46.0.295.g3b9ea8a38a-goog

