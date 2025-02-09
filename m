Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 730D0A2DEFF
	for <lists+dri-devel@lfdr.de>; Sun,  9 Feb 2025 17:09:44 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id CCC0F10E112;
	Sun,  9 Feb 2025 16:09:40 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (1024-bit key; unprotected) header.d=linux.dev header.i=@linux.dev header.b="axT4sSHm";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from out-188.mta1.migadu.com (out-188.mta1.migadu.com
 [95.215.58.188])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 7418A10E112
 for <dri-devel@lists.freedesktop.org>; Sun,  9 Feb 2025 16:09:38 +0000 (UTC)
X-Report-Abuse: Please report any abuse attempt to abuse@migadu.com and
 include these headers.
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linux.dev; s=key1;
 t=1739117376;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:
 content-transfer-encoding:content-transfer-encoding;
 bh=D3wHBokKbURIQJ/tBHSscf+nNLX/wrB6OoXl2YQXtqo=;
 b=axT4sSHmJmsxHKW6ufy0VeXSX/LS7hAq7fM1OJ/r4LTkDiENgxIZQon26a8sOrT9f1qbcB
 49MYf6kSCD7qb8jNqSHGu20OT4mnD51/E1wH0B1tPNhde9bmfEWGzrWPgOhJW0CCUneXHN
 v2mkCvtzuy3FFWK5uraudWpBZyC50hg=
From: Aradhya Bhatia <aradhya.bhatia@linux.dev>
To: Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>,
 Conor Dooley <conor+dt@kernel.org>,
 Tomi Valkeinen <tomi.valkeinen@ideasonboard.com>,
 Jyri Sarha <jyri.sarha@iki.fi>
Cc: Maarten Lankhorst <maarten.lankhorst@linux.intel.com>,
 Thomas Zimmermann <tzimmermann@suse.de>,
 Maxime Ripard <mripard@kernel.org>, David Airlie <airlied@gmail.com>,
 Laurent Pinchart <laurent.pinchart@ideasonboard.com>,
 Simona Vetter <simona@ffwll.ch>, Nishanth Menon <nm@ti.com>,
 Vignesh Raghavendra <vigneshr@ti.com>, Devarsh Thakkar <devarsht@ti.com>,
 Praneeth Bajjuri <praneeth@ti.com>, Udit Kumar <u-kumar1@ti.com>,
 Jayesh Choudhary <j-choudhary@ti.com>,
 Francesco Dolcini <francesco@dolcini.it>,
 DRI Development List <dri-devel@lists.freedesktop.org>,
 Devicetree List <devicetree@vger.kernel.org>,
 Linux Kernel List <linux-kernel@vger.kernel.org>,
 Aradhya Bhatia <aradhya.bhatia@linux.dev>
Subject: [PATCH v5 0/3] drm/tidss: Add OLDI bridge support
Date: Sun,  9 Feb 2025 21:39:22 +0530
Message-Id: <20250209160925.380348-1-aradhya.bhatia@linux.dev>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Migadu-Flow: FLOW_OUT
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

This patch series adds support for the dual OLDI TXes supported in Texas
Instruments' AM62x and AM62Px family of SoCs. The OLDI TX hardware supports
single-lvds, lvds-clone, and dual-lvds modes. These TXes have now been
represented through DRM bridges within TI-DSS.

* Some history and hardware description for this patch series *

This patch series is a complete re-vamp from the previously posted series[1] and
hence, the version index has been reset to v1. The OLDI support from that series
was dropped and only the base support for AM62x DSS was kept (and eventually
merged)[2].

The OLDI display that the tidss driver today supports, could not be extended for
the newer SoCs. The OLDI display in tidss is modelled after the DSS and OLDI
hardware in the AM65x SoC. The DSS in AM65x SoC, has two video-ports. Both these
video-ports (VP) output DPI video signals. One of the DPI output (from VP1) from
the DSS connects to a singular OLDI TX present inside the SoC. There is no other
way for the DPI from VP1 to be taken out of the SoC. The other DPI output
however - the one from VP2 - is taken out of the SoC as is. Hence we have an
OLDI bus output and a DPI bus output from the SoC. Since the VP1 and OLDI are
tightly coupled, the tidss driver considers them as a single entity. That is
why, any OLDI sink connects directly to the DSS ports in the OF graphs.

