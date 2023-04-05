Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 4AAA46D7F52
	for <lists+dri-devel@lfdr.de>; Wed,  5 Apr 2023 16:25:15 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id EFED210E0C4;
	Wed,  5 Apr 2023 14:25:10 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from lelv0143.ext.ti.com (lelv0143.ext.ti.com [198.47.23.248])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 9261210E0C4
 for <dri-devel@lists.freedesktop.org>; Wed,  5 Apr 2023 14:25:05 +0000 (UTC)
Received: from fllv0035.itg.ti.com ([10.64.41.0])
 by lelv0143.ext.ti.com (8.15.2/8.15.2) with ESMTP id 335EOg8U059430;
 Wed, 5 Apr 2023 09:24:42 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ti.com;
 s=ti-com-17Q1; t=1680704682;
 bh=2GVvLPXBxCQGXMB3CvvaO2iHJZB4fTMWkS8HlWuLcC4=;
 h=From:To:CC:Subject:Date;
 b=WhtrtJLVnPdfHhM3bDUboFsDseL1gnyUF77Z9z0K6c1WeXcCAQXfOavPka8YtSf6f
 EHMP1qcuIxOZnyfutO9RauCu4xzaLVar9CSYJP2BiMuOdjMnxD2NtW8VPzsFecA197
 D3ERgm9Y65lyuKDHv2twAGNxYGdZpKCaq0nNjiLQ=
Received: from DLEE107.ent.ti.com (dlee107.ent.ti.com [157.170.170.37])
 by fllv0035.itg.ti.com (8.15.2/8.15.2) with ESMTPS id 335EOgr9026283
 (version=TLSv1.2 cipher=AES256-GCM-SHA384 bits=256 verify=FAIL);
 Wed, 5 Apr 2023 09:24:42 -0500
Received: from DLEE104.ent.ti.com (157.170.170.34) by DLEE107.ent.ti.com
 (157.170.170.37) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id 15.1.2507.16; Wed, 5
 Apr 2023 09:24:41 -0500
Received: from lelv0327.itg.ti.com (10.180.67.183) by DLEE104.ent.ti.com
 (157.170.170.34) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id 15.1.2507.16 via
 Frontend Transport; Wed, 5 Apr 2023 09:24:42 -0500
Received: from localhost (ileaxei01-snat.itg.ti.com [10.180.69.5])
 by lelv0327.itg.ti.com (8.15.2/8.15.2) with ESMTP id 335EOeDY068562;
 Wed, 5 Apr 2023 09:24:41 -0500
From: Jayesh Choudhary <j-choudhary@ti.com>
To: <dri-devel@lists.freedesktop.org>, <devicetree@vger.kernel.org>,
 <linux-kernel@vger.kernel.org>, <krzysztof.kozlowski@linaro.org>
Subject: [PATCH v2 0/2] "no-hpd" support in CDNS DP bridge driver
Date: Wed, 5 Apr 2023 19:54:38 +0530
Message-ID: <20230405142440.191939-1-j-choudhary@ti.com>
X-Mailer: git-send-email 2.25.1
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-EXCLAIMER-MD-CONFIG: e1e8a2fd-e40a-4ac6-ac9b-f7e9cc9ee180
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
Cc: andrzej.hajda@intel.com, tomi.valkeinen@ideasonboard.com,
 Laurent.pinchart@ideasonboard.com, krzysztof.kozlowski+dt@linaro.org,
 sam@ravnborg.org, r-ravikumar@ti.com, rfoss@kernel.org, a-bhatia1@ti.com,
 javierm@redhat.com, jernej.skrabec@gmail.com, sjakhade@cadence.com,
 tzimmermann@suse.de, jonas@kwiboo.se, jani.nikula@intel.com,
 robh+dt@kernel.org, neil.armstrong@linaro.org, j-choudhary@ti.com,
 yamonkar@cadence.com, alexander.deucher@amd.com
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

In J721s2 EVM, DP0 HPD is not connected to correct HPD pin on SOC
which results in HPD detect as always connnected, so when display
is not connected driver continuously retries to read EDID and DPCD
registers.

To handle such cases add support for no hpd configuration in
cdns-mhdp driver.

DT changes for display in j721s2 will be posted once we have no-hpd
support and multilink DP support[1] merged.

[1]:
<https://lore.kernel.org/all/20230227133104.29788-1-sjakhade@cadence.com/>

Changelog v1->v2:
- edit the commit message for the bindings to clarify why we exactly need
  no-hpd indication for mhdp.

v1 patch-link:
<https://lore.kernel.org/all/20230316140823.234263-1-j-choudhary@ti.com/>

Rahul T R (2):
  dt-bindings: drm/bridge: Add no-hpd property
  drm: bridge: cdns-mhdp8546: Add support for no-hpd

 .../display/bridge/cdns,mhdp8546.yaml         |  6 +++
 .../drm/bridge/cadence/cdns-mhdp8546-core.c   | 37 ++++++++++++++++---
 .../drm/bridge/cadence/cdns-mhdp8546-core.h   |  1 +
 3 files changed, 39 insertions(+), 5 deletions(-)

-- 
2.25.1

