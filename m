Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 38F6973ABA5
	for <lists+dri-devel@lfdr.de>; Thu, 22 Jun 2023 23:32:33 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 8443C10E587;
	Thu, 22 Jun 2023 21:32:25 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from relay8-d.mail.gandi.net (relay8-d.mail.gandi.net
 [IPv6:2001:4b98:dc4:8::228])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 0F04210E584
 for <dri-devel@lists.freedesktop.org>; Thu, 22 Jun 2023 21:32:19 +0000 (UTC)
X-GND-Sasl: miquel.raynal@bootlin.com
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=bootlin.com; s=gm1;
 t=1687469536;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding;
 bh=gI8+di2ZW7hiarP206gQ7pkYayhOYFiphXl+YOhjKug=;
 b=mn76xpPG5B4swl/xneRHROoUU2hzJOWfnoWgkO4Llr6pzI7Dl0lcOzROhlptFbO0F4r8Qw
 nlPAfWHisW9HLUhxFD+tAOF6l+vDNOB0h8zQQcKZ95RYdmwt4QPkaZsenB04KCZ6/mA9vP
 rX0WrVX9TmglJZHqSQ+jLMo+XKtdUmf/r/i3NnDrTxBIM1IPziS62wwo0E/+DNIqMCdeeU
 wj9GUr4cWcpEq+p5J0RA+XBe0urg8D1lX6NlRlD0WRmc+WOkukIMgUwc/LqsXc8xds7Bd9
 N+crD8M7Kb3UvaazD9QL4AYAEuUSV7VWlebSIXlI6MUryhx3TsEHROIWKcLrbw==
X-GND-Sasl: miquel.raynal@bootlin.com
X-GND-Sasl: miquel.raynal@bootlin.com
X-GND-Sasl: miquel.raynal@bootlin.com
X-GND-Sasl: miquel.raynal@bootlin.com
X-GND-Sasl: miquel.raynal@bootlin.com
X-GND-Sasl: miquel.raynal@bootlin.com
X-GND-Sasl: miquel.raynal@bootlin.com
X-GND-Sasl: miquel.raynal@bootlin.com
X-GND-Sasl: miquel.raynal@bootlin.com
X-GND-Sasl: miquel.raynal@bootlin.com
Received: by mail.gandi.net (Postfix) with ESMTPSA id 966C71BF204;
 Thu, 22 Jun 2023 21:32:14 +0000 (UTC)
From: Miquel Raynal <miquel.raynal@bootlin.com>
To: David Airlie <airlied@gmail.com>, Daniel Vetter <daniel@ffwll.ch>,
 dri-devel@lists.freedesktop.org, Thierry Reding <thierry.reding@gmail.com>,
 Mikko Perttunen <mperttunen@nvidia.com>
Subject: [PATCH v3 0/2] Small of/device cleanup
Date: Thu, 22 Jun 2023 23:32:12 +0200
Message-Id: <20230622213214.3586530-1-miquel.raynal@bootlin.com>
X-Mailer: git-send-email 2.34.1
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
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
Cc: devicetree@vger.kernel.org, Rob Herring <robh+dt@kernel.org>,
 Thomas Petazzoni <thomas.petazzoni@bootlin.com>,
 Miquel Raynal <miquel.raynal@bootlin.com>, linux-tegra@vger.kernel.org,
 Frank Rowand <frowand.list@gmail.com>
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

My previous attempt to slightly clean the OF core wrt device structures
was rather unsuccessful as the idea behind the discussed cleanup was
more impacting than what I thought, leading to most of the previous
series to be dropped. However, aside, two patches seemed actually
relevant, so here they are, alone.

Link: https://lore.kernel.org/all/20230608184903.GA3200973-robh@kernel.org/

Thanks,
Miquèl

Changes in v3:
* Fixed the dev->parent referencing in the host1x driver.
* Collected Rob's Acked-by.

Changes in v2:
* Dropped all the of_device.h/of_module.h changes
* Directly used of_device_uevent() from the host1x driver


Miquel Raynal (2):
  of: module: Export of_device_uevent()
  gpu: host1x: Stop open-coding of_device_uevent()

 drivers/gpu/host1x/bus.c | 29 ++++++-----------------------
 drivers/of/device.c      |  1 +
 2 files changed, 7 insertions(+), 23 deletions(-)

-- 
2.34.1

