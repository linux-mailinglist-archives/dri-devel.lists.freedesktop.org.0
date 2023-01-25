Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id BB55767B179
	for <lists+dri-devel@lfdr.de>; Wed, 25 Jan 2023 12:35:54 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 8AEB410E791;
	Wed, 25 Jan 2023 11:35:46 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from fllv0015.ext.ti.com (fllv0015.ext.ti.com [198.47.19.141])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 827BF10E791
 for <dri-devel@lists.freedesktop.org>; Wed, 25 Jan 2023 11:35:44 +0000 (UTC)
Received: from lelv0265.itg.ti.com ([10.180.67.224])
 by fllv0015.ext.ti.com (8.15.2/8.15.2) with ESMTP id 30PBZVI3006809;
 Wed, 25 Jan 2023 05:35:31 -0600
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ti.com;
 s=ti-com-17Q1; t=1674646531;
 bh=HBFatcEAHxyohhFNewVKyitVKV5KRm3vI73LJ/QbUGg=;
 h=From:To:CC:Subject:Date;
 b=IBnuxnumEXsy40pirD1qTIs4ABElvilfcbeV1eMbk+D7yAd3cbo0wwmvYJWo293A0
 B0NAE6+2XHePDerU/gKFfjxvMFemKAglYkErBJX7u5o420nZdykup44XNnH52Gu25J
 /80YfjIdiCpN7fU7gSkdnsu1MGxBUIt8w4PYvi98=
Received: from DFLE102.ent.ti.com (dfle102.ent.ti.com [10.64.6.23])
 by lelv0265.itg.ti.com (8.15.2/8.15.2) with ESMTPS id 30PBZVen027840
 (version=TLSv1.2 cipher=AES256-GCM-SHA384 bits=256 verify=FAIL);
 Wed, 25 Jan 2023 05:35:31 -0600
Received: from DFLE103.ent.ti.com (10.64.6.24) by DFLE102.ent.ti.com
 (10.64.6.23) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id 15.1.2507.16; Wed, 25
 Jan 2023 05:35:31 -0600
Received: from lelv0327.itg.ti.com (10.180.67.183) by DFLE103.ent.ti.com
 (10.64.6.24) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id 15.1.2507.16 via
 Frontend Transport; Wed, 25 Jan 2023 05:35:31 -0600
Received: from localhost (ileaxei01-snat2.itg.ti.com [10.180.69.6])
 by lelv0327.itg.ti.com (8.15.2/8.15.2) with ESMTP id 30PBZUpW074724;
 Wed, 25 Jan 2023 05:35:30 -0600
From: Aradhya Bhatia <a-bhatia1@ti.com>
To: Rob Herring <robh+dt@kernel.org>, Krzysztof Kozlowski
 <krzysztof.kozlowski+dt@linaro.org>,
 Tomi Valkeinen <tomba@kernel.org>, Jyri Sarha <jyri.sarha@iki.fi>,
 David Airlie <airlied@gmail.com>, Daniel Vetter <daniel@ffwll.ch>
Subject: [PATCH v7 0/6] Add DSS support for AM625 SoC
Date: Wed, 25 Jan 2023 17:05:23 +0530
Message-ID: <20230125113529.13952-1-a-bhatia1@ti.com>
X-Mailer: git-send-email 2.39.0
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
 Jayesh Choudhary <j-choudhary@ti.com>, Jai Luthra <j-luthra@ti.com>,
 Rahul T R <r-ravikumar@ti.com>, Devarsh Thakkar <devarsht@ti.com>,
 Linux Kernel List <linux-kernel@vger.kernel.org>,
 DRI Development List <dri-devel@lists.freedesktop.org>,
 Aradhya Bhatia <a-bhatia1@ti.com>, Vignesh Raghavendra <vigneshr@ti.com>
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

This patch series adds a new compatible for the Display SubSystem (DSS)
controller on TI's AM625 SoC. It further adds the required support for
the same in the tidss driver.

The AM625-DSS is a newer version of the DSS from the AM65X version with
the major change being the addition of another OLDI TX. With the help of
2 OLDI TXes, the AM625 DSS can support dual-linked OLDI displays with a
resolution of up-to 2K or WUXGA (1920x1200@60fps) at half the OLDI clock
frequency or even cloned video outputs on each of the TXes.

