Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 3F110CAA6F8
	for <lists+dri-devel@lfdr.de>; Sat, 06 Dec 2025 14:34:57 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 90EE210E2E3;
	Sat,  6 Dec 2025 13:34:47 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=kernel.org header.i=@kernel.org header.b="nB/wyBp7";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from tor.source.kernel.org (tor.source.kernel.org [172.105.4.254])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 693CB8985A
 for <dri-devel@lists.freedesktop.org>; Sat,  6 Dec 2025 13:34:44 +0000 (UTC)
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
 by tor.source.kernel.org (Postfix) with ESMTP id 44F2B60121;
 Sat,  6 Dec 2025 13:34:43 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPS id DCF21C4CEF5;
 Sat,  6 Dec 2025 13:34:42 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=k20201202; t=1765028083;
 bh=Fc1/10leeyqV93aaN1mZqOChw1gXUFjdExoULM0DJ3U=;
 h=From:Subject:Date:To:Cc:Reply-To:From;
 b=nB/wyBp7ziC09vCLJOLvrIQE8c8IMltyfFVInbnrHw+81n80OBHSrMMabiqR/Rrso
 GxIGJSJPlPlpzZQIcxqz0vDfsB4213cbUnaKpr7o2znNlmgqeuoK2CBkY8kksxKY+P
 PSnWdXYL83DDW6XC8CwMNQcK7YZ9tmLY+e/VBbyVCg+f4pC9hA0M4bSlKvgzdt+48y
 pQ5uyKpRtYzkrxzvStkPlJtND5Yy5vfrdCnYbEsUDeCOYkgmM4xhZP7dJNe2HLNkrX
 i3hEGZc4tTxiu1Jc4wL3OH0X5FoP8Fu0SkwGfOZzvA5A6SfotU3xvvuRnGhNsO2m/5
 CS0HZ2rHi5meA==
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org
 (localhost.localdomain [127.0.0.1])
 by smtp.lore.kernel.org (Postfix) with ESMTP id C5D45D339BC;
 Sat,  6 Dec 2025 13:34:42 +0000 (UTC)
From: David Heidelberg via B4 Relay <devnull+david.ixit.cz@kernel.org>
Subject: [PATCH v5 0/8] Add support for Pixel 3 and Pixel 3 XL
Date: Sat, 06 Dec 2025 14:34:17 +0100
Message-Id: <20251206-pixel-3-v5-0-dc99732e7d35@ixit.cz>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
X-B4-Tracking: v=1; b=H4sIANowNGkC/1XQyw6CMBAF0F8xXVsz0wcUV/6HcdHHoE2MYkHiI
 /y7RY3g8rZzbjp9spZSpJatF0+WqI9tPJ9y0MsF8wd72hOPIWcmQGhQWPEm3ujIJdeIFLywqoC
 S5ekmUZ2vxqbtLudDbLtzur+LexxP3x0IoH8dPXLg1hlndF2glPUm3mK38g82NvRipiRMSmRlv
 A3BEZTCV/9KTgrRTEpmJbG0wimAYOy/UjMlZi9Uo3IlFLUJ3lfFpIbP0oku1/xr3XfzYXgB2QR
 IM1MBAAA=
X-Change-ID: 20250419-pixel-3-511edc2a4607
To: Bjorn Andersson <andersson@kernel.org>, 
 Konrad Dybcio <konradybcio@kernel.org>, Rob Herring <robh@kernel.org>, 
 Krzysztof Kozlowski <krzk+dt@kernel.org>, 
 Conor Dooley <conor+dt@kernel.org>, Sumit Semwal <sumit.semwal@linaro.org>, 
 Casey Connolly <casey.connolly@linaro.org>, 
 Neil Armstrong <neil.armstrong@linaro.org>, 
 Jessica Zhang <jesszhan0024@gmail.com>, 
 Maarten Lankhorst <maarten.lankhorst@linux.intel.com>, 
 Maxime Ripard <mripard@kernel.org>, Thomas Zimmermann <tzimmermann@suse.de>, 
 David Airlie <airlied@gmail.com>, Simona Vetter <simona@ffwll.ch>, 
 Marijn Suijten <marijn.suijten@somainline.org>, 
 Dmitry Baryshkov <lumag@kernel.org>, Vinod Koul <vkoul@kernel.org>, 
 Petr Hodina <phodina@protonmail.com>, 
 Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
