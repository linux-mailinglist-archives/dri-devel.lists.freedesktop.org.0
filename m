Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 45B42C118DD
	for <lists+dri-devel@lfdr.de>; Mon, 27 Oct 2025 22:27:12 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id A5B5710E19B;
	Mon, 27 Oct 2025 21:27:08 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (1024-bit key; unprotected) header.d=ti.com header.i=@ti.com header.b="YsZVu58N";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from fllvem-ot03.ext.ti.com (fllvem-ot03.ext.ti.com [198.47.19.245])
 by gabe.freedesktop.org (Postfix) with ESMTPS id E285810E1A0
 for <dri-devel@lists.freedesktop.org>; Mon, 27 Oct 2025 21:27:06 +0000 (UTC)
Received: from lelvem-sh01.itg.ti.com ([10.180.77.71])
 by fllvem-ot03.ext.ti.com (8.15.2/8.15.2) with ESMTP id 59RLQUC02490408;
 Mon, 27 Oct 2025 16:26:30 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ti.com;
 s=ti-com-17Q1; t=1761600390;
 bh=3LA3zzpEcmHb6DEIkmkNwmCkfljv4gF+vsBJrx99r1E=;
 h=From:To:CC:Subject:Date;
 b=YsZVu58NApL89IAL7H2XCCHl8h/e3BDDLdxKeTZOsrWfmc+47Bc80G9ptBrW0ubJK
 pJB/7tiAAEuiN7vZdUinG5SofQZarvzPJD+vcCyfjVLh62z490F5LlQPmZso26T+/d
 5ACaBS8AZu7up0BRLh1I4QzF7pzMsZKxJRHhHapI=
Received: from DLEE208.ent.ti.com (dlee208.ent.ti.com [157.170.170.97])
 by lelvem-sh01.itg.ti.com (8.18.1/8.18.1) with ESMTPS id 59RLQUOL1491660
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=FAIL);
 Mon, 27 Oct 2025 16:26:30 -0500
Received: from DLEE207.ent.ti.com (157.170.170.95) by DLEE208.ent.ti.com
 (157.170.170.97) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.2562.20; Mon, 27 Oct
 2025 16:26:30 -0500
Received: from lelvem-mr06.itg.ti.com (10.180.75.8) by DLEE207.ent.ti.com
 (157.170.170.95) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.2562.20 via Frontend
 Transport; Mon, 27 Oct 2025 16:26:30 -0500
Received: from a0512632.dhcp.ti.com (a0512632.dhcp.ti.com [172.24.233.20])
 by lelvem-mr06.itg.ti.com (8.18.1/8.18.1) with ESMTP id 59RLQP5k1301370;
 Mon, 27 Oct 2025 16:26:26 -0500
From: Swamil Jain <s-jain1@ti.com>
To: <aradhya.bhatia@linux.dev>, <devarsht@ti.com>, <mripard@kernel.org>,
 <tomi.valkeinen@ideasonboard.com>, <jyri.sarha@iki.fi>,
 <maarten.lankhorst@linux.intel.com>, <simona@ffwll.ch>,
 <airlied@gmail.com>, <tzimmermann@suse.de>, <h-shenoy@ti.com>
CC: <praneeth@ti.com>, <u-kumar1@ti.com>, <vigneshr@ti.com>,
 <dri-devel@lists.freedesktop.org>, <linux-kernel@vger.kernel.org>,
 <s-jain1@ti.com>
Subject: [PATCH v7 0/2] Decouple max/min_pclk_khz check from constant display
 feats
Date: Tue, 28 Oct 2025 02:56:22 +0530
Message-ID: <20251027212624.359235-1-s-jain1@ti.com>
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
removing the max/min_pclk_khz form dispc_features structure and doing
the supported pixel clock checks using clk_round_rate().

Changes are fully backwards compatible.

- Remove max/min_pclk_khz and use clk_round_rate to validate modes
- Skip OLDI mode validate through dispc_vp_mode_valid and add
  mode_valid hook to validate modes for OLDI bridge in tidss_oldi.c

---
Changelog v6->v7
- Remove both max/min_pclk_khz as suggested by Tomi
- Use mode_valid() instead of atomic_check()
- Squash patches v6 PATCH 1/3 and PATCH 2/3 which is a fix to OLDI
  series[1]
- Minor fixes in commit message
- Update comments to include more reasoning to add Fixes tag to
  Patch v7 2/2

[1]: https://lore.kernel.org/all/20250528122544.817829-1-aradhya.bhatia@linux.dev/

v6 patch link:
https://lore.kernel.org/all/20250911110715.2873596-1-s-jain1@ti.com/

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

---
Jayesh Choudhary (2):
  drm/tidss: Remove max_pclk_khz and min_pclk_khz from tidss display
    features
  drm/tidss: Move OLDI mode validation to OLDI bridge mode_valid hook

 drivers/gpu/drm/tidss/tidss_dispc.c | 87 +++++++++++------------------
 drivers/gpu/drm/tidss/tidss_dispc.h |  3 -
 drivers/gpu/drm/tidss/tidss_drv.h   |  2 +
 drivers/gpu/drm/tidss/tidss_oldi.c  | 21 +++++++
 4 files changed, 55 insertions(+), 58 deletions(-)

