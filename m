Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id B0E23BB80EE
	for <lists+dri-devel@lfdr.de>; Fri, 03 Oct 2025 22:15:43 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id A068410E96C;
	Fri,  3 Oct 2025 20:15:41 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (1024-bit key; unprotected) header.d=collabora.com header.i=nicolas.frattaroli@collabora.com header.b="cxvCjjDY";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from sender4-pp-f112.zoho.com (sender4-pp-f112.zoho.com
 [136.143.188.112])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 51E6D10E96C
 for <dri-devel@lists.freedesktop.org>; Fri,  3 Oct 2025 20:15:40 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; t=1759522527; cv=none; 
 d=zohomail.com; s=zohoarc; 
 b=TB3N59rMVl++Cqhev2whZyOKfFhhIUeLYogj6cIydwbvxKc7wormT8kUOfHMnZ7ACMPyrblQANWV1z9Tqabxnp0Wv0HYQSfH5CWyze/H0XPpAW0veqpaoy3dHkVI0xpjon+18diZ5+U7i4sD5Iae5zM/bAcec4nbP3jk5aSxE7k=
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=zohomail.com;
 s=zohoarc; t=1759522527;
 h=Content-Type:Content-Transfer-Encoding:Cc:Cc:Date:Date:From:From:MIME-Version:Message-ID:Subject:Subject:To:To:Message-Id:Reply-To;
 bh=0XYFQyicZ7vdEJ9Vg7FR/sH93Q/aXWh147Zd+X8iiNM=; 
 b=CyNc8tIsgkU5lfk5hOpm9e/j232b99tCyyAGlr+tgPT3/f0ZR89+ntnvZ4IOmYiwftUeZYKk7d7bY+t0d7rcwagANZ/UUqR1cefNlAq/6nvFDOtALd5bH2Zgk7LQJJBttLvA9Yn5n5Ee0+Z7qsadycAE3i9TR42HDd6mM1cPeFg=
ARC-Authentication-Results: i=1; mx.zohomail.com;
 dkim=pass  header.i=collabora.com;
 spf=pass  smtp.mailfrom=nicolas.frattaroli@collabora.com;
 dmarc=pass header.from=<nicolas.frattaroli@collabora.com>
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; t=1759522527; 
 s=zohomail; d=collabora.com; i=nicolas.frattaroli@collabora.com;
 h=From:From:Subject:Subject:Date:Date:Message-Id:Message-Id:MIME-Version:Content-Type:Content-Transfer-Encoding:To:To:Cc:Cc:Reply-To;
 bh=0XYFQyicZ7vdEJ9Vg7FR/sH93Q/aXWh147Zd+X8iiNM=;
 b=cxvCjjDYjpP1WqSfbdwsluQufZwk45RBcoS+5ucpcZuW8ERuXSAEeBbOYKwFy4xL
 r5gqsv6mDhB6QI8Pvwyz88i0HdDYDXbKmsr+4WMtIZeUOmzc85PN40CmgPkFf3W9iXb
 QQ4M2kvMpnj1SKalREZAUrOUktgVXaYC17lbJI/M=
Received: by mx.zohomail.com with SMTPS id 1759522524954776.4491951157889;
 Fri, 3 Oct 2025 13:15:24 -0700 (PDT)
