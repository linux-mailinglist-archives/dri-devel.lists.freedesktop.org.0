Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id D6E97B2C2ED
	for <lists+dri-devel@lfdr.de>; Tue, 19 Aug 2025 14:16:53 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 2F04D10E5BF;
	Tue, 19 Aug 2025 12:16:52 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=gmail.com header.i=@gmail.com header.b="D9DMToeW";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-ej1-f41.google.com (mail-ej1-f41.google.com
 [209.85.218.41])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 5E99610E5BE
 for <dri-devel@lists.freedesktop.org>; Tue, 19 Aug 2025 12:16:50 +0000 (UTC)
Received: by mail-ej1-f41.google.com with SMTP id
 a640c23a62f3a-afcb7322da8so873883466b.0
 for <dri-devel@lists.freedesktop.org>; Tue, 19 Aug 2025 05:16:50 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20230601; t=1755605809; x=1756210609; darn=lists.freedesktop.org;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:from:to:cc:subject:date
 :message-id:reply-to;
 bh=2sjH8RUp6s40CO/RK36IN6IhxncowpuFZjH0TBpbicI=;
 b=D9DMToeWs1tcaN9xiSGz5ZjxGklUyr6l5ULlKCR6BPawlhwwMMfpqKw0pxTEKT63RV
 nGqFu1kCpXn/7dNolg+OKF0jB+r/xlrm8EPDiHlAZCRMBoyZ+oqiOMN0IH1ObmWXnlqt
 +QmWUscu5JVLfZyXFamfx/oOONAA5hxYC1os8y9M/C+PBdW+Tcf1LSXckC7GBgBRb51Z
 +X8xMcu270XD2jyIOfHH5+XvSDWXH2SM9hSdemmWoDLMFY1vV0Y3c64ql2+I66ZCK8dU
 oGHjBmH8+pHVGpiwVP0MuAD6fcO0TxRN1EJ+uZdnhGIn3qWdPHZIH5Twhli+Zs5jotar
 ck6w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1755605809; x=1756210609;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=2sjH8RUp6s40CO/RK36IN6IhxncowpuFZjH0TBpbicI=;
 b=cJ7s6JSCgTeE3vAUUd7kJSsQhIDltGNZxcDnSAgvlknIPHedSUujeMxsNz+tKOaJ+b
 iuhU5IE7oBDFtr5PbJ+O9vASx41crWIr+NbcuXMI2olZ+wTgFbeekapbLAb8viIh9/vl
 HPnC9xnqWjB/7kfGY3ZhWOHkK0pxZ3lOrWirZHtjf4IDQmLHve2Uqb4nkmJQeAqk76ZN
 9zIKxbtK8aAlYab7ZiPPk2RU5OxhVBVUwDCFoSv51TUth5g2i2YuDufP+sUcOOLv9905
 GqPtpOCS/0ZQ5OCHH2w0u83ev5r8f/B41TPF0qAnhfQBAwApQ5vJMQqlTAjwbJpsOzlE
 TexA==
X-Forwarded-Encrypted: i=1;
 AJvYcCXSuahI5oinMtqgcZtEYQ88Sd/fcVpAcn+cW9wAq0kD46NFYHyRKa+spRhh8PopC6N2Pg581+wbVKM=@lists.freedesktop.org
X-Gm-Message-State: AOJu0YzNBQLlfaNQXUs8IPHTXJPHfri9LLyFAExr9w7YAyha5Fn/tIKn
 bhgDxaVF70Ebs0G5c1KrxXQBaF3qBXZ73h1SgRd8elnZcVjs8i51E7bZ
X-Gm-Gg: ASbGncvL+kdF+yxZLz6j8h1tVnh6K+zCNk76INOuEvbxllnnYQf2EC1XeVIyYD3U5Ws
 wTLS3jvf4S0/xrqKN9qvnrrhtyT8ImKy4VLXMLFaMPVYen0CE55YwPs3OVqPrabTIc1xbNA2Nu0
 da2Zfv3ZJ1nllqZhI1iQMEFVpP1VGpAN+hh+l4UrYJ/Rd+jAWQDdWiGL/lAPrGWw7BVmP623egh
 qNpNzIqPvnJGY0xURKbZ9KqKdMW5eO1Oh3oxZd0sOJ1yb6xJzTuhg2M05C5QiVYj86TiljrkBXv
 abBxqHXLX9NMnieT3J92EZREYPY9H87JPZpwcncQXk4Dbee+qx87QKAsrSwGNMn4kY7X3QFnj8T
 EhoafHjEh56XLa1TqUUbVZpsT
