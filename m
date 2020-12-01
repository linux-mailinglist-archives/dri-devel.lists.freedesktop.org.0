Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id D47472CA271
	for <lists+dri-devel@lfdr.de>; Tue,  1 Dec 2020 13:19:00 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id E10AA6E529;
	Tue,  1 Dec 2020 12:18:58 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from fllv0015.ext.ti.com (fllv0015.ext.ti.com [198.47.19.141])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 1CD786E526
 for <dri-devel@lists.freedesktop.org>; Tue,  1 Dec 2020 12:18:58 +0000 (UTC)
Received: from fllv0035.itg.ti.com ([10.64.41.0])
 by fllv0015.ext.ti.com (8.15.2/8.15.2) with ESMTP id 0B1CIqrW061836;
 Tue, 1 Dec 2020 06:18:52 -0600
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ti.com;
 s=ti-com-17Q1; t=1606825132;
 bh=raW8/QH/KgLCRlgw2+OUB3TZgse0LtkdJYpLXBlRDEo=;
 h=From:To:CC:Subject:Date;
 b=F/Xg2m4N0feRSuVGvRRiEUIJxWEIb8ZhWNDo6o7tJlICkXO6TWCSXGpbC8xvwXSFQ
 MwuWOOFHMSi3lSrv/KKavFCcTCoOO2bkbXqQZChTwmHn+F6CuK0PSE9yR/d0km+oQX
 WbE2bKeH9hHdEEPTi4AVRkdgbAPaSk0MO8BifT18=
Received: from DLEE100.ent.ti.com (dlee100.ent.ti.com [157.170.170.30])
 by fllv0035.itg.ti.com (8.15.2/8.15.2) with ESMTPS id 0B1CIqPj016023
 (version=TLSv1.2 cipher=AES256-GCM-SHA384 bits=256 verify=FAIL);
 Tue, 1 Dec 2020 06:18:52 -0600
Received: from DLEE112.ent.ti.com (157.170.170.23) by DLEE100.ent.ti.com
 (157.170.170.30) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id 15.1.1979.3; Tue, 1 Dec
 2020 06:18:52 -0600
Received: from fllv0040.itg.ti.com (10.64.41.20) by DLEE112.ent.ti.com
 (157.170.170.23) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id 15.1.1979.3 via
 Frontend Transport; Tue, 1 Dec 2020 06:18:52 -0600
Received: from NiksLab.india.ti.com (ileax41-snat.itg.ti.com [10.172.224.153])
 by fllv0040.itg.ti.com (8.15.2/8.15.2) with ESMTP id 0B1CIn3L118162; 
 Tue, 1 Dec 2020 06:18:50 -0600
From: Nikhil Devshatwar <nikhil.nd@ti.com>
To: <dri-devel@lists.freedesktop.org>, Tomi Valkeinen <tomi.valkeinen@ti.com>, 
 Laurent Pinchart <laurent.pinchart@ideasonboard.com>, Boris Brezillon
 <boris.brezillon@collabora.com>
Subject: [PATCH v4 0/7] drm/tidss: Use new connector model for tidss
Date: Tue, 1 Dec 2020 17:48:23 +0530
Message-ID: <20201201121830.29704-1-nikhil.nd@ti.com>
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
Cc: Sekhar Nori <nsekhar@ti.com>, Yuti Amonkar <yamonkar@cadence.com>,
 Swapnil Jakhade <sjakhade@cadence.com>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

This series moves the tidss to using new connectoe model, where the 
SoC driver (tidss) creates the connector and all the bridges are 
attached with the flag DRM_BRIDGE_ATTACH_NO_CONNECTOR

Since the bridges do not create the connector, the bus_format and
bus_flag is set via atomic hooks.
Support format negotiations in the tfp410 and mhdp bridge drivers
as a first step before moving the connector model.

Nikhil Devshatwar (7):
  drm/bridge: tfp410: Support format negotiation hooks
  drm/bridge: tfp410: Set input_bus_flags in atomic_check
  drm/bridge: mhdp8546: Add minimal format negotiation
  drm/bridge: mhdp8546: Set input_bus_flags from atomic_check
  drm/tidss: Set bus_format correctly from bridge/connector
  drm/tidss: Move to newer connector model
  drm/bridge: cdns-mhdp8546: Fix the interrupt enable/disable

 .../drm/bridge/cadence/cdns-mhdp8546-core.c   | 75 +++++++++++++------
 drivers/gpu/drm/bridge/ti-tfp410.c            | 49 ++++++++++++
 drivers/gpu/drm/tidss/tidss_drv.h             |  3 +
 drivers/gpu/drm/tidss/tidss_encoder.c         | 36 ++++-----
 drivers/gpu/drm/tidss/tidss_kms.c             | 19 ++++-
 5 files changed, 137 insertions(+), 45 deletions(-)

-- 
2.17.1

_______________________________________________
dri-devel mailing list
dri-devel@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/dri-devel
