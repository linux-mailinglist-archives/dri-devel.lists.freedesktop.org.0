Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 6FBE39AE1F0
	for <lists+dri-devel@lfdr.de>; Thu, 24 Oct 2024 12:02:39 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id B1CE010E253;
	Thu, 24 Oct 2024 10:02:36 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=bootlin.com header.i=@bootlin.com header.b="GcgtHokA";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mslow1.mail.gandi.net (mslow1.mail.gandi.net [217.70.178.240])
 by gabe.freedesktop.org (Postfix) with ESMTPS id DEA2A10E902
 for <dri-devel@lists.freedesktop.org>; Thu, 24 Oct 2024 10:02:34 +0000 (UTC)
Received: from relay2-d.mail.gandi.net (unknown [217.70.183.194])
 by mslow1.mail.gandi.net (Postfix) with ESMTP id 0714AC361A
 for <dri-devel@lists.freedesktop.org>; Thu, 24 Oct 2024 09:55:46 +0000 (UTC)
Received: by mail.gandi.net (Postfix) with ESMTPA id E18204000D;
 Thu, 24 Oct 2024 09:55:41 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=bootlin.com; s=gm1;
 t=1729763743;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding;
 bh=kVh3RAUGV0AsPGkHBiPjmnI9pe+etqepuArNr0UCyaw=;
 b=GcgtHokAsUhrOypgaGvd6A+DDaygYsC2sqExlIkcNunOmR+VhSIGdGEU9YYy4LXziros/z
 noBJ8bGnh9oj5EHoL1uYDB1+7yhSJRvIgEzkZn/D/7T4tg5HhM2PZwlbTUNQs30KMAA5cn
 D1pmVLlSSYhw/U7YRb6uDlMQo99Q1TYCSAd6owpPRJFCr9kjZitDp/R5jF96XeD3a5Fe/x
 CyIe727NiIg8QPUU881t2L1+5o+44WAxOb7bAx0snNsjCoq4SYZ0mdZhwyWysx6P9fhxa2
 lcAYChZHg2lJE5ZJbm9iW+34r4VuCq1axVNvcxaNUP8VR0HDKR1O3ztA0oh0ZA==
From: Herve Codina <herve.codina@bootlin.com>
To: Andrzej Hajda <andrzej.hajda@intel.com>,
 Neil Armstrong <neil.armstrong@linaro.org>, Robert Foss <rfoss@kernel.org>,
 Laurent Pinchart <Laurent.pinchart@ideasonboard.com>,
 Jonas Karlman <jonas@kwiboo.se>, Jernej Skrabec <jernej.skrabec@gmail.com>,
 David Airlie <airlied@gmail.com>, Simona Vetter <simona@ffwll.ch>,
 Maarten Lankhorst <maarten.lankhorst@linux.intel.com>,
 Maxime Ripard <mripard@kernel.org>,
 Thomas Zimmermann <tzimmermann@suse.de>, Rob Herring <robh@kernel.org>,
 Krzysztof Kozlowski <krzk+dt@kernel.org>,
 Conor Dooley <conor+dt@kernel.org>, Marek Vasut <marex@denx.de>
Cc: dri-devel@lists.freedesktop.org, devicetree@vger.kernel.org,
 linux-kernel@vger.kernel.org, Luca Ceresoli <luca.ceresoli@bootlin.com>,
 Thomas Petazzoni <thomas.petazzoni@bootlin.com>,
 Herve Codina <herve.codina@bootlin.com>
Subject: [PATCH 0/2] Add support for errors recovery in the TI SN65DSI83
 bridge driver
Date: Thu, 24 Oct 2024 11:55:36 +0200
Message-ID: <20241024095539.1637280-1-herve.codina@bootlin.com>
X-Mailer: git-send-email 2.46.2
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-GND-Sasl: herve.codina@bootlin.com
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

Hi,

Usually the TI SN65DSI83 recovers from error by itself but during ESD
tests, we have some cases where the TI SN65DSI83 didn't recover.

In order to handle those cases, this series adds support for a recovery
mechanism.

Best regards,
Hervé Codina

Herve Codina (2):
  dt-bindings: display: bridge: sn65dsi83: Add interrupt
  drm: bridge: ti-sn65dsi83: Add error recovery mechanism

 .../bindings/display/bridge/ti,sn65dsi83.yaml |   3 +
 drivers/gpu/drm/bridge/ti-sn65dsi83.c         | 128 ++++++++++++++++++
 2 files changed, 131 insertions(+)

-- 
2.46.2

