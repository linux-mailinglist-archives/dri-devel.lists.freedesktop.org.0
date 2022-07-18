Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 10C5F578CA5
	for <lists+dri-devel@lfdr.de>; Mon, 18 Jul 2022 23:21:57 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id B225C10FC30;
	Mon, 18 Jul 2022 21:21:54 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-4321.protonmail.ch (mail-4321.protonmail.ch [185.70.43.21])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 60E1310FB93
 for <dri-devel@lists.freedesktop.org>; Mon, 18 Jul 2022 21:21:53 +0000 (UTC)
Date: Mon, 18 Jul 2022 21:20:46 +0000
Authentication-Results: mail-4321.protonmail.ch;
 dkim=pass (1024-bit key) header.d=connolly.tech header.i=@connolly.tech
 header.b="f509/OtZ"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=connolly.tech;
 s=protonmail; t=1658179258; x=1658438458;
 bh=3U/67mf57ng96VibBXJjsH4xTmCc+lifj3sh+mu8+qQ=;
 h=Date:To:From:Reply-To:Subject:Message-ID:Feedback-ID:From:To:Cc:
 Date:Subject:Reply-To:Feedback-ID:Message-ID;
 b=f509/OtZQV8qgu8L2bThJO7xkYspuMsAslYjkiNLrNEJc9ToBJKpRa0mMYqkSCJGG
 HnEASTkG2oaciDHOA0pSKzn0mtI993FNjrHj6aOSAV3DRHtrHS9jXYiltzHd9rsHJz
 COYMZoK0iWfRGgLGalOnC1MRaAVl4ZBxKXCyHvqo=
To: Andy Gross <agross@kernel.org>,
 Bjorn Andersson <bjorn.andersson@linaro.org>,
 Konrad Dybcio <konrad.dybcio@somainline.org>, Rob Herring <robh+dt@kernel.org>,
 Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>,
 Thierry Reding <thierry.reding@gmail.com>, Sam Ravnborg <sam@ravnborg.org>,
 David Airlie <airlied@linux.ie>, Daniel Vetter <daniel@ffwll.ch>,
 Sumit Semwal <sumit.semwal@linaro.org>, Stephen Boyd <sboyd@codeaurora.org>,
 Caleb Connolly <caleb@connolly.tech>, linux-arm-msm@vger.kernel.org,
 devicetree@vger.kernel.org, linux-kernel@vger.kernel.org,
 dri-devel@lists.freedesktop.org, phone-devel@vger.kernel.org,
 ~postmarketos/upstreaming@lists.sr.ht, Amit Pundir <amit.pundir@linaro.org>
From: Caleb Connolly <caleb@connolly.tech>
Subject: [PATCH 0/4] Initial support for the Pixel 3
Message-ID: <20220718212019.1471265-1-caleb@connolly.tech>
Feedback-ID: 10753939:user:proton
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable
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
Reply-To: Caleb Connolly <caleb@connolly.tech>
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

This series adds an initial DTS and display panel driver
for the Pixel 3. The Pixel 3 display uses DSC (Display
Stream Compression) which has been supported in mainline
for some time now.

Functionality includes:
 - Display, GPU, venus video transcoder
 - Modem/WiFi/Bluetooth - ModemManager seems to fail

The touchscreen uses some HEFTY downstream driver, hopefully
we'll come up with an upstreamable solution for it soon and
make this a bit more usable.

Amit Pundir (1):
  arm64: dts: qcom: add sdm845-google-blueline (Pixel 3)

Caleb Connolly (1):
  Documentation: dt-bindings: arm: qcom: add google,blueline

Sumit Semwal (2):
  dt-bindings: panel: Add LG SW43408 MIPI-DSI panel
  drm: panel: Add lg sw43408 panel driver

 .../devicetree/bindings/arm/qcom.yaml         |   1 +
 .../bindings/display/panel/lg,43408.yaml      |  41 ++
 .../display/panel/panel-simple-dsi.yaml       |   2 +
 MAINTAINERS                                   |   8 +
 arch/arm64/boot/dts/qcom/Makefile             |   1 +
 .../boot/dts/qcom/sdm845-google-blueline.dts  | 652 ++++++++++++++++++
 drivers/gpu/drm/panel/Kconfig                 |  11 +
 drivers/gpu/drm/panel/Makefile                |   1 +
 drivers/gpu/drm/panel/panel-lg-sw43408.c      | 586 ++++++++++++++++
 9 files changed, 1303 insertions(+)
 create mode 100644 Documentation/devicetree/bindings/display/panel/lg,4340=
8.yaml
 create mode 100644 arch/arm64/boot/dts/qcom/sdm845-google-blueline.dts
 create mode 100644 drivers/gpu/drm/panel/panel-lg-sw43408.c

--
2.36.1