Cc: linux-arm-msm@vger.kernel.org, devicetree@vger.kernel.org, 
 linux-kernel@vger.kernel.org, phone-devel@vger.kernel.org, 
 dri-devel@lists.freedesktop.org, David Heidelberg <david@ixit.cz>, 
 Krzysztof Kozlowski <krzk@kernel.org>, 
 Krzysztof Kozlowski <krzysztof.kozlowski@oss.qualcomm.com>, 
 Amit Pundir <amit.pundir@linaro.org>, Casey Connolly <casey@connolly.tech>, 
 Joel Selvaraj <foss@joelselvaraj.com>, 
 Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>, 
 Bjorn Andersson <andersson@kernel.org>
X-Mailer: b4 0.14.3
X-Developer-Signature: v=1; a=openpgp-sha256; l=4392; i=david@ixit.cz;
 h=from:subject:message-id;
 bh=Fc1/10leeyqV93aaN1mZqOChw1gXUFjdExoULM0DJ3U=;
 b=owEBbQKS/ZANAwAIAWACP8TTSSByAcsmYgBpNDDwRYraqDgOJTfZuaT8KZzTsF0MLuLnkdiC5
 U3DuLSOJDSJAjMEAAEIAB0WIQTXegnP7twrvVOnBHRgAj/E00kgcgUCaTQw8AAKCRBgAj/E00kg
 ct7mD/4yuOrJl/nJImQMU0Wd5b6FL6Tn1noeUazvMSj2XgXDhu5/3gNdVcgDYNGo4fYia80o/J8
 jKbzlVlol7LPbxAohl+plbt1lH/Y8YMbEloW28VC/siV9Ji8RBMOHasofBbAn6zm9pi1vPR6vZP
 aqWGyd027vd4brE3h+zo7qFicM5TCe+LyeOVEeFXsgNBWTQA3FTUcFUsm2CjSTZzeMrlFz95Xp7
 ELpmW6LgXCDidAU27VpW+orJEa1iAlvPwxXHGFj/tirhI/9bVoyUosASWcs4MjuoVW7IpoLOS2V
 UZLC6ZAiMgRdvbOMv/TJhU6CPvUNK2ZGatr/ZJw0JrQd99C8I5tK+1IVttP9VXxzhhMN9sc4D+q
 mZe+/wIkOZHu7fX1WeLSYhix+qEB4Ljm7TlNPFwkzthm2DGBOpGtJCwtRnouNc3AJVk5yw0hVdq
 gzj/j1zD58/XgoWpi43Bu2f3RkiXlxJLrJfPyXe13upYtek0K9JoS+/derm7XxeurTIASXlMHw5
 13tn+3OH5+NGdJO8LFU7LBkimsWrWR3dAD9pT3aswUuXb9pCXqPA1DMmURri0x49eg5bXOCXtdt
 HwHFFKFIVuMof3xDSoxXF1L80mmACeN/IOdNsPzKo6ud3xrdR+5ZUQxhBqxB2kqFzwbHAOeLsiP
 /IMbYU2QEmPnLuQ==
X-Developer-Key: i=david@ixit.cz; a=openpgp;
 fpr=D77A09CFEEDC2BBD53A7047460023FC4D3492072
X-Endpoint-Received: by B4 Relay for david@ixit.cz/default with auth_id=355
X-Original-From: David Heidelberg <david@ixit.cz>
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
Reply-To: david@ixit.cz
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

This adds initial device tree support for the following phones:

 - Google Pixel 3 (blueline)
 - Google Pixel 3 XL (crosshatch)

Both phone boards use the same identifiers and differ only slightly
in their connected peripherals.

This is mainly focused to get the base functionality of the board and
being able to use the upstream DTS within Linux and u-boot.

Booting
-------
For older Pixel 3 bootloaders, bootloader-compatible board and MSM IDs are
required for the kernel to boot, so these have been added.

For recent Pixel 3 bootloaders,
a) you want chainloaded proper bootloader (f.e. u-boot),
b) you can also boot kernel when adding back TEXT_OFFSET
   (partial revert of 120dc60d).

This series is a beggining of cleaning up and transitioning support from
sdm845 close to mainline tree to the mainline.

