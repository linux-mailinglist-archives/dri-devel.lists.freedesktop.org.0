Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id BC9DD84A173
	for <lists+dri-devel@lfdr.de>; Mon,  5 Feb 2024 18:55:45 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 9451510FAA0;
	Mon,  5 Feb 2024 17:55:41 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=linaro.org header.i=@linaro.org header.b="oiu13Da/";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-wm1-f49.google.com (mail-wm1-f49.google.com
 [209.85.128.49])
 by gabe.freedesktop.org (Postfix) with ESMTPS id B4FF710FAE0
 for <dri-devel@lists.freedesktop.org>; Mon,  5 Feb 2024 17:55:37 +0000 (UTC)
Received: by mail-wm1-f49.google.com with SMTP id
 5b1f17b1804b1-40fe07fd104so428985e9.0
 for <dri-devel@lists.freedesktop.org>; Mon, 05 Feb 2024 09:55:37 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=linaro.org; s=google; t=1707155736; x=1707760536; darn=lists.freedesktop.org;
 h=cc:to:content-transfer-encoding:mime-version:message-id:date
 :subject:from:from:to:cc:subject:date:message-id:reply-to;
 bh=auT8vI6DnSeCBFA8ktjDqYxEyVyg3kT525A6eVo2vW4=;
 b=oiu13Da/3CzyshxVBQWXrXA1wA4LUzOJvTvuS1b2Kef+mdlLhfBzyyQssW06iJnMpL
 3j+3vKHSs5U2hLNnLtrEKdT8TfeySuBrV5kSK70cprLTCFS33ojD9aNBigzlYjUxamL0
 +0iL3B6o+8jJjlXLf+0Ue25J8k/JvvHWeX4CjUt3R8jBujGdP/Vu9mWUiMs82BzJuQ7p
 lo2PAh6xUmX6nYmGsVNtYEOH26nZmJVxhB2Scv9Pj96/d6CbzagZ41KFqwaprqlG0cPv
 TKJZfpnDjczZfEXoCqCY8ngk/zv9ZEZ0fZWBeViFa9Ur0YdBlTmvqYx52omMweNqOYKp
 zH5A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1707155736; x=1707760536;
 h=cc:to:content-transfer-encoding:mime-version:message-id:date
 :subject:from:x-gm-message-state:from:to:cc:subject:date:message-id
 :reply-to;
 bh=auT8vI6DnSeCBFA8ktjDqYxEyVyg3kT525A6eVo2vW4=;
 b=Qn6u+fgm5yIjK6SMC5zTVed41vHi3EsPWc+TyhPFjBDEXNqB7amPFoSFsm+RH6vEjG
 wDaEKgg6v8eTGPQz0imfE+4KCO9tArAmtdgxRvCOuH/u2KPIBTkACnS7oPrFHcHuP5D1
 eFC6YyGEbpMaW0b8QoAJEIqqWokNI2tROOdVeNXR9QTr5p0WbKSxc3XWsDy2vKMuaGPf
 7aVV73MCnvyXqKfSlw3LqowCgN7CRm5AFe9hWeKVrhMCwZOhQzDzlX2TqEBQD78x4ohg
 xp5OeWEx2+mYwaPrVDz+de6IwzexMaZI5P753g+F09mTsLuf9IWDnX/EqsYVGE4WCMWq
 nNig==
X-Gm-Message-State: AOJu0YwZhcpXL4GIir9nQefOEo+dWlqiDFIxQn9TV/nUQo1zAvtxfYf+
 2O1TTp8yPVWVb1KQ2G4hu3W++YfY5rqRwoWX0h1/pgJUoahTAnMksyzfwSpD22s=
X-Google-Smtp-Source: AGHT+IG/6yFeRtILUi8uQzg/5dW3uIR6uzBqY3zbYnTq/zIlKiV/48WRdX6UaZseV+JWMs5c13xNaw==
X-Received: by 2002:a05:600c:470c:b0:40f:dd76:27ea with SMTP id
 v12-20020a05600c470c00b0040fdd7627eamr369894wmo.0.1707155736246; 
 Mon, 05 Feb 2024 09:55:36 -0800 (PST)
