Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 93F0C4AB73A
	for <lists+dri-devel@lfdr.de>; Mon,  7 Feb 2022 10:09:38 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id D6AA010E488;
	Mon,  7 Feb 2022 09:09:21 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail.andi.de1.cc (mail.andi.de1.cc
 [IPv6:2a01:238:4321:8900:456f:ecd6:43e:202c])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 365C610E5AD
 for <dri-devel@lists.freedesktop.org>; Sun,  6 Feb 2022 08:20:47 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
 d=kemnade.info; s=20180802; h=Content-Transfer-Encoding:MIME-Version:
 Message-Id:Date:Subject:To:From:Sender:Reply-To:Cc:Content-Type:Content-ID:
 Content-Description:Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc
 :Resent-Message-ID:In-Reply-To:References:List-Id:List-Help:List-Unsubscribe:
 List-Subscribe:List-Post:List-Owner:List-Archive;
 bh=sJ7qWapDIULPUzlvOfkdyR8gpp70UZkOGBb/dECClOU=; b=BM2z0GWY6nd9+LRAz9HQWcpkJc
 3mDdVyRQP3zqcHsRpHTElNFVxXbuDB1R95YqRuL+rWQj1DoitwUMe9rVtCU4/kXDYpH/SQvsByZ7Q
 zSZE3bmbdRp4wlq0xt9ni28vcNTboMmF0LHIVap1BlJ1iwcIxbnt4VQp3m5DWPnMY1J4=;
Received: from p200300ccff05f6001a3da2fffebfd33a.dip0.t-ipconnect.de
 ([2003:cc:ff05:f600:1a3d:a2ff:febf:d33a] helo=aktux)
 by mail.andi.de1.cc with esmtpsa (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.89) (envelope-from <andreas@kemnade.info>)
 id 1nGcTG-0006Uv-Na; Sun, 06 Feb 2022 09:00:30 +0100
Received: from andi by aktux with local (Exim 4.94.2)
 (envelope-from <andreas@kemnade.info>)
 id 1nGcTG-003LEZ-3I; Sun, 06 Feb 2022 09:00:30 +0100
From: Andreas Kemnade <andreas@kemnade.info>
To: p.zabel@pengutronix.de, airlied@linux.ie, daniel@ffwll.ch,
 robh+dt@kernel.org, shawnguo@kernel.org, s.hauer@pengutronix.de,
 kernel@pengutronix.de, festevam@gmail.com, linux-imx@nxp.com,
 maarten.lankhorst@linux.intel.com, mripard@kernel.org, tzimmermann@suse.de,
 andreas@kemnade.info, dri-devel@lists.freedesktop.org,
 devicetree@vger.kernel.org, linux-arm-kernel@lists.infradead.org,
 linux-kernel@vger.kernel.org, alistair@alistair23.me, samuel@sholland.org,
 josua.mayer@jm0.eu, letux-kernel@openphoenux.org
Subject: [RFC PATCH 0/6] drm: EPDC driver for i.MX6
Date: Sun,  6 Feb 2022 09:00:10 +0100
Message-Id: <20220206080016.796556-1-andreas@kemnade.info>
X-Mailer: git-send-email 2.30.2
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Spam-Score: -1.0 (-)
X-Mailman-Approved-At: Mon, 07 Feb 2022 09:09:20 +0000
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

Add a driver for the Electrophoretic Display Controller found in the
i.MX6 SoCs.

In combination with a driver for an EPD PMIC (like the TPS65185 or the
SY7636A), it works with the EPDC found in i.MX6SLL based devices and the
EPDC found in i.MX6SL devices.

Support for waveforms might be limited, there was no 4bit waveform found
which works with the 6SLL but it works with the vendor waveforms of the
Kobo Clara HD (6SLL), the Tolino Shine 2/3 (6SL).
On the 6SL devices, also the epdc_E060SCM.fw works but not as brilliant
as the vendor one.

It does not involve the PXP yet. The NXP/Freescale kernel fork uses that
for rotation and mysterious waveform handling. That is not planed to be
upstreamed in the first step.

Also it does not provide any special userspace API to fine-tune updates.
That is also IMHO something for a second step.

Andreas Kemnade (6):
  dt-bindings: display: imx: Add EPDC
  drm: Add skeleton for EPDC driver
  drm: mxc-epdc: Add display and waveform initialisation
  drm: mxc-epdc: Add update management
  ARM: dts: imx6sll: add EPDC
  arm: dts: imx6sl: Add EPDC

 .../bindings/display/imx/fsl,mxc-epdc.yaml    |  159 +++
 arch/arm/boot/dts/imx6sl.dtsi                 |    3 +
 arch/arm/boot/dts/imx6sll.dtsi                |    9 +
 drivers/gpu/drm/Kconfig                       |    2 +
 drivers/gpu/drm/Makefile                      |    1 +
 drivers/gpu/drm/mxc-epdc/Kconfig              |   15 +
 drivers/gpu/drm/mxc-epdc/Makefile             |    5 +
 drivers/gpu/drm/mxc-epdc/epdc_hw.c            |  497 +++++++
 drivers/gpu/drm/mxc-epdc/epdc_hw.h            |    8 +
 drivers/gpu/drm/mxc-epdc/epdc_regs.h          |  442 ++++++
 drivers/gpu/drm/mxc-epdc/epdc_update.c        | 1210 +++++++++++++++++
 drivers/gpu/drm/mxc-epdc/epdc_update.h        |    9 +
 drivers/gpu/drm/mxc-epdc/epdc_waveform.c      |  189 +++
 drivers/gpu/drm/mxc-epdc/epdc_waveform.h      |    7 +
 drivers/gpu/drm/mxc-epdc/mxc_epdc.h           |  151 ++
 drivers/gpu/drm/mxc-epdc/mxc_epdc_drv.c       |  373 +++++
 16 files changed, 3080 insertions(+)
 create mode 100644 Documentation/devicetree/bindings/display/imx/fsl,mxc-epdc.yaml
 create mode 100644 drivers/gpu/drm/mxc-epdc/Kconfig
 create mode 100644 drivers/gpu/drm/mxc-epdc/Makefile
 create mode 100644 drivers/gpu/drm/mxc-epdc/epdc_hw.c
 create mode 100644 drivers/gpu/drm/mxc-epdc/epdc_hw.h
 create mode 100644 drivers/gpu/drm/mxc-epdc/epdc_regs.h
 create mode 100644 drivers/gpu/drm/mxc-epdc/epdc_update.c
 create mode 100644 drivers/gpu/drm/mxc-epdc/epdc_update.h
 create mode 100644 drivers/gpu/drm/mxc-epdc/epdc_waveform.c
 create mode 100644 drivers/gpu/drm/mxc-epdc/epdc_waveform.h
 create mode 100644 drivers/gpu/drm/mxc-epdc/mxc_epdc.h
 create mode 100644 drivers/gpu/drm/mxc-epdc/mxc_epdc_drv.c

-- 
2.30.2

