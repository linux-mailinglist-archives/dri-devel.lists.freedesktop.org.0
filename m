Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id B6F9E2AC1C4
	for <lists+dri-devel@lfdr.de>; Mon,  9 Nov 2020 18:06:27 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 81AAC89AC2;
	Mon,  9 Nov 2020 17:06:24 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from fllv0015.ext.ti.com (fllv0015.ext.ti.com [198.47.19.141])
 by gabe.freedesktop.org (Postfix) with ESMTPS id B7BFE89911
 for <dri-devel@lists.freedesktop.org>; Mon,  9 Nov 2020 17:06:22 +0000 (UTC)
Received: from lelv0266.itg.ti.com ([10.180.67.225])
 by fllv0015.ext.ti.com (8.15.2/8.15.2) with ESMTP id 0A9H6IHs002581;
 Mon, 9 Nov 2020 11:06:18 -0600
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ti.com;
 s=ti-com-17Q1; t=1604941578;
 bh=0h+Tv3cUw/51VBuq1dfaN5e7qOptt8DPOMg6OzcPPcY=;
 h=From:To:CC:Subject:Date;
 b=fFL5/RtNPYMUCR43liQA3E891WhXjFlFCcHWg/E43N3z+hYwpyq58w+ur4HP6xaSw
 UShHxWB9vt8AX5XkOpiT0EDSkkySSdK9DbT8XWS6gflT7gaB+5QPjGHpuSdcMtKVCh
 CwlVwFFcLiC1eq8hbD4XCJwwNSZ8H82ZJ1nOeO8g=
Received: from DFLE114.ent.ti.com (dfle114.ent.ti.com [10.64.6.35])
 by lelv0266.itg.ti.com (8.15.2/8.15.2) with ESMTPS id 0A9H6ItF099217
 (version=TLSv1.2 cipher=AES256-GCM-SHA384 bits=256 verify=FAIL);
 Mon, 9 Nov 2020 11:06:18 -0600
Received: from DFLE107.ent.ti.com (10.64.6.28) by DFLE114.ent.ti.com
 (10.64.6.35) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id 15.1.1979.3; Mon, 9 Nov
 2020 11:06:18 -0600
Received: from lelv0326.itg.ti.com (10.180.67.84) by DFLE107.ent.ti.com
 (10.64.6.28) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id 15.1.1979.3 via
 Frontend Transport; Mon, 9 Nov 2020 11:06:18 -0600
Received: from NiksLab.india.ti.com (ileax41-snat.itg.ti.com [10.172.224.153])
 by lelv0326.itg.ti.com (8.15.2/8.15.2) with ESMTP id 0A9H6FZX037277; 
 Mon, 9 Nov 2020 11:06:16 -0600
From: Nikhil Devshatwar <nikhil.nd@ti.com>
To: <dri-devel@lists.freedesktop.org>, Tomi Valkeinen <tomi.valkeinen@ti.com>
Subject: [PATCH v2 0/6] drm/tidss: Use new connector model for tidss
Date: Mon, 9 Nov 2020 22:35:55 +0530
Message-ID: <20201109170601.21557-1-nikhil.nd@ti.com>
X-Mailer: git-send-email 2.17.1
MIME-Version: 1.0
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
Cc: Sekhar Nori <nsekhar@ti.com>,
 Laurent Pinchart <laurent.pinchart@ideasonboard.com>,
 Yuti Amonkar <yamonkar@cadence.com>, Swapnil Jakhade <sjakhade@cadence.com>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

This series moves the tidss to using new connectoe model, where the 
SoC driver (tidss) creates the connector and all the bridges are 
attached with the flag DRM_BRIDGE_ATTACH_NO_CONNECTOR

Since the bridges do not create the connector, the bus format and
bus_flag is set after the format negotiation.
Support format negotiations in the tfp410 and mhdp bridge drivers
as a first step before moving the connector model.

Nikhil Devshatwar (6):
  drm: bridge: Propagate the bus flags from bridge->timings
  drm/bridge: tfp410: Support format negotiation hooks
  drm/bridge: mhdp8546: Add minimal format negotiation
  drm/tidss: Set bus_format correctly from bridge/connector
  drm/tidss: Move to newer connector model
  drm/bridge: cdns-mhdp8546: Fix the interrupt enable/disable

 .../drm/bridge/cadence/cdns-mhdp8546-core.c   | 32 ++++++++++++++++--
 drivers/gpu/drm/bridge/ti-tfp410.c            | 33 +++++++++++++++++++
 drivers/gpu/drm/drm_bridge.c                  |  8 +++++
 drivers/gpu/drm/tidss/tidss_drv.h             |  3 ++
 drivers/gpu/drm/tidss/tidss_encoder.c         | 22 ++++++++-----
 drivers/gpu/drm/tidss/tidss_kms.c             | 19 ++++++++++-
 6 files changed, 106 insertions(+), 11 deletions(-)

-- 
2.17.1

_______________________________________________
dri-devel mailing list
dri-devel@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/dri-devel