X-Google-Smtp-Source: AGHT+IE9FHFJp4/Ab+MrMhT2z2lpcQguRQVSFzb1lmInT7SSEmay/CM6C6jPXgOsbIUafQrfyxsCMg==
X-Received: by 2002:a17:907:d9f:b0:af9:c1f7:802 with SMTP id
 a640c23a62f3a-afddd0b539fmr236610566b.31.1755605808550; 
 Tue, 19 Aug 2025 05:16:48 -0700 (PDT)
Received: from xeon.. ([188.163.112.76]) by smtp.gmail.com with ESMTPSA id
 a640c23a62f3a-afcdce72cbbsm1012018666b.35.2025.08.19.05.16.47
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Tue, 19 Aug 2025 05:16:48 -0700 (PDT)
From: Svyatoslav Ryhel <clamor95@gmail.com>
To: Thierry Reding <thierry.reding@gmail.com>,
 Thierry Reding <treding@nvidia.com>,
 Mikko Perttunen <mperttunen@nvidia.com>,
 Jonathan Hunter <jonathanh@nvidia.com>,
 Sowjanya Komatineni <skomatineni@nvidia.com>,
 Luca Ceresoli <luca.ceresoli@bootlin.com>,
 David Airlie <airlied@gmail.com>, Simona Vetter <simona@ffwll.ch>,
 Maarten Lankhorst <maarten.lankhorst@linux.intel.com>,
 Maxime Ripard <mripard@kernel.org>,
 Thomas Zimmermann <tzimmermann@suse.de>, Rob Herring <robh@kernel.org>,
 Krzysztof Kozlowski <krzk+dt@kernel.org>,
 Conor Dooley <conor+dt@kernel.org>,
 Peter De Schrijver <pdeschrijver@nvidia.com>,
 Prashant Gaikwad <pgaikwad@nvidia.com>,
 Michael Turquette <mturquette@baylibre.com>,
 Stephen Boyd <sboyd@kernel.org>,
 Mauro Carvalho Chehab <mchehab@kernel.org>,
 Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
 Svyatoslav Ryhel <clamor95@gmail.com>, Dmitry Osipenko <digetx@gmail.com>,
 Charan Pedumuru <charan.pedumuru@gmail.com>
Cc: linux-media@vger.kernel.org, linux-tegra@vger.kernel.org,
 dri-devel@lists.freedesktop.org, devicetree@vger.kernel.org,
 linux-kernel@vger.kernel.org, linux-clk@vger.kernel.org,
 linux-staging@lists.linux.dev
Subject: [PATCH v1 04/19] dt-bindings: display: tegra: document Tegra30 VIP
Date: Tue, 19 Aug 2025 15:16:16 +0300
Message-ID: <20250819121631.84280-5-clamor95@gmail.com>
X-Mailer: git-send-email 2.48.1
In-Reply-To: <20250819121631.84280-1-clamor95@gmail.com>
References: <20250819121631.84280-1-clamor95@gmail.com>
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

Parallel VI interface found in Tegra30 is exactly the same as Tegra20 has.

Signed-off-by: Svyatoslav Ryhel <clamor95@gmail.com>
---
 .../devicetree/bindings/display/tegra/nvidia,tegra20-vip.yaml    | 1 +
 1 file changed, 1 insertion(+)

diff --git a/Documentation/devicetree/bindings/display/tegra/nvidia,tegra20-vip.yaml b/Documentation/devicetree/bindings/display/tegra/nvidia,tegra20-vip.yaml
index 14294edb8d8c..39e9b3297dbd 100644
--- a/Documentation/devicetree/bindings/display/tegra/nvidia,tegra20-vip.yaml
+++ b/Documentation/devicetree/bindings/display/tegra/nvidia,tegra20-vip.yaml
@@ -13,6 +13,7 @@ properties:
   compatible:
     enum:
       - nvidia,tegra20-vip
+      - nvidia,tegra30-vip
 
   ports:
     $ref: /schemas/graph.yaml#/properties/ports
-- 
2.48.1

