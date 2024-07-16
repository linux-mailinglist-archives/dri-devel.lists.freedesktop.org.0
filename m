Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 2055B932216
	for <lists+dri-devel@lfdr.de>; Tue, 16 Jul 2024 10:43:16 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 9AC7310E5D3;
	Tue, 16 Jul 2024 08:43:14 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (1024-bit key; unprotected) header.d=ti.com header.i=@ti.com header.b="mRyGYEO+";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from lelv0142.ext.ti.com (lelv0142.ext.ti.com [198.47.23.249])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 769CE10E5D3
 for <dri-devel@lists.freedesktop.org>; Tue, 16 Jul 2024 08:43:13 +0000 (UTC)
Received: from fllv0034.itg.ti.com ([10.64.40.246])
 by lelv0142.ext.ti.com (8.15.2/8.15.2) with ESMTP id 46G8gnmZ088638;
 Tue, 16 Jul 2024 03:42:49 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ti.com;
 s=ti-com-17Q1; t=1721119369;
 bh=7mHrSovD4odM3IycXR2SsbG55wzejiQ/0sRbpRUfHVY=;
 h=From:To:CC:Subject:Date;
 b=mRyGYEO+78h8YiBwfl6MAgQiasnvAoYWpDGZ3ysNfQKu3VR2rCiht2gVQFpi1bijE
 COjERcfB3MxUATlDp2mTN4dlWMp/xHnqIbWy1Yv17s/83SfdEqM6bNHqQEe5HNJseE
 1R3X4U7LzHxZ77n3RfIDWY9iX+XuRGgSa1gMOWkU=
Received: from DLEE108.ent.ti.com (dlee108.ent.ti.com [157.170.170.38])
 by fllv0034.itg.ti.com (8.15.2/8.15.2) with ESMTPS id 46G8gnHi008687
 (version=TLSv1.2 cipher=AES256-GCM-SHA384 bits=256 verify=FAIL);
 Tue, 16 Jul 2024 03:42:49 -0500
Received: from DLEE105.ent.ti.com (157.170.170.35) by DLEE108.ent.ti.com
 (157.170.170.38) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id 15.1.2507.23; Tue, 16
 Jul 2024 03:42:49 -0500
Received: from lelvsmtp5.itg.ti.com (10.180.75.250) by DLEE105.ent.ti.com
 (157.170.170.35) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id 15.1.2507.23 via
 Frontend Transport; Tue, 16 Jul 2024 03:42:49 -0500
Received: from localhost (uda0496377.dhcp.ti.com [172.24.227.31])
 by lelvsmtp5.itg.ti.com (8.15.2/8.15.2) with ESMTP id 46G8gmhA118665;
 Tue, 16 Jul 2024 03:42:49 -0500
From: Aradhya Bhatia <a-bhatia1@ti.com>
To: Tomi Valkeinen <tomi.valkeinen@ideasonboard.com>, Jyri Sarha
 <jyri.sarha@iki.fi>, Maarten Lankhorst <maarten.lankhorst@linux.intel.com>,
 Maxime Ripard <mripard@kernel.org>,
 Thomas Zimmermann <tzimmermann@suse.de>,
 Laurent Pinchart <Laurent.pinchart@ideasonboard.com>, David Airlie
 <airlied@gmail.com>, Daniel Vetter <daniel@ffwll.ch>, Rob Herring
 <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>, Conor Dooley
 <conor+dt@kernel.org>
CC: DRI Development List <dri-devel@lists.freedesktop.org>, Devicetree List
 <devicetree@vger.kernel.org>, Linux Kernel List
 <linux-kernel@vger.kernel.org>, Nishanth Menon <nm@ti.com>, Vignesh
 Raghavendra <vigneshr@ti.com>,
 Praneeth Bajjuri <praneeth@ti.com>, Udit Kumar <u-kumar1@ti.com>,
 Francesco Dolcini <francesco@dolcini.it>, Alexander
 Sverdlin <alexander.sverdlin@siemens.com>,
 Randolph Sapp <rs@ti.com>, Devarsh Thakkar <devarsht@ti.com>,
 Jayesh Choudhary <j-choudhary@ti.com>, Jai Luthra <j-luthra@ti.com>,
 Aradhya Bhatia <a-bhatia1@ti.com>
