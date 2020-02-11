Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 6572915A338
	for <lists+dri-devel@lfdr.de>; Wed, 12 Feb 2020 09:25:44 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 6DCAB6F47E;
	Wed, 12 Feb 2020 08:25:24 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mo6-p02-ob.smtp.rzone.de (mo6-p02-ob.smtp.rzone.de
 [IPv6:2a01:238:20a:202:5302::11])
 by gabe.freedesktop.org (Postfix) with ESMTPS id BF6186F440
 for <dri-devel@lists.freedesktop.org>; Tue, 11 Feb 2020 21:47:34 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; t=1581457653;
 s=strato-dkim-0002; d=goldelico.com;
 h=Message-Id:Date:Subject:Cc:To:From:X-RZG-CLASS-ID:X-RZG-AUTH:From:
 Subject:Sender;
 bh=EBfn4aNTLC4vcAvpYGu7o+g5GHVcJfaycvr27j3NIl8=;
 b=HyjovvpxFjtXukrGU4dC/BOUg68wg6A0JVOJNUAhkuZM3yCAlyP/SBtKWl0SD9ruf+
 zQPwZ/TzMQ1Yn1eugycFvSRhgtf4QKAO81ufBA7eDTGNbBCwiVxswWLhVPf36mPYOVHt
 IKZHXnQ5Wy5MW7SLrzpl83NrhFtrigzs0IEI+8Zz7MrAklZg9V2pT1Nhg0fnaPhmvSpb
 0WfarNgzcn5/52Pva5PbzIRQYGsGQLovnFkV6awkooKQbWlmHTzfQY9n0ip2fR3vBZkn
 nq9iEvIVTwL5/CJ7BfczqxwZwWDI2fIcvRJX8ibYJrBfUUK5odIq38N8IuEEe96IumPx
 mL+w==
X-RZG-AUTH: ":JGIXVUS7cutRB/49FwqZ7WcJeFKiMhflhwDubTJ9o1OAA2UNf2M0P2mp10IM"
X-RZG-CLASS-ID: mo00
Received: from iMac.fritz.box by smtp.strato.de (RZmta 46.1.12 DYNA|AUTH)
 with ESMTPSA id U06217w1BLfW0EG
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256 bits))
 (Client did not present a certificate);
 Tue, 11 Feb 2020 22:41:32 +0100 (CET)
From: "H. Nikolaus Schaller" <hns@goldelico.com>
To: Paul Cercueil <paul@crapouillou.net>, Paul Boddie <paul@boddie.org.uk>,
 Alex Smith <alex.smith@imgtec.com>, Rob Herring <robh+dt@kernel.org>,
 Mark Rutland <mark.rutland@arm.com>, Ralf Baechle <ralf@linux-mips.org>,
 Paul Burton <paulburton@kernel.org>, James Hogan <jhogan@kernel.org>,
 David Airlie <airlied@linux.ie>, Daniel Vetter <daniel@ffwll.ch>,
 "David S. Miller" <davem@davemloft.net>,
 Linus Walleij <linus.walleij@linaro.org>,
 "H. Nikolaus Schaller" <hns@goldelico.com>,
 Andi Kleen <ak@linux.intel.com>, Krzysztof Kozlowski <krzk@kernel.org>,
 Geert Uytterhoeven <geert+renesas@glider.be>,
 Miquel Raynal <miquel.raynal@bootlin.com>,
 =?UTF-8?q?Petr=20=C5=A0tetiar?= <ynezz@true.cz>,
 Richard Fontana <rfontana@redhat.com>,
 Allison Randal <allison@lohutok.net>, Stephen Boyd <swboyd@chromium.org>
Subject: [PATCH 00/14] MIPS: Fixes and improvements for CI20 board (JZ4780)
Date: Tue, 11 Feb 2020 22:41:17 +0100
Message-Id: <cover.1581457290.git.hns@goldelico.com>
X-Mailer: git-send-email 2.23.0
MIME-Version: 1.0
X-Mailman-Approved-At: Wed, 12 Feb 2020 08:25:13 +0000
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
Cc: devicetree@vger.kernel.org, netdev@vger.kernel.org,
 linux-mips@vger.kernel.org, dri-devel@lists.freedesktop.org,
 linux-kernel@vger.kernel.org, linux-gpio@vger.kernel.org,
 linux-i2c@vger.kernel.org, kernel@pyra-handheld.com,
 letux-kernel@openphoenux.org
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

This patch set provides several improvements for the CI20 board:

* suppress warnings from i2c if device is not responding
* make ingenic-drm found through DT
* allow davicom dm9000 ethernet controller to use MAC address provided by U-Boot
* fix #include in jz4780.dtsi
* configure for loadable kernel modules
* add DTS for IR sensor and SW1 button
* configure so that LEDs, IR sensor, SW1 button have drivers
* fix DTS for ACT8600 PMU and configure driver
* fix interrupt of nxp,pcf8563

There is another patch set in our queue to add HDMI support on top of this work.

Signed-off-by: Paul Boddie <paul@boddie.org.uk>
Signed-off-by: H. Nikolaus Schaller <hns@goldelico.com>


Alex Smith (1):
  MIPS: DTS: CI20: add DT node for IR sensor

H. Nikolaus Schaller (13):
  i2c: jz4780: suppress txabrt reports for i2cdetect
  drm: ingenic-drm: add MODULE_DEVICE_TABLE
  net: davicom: dm9000: allow to pass MAC address through mac_addr
    module parameter
  MIPS: DTS: jz4780: fix #includes for irq.h and gpio.h
  MIPS: CI20: defconfig: configure for supporting modules
  MIPS: CI20: defconfig: compile leds-gpio driver into the kernel and
    configure for LED triggers
  MIPS: DTS: CI20: fix PMU definitions for ACT8600
  MIPS: CI20: defconfig: configure CONFIG_REGULATOR_ACT8865 for PMU
  MIPS: DTS: CI20: give eth0_power a defined voltage.
  MIPS: CI20: defconfig: compile gpio-ir driver
  MIPS: DTS: CI20: add DT node for SW1 as Enter button
  MIPS: CI20: defconfig: configure for CONFIG_KEYBOARD_GPIO=m
  MIPS: DTS: CI20: fix interrupt for pcf8563 RTC

 arch/mips/boot/dts/ingenic/ci20.dts    | 71 ++++++++++++++++++++------
 arch/mips/boot/dts/ingenic/jz4780.dtsi |  2 +
 arch/mips/configs/ci20_defconfig       | 21 ++++++++
 drivers/gpu/drm/ingenic/ingenic-drm.c  |  2 +
 drivers/i2c/busses/i2c-jz4780.c        |  3 ++
 drivers/net/ethernet/davicom/dm9000.c  | 42 +++++++++++++++
 6 files changed, 125 insertions(+), 16 deletions(-)

-- 
2.23.0

_______________________________________________
dri-devel mailing list
dri-devel@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/dri-devel
