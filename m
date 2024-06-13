Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id D93BA906711
	for <lists+dri-devel@lfdr.de>; Thu, 13 Jun 2024 10:38:47 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 0F0A510E0EB;
	Thu, 13 Jun 2024 08:38:46 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (1024-bit key; unprotected) header.d=ti.com header.i=@ti.com header.b="XPEd3qwS";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from lelv0143.ext.ti.com (lelv0143.ext.ti.com [198.47.23.248])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 4735010E9A6
 for <dri-devel@lists.freedesktop.org>; Thu, 13 Jun 2024 08:38:43 +0000 (UTC)
Received: from lelv0265.itg.ti.com ([10.180.67.224])
 by lelv0143.ext.ti.com (8.15.2/8.15.2) with ESMTP id 45D8c6pA100718;
 Thu, 13 Jun 2024 03:38:06 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ti.com;
 s=ti-com-17Q1; t=1718267886;
 bh=TjyMmrW2J2r+RcKqfozTMKJxd3RBvb0XNqHfQ8z62jg=;
 h=From:To:CC:Subject:Date;
 b=XPEd3qwSH1MVbmbuJI6Y+54FQjNdEelkS9Bac9iU3apsnY/6VdSnkgeATU4kl4fkb
 c17jjv1oGnRnFroFTD5G/EL/sBNUFKSIaIgl6pxD1dE40jBD20bXfS8p2K2Jw9Gsp8
 b+w7Dvb8sKw7pHF8pUGVo6YfJxyTCyvIwR387qd8=
Received: from DLEE112.ent.ti.com (dlee112.ent.ti.com [157.170.170.23])
 by lelv0265.itg.ti.com (8.15.2/8.15.2) with ESMTPS id 45D8c6La021739
 (version=TLSv1.2 cipher=AES256-GCM-SHA384 bits=256 verify=FAIL);
 Thu, 13 Jun 2024 03:38:06 -0500
Received: from DLEE113.ent.ti.com (157.170.170.24) by DLEE112.ent.ti.com
 (157.170.170.23) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id 15.1.2507.23; Thu, 13
 Jun 2024 03:38:06 -0500
Received: from lelvsmtp5.itg.ti.com (10.180.75.250) by DLEE113.ent.ti.com
 (157.170.170.24) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id 15.1.2507.23 via
 Frontend Transport; Thu, 13 Jun 2024 03:38:06 -0500
Received: from localhost (jayesh-hp-probook-440-g8-notebook-pc.dhcp.ti.com
 [172.24.227.55])
 by lelvsmtp5.itg.ti.com (8.15.2/8.15.2) with ESMTP id 45D8c5nn070145;
 Thu, 13 Jun 2024 03:38:06 -0500
From: Jayesh Choudhary <j-choudhary@ti.com>
To: <linux-kernel@vger.kernel.org>, <dmitry.baryshkov@linaro.org>,
 <sui.jingfeng@linux.dev>, <andrzej.hajda@intel.com>,
 <neil.armstrong@linaro.org>, <rfoss@kernel.org>,
 <Laurent.pinchart@ideasonboard.com>, <mripard@kernel.org>,
 <sam@ravnborg.org>, <j-choudhary@ti.com>
CC: <jonas@kwiboo.se>, <jernej.skrabec@gmail.com>,
 <maarten.lankhorst@linux.intel.com>, <tzimmermann@suse.de>,
 <airlied@gmail.com>, <daniel@ffwll.ch>, <a-bhatia1@ti.com>,
 <dri-devel@lists.freedesktop.org>
Subject: [PATCH v5 0/3] SII902X HDMI Bridge fixups
Date: Thu, 13 Jun 2024 14:08:02 +0530
Message-ID: <20240613083805.439337-1-j-choudhary@ti.com>
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
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

- Move the mode_valid hook to drm_bridge_funcs structure to take care
  of the case when the encoder attaches the bridge chain with the
  DRM_BRIDGE_ATTACH_NO_CONNECTOR flag in which case, the connector is
  not initialized in the bridge's attach call and mode_valid is not
  called.

- Also add this check to the atomic_check call as suggested by Maxime in
  v1 patch.

- Move from deprecated enable()/disable() hooks to atomic hooks as
  suggested in v4 by Sam

Testing has been done on AM62X platform which have SII902X HDMI bridge.
From the logs we can see the propagated modes and flip test for 1080p
resolution.

Testlog:
<https://gist.github.com/Jayesh2000/9bea6840672869337039296bc1145df4>

Changelog v4->v5:
- Add followup patch to replace deprecated bridge hooks
- Fix atomic check to return negative value
- Made commit message for [1/2] in v4 more clear while keeping the R-by and
  Acked-by tags.
- Fix commit header for [2/2] in v4

v4 patch:
<https://lore.kernel.org/all/20240530092930.434026-1-j-choudhary@ti.com/>

Changelog v3->v4:
- Remove mode_valid hook from connector_helper_funcs as it is not needed.

v3 patch:
<https://lore.kernel.org/all/20240524093509.127189-1-j-choudhary@ti.com/>

Changelog v2->v3:
- Remove newline that was introduced in [1/2] and later deleted in [2/2]
  in v2

v2 patch:
<https://lore.kernel.org/all/20240524073305.107293-1-j-choudhary@ti.com/>

Changelog v1->v2:
- Add KHZ suffix in the macros to be more clear
- Add the hook for drm_bridge_funcs as well
- Add check in atomic_check dunction call (in a separate patch)

v1 patch:
<https://lore.kernel.org/all/20240408081435.216927-1-j-choudhary@ti.com/>

Jayesh Choudhary (3):
  drm/bridge: sii902x: Fix mode_valid hook
  drm/bridge: sii902x: Support atomic bridge APIs
  drm/bridge: sii902x: Add pixel clock check in atomic_check

 drivers/gpu/drm/bridge/sii902x.c | 46 +++++++++++++++++++++++---------
 1 file changed, 33 insertions(+), 13 deletions(-)

-- 
2.25.1

