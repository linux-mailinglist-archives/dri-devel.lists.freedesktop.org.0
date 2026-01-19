Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id B6EB6D39DA4
	for <lists+dri-devel@lfdr.de>; Mon, 19 Jan 2026 06:13:15 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 61F6110E35B;
	Mon, 19 Jan 2026 05:13:13 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=gmail.com header.i=@gmail.com header.b="HAlfmZq/";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-qv1-f41.google.com (mail-qv1-f41.google.com
 [209.85.219.41])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 41C1710E357
 for <dri-devel@lists.freedesktop.org>; Mon, 19 Jan 2026 05:13:12 +0000 (UTC)
Received: by mail-qv1-f41.google.com with SMTP id
 6a1803df08f44-8888546d570so54659096d6.2
 for <dri-devel@lists.freedesktop.org>; Sun, 18 Jan 2026 21:13:12 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20230601; t=1768799591; x=1769404391; darn=lists.freedesktop.org;
 h=content-transfer-encoding:mime-version:message-id:date:subject:cc
 :to:from:from:to:cc:subject:date:message-id:reply-to;
 bh=knOhHJnYgS3NfXJV6CmNIci8LqgQNdPXN9K0tc0/Z54=;
 b=HAlfmZq/V1zLYLgMbBWX30xJ9AwTFFkb9C72rhUsiC4KYQQ3duDPA2IuTHbOuIaVKa
 YVKA136dti1A98901NOD7HGJWNkYaYwluF1aSgV11PpCRNDNe7Ofz7PJzz8yWFyVCrVm
 DireTPPQBiVT/E7B19y8v0MohVklNuI3SOjzho7MXy7H4lY0IQrK/GBzaviM5oe4R2in
 3Zwyrb7T7Ct69cUjqSx4KnibzAZQx+ESsnL+gi6JNPWpe2YGmiqpf31nnIDtlmF09YaJ
 +fqs8WCsj2BYjmjjM0TpfUFNiY1SS36vGkY2P29tS76qksbbyIMDIT9F5pg8gnJ8cHnT
 f7Tg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1768799591; x=1769404391;
 h=content-transfer-encoding:mime-version:message-id:date:subject:cc
 :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
 :message-id:reply-to;
 bh=knOhHJnYgS3NfXJV6CmNIci8LqgQNdPXN9K0tc0/Z54=;
 b=RrZrl01yiSsu7TcFOc4fSGMDVXIMNl34F8seBwajt9Vke/tMf2A3zUPyKQ5YXSN4ui
 JRNdw1rlCxM2nbhZ26alyWbwuWPy6ve/yBEcA+wGbNM3ogf2WL0dcF8ly+YwLKW0P+FO
 n6K/PJ3kwrj/d5Ac6ez3Y1kdI0qCmWffbd5Ja22F6bJlBxXFP5qIK021HpiDR9+ENSxn
 Np2Fi2yIG5I8ZCzsijweX5r2/sfKq7kTVQzRM+U3MhL7+Z6cfuYxda2azUrSxeezJ1n1
 GK0huz4SwSNPGGYACmoI6uNemurbDzlgEsg5Hi+5dZrFz7PFOX+9qQmxcOct3NVkSZ8T
 RgeQ==
X-Forwarded-Encrypted: i=1;
 AJvYcCXKQHXp5lqbnkKcZ7350M57SnJQzQA4MESmbUAzleroTFH0F5yD3jdsl79F68PRRBsZiNdrnkz656E=@lists.freedesktop.org
X-Gm-Message-State: AOJu0YxSs2JIKkopkftoK1zZ068EYb/Q2DL21IU4osZqTP+g320w1GlD
 P1WsHAtP13p7+Lzl/voeWtbVvgf8K0E8U37hySjERZozjFe5uxUq6ie5QQ19Mg==
X-Gm-Gg: AZuq6aI7rMyJ8csN4Vzl6iWcAjUCL3ggfdzx98BbZQEOgX/u69+fimdKyE1PJwVr3sD
 OvDtHAgZs4BQEMvMJquRtooUIa2LPVTwepUdUWeIBnXUhLc9w0pCOb45OENPOyZb2Syz5EsCBR1
 NFj2ojsj8Y4fktsA+RNu9m452IdX5R0uKKp+NDiAtyAWe8l7BjLQGCp/7iF+RIcfqK48lskCvxi
 F/5yUQOZXKqKhWpA/+TYjL3k2t8dZGJjpyeOjx9w0BlE/2cbsVcbmQYN2UXVAlvbZzEyO57PpnH
 mtN7AedsslJ0XGMnjS1QTXj6Wx3usLo3oe3RBFrd4rTfnDZWCM7DzaEzB7yNITM7DDRujhJX2+R
 By23m/Rde9GFk0hea04DdroGy7/l0YU5hh8C7C2GUJJQlruTk2RKLkCCWVtXJolN/VbbEUb6rqO
 FL6wtlU2RUCGivA0QHyIJ5uAa/ju7i52f6zz0dT7Af/ANggE8sknMkxQ/ALZon15lB8zc=
