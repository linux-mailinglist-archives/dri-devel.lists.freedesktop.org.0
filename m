Return-Path: <dri-devel-bounces@lists.freedesktop.org>
Delivered-To: lists+dri-devel@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id wPtzIOLqm2km9gMAu9opvQ
	(envelope-from <dri-devel-bounces@lists.freedesktop.org>)
	for <lists+dri-devel@lfdr.de>; Mon, 23 Feb 2026 06:51:30 +0100
X-Original-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id EB931171EDA
	for <lists+dri-devel@lfdr.de>; Mon, 23 Feb 2026 06:51:29 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 21FC510E228;
	Mon, 23 Feb 2026 05:51:28 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=fail reason="signature verification failed" (2048-bit key; unprotected) header.d=gmail.com header.i=@gmail.com header.b="IzNK2kip";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-qv1-f54.google.com (mail-qv1-f54.google.com
 [209.85.219.54])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 767E910E228
 for <dri-devel@lists.freedesktop.org>; Mon, 23 Feb 2026 05:51:25 +0000 (UTC)
Received: by mail-qv1-f54.google.com with SMTP id
 6a1803df08f44-89505dd3e24so53055486d6.1
 for <dri-devel@lists.freedesktop.org>; Sun, 22 Feb 2026 21:51:25 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20230601; t=1771825884; x=1772430684; darn=lists.freedesktop.org;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:from:to:cc:subject:date
 :message-id:reply-to;
 bh=0Hq1Jil93LKWD5SqiddgyBykMfT43TbOI7JPjGrETyE=;
 b=IzNK2kiprrylwQeb0gV+a+T4/pZintv0twdyJTDiXAkdEO3IJnDZ3RHt1qyZ534fh4
 8RNrHpRde03NGzBBEWQtQXqFd14ptZ7s4eJ5rqM+/XCvUDINUgx1xr9sCg7mwcJNJv4c
 YtPs1z8TFd5ouaUVZID7CPAhr2t48NqLSztTwk9d8lPnKdcJdVDIzt5mBqAguWStj1eX
 GzV8Dp690eEIer+OpvWV5+kzbwXyrBezYCAvZgclakDt9zmB1zgzBJqDsA2wBLHGMzTs
 thqic0Pb1KfJTY6GKRtbHB9yPb+K/sU8xD44k0ux3lwtPsoYOruMQE07AF8HJaC2ayjs
 dwPQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1771825884; x=1772430684;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
 :to:cc:subject:date:message-id:reply-to;
 bh=0Hq1Jil93LKWD5SqiddgyBykMfT43TbOI7JPjGrETyE=;
 b=i73zh2Yi1VqVPU2VTTO6gz81a9LkvVjNYpmNIx+xPfrQWs9deyw/jC+rxGyY5HyFPS
 WkRBScY+na3V2d6WtzYCgxWMlD3kAbXjhw9L2X3i7sDRgzYcNF5E+Y1DRpMh71kMKy+H
 bvcZ/c3ptQ5Q/21xqEGMzrps1Fqm6j1vI4GY49HsJ827awwlOFup9hxn+deIqq9Gr9Jq
 3BxnG2qFC/dpG2K1uVJzAd3hjMYldxLLDjQFbbPn6O6NHDZRjSymyixhpYyM/OLb4OEb
 SdXZglTfYYpJUK2JGoPSBArQGwu8/otRnBWG2XCepfmQuK5X5KPX2tO4LD0mjBCEPBfG
 hk2Q==
X-Forwarded-Encrypted: i=1;
 AJvYcCW2p3bEDWINOY29WCCEkZuDIeBIS+2RHEXMuMAyIlrh3y/Ea+R3QDun3VoT8ib5d3BK6Ts3nUUrnkI=@lists.freedesktop.org
X-Gm-Message-State: AOJu0YzbUVDOG/0BWafybfuuyC6Jl2Tv6mAIFrQRkQf3JtggCM877Qoz
 rXI7Yff9J4w++IAeWUqBQhg+YQ+Kd5SfOYdX3EKP7qopLN/Af/ylgS5b
X-Gm-Gg: AZuq6aI4d24SDOwGz6ob4FtIp3mS4ZJUPV6PPIKc3j8ylDT5kM3p+QY2vuU0XHpE/dE
 Y4dV5FPMN6mKjzy1K+o7jQ3XSfcYSKcRoKfufqPuf6kCNlMJHR604EbJt8/FKoph/Q5VsIgbOC0
 gMGQBI0eG4LLcjPe/h46jwRcoELhuO5rrO7PIIUOzD6X0ZKqJ5QqM5y8bd8xpCubjXbB+P8Q5y8
 AFvel0zEnkIdGj1SXHWp29IzLYoL/C8BvQJNgXi4XJ1bfQI2ZDPW/S7vaHcH5E8ATOdtM9lLG+E
 NV34cGVZqR8uYQkx8czot/Vsdkg9leUYxPaNTx2Tv0bgAzsQA57CATFkJw9KeZqAWV8CWGHehdi
 YXk7g0PYekg8nISw6vr3tpcrwoobr/uVso/rLFG/WTwoEQbQ+5/hvadGmbeNgXYrSVnMzaEIZ5W
 jkWmIqVn1jMV0DaYcvlnJyLVzj6vX/P9GssAkCA1WXaBAQ6mmR4F8jNXCiDwe3ZTB+hA6c/DbZf
 j0C5IS+elE=
X-Received: by 2002:a05:6214:1c0b:b0:897:277:d03e with SMTP id
 6a1803df08f44-89979d74b41mr116677656d6.58.1771825884353; 
 Sun, 22 Feb 2026 21:51:24 -0800 (PST)
