Return-Path: <dri-devel-bounces@lists.freedesktop.org>
Delivered-To: lists+dri-devel@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id cJiCBvEpnGl1AAQAu9opvQ
	(envelope-from <dri-devel-bounces@lists.freedesktop.org>)
	for <lists+dri-devel@lfdr.de>; Mon, 23 Feb 2026 11:20:33 +0100
X-Original-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id BCDCC174BDE
	for <lists+dri-devel@lfdr.de>; Mon, 23 Feb 2026 11:20:32 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id CDE8710E2DF;
	Mon, 23 Feb 2026 10:20:30 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=microchip.com header.i=@microchip.com header.b="vkq/ZuMC";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from esa.microchip.iphmx.com (esa.microchip.iphmx.com
 [68.232.154.123])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 7D2BE10E2DF
 for <dri-devel@lists.freedesktop.org>; Mon, 23 Feb 2026 10:20:29 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=microchip.com; i=@microchip.com; q=dns/txt; s=mchp;
 t=1771842029; x=1803378029;
 h=from:to:cc:subject:date:message-id:mime-version:
 content-transfer-encoding;
 bh=fxh20OoRIDIJw2Z8F3GMbn8xf8EQoWg+ERVhvDDIVg8=;
 b=vkq/ZuMCjxvJiOaqYnFA5ENiZgjr33FwZsrgG/mrhSsR5MWjALH4cFKu
 jj2JtczR+vhvAnKqVfo+3cwi0va2DJq3j7ExvRPfqIEA6coo+DHD96kfq
 7AVVH6wXQNhSO6Df31wCMhC5vrhIuOmb6m2KZMTr11WgfTN6Cpdldkz6T
 2oke+r1qfsehquZlp5SbGlOLkjs3ntb0syYeCIKO6xUgP9kfkidmAUwbZ
 Eka3UaxNUhgmAv3/oqDsM3QemNtKA39kndmCE1ye/KYZs+rAG87QCsLma
 zvdjqI8MlgueBfTGq+G0/Rwv6ilOsxc3S+iEq0wDJQ+A2ORsGVdWOxLZ1 Q==;
X-CSE-ConnectionGUID: xLxJrVz4SA+TZ2kb8t2UqQ==
X-CSE-MsgGUID: VwZNW30OScC7E8KufsFKmw==
X-IronPort-AV: E=Sophos;i="6.21,306,1763449200"; d="scan'208";a="220994669"
X-Amp-Result: SKIPPED(no attachment in message)
Received: from unknown (HELO email.microchip.com) ([170.129.1.10])
 by esa6.microchip.iphmx.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 23 Feb 2026 03:20:28 -0700
Received: from chn-vm-ex04.mchp-main.com (10.10.87.151) by
 chn-vm-ex4.mchp-main.com (10.10.87.33) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.2.2562.35; Mon, 23 Feb 2026 03:19:48 -0700
Received: from che-lt-i67131.microchip.com (10.10.85.11) by
 chn-vm-ex04.mchp-main.com (10.10.85.152) with Microsoft SMTP Server id
 15.1.2507.58 via Frontend Transport; Mon, 23 Feb 2026 03:19:43 -0700
From: Manikandan Muralidharan <manikandan.m@microchip.com>
To: <maarten.lankhorst@linux.intel.com>, <mripard@kernel.org>,
 <tzimmermann@suse.de>, <airlied@gmail.com>, <simona@ffwll.ch>,
 <nicolas.ferre@microchip.com>, <alexandre.belloni@bootlin.com>,
 <claudiu.beznea@tuxon.dev>, <lee@kernel.org>,
 <dri-devel@lists.freedesktop.org>, <linux-arm-kernel@lists.infradead.org>,
 <linux-kernel@vger.kernel.org>