From: Nicolas Frattaroli <nicolas.frattaroli@collabora.com>
Subject: [PATCH v6 0/7] MT8196 GPU Frequency/Power Control Support
Date: Fri, 03 Oct 2025 22:15:02 +0200
Message-Id: <20251003-mt8196-gpufreq-v6-0-76498ad61d9e@collabora.com>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
X-B4-Tracking: v=1; b=H4sIAMYu4GgC/23Ry27DIBAF0F+xWJcIhpexqir/UXWBYZwg+ZEax
 0oV5d+LnY0VZ3kRcy4j7iThGDGRqriTEeeY4tDnoD8K4s+uPyGNIWcCDBQrwdJuKrnV9HS5NiP
 +Ume0VNqwwEsgeegyYhNvK/j988z52jW70/OQ1C4h9UPXxakqerxNdLE5Y2KZ7zAlt7ZWxedaa
 rlgDLhSB861sKyknA7t7JoGj6fOxfaQsS+ylJ1jmobxb11m5mvbk2Dq9d0zp4yaWnsIukYAfvR
 D27p6GN3irdwMG4LDjoCFMNaVThiwwb4jxJYwO0JkwksMKGsprMV3hNwQIHaEzIT2QQsX0Iig3
 xFqS+z+cFaZEExpVOgbo9Ur8Xg8/gEfz+7SKQIAAA==
X-Change-ID: 20250829-mt8196-gpufreq-a7645670d182
To: AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>, 
 Boris Brezillon <boris.brezillon@collabora.com>, 
 Jassi Brar <jassisinghbrar@gmail.com>, Chia-I Wu <olvaffe@gmail.com>, 
 Chen-Yu Tsai <wenst@chromium.org>, Steven Price <steven.price@arm.com>, 
 Liviu Dudau <liviu.dudau@arm.com>, 
 Maarten Lankhorst <maarten.lankhorst@linux.intel.com>, 
 Maxime Ripard <mripard@kernel.org>, Thomas Zimmermann <tzimmermann@suse.de>, 
 David Airlie <airlied@gmail.com>, Simona Vetter <simona@ffwll.ch>, 
 Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>, 
 Conor Dooley <conor+dt@kernel.org>, 
 Matthias Brugger <matthias.bgg@gmail.com>, Kees Cook <kees@kernel.org>, 
 "Gustavo A. R. Silva" <gustavoars@kernel.org>, 
 Ulf Hansson <ulf.hansson@linaro.org>
Cc: kernel@collabora.com, dri-devel@lists.freedesktop.org, 
 devicetree@vger.kernel.org, linux-kernel@vger.kernel.org, 
 linux-arm-kernel@lists.infradead.org, linux-mediatek@lists.infradead.org, 
 linux-hardening@vger.kernel.org, linux-pm@vger.kernel.org, 
 Nicolas Frattaroli <nicolas.frattaroli@collabora.com>, 
 Conor Dooley <conor.dooley@microchip.com>
X-Mailer: b4 0.14.2
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

This series introduces two new drivers to accomplish controlling the
frequency and power of the Mali GPU on MediaTek MT8196 SoCs.

The reason why it's not as straightforward as with other SoCs is that
the MT8196 has quite complex glue logic in order to squeeze the maximum
amount of performance possible out of the silicon. There's an additional
MCU running a specialised firmware, which communicates with the
application processor through a mailbox and some reserved memory, and is
in charge of controlling the regulators, the PLL clocks, and the power
gating of the GPU, all while also being in charge of any DVFS control.

This set of drivers is enough to communicate desired OPP index limits to
the aforementioned MCU, referred to as "GPUEB" from here on out. The
GPUEB is still free to lower the effective frequency if the GPU has no
jobs going on at all, even when a higher OPP is set.

The power- and frequency control driver, mtk-mfg-pmdomain, is now
implemented as a power domain driver, with a set_performance_state
operation. It also exposes itself as a clock provider, so that panthor
can read the actual achieved DVFS clock rate as per the GPUEB firmware.

This power domain approach means that panthor does not need to know
about how the frequency control works on this SoC, as the OPP core
framework already takes care of it. The only exception is that panthor
needs to not register OPPs from DT itself if there already is an OPP
table present.

The mailbox driver is a fairly bog-standard common mailbox framework
driver, just specific to the firmware that runs on the GPUEB.

Signed-off-by: Nicolas Frattaroli <nicolas.frattaroli@collabora.com>
---
Changes in v6:
- mailbox: move buf definition into if condition, as per Chia-I Wu
- panthor: remove the redundant NULL checks in panthor_devfreq_get_freq
- mtk-mfg-pmdomain: adjust return style consistency
- mtk-mfg-pmdomain: add docstring for mtk_mfg_send_ipi to explain it's
  blocking
