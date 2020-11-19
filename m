Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 263842B9713
	for <lists+dri-devel@lfdr.de>; Thu, 19 Nov 2020 17:01:49 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id CD0F66E58E;
	Thu, 19 Nov 2020 16:01:46 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from fllv0015.ext.ti.com (fllv0015.ext.ti.com [198.47.19.141])
 by gabe.freedesktop.org (Postfix) with ESMTPS id E784B6E56A
 for <dri-devel@lists.freedesktop.org>; Thu, 19 Nov 2020 16:01:44 +0000 (UTC)
Received: from lelv0265.itg.ti.com ([10.180.67.224])
 by fllv0015.ext.ti.com (8.15.2/8.15.2) with ESMTP id 0AJG1dXD003081;
 Thu, 19 Nov 2020 10:01:39 -0600
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ti.com;
 s=ti-com-17Q1; t=1605801699;
 bh=c9S1iFwPdQGKJHdVmfukzCGnWnUbp22AYhsDCqoW174=;
 h=From:To:CC:Subject:Date;
 b=humrKrPlhdDV+oZ6tO7WES8tcYGKCQXgjVnWlibL0dRNucNzyRT67/0Zih+BK+Aga
 DDPmo6qfwe2i+Z4QgREC5z41HG+tQmbv1GNwks0RsZ4lmO4Gb8A0LHMMa0CQeAVP9x
 xjAGyhl5B0rutCwMaPjFeGZIic6IhFeBfco9nHas=
Received: from DFLE114.ent.ti.com (dfle114.ent.ti.com [10.64.6.35])
 by lelv0265.itg.ti.com (8.15.2/8.15.2) with ESMTPS id 0AJG1dog116097
 (version=TLSv1.2 cipher=AES256-GCM-SHA384 bits=256 verify=FAIL);
 Thu, 19 Nov 2020 10:01:39 -0600
Received: from DFLE112.ent.ti.com (10.64.6.33) by DFLE114.ent.ti.com
 (10.64.6.35) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id 15.1.1979.3; Thu, 19
 Nov 2020 10:01:39 -0600
Received: from lelv0327.itg.ti.com (10.180.67.183) by DFLE112.ent.ti.com
 (10.64.6.33) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id 15.1.1979.3 via
 Frontend Transport; Thu, 19 Nov 2020 10:01:39 -0600
Received: from NiksLab.india.ti.com (ileax41-snat.itg.ti.com [10.172.224.153])
 by lelv0327.itg.ti.com (8.15.2/8.15.2) with ESMTP id 0AJG1app003251; 
 Thu, 19 Nov 2020 10:01:37 -0600
From: Nikhil Devshatwar <nikhil.nd@ti.com>
To: <dri-devel@lists.freedesktop.org>, Tomi Valkeinen <tomi.valkeinen@ti.com>
Subject: [PATCH v3 0/6] drm/tidss: Use new connector model for tidss
Date: Thu, 19 Nov 2020 21:31:28 +0530
Message-ID: <20201119160134.9244-1-nikhil.nd@ti.com>
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

 .../drm/bridge/cadence/cdns-mhdp8546-core.c   | 69 +++++++++++++------
 drivers/gpu/drm/bridge/ti-tfp410.c            | 33 +++++++++
 drivers/gpu/drm/drm_bridge.c                  |  8 +++
 drivers/gpu/drm/tidss/tidss_drv.h             |  3 +
 drivers/gpu/drm/tidss/tidss_encoder.c         | 36 ++++------
 drivers/gpu/drm/tidss/tidss_kms.c             | 19 ++++-
 6 files changed, 123 insertions(+), 45 deletions(-)

-- 
2.17.1

_______________________________________________
dri-devel mailing list
dri-devel@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/dri-devel
