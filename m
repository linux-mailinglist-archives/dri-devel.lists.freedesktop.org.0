Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id B7A5FB55652
	for <lists+dri-devel@lfdr.de>; Fri, 12 Sep 2025 20:37:46 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 3B09E10E0F3;
	Fri, 12 Sep 2025 18:37:43 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (1024-bit key; unprotected) header.d=collabora.com header.i=nicolas.frattaroli@collabora.com header.b="GlFy5cAF";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from sender4-pp-f112.zoho.com (sender4-pp-f112.zoho.com
 [136.143.188.112])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 69E4910E0F3
 for <dri-devel@lists.freedesktop.org>; Fri, 12 Sep 2025 18:37:41 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; t=1757702248; cv=none; 
 d=zohomail.com; s=zohoarc; 
 b=nu4KmJ2N60G1yz9Eoen/X7PRUvdZnlBGj10lG600mM1PncXXeZPImMcX6/F+4vSOLNFYjDHqU13/MM19syF/2QBzDpM34efjuWR0qHz6quxh8eqrxECM2B+JD3FXEmv7DUBO5sC79kd1GCqet9vi/AxbM/plaTg7uW+s0E6HQKs=
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=zohomail.com;
 s=zohoarc; t=1757702248;
 h=Content-Type:Content-Transfer-Encoding:Cc:Cc:Date:Date:From:From:MIME-Version:Message-ID:Subject:Subject:To:To:Message-Id:Reply-To;
 bh=YUFMpPGqjfxLBE7yXeP/sK6tUiLACLKXHEb7VBkFoTA=; 
 b=TUXkOLJ4rl1MbCUXHoemH9podesbAURBZCatyDTZYoe4uabfPsv/rPfVTokyYjepLxv77YNr5JhTsMNIjvudexAv8YFsVdtyWUHGpD7c3Tvug+LKKppbRFxsIiIcPrbiSCmqzrnfc+r/ggZDuJjoV8X4J1GNd9mE+mfD9g7x/gc=
ARC-Authentication-Results: i=1; mx.zohomail.com;
 dkim=pass  header.i=collabora.com;
 spf=pass  smtp.mailfrom=nicolas.frattaroli@collabora.com;
 dmarc=pass header.from=<nicolas.frattaroli@collabora.com>
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; t=1757702248; 
 s=zohomail; d=collabora.com; i=nicolas.frattaroli@collabora.com;
 h=From:From:Subject:Subject:Date:Date:Message-Id:Message-Id:MIME-Version:Content-Type:Content-Transfer-Encoding:To:To:Cc:Cc:Reply-To;
 bh=YUFMpPGqjfxLBE7yXeP/sK6tUiLACLKXHEb7VBkFoTA=;
 b=GlFy5cAFjHCT4hRn2VPCL3CP6PhxVlbvLKpm0LpJSbuD0DP4J9JBA5/Q+f++pHV4
 w4r5GDZ/CZmQRQyyG1j40whOAcrp8SALg4oXNh+Tx+izLy0PYF5/eCIxeom1RX57/hW
 SCquv7+oiTZHRY6ITHxL3ntLerBUNyKWHI/BAnHo=
Received: by mx.zohomail.com with SMTPS id 1757702245899650.0983092702398;
 Fri, 12 Sep 2025 11:37:25 -0700 (PDT)
From: Nicolas Frattaroli <nicolas.frattaroli@collabora.com>
Subject: [PATCH v2 00/10] MT8196 GPU Frequency/Power Control Support
Date: Fri, 12 Sep 2025 20:36:59 +0200
Message-Id: <20250912-mt8196-gpufreq-v2-0-779a8a3729d9@collabora.com>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
X-B4-Tracking: v=1; b=H4sIAExoxGgC/12P226DMAyGXwX5eq5id4SDqmnvMfUigNtGAtIlA
 XWqePdlQbvYLn8fvs9+QhBvJUBbPMHLaoN1cwr8UkB/M/NV0A4pAysuVc0NTrGmRuP1vly8fKK
 p9GupKzVQzZCW7l4u9pGBH+c9p7ElceNehM4Ewd5Nk41tMcsjYmY3lPcnCcFka1ucfqWp2dDxQ
 EcquUbC0SzeHGbj3ns3jqZzKSXiG/wYbzZE57/yRytl5S5Q5f/jV0KFVad7HnQnzPSXB+dt274
 Bw/P0wCIBAAA=
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
 Nicolas Frattaroli <nicolas.frattaroli@collabora.com>
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
registers a devfreq device for the panthor GPU device, and needs to
mingle with it somewhat closely. I've kept the tie-in parts generic
enough however to not make this a complete hack; mediatek_mfg (the
frequency control driver) registers itself as a "devfreq provider" with
panthor, and panthor picks it up during its probe function (or defers if
mediatek_mfg is not ready yet, after adding a device link first).

