Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 9EE0ED39CE8
	for <lists+dri-devel@lfdr.de>; Mon, 19 Jan 2026 04:30:52 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 0E29D10E33D;
	Mon, 19 Jan 2026 03:30:51 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=fail reason="signature verification failed" (2048-bit key; unprotected) header.d=gmail.com header.i=@gmail.com header.b="PlgNBDSF";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-qv1-f53.google.com (mail-qv1-f53.google.com
 [209.85.219.53])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 2462D10E331
 for <dri-devel@lists.freedesktop.org>; Mon, 19 Jan 2026 03:30:48 +0000 (UTC)
Received: by mail-qv1-f53.google.com with SMTP id
 6a1803df08f44-88888d80590so59941226d6.3
 for <dri-devel@lists.freedesktop.org>; Sun, 18 Jan 2026 19:30:48 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20230601; t=1768793447; x=1769398247; darn=lists.freedesktop.org;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:from:to:cc:subject:date
 :message-id:reply-to;
 bh=0Hq1Jil93LKWD5SqiddgyBykMfT43TbOI7JPjGrETyE=;
 b=PlgNBDSFc8MBp4Uwg05oJm5bgwhQ1ATqZDQ0X5SELcVGKdSrGPf//t3RevL2L/cbED
 h/TyjzdiuZf9QqmDPQ5dgew1UFGsRcBPaOJKaEAl9DbGMJYRUOhGVkOC9PxxruJJCNnx
 mKsK2MxSkoa0PcwrZIK0smC+AZJ7xqlUzuPRnZszeQE+MaiVpSyfMXge5OsTMD9RacO5
 RpgxMHLXG8o3aMwU7gZ408Ll3/EMIaUlHeoI8/ldugxuRvwEjWa6K/zNUZPdVr4CgvZD
 7Z3JoGSeUM/PNueXl0/f7BHVFuNBM4SO7SipHSP3ByZQ6UGrejPO6vzNOcMMUCchHe0/
 xHcQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1768793447; x=1769398247;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
 :to:cc:subject:date:message-id:reply-to;
 bh=0Hq1Jil93LKWD5SqiddgyBykMfT43TbOI7JPjGrETyE=;
 b=Qy1+14JRNAVP6ud5Z41hXQp0nTv6bqLGPl3GwDjiHJibMKZaYuFaLtQt6IsRxkuDFf
 V6gE3JpUfgxew2qzAGNdrkbktukxheHxSU//rrF3aIjYWC0XeQxGlSXNX/YmO2CLoZV5
 47j5KVwIYfZt0suc9x2ok7+1USt07hqcTfWQUxIm+Idn6ocTvDaUqNxPttkRqj6ZKNL7
 8NxDpwp1rJ33udxLUiY7Wtjw8nLJA+NQ9uYPxpFD9X1Ea/7yyDxuhFEzlk30WorDXmy2
 58NWL9qUZ3FohvSVytf+d982iyF3+p5kyKftekgyTCAhBgJwxiqfXE6DJEOW6XPdxxEm
 Zqiw==
X-Forwarded-Encrypted: i=1;
 AJvYcCVDxKZTceIib73n3ZnByCMfANVO785RhN3g0YIgqB8ooi07Yf1kVh9l2TH/6/W97kV45rSiYcLsy8A=@lists.freedesktop.org
X-Gm-Message-State: AOJu0YyQG5co4qpxX2eQq/7IPgVWvbnQ94Ul64rsKZ/yjb55uNHR3UgU
 Kam8t1+vcpIVn1uWeJFCM6hYKdQ7JsdNiNG3axLzSaWLpb++BB2oUQZO
X-Gm-Gg: AY/fxX7tfVuRXCzWMXBAsqhbxGqC1A2cUxE6wwWDptd3a0fsqlzeySdx9R5DJZsrFo+
 e6NKAHV+hSxfwop/V3d6Qsiyl9KjulsNSdl3cL2GWcsem0bKIAta8D0CLzQW10BclS8d19byFpn
 3g5cKfTGmrkby+WuOv0GweqA4Iwrs4udApIYJdeOqjQhuk1mzV0scIH3yl5DIHrAz2QQ0+I8h0O
 my8tWxXMN4onxB29bplgsT2bh1GkUoNpaiscSW0XUuDsDbV3dFY+McpypslRkdWrBUjLjZ6Fy9i
 L3OR4YVEMH7nuQvvOrt8QSECVIbgaVOaMDQX/PSSAeFOQumE9wuOxBDKcsfmYztTKNsXaeqG6/S
 hZmAlspVSYegq/cvqqT7ASyvwL7YwhT1EzC4/CgtQr9M+9mbR5TveGeFbElpS/bKARj7SiHo5qG
 6CG0wKFMU3a8aRsIQdOgFloCI8tA560nV+20fXtjdWoU5Y9XepKKF7bESI3HEtZfgxukc=
X-Received: by 2002:a0c:e008:0:b0:894:565c:98bf with SMTP id
 6a1803df08f44-894565c9997mr6435226d6.13.1768793446858; 
 Sun, 18 Jan 2026 19:30:46 -0800 (PST)
Received: from mighty.localdomain (nat-130-245-192-1.resnet.stonybrook.edu.
 [130.245.192.1]) by smtp.gmail.com with ESMTPSA id
 af79cd13be357-8c6a71ab20dsm724706885a.5.2026.01.18.19.30.45
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Sun, 18 Jan 2026 19:30:46 -0800 (PST)
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
Subject: [PATCH v4 03/10] dt-bindings: display: bridge: lvds-codec: add
 doestek, dtc34lm85am
Date: Sun, 18 Jan 2026 22:30:28 -0500
Message-ID: <20260119033035.57538-5-bavishimithil@gmail.com>
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

Add compatible strings for the Doestek DTC34LM85AM Flat Panel Display
Transmitter

Signed-off-by: Mithil Bavishi <bavishimithil@gmail.com>
Acked-by: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
---
 Documentation/devicetree/bindings/display/bridge/lvds-codec.yaml | 1 +
 1 file changed, 1 insertion(+)

diff --git a/Documentation/devicetree/bindings/display/bridge/lvds-codec.yaml b/Documentation/devicetree/bindings/display/bridge/lvds-codec.yaml
index 4f7d3e9cf..3ad01645c 100644
--- a/Documentation/devicetree/bindings/display/bridge/lvds-codec.yaml
+++ b/Documentation/devicetree/bindings/display/bridge/lvds-codec.yaml
@@ -33,6 +33,7 @@ properties:
     oneOf:
       - items:
           - enum:
+              - doestek,dtc34lm85am # For the Doestek DTC34LM85AM Flat Panel Display (FPD) Transmitter
               - ti,ds90c185   # For the TI DS90C185 FPD-Link Serializer
               - ti,ds90c187   # For the TI DS90C187 FPD-Link Serializer
               - ti,sn75lvds83 # For the TI SN75LVDS83 FlatLink transmitter
-- 
2.43.0

