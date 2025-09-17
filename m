Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 30AE4B7D4F8
	for <lists+dri-devel@lfdr.de>; Wed, 17 Sep 2025 14:23:14 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 4C4EC10E1AC;
	Wed, 17 Sep 2025 12:23:11 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (1024-bit key; unprotected) header.d=collabora.com header.i=nicolas.frattaroli@collabora.com header.b="Aug/0ye6";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from sender4-pp-f112.zoho.com (sender4-pp-f112.zoho.com
 [136.143.188.112])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 050F510E1AC
 for <dri-devel@lists.freedesktop.org>; Wed, 17 Sep 2025 12:23:09 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; t=1758111776; cv=none; 
 d=zohomail.com; s=zohoarc; 
 b=Gb1ifiTUOPyndkjTN+2xpPGga9BAz0SLBvNaZpFEwAx/n0YdsyMnqYAbm3Et4kgZQY29hTouZJ5kqVcrRwCp8wmVK+j/ZrrtaL6N67MWyL18zFTv94k/FyysXY9PW4Sy+kp/9bNJNoFsKx1ozyQPvWKSRT+5Phi3QpL1cJfUuwE=
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=zohomail.com;
 s=zohoarc; t=1758111776;
 h=Content-Type:Content-Transfer-Encoding:Cc:Cc:Date:Date:From:From:MIME-Version:Message-ID:Subject:Subject:To:To:Message-Id:Reply-To;
 bh=Ug5+S5cIojqltKvySVxRSjgvAxsd/Ij+5vFH1EQnbEU=; 
 b=FfaQ7N45oYnuT0M7yV6zDgr3D6rgfWfntD+TA2lsF03Sj5AuMY+f8IZqVfs7setOg8iWte7dZUNH1CmohQyJ0uKZm51bXEgh/6kRvb0e5WLFsJeM0wvRZNf2H13q1irpNrRfThy9PJ9+M7CzQdS1gDmGQ9rknd+GEZSfvrIFPJ8=
ARC-Authentication-Results: i=1; mx.zohomail.com;
 dkim=pass  header.i=collabora.com;
 spf=pass  smtp.mailfrom=nicolas.frattaroli@collabora.com;
 dmarc=pass header.from=<nicolas.frattaroli@collabora.com>
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; t=1758111776; 
 s=zohomail; d=collabora.com; i=nicolas.frattaroli@collabora.com;
 h=From:From:Subject:Subject:Date:Date:Message-Id:Message-Id:MIME-Version:Content-Type:Content-Transfer-Encoding:To:To:Cc:Cc:Reply-To;
 bh=Ug5+S5cIojqltKvySVxRSjgvAxsd/Ij+5vFH1EQnbEU=;
 b=Aug/0ye6/wjbtOgGHnDzVIyRN19yEZUKfzaBV5+7OxLcOCPr1Sjr2c3LtgfVICJe
 xAscvf8+9HOePw2Yqdzs9w3KjHcMWk3C3g0NNeBHUHx5KkopLyQ/ZKOxOUZrnhLi+he
 AswP4Dbu0C9NrE2U3RWXeqhjkXi7qts4hxWnSk7s=
Received: by mx.zohomail.com with SMTPS id 1758111774983700.8501163587921;
 Wed, 17 Sep 2025 05:22:54 -0700 (PDT)
From: Nicolas Frattaroli <nicolas.frattaroli@collabora.com>
Subject: [PATCH v3 00/10] MT8196 GPU Frequency/Power Control Support
Date: Wed, 17 Sep 2025 14:22:31 +0200
Message-Id: <20250917-mt8196-gpufreq-v3-0-c4ede4b4399e@collabora.com>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
X-B4-Tracking: v=1; b=H4sIAAioymgC/3XQzW6EIBAH8FcxnIuBceXDbJp9j6aHUdElUdmCm
 m02vnsRe2i3aTj9gfnNwIME460JpMoexJvVBuumGIqXjDRXnHpDbRszAQYlU6DpOCuuBe1vS+f
 NB0UpTqWQrOUKSCy6edPZewLf3o8cry3RnY9NUmMwtHHjaOcqm8x9psnWXOz1owkBU9cqO38fl
 HHpk8xBSq0KyumAi8d8Qndp3DBg7WKK4ut/QMEY8LLMOReFZioKblix68ylH9EOR+0+7dWG2fn
 P9BsrT+MeBCufH75yyqisRQOtqA0A/z1L4lb4QXD4Q8BOSI0KCwm61c/Etm1fOMPqsaEBAAA=