- mtk-mfg-pmdomain: use CMD_FIX_DUAL_TARGET_OPPIDX instead of
  CMD_FIX_TARGET_OPPIDX.
- mtk-mfg-pmdomain: reword code comments to not be in the "we" style
- mtk-mfg-pmdomain: shuffle around mbox allocations as per Angelo
- mtk-mfg-pmdomain: don't pointlessly turn on EB clock in probe,
  reducing the need for a comment explaining the bookkeeping
- mtk-mfg-pmdomain: consistently use dev_err_probe and Capitalise first
  letter of error string
- mtk-mfg-pmdomain: get rid of redundant ret = dev_err_probe assignment
- mtk-mfg-pmdomain: reintroduce stack OPP table, choose min(gpu, stack)
  when adding frequencies. Fixes gaps in OPP levels where only stack
  changed, but gpu had duplicates, which resulted in choosing a too slow
  OPP
- mtk-mfg-pmdomain: stub round_rate clk op to opt out of CCF always
  "rounding" a devfreq rate request to the current rate
- Link to v5: https://lore.kernel.org/r/20250929-mt8196-gpufreq-v5-0-3056e5ecf765@collabora.com

Changes in v5:
- mtk-mfg-pmdomain binding: add memory-regions property, remove shmem
  property, as we now correctly describe the shared memory as a regular
  memory region
- mtk-mfg-pmdomain binding: get rid of redundant |
- drop "dt-bindings: sram: Add compatible for
  mediatek,mt8196-gpufreq-sram" as part of the move to reserved memory
- mtk-mfg-pmdomain: move to using reserved-memory for GPUEB shared
  memory
- mtk-mfg-pmdomain: demote some types to smaller sizes in struct
  mtk_mfg, as per Angelo's suggestions
- mtk-mfg-pmdomain: use units.h for Hz-to-KHz
- mtk-mfg-pmdomain: change for loop in attach_dev to reduce indentation
- mtk-mfg-pmdomain: simplify return in mtk_mfg_power_off
- mtk-mfg-pmdomain: move of_device_id after probe
- mtk_mfg_pmdomain: map mmio by index
- mtk_mfg_pmdomain: add error checking to pm_genpd_init()
- mtk_mfg_pmdomain: add remove function
- mtk_mfg_pmdomain: remove last_opp member and logic, since OPP core
  already does that for us
- mtk_mfg_pmdomain: adjust comment in mtk_mfg_set_performance to explain
  why we're doing what we're doing
- mtk_mfg_pmdomain: call mtk_mfg_set_oppidx in mtk_mfg_power_on with
  the performance_state we deferred setting while it was powered off
- mtk_mfg_pmdomain: add inline function for PWR_ACK checking, as it's
  now used twice with the added remove function
- mtk-mfg-pmdomain: add suppress_bind_attrs so people don't play with
  that
- mtk-mfg-pmdomain: change KConfig from tristate to bool, as module
  unloading results in strange likely firmware-induced hardware state
  woes in the mali GPU
- mtk-mfg-pmdomain: read IPI magic in power_on, don't zero it after
  confirming that seemingly had no purpose
- mtk-mfg-pmdomain: misc style changes
- Link to v4: https://lore.kernel.org/r/20250923-mt8196-gpufreq-v4-0-6cd63ade73d6@collabora.com

Changes in v4:
- rebase onto next-20250922, which includes Laura Nao's clock patches
- refactor mediatek_mfg into a pmdomain driver called "mtk-mfg-pmdomain"
- move mt8196-gpufreq binding to the power subdirectory
- mali-valhall-csf binding: adjust for power-domains usage
- mali-valhall-csf binding: use clocks on mt8196
- mailbox: prefix defines with "GPUEB_"
- mailbox: get rid of custom of_xlate
- mailbox: rename "CLOGGED" to "BLOCKED"
- mailbox: adjust send_data comment to include more technical info
- mailbox: misc style improvements
- panthor: drop "drm/panthor: devfreq: make get_dev_status use
  get_cur_freq", as it is now not necessary and makes the code worse