X-Forwarded-Encrypted: i=0;
 AJvYcCUtvwgDMILYYx4FYXeAOdEmwLTDL/STgV96ODmFDGMaBI9lOJDB2ZD77u3fmy5KKG13tQ0PxoKwKDDEqzYfnQiD9K3bOzHFLK9mNvk/XCVSDiKpbUk0QcZTpPG/61bUKN4nwY5OudIXBqocZw0h7TsFaaAaqokU1FIBQWS1iYH3OWUsx0azYShVUWwc0n7h2QnE7pE5PMFjuJpCKAiLQgYrw2CA/kBmE7f32F2hfrAf24e480CKOy2Ds4zRG7QewGhtdFqsjGoioI0mGeonRvl+4+nYzCBrOLXQdqJg7AaWnsfAgkECK5QOBY3MR5bbHhjFBhFwr42+bl+NdUDx2kDGqXDVfXgn2o4XNqO2wfvixP25uoo61JoAA5FqT4jc4M88rMMJzQedeluEqqMeIoISw4Uo63YH6TVGEYJWsQ35TUj2P5qr+jcVR//dG1fjqnafaAEbQe3R98/h4t4cKhNuCT9UoAMaYAvkh4op2X9NsO5FoKTygmdM4TiL3EjGKf3O07kTttjESHdI6ZKVbcszad9P4dIpveqenr0ovYzR3RmiOzduIICPz7udweSV73m9Xp5Vp7aksUUPvoZT5NjnpMAJcFw1F1DmE8dGEDZkRRNf7lLhkBq2t+phEcLQFefapYPxXeac6jlcweGO9J9jmAbOL/Rbibbh/xGylIZO1ywhcQvk2EkXCr0LsvlbjsurtJhP0jGktz7z7O6pevzxe7YdjO57cZkrvo86JNUrhA2tRKQek8iDTFeHEQz/7QnV0gwOtVzU9GDYaSAgJjTKlk4ODXi+Bh98lk2iyaTv9BViZfeSONrXX2llkNY=
Received: from arrakeen.starnux.net ([2a01:e0a:982:cbb0:52eb:f6ff:feb3:451a])
 by smtp.gmail.com with ESMTPSA id
 je16-20020a05600c1f9000b0040ee8765901sm517556wmb.43.2024.02.05.09.55.34
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Mon, 05 Feb 2024 09:55:35 -0800 (PST)
From: Neil Armstrong <neil.armstrong@linaro.org>
Subject: [PATCH v10 0/7] drm/meson: add support for MIPI DSI Display
Date: Mon, 05 Feb 2024 18:55:27 +0100
Message-Id: <20240205-amlogic-v6-4-upstream-dsi-ccf-vim3-v10-0-dc06073d5330@linaro.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
X-B4-Tracking: v=1; b=H4sIAA8hwWUC/5XQu27DMAwF0F8JNFeFROuZqf9RdJBl2hbgRyAlR
 ovA/14mQx/wYo+8w7kk76xgTljY+XRnGZdU0jzRIMXLicU+TB3y1FDAQEAltAQexmHuUuSL4Yr
 fLuWaMYy8KYnH2PIljRWvHWqQFmWrAiOoDgV5ncMUe6Km2zBQeMnYps9n9fsHzX0q1zl/PTdZ1
 CM91LkoLjhoDxE8BjDV25CmkOfXOXfs4S/6uKnJ1AZrG1Sj6aqNaY6bhsy2gRC9U1pZ2Jj213S
 i2mVaMq0BkL6Nuga3Md2PKaXwu0xHppOoAmITpN/+0/8xQe0yPZleA720kZVH889c1/Ubqe1PX
 I8CAAA=
To: Rob Herring <robh@kernel.org>, 
 Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>, 
 Conor Dooley <conor+dt@kernel.org>, Kevin Hilman <khilman@baylibre.com>, 
 Jerome Brunet <jbrunet@baylibre.com>, 
 Michael Turquette <mturquette@baylibre.com>, 
 Stephen Boyd <sboyd@kernel.org>, 
 Martin Blumenstingl <martin.blumenstingl@googlemail.com>, 
 Maarten Lankhorst <maarten.lankhorst@linux.intel.com>, 
 Maxime Ripard <mripard@kernel.org>, Thomas Zimmermann <tzimmermann@suse.de>, 
 David Airlie <airlied@gmail.com>, Daniel Vetter <daniel@ffwll.ch>, 
 Nicolas Belin <nbelin@baylibre.com>, 
 Jagan Teki <jagan@amarulasolutions.com>
Cc: devicetree@vger.kernel.org, linux-kernel@vger.kernel.org, 
 linux-amlogic@lists.infradead.org, linux-clk@vger.kernel.org, 
 linux-arm-kernel@lists.infradead.org, dri-devel@lists.freedesktop.org, 
 Neil Armstrong <neil.armstrong@linaro.org>, 
 Conor Dooley <conor.dooley@microchip.com>, 
 "Lukas F. Hartmann" <lukas@mntre.com>
