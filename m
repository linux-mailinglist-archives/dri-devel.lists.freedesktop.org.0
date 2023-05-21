Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id C36C670B0AB
	for <lists+dri-devel@lfdr.de>; Sun, 21 May 2023 23:23:17 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 8125B10E0DB;
	Sun, 21 May 2023 21:23:11 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from relay08.th.seeweb.it (relay08.th.seeweb.it
 [IPv6:2001:4b7a:2000:18::169])
 by gabe.freedesktop.org (Postfix) with ESMTPS id CC22D10E0DB
 for <dri-devel@lists.freedesktop.org>; Sun, 21 May 2023 21:23:08 +0000 (UTC)
Received: from Marijn-Arch-PC.localdomain
 (94-211-6-86.cable.dynamic.v4.ziggo.nl [94.211.6.86])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
 (No client certificate requested)
 by m-r2.th.seeweb.it (Postfix) with ESMTPSA id B65F53F2DD;
 Sun, 21 May 2023 23:23:04 +0200 (CEST)
From: Marijn Suijten <marijn.suijten@somainline.org>
Subject: [PATCH RFC 00/10] drm/panel: Drivers for four Sony CMD-mode (and
 DSC) panels
Date: Sun, 21 May 2023 23:23:02 +0200
Message-Id: <20230521-drm-panels-sony-v1-0-541c341d6bee@somainline.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
X-B4-Tracking: v=1; b=H4sIALeLamQC/x2NQQrCQAwAv1JyNtDdtSheBR/Qq3jYbqMNrGlJU
 JTSvxs8zsAwKxgpk8GpWUHpzcazOIRdA2XK8iDk0RliG1PbxYCjPnHJQtXQZvliKl0uKYbjPh7
 AqyEb4aBZyuSdvGp1uSjd+fPfXKG/nOG2bT/r6/B3ewAAAA==
To: Neil Armstrong <neil.armstrong@linaro.org>, 
 Sam Ravnborg <sam@ravnborg.org>, David Airlie <airlied@gmail.com>, 
 Daniel Vetter <daniel@ffwll.ch>, Caleb Connolly <caleb@connolly.tech>, 
 Rob Herring <robh+dt@kernel.org>, 
 Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>, 
 Conor Dooley <conor+dt@kernel.org>, Andy Gross <agross@kernel.org>, 
 Bjorn Andersson <andersson@kernel.org>
X-Mailer: b4 0.12.2
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
Cc: devicetree@vger.kernel.org, Marijn Suijten <marijn.suijten@somainline.org>,
 Jami Kettunen <jami.kettunen@somainline.org>, linux-arm-msm@vger.kernel.org,
 Konrad Dybcio <konrad.dybcio@somainline.org>, linux-kernel@vger.kernel.org,
 dri-devel@lists.freedesktop.org, Abhinav Kumar <quic_abhinavk@quicinc.com>,
 Konrad Dybcio <konrad.dybcio@linaro.org>,
 Martin Botka <martin.botka@somainline.org>,
 ~postmarketos/upstreaming@lists.sr.ht,
 AngeloGioacchino Del Regno <angelogioacchino.delregno@somainline.org>,
 Dmitry Baryshkov <dmitry.baryshkov@linaro.org>,
 Jessica Zhang <quic_jesszhan@quicinc.com>,
 Kuogee Hsieh <quic_khsieh@quicinc.com>
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

Sending in a bunch of almost-finished (hence RFC) Sony panel drivers
upon drm/msm request, to further discussions around DSC panels and DSI
pclk calculations.  This brings support for the following Sony Xperia
devices:

- Xperia XZ3 (DSC)
- Xperia 1 (DSC)
- Xperia 5
- Xperia 10 II (shared with Xperia 5)
- Xperia 5 II (DSC, 120Hz)

And, since the XZ3 already has all the DT in place to enable the panels
on its smaller XZ2(c) siblings, an extra patch is included to add the
new compatible string and properties to this device .dts.  DTS for other
boards/platforms will come later, after cleaning up preliminary patches
(e.g. DPU catalog additions, SoC/board DTS for the MDSS subsystem, etc).

