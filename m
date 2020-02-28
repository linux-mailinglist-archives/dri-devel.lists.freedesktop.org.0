Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (unknown [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id A317217461C
	for <lists+dri-devel@lfdr.de>; Sat, 29 Feb 2020 11:14:18 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id BE22E6E1DE;
	Sat, 29 Feb 2020 10:14:15 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mo6-p03-ob.smtp.rzone.de (mo6-p03-ob.smtp.rzone.de
 [IPv6:2a01:238:20a:202:5303::10])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 0D6466F4AF
 for <dri-devel@lists.freedesktop.org>; Fri, 28 Feb 2020 18:19:43 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; t=1582913980;
 s=strato-dkim-0002; d=goldelico.com;
 h=Message-Id:Date:Subject:Cc:To:From:X-RZG-CLASS-ID:X-RZG-AUTH:From:
 Subject:Sender;
 bh=mtibfl3if76oFyUx4VaWIyxio7nt25pVHxLuChFLvDo=;
 b=Wk/gNgL9/zIebyxpiwKOz6s4IMvm0rXocNQVw4/i6hVwDR07hwWJ/wWsn4T78luRjz
 ZcVKZhGrzOV/2urWKmuyNmtlG1wvOHO+TLLNTzxMujj3cyl+ivTrb+8QC2IrnaRzsS/H
 ixO3IvqavLOINOtjahBlgBV706omEU/NQeH/Fjrp9OYNTfsBNEPEVC6FFqNMX5EodnCZ
 ZBEJcGpcJwBgSKcYOY6iDRPveSi/MWP2lF4UgPPZQB/rOHZ2VT+xGuw5nMwIdRXWOycZ
 /4hfRoHnCwOzhSLF6qZ6pirFXhf1JILL4hxO0zNF1eha+gPUALjpHDtQscEd7fdu1feM
 CLCg==
X-RZG-AUTH: ":JGIXVUS7cutRB/49FwqZ7WcJeFKiMhflhwDubTJ9o1mfYzBGHXH6G1+ULkA="
X-RZG-CLASS-ID: mo00
Received: from iMac.fritz.box by smtp.strato.de (RZmta 46.2.0 DYNA|AUTH)
 with ESMTPSA id y0a02cw1SIJY2Lm
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256 bits))
 (Client did not present a certificate);
 Fri, 28 Feb 2020 19:19:34 +0100 (CET)
From: "H. Nikolaus Schaller" <hns@goldelico.com>
To: Paul Cercueil <paul@crapouillou.net>, Paul Boddie <paul@boddie.org.uk>,
 David Airlie <airlied@linux.ie>, Daniel Vetter <daniel@ffwll.ch>,
 Rob Herring <robh+dt@kernel.org>, Mark Rutland <mark.rutland@arm.com>,
 Ralf Baechle <ralf@linux-mips.org>, Paul Burton <paulburton@kernel.org>,
 Linus Walleij <linus.walleij@linaro.org>, Andi Kleen <ak@linux.intel.com>,
 Krzysztof Kozlowski <krzk@kernel.org>,
 Geert Uytterhoeven <geert+renesas@glider.be>,
 "Eric W. Biederman" <ebiederm@xmission.com>,
 "H. Nikolaus Schaller" <hns@goldelico.com>,
 Miquel Raynal <miquel.raynal@bootlin.com>
Subject: [RFC v2 0/8] MIPS: CI20: add HDMI out support 
Date: Fri, 28 Feb 2020 19:19:25 +0100
Message-Id: <cover.1582913973.git.hns@goldelico.com>
X-Mailer: git-send-email 2.23.0
MIME-Version: 1.0
X-Mailman-Approved-At: Sat, 29 Feb 2020 10:13:17 +0000
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
Cc: devicetree@vger.kernel.org, linux-kernel@vger.kernel.org,
 dri-devel@lists.freedesktop.org, linux-mips@vger.kernel.org,
 linux-gpio@vger.kernel.org, kernel@pyra-handheld.com,
 letux-kernel@openphoenux.org
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

* Converted .txt bindings to .yaml (by Sam Ravnborg <sam@ravnborg.org> - big THANKS)

RFC V1 2020-02-26 20:13:06:
This patch series adds HDMI output to the jz4780/CI20 board.

It is based on taking the old 3.18 vendor kernel and trying
to achieve the same with modern DTS setup and new/modified
drivers.

Unfortunately, in this first RFC, only EDID and creation of
/dev/fb0 are working. Also, HDMI hot plugging is detected.

But there is no HDMI output signal. So some tiny piece seems
to be missing to enable/configure the Synposys HDMI controller.

We need help from the community to fix this.

Original authors of most patches are
* Paul Boddie <paul@boddie.org.uk>
* Zubair Lutfullah Kakakhel <Zubair.Kakakhel@imgtec.com>


H. Nikolaus Schaller (2):
  drm: ingenic-drm: add MODULE_DEVICE_TABLE
  MIPS: CI20: defconfig: configure for DRM_DW_HDMI_JZ4780

Paul Boddie (4):
  drm: ingenic: add jz4780 Synopsys HDMI driver.
  pinctrl: ingenic: add hdmi-ddc pin control group
  MIPS: DTS: jz4780: account for Synopsys HDMI driver and LCD controller
  MIPS: DTS: CI20: add HDMI setup

Sam Ravnborg (2):
  dt-bindings: display: add ingenic-jz4780-lcd DT Schema
  dt-bindings: display: add ingenic-jz4780-hdmi DT Schema

 .../bindings/display/ingenic-jz4780-hdmi.yaml |  83 ++++++++++++
 .../bindings/display/ingenic-jz4780-lcd.yaml  |  78 ++++++++++++
 arch/mips/boot/dts/ingenic/ci20.dts           |  64 ++++++++++
 arch/mips/boot/dts/ingenic/jz4780.dtsi        |  32 +++++
 arch/mips/configs/ci20_defconfig              |   3 +
 drivers/gpu/drm/ingenic/Kconfig               |   8 ++
 drivers/gpu/drm/ingenic/Makefile              |   1 +
 drivers/gpu/drm/ingenic/dw_hdmi-jz4780.c      | 120 ++++++++++++++++++
 drivers/gpu/drm/ingenic/ingenic-drm.c         |   2 +
 drivers/pinctrl/pinctrl-ingenic.c             |   7 +
 10 files changed, 398 insertions(+)
 create mode 100644 Documentation/devicetree/bindings/display/ingenic-jz4780-hdmi.yaml
 create mode 100644 Documentation/devicetree/bindings/display/ingenic-jz4780-lcd.yaml
 create mode 100644 drivers/gpu/drm/ingenic/dw_hdmi-jz4780.c

-- 
2.23.0

_______________________________________________
dri-devel mailing list
dri-devel@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/dri-devel
