Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 0B5C54973A6
	for <lists+dri-devel@lfdr.de>; Sun, 23 Jan 2022 18:37:39 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 8980F10E239;
	Sun, 23 Jan 2022 17:37:33 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-4321.protonmail.ch (mail-4321.protonmail.ch [185.70.43.21])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 6D29810E239
 for <dri-devel@lists.freedesktop.org>; Sun, 23 Jan 2022 17:37:32 +0000 (UTC)
Received: from mail-0301.mail-europe.com (mail-0301.mail-europe.com
 [188.165.51.139])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (4096 bits))
 (No client certificate requested)
 by mail-4321.protonmail.ch (Postfix) with ESMTPS id 4JhgL25fB9z4x1KJ
 for <dri-devel@lists.freedesktop.org>; Sun, 23 Jan 2022 17:37:30 +0000 (UTC)
Authentication-Results: mail-4321.protonmail.ch;
 dkim=pass (1024-bit key) header.d=connolly.tech header.i=@connolly.tech
 header.b="no9GFqAe"
Date: Sun, 23 Jan 2022 17:37:20 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=connolly.tech;
 s=protonmail; t=1642959445;
 bh=EG8WM13QcPrV2AZ3laZQJnqld2O70XozKuQoHTXOykA=;
 h=Date:To:From:Reply-To:Subject:Message-ID:From:To:Cc;
 b=no9GFqAecOd2zVW/NKbjqQ6dAkxhAnyQVsIpGamsco/5BHwbufZ584C65Y/k4QVNC
 gC1vLEs+2VpeXG3F4EKWfU4ZKpMwl6q45GE1X8CP8uJ/6qP46AttvNokVDVjBzrGjV
 23pJqhjXzQQ/EsMvnOe7VGQBYY9A2fAHyoPFJr9U=
To: Thierry Reding <thierry.reding@gmail.com>, Sam Ravnborg <sam@ravnborg.org>,
 David Airlie <airlied@linux.ie>, Daniel Vetter <daniel@ffwll.ch>,
 Rob Herring <robh+dt@kernel.org>, Dmitry Torokhov <dmitry.torokhov@gmail.com>,
 Andy Gross <agross@kernel.org>, Bjorn Andersson <bjorn.andersson@linaro.org>,
 Kees Cook <keescook@chromium.org>, Anton Vorontsov <anton@enomsg.org>,
 Colin Cross <ccross@android.com>, Tony Luck <tony.luck@intel.com>,
 Henrik Rydberg <rydberg@bitmath.org>, Harigovindan P <harigovi@codeaurora.org>,
 Caleb Connolly <caleb@connolly.tech>, dri-devel@lists.freedesktop.org,
 devicetree@vger.kernel.org, linux-kernel@vger.kernel.org,
 linux-input@vger.kernel.org, linux-arm-msm@vger.kernel.org,
 Alexander Martinz <amartinz@shiftphones.com>
From: Caleb Connolly <caleb@connolly.tech>
Subject: [PATCH 0/6] Add support for the SHIFT SHIFT6mq
Message-ID: <20220123173650.290349-1-caleb@connolly.tech>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable
X-Spam-Status: No, score=-1.2 required=10.0 tests=ALL_TRUSTED,DKIM_SIGNED,
 DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF shortcircuit=no
 autolearn=disabled version=3.4.4
X-Spam-Checker-Version: SpamAssassin 3.4.4 (2020-01-24) on
 mailout.protonmail.ch
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

This series adds initial support for the SHIFT6mq. SHIFT are a sustainably
oriented device manufacturer who aim to build repairable devices with long
lifespans.

The SHIFT6mq is a Snapdragon 845 based device, it features a 1080p OLED pan=
el,
8GB of RAM, 128GB of UFS storage and display port alt mode. The device also
ships with secure-boot off, potentially allowing end-users to modify usuall=
y
inaccesible parts of the device like the bootloader. They've been keen to s=
ee
their devices supported upstream kernels!

This brings up initial support for the device, with all core features worki=
ng:

* Display / GPU / touch
* WIFI
* Modem (sms and mobile data are supported with ModemManager)

- Caleb

Alexander Martinz (1):
  arm64: dts: qcom: sdm845: add device tree for SHIFT6mq

Caleb Connolly (5):
  dt-bindings: input: touchscreen: add bindings for focaltech,fts
  input: touchscreen: add focaltech FTS driver
  dt-bindings: display: visionox-rm69299: document new compatible string
  drm/panel: visionox-rm69299: support the variant found in the SHIFT6mq
  dt-bindings: vendor-prefixes: add vendor prefix for SHIFT

 .../display/panel/visionox,rm69299.yaml       |   4 +-
 .../input/touchscreen/focaltech,fts.yaml      |  78 ++
 .../devicetree/bindings/vendor-prefixes.yaml  |   2 +
 arch/arm64/boot/dts/qcom/Makefile             |   1 +
 .../boot/dts/qcom/sdm845-shift-axolotl.dts    | 736 +++++++++++++++
 .../gpu/drm/panel/panel-visionox-rm69299.c    | 281 ++++--
 drivers/input/touchscreen/Kconfig             |   9 +
 drivers/input/touchscreen/Makefile            |   1 +
 drivers/input/touchscreen/focaltech_fts.c     | 870 ++++++++++++++++++
 9 files changed, 1921 insertions(+), 61 deletions(-)
 create mode 100644 Documentation/devicetree/bindings/input/touchscreen/foc=
altech,fts.yaml
 create mode 100644 arch/arm64/boot/dts/qcom/sdm845-shift-axolotl.dts
 create mode 100644 drivers/input/touchscreen/focaltech_fts.c

--
2.34.1