The mailbox driver is a fairly bog-standard common mailbox framework
driver, just specific to the firmware that runs on the GPUEB.

Signed-off-by: Nicolas Frattaroli <nicolas.frattaroli@collabora.com>
---
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
      drm/panthor: move panthor_devfreq struct to header
      drm/panthor: devfreq: expose get_dev_status and make it more generic
      drm/panthor: devfreq: add pluggable devfreq providers
      drm/panthor: add support for MediaTek MFlexGraphics

 .../bindings/devfreq/mediatek,mt8196-gpufreq.yaml  |  113 +++
 .../bindings/gpu/arm,mali-valhall-csf.yaml         |   32 +-
 .../mailbox/mediatek,mt8196-gpueb-mbox.yaml        |   64 ++
 Documentation/devicetree/bindings/sram/sram.yaml   |    1 +
 drivers/gpu/drm/panthor/Kconfig                    |   13 +
 drivers/gpu/drm/panthor/Makefile                   |    2 +
 drivers/gpu/drm/panthor/mediatek_mfg.c             | 1053 ++++++++++++++++++++
 drivers/gpu/drm/panthor/panthor_devfreq.c          |  136 ++-
 drivers/gpu/drm/panthor/panthor_devfreq.h          |   57 +-
 drivers/gpu/drm/panthor/panthor_device.h           |    3 -
 drivers/gpu/drm/panthor/panthor_drv.c              |    4 +-
 drivers/mailbox/Kconfig                            |   10 +
 drivers/mailbox/Makefile                           |    2 +
 drivers/mailbox/mtk-gpueb-mailbox.c                |  337 +++++++
 14 files changed, 1788 insertions(+), 39 deletions(-)
---
base-commit: 51095600e8c19d53729a7fbd273abc4435a25e9b
change-id: 20250829-mt8196-gpufreq-a7645670d182
prerequisite-message-id: <20250829091913.131528-1-laura.nao@collabora.com>
prerequisite-patch-id: 441c4c2e3d22f83a41241a1ab5c9be1a442f742e
prerequisite-patch-id: 852bfc3d13e2bccc4d6f4813a71c42f329dadb0c
prerequisite-patch-id: 0bc5b7bf268e88a6ef22e46c91db7645e2ce6189
prerequisite-patch-id: 442533e316e46ecd47cd0b7fb410b58fad2b3bf9
prerequisite-patch-id: 6d6d70ccb7d718b3bcca6662cdaf1e8b64b6ddc2
prerequisite-patch-id: d61046e2cd2f33024092e96e8a987b9c34c24e73
prerequisite-patch-id: c27ca28bb3df435c98fe02438264188d6fa52b7c
prerequisite-patch-id: 27fadb12ce15099a684c08d4f8c785bedc87cef2
prerequisite-patch-id: 7796ec9a0162ae96b708ea513742016657c69e14
prerequisite-patch-id: f7549078f3702acdf1e6dcd36ddebab0e543b5db
prerequisite-patch-id: b123fb15cb8c97cf0896b826820f4ce33085170c
prerequisite-patch-id: fa96e18eae90efc14e4b9f13534c013b448a3f84
prerequisite-patch-id: 1e53ad7341ddb67c9788252456068cc14ab2f610
prerequisite-patch-id: ffff2977d8f2a3a44c3606f77d38f8745cb3c60a
prerequisite-patch-id: 71d23f4f096e424ae3aa59a23695f5b1e488fab0
prerequisite-patch-id: 3c12631f22a39d6def9340ed840e9e55e1a76304
prerequisite-patch-id: caec6572d5d9a37183601b8e38f50af797df635e
prerequisite-patch-id: d5b3d5719675a1e3be26e028b5596d39e839bc09
prerequisite-patch-id: da7b826d56ac70b3b72be58d64e7c2107445478f
prerequisite-patch-id: f3f789e0d919dd92b7d811a4e11c57bb05f71617
prerequisite-patch-id: 79cca92633ca3d9cc2f1f38b6fc977a8d8543d60
prerequisite-patch-id: f663f8f3bddf198d0cab083bac7ebb88689ffc82
prerequisite-patch-id: a0ffc5b88c5eb88c491f6187672012c621bd520c
prerequisite-patch-id: e6c6d67b034d06b6158a0e0f8299ad28f0e59134
prerequisite-patch-id: 25f658fbd1238bd57e05ff299d0436f942bdcc4d
prerequisite-patch-id: 7be8439e241a320b0eb0a264a8a59a9beef383d6
prerequisite-patch-id: b903714dbe7d6a44fbe18faa02d59862ceadf217

Best regards,
-- 
Nicolas Frattaroli <nicolas.frattaroli@collabora.com>