- File- and compatible names:

  None of my downstream sources describe the product name of the panels
  used here; in few cases the Display-IC is known but for the Xperia XZ3
  Xperia 1 we have to make-do with a vendor name only.

  Naming suggestions definitely welcome; i.e. I'm especially not fond of
  sony-griffin-samsung.c :)

- Panels/drivers featuring multiple modes

  As brought up earlier in #freedreno drm_panel drivers can provide
  multiple modes, but the selected mode is never communicated back to
  the panel.  This either has to be added to the driver, or the drivers
  in question have to be converted to drm_bridges (suggestion from
  #freedreno).  That should allow us to select a mode at runtime, and
  downstream even defines "fast paths" to switch from one mode to the
  next (e.g. when only adjusting the refresh rate) without powering the
  panel off and on again, which we can hopefully support too.

  For now the choice between either mode has been hardcoded behind a
  static const bool.

- DSC

  Not much to discuss here except that "it works" after piecing together
  various series on the lists.  No dependencies to make this series
  apply/compile, though.

- pclk

  The brunt of the discussion is around getting these command mode
  panels functioning at their desired 60Hz or 120Hz refresh rate without
  tearing/artifacts, and without hacks.  Part of that discussion around
  DSC-specific timing adjustments is happening in [1], but the sofef01
  (non-DSC) Driver-IC is also struggling on the Xperia 5 specifically,
  as outlined in that specific patch.  That is currently "addressed"
  with a "porch hack" but should probably have some sort of overhead /
  transfer time taken into account in the MSM DSI driver.

  Let me know what the best place is to collate all the relevant info
  (links to downstream panel DTS, outcomes with different patches and
  tweaks, etc).  A new fd.o drm/msm issue?

[1]: https://gitlab.freedesktop.org/drm/msm/-/issues/24#note_1917707

Signed-off-by: Marijn Suijten <marijn.suijten@somainline.org>
---
Marijn Suijten (10):
      drm/panel: Clean up SOFEF00 config dependencies
      dt-bindings: display: panel: Describe Sony Xperia XZ3's LGD panel
      drm/panel: Add LGD panel driver for Sony Xperia XZ3
      arm64: dts: qcom: sdm845-akatsuki: Configure OLED panel
      dt-bindings: display: panel: Describe Samsung SOFEF01-M Display-IC
      drm/panel/samsung-sofef01: Add panel driver for Sony Xperia 5 / 10 II
      dt-bindings: display: panel: Describe Samsung SOFEF03-M Display-IC
      drm/panel/samsung-sofef03: Add panel driver for Sony Xperia 5 II
      dt-bindings: display: panel: Describe Sony Xperia 1 display
      drm/panel/sony-griffin-samsung: Add panel driver for Sony Xperia 1

 .../bindings/display/panel/samsung,sofef01-m.yaml  | 109 ++++++
 .../bindings/display/panel/samsung,sofef03-m.yaml  |  73 ++++
 .../bindings/display/panel/sony,akatsuki-lgd.yaml  |  71 ++++
 .../display/panel/sony,griffin-samsung.yaml        |  73 ++++
 .../dts/qcom/sdm845-sony-xperia-tama-akatsuki.dts  |   9 +
 drivers/gpu/drm/panel/Kconfig                      |  52 ++-
 drivers/gpu/drm/panel/Makefile                     |   4 +
 drivers/gpu/drm/panel/panel-samsung-sofef01.c      | 360 ++++++++++++++++++
 drivers/gpu/drm/panel/panel-samsung-sofef03.c      | 423 +++++++++++++++++++++
 drivers/gpu/drm/panel/panel-sony-akatsuki-lgd.c    | 362 ++++++++++++++++++
 drivers/gpu/drm/panel/panel-sony-griffin-samsung.c | 410 ++++++++++++++++++++
 11 files changed, 1945 insertions(+), 1 deletion(-)
---
base-commit: dbd91ef4e91c1ce3a24429f5fb3876b7a0306733
change-id: 20230521-drm-panels-sony-3c5ac3218427

Best regards,
-- 
Marijn Suijten <marijn.suijten@somainline.org>

