Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id EE29BA2A2E4
	for <lists+dri-devel@lfdr.de>; Thu,  6 Feb 2025 09:05:32 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 01BCA10E7ED;
	Thu,  6 Feb 2025 08:05:30 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (1024-bit key; unprotected) header.d=ti.com header.i=@ti.com header.b="btTndPV0";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
X-Greylist: delayed 611 seconds by postgrey-1.36 at gabe;
 Wed, 05 Feb 2025 12:01:08 UTC
Received: from fllvem-ot03.ext.ti.com (fllvem-ot03.ext.ti.com [198.47.19.245])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 7DC3D10E1B1
 for <dri-devel@lists.freedesktop.org>; Wed,  5 Feb 2025 12:01:08 +0000 (UTC)
Received: from fllv0035.itg.ti.com ([10.64.41.0])
 by fllvem-ot03.ext.ti.com (8.15.2/8.15.2) with ESMTPS id 515BoYGR3346430
 (version=TLSv1.2 cipher=DHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
 Wed, 5 Feb 2025 05:50:34 -0600
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ti.com;
 s=ti-com-17Q1; t=1738756234;
 bh=bHCZ6vkj1ClCs8UR+jdgMTD+0c/16hW0zlTlJVeP+oI=;
 h=From:To:Subject:Date;
 b=btTndPV07351tRAU28suYdXTRJYnTiPCBsaBpQ0nqtmcdQu7GXuRuSjmaLX8SbokC
 aFQhwHrnGB/UVEh4dAiXnBEXArbE72eBqruVvEyHN03UKaJuG2FUaIBv/d+tqro238
 roqk0USV4pZcJh1EnoJ+BLknQr6Od10z8uRsFC2E=
Received: from DLEE104.ent.ti.com (dlee104.ent.ti.com [157.170.170.34])
 by fllv0035.itg.ti.com (8.15.2/8.15.2) with ESMTPS id 515BoYmI031815
 (version=TLSv1.2 cipher=AES256-GCM-SHA384 bits=256 verify=FAIL);
 Wed, 5 Feb 2025 05:50:34 -0600
Received: from DLEE102.ent.ti.com (157.170.170.32) by DLEE104.ent.ti.com
 (157.170.170.34) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id 15.1.2507.23; Wed, 5
 Feb 2025 05:50:33 -0600
Received: from lelvsmtp5.itg.ti.com (10.180.75.250) by DLEE102.ent.ti.com
 (157.170.170.32) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id 15.1.2507.23 via
 Frontend Transport; Wed, 5 Feb 2025 05:50:33 -0600
Received: from hkshenoy.dhcp.ti.com (hkshenoy.dhcp.ti.com [172.24.227.96])
 by lelvsmtp5.itg.ti.com (8.15.2/8.15.2) with ESMTP id 515BoPCh043245;
 Wed, 5 Feb 2025 05:50:26 -0600
From: Harikrishna Shenoy <h-shenoy@ti.com>
To: <andrzej.hajda@intel.com>, <neil.armstrong@linaro.org>, <rfoss@kernel.org>,
 <Laurent.pinchart@ideasonboard.com>, <jonas@kwiboo.se>,
 <jernej.skrabec@gmail.com>, <simona@ffwll.ch>,
 <maarten.lankhorst@linux.intel.com>, <mripard@kernel.org>,
 <tzimmermann@suse.de>, <robh@kernel.org>, <krzk+dt@kernel.org>,
 <conor+dt@kernel.org>, <jani.nikula@intel.com>, <j-choudhary@ti.com>,
 <sui.jingfeng@linux.dev>, <viro@zeniv.linux.org.uk>,
 <r-ravikumar@ti.com>, <sjakhade@cadence.com>, <yamonkar@cadence.com>,
 <dri-devel@lists.freedesktop.org>, <devicetree@vger.kernel.org>,
 <linux-kernel@vger.kernel.org>
Subject: [PATCH v3 0/2] "no-hpd" support in CDNS DP bridge driver
Date: Wed, 5 Feb 2025 17:20:23 +0530
Message-ID: <20250205115025.3133487-1-h-shenoy@ti.com>
X-Mailer: git-send-email 2.34.1
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-C2ProcessedOrg: 333ef613-75bf-4e12-a4b1-8e3623f5dcea
X-Mailman-Approved-At: Thu, 06 Feb 2025 08:05:28 +0000
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

In J721s2 EVM, DP0 HPD is not connected to correct HPD pin on SOC
which results in HPD detect as always connnected, so when display
is not connected driver continuously retries to read EDID and DPCD
registers.

To handle such cases add support for no hpd configuration in
cdns-mhdp driver.

Changelog v2->v3:
- update the mhdp->plugged status for no hpd configuration in
cdns_mhdp_bridge_detect()

Link to v2: 
<https://lore.kernel.org/all/20230406015207.GO9915@pendragon.ideasonboard.com/>

Rahul T R (2):
  dt-bindings: drm/bridge: Add no-hpd property
  drm: bridge: cdns-mhdp8546: Add support for no-hpd

 .../display/bridge/cdns,mhdp8546.yaml         |  6 +++
 .../drm/bridge/cadence/cdns-mhdp8546-core.c   | 54 ++++++++++++++++---
 .../drm/bridge/cadence/cdns-mhdp8546-core.h   |  1 +
 3 files changed, 55 insertions(+), 6 deletions(-)

-- 
2.34.1

