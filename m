Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 1A308D39CED
	for <lists+dri-devel@lfdr.de>; Mon, 19 Jan 2026 04:31:00 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id A2F8310E33B;
	Mon, 19 Jan 2026 03:30:57 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=gmail.com header.i=@gmail.com header.b="NZrKeG7Y";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-qk1-f177.google.com (mail-qk1-f177.google.com
 [209.85.222.177])
 by gabe.freedesktop.org (Postfix) with ESMTPS id B000010E33B
 for <dri-devel@lists.freedesktop.org>; Mon, 19 Jan 2026 03:30:50 +0000 (UTC)
Received: by mail-qk1-f177.google.com with SMTP id
 af79cd13be357-8c6a822068eso346198585a.3
 for <dri-devel@lists.freedesktop.org>; Sun, 18 Jan 2026 19:30:50 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20230601; t=1768793450; x=1769398250; darn=lists.freedesktop.org;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:from:to:cc:subject:date
 :message-id:reply-to;
 bh=/NkSp3Qp2ev5DvLNgpn6PFK/BAYbn/itTgc2RCCe8u8=;
 b=NZrKeG7YAmQX/w5Lji3gwF3Aj2cmBej4zuNHNRer4EJ8tFvToqvFhiRUOtWyNkiMHT
 Ie/scNvXaRP2pfA2PDiLRNf5U89hB/EfgG1vCD3ze+tZpc8JxJJSbMZwsABlScb6TsKQ
 WisawYs4+kVytYpklP9bVS2grytCDpcy2hLdyU0DocWvROD4ONTfR4XrvYYgq6ens7Dy
 7dWEfpPYw7AgL5wPg/IyAteAxMR4MwYNSfJhYLkRISysMmIIEFPng5CK4bGrOnLqcTjo
 dQSk4LKXxr8goWJGA1qdfAzaQ5Adc/GaHuUQUJzCvyn4Z+586uF0KYZ9UtyaX4OehDlT
 oo2g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1768793450; x=1769398250;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
 :to:cc:subject:date:message-id:reply-to;
 bh=/NkSp3Qp2ev5DvLNgpn6PFK/BAYbn/itTgc2RCCe8u8=;
 b=wbSv+mtQwCdB/vetSQ3jSyMLWMU6SZHU6Q4KEkQbRaX/eOQ4Y9dn2d+dpAF+xNTvIb
 7G7P+/S1bJ2VfnjgVMaonXkXXaiHJfa8w9FTAnhH3wSpprkeOB0FiANH4wXt7n7wK3ou
 6sZcHANVqtXNaaR8ZELtNG45OZx70kj1faoFS+JCYngRCL3k9DbWbhPMnNOGhdwyOrnb
 o7IzPStRoefyRwkb1d3/lbYbqAc6TMkbSJlVxRnQ5GcqFHpLBHtTZMOOVjHc/lxFeWUr
 LZPj40Wv6E1rLeJf74ZU+DUcFCyfFCbq7gcjTLij3Ob78VE3CBPiIqqjpYI2a0SSmfhC
 yNYQ==
X-Forwarded-Encrypted: i=1;
 AJvYcCVP1KAOXctYG/+Hdsof9lHZ2LYU+VdJ/38m5W+EDJvdvPrHtKdDzrVZpMay36CpdLA614xxgJckYdU=@lists.freedesktop.org
X-Gm-Message-State: AOJu0YzQ4oAn/yBsdUhoep2V0Jj4Xp2meZcaxrbLHGKAa9J8gBlHAooK
 oHudyQaVo2knqEIt0bnnFwNfaln9XxqC4wqfhx4WJq+RCfnmUPFcfuHY
X-Gm-Gg: AY/fxX4zwZgaWw7hxB7lDcbHwbXAkemEW8lIeje3GGk37c70eUgPNSE5M7bw4bMeQPy
 d2kHB1qilAROhNKS1iMrOhCPo0KrS0AzXlHR4os6Y3Wpaj9XEcCf5SwEBARW3U1a8BPKbl7w2XF
 H+3gFHgZ1clzPHP+4cUxeIi+W9qnRnKMn2QU4ew7Ae5sTyAQMSoK1B5wpRuDuTsm3dv4/uL1Ej0
 f733n15A0dxY+p4ld4EF0V4O1sZ1OKooRQoa3PbNpsrzflaHm+3XisQ/NA/LOiRsAF5ecwXotvq
 hnVJe+Iaf5EhsrxGMsiNKO8JYZ0I0wbbBKVkQS/w9HD5JYliCXlR6It1hWdqFranullTsgAmrFg
 gTRdj35NJcxJbH5kCv7NSC2TxbDoWD5D4y3VPLGfJeB+yTMKC7Uk7HMcjzsgmvGU4pjRegMw7oY
 ei6Ee3kmadi78eVPnDkh+w8U+R9hKtiG0YofNVHxvbNSYhxdkRX2je1z4CvLKM8u7hhvI=
X-Received: by 2002:a05:620a:4729:b0:8b2:e8b5:1ea3 with SMTP id
 af79cd13be357-8c6a68ec4edmr1367928485a.28.1768793449722; 
 Sun, 18 Jan 2026 19:30:49 -0800 (PST)
Received: from mighty.localdomain (nat-130-245-192-1.resnet.stonybrook.edu.
 [130.245.192.1]) by smtp.gmail.com with ESMTPSA id
 af79cd13be357-8c6a71ab20dsm724706885a.5.2026.01.18.19.30.48
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Sun, 18 Jan 2026 19:30:49 -0800 (PST)
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
Subject: [PATCH v4 05/10] dt-bindings: display: panel-lvds: Add compatible for
 Samsung LTN101AL03 Panel
Date: Sun, 18 Jan 2026 22:30:30 -0500
Message-ID: <20260119033035.57538-7-bavishimithil@gmail.com>
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

The LTN101AL03 is a 10.1 inch 800x1280, 24 bit, VESA Compatible, TFT
display panel

Signed-off-by: Mithil Bavishi <bavishimithil@gmail.com>
---
 Documentation/devicetree/bindings/display/panel/panel-lvds.yaml | 2 ++
 1 file changed, 2 insertions(+)

diff --git a/Documentation/devicetree/bindings/display/panel/panel-lvds.yaml b/Documentation/devicetree/bindings/display/panel/panel-lvds.yaml
index 68c16c1ae..b31c67bab 100644
--- a/Documentation/devicetree/bindings/display/panel/panel-lvds.yaml
+++ b/Documentation/devicetree/bindings/display/panel/panel-lvds.yaml
@@ -60,6 +60,8 @@ properties:
           - jenson,bl-jt60050-01a
           # Samsung LTN070NL01 7.0" WSVGA (1024x600) TFT LCD LVDS panel
           - samsung,ltn070nl01
+          # Samsung LTN101AL03 10.1" WXGA (800x1280) TFT LCD LVDS panel
+          - samsung,ltn101al03
           - tbs,a711-panel
           # Winstar WF70A8SYJHLNGA 7" WSVGA (1024x600) color TFT LCD LVDS panel
           - winstar,wf70a8syjhlnga
-- 
2.43.0