The newer SoCs have varying DSS and OLDI integrations.

The AM62x DSS also has 2 VPs. The 2nd VP, VP2, outputs DPI signals which are
taken out of the SoC - similar to the AM65x above. For the VP1, there are 2 OLDI
TXes. These OLDI TXes can only receive DPI signals from VP1, and don't connect
to VP2 at all.

The AM62Px SoC has 2 OLDI TXes like AM62x SoC. However, the AM62Px SoC also has
2 separate DSSes. The 2 OLDI TXes can now be shared between the 2 VPs of the 2
DSSes.

The addition of the 2nd OLDI TX (and a 2nd DSS in AM62Px) creates a need for
some major changes for a full feature experience.

1. The OF graph needs to be updated to accurately show the data flow.
2. The tidss and OLDI drivers now need to support the dual-link and the cloned
   single-link OLDI video signals.
3. The drivers also need to support the case where 2 OLDI TXes are connected to
   2 different VPs - thereby creating 2 independent streams of single-link OLDI
   outputs.

Note that the OLDI does not have registers of its own. It is still dependent on
the parent VP. The VP that provides the DPI video signals to the OLDI TXes, also
gives the OLDI TXes all the config data. That is to say, the hardware doesn't
sit on the bus directly - but does so through the DSS.

In light of all of these hardware variations, it was decided to have a separate
OLDI driver (unlike AM65x) but not entirely separate so as to be a platform
device. The OLDI TXes are now being represented as DRM bridges under the tidss.


* Regarding the Dependency Patches *
Since the OLDI TXes have a hardware dependency with the parent VP(s), the OLDI
configuration needs to happen before that VP is enabled for streaming. VP stream
enable takes place in tidss_crtc_atomic_enable hook. I have posted patches[0]
allowing DRM bridges to get pre-enabled before the CRTC of that bridge is
enabled. Without those patches, some warnings or glitches may be observed.


* Regarding the Drop of Clone Mode support *
Another key point to note is that the support for clone mode has been dropped
from the tidss OLDI driver, from v5 onwards. If the DT is configured for a clone
mode, the driver will report an error and exit. This has been done because the
driver was not supporting a specific case of clone mode where 2 OLDI sink
bridges connected to the 2 OLDI TXes require active programming (unlike the
simple-panels which do not). The driver does not support creation of two
encoder-bridge pipelines (along with the parent tidss driver) to allow program
any subsequent bridges (OLDI sinks and bridges thereafter).
The code fragments that write the OLDI config to enable clone mode have been
kept as they are, for future, but the driver will not continue to probe if it
detects a clone mode configuration, for the time being.
This drop of clone mode support can be undone by applying this _soft-tested_
patch[6] on top of this series. This patch will revert the driver to previous
revisions and will allow OLDI sinks that don't require active programming (for
example: simple-panels) to work with the driver. Note that this isn't the ideal
way to run clone mode, but it just works for any bridge pipeline after OLDT TX
that does not require additional configuration after the OLDI (for example: a
couple of simple lvds panels connected directly to the OLDI TXes in clone mode).


These patches have been tested on AM625 based Beagleplay[3] platform with a
Lincolntech LCD185 dual-lvds panel. The patches with complete support including
the expected devicetree configuration of the OLDI TXes can be found in the
"next_oldi_v5_5-tests" branch of my github fork[4]. This branch also has support
for Microtips dual-lvds panel (SK-LCD1) which is compatible with the SK-AM625
EVM platform.

I'd appreciate it if somebody can test it, and report back if they observe any
issues.

Thanks,
Aradhya

* Important note about the authorship of patches *
All the patches in the of this series were authored when I owned a "ti.com"
based email id, i.e. <a-bhatia1@ti.com>. This email id is not in use anymore,
and all the work done later has been part of my personal work. Since the
original patches were authored using TI's email id, I have maintained the
original authorships as they are, as well as their sign offs.

I have further added another sign off that uses my current (and personal) email
id, the one that is being used to send this revision, i.e.
<aradhya.bhatia@linux.dev>.

---

Change Log:
V5:
  - Implement fixes suggested by Rob Herring in patch-2.
    * Drop the example from OLDI schema.
    * Fix the DSS schema conditions.
  - Drop the OLDI clone mode support from the driver as it was incomplete and
    could not account for cases where OLDI TXes were connected to another pair
    of bridges that would require additional programming, instead of a pair of
    simple-panels which wouldn't.

