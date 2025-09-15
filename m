Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id EFEBBB57655
	for <lists+dri-devel@lfdr.de>; Mon, 15 Sep 2025 12:31:16 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 5CA1710E2CC;
	Mon, 15 Sep 2025 10:31:15 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (1024-bit key; unprotected) header.d=ti.com header.i=@ti.com header.b="fv5zLu5D";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from fllvem-ot04.ext.ti.com (fllvem-ot04.ext.ti.com [198.47.19.246])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 55E1410E2CC
 for <dri-devel@lists.freedesktop.org>; Mon, 15 Sep 2025 10:31:13 +0000 (UTC)
Received: from lelvem-sh02.itg.ti.com ([10.180.78.226])
 by fllvem-ot04.ext.ti.com (8.15.2/8.15.2) with ESMTP id 58FAUpuR1475186;
 Mon, 15 Sep 2025 05:30:51 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ti.com;
 s=ti-com-17Q1; t=1757932251;
 bh=TxCEGkPcqU0f/GCFbh3VHVF++0uz4F0w16GZ6D91CRo=;
 h=From:To:CC:Subject:Date;
 b=fv5zLu5DtLlgvtJC1SrHCnvX1LXAB/p3OQZY9ACrtWl210dJfsjvRT1T+Bozq952m
 0TjgDMmpJylYFbddgYTpQFJmvieZM+BjkNC2fLUts807gzA6hFdM0dUMRt93ndEDWW
 VjjfpdxwlrXjYlZq3TQ+UF0lVVCez2J9Uxmc0+bY=
Received: from DFLE115.ent.ti.com (dfle115.ent.ti.com [10.64.6.36])
 by lelvem-sh02.itg.ti.com (8.18.1/8.18.1) with ESMTPS id 58FAUo333894146
 (version=TLSv1.2 cipher=ECDHE-RSA-AES128-SHA256 bits=128 verify=FAIL);
 Mon, 15 Sep 2025 05:30:50 -0500
Received: from DFLE204.ent.ti.com (10.64.6.62) by DFLE115.ent.ti.com
 (10.64.6.36) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id 15.1.2507.55; Mon, 15
 Sep 2025 05:30:50 -0500
Received: from lelvem-mr06.itg.ti.com (10.180.75.8) by DFLE204.ent.ti.com
 (10.64.6.62) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.2562.20 via Frontend
 Transport; Mon, 15 Sep 2025 05:30:50 -0500
Received: from hkshenoy.dhcp.ti.com (hkshenoy.dhcp.ti.com [172.24.235.208]
 (may be forged))
 by lelvem-mr06.itg.ti.com (8.18.1/8.18.1) with ESMTP id 58FAUfRd3600864;
 Mon, 15 Sep 2025 05:30:42 -0500
From: Harikrishna Shenoy <h-shenoy@ti.com>
To: <andrzej.hajda@intel.com>, <neil.armstrong@linaro.org>, <rfoss@kernel.org>,
 <Laurent.pinchart@ideasonboard.com>, <jonas@kwiboo.se>,
 <jernej.skrabec@gmail.com>, <airlied@gmail.com>, <simona@ffwll.ch>,
 <maarten.lankhorst@linux.intel.com>, <mripard@kernel.org>,
 <tzimmermann@suse.de>, <robh@kernel.org>, <krzk+dt@kernel.org>,
 <conor+dt@kernel.org>, <sjakhade@cadence.com>, <yamonkar@cadence.com>,
 <lumag@kernel.org>, <dianders@chromium.org>, <jani.nikula@intel.com>,
 <luca.ceresoli@bootlin.com>, <andy.yan@rock-chips.com>,
 <dri-devel@lists.freedesktop.org>, <devicetree@vger.kernel.org>,
 <linux-kernel@vger.kernel.org>, <devarsht@ti.com>, <u-kumar1@ti.com>,
 <s-jain1@ti.com>, <tomi.valkeinen@ideasonboard.com>
CC: <h-shenoy@ti.com>
Subject: [PATCH v5 0/2] Add support for DSC and FEC for cadence MHDP8546 bridge
Date: Mon, 15 Sep 2025 16:00:39 +0530
Message-ID: <20250915103041.3891448-1-h-shenoy@ti.com>
X-Mailer: git-send-email 2.34.1
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-C2ProcessedOrg: 333ef613-75bf-4e12-a4b1-8e3623f5dcea
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

Hi all,

This patch series extends the Cadence MHDP8546 DisplayPort bridge
driver to support Display Stream Compression (DSC) and Forward Error
Correction (FEC).

DSC acts as an encoder block: when the sink reports DSC capability,
the DPI input stream to the MHDP8546 TX is compressed, and the sink
decodes the stream for display.

The first patch updates the DT binding to add register-space for DSC.
The second patch implements the corresponding driver changes to enable
DSC and FEC when advertised by the sink and configured via DT.

Link: https://www.ti.com/lit/zip/spruil1
TRM File: SPRUIL_DRA829_TDA4VM_Technical Reference Manual.pdf 
(Figure 12-1115 and DSC related sections) 


Changelog v4 -> v5:
-Defining reg-names item list in iF conditional, added 
description for reg-names.
-Verified the bindings with cdns,mhdp8546 compatible.
-Add code for enabling DSC in bridge driver.
Log link-
<https://gist.github.com/h-shenoy/0318e2c6e7df539e6bdd39b77e5a8f05> 
Link to v4: 
<https://lore.kernel.org/all/20250909054622.1439487-1-h-shenoy@ti.com>


Swapnil Jakhade (2):
  dt-bindings: drm/bridge: MHDP8546 bridge binding changes for DSC
  drm: bridge: cdns-mhdp8546: Add support for DSC and FEC

 .../display/bridge/cdns,mhdp8546.yaml         |  24 +-
 drivers/gpu/drm/bridge/cadence/Makefile       |   2 +-
 .../drm/bridge/cadence/cdns-mhdp8546-core.c   | 367 ++++++++-
 .../drm/bridge/cadence/cdns-mhdp8546-core.h   |  68 ++
 .../drm/bridge/cadence/cdns-mhdp8546-dsc.c    | 695 ++++++++++++++++++
 .../drm/bridge/cadence/cdns-mhdp8546-dsc.h    | 285 +++++++
 6 files changed, 1406 insertions(+), 35 deletions(-)
 create mode 100644 drivers/gpu/drm/bridge/cadence/cdns-mhdp8546-dsc.c
 create mode 100644 drivers/gpu/drm/bridge/cadence/cdns-mhdp8546-dsc.h

-- 
2.34.1

