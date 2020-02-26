Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 277E8171240
	for <lists+dri-devel@lfdr.de>; Thu, 27 Feb 2020 09:15:07 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id A1FC06EC41;
	Thu, 27 Feb 2020 08:14:48 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mo6-p02-ob.smtp.rzone.de (mo6-p02-ob.smtp.rzone.de
 [IPv6:2a01:238:20a:202:5302::2])
 by gabe.freedesktop.org (Postfix) with ESMTPS id F02F06EB99
 for <dri-devel@lists.freedesktop.org>; Wed, 26 Feb 2020 19:13:14 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; t=1582744393;
 s=strato-dkim-0002; d=goldelico.com;
 h=Message-Id:Date:Subject:Cc:To:From:X-RZG-CLASS-ID:X-RZG-AUTH:From:
 Subject:Sender;
 bh=Vdb7nlCxfqY9kDUQ+U3Vms96RRuZQL4A0e+CPRkPLwo=;
 b=A97UaP0CaA6MC0YuOQOnINtYryK9iYpuVyl7V4s1cz9IS78KmxQ98BY7ZIMOuVmD2i
 o1aqH1wTdWrcPlUhHVDYxkbGK8QNVom2mznTpieXlHrkZvN+HiZMeTqTVNn75n6Rcxx1
 J6G77Uep0osstX6Q4urMJRKqsNTOu8YgZfoR3eDKctjAaLfVXgW2/FrQH/ZDwsDt0v/I
 qAlomJ3XQ5D46xwz0bp91uOahk/VnjW7TK4qggTvnmTPtBrF4hFt8xo2FlIm7vNZ6O7E
 UBk8ESZXzvMLdEwv651QNYg5iECCDLKbm5eEkuQRY/3pv69Sw6XQyM2XTsx6Pvc+ccJf
 ycGw==
X-RZG-AUTH: ":JGIXVUS7cutRB/49FwqZ7WcJeFKiMhflhwDubTJ9o12DNOsPj0pAzoz/Oc2x"
X-RZG-CLASS-ID: mo00
Received: from iMac.fritz.box by smtp.strato.de (RZmta 46.1.12 DYNA|AUTH)
 with ESMTPSA id U06217w1QJD06bJ
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256 bits))
 (Client did not present a certificate);
 Wed, 26 Feb 2020 20:13:00 +0100 (CET)
From: "H. Nikolaus Schaller" <hns@goldelico.com>
To: Paul Cercueil <paul@crapouillou.net>, Paul Boddie <paul@boddie.org.uk>,
 David Airlie <airlied@linux.ie>, Daniel Vetter <daniel@ffwll.ch>,
 Rob Herring <robh+dt@kernel.org>, Mark Rutland <mark.rutland@arm.com>,
 Ralf Baechle <ralf@linux-mips.org>, Paul Burton <paulburton@kernel.org>,
 Linus Walleij <linus.walleij@linaro.org>, Andi Kleen <ak@linux.intel.com>,
 Krzysztof Kozlowski <krzk@kernel.org>,
 Geert Uytterhoeven <geert+renesas@glider.be>,
 "Eric W. Biederman" <ebiederm@xmission.com>
Subject: [RFC 0/8] MIPS: CI20: add HDMI out support 
Date: Wed, 26 Feb 2020 20:12:52 +0100
Message-Id: <cover.1582744379.git.hns@goldelico.com>
X-Mailer: git-send-email 2.23.0
MIME-Version: 1.0
X-Mailman-Approved-At: Thu, 27 Feb 2020 08:13:09 +0000
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
Cc: devicetree@vger.kernel.org, "H. Nikolaus Schaller" <hns@goldelico.com>,
 linux-kernel@vger.kernel.org, dri-devel@lists.freedesktop.org,
 linux-mips@vger.kernel.org, linux-gpio@vger.kernel.org,
 kernel@pyra-handheld.com, letux-kernel@openphoenux.org
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

This patch series adds HDMI output to the jz4780/CI20 board.

It is based on taking the old 3.18 vendor kernel and trying
to achieve the same with modern DTS setup and new/modified
drivers.

Unfortunately, in this first RFC, only EDID and creation of
/dev/fb0 are working. Also, HDMI hot plugging is detected.

But there is no HDMI output signal. So some tiny piece seems
to be missing to enable/configure the Synposys HDMI controller.

We need help from the community to fix this.

Note: device tree bindings are from 2015 and still seem to
fit - except they are not in yaml format.

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

Zubair Lutfullah Kakakhel (2):
  dt-bindings: video: Add jz4780-lcd binding
  dt-bindings: video: Add jz4780-hdmi binding

 .../bindings/display/ingenic-jz4780-hdmi.txt  |  41 ++++++
 .../bindings/display/ingenic-jz4780-lcd.txt   |  39 ++++++
 arch/mips/boot/dts/ingenic/ci20.dts           |  64 ++++++++++
 arch/mips/boot/dts/ingenic/jz4780.dtsi        |  32 +++++
 arch/mips/configs/ci20_defconfig              |   3 +
 drivers/gpu/drm/ingenic/Kconfig               |   8 ++
 drivers/gpu/drm/ingenic/Makefile              |   1 +
 drivers/gpu/drm/ingenic/dw_hdmi-jz4780.c      | 120 ++++++++++++++++++
 drivers/gpu/drm/ingenic/ingenic-drm.c         |   2 +
 drivers/pinctrl/pinctrl-ingenic.c             |   7 +
 10 files changed, 317 insertions(+)
 create mode 100644 Documentation/devicetree/bindings/display/ingenic-jz4780-hdmi.txt
 create mode 100644 Documentation/devicetree/bindings/display/ingenic-jz4780-lcd.txt
 create mode 100644 drivers/gpu/drm/ingenic/dw_hdmi-jz4780.c

-- 
2.23.0

_______________________________________________
dri-devel mailing list
dri-devel@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/dri-devel
