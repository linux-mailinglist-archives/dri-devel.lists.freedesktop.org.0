Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 6FCFFC69151
	for <lists+dri-devel@lfdr.de>; Tue, 18 Nov 2025 12:30:49 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 13D0A89CA4;
	Tue, 18 Nov 2025 11:30:46 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=kernel.org header.i=@kernel.org header.b="MDG2XqwH";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from sea.source.kernel.org (sea.source.kernel.org [172.234.252.31])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 3BE5B89CA4
 for <dri-devel@lists.freedesktop.org>; Tue, 18 Nov 2025 11:30:44 +0000 (UTC)
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
 by sea.source.kernel.org (Postfix) with ESMTP id B08BD43A2A;
 Tue, 18 Nov 2025 11:30:43 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPS id E4197C2BC87;
 Tue, 18 Nov 2025 11:30:42 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=k20201202; t=1763465443;
 bh=tWnNYvYQRDsGGxSuDn/MWDrGcftRyl+P4vR4eD0JmvI=;
 h=From:Subject:Date:To:Cc:Reply-To:From;
 b=MDG2XqwHNLnqAMMxNhqX481Ozin7fyJnbvBMDJenJ7SdbkTw+RjGnj5bL34T7NSAC
 1OJaaQJrA5C2DGhjtFaZtavOM+CLJAjgNNcFWVU1REvCXrC/RDN1inqagjd/iMBowc
 OlX3SLAJIU2COR/KHw2DsR2mx6J7MY2Okb0w3iYRLw8PoRPTL6QcAiKwjFCrVX+szW
 CUEs+wBsXrHd93/p3bbdtqA/TKnV/teNRb58+fCK0r47PbQN3piUY3cRE0cn9IYHEJ
 hPTqw4vn2Gk1SEJFpr9CKxkaXlZWwVL6zaFZfiMxc+sfNSAy95GGWeJImKufP1zU6E
 mKrqcMLEZFSkg==
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org
 (localhost.localdomain [127.0.0.1])
 by smtp.lore.kernel.org (Postfix) with ESMTP id 8FAEACED61E;
 Tue, 18 Nov 2025 11:30:42 +0000 (UTC)
From: David Heidelberg via B4 Relay <devnull+david.ixit.cz@kernel.org>
Subject: [PATCH v3 0/8] Add support for Pixel 3 and Pixel 3 XL
Date: Tue, 18 Nov 2025 12:30:35 +0100
Message-Id: <20251118-pixel-3-v3-0-317a2b400d8a@ixit.cz>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
X-B4-Tracking: v=1; b=H4sIANtYHGkC/02Pyw6CMBBFf8V0bc20pTxc+R/GBbSDTGIAW2xQw
 r9b0IjLOzPn5M7EPDpCz467iTkM5KlrY1D7HTNN2V6Rk42ZSZAaElHwnka8ccW1EGiNLJMUMha
 ve4d1XC2m8yXmhvzQuecqDmKZrg4BoH+OIDjwssqrXNepUKo+0UjDwbzYYgjyj1KwUTJSuSmtr
 RAyaYqNmj9FHN4f8ZPh22ae38+XzMXnAAAA
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
 David Airlie <airlied@gmail.com>, Simona Vetter <simona@ffwll.ch>
Cc: phodina@protonmail.com, linux-arm-msm@vger.kernel.org, 
 devicetree@vger.kernel.org, linux-kernel@vger.kernel.org, 
 phone-devel@vger.kernel.org, dri-devel@lists.freedesktop.org, 
 David Heidelberg <david@ixit.cz>, Amit Pundir <amit.pundir@linaro.org>, 
 Casey Connolly <casey@connolly.tech>, Joel Selvaraj <foss@joelselvaraj.com>, 
 Vinod Koul <vkoul@kernel.org>, Bjorn Andersson <andersson@kernel.org>
