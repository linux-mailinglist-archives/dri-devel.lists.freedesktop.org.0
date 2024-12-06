Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 48F6A9E7B0F
	for <lists+dri-devel@lfdr.de>; Fri,  6 Dec 2024 22:35:57 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 26B3510E036;
	Fri,  6 Dec 2024 21:35:54 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; secure) header.d=siemens.com header.i=alexander.sverdlin@siemens.com header.b="b4d8QRXz";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
X-Greylist: delayed 602 seconds by postgrey-1.36 at gabe;
 Fri, 06 Dec 2024 21:35:51 UTC
Received: from mta-65-226.siemens.flowmailer.net
 (mta-65-226.siemens.flowmailer.net [185.136.65.226])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 3946E10E036
 for <dri-devel@lists.freedesktop.org>; Fri,  6 Dec 2024 21:35:51 +0000 (UTC)
Received: by mta-65-226.siemens.flowmailer.net with ESMTPSA id
 20241206212546ababed1fe3a3bab799
 for <dri-devel@lists.freedesktop.org>;
 Fri, 06 Dec 2024 22:25:47 +0100
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; s=fm2;
 d=siemens.com; i=alexander.sverdlin@siemens.com;
 h=Date:From:Subject:To:Message-ID:MIME-Version:Content-Type:Content-Transfer-Encoding:Cc;
 bh=VGAi1Tip6Q2fjBl44Ct3hhDKQbzd+Zjis1nKE/QhpU0=;
 b=b4d8QRXzn9FuuCE3zqlVu44EwUimgwVe7VItQ6C6tI5T3mZKjoWdli/NcHkTyCdoQ2qnRu
 JDaNmcDjKbF3K0meM/DfHWlEJwjrs54K/J47u+AuyXZv5+x5nEgk5eWKpHM/MUttvRX362O1
 koa4HaEHDawYWq/COtBePJ4dMamoD9FN62g8VA78inIG3kwP3ZzakKZQHmnV6aZcOfPp6QSR
 sFX1Evod4YMLmziuE/GZy/v/FxuPVYzF3QoVLSYIcj3vrUtU8BWgWQNs1a+1L+iUAAdPzkxn
 i7CBBFSXC606rlxFi83c2wMWwtfnUNJs7pTIg8UYTx2D1dtz5RKNwrnQ==;
From: "A. Sverdlin" <alexander.sverdlin@siemens.com>
To: Dan Murphy <dmurphy@ti.com>, linux-leds@vger.kernel.org,
 devicetree@vger.kernel.org
Cc: Alexander Sverdlin <alexander.sverdlin@siemens.com>,
 dri-devel@lists.freedesktop.org, Lee Jones <lee@kernel.org>,
 Daniel Thompson <danielt@kernel.org>, Jingoo Han <jingoohan1@gmail.com>,
 Pavel Machek <pavel@ucw.cz>, Rob Herring <robh@kernel.org>,
 Krzysztof Kozlowski <krzk+dt@kernel.org>,
 Conor Dooley <conor+dt@kernel.org>, Andrew Davis <afd@ti.com>
Subject: [PATCH v2 0/2] leds: TI LP8864/LP8866 support
Date: Fri,  6 Dec 2024 22:24:17 +0100
Message-ID: <20241206212421.1132578-1-alexander.sverdlin@siemens.com>
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
 drivers/leds/leds-lp8864.c                    | 320 ++++++++++++++++++
 5 files changed, 420 insertions(+)
 create mode 100644 Documentation/devicetree/bindings/leds/backlight/ti,lp8864.yaml
 create mode 100644 drivers/leds/leds-lp8864.c

-- 
2.47.1

