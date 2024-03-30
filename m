Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 172E7892BA5
	for <lists+dri-devel@lfdr.de>; Sat, 30 Mar 2024 16:00:34 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 07A8B10E87A;
	Sat, 30 Mar 2024 15:00:30 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=fail reason="signature verification failed" (2048-bit key; unprotected) header.d=paroga.com header.i=@paroga.com header.b="nOC60pI5";
	dkim=fail reason="signature verification failed" (2048-bit key) header.d=paroga.com header.i=@paroga.com header.b="nOC60pI5";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mx208.easyname.com (mx208.easyname.com [212.232.28.126])
 by gabe.freedesktop.org (Postfix) with ESMTPS id D457010E898
 for <dri-devel@lists.freedesktop.org>; Sat, 30 Mar 2024 15:00:16 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=paroga.com; 
 s=easyname;
 h=Content-Transfer-Encoding:MIME-Version:Message-ID:Date:Subject
 :Cc:To:From:Sender:Reply-To:Content-Type:Content-ID:Content-Description:
 Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
 In-Reply-To:References:List-Id:List-Help:List-Unsubscribe:List-Subscribe:
 List-Post:List-Owner:List-Archive;
 bh=7WBh3tTpWzmwiZVjvRLHfAhzBGmiAs9iajNkG57wSgw=; b=nOC60pI5iAYu2Ji1JyfJOd+Vqa
 Sjuuewo6IujElqVmhPfmZPx0acNyn0EHP3/0j6zujCcTshJJY81CfnNuP/Jy5EYX4VDkU/04+wNsw
 yd/Mj5gceiPKQNGn3Se/29Kz7Mr873EMAO5cOlIhqJjo0LvepSQ3Csm7CJ0oRTg1WfIAxID7xuMMb
 HhZ7wpgTHMsqruyc0fKB4iFccSlWCrTnq6pdmQ9vQe+YHNJCvcDz3iyKQnmK5loJvTHju6emAf4bu
 yi0NTFAEadvEzPFZuH6GVdBnOLbSjNwoB9fSdf1sSFeJnLT8hBv+5GFT9ZAUImy0MVgPcUWGz9BPG
 jp1SMjgw==;
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=paroga.com; 
 s=easyname;
 h=Content-Transfer-Encoding:MIME-Version:Message-ID:Date:Subject
 :Cc:To:From:Sender:Reply-To:Content-Type:Content-ID:Content-Description:
 Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
 In-Reply-To:References:List-Id:List-Help:List-Unsubscribe:List-Subscribe:
 List-Post:List-Owner:List-Archive;
 bh=7WBh3tTpWzmwiZVjvRLHfAhzBGmiAs9iajNkG57wSgw=; b=nOC60pI5iAYu2Ji1JyfJOd+Vqa
 Sjuuewo6IujElqVmhPfmZPx0acNyn0EHP3/0j6zujCcTshJJY81CfnNuP/Jy5EYX4VDkU/04+wNsw
 yd/Mj5gceiPKQNGn3Se/29Kz7Mr873EMAO5cOlIhqJjo0LvepSQ3Csm7CJ0oRTg1WfIAxID7xuMMb
 HhZ7wpgTHMsqruyc0fKB4iFccSlWCrTnq6pdmQ9vQe+YHNJCvcDz3iyKQnmK5loJvTHju6emAf4bu
 yi0NTFAEadvEzPFZuH6GVdBnOLbSjNwoB9fSdf1sSFeJnLT8hBv+5GFT9ZAUImy0MVgPcUWGz9BPG
 jp1SMjgw==;
Received: from 84-115-225-203.cable.dynamic.surfer.at ([84.115.225.203]
 helo=localhost.localdomain)
 by mx.easyname.com with esmtpsa (TLSv1.3:TLS_AES_256_GCM_SHA384:256)
 (Exim 4.92) (envelope-from <paroga@paroga.com>)
 id 1rqaBl-0002RN-8H; Sat, 30 Mar 2024 15:00:13 +0000
From: Patrick Gansterer <paroga@paroga.com>
To: dri-devel@lists.freedesktop.org, linux-leds@vger.kernel.org,
 devicetree@vger.kernel.org, linux-kernel@vger.kernel.org,
 linux-fbdev@vger.kernel.org
Cc: Patrick Gansterer <paroga@paroga.com>, Lee Jones <lee@kernel.org>,
 Daniel Thompson <daniel.thompson@linaro.org>,
 Jingoo Han <jingoohan1@gmail.com>, Pavel Machek <pavel@ucw.cz>,
 Rob Herring <robh@kernel.org>,
 Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>,
 Conor Dooley <conor+dt@kernel.org>, Helge Deller <deller@gmx.de>,
 Sam Ravnborg <sam@ravnborg.org>
Subject: [PATCH v5 0/2] backlight: Add new lm3509 backlight driver
Date: Sat, 30 Mar 2024 15:59:23 +0100
Message-ID: <20240330145931.729116-1-paroga@paroga.com>
X-Mailer: git-send-email 2.44.0
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Easy-Autoreply: EN
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

This is a general driver for LM3509 backlight chip of TI.
LM3509 is High Efficiency Boost for White LEDs and/or OLED Displays with
Dual Current Sinks. This driver supports OLED/White LED select, brightness
control and sub/main control.
The datasheet can be found at http://www.ti.com/product/lm3509.
---
Changes in v5:
  Renamed lm3509_bl_led_pdata to lm3509_bl_led_data
  Set backlight_properties.scale to BACKLIGHT_SCALE_NON_LINEAR
  Add dev_err_probe() for first write to a register
  Use dev_err_probe() instead of dev_err()

v4: https://lore.kernel.org/all/20240310135344.3455294-1-paroga@paroga.com/

Changes in v4:
  Use backlight_*() to access backlight_device
  Do not set backlight_properties.power

v3: https://lore.kernel.org/all/20240309132521.1290173-1-paroga@paroga.com/

Changes in v3:
  Improved device tree bindings documentation

v2: https://lore.kernel.org/all/20240308215617.1729664-1-paroga@paroga.com/

Changes in v2:
  Add device tree nodes for each output
  Addressed multiple smaller review comments

v1: https://lore.kernel.org/all/20240302212757.1871164-1-paroga@paroga.com/

Patrick Gansterer (2):
  dt-bindings: backlight: Add Texas Instruments LM3509
  backlight: Add new lm3509 backlight driver

 .../bindings/leds/backlight/ti,lm3509.yaml    | 139 +++++++
 drivers/video/backlight/Kconfig               |   7 +
 drivers/video/backlight/Makefile              |   1 +
 drivers/video/backlight/lm3509_bl.c           | 340 ++++++++++++++++++
 4 files changed, 487 insertions(+)
 create mode 100644 Documentation/devicetree/bindings/leds/backlight/ti,lm3509.yaml
 create mode 100644 drivers/video/backlight/lm3509_bl.c

-- 
2.44.0

