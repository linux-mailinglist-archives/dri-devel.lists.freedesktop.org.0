Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 499E59D7369
	for <lists+dri-devel@lfdr.de>; Sun, 24 Nov 2024 15:37:12 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 02A8F10E067;
	Sun, 24 Nov 2024 14:37:09 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (1024-bit key; unprotected) header.d=linux.dev header.i=@linux.dev header.b="rCGTn4Ig";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from out-187.mta1.migadu.com (out-187.mta1.migadu.com
 [95.215.58.187])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 10C6C10E067
 for <dri-devel@lists.freedesktop.org>; Sun, 24 Nov 2024 14:37:03 +0000 (UTC)
X-Report-Abuse: Please report any abuse attempt to abuse@migadu.com and
 include these headers.
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linux.dev; s=key1;
 t=1732459022;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:
 content-transfer-encoding:content-transfer-encoding;
 bh=e1JexP5qKES3KsZCQk3q40DAGc5t+R8erZaju+hJwK0=;
 b=rCGTn4Ig3tjMhUyq8TefREa8ZDiEWEQHE/omA9ex0aHs+C2W95Ke4yA6qITcREbVdh4C1k
 uTLVNUaZ+VF1Q/klxgmBiiFoJyGY1KYGVLC5nfEcEdu8n+iRdZ6oPFqnOpkgVvkTZAI4W/
 CUZO/W52iJjWcUYhLibBmXleMlpsW6Q=
From: Aradhya Bhatia <aradhya.bhatia@linux.dev>
To: Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>,
 Conor Dooley <conor+dt@kernel.org>,
 Tomi Valkeinen <tomi.valkeinen@ideasonboard.com>,
 Jyri Sarha <jyri.sarha@iki.fi>,
 Maarten Lankhorst <maarten.lankhorst@linux.intel.com>,
 Thomas Zimmermann <tzimmermann@suse.de>,
 Maxime Ripard <mripard@kernel.org>, David Airlie <airlied@gmail.com>,
 Laurent Pinchart <laurent.pinchart@ideasonboard.com>,
 Simona Vetter <simona@ffwll.ch>
Cc: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>, Nishanth Menon <nm@ti.com>,
 Vignesh Raghavendra <vigneshr@ti.com>, Devarsh Thakkar <devarsht@ti.com>,
 Praneeth Bajjuri <praneeth@ti.com>, Udit Kumar <u-kumar1@ti.com>,
 Jayesh Choudhary <j-choudhary@ti.com>,
 Francesco Dolcini <francesco@dolcini.it>,
 Alexander Sverdlin <alexander.sverdlin@siemens.com>,
 Max Krummenacher <max.oss.09@gmail.com>,
 DRI Development List <dri-devel@lists.freedesktop.org>,
 Devicetree List <devicetree@vger.kernel.org>,
 Linux Kernel List <linux-kernel@vger.kernel.org>,
 Aradhya Bhatia <aradhya.bhatia@linux.dev>
Subject: [PATCH v4 0/3] drm/tidss: Add OLDI bridge support
Date: Sun, 24 Nov 2024 20:06:46 +0530
Message-Id: <20241124143649.686995-1-aradhya.bhatia@linux.dev>
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

This patch series add support for the dual OLDI TXes supported in Texas
Instruments' AM62x and AM62Px family of SoCs. The OLDI TXes support single-lvds
lvds-clone, and dual-lvds modes. These have now been represented through DRM
bridges within TI-DSS.

 - Some history and hardware description for this patch series.

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

Also, since the DRM framework only really supports a linear encoder-bridge
chain, the OLDI driver creates a DRM bridge ONLY for the primary OLDI TX in
cases of dual-link or cloned single-link OLDI modes. That bridge then attaches
to the tidss's display core - which consists of a CRTC, an Encoder (dummy) and a
bridge (dummy). On the other end, it attaches to OLDI sinks (panels or other
bridges).

Since the OLDI TX have a hardware dependency with the VP, the OLDI configuration
needs to happen before that VP is enabled for streaming. VP stream enable takes
place in tidss_crtc_atomic_enable hook. I have posted a patch allowing DRM
bridges to get pre-enabled before the CRTC of that bridge is enabled[0]. Without
that patch, some warnings or glitches can be seen.

These patches have been tested on AM625 based Beagleplay[3] platform with a
Lincolntech LCD185 dual-lvds panel. The patches with complete support including
the expected devicetree configuration of the OLDI TXes can be found in the
"next_oldi_v4_tests" branch of my github fork[4]. This branch also has support
for Microtips dual-lvds panel (SK-LCD1) which is compatible with the SK-AM625
EVM platform.