X-Mailer: b4 0.14.3
X-Developer-Signature: v=1; a=openpgp-sha256; l=3670; i=david@ixit.cz;
 h=from:subject:message-id;
 bh=tWnNYvYQRDsGGxSuDn/MWDrGcftRyl+P4vR4eD0JmvI=;
 b=owEBbQKS/ZANAwAIAWACP8TTSSByAcsmYgBpHFjg+z2KM7Ixt9O1Fd1uwPNNs4KTdFRA5lbt0
 itZnamnsUGJAjMEAAEIAB0WIQTXegnP7twrvVOnBHRgAj/E00kgcgUCaRxY4AAKCRBgAj/E00kg
 cgiuEACFpKLhluE0HMUuoXRR78KqEyHJEmsKa0DDyyX53skNLLjJBPebBafR9vmO8BCKXuDIeBY
 J78omfidybBS27HCy//CKzIRXeGiGwIwWy2bpO2yqAi2lUio5H0zeZ1B4qkJTDu1aw/3GvQWFnE
 bdBc4THVllBXTdOZzD0x2HStfldBWlWIYVTIUvsuavMMWxUJTneZeeIncmcEGEek5lPPLl0aB0X
 lKwPpe8BTLX+fgFN+j6tz5kzJCL8mostUi6PWLaNuKy03MdsIG9EHSOB4EWJ2cQ32LSZUGNiY58
 l3HilOURssxcYlgFGHoWJA2579JAeVgd2gXGAlt7n0IV+XFDN61hdZShnY5Ffw9lkdOIaIk2j6y
 VSlBNZnbAZeXYA4ayoHOtTXK+k/3HQk+vBu8lwbss1vmYoIyRr7mgfrceBotMrOo4oMaLbdr+jB
 uSUi1szWqvyGsEtw8UbWt0Hcu4cEmbZz9tq4HL50eSCIeTjj8e/E9FHeA709gEcTL64h6ewioMF
 ihz8DvZGSbjMlCCa6g0A2K71CuRcjLgMvKcO43JOLK6OdCIWT2aLmF1c2HBFnHwu+yjUJQoDIeD
 qlHjjrpz+Yc3MGGqoqT7S8FYMxF2G8VJlLvjKekH6IpytPy2aA7ya7A1Y5YJe0T0IDjL8Mp/o5P
 ihfeEif4G3ttvfg==
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

Depends on:
- "[PATCH 0/7] arm64: dts: qcom: cleanup GPU's zap-shader node" series.

Signed-off-by: David Heidelberg <david@ixit.cz>
---
Changes in v3:
- dropped Documentaion: prefix from 1st commit (Krzysztof)
- extended the compatible for panel driver
- Document reserved GPIOs.
- Drop some useless statuses, sort pinctrl. (Konrad)
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
      drm/panel: sw43408: Introduce disable/enable functions
      drm/panel: sw43408: Remove manual invocation of unprepare at remove
      drm/panel: sw43408: Switch to devm_regulator_bulk_get_const
      drm/panel: sw43408: Improve wording when reset-gpios aren't available
      arm64: dts: qcom: Add support for Pixel 3 and Pixel 3 XL

 Documentation/devicetree/bindings/arm/qcom.yaml    |   2 +
 .../bindings/display/panel/lg,sw43408.yaml         |  11 +-
 arch/arm64/boot/dts/qcom/Makefile                  |   2 +
 .../arm64/boot/dts/qcom/sdm845-google-blueline.dts |  88 ++++
 arch/arm64/boot/dts/qcom/sdm845-google-common.dtsi | 515 +++++++++++++++++++++
 .../boot/dts/qcom/sdm845-google-crosshatch.dts     |  33 ++
 drivers/gpu/drm/panel/panel-lg-sw43408.c           | 123 +++--
 7 files changed, 721 insertions(+), 53 deletions(-)
---
base-commit: ace0e2ec8bedd82f153e51c5d8d36ed3cb181e69
change-id: 20250419-pixel-3-511edc2a4607

Best regards,
-- 
David Heidelberg <david@ixit.cz>