X-Received: by 2002:a05:620a:178a:b0:8b1:1585:2252 with SMTP id
 af79cd13be357-8c6a68d35f7mr1336428085a.1.1768793440895; 
 Sun, 18 Jan 2026 19:30:40 -0800 (PST)
Received: from mighty.localdomain (nat-130-245-192-1.resnet.stonybrook.edu.
 [130.245.192.1]) by smtp.gmail.com with ESMTPSA id
 af79cd13be357-8c6a71ab20dsm724706885a.5.2026.01.18.19.30.39
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Sun, 18 Jan 2026 19:30:40 -0800 (PST)
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
Subject: [PATCH v4 00/10] Initial support for Samsung Galaxy Tab 2 series
Date: Sun, 18 Jan 2026 22:30:24 -0500
Message-ID: <20260119033035.57538-1-bavishimithil@gmail.com>
X-Mailer: git-send-email 2.43.0
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

From: Mithil <bavishimithil@gmail.com>

This series adds initial support for the Samsung Galaxy Tab 2
(samsung-espresso7/10) series of devices. It adds support for 6 variants
(P3100, P3110, P3113, P5100, P5110, P5113). Downstream categorised them
based on 3G and WiFi, but since they use different panel, touch
controllers, batteries, I decided to categorise them based on screen
size as espresso7 and espresso10.

It adds basic functionality for both the models including panel, drm,
sdcard, touchscreen, mmc, wifi, bluetooth, keys, battery, fuel gauge,
pmic, sensors.

Signed-off-by: Mithil Bavishi <bavishimithil@gmail.com>
---
Changes in v4
- Fixed syntax in doestek vendor
- Changed - to _ in node names
- Removed address/size-cells in chosen
- Added pinmux for i2c-gpio5,6,7, irled
- Allow sdcard to poweroff (reg_espresso_external)
- Changed power to key-power
- Order alphabetically in omap4_pmx_wkup and omap4_pmx_core
- Use generic node names
- Added TODO for future nodes
- Fix touchscreen values in espresso7 and espresso10
- Add dts to Makefile
- Commit message length under 75
- Link to v3: https://lore.kernel.org/linux-omap/20241108200440.7562-1-bavishimithil@gmail.com/
Changes in v3
- Use device tree from the correct branch
- Fix commit subjects to matching the subsystem
- Add Doestek vendor
- Add compatible for LVDS encoder
- Add compatibles for 7 and 10 inch panels
- Clean up device tree using "make CHECK_DTBS=y"
- Link to v2: https://lore.kernel.org/all/20241030211215.347710-1-bavishimithil@gmail.com/
Changes in v2
- Fix node names in common dtsi to have - instead of _
- Removed import for twl6030.dtsi
- Edited dts to completely use twl6032 nodes
- Fixed typo ldosb -> ldousb
- Link to v1: https://lore.kernel.org/all/20241030194136.297648-1-bavishimithil@gmail.com/
--

Mithil Bavishi (10):
  ARM: dts: twl6032: Add DTS file for TWL6032 PMIC
  dt-bindings: vendor-prefixes: Add Doestek
  dt-bindings: display: bridge: lvds-codec: add doestek,dtc34lm85am
  dt-bindings: display: panel-lvds: Add compatible for Samsung
    LTN070NL01 Panel
  dt-bindings: display: panel-lvds: Add compatible for Samsung
    LTN101AL03 Panel
  ARM: dts: ti: omap: espresso-common: Add common device tree for
    Samsung Galaxy Tab 2 series
  dt-bindings: omap: Add Samsung Galaxy Tab 2 7.0
  ARM: dts: ti: omap: samsung-espresso7: Add initial support for Galaxy
    Tab 2 7.0
  dt-bindings: omap: Add Samsung Galaxy Tab 2 10.1
  ARM: dts: ti: omap: samsung-espresso10: Add initial support for Galaxy
    Tab 2 10.1

 .../devicetree/bindings/arm/ti/omap.yaml      |    2 +
 .../bindings/display/bridge/lvds-codec.yaml   |    1 +
 .../bindings/display/panel/panel-lvds.yaml    |    4 +
 .../devicetree/bindings/vendor-prefixes.yaml  |    2 +
 arch/arm/boot/dts/ti/omap/Makefile            |    2 +
 .../omap/omap4-samsung-espresso-common.dtsi   |  762 ++
 .../dts/ti/omap/omap4-samsung-espresso10.dts  |  104 +
 .../dts/ti/omap/omap4-samsung-espresso7.dts   |   70 +
 arch/arm/boot/dts/ti/omap/twl6032.dtsi        |   77 +
 arch/arm/configs/espresso_defconfig           | 7506 +++++++++++++++++
 10 files changed, 8530 insertions(+)
 create mode 100644 arch/arm/boot/dts/ti/omap/omap4-samsung-espresso-common.dtsi
 create mode 100644 arch/arm/boot/dts/ti/omap/omap4-samsung-espresso10.dts
 create mode 100644 arch/arm/boot/dts/ti/omap/omap4-samsung-espresso7.dts
 create mode 100644 arch/arm/boot/dts/ti/omap/twl6032.dtsi
 create mode 100644 arch/arm/configs/espresso_defconfig

-- 
2.43.0