Until merged, available at:
  https://gitlab.com/sdm845/sdm845-next/-/commits/b4/pixel-3

Signed-off-by: David Heidelberg <david@ixit.cz>
---
Changes in v5:
- Document 1 MHz frequency for i2c2 on blueline and add placeholder for
  the touchscreen.
- Rename vreg_l14a_1p88 regulator to vreg_l14a_1p8 as it's 1.80V.
- Move panel _enable() function below _program(). (Dmitry)
- Link to v4: https://lore.kernel.org/r/20251125-pixel-3-v4-0-3b706f8dcc96@ixit.cz

Changes in v4:
- Updated panel device-tree example to contain the both compatibles.
- Put panel pins into the panel-default-state and drop the suspend state
  as it's not yet used.
- Also, sort the pins. (Konrad)
- Move the framebuffer format to common, as it's UEFI standard. (Konrad)
- Improve commit descriptions and add Fixes tag. (Dmitry)
- Link to v3: https://lore.kernel.org/r/20251118-pixel-3-v3-0-317a2b400d8a@ixit.cz

Changes in v3:
- dropped Documentaion: prefix from 1st commit (Krzysztof)
- Extended the compatible for panel driver.
- Document reserved GPIOs.
- Drop some useless statuses, sort pinctrl. (Konrad)
- Add placeholders for the known i2c devices.
- Link to v2: https://lore.kernel.org/r/20251030-pixel-3-v2-0-8caddbe072c9@ixit.cz

Changes in v2:
- rebased on next-20251030
- generalize chosen to -common (Dmitry)
- demystify rmtfs_mem qcom,vmid
- use qcom,use-guard-pages instead of lower/upper guard block
- merge port@1 endpoint into label mdss_dsi0_out
- sort pinctrl
- sorted the nodes inside root
- put status as a last property into mdss_dsi0 block
- rename volume-keys to gpio-keys   
- removed LS-UART1 label
- removed gmu block, already enabled
- removed accidentally introduced WIP crosshatch panel support
- removed useless panel_pmgpio_pins (Dmitry)
- removed usb_2 as it's unused on production units (only devkit)
- move mdss node into the -common and disable in crosshatch (Dmitry)
- move battery node into the -commonm
- move framebuffer into the -common (Dmitry)
- add all firmwares (Dmitry)
- add Wi-Fi support
- add Bluetooth support
- add missing gpi_dma1 node
- renamed regulators to follow regulator-foo-bar BCP (Dmitry)
- adapt to recent cleanup GPU's zap-shader node
- Link to v1: https://lore.kernel.org/r/20251005-pixel-3-v1-0-ab8b85f6133f@ixit.cz

---
David Heidelberg (8):
      dt-bindings: arm: qcom: Add Pixel 3 and 3 XL
      dt-bindings: panel: sw43408: adjust to reflect the DDIC and panel used
      drm/panel: sw43408: Introduce LH546WF1-ED01 panel compatible
      drm/panel: sw43408: Add enable/disable and reset functions
      drm/panel: sw43408: Remove manual invocation of unprepare at remove
      drm/panel: sw43408: Switch to devm_regulator_bulk_get_const
      drm/panel: sw43408: Improve wording when reset-gpios aren't available
      arm64: dts: qcom: Add support for Pixel 3 and Pixel 3 XL

 Documentation/devicetree/bindings/arm/qcom.yaml    |   2 +
 .../bindings/display/panel/lg,sw43408.yaml         |  13 +-
 arch/arm64/boot/dts/qcom/Makefile                  |   2 +
 .../arm64/boot/dts/qcom/sdm845-google-blueline.dts |  85 ++++
 arch/arm64/boot/dts/qcom/sdm845-google-common.dtsi | 524 +++++++++++++++++++++
 .../boot/dts/qcom/sdm845-google-crosshatch.dts     |  28 ++
 drivers/gpu/drm/panel/panel-lg-sw43408.c           |  86 ++--
 7 files changed, 704 insertions(+), 36 deletions(-)
---
base-commit: 44ddd568b5431628c63b3df652ceb5b466e20165
change-id: 20250419-pixel-3-511edc2a4607

Best regards,
-- 
David Heidelberg <david@ixit.cz>