X-Mailer: b4 0.12.4
X-Developer-Signature: v=1; a=openpgp-sha256; l=6209;
 i=neil.armstrong@linaro.org; h=from:subject:message-id;
 bh=cEHab/mwa03OEYPIDPQQh8jv8KsmGrpTTQWOPDBBUbA=;
 b=owEBbQKS/ZANAwAKAXfc29rIyEnRAcsmYgBlwSETcapRBc3LSWb8wFmnAX64XWjRqucf2MzRQapS
 7+em39SJAjMEAAEKAB0WIQQ9U8YmyFYF/h30LIt33NvayMhJ0QUCZcEhEwAKCRB33NvayMhJ0UouD/
 4n4W1VVrI3Vsh0NRwTu33UacscISjSrdoR2ztg7Ogt/ImBK/ymA/IxHFcVYNAdNG/cRLm5ubHCldHB
 X4QOfL61sMAKdaaIk97E7VE/sYLBQlecMY9Ld7p+x2QDWwXKLMTZ/tY5HYRg8HAr4K3z740zkKGJOw
 6u9gO39lawAeAfDuQ/xNHjBLrn5w8VLJRND+YdjbEIqz4BaMBCqxajPN8oGODtyvqlq0JB5w6ebpNN
 Sr4n05ru4aD7wgSgf8XGvkblRvKXfk9DN16LnStK2CLqf9xM6pL3e8ZxqkDtNN8Qy+RMz5kQ1qpUG9
 zu5LocUZRdGQDgSF0+EQTKbIIIFEFXciBpL7PDFO7T1JPR/duz+gF2t09pERgqICR9PO7kolRMIPov
 p/9Y21yyILw0+xPjyYQvu3bXyZwhpVfKJ8uSu/pmx+hnsSDhn5MAN4CEFFpBw1B069FnoV3dyKQJtw
 ATkAqMfMsHbiJEdpS52eg6Xv34lM4Iw1GWqWWrChjxXpaPSIS33FgXb1ewOUM3H+PB/5TyMSW/Md5s
 SWHIxaQpN2SKAhBHYq6/94yCcoaKTzAMrDbBorPQaqOHXinj1DF2Gx8IkYjV5stfzejqNnskeTI6Xe
 0lqGgJ83s4kgY2eSmZg1jRtMvGmpRa7xsyKF2ZrKXa34D2UKWba1vXzqIpqg==
X-Developer-Key: i=neil.armstrong@linaro.org; a=openpgp;
 fpr=89EC3D058446217450F22848169AB7B1A4CFF8AE
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

The Amlogic G12A, G12B & SM1 SoCs embeds a Synopsys DW-MIPI-DSI transceiver (ver 1.21a),
with a custom glue managing the IP resets, clock and data input similar to the DW-HDMI
glue on the same Amlogic SoCs.

This is a follow-up of v5  now the DRM patches are applied, the clk & DT changes
remains for a full DSI support on G12A & SM1 platforms.

The DW-MIPI-DSI transceiver + D-PHY are clocked by the GP0 PLL, and the ENCL encoder + VIU
pixel reader by the VCLK2 clock using the HDMI PLL.

The DW-MIPI-DSI transceiver gets this pixel stream as input clocked with the VCLK2 clock.

An optional "MEAS" clock can be enabled to measure the delay between each vsync feeding the
DW-MIPI-DSI transceiver.

The clock setup has been redesigned to use CCF, a common PLL (GP0) and the VCLK2 clock
path for DSI in preparation of full CCF support and possibly dual display with HDMI.

The change from v5 is that now we use a "VCLK" driver instead of notifier and rely
on CLK_SET_RATE_GATE to ensure the VCLK gate operation are called.

Signed-off-by: Neil Armstrong <neil.armstrong@linaro.org>
---
Changes in v10:
- Rename regmap_vclk to meson_clk and add _gate for the gate
- Move COMMON_CLK_MESON_VCLK to following patch
- Remove CLK_SET_RATE_PARENT from g12a_vclk2_sel, keep it only on mipi_dsi_pxclk_sel
- Add more info on commit message to specify how clock setup is designed
- Remove forgotten CLK_IGNORE_UNUSED on g12a_vclk2_input
- Remove useless CLK_SET_RATE_PARENT on g12a_vclk2_div to stop propagatting rate _after_ vclk2_div
- Remove invalid CLK_SET_RATE_GATE on g12a_vclk2 since it's not a divider...
- Drop already applied patches
- move Khadas TS050 changes as an overlay
- Link to v9: https://lore.kernel.org/r/20231124-amlogic-v6-4-upstream-dsi-ccf-vim3-v9-0-95256ed139e6@linaro.org

Changes in v9:
- Colledte reviewed-bys
- Fixed patches 2 & 4, commit messages and bindings format
- Link to v8: https://lore.kernel.org/r/20231109-amlogic-v6-4-upstream-dsi-ccf-vim3-v8-0-81e4aeeda193@linaro.org

