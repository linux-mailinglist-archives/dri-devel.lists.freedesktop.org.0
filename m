Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 20D6B9F6F5D
	for <lists+dri-devel@lfdr.de>; Wed, 18 Dec 2024 22:18:44 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 8EEAD10E14A;
	Wed, 18 Dec 2024 21:18:40 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; secure) header.d=siemens.com header.i=alexander.sverdlin@siemens.com header.b="nd4T+smf";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
X-Greylist: delayed 602 seconds by postgrey-1.36 at gabe;
 Wed, 18 Dec 2024 21:18:37 UTC
Received: from mta-64-228.siemens.flowmailer.net
 (mta-64-228.siemens.flowmailer.net [185.136.64.228])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 9263C10E0BE
 for <dri-devel@lists.freedesktop.org>; Wed, 18 Dec 2024 21:18:37 +0000 (UTC)
Received: by mta-64-228.siemens.flowmailer.net with ESMTPSA id
 202412182108324fa3207ef44e88589d
 for <dri-devel@lists.freedesktop.org>;
 Wed, 18 Dec 2024 22:08:33 +0100
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; s=fm1;
 d=siemens.com; i=alexander.sverdlin@siemens.com;
 h=Date:From:Subject:To:Message-ID:MIME-Version:Content-Type:Content-Transfer-Encoding:Cc;
 bh=xps1rrCB3ezPJ4SU0woL1vnK1r7e4vQ0fCMaUaYxnw8=;
 b=nd4T+smfD0sdQa3oBs5N9xd4x7JVFIPhtIW8YVecNkzNJCP9ocrJ1scFeFSBf9veDUrqtG
 GrGX/+lPplSOpZSyuNn/mHJy1kyIF09mnf6PiymaYOjURmmnkFx45VMCckW/sADvr0Cp3XUx
 wvHRo/YucSOoTtI8a28YmEdY5uTsLfjQZIsVsoIHajXU0bcuRVeSlvBNnASRNU+/ZPK/6FFI
 V6VFi5qArIYL+cbnw0eeufukL0JD/4oEKnvP/OCWMFUJmcFs9uXlia+wltCeqIieMidgAk3X
 3r8NljmCwtu/07CR1CZBSGlHZAqXYd6Ck9xyqTY2PCl0p/hKxe6LLbrA==;
From: "A. Sverdlin" <alexander.sverdlin@siemens.com>
To: linux-leds@vger.kernel.org,
	devicetree@vger.kernel.org
Cc: Alexander Sverdlin <alexander.sverdlin@siemens.com>,
 dri-devel@lists.freedesktop.org, Lee Jones <lee@kernel.org>,
 Daniel Thompson <danielt@kernel.org>, Jingoo Han <jingoohan1@gmail.com>,
 Pavel Machek <pavel@ucw.cz>, Rob Herring <robh@kernel.org>,
 Krzysztof Kozlowski <krzk+dt@kernel.org>,
 Conor Dooley <conor+dt@kernel.org>, Andrew Davis <afd@ti.com>
Subject: [PATCH v5 0/2] leds: TI LP8864/LP8866 support
Date: Wed, 18 Dec 2024 22:08:25 +0100
Message-ID: <20241218210829.73191-1-alexander.sverdlin@siemens.com>
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
 drivers/leds/leds-lp8864.c                    | 296 ++++++++++++++++++
 5 files changed, 396 insertions(+)
 create mode 100644 Documentation/devicetree/bindings/leds/backlight/ti,lp8864.yaml
 create mode 100644 drivers/leds/leds-lp8864.c

-- 
2.47.1

