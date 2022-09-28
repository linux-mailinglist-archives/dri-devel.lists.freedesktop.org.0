Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 341C95EE605
	for <lists+dri-devel@lfdr.de>; Wed, 28 Sep 2022 21:52:15 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id C69D410E9F4;
	Wed, 28 Sep 2022 19:51:56 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from lelv0143.ext.ti.com (lelv0143.ext.ti.com [198.47.23.248])
 by gabe.freedesktop.org (Postfix) with ESMTPS id CB5F910E9EF
 for <dri-devel@lists.freedesktop.org>; Wed, 28 Sep 2022 19:51:52 +0000 (UTC)
Received: from lelv0265.itg.ti.com ([10.180.67.224])
 by lelv0143.ext.ti.com (8.15.2/8.15.2) with ESMTP id 28SHqPaf076937;
 Wed, 28 Sep 2022 12:52:25 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ti.com;
 s=ti-com-17Q1; t=1664387545;
 bh=+nMkJVipOiVxem0Rt3I7+AhSsJ7p85+gzYWYe8Su7kw=;
 h=From:To:CC:Subject:Date;
 b=cxSPjhKeevtkcslAy9veL4QUcK9bKnvIALWhTlwhe3ca42N69ZXrgPWF/FUoFUHnG
 e2GNAfe/zeJ47yrXZ8behrPXloZ1oxM9QLcsVgvAsPO4UNJxuTbrIUpeM76OyFqB/k
 twmyC/OGksfFTuWf469gUpFYFKD6qp1a1grtos1w=
Received: from DFLE105.ent.ti.com (dfle105.ent.ti.com [10.64.6.26])
 by lelv0265.itg.ti.com (8.15.2/8.15.2) with ESMTPS id 28SHqPOH029164
 (version=TLSv1.2 cipher=AES256-GCM-SHA384 bits=256 verify=FAIL);
 Wed, 28 Sep 2022 12:52:25 -0500
Received: from DFLE114.ent.ti.com (10.64.6.35) by DFLE105.ent.ti.com
 (10.64.6.26) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id 15.1.2507.6; Wed, 28
 Sep 2022 12:52:24 -0500
Received: from fllv0040.itg.ti.com (10.64.41.20) by DFLE114.ent.ti.com
 (10.64.6.35) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id 15.1.2507.6 via
 Frontend Transport; Wed, 28 Sep 2022 12:52:24 -0500
Received: from localhost (ileaxei01-snat2.itg.ti.com [10.180.69.6])
 by fllv0040.itg.ti.com (8.15.2/8.15.2) with ESMTP id 28SHqOMQ100880;
 Wed, 28 Sep 2022 12:52:24 -0500
From: Aradhya Bhatia <a-bhatia1@ti.com>
To: Tomi Valkeinen <tomba@kernel.org>, Jyri Sarha <jyri.sarha@iki.fi>, Rob
 Herring <robh+dt@kernel.org>, David Airlie <airlied@linux.ie>,
 Daniel Vetter <daniel@ffwll.ch>,
 Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>
Subject: [RFC PATCH v5 0/6] Add DSS support for AM625 SoC
Date: Wed, 28 Sep 2022 23:22:17 +0530
Message-ID: <20220928175223.15225-1-a-bhatia1@ti.com>
X-Mailer: git-send-email 2.37.0
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
Cc: Nishanth Menon <nm@ti.com>, Devicetree List <devicetree@vger.kernel.org>,
 Vignesh Raghavendra <vigneshr@ti.com>,
 Linux Kernel List <linux-kernel@vger.kernel.org>,
 DRI Development List <dri-devel@lists.freedesktop.org>,
 Rahul T R <r-ravikumar@ti.com>
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

This patch series adds a new compatible for the Display SubSyetem
controller on TI's AM625 SoC. It further adds the required support for
the same in the tidss driver. The AM625-DSS is a newer version of the DSS
from the AM65X version with the major change being the addition of
another OLDI TX. With the help of 2 OLDI TXes, the AM625 DSS supports
OLDI displays with a resolution of upto 2K.

This patch set further adds support for the OLDI on AM625, and is, in
essence, the second version of the following patch series:
https://patchwork.kernel.org/project/dri-devel/list/?series=660970&state=%2A&archive=both

The changes in the above-mentioned series forced some re-works in this
series, and are better reviewed as a single set.

TODO:
  - Support for OLDI Bridges that work on clone / dual-link modes is yet
    to be added.

  - The pixel clock for the OLDI VP passes through a clock divider, which
    was being explicitly set in previous series, but that was not the
    right way. That patch has been dropped and a newer implementation is
    in works.

Note:
  - Due to lack of hardware, only dual-link mode has been tested.

Changelog:
V5:
  - Rebase for current merge window
  - Add max DT ports in DSS features
  - Combine the OLDI support series

(Changes from OLDI support series v1)
  - Address Tomi Valkeinen's comments
    1. Update the OLDI link detection approach
    2. Add port #3 for 2nd OLDI TX
    3. Configure 2 panel-bridges for cloned panels
    4. Drop the OLDI clock set patch
    5. Drop rgb565-to-888 patch

V4:
  - Rebase for current merge window
  - Add acked and reviewed by tags

V3:
  - Change yaml enum in alphabetical order
  - Correct a typo

V2:
  - Remove redundant regsiter array

Aradhya Bhatia (6):
  dt-bindings: display: ti,am65x-dss: Add am625 dss compatible
  dt-bindings: display: ti: am65x-dss: Add new port for am625-dss
  drm/tidss: Add support for AM625 DSS
  drm/tidss: Add support to configure OLDI mode for am625-dss.
  drm/tidss: Add IO CTRL and Power support for OLDI TX in am625
  drm/tidss: Enable Dual and Duplicate Modes for OLDI

 .../bindings/display/ti/ti,am65x-dss.yaml     |  22 ++-
 drivers/gpu/drm/tidss/tidss_dispc.c           | 155 ++++++++++++++++--
 drivers/gpu/drm/tidss/tidss_dispc.h           |  11 ++
 drivers/gpu/drm/tidss/tidss_dispc_regs.h      |   6 +
 drivers/gpu/drm/tidss/tidss_drv.c             |   1 +
 drivers/gpu/drm/tidss/tidss_drv.h             |   3 +
 drivers/gpu/drm/tidss/tidss_kms.c             | 146 ++++++++++++++---
 7 files changed, 304 insertions(+), 40 deletions(-)

-- 
2.37.0