CC: <manikandan.m@microchip.com>
Subject: [PATCH v3 0/4]  Add LVDS display support and PLL handling
Date: Mon, 23 Feb 2026 15:49:16 +0530
Message-ID: <20260223101920.284697-1-manikandan.m@microchip.com>
X-Mailer: git-send-email 2.25.1
MIME-Version: 1.0
Content-Type: text/plain; charset="y"
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
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>
X-Rspamd-Server: lfdr
X-Spamd-Result: default: False [-0.31 / 15.00];
	MID_CONTAINS_FROM(1.00)[];
	DMARC_POLICY_ALLOW(-0.50)[microchip.com,reject];
	R_SPF_ALLOW(-0.20)[+ip4:131.252.210.177:c];
	R_DKIM_ALLOW(-0.20)[microchip.com:s=mchp];
	MAILLIST(-0.20)[mailman];
	RWL_MAILSPIKE_GOOD(-0.10)[131.252.210.177:from];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	RCPT_COUNT_TWELVE(0.00)[13];
	RCVD_TLS_LAST(0.00)[];
	MIME_TRACE(0.00)[0:+];
	FORGED_RECIPIENTS(0.00)[m:maarten.lankhorst@linux.intel.com,m:mripard@kernel.org,m:tzimmermann@suse.de,m:airlied@gmail.com,m:simona@ffwll.ch,m:nicolas.ferre@microchip.com,m:alexandre.belloni@bootlin.com,m:claudiu.beznea@tuxon.dev,m:lee@kernel.org,m:linux-arm-kernel@lists.infradead.org,m:linux-kernel@vger.kernel.org,m:manikandan.m@microchip.com,s:lists@lfdr.de];
	ARC_NA(0.00)[];
	FREEMAIL_TO(0.00)[linux.intel.com,kernel.org,suse.de,gmail.com,ffwll.ch,microchip.com,bootlin.com,tuxon.dev,lists.freedesktop.org,lists.infradead.org,vger.kernel.org];
	FORGED_SENDER(0.00)[manikandan.m@microchip.com,dri-devel-bounces@lists.freedesktop.org];
	FORWARDED(0.00)[dri-devel@lists.freedesktop.org];
	FROM_HAS_DN(0.00)[];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	FORGED_SENDER_MAILLIST(0.00)[];
	RCVD_COUNT_FIVE(0.00)[5];
	TO_DN_NONE(0.00)[];
	FORGED_SENDER_FORWARDING(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[manikandan.m@microchip.com,dri-devel-bounces@lists.freedesktop.org];
	DKIM_TRACE(0.00)[microchip.com:+];
	PREVIOUSLY_DELIVERED(0.00)[dri-devel@lists.freedesktop.org];
	FORGED_RECIPIENTS_FORWARDING(0.00)[];
	NEURAL_HAM(-0.00)[-0.997];
	ASN(0.00)[asn:6366, ipnet:131.252.0.0/16, country:US];
	TAGGED_RCPT(0.00)[dri-devel];
	DBL_BLOCKED_OPENRESOLVER(0.00)[gabe.freedesktop.org:helo,gabe.freedesktop.org:rdns]
X-Rspamd-Queue-Id: BCDCC174BDE
X-Rspamd-Action: no action

Hi all,

This patch series adds LVDS display support for the Atmel HLCDC driver
and introduces ATMEL_XLCDC_CLKBYP flags and proper handling of the
LVDS PLL clock required for such panels.

The Atmel XLCDC IP supports multiple output types — Parallel RGB, MIPI
DSI, and LVDS. While the existing implementation handles RGB and MIPI
displays using the LCD generic clock (sys_clk), LVDS panels require the
dedicated LVDS PLL clock (lvds_pll_clk).Configuring the LVDS PLL clock
rate automatically based on the panel pixel clock, eliminates the need
for assigned-clock-rates entries in the device tree

Change logs are mentioned in individual patches

Dharma Balasubiramani (1):
  drm: atmel-hlcdc: configure LVDS PLL clock rate for LVDS Displays

Manikandan Muralidharan (3):
  mfd: atmel-hlcdc: fetch LVDS PLL clock for LVDS display
  drm: atmel-hlcdc: bypass clock divider for LVDS displays
  drm: atmel-hlcdc: add support for LVDS output formats

 .../gpu/drm/atmel-hlcdc/atmel_hlcdc_crtc.c    | 139 +++++++++++++-----
 drivers/mfd/atmel-hlcdc.c                     |  13 +-
 include/linux/mfd/atmel-hlcdc.h               |   2 +
 3 files changed, 118 insertions(+), 36 deletions(-)

-- 
2.25.1