- panthor: drop "drm/panthor: devfreq: add pluggable devfreq providers"
- panthor: drop "drm/panthor: add no_clocks soc_data member for MT8196",
  as we now have clocks courtesy of gpufreq
- panthor: check for existing opp table before registering a new one
- mtk-mfg-pmdomain: add turbo_below variant data, which marks OPPs below
  a certain index as turbo for the OPP subsystem
- mtk-mfg-pmdomain: no longer read stack OPPs, as they weren't used
- mtk-mfg-pmdomain: get rid of num gpu opp != num stack opp check.
  That's the firmware's problem should it ever happen, not ours
- mtk-mfg-pmdomain: some small name and whitespace changes on the defines
- Link to v3: https://lore.kernel.org/r/20250917-mt8196-gpufreq-v3-0-c4ede4b4399e@collabora.com

Changes in v3:
- mali-valhall-csf binding: get rid of clocks for MT8196, rebase onto
  Chia-I Wu's patch
- mt8196-gpufreq binding: rename hw_revision to hw-revision
- mt8196-gpufreq binding: rename clocks
- mt8196-gpufreq binding: drop pointless label in example
- mailbox binding: drop pointless label in example
- mailbox: whitespace changes on defines
- mailbox: remove rx_buf member from channel struct, use stack buffer
- mailbox: check in probe that no rx_len exceeds MBOX_MAX_RX_SIZE
- panthor: add no_clocks SoC data patch, also rebase onto Chia-I Wu's
  series
- panthor: refactor devfreq provider functionality to do allocation and
  initialisation of panthor_devfreq struct in panthor in all cases
- panthor: drop the patch that moves struct panthor_devfreq to a header
  file, as it no longer needs to be exposed to devfreq providers
- mediatek_mfg: refactor devfreq provider functionality to decouple it
  more from panthor itself
- mediatek_mfg: move SRAM magic to a #define
- mediatek_mfg: begrudgingly rename member "padding_lol" to "reserved"
- mediatek_mfg: use local struct device pointer var in more places
- mediatek_mfg: change wording of sleep command failure error message,
  but keep the format specifier because I don't want to throw bare
  errnos at users
- mediatek_mfg: remove unnecessary braces around dev_err EB power off
  timeout message
- mediatek_mfg: allocate rx_data for channels that expect a response
- mediatek_mfg: memcpy the rx buffer from the common mailbox framework
  in the rx callback to rx_data, as mssg now points to stack memory
- mediatek_mfg: make SRAM clearing message dev_dbg
- mediatek_mfg: no longer print physical address of SRAM
- mediatek_mfg: expand on the GF_REG_OPP_TABLE_STK comment, toning down
  its defeatist attitude in the process
- mediatek_mfg: style fixes in mtk_mfg_get_closest_opp_idx
- mediatek_mfg: rename clocks and hw-revision reg as per binding
- Link to v2: https://lore.kernel.org/r/20250912-mt8196-gpufreq-v2-0-779a8a3729d9@collabora.com

Changes in v2:
- mali-valhall-csf binding: move from performance-controller to
  performance-domains property
- mali-valhall-csf binding: fix vendor name oopsie in compatible of if
  condition
- mt8196-gpufreq binding: move from performance-controller to
  performance-domains by adding the cells property
- mt8196-gpufreq binding: rename e2_id to hw_revision
- mt8196-gpufreq binding: add description that mentions "MediaTek
  Flexible Graphics"
- mt8196-gpufreq binding: get rid of mailbox channels we're unlikely to
  use any time soon, if ever