Subject: [PATCH v3 0/4] drm/tidss: Add OLDI bridge support
Date: Tue, 16 Jul 2024 14:12:44 +0530
Message-ID: <20240716084248.1393666-1-a-bhatia1@ti.com>
X-Mailer: git-send-email 2.34.1
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

Hello all,

This patch series add support for the dual OLDI TXes supported in Texas
Instruments' AM62x and AM62Px family of SoCs. The OLDI TXes support
single-lvds, lvds-clone, and dual-lvds modes. These have now been
represented through DRM bridges within TI-DSS.

 - Some history and hardware description for this patch series.

This patch series is a complete re-vamp from the previously posted
series[1] and hence, the version index has been reset to v1. The OLDI
support from that series was dropped and only the base support for AM62x
DSS was kept (and eventually merged)[2].

The OLDI display that the tidss driver today supports, could not be
extended for the newer SoCs. The OLDI display in tidss is modelled after
the DSS and OLDI hardware in the AM65x SoC. The DSS in AM65x SoC, has
two video-ports. Both these video-ports (VP) output DPI video signals.
One of the DPI output (from VP1) from the DSS connects to a singular
OLDI TX present inside the SoC. There is no other way for the DPI from
VP1 to be taken out of the SoC. The other DPI output however - the one
from VP2 - is taken out of the SoC as is. Hence we have an OLDI bus
output and a DPI bus output from the SoC. Since the VP1 and OLDI are
tightly coupled, the tidss driver considers them as a single entity.
That is why, any OLDI sink connects directly to the DSS ports in the
OF graphs.

The newer SoCs have varying DSS and OLDI integrations.

The AM62x DSS also has 2 VPs. The 2nd VP, VP2, outputs DPI signals which
are taken out of the SoC - similar to the AM65x above. For the VP1,
there are 2 OLDI TXes. These OLDI TXes can only receive DPI signals from
VP1, and don't connect to VP2 at all.

The AM62Px SoC has 2 OLDI TXes like AM62x SoC. However, the AM62Px SoC
also has 2 separate DSSes. The 2 OLDI TXes can now be shared between the
2 VPs of the 2 DSSes.

The addition of the 2nd OLDI TX (and a 2nd DSS in AM62Px) creates a need
for some major changes for a full feature experience.

1. The OF graph needs to be updated to accurately show the data flow.
2. The tidss and OLDI drivers now need to support the dual-link and the
   cloned single-link OLDI video signals.
3. The drivers also need to support the case where 2 OLDI TXes are
   connected to 2 different VPs - thereby creating 2 independent streams
   of single-link OLDI outputs.

Note that the OLDI does not have registers of its own. Its still
dependent on the parent VP. The VP that provides the DPI video signals
to the OLDI TXes, also gives the OLDI TXes all the config data. That is
to say, the hardware doesn't sit on the data bus directly - but does so
via DSS.

In light of all of these hardware variations, it was decided to have
a separate OLDI driver (unlike AM65x) but not entirely separate so as to
be a platform device. The OLDI TXes are now being represented as DRM
bridges under the tidss.

Also, since the DRM framework only really supports a linear
encoder-bridge chain, the OLDI driver creates a DRM bridge ONLY for the
primary OLDI TX in cases of dual-link or cloned single-link OLDI modes.
That bridge then attaches to the tidss's display core - which consists
of a CRTC, an Encoder (dummy) and a bridge (dummy). On the other end,
it attaches to OLDI sinks (panels or other bridges).

Since the OLDI TX have a hardware dependency with the VP, the OLDI
configuration needs to happen before that VP is enabled for streaming.
VP stream enable takes place in tidss_crtc_atomic_enable hook. I have
posted a patch allowing DRM bridges to get pre-enabled before the CRTC
of that bridge is enabled[0]. Without that patch, some warnings or
glitches can be seen.

