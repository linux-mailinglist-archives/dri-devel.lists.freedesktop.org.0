Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id C072A9E8E1C
	for <lists+dri-devel@lfdr.de>; Mon,  9 Dec 2024 09:57:42 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 3613B10E680;
	Mon,  9 Dec 2024 08:57:41 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; secure) header.d=siemens.com header.i=alexander.sverdlin@siemens.com header.b="ZvIvdBTk";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
X-Greylist: delayed 602 seconds by postgrey-1.36 at gabe;
 Mon, 09 Dec 2024 08:57:38 UTC
Received: from mta-64-226.siemens.flowmailer.net
 (mta-64-226.siemens.flowmailer.net [185.136.64.226])
 by gabe.freedesktop.org (Postfix) with ESMTPS id D497E10E680
 for <dri-devel@lists.freedesktop.org>; Mon,  9 Dec 2024 08:57:38 +0000 (UTC)
Received: by mta-64-226.siemens.flowmailer.net with ESMTPSA id
 20241209084734bfcfb562db128e4ff1
 for <dri-devel@lists.freedesktop.org>;
 Mon, 09 Dec 2024 09:47:34 +0100
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; s=fm2;
 d=siemens.com; i=alexander.sverdlin@siemens.com;
 h=Date:From:Subject:To:Message-ID:MIME-Version:Content-Type:Content-Transfer-Encoding:Cc;
 bh=RcFkfLf5JHyNV6VrGv7B7FQVpfdFZ2qiET5cMOD+/WQ=;
 b=ZvIvdBTk3CLXAAm+2TSeOBpveKVrq4b9o6RH7efhV600PbOVFrau9iSrTe4ETTx2XI/4Nj
 rShmzzeBpyPI2WEGb2o7Ayxhv6DoBM7WdMrVauZZ+m+M3nQ0mSYm2n1kwAj/vHQLr7K73n8j
 mSdR5Eg1akQ67+0X7LrnP3ERD/mwjHYo+tuflUQN23pEy0LxzilGG3URpkUd/aACRzEdj2U4
 jkaKNOzoOTlIy1AHsXsXrIJ8pNyiqOU4KSSjv4PXwjgfKucyReHt6iSUDQMzj+ty5teFofjE
 4vAVLhCYh91MJjfnH8PJ0qzffFB2t1YFaYbZ0JwfIALt0w2Cetna+9BA==;
From: "A. Sverdlin" <alexander.sverdlin@siemens.com>
To: linux-leds@vger.kernel.org,
	devicetree@vger.kernel.org
Cc: Alexander Sverdlin <alexander.sverdlin@siemens.com>,
 dri-devel@lists.freedesktop.org, Lee Jones <lee@kernel.org>,
 Daniel Thompson <danielt@kernel.org>, Jingoo Han <jingoohan1@gmail.com>,
 Pavel Machek <pavel@ucw.cz>, Rob Herring <robh@kernel.org>,
 Krzysztof Kozlowski <krzk+dt@kernel.org>,
 Conor Dooley <conor+dt@kernel.org>, Andrew Davis <afd@ti.com>
Subject: [PATCH v3 0/2] leds: TI LP8864/LP8866 support
Date: Mon,  9 Dec 2024 09:45:52 +0100
Message-ID: <20241209084602.1199936-1-alexander.sverdlin@siemens.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Flowmailer-Platform: Siemens
Feedback-ID: 519:519-456497:519-21489:flowmailer
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

From: Alexander Sverdlin <alexander.sverdlin@siemens.com>

The series adds support for a family of Texas Instruments' automotive
high-efficiency LED drivers with boost controller. The four or six
high-precision current sinks support phase shifting that is automatically
adjusted based on the number of channels in use. LED brightness can be
controlled globally through the I2C interface or PWM input.

Add new DT bindings for ti,lp8864 to support all four software-compatible
devices:
- LP8864
- LP8864S
- LP8866
- LP8866S

Add leds class driver for these devices.

Alexander Sverdlin (2):
  dt-bindings: backlight: add TI LP8864/LP8866 LED-backlight drivers
  leds: lp8864: New driver

 .../bindings/leds/backlight/ti,lp8864.yaml    |  80 +++++
 MAINTAINERS                                   |   7 +
 drivers/leds/Kconfig                          |  12 +
 drivers/leds/Makefile                         |   1 +
 drivers/leds/leds-lp8864.c                    | 308 ++++++++++++++++++
 5 files changed, 408 insertions(+)
 create mode 100644 Documentation/devicetree/bindings/leds/backlight/ti,lp8864.yaml
 create mode 100644 drivers/leds/leds-lp8864.c

-- 
2.47.1