X-Change-ID: 20250829-mt8196-gpufreq-a7645670d182
To: AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>, 
 Boris Brezillon <boris.brezillon@collabora.com>, 
 Steven Price <steven.price@arm.com>, Liviu Dudau <liviu.dudau@arm.com>, 
 Maarten Lankhorst <maarten.lankhorst@linux.intel.com>, 
 Maxime Ripard <mripard@kernel.org>, Thomas Zimmermann <tzimmermann@suse.de>, 
 David Airlie <airlied@gmail.com>, Simona Vetter <simona@ffwll.ch>, 
 Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>, 
 Conor Dooley <conor+dt@kernel.org>, 
 Matthias Brugger <matthias.bgg@gmail.com>, 
 MyungJoo Ham <myungjoo.ham@samsung.com>, 
 Kyungmin Park <kyungmin.park@samsung.com>, 
 Chanwoo Choi <cw00.choi@samsung.com>, Jassi Brar <jassisinghbrar@gmail.com>, 
 Kees Cook <kees@kernel.org>, "Gustavo A. R. Silva" <gustavoars@kernel.org>, 
 Chia-I Wu <olvaffe@gmail.com>, Chen-Yu Tsai <wenst@chromium.org>
Cc: kernel@collabora.com, dri-devel@lists.freedesktop.org, 
 devicetree@vger.kernel.org, linux-kernel@vger.kernel.org, 
 linux-arm-kernel@lists.infradead.org, linux-mediatek@lists.infradead.org, 
 linux-pm@vger.kernel.org, linux-hardening@vger.kernel.org, 
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
application processor through a mailbox and some SRAM, and is in charge
of controlling the regulators, the PLL clocks, and the power gating of
the GPU, all while also being in charge of any DVFS control.

This set of drivers is enough to communicate desired OPP index limits to
the aforementioned MCU, referred to as "GPUEB" from here on out. The
GPUEB is still free to lower the effective frequency if the GPU has no
jobs going on at all, even when a higher OPP is set. There's also
several more powerful OPPs it seemingly refuses to apply. The downstream
chromeos kernel also doesn't reach the frequencies of those OPPs, so we
assume this is expected.

The frequency control driver lives in panthor's subdirectory, as it
needs to pass panthor some data. I've kept the tie-in parts generic
enough however to not make this a complete hack; mediatek_mfg (the
frequency control driver) registers itself as a "devfreq provider" with
panthor, and panthor picks it up during its probe function (or defers if
mediatek_mfg is not ready yet, after adding a device link first).

It's now generic enough to where I'll ponder about moving the devfreq
provider stuff into a header in include/, and moving mediatek_mfg into
the drivers/soc/ subdirectory, but there were enough changes so far to
warrant a v3 without a move or further struct renames added, so that I
can get feedback on this approach.

The mailbox driver is a fairly bog-standard common mailbox framework
driver, just specific to the firmware that runs on the GPUEB.

Signed-off-by: Nicolas Frattaroli <nicolas.frattaroli@collabora.com>
---
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
Nicolas Frattaroli (10):
      dt-bindings: gpu: mali-valhall-csf: add mediatek,mt8196-mali variant
      dt-bindings: devfreq: add mt8196-gpufreq binding
      dt-bindings: sram: Add compatible for mediatek,mt8196-gpufreq-sram
      dt-bindings: mailbox: Add MT8196 GPUEB Mailbox
      mailbox: add MediaTek GPUEB IPI mailbox
      drm/panthor: call into devfreq for current frequency
      drm/panthor: devfreq: make get_dev_status use get_cur_freq
      drm/panthor: devfreq: add pluggable devfreq providers
      drm/panthor: add no_clocks soc_data member for MT8196
      drm/panthor: add support for MediaTek MFlexGraphics

 .../bindings/devfreq/mediatek,mt8196-gpufreq.yaml  | 112 +++
 .../bindings/gpu/arm,mali-valhall-csf.yaml         |  32 +-
 .../mailbox/mediatek,mt8196-gpueb-mbox.yaml        |  64 ++
 Documentation/devicetree/bindings/sram/sram.yaml   |   1 +
 drivers/gpu/drm/panthor/Kconfig                    |  13 +
 drivers/gpu/drm/panthor/Makefile                   |   2 +
 drivers/gpu/drm/panthor/mediatek_mfg.c             | 946 +++++++++++++++++++++
 drivers/gpu/drm/panthor/panthor_devfreq.c          | 223 ++++-
 drivers/gpu/drm/panthor/panthor_devfreq.h          |  49 ++
 drivers/gpu/drm/panthor/panthor_device.c           |   3 +
 drivers/gpu/drm/panthor/panthor_device.h           |   6 +-
 drivers/gpu/drm/panthor/panthor_drv.c              |   5 +-
 drivers/mailbox/Kconfig                            |  10 +
 drivers/mailbox/Makefile                           |   2 +
 drivers/mailbox/mtk-gpueb-mailbox.c                | 330 +++++++
 15 files changed, 1765 insertions(+), 33 deletions(-)