Changes in v8:
- Switch vclk clk driver to parm as requested by Jerome
- Added bindings fixes to amlogic,meson-axg-mipi-pcie-analog & amlogic,g12a-mipi-dphy-analog
- Fixed DT errors in vim3 example and MNT Reform DT
- Rebased on next-20231107, successfully tested on VIM3L
- Link to v7: https://lore.kernel.org/r/20230803-amlogic-v6-4-upstream-dsi-ccf-vim3-v7-0-762219fc5b28@linaro.org

Changes in v7:
- Added review tags
- Fixed patch 5 thanks to George
- Link to v6: https://lore.kernel.org/r/20230512-amlogic-v6-4-upstream-dsi-ccf-vim3-v6-0-fd2ac9845472@linaro.org

Changes in v6:
- dropped applied DRM patches
- dropped clk private prefix patches
- rebased on top of 20230607-topic-amlogic-upstream-clkid-public-migration-v2-0-38172d17c27a@linaro.org
- re-ordered/cleaned ENCL patches to match clkid public migration
- Added new "vclk" driver
- uses vclk driver instead of notifier
- cleaned VCLK2 clk flags
- add px_clk gating from DSI driver
- Link to v5: https://lore.kernel.org/r/20230512-amlogic-v6-4-upstream-dsi-ccf-vim3-v5-0-56eb7a4d5b8e@linaro.org

Changes in v5:
- Aded PRIV all the G12 internal clk IDS to simplify public exposing
- Fixed the DSI bindings
- Fixed the DSI HSYNC/VSYNC polarity handling
- Fixed the DSI clock setup
- Fixed the DSI phy timings
- Dropped components for DSI, only keeping it for HDMI
- Added MNT Reform 2 CM4 DT
- Dropped already applied PHY fix
- Link to v4: https://lore.kernel.org/r/20230512-amlogic-v6-4-upstream-dsi-ccf-vim3-v4-0-2592c29ea263@linaro.org

Changes from v3 at [3]:
- switched all clk setup via CCF
- using single PLL for DSI controller & ENCL encoder
- added ENCL clocks to CCF
- make the VCLK2 clocks configuration by CCF
- fixed probe/bind of DSI controller to work with panels & bridges
- added bit_clk to controller to it can setup the BIT clock aswell
- added fix for components unbind
- added fix for analog phy setup value
- added TS050 timings fix
- dropped previous clk control patch

Changes from v2 at [2]:
- Fixed patch 3
- Added reviews from Jagan
- Rebased on v5.19-rc1

Changes from v1 at [1]:
- fixed DSI host bindings
- add reviewed-by tags for bindings
- moved magic values to defines thanks to Martin's searches
- added proper prefixes to defines
- moved phy_configure to phy_init() dw-mipi-dsi callback
- moved phy_on to a new phy_power_on() dw-mipi-dsi callback
- correctly return phy_init/configure errors to callback returns

[1] https://lore.kernel.org/r/20200907081825.1654-1-narmstrong@baylibre.com
[2] https://lore.kernel.org/r/20220120083357.1541262-1-narmstrong@baylibre.com
[3] https://lore.kernel.org/r/20220617072723.1742668-1-narmstrong@baylibre.com

---
Neil Armstrong (7):
      dt-bindings: arm: amlogic: Document the MNT Reform 2 CM4 adapter with a BPI-CM4 Module
      clk: meson: add vclk driver
      clk: meson: g12a: make VCLK2 and ENCL clock path configurable by CCF
      drm/meson: gate px_clk when setting rate
      arm64: meson: g12-common: add the MIPI DSI nodes
      arm64: meson: khadas-vim3l: add TS050 DSI panel overlay
      arm64: dts: amlogic: meson-g12b-bananapi-cm4: add support for MNT Reform2 with CM4 adaper

 Documentation/devicetree/bindings/arm/amlogic.yaml |   1 +
 arch/arm64/boot/dts/amlogic/Makefile               |   4 +
 arch/arm64/boot/dts/amlogic/meson-g12-common.dtsi  |  70 ++++
 .../meson-g12b-bananapi-cm4-mnt-reform2.dts        | 384 +++++++++++++++++++++
 .../boot/dts/amlogic/meson-khadas-vim3-ts050.dtso  | 108 ++++++
 drivers/clk/meson/Kconfig                          |   5 +
 drivers/clk/meson/Makefile                         |   1 +
 drivers/clk/meson/g12a.c                           |  72 ++--
 drivers/clk/meson/vclk.c                           | 141 ++++++++
 drivers/clk/meson/vclk.h                           |  51 +++
 drivers/gpu/drm/meson/meson_dw_mipi_dsi.c          |   7 +
 11 files changed, 824 insertions(+), 20 deletions(-)
---
base-commit: 23e11d0318521e8693459b0e4d23aec614b3b68b
change-id: 20230512-amlogic-v6-4-upstream-dsi-ccf-vim3-b8e5217e1f4a

Best regards,
-- 
Neil Armstrong <neil.armstrong@linaro.org>