TODO:
  - The pixel clock for the OLDI VP passes through a clock divider, which
    was being explicitly set in previous versions, but that was not the
    right way. That patch was dropped and a newer implementation is in
    works.

Note:
  - I have not picked up Tomi Valkeinen's reviewed-by tag in Patch 5/6
    of this series because I did not implement one of his comments
    which suggested to remove the 'oldi_supported' variable. While the
    oldi support is indeed based on SoC variations, keeping that
    variable helps take into account the case where an OLDI supporting
    SoC by-passes OLDI TXes and gives out DPI video signals straight
    from DSS.

- V6: https://patchwork.freedesktop.org/series/111106/
- V5: https://patchwork.freedesktop.org/series/109194/

Changelog:
V7:
  - Rebase to current linux-next.
  - Address Tomi Valkeinen's comments.
    1. Separate the DSS VP and output port coupling.
       v6 introduced 'output_port_bus_type' in addition to 'vp_bus_type'
       but having both of the variables was redundant. Hence, in v7
       the 'output_port_bus_type' essentially replaces 'vp_bus_type'.
    2. Break Patch v6 2/5 into 2 separate patches (v7 1/6 and v7 3/6).
    3. Change in name and addition of OLDI mode macros.
    4. Other minor changes.

V6:
  - Rebase for current merge window.
  - Add 'allOf:' condition in the DT binding.
  - Address Tomi Valkeinen's comments.
    1. Combine DT binding patches for new compatible and 3rd DSS port.
    2. Further separate DSS VPs and output ports.
    3. Separate OLDI mode discovery logic from the panel/bridge
       discovery (which allowed support for OLDI bridges as well.)
    4. Organize OLDI IO control register macros platform wise.

V5:
  - Rebase for current merge window.
  - Add max DT ports in DSS features.
  - Combine the OLDI support series.

(Changes from OLDI support series v1)
  - Address Tomi Valkeinen's comments.
    1. Update the OLDI link detection approach.
    2. Add port #3 for 2nd OLDI TX.
    3. Configure 2 panel-bridges for cloned panels.
    4. Drop the OLDI clock set patch.
    5. Drop rgb565-to-888 patch.

V4:
  - Rebase for current merge window.
  - Add acked and reviewed by tags.

V3:
  - Change yaml enum in alphabetical order.
  - Correct a typo.

V2:
  - Remove redundant register array.

History:
  - The roots of this patch set can be found in the following OLDI
    support series. -> https://patchwork.freedesktop.org/series/106471/

    The changes in this above-mentioned series forced some re-works in
    the current series, and since all the patches were better understood
    as a single set, both the series were combined in V5, as shown in
    change-log above.

  - The OLDI Support series v1 (and subsequently v5 of the current
    series) couldn't take into account OLDI bridges that worked with
    Clone / Dual Link Mode. That was been rectified in the v6 of the
    series. That became possible because the OLDI mode discovery was
    separated from the panel/bridge discovery loop during modeset
    initialization.

Aradhya Bhatia (6):
  drm/tidss: Remove Video Port to Output Port coupling
  dt-bindings: display: ti,am65x-dss: Add support for am625 dss
  drm/tidss: Add support for AM625 DSS
  drm/tidss: Add support to configure OLDI mode for am625-dss.
  drm/tidss: Add IO CTRL and Power support for OLDI TX in am625
  drm/tidss: Enable Dual and Duplicate Modes for OLDI

 .../bindings/display/ti/ti,am65x-dss.yaml     |  23 +-
 drivers/gpu/drm/tidss/tidss_dispc.c           | 209 +++++++++++++---
 drivers/gpu/drm/tidss/tidss_dispc.h           |  35 ++-
 drivers/gpu/drm/tidss/tidss_dispc_regs.h      |  40 ++-
 drivers/gpu/drm/tidss/tidss_drv.c             |   1 +
 drivers/gpu/drm/tidss/tidss_drv.h             |   8 +-
 drivers/gpu/drm/tidss/tidss_encoder.c         |   4 +-
 drivers/gpu/drm/tidss/tidss_encoder.h         |   3 +-
 drivers/gpu/drm/tidss/tidss_irq.h             |   2 +-
 drivers/gpu/drm/tidss/tidss_kms.c             | 231 ++++++++++++++++--
 10 files changed, 471 insertions(+), 85 deletions(-)

-- 
2.39.0