- mt8196-gpufreq binding: change name of mailbox channels to use -
  instead of _
- mailbox binding: change reg-names to "data" and "ctl"
- drm/panthor: mediatek_mfg: rename e2_id to hw_revision
- drm/panthor: devfreq: switch from performance-controller to
  performance-domains
- drm/panthor: devfreq: get rid of the accidental get_cur_freq function
  move
- mailbox: rename mtk_gpueb_mbox_ch to mtk_gpueb_mbox_chan_desc
- mailbox: use smaller types in mtk_gpueb_mbox_chan_desc where possible
- mailbox: add per-channel runtime data struct
- mailbox: request one threaded IRQ per channel, pass channel struct as
  data
- mailbox: make num_channels in variant struct u8
- mailbox: get rid of no_response, as it was redundant
- mailbox: enable and disable clock in mailbox startup/shutdown
- mailbox: point con_priv of mailbox framework channel struct to this
  driver's channel struct
- mailbox: request and free the threaded IRQ in startup/shutdown
- mailbox: only clear IRQ bit flag once RX data has been read from MMIO
- mailbox: reduce needlessly large receive buffer size
- mailbox: handle allocation errors wherever they could pop up
- mailbox: style cleanups in mtk_gpueb_mbox_read_rx
- mailbox: call platform_get_irq earlier on in probe
- mailbox: set drvdata later on in probe
- mailbox: ioremap resources by index, not name
- mailbox: handle devm_mbox_controller_register errors
- mailbox: rename channels to correspond to bindings
- mailbox: document a few of the private driver structs to be kind to
  the next person who will look at this code
- Link to v1: https://lore.kernel.org/r/20250905-mt8196-gpufreq-v1-0-7b6c2d6be221@collabora.com

---
Nicolas Frattaroli (7):
      dt-bindings: gpu: mali-valhall-csf: add mediatek,mt8196-mali variant
      dt-bindings: power: Add MT8196 GPU frequency control binding
      dt-bindings: mailbox: Add MT8196 GPUEB Mailbox
      mailbox: add MediaTek GPUEB IPI mailbox
      drm/panthor: call into devfreq for current frequency
      drm/panthor: Use existing OPP table if present
      pmdomain: mediatek: Add support for MFlexGraphics

 .../bindings/gpu/arm,mali-valhall-csf.yaml         |   40 +-
 .../mailbox/mediatek,mt8196-gpueb-mbox.yaml        |   64 ++
 .../bindings/power/mediatek,mt8196-gpufreq.yaml    |  117 +++
 drivers/gpu/drm/panthor/panthor_devfreq.c          |   56 +-
 drivers/gpu/drm/panthor/panthor_devfreq.h          |    2 +
 drivers/gpu/drm/panthor/panthor_device.h           |    3 -
 drivers/gpu/drm/panthor/panthor_drv.c              |    4 +-
 drivers/mailbox/Kconfig                            |   10 +
 drivers/mailbox/Makefile                           |    2 +
 drivers/mailbox/mtk-gpueb-mailbox.c                |  319 ++++++
 drivers/pmdomain/mediatek/Kconfig                  |   16 +
 drivers/pmdomain/mediatek/Makefile                 |    1 +
 drivers/pmdomain/mediatek/mtk-mfg-pmdomain.c       | 1027 ++++++++++++++++++++
 13 files changed, 1641 insertions(+), 20 deletions(-)
---
base-commit: 4a7bcf9e0158d9976525370ff84401a1e955bbee
change-id: 20250829-mt8196-gpufreq-a7645670d182
prerequisite-message-id: <20250913002155.1163908-1-olvaffe@gmail.com>
prerequisite-patch-id: a769ebe04bd74f45a3a5b9c1d1396f4b33b7783f
prerequisite-patch-id: 9d71426f40b702e975f2a672509fcd20180ac36c

Best regards,
-- 
Nicolas Frattaroli <nicolas.frattaroli@collabora.com>