V4:
  - Implement fixes suggested by Krzysztof Kozlowski:
    * Squash patches v3:2/4 and v3:3/4 to v4:2/3, and add more hardware details
      in commit description.
    * Change the serial clock name for OLDI, from "s_clk" to "serial".
    * Fix the required condition in the OLDI schema.
    * Other minor fixes.
  - Change "oldi-txes" OLDI DT node name to "oldi-transmitters".
  - Update secondary-OLDI property requirements to be more relaxing for AM62P
    DSS configuration.

V3:
  - Fix the dt_binding_check warning in patch 3/4[5] by adding
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
V1: https://lore.kernel.org/all/20240511193055.1686149-1-a-bhatia1@ti.com/
V2: https://lore.kernel.org/all/20240715200953.1213284-1-a-bhatia1@ti.com/
V3: https://lore.kernel.org/all/20240716084248.1393666-1-a-bhatia1@ti.com/
V4: https://lore.kernel.org/all/20241124143649.686995-1-aradhya.bhatia@linux.dev/


[0]: Dependency Patches:
("drm/atomic-helper: Refactor crtc & encoder-bridge op loops into separate functions")
https://lore.kernel.org/all/20250209121621.34677-3-aradhya.bhatia@linux.dev/

("drm/atomic-helper: Separate out bridge pre_enable/post_disable from enable/disable)
https://lore.kernel.org/all/20250209121621.34677-4-aradhya.bhatia@linux.dev/

("drm/atomic-helper: Re-order bridge chain pre-enable and post-disable")
https://lore.kernel.org/all/20250209121621.34677-5-aradhya.bhatia@linux.dev/


[1]: AM62 OLDI Series - v7
https://lore.kernel.org/all/20230125113529.13952-1-a-bhatia1@ti.com/

[2]: AM62 DSS Series - v9
https://lore.kernel.org/all/20230616150900.6617-1-a-bhatia1@ti.com/

[3]: TI AM625 SoC based Beagleplay platform
https://www.beagleboard.org/boards/beagleplay

[4]: GitHub Fork for OLDI tests
https://github.com/aradhya07/linux-ab/tree/next_oldi_v5_5-tests

[5]: ("ti,am65x-dss.yaml: oldi-txes: Missing additionalProperties/
      unevaluatedProperties constraint")
https://lore.kernel.org/all/172107979988.1595945.9666141982402158422.robh@kernel.org/

[6]: Undo drop of OLDI clone mode support
https://gist.github.com/aradhya07/afb55761e64eb440d47d5de3ea2a3cb7

Aradhya Bhatia (3):
  dt-bindings: display: ti,am65x-dss: Re-indent the example
  dt-bindings: display: ti: Add schema for AM625 OLDI Transmitter
  drm/tidss: Add OLDI bridge support

 .../bindings/display/ti/ti,am625-oldi.yaml    |  88 +++
 .../bindings/display/ti/ti,am65x-dss.yaml     | 196 +++++-
 MAINTAINERS                                   |   1 +
 drivers/gpu/drm/tidss/Makefile                |   3 +-
 drivers/gpu/drm/tidss/tidss_dispc.c           |  20 +-
 drivers/gpu/drm/tidss/tidss_dispc.h           |   4 +
 drivers/gpu/drm/tidss/tidss_dispc_regs.h      |  14 +
 drivers/gpu/drm/tidss/tidss_drv.c             |   9 +
 drivers/gpu/drm/tidss/tidss_drv.h             |   5 +
 drivers/gpu/drm/tidss/tidss_oldi.c            | 558 ++++++++++++++++++
 drivers/gpu/drm/tidss/tidss_oldi.h            |  51 ++
 11 files changed, 926 insertions(+), 23 deletions(-)
 create mode 100644 Documentation/devicetree/bindings/display/ti/ti,am625-oldi.yaml
 create mode 100644 drivers/gpu/drm/tidss/tidss_oldi.c
 create mode 100644 drivers/gpu/drm/tidss/tidss_oldi.h


base-commit: ffd294d346d185b70e28b1a28abe367bbfe53c04
-- 
2.34.1

