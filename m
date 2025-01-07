Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 2B13EA03B7E
	for <lists+dri-devel@lfdr.de>; Tue,  7 Jan 2025 10:50:12 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 2433B10E1BA;
	Tue,  7 Jan 2025 09:50:09 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=tq-group.com header.i=@tq-group.com header.b="SN8c4YGx";
	dkim=fail reason="key not found in DNS" (0-bit key; unprotected) header.d=ew.tq-group.com header.i=@ew.tq-group.com header.b="LLx2ow89";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mx1.tq-group.com (mx1.tq-group.com [93.104.207.81])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 04AA710E1BA
 for <dri-devel@lists.freedesktop.org>; Tue,  7 Jan 2025 09:50:06 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=tq-group.com; i=@tq-group.com; q=dns/txt; s=key1;
 t=1736243407; x=1767779407;
 h=from:to:cc:subject:date:message-id:mime-version:
 content-transfer-encoding;
 bh=PcRc8LgBBacdtMgCc7Ma6Y3V6HlZ1g1g93eqellQlQc=;
 b=SN8c4YGxRbUQGTI351RFA7y+mCteDTQ1mD6XPAG5/mwPMlkBynXJSr6X
 UHgBNT4RptzSOCaTK3kuu3CXx859hE6FB+CUFgvWgmXHs4NQ0dkAz3kQn
 khEeNmbvWWZGZb04IhCZjatuLOsTThIoTuHT6BilIDHxP5yApMXlZq583
 szM0ZWyqwE2ky3UXlmrAlabykK2LLIOq0EIIR3kkKoDwHt++yz4UvAUXd
 CFY2dD3qXad5q+E0rgjz4tONUsG3t+0MxAIEzYqkqxEFF5kA+LqSIZ0kt
 aJSvBaRW/lLyU9eYoq2fS3OE8AiAuRDhGzOq1URb1fjq5IHgiQC9thL4y Q==;
X-CSE-ConnectionGUID: l89s+UkTQN+ueLLX4NvYZQ==
X-CSE-MsgGUID: K6k3wwvwQbaOpsw6apa6vA==
X-IronPort-AV: E=Sophos;i="6.12,295,1728943200"; d="scan'208";a="40889014"
Received: from vmailcow01.tq-net.de ([10.150.86.48])
 by mx1.tq-group.com with ESMTP; 07 Jan 2025 10:50:05 +0100
X-CheckPoint: {677CF8CD-13-1647E5E1-CA16D1A6}
X-MAIL-CPID: E34F364A6D90C75BD1DDCF5165584C53_2
X-Control-Analysis: str=0001.0A682F27.677CF8CD.009A, ss=1, re=0.000, recu=0.000,
 reip=0.000, cl=1, cld=1, fgs=0
Received: from [127.0.0.1] (localhost [127.0.0.1]) by localhost (Mailerdaemon)
 with ESMTPSA id 225FC163FA3; Tue,  7 Jan 2025 10:49:56 +0100 (CET)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ew.tq-group.com;
 s=dkim; t=1736243400;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:
 content-transfer-encoding:content-transfer-encoding;
 bh=PcRc8LgBBacdtMgCc7Ma6Y3V6HlZ1g1g93eqellQlQc=;
 b=LLx2ow89MHuHd9LpAlM4yq0HD29ldcNyTMzcvUSFhgjGBjiN+6zBw6XtgZGQrJffzZZX2k
 Cl5gh+qHs7IllTCWcOnlCGen5amj0/s7x0HVs6SyAecQ11yHLIC+QrGngkRHkU5jx07S6K
 uR1+txFkYrxxSECqiEMrqbdND7BcOd1ZjDoeEjYlSMfQF25pioOqHbss7tZI3jIz1Z+ia7
 uua1HxPKNH5asorsbOah3i4P5vJku95aD1HCfVXbd+XdwyO2sV16mdPffmAAwdu5BcDEVp
 ynixKC1yEclGFixz4SE+6slCjYMLy2uj+qKU8ajpCSVfyMKXOdQ2vBcpBYX2Hw==
From: Alexander Stein <alexander.stein@ew.tq-group.com>
To: Inki Dae <inki.dae@samsung.com>, Jagan Teki <jagan@amarulasolutions.com>,
 Marek Szyprowski <m.szyprowski@samsung.com>,
 Andrzej Hajda <andrzej.hajda@intel.com>,
 Neil Armstrong <neil.armstrong@linaro.org>, Robert Foss <rfoss@kernel.org>,
 Laurent Pinchart <Laurent.pinchart@ideasonboard.com>,
 Jonas Karlman <jonas@kwiboo.se>, Jernej Skrabec <jernej.skrabec@gmail.com>,
 David Airlie <airlied@gmail.com>, Simona Vetter <simona@ffwll.ch>,
 Maarten Lankhorst <maarten.lankhorst@linux.intel.com>,
 Maxime Ripard <mripard@kernel.org>,
 Thomas Zimmermann <tzimmermann@suse.de>, Rob Herring <robh@kernel.org>,
 Krzysztof Kozlowski <krzk+dt@kernel.org>,
 Conor Dooley <conor+dt@kernel.org>, Shawn Guo <shawnguo@kernel.org>,
 Sascha Hauer <s.hauer@pengutronix.de>,
 Pengutronix Kernel Team <kernel@pengutronix.de>,
 Fabio Estevam <festevam@gmail.com>
Cc: Alexander Stein <alexander.stein@ew.tq-group.com>,
 dri-devel@lists.freedesktop.org, devicetree@vger.kernel.org,
 linux-kernel@vger.kernel.org, imx@lists.linux.dev,
 linux-arm-kernel@lists.infradead.org
Subject: [PATCH 0/2] i.MX7 DT fixes
Date: Tue,  7 Jan 2025 10:49:40 +0100
Message-Id: <20250107094943.518474-1-alexander.stein@ew.tq-group.com>
X-Mailer: git-send-email 2.34.1
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Last-TLS-Session-Version: TLSv1.3
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

this fixes two dtbs_check warnings by moving the video muxing node out of gpr
and adding a new imx7 specific DSI compatible to DT schema.

Best regards,
Alexander

Alexander Stein (2):
  ARM: dts: imx7s: Move csi-mux to below root
  dt-bindings: samsung,mipi-dsim: Add imx7d specific compatible

 .../display/bridge/samsung,mipi-dsim.yaml     |  4 +-
 arch/arm/boot/dts/nxp/imx/imx7s.dtsi          | 56 +++++++++----------
 2 files changed, 31 insertions(+), 29 deletions(-)

-- 
2.34.1

