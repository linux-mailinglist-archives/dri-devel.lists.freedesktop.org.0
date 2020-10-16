Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 83AEA2902E8
	for <lists+dri-devel@lfdr.de>; Fri, 16 Oct 2020 12:39:43 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 94D4D6EAB8;
	Fri, 16 Oct 2020 10:39:39 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from fllv0015.ext.ti.com (fllv0015.ext.ti.com [198.47.19.141])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 609DA89F1B
 for <dri-devel@lists.freedesktop.org>; Fri, 16 Oct 2020 10:39:37 +0000 (UTC)
Received: from lelv0266.itg.ti.com ([10.180.67.225])
 by fllv0015.ext.ti.com (8.15.2/8.15.2) with ESMTP id 09GAdXi8065403;
 Fri, 16 Oct 2020 05:39:33 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ti.com;
 s=ti-com-17Q1; t=1602844773;
 bh=ZbuHxpZcAMsseXuyChnT67RJ3CsWTi1oJV2149xM9lo=;
 h=From:To:CC:Subject:Date;
 b=B3fAZGUH0kLiPKN5QpKhn6VnJC75YL5LhczN0xzd9m7ifTFlGb5bwnB7pjFtm+TuJ
 xbcY+40dLhQpJEqwt8pDF1Ix1/YEn/N6MgYlnx477/2ue8T8fNNYcHnVPxTxNJbDin
 bKDKPYGioCUJ30wy+I4XuzvTWQx/0v4bWGn9cTB8=
Received: from DFLE112.ent.ti.com (dfle112.ent.ti.com [10.64.6.33])
 by lelv0266.itg.ti.com (8.15.2/8.15.2) with ESMTPS id 09GAdXuZ104356
 (version=TLSv1.2 cipher=AES256-GCM-SHA384 bits=256 verify=FAIL);
 Fri, 16 Oct 2020 05:39:33 -0500
Received: from DFLE113.ent.ti.com (10.64.6.34) by DFLE112.ent.ti.com
 (10.64.6.33) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id 15.1.1979.3; Fri, 16
 Oct 2020 05:39:32 -0500
Received: from fllv0040.itg.ti.com (10.64.41.20) by DFLE113.ent.ti.com
 (10.64.6.34) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id 15.1.1979.3 via
 Frontend Transport; Fri, 16 Oct 2020 05:39:32 -0500
Received: from NiksLab.india.ti.com (ileax41-snat.itg.ti.com [10.172.224.153])
 by fllv0040.itg.ti.com (8.15.2/8.15.2) with ESMTP id 09GAdT1P110152; 
 Fri, 16 Oct 2020 05:39:30 -0500
From: Nikhil Devshatwar <nikhil.nd@ti.com>
To: <dri-devel@lists.freedesktop.org>, Tomi Valkeinen <tomi.valkeinen@ti.com>
Subject: [PATCH 0/5] drm/tidss: Use new connector model for tidss
Date: Fri, 16 Oct 2020 16:09:12 +0530
Message-ID: <20201016103917.26838-1-nikhil.nd@ti.com>
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
 Swapnil Jakhade <sjakhade@cadence.com>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

This series moves the tidss to using new connectoe model, where the 
SoC driver (tidss) creates the connector and all the bridges are 
attached with the flag DRM_BRIDGE_ATTACH_NO_CONNECTOR

Since the bridges do not create the connector, the bus format and
bus_flag is set after the format negotiation.
Support format negotiations in the tfp410 and mhdp bridge drivers.

Nikhil Devshatwar (5):
  drm/tidss: Move to newer connector model
  drm/tidss: Set bus_format correctly from bridge/connector
  drm: bridge: Propagate the bus flags from bridge->timings
  drm/bridge: tfp410: Support format negotiation
  drm/bridge: mhdp8564: Support format negotiation

 .../drm/bridge/cadence/cdns-mhdp8546-core.c   | 29 +++++++++++++++++
 drivers/gpu/drm/bridge/ti-tfp410.c            | 32 +++++++++++++++++++
 drivers/gpu/drm/drm_bridge.c                  |  7 ++++
 drivers/gpu/drm/tidss/tidss_drv.h             |  3 ++
 drivers/gpu/drm/tidss/tidss_encoder.c         | 16 +++++++---
 drivers/gpu/drm/tidss/tidss_kms.c             | 15 ++++++++-
 6 files changed, 96 insertions(+), 6 deletions(-)

-- 
2.17.1

_______________________________________________
dri-devel mailing list
dri-devel@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/dri-devel
