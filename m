Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 60994B52F44
	for <lists+dri-devel@lfdr.de>; Thu, 11 Sep 2025 13:07:50 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 7C65310EA8C;
	Thu, 11 Sep 2025 11:07:48 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (1024-bit key; unprotected) header.d=ti.com header.i=@ti.com header.b="hod9mBrO";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from lelvem-ot02.ext.ti.com (lelvem-ot02.ext.ti.com [198.47.23.235])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 9CDD410EA8C
 for <dri-devel@lists.freedesktop.org>; Thu, 11 Sep 2025 11:07:47 +0000 (UTC)
Received: from lelvem-sh02.itg.ti.com ([10.180.78.226])
 by lelvem-ot02.ext.ti.com (8.15.2/8.15.2) with ESMTP id 58BB7MSE789549;
 Thu, 11 Sep 2025 06:07:22 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ti.com;
 s=ti-com-17Q1; t=1757588842;
 bh=eFPOsL/px2E+fmQT2eS4LFUjQzfYRFJgDTiudOOWFAA=;
 h=From:To:CC:Subject:Date;
 b=hod9mBrOZi2SvoCJMj8wZnBQfx8GhzMR6gD4ssUyXixv8vEC9FYcnO98kAvS4fHA9
 q6VgUVYeuLAFJpcIfqfXrBqvdY3C88Ak0yJIhyQOqojl6WQ+L+nFgxcI9ZpaeSRD2C
 Z0yRRLIHq6WbbjF9G+gtoSx8oEjxSSsPFN6fhWDg=
Received: from DFLE104.ent.ti.com (dfle104.ent.ti.com [10.64.6.25])
 by lelvem-sh02.itg.ti.com (8.18.1/8.18.1) with ESMTPS id 58BB7LaF1014037
 (version=TLSv1.2 cipher=ECDHE-RSA-AES128-SHA256 bits=128 verify=FAIL);
 Thu, 11 Sep 2025 06:07:21 -0500
Received: from DFLE207.ent.ti.com (10.64.6.65) by DFLE104.ent.ti.com
 (10.64.6.25) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id 15.1.2507.55; Thu, 11
 Sep 2025 06:07:20 -0500
Received: from lelvem-mr05.itg.ti.com (10.180.75.9) by DFLE207.ent.ti.com
 (10.64.6.65) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.2562.20 via Frontend
 Transport; Thu, 11 Sep 2025 06:07:21 -0500
Received: from a0512632.dhcp.ti.com (a0512632.dhcp.ti.com [172.24.233.20])
 by lelvem-mr05.itg.ti.com (8.18.1/8.18.1) with ESMTP id 58BB7FP32031347;
 Thu, 11 Sep 2025 06:07:16 -0500
From: Swamil Jain <s-jain1@ti.com>
To: <jyri.sarha@iki.fi>, <tomi.valkeinen@ideasonboard.com>,
 <maarten.lankhorst@linux.intel.com>, <mripard@kernel.org>,
 <tzimmermann@suse.de>, <airlied@gmail.com>, <simona@ffwll.ch>,
 <aradhya.bhatia@linux.dev>
CC: <h-shenoy@ti.com>, <devarsht@ti.com>, <vigneshr@ti.com>, <praneeth@ti.com>,
 <u-kumar1@ti.com>, <dri-devel@lists.freedesktop.org>,
 <linux-kernel@vger.kernel.org>, <s-jain1@ti.com>
Subject: [PATCH v6 0/3] Decouple max_pclk check from constant display feats
Date: Thu, 11 Sep 2025 16:37:12 +0530
Message-ID: <20250911110715.2873596-1-s-jain1@ti.com>
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

In an effort to make the existing compatibles more usable, we are
removing the max_pclk_khz form dispc_features structure and doing the
supported pixel clock checks using clk_round_rate().

Changes are fully backwards compatible.

After integration of OLDI support[0], we need additional patches in
OLDI to identify the VP that has OLDI. We have to do this since
OLDI driver owns the VP clock (its serial clock) and we cannot perform
clock operations on those VP clock from tidss driver. This issue was
also reported upstream when DSI fixes[1] had some clock related calls
in tidss driver. When "clk_round_rate()" is called, ideally it should
have gone to "sci_clk_determine_rate()" to query DM but it doesn't since
clock is owned by OLDI not tidss.

So add a member is_ext_vp_clk[] in tidss_device structure to identify
this and avoid performing clock operations for VP if it has OLDI panel.
For the same checks in OLDI driver, atomic_check() hook is added to its
bridge_funcs.
In the atomic_check() chain, first the bridge_atomic_check() is called
and then crtc_atomic_check() is called. So mode clock is first checked
in oldi driver and then skipped in tidss driver.

Had the tidss_oldi structure been exposed to tidss_dispc.c, we could
have directly checked VP type in dispc but since the structure is defined
in tidss_oldi.c , we have to add additional member to tidss_device
structure.

[0]: https://lore.kernel.org/all/20250528122544.817829-1-aradhya.bhatia@linux.dev/
[1]: https://lore.kernel.org/all/DA6TT575Z82D.3MPK8HG5GRL8U@kernel.org/

Changelog v5->v6
- Drop caching logic
- Add comments for tolerance value
  (We are targeting another series for reducing tolerance value)
- Minor fixes in commit message

v5 patch link:
https://lore.kernel.org/all/20250819192113.2420396-1-s-jain1@ti.com/

Changelog v4->v5
- Rename is_oldi_vp[] to is_ext_vp_clk[]
- Store both pixel clock round_rate and attempted_rate to reduce
  clk_round_rate() calls while validating modes
- Code changes suggested by Tomi[2]
- Minor fixes in comments and commit message

[2]: https://lore.kernel.org/all/8cd9d1c4-2e9f-4766-b224-21925c4f991d@ideasonboard.com/

v4 patch link:
https://lore.kernel.org/all/20250704094851.182131-1-j-choudhary@ti.com/

Changelog v3->v4:
- Minor cosmetic fixes in code, comments and commit message
- Pick up R-by and add Fixes tag

v3 patch link:
https://lore.kernel.org/all/20250701095541.190422-1-j-choudhary@ti.com/

Changelog v2->v3:
- Add changes for OLDI
- Rename max_pclk as it is misleading
- Change commit message to make it more appropriate
- Drop unnecessary zero initialization

v2 patch link:
https://lore.kernel.org/all/20250618100509.20386-1-j-choudhary@ti.com/

Changelog v1->v2:
- Rebase it on linux-next after OLDI support series as all of its
  patches are reviewed and tested and it touches one of the functions
  used.
  
v1 patch link:
https://lore.kernel.org/all/20250618075804.139844-1-j-choudhary@ti.com/

Jayesh Choudhary (3):
  drm/tidss: oldi: Add property to identify OLDI supported VP
  drm/tidss: Remove max_pclk_khz from tidss display features:
  drm/tidss: oldi: Add atomic_check hook for oldi bridge

 drivers/gpu/drm/tidss/tidss_dispc.c | 78 +++++++++++------------------
 drivers/gpu/drm/tidss/tidss_dispc.h |  1 -
 drivers/gpu/drm/tidss/tidss_drv.h   |  1 +
 drivers/gpu/drm/tidss/tidss_oldi.c  | 23 +++++++++
 4 files changed, 54 insertions(+), 49 deletions(-)