---
base-commit: 65ca971b838b0fbb45efc48751644105e9d91aa7
change-id: 20250829-mt8196-gpufreq-a7645670d182
prerequisite-message-id: <20250915151947.277983-1-laura.nao@collabora.com>
prerequisite-patch-id: 441c4c2e3d22f83a41241a1ab5c9be1a442f742e
prerequisite-patch-id: 852bfc3d13e2bccc4d6f4813a71c42f329dadb0c
prerequisite-patch-id: 0bc5b7bf268e88a6ef22e46c91db7645e2ce6189
prerequisite-patch-id: 442533e316e46ecd47cd0b7fb410b58fad2b3bf9
prerequisite-patch-id: 04377d5612f4513e44b6d7d6016125d75f9ccd65
prerequisite-patch-id: d61046e2cd2f33024092e96e8a987b9c34c24e73
prerequisite-patch-id: 62f28c3bf605f6df622d71cbe1bc982e289a39cf
prerequisite-patch-id: 27fadb12ce15099a684c08d4f8c785bedc87cef2
prerequisite-patch-id: 7796ec9a0162ae96b708ea513742016657c69e14
prerequisite-patch-id: f7549078f3702acdf1e6dcd36ddebab0e543b5db
prerequisite-patch-id: 3ec0d9470d639154fb347c9561fbe705eee4bd51
prerequisite-patch-id: fa96e18eae90efc14e4b9f13534c013b448a3f84
prerequisite-patch-id: 8c7e63c9ea7863818f7d31291417b90ac3124ee7
prerequisite-patch-id: ffff2977d8f2a3a44c3606f77d38f8745cb3c60a
prerequisite-patch-id: 71d23f4f096e424ae3aa59a23695f5b1e488fab0
prerequisite-patch-id: 3c12631f22a39d6def9340ed840e9e55e1a76304
prerequisite-patch-id: caec6572d5d9a37183601b8e38f50af797df635e
prerequisite-patch-id: d5b3d5719675a1e3be26e028b5596d39e839bc09
prerequisite-patch-id: 9d5359fcf729db5b707772ff3596e72a401473c6
prerequisite-patch-id: f3f789e0d919dd92b7d811a4e11c57bb05f71617
prerequisite-patch-id: 79cca92633ca3d9cc2f1f38b6fc977a8d8543d60
prerequisite-patch-id: f663f8f3bddf198d0cab083bac7ebb88689ffc82
prerequisite-patch-id: a0ffc5b88c5eb88c491f6187672012c621bd520c
prerequisite-patch-id: e6c6d67b034d06b6158a0e0f8299ad28f0e59134
prerequisite-patch-id: 25f658fbd1238bd57e05ff299d0436f942bdcc4d
prerequisite-patch-id: 7be8439e241a320b0eb0a264a8a59a9beef383d6
prerequisite-patch-id: b903714dbe7d6a44fbe18faa02d59862ceadf217
prerequisite-message-id: <20250913002155.1163908-1-olvaffe@gmail.com>
prerequisite-patch-id: a769ebe04bd74f45a3a5b9c1d1396f4b33b7783f
prerequisite-patch-id: 9d71426f40b702e975f2a672509fcd20180ac36c

Best regards,
-- 
Nicolas Frattaroli <nicolas.frattaroli@collabora.com>

