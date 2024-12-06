Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 1C2AE9E76DF
	for <lists+dri-devel@lfdr.de>; Fri,  6 Dec 2024 18:18:54 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 5DA1910F142;
	Fri,  6 Dec 2024 17:18:47 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; secure) header.d=siemens.com header.i=alexander.sverdlin@siemens.com header.b="P09x5WrM";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
X-Greylist: delayed 602 seconds by postgrey-1.36 at gabe;
 Fri, 06 Dec 2024 17:18:44 UTC
Received: from mta-64-225.siemens.flowmailer.net
 (mta-64-225.siemens.flowmailer.net [185.136.64.225])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 90A9610E40A
 for <dri-devel@lists.freedesktop.org>; Fri,  6 Dec 2024 17:18:44 +0000 (UTC)
Received: by mta-64-225.siemens.flowmailer.net with ESMTPSA id
 2024120617083931e95d1dd7ec8766e8
 for <dri-devel@lists.freedesktop.org>;
 Fri, 06 Dec 2024 18:08:40 +0100
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; s=fm2;
 d=siemens.com; i=alexander.sverdlin@siemens.com;
 h=Date:From:Subject:To:Message-ID:MIME-Version:Content-Type:Content-Transfer-Encoding:Cc;
 bh=B5HjcpprEx98dJUDojMaPd2m0E7QHD4EvFWFVtuTv6s=;
 b=P09x5WrMj2xriIbXq8qjVn5I7aEDhPz6lksS1y0lav9QU4U/rlBJA/02KXGO9EJECKExzq
 oW3y5baS913wZqAtfRSPAU1Y/Cx+88flJsngrOH1fqLea6POT6oPnt1hvy45BRqeipIVd6pF
 BMiE6l/dBq62RKOWz8hi9YAPNrbxT8F5D5+rtDvHAfbSsINGULym49x3T6tprPgRtnPEx/fE
 LVgI83aqhkX1Qu7ig+nBk81V3D+hBi+oAZ9avqsXW9Oh0FDHQEvuk26adK16c4BKlqC9MW1F
 0Tf9qHzc8lamhYYR3UVdOHA5ib45TOpeZUO+m3JrxfipBdBj3d4zCFJQ==;
From: "A. Sverdlin" <alexander.sverdlin@siemens.com>
To: Dan Murphy <dmurphy@ti.com>, linux-leds@vger.kernel.org,
 devicetree@vger.kernel.org
Cc: Alexander Sverdlin <alexander.sverdlin@siemens.com>,
 dri-devel@lists.freedesktop.org, Lee Jones <lee@kernel.org>,
 Daniel Thompson <danielt@kernel.org>, Jingoo Han <jingoohan1@gmail.com>,
 Pavel Machek <pavel@ucw.cz>, Rob Herring <robh@kernel.org>,
 Krzysztof Kozlowski <krzk+dt@kernel.org>,
 Conor Dooley <conor+dt@kernel.org>, Andrew Davis <afd@ti.com>
Subject: [PATCH 0/2] leds: TI LP8864/LP8866 support
Date: Fri,  6 Dec 2024 18:07:11 +0100
Message-ID: <20241206170717.1090206-1-alexander.sverdlin@siemens.com>
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

Add new DT compatible ti,lp8864 to support all four software-compatible
devices:
- LP8864
- LP8864S
- LP8866
- LP8866S
This is a new family with a functionality similar to LP8860 -- hence the
same (re-used) DT bindings. They had to be converted to YAML along the way.

Add the new driver for the above four chips. Despite similar functionality,
the I2C interface is completely different to LP8860 -- hence the separate
driver.

Alexander Sverdlin (2):
  dt-bindings: backlight: Convert LP8860 into YAML format adding LP886x
  leds: lp8864: New driver

 .../bindings/leds/backlight/ti,lp8860.yaml    |  86 +++++
 .../devicetree/bindings/leds/leds-lp8860.txt  |  50 ---
 MAINTAINERS                                   |   7 +
 drivers/leds/Kconfig                          |  12 +
 drivers/leds/Makefile                         |   1 +
 drivers/leds/leds-lp8864.c                    | 320 ++++++++++++++++++
 6 files changed, 426 insertions(+), 50 deletions(-)
 create mode 100644 Documentation/devicetree/bindings/leds/backlight/ti,lp8860.yaml
 delete mode 100644 Documentation/devicetree/bindings/leds/leds-lp8860.txt
 create mode 100644 drivers/leds/leds-lp8864.c

-- 
2.47.1