Received: from mighty.stonybrook.edu (nat-130-245-192-1.resnet.stonybrook.edu.
 [130.245.192.1]) by smtp.gmail.com with ESMTPSA id
 6a1803df08f44-8997e62f453sm59459096d6.36.2026.02.22.21.51.22
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Sun, 22 Feb 2026 21:51:24 -0800 (PST)
From: Mithil Bavishi <bavishimithil@gmail.com>
To: aaro.koskinen@iki.fi, airlied@gmail.com, andreas@kemnade.info,
 conor+dt@kernel.org, jernej.skrabec@gmail.com, jonas@kwiboo.se,
 khilman@baylibre.com, krzk+dt@kernel.org,
 laurent.pinchart@ideasonboard.com, maarten.lankhorst@linux.intel.com,
 mripard@kernel.org, neil.armstrong@linaro.org,
 prabhakar.mahadev-lad.rj@bp.renesas.com, jesszhan0024@gmail.com,
 rfoss@kernel.org, robh@kernel.org, rogerq@kernel.org, simona@ffwll.ch,
 thierry.reding@gmail.com, tony@atomide.com, tzimmermann@suse.de,
 andrzej.hajda@intel.com, bavishimithil@gmail.com
Cc: devicetree@vger.kernel.org, dri-devel@lists.freedesktop.org,
 linux-kernel@vger.kernel.org, linux-omap@vger.kernel.org,
 Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
Subject: [PATCH v7 3/8] dt-bindings: display: bridge: lvds-codec: add doestek,
 dtc34lm85am
Date: Mon, 23 Feb 2026 00:51:08 -0500
Message-ID: <20260223055113.1288-4-bavishimithil@gmail.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20260223055113.1288-1-bavishimithil@gmail.com>
References: <20260223055113.1288-1-bavishimithil@gmail.com>
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
X-Rspamd-Server: lfdr
X-Spamd-Result: default: False [3.49 / 15.00];
	SUSPICIOUS_RECIPS(1.50)[];
	MID_CONTAINS_FROM(1.00)[];
	R_DKIM_REJECT(1.00)[gmail.com:s=20230601];
	R_MISSING_CHARSET(0.50)[];
	MAILLIST(-0.20)[mailman];
	R_SPF_ALLOW(-0.20)[+ip4:131.252.210.177:c];
	DMARC_POLICY_SOFTFAIL(0.10)[gmail.com : SPF not aligned (relaxed),none];
	MIME_GOOD(-0.10)[text/plain];
	RWL_MAILSPIKE_GOOD(-0.10)[131.252.210.177:from];
	HAS_LIST_UNSUB(-0.01)[];
	RCVD_TLS_LAST(0.00)[];
	FREEMAIL_FROM(0.00)[gmail.com];
	RCVD_COUNT_THREE(0.00)[4];
	FORGED_RECIPIENTS(0.00)[m:aaro.koskinen@iki.fi,m:airlied@gmail.com,m:andreas@kemnade.info,m:conor+dt@kernel.org,m:jernej.skrabec@gmail.com,m:jonas@kwiboo.se,m:khilman@baylibre.com,m:krzk+dt@kernel.org,m:laurent.pinchart@ideasonboard.com,m:maarten.lankhorst@linux.intel.com,m:mripard@kernel.org,m:neil.armstrong@linaro.org,m:prabhakar.mahadev-lad.rj@bp.renesas.com,m:jesszhan0024@gmail.com,m:rfoss@kernel.org,m:robh@kernel.org,m:rogerq@kernel.org,m:simona@ffwll.ch,m:thierry.reding@gmail.com,m:tony@atomide.com,m:tzimmermann@suse.de,m:andrzej.hajda@intel.com,m:bavishimithil@gmail.com,m:devicetree@vger.kernel.org,m:linux-kernel@vger.kernel.org,m:linux-omap@vger.kernel.org,m:krzysztof.kozlowski@linaro.org,m:conor@kernel.org,m:jernejskrabec@gmail.com,m:krzk@kernel.org,m:thierryreding@gmail.com,s:lists@lfdr.de];
	FORWARDED(0.00)[dri-devel@lists.freedesktop.org];
	FREEMAIL_TO(0.00)[iki.fi,gmail.com,kemnade.info,kernel.org,kwiboo.se,baylibre.com,ideasonboard.com,linux.intel.com,linaro.org,bp.renesas.com,ffwll.ch,atomide.com,suse.de,intel.com];
	MIME_TRACE(0.00)[0:+];
	ARC_NA(0.00)[];
	RCPT_COUNT_TWELVE(0.00)[28];
	FORGED_SENDER(0.00)[bavishimithil@gmail.com,dri-devel-bounces@lists.freedesktop.org];
	DKIM_TRACE(0.00)[gmail.com:-];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	FORGED_SENDER_FORWARDING(0.00)[];
	FORGED_SENDER_MAILLIST(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[bavishimithil@gmail.com,dri-devel-bounces@lists.freedesktop.org];
	FROM_HAS_DN(0.00)[];
	TO_DN_SOME(0.00)[];
	PREVIOUSLY_DELIVERED(0.00)[dri-devel@lists.freedesktop.org];
	FORGED_RECIPIENTS_FORWARDING(0.00)[];
	ASN(0.00)[asn:6366, ipnet:131.252.0.0/16, country:US];
	NEURAL_HAM(-0.00)[-0.990];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	TAGGED_RCPT(0.00)[dri-devel,dt];
	DBL_BLOCKED_OPENRESOLVER(0.00)[gabe.freedesktop.org:helo,gabe.freedesktop.org:rdns,linaro.org:email]
X-Rspamd-Queue-Id: EB931171EDA
X-Rspamd-Action: no action

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

