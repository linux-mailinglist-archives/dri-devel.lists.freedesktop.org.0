Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id E20C67DF4E6
	for <lists+dri-devel@lfdr.de>; Thu,  2 Nov 2023 15:26:59 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id CD95610E8CB;
	Thu,  2 Nov 2023 14:26:54 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from madras.collabora.co.uk (madras.collabora.co.uk [46.235.227.172])
 by gabe.freedesktop.org (Postfix) with ESMTPS id A29E810E8CA
 for <dri-devel@lists.freedesktop.org>; Thu,  2 Nov 2023 14:26:52 +0000 (UTC)
Received: from IcarusMOD.eternityproject.eu (cola.collaboradmins.com
 [195.201.22.229])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
 (No client certificate requested) (Authenticated sender: kholk11)
 by madras.collabora.co.uk (Postfix) with ESMTPSA id 78F676607033;
 Thu,  2 Nov 2023 14:26:50 +0000 (GMT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=collabora.com;
 s=mail; t=1698935211;
 bh=9GMhC2yt36ap/zAAo8V+ZL0ifbAtyw1ee9xuPYWYQSk=;
 h=From:To:Cc:Subject:Date:From;
 b=nf9vCH+Ti918+P754lcH9ER+SxHxpuLwR8ATKXU1r0qYJpQ2/1B/ManBRSLWy7AUP
 rb94j73ufD/HUcy9zjN4BW9DXPD4cJ6p1Sv27WcJcN0xG/X1r/gXZZFJLJaYJ+DSN2
 JKn4AYyHwS+MjhIZNrGTE5iTJ0wJCrztPe64xLRL2UL/wFEd4Gvt2/bdwErFItArHV
 n142SD/SrlHroE9CPTacgL+b3MPS1SyJ9DWsjM2kAlaHj7V0w/kEo7x24J39PeQH5p
 PiGwWsnpZzzgfm7tZFouMkzR+0g8XZ04foYp9w30kMwNhy7NdvypDPp4aN/yMvDwGI
 gebKvdFCxrYpw==
From: AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>
To: boris.brezillon@collabora.com
Subject: [PATCH v2 0/6] drm/panfrost: Turn off clocks and regulators in PM
Date: Thu,  2 Nov 2023 15:26:37 +0100
Message-ID: <20231102142643.75288-1-angelogioacchino.delregno@collabora.com>
X-Mailer: git-send-email 2.42.0
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
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
Cc: linux-kernel@vger.kernel.org, mripard@kernel.org, steven.price@arm.com,
 dri-devel@lists.freedesktop.org, tzimmermann@suse.de, wenst@chromium.org,
 kernel@collabora.com,
 AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

Changes in v2:
 - Added hard reset GPU recovery
 - Tightened polling time for soft reset and power on
 - New execution time measurements after poweroff fix (see [1])

[1]: https://lore.kernel.org/all/20231102141507.73481-1-angelogioacchino.delregno@collabora.com/

At least MediaTek platforms are able to get the GPU clocks and regulators
completely off during system suspend, allowing to save a bit of power.

Panfrost is used on more than just MediaTek SoCs and the benefits of this
can be variable across different SoC models and/or different SoCs from
different manufacturers: this means that just adding this ability for all
could result in unexpected issues and breakages on untested SoCs.

For the aforemenetioned reasons, turning off the clocks and/or regulators
was implemented inside of a capabilities barrier that shall be enabled on
a per-SoC basis (in the panfrost_compatible platform data) after testing
of both benefits and feasibility.

In this series, I am adding the ability to switch on/off clocks and
regulators and enabling that on all MediaTek platforms, as I was able
to successfully test that on multiple Chromebooks featuring different
MediaTek SoCs; specifically, I've manually tested on MT8186, MT8192 and
MT8195, while MT8183 got tested only by KernelCI.

Cheers!

AngeloGioacchino Del Regno (6):
  drm/panfrost: Perform hard reset to recover GPU if soft reset fails
  drm/panfrost: Tighten polling for soft reset and power on
  drm/panfrost: Implement ability to turn on/off GPU clocks in suspend
  drm/panfrost: Set clocks on/off during system sleep on MediaTek SoCs
  drm/panfrost: Implement ability to turn on/off regulators in suspend
  drm/panfrost: Set regulators on/off during system sleep on MediaTek
    SoCs

 drivers/gpu/drm/panfrost/panfrost_device.c | 78 ++++++++++++++++++++--
 drivers/gpu/drm/panfrost/panfrost_device.h | 13 ++++
 drivers/gpu/drm/panfrost/panfrost_drv.c    |  3 +
 drivers/gpu/drm/panfrost/panfrost_gpu.c    | 22 +++---
 drivers/gpu/drm/panfrost/panfrost_regs.h   |  1 +
 5 files changed, 105 insertions(+), 12 deletions(-)

-- 
2.42.0