These patches have been tested on AM625 based SK-AM625 EVM with a
Microptis dual-lvds panel (SK-LCD1). The patches with complete support
including the expected devicetree configuration of the OLDI TXes can be
found in the "next_oldi-v3-tests" branch of my github fork[3].

Thanks,
Aradhya


Change Log:
V3:
  - Fix the dt_binding_check warning in patch 3/4[4] by adding
    "additionalProperties" constraint.

V2:
  - Add all the R-b and A-b tags from Laurent Pinchart, Rob Herring, and
    Tomi Valkeinen.
  - Reword the subject for patch 1/4.
  - Reword the commit descriptions to add proper hardware detail.
  - Drop the change in schema reference for port@0 in patch 3/4.
  - Lots of improvements for patch 4/4.
    * Refactor OLDI selection logic in tidss_oldi_tx_power().
    * Add "companion_instance" support to identify the OLDI index in
      dual-link or cloned sinle-link modes.
    * De-initialize tidss_oldi during tidss removal.
    * Use dev_err_probe() instead of dev_err().
    * Drop OLDI(n) macro.
    * Move OLDI Config register bits to tidss_dispc_regs.h.
    * Drop oldi bridge atomic_check().
    * s/%d/%u for all print instances of "oldi_instance".
    * Move OLDI init after DISPC init in tidss_probe.
    * Use devm_drm_of_get_bridge() instead of
      drm_of_find_panel_or_bridge() to find the next bridge and drop all
      the drm_panel support from tidss_oldi.

Previous revisions:
V2: https://lore.kernel.org/all/20240715200953.1213284-1-a-bhatia1@ti.com/
V1: https://lore.kernel.org/all/20240511193055.1686149-1-a-bhatia1@ti.com/

[0]: Dependency Patch: 
("drm/atomic-helper: Re-order bridge chain pre-enable and post-disable")
https://lore.kernel.org/all/20240622110929.3115714-11-a-bhatia1@ti.com/

[1]: AM62 OLDI Series - v7
https://lore.kernel.org/all/20230125113529.13952-1-a-bhatia1@ti.com/

[2]: AM62 DSS Series - v9
https://lore.kernel.org/all/20230616150900.6617-1-a-bhatia1@ti.com/

[3]: GitHub Fork for OLDI tests
https://github.com/aradhya07/linux-ab/tree/next_oldi-v3-tests/

[4]: ("ti,am65x-dss.yaml: oldi-txes: Missing additionalProperties/
      unevaluatedProperties constraint")
https://lore.kernel.org/all/172107979988.1595945.9666141982402158422.robh@kernel.org/

Aradhya Bhatia (4):
  dt-bindings: display: ti,am65x-dss: Re-indent the example
  dt-bindings: display: ti: Add schema for AM625 OLDI Transmitter
  dt-bindings: display: ti,am65x-dss: Add OLDI properties for AM625 DSS
  drm/tidss: Add OLDI bridge support

 .../bindings/display/ti/ti,am625-oldi.yaml    | 153 +++++
 .../bindings/display/ti/ti,am65x-dss.yaml     | 177 +++++-
 MAINTAINERS                                   |   1 +
 drivers/gpu/drm/tidss/Makefile                |   3 +-
 drivers/gpu/drm/tidss/tidss_dispc.c           |  20 +-
 drivers/gpu/drm/tidss/tidss_dispc.h           |   4 +
 drivers/gpu/drm/tidss/tidss_dispc_regs.h      |  14 +
 drivers/gpu/drm/tidss/tidss_drv.c             |   9 +
 drivers/gpu/drm/tidss/tidss_drv.h             |   5 +
 drivers/gpu/drm/tidss/tidss_oldi.c            | 537 ++++++++++++++++++
 drivers/gpu/drm/tidss/tidss_oldi.h            |  51 ++
 11 files changed, 951 insertions(+), 23 deletions(-)
 create mode 100644 Documentation/devicetree/bindings/display/ti/ti,am625-oldi.yaml
 create mode 100644 drivers/gpu/drm/tidss/tidss_oldi.c
 create mode 100644 drivers/gpu/drm/tidss/tidss_oldi.h


base-commit: 3fe121b622825ff8cc995a1e6b026181c48188db
-- 
2.34.1