Due to lack of hardware, I haven't been able to test single-link / cloned
single-link OLDI modes. I have only used a sample cloned single-link DTBO and
booted the board with it. I didn't see any probe_deferred errors (as seen
previously), and the `kmsprint` utility enumerated the display details fine.

Regardless, I'd appreciate it if somebody can test it, and report back if they
observe any issues.

Thanks,
Aradhya


Additional Notes:

* Important note about a false positive in dtbs_check *
Both the ports, port0 and port1, are required for the OLDI functionality to
work. The schema suggests this condition too. Additionally, the OLDI devicetree
node is expected to be defined in the soc.dtsi file, and kept as disabled.
Over the current platforms (Beagleplay and SK-AM625 EVM), the OLDI panel is not
always attached, and hence we use a DT overlay to add panel details - which is
where we enable the OLDI nodes. The structure of files is like this -

- soc.dtsi                  (OLDI disabled)
- soc-baseboard.dts         (OLDI disabled)
- soc-baseboard-panel.dtso  (OLDI enabled)

During dtbs_check runs, it was observed that the check was not able to rule out
OLDI issues even when its DT was disabled in the soc-baseboard.dts. It is
impractical and impossible to add OLDI ports prior to the panel overlay file.
While the dtbs_check usually ignores checking disabled devicetree nodes, it was
unable to do so in the OLDI's case.


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
V4:
  - Implement fixes suggested by Krzysztof Kozlowski:
    - Squash patches v3:2/4 and v3:3/4 to v4:2/3, and add more hardware details
      in commit description.
    - Change the serial clock name for OLDI, from "s_clk" to "serial".
    - Fix the required condition in the OLDI schema.
    - Other minor fixes.
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
V3: https://lore.kernel.org/all/20240716084248.1393666-1-a-bhatia1@ti.com/
V2: https://lore.kernel.org/all/20240715200953.1213284-1-a-bhatia1@ti.com/
V1: https://lore.kernel.org/all/20240511193055.1686149-1-a-bhatia1@ti.com/


[0]: Dependency Patch: 
("drm/atomic-helper: Re-order bridge chain pre-enable and post-disable")
https://lore.kernel.org/all/20240622110929.3115714-11-a-bhatia1@ti.com/

[1]: AM62 OLDI Series - v7
https://lore.kernel.org/all/20230125113529.13952-1-a-bhatia1@ti.com/

[2]: AM62 DSS Series - v9
https://lore.kernel.org/all/20230616150900.6617-1-a-bhatia1@ti.com/

[3]: TI AM625 SoC based Beagleplay platform
https://www.beagleboard.org/boards/beagleplay

[4]: GitHub Fork for OLDI tests
https://github.com/aradhya07/linux-ab/tree/next_oldi_v4_tests

[5]: ("ti,am65x-dss.yaml: oldi-txes: Missing additionalProperties/
      unevaluatedProperties constraint")
https://lore.kernel.org/all/172107979988.1595945.9666141982402158422.robh@kernel.org/

Aradhya Bhatia (3):
  dt-bindings: display: ti,am65x-dss: Re-indent the example
  dt-bindings: display: ti: Add schema for AM625 OLDI Transmitter
  drm/tidss: Add OLDI bridge support

 .../bindings/display/ti/ti,am625-oldi.yaml    | 119 ++++
 .../bindings/display/ti/ti,am65x-dss.yaml     | 195 ++++++-
 MAINTAINERS                                   |   1 +
 drivers/gpu/drm/tidss/Makefile                |   3 +-
 drivers/gpu/drm/tidss/tidss_dispc.c           |  20 +-
 drivers/gpu/drm/tidss/tidss_dispc.h           |   4 +
 drivers/gpu/drm/tidss/tidss_dispc_regs.h      |  14 +
 drivers/gpu/drm/tidss/tidss_drv.c             |   9 +
 drivers/gpu/drm/tidss/tidss_drv.h             |   5 +
 drivers/gpu/drm/tidss/tidss_oldi.c            | 537 ++++++++++++++++++
 drivers/gpu/drm/tidss/tidss_oldi.h            |  51 ++
 11 files changed, 935 insertions(+), 23 deletions(-)
 create mode 100644 Documentation/devicetree/bindings/display/ti/ti,am625-oldi.yaml
 create mode 100644 drivers/gpu/drm/tidss/tidss_oldi.c
 create mode 100644 drivers/gpu/drm/tidss/tidss_oldi.h


base-commit: cfba9f07a1d6aeca38f47f1f472cfb0ba133d341
-- 
2.34.1

