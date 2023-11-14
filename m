Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 455557EB312
	for <lists+dri-devel@lfdr.de>; Tue, 14 Nov 2023 16:09:50 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 3DA3610E441;
	Tue, 14 Nov 2023 15:09:41 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from out-177.mta1.migadu.com (out-177.mta1.migadu.com
 [IPv6:2001:41d0:203:375::b1])
 by gabe.freedesktop.org (Postfix) with ESMTPS id A58DA10E236
 for <dri-devel@lists.freedesktop.org>; Tue, 14 Nov 2023 15:09:32 +0000 (UTC)
X-Report-Abuse: Please report any abuse attempt to abuse@migadu.com and
 include these headers.
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linux.dev; s=key1;
 t=1699974115;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:
 content-transfer-encoding:content-transfer-encoding;
 bh=aSK3PhR7N6sZarhUbzOpQIf2xDy+MEi2YkvSFf8r3Lk=;
 b=ZETvjTr/XoDUk1cALkokOKwWkjnYzpn+7hVWxVNdT9D8sYNONctRfHkEHuSBSNWYpvVaca
 One6lWWPF3vAxPEkZ19n1MKps/UJ16JOpyTi3fEZdzDyJ9K3sNFo6976rZNa7gcsPT4Zi0
 r7t23nPYD7WdzKYoyk0LpAJEREJAES4=
From: Sui Jingfeng <sui.jingfeng@linux.dev>
To: Phong LE <ple@baylibre.com>,
	Neil Armstrong <neil.armstrong@linaro.org>
Subject: [PATCH 0/8] Allow link the it66121 display bridge driver as a lib
Date: Tue, 14 Nov 2023 23:01:22 +0800
Message-Id: <20231114150130.497915-1-sui.jingfeng@linux.dev>
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
Cc: Maxime Ripard <mripard@kernel.org>, Sui Jingfeng <suijingfeng@loongson.cn>,
 linux-kernel@vger.kernel.org, dri-devel@lists.freedesktop.org,
 Laurent Pinchart <Laurent.pinchart@ideasonboard.com>,
 Thomas Zimmermann <tzimmermann@suse.de>
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

From: Sui Jingfeng <suijingfeng@loongson.cn>

The goal is to make this driver usuable on non-DT based systems, while
without introduce duplication and preserve code sharing. The first seven
patch just doing trivial cleanup, the last patch try to solve the mentioned
problem by allowing static linking. Tested on a ACPI-based platform:

$ dmseg | grep drm

 ACPI: bus type drm_connector registered
 loongson 0000:00:06.1: [drm] dc: 264MHz, gmc: 529MHz, gpu: 529MHz
 loongson 0000:00:06.1: [drm] Dedicated vram start: 0xe0030000000, size: 64MiB
 loongson 0000:00:06.1: [drm] Loongson VBIOS version: 0.3
 loongson 0000:00:06.1: [drm] Loongson VBIOS: has 8 DCBs
 loongson 0000:00:06.1: [drm] VRAM: 4096 pages ready
 loongson 0000:00:06.1: [drm] GTT: 32768 pages ready
 loongson 0000:00:06.1: [drm] lsdc-i2c0(sda pin mask=1, scl pin mask=2) created
 loongson 0000:00:06.1: [drm] lsdc-i2c1(sda pin mask=4, scl pin mask=8) created
 loongson 0000:00:06.1: [drm] DisplayPipe-0 has DVO-0 connector
 i2c 1-004c: IT66121 probed, chip id: 0x4954:0x612, revision: 1
 loongson 0000:00:06.1: [drm] DisplayPipe-1 has IT66121@4c attached
 loongson 0000:00:06.1: [drm] Total 2 outputs
 loongson 0000:00:06.1: [drm] registered irq: 40
 [drm] Initialized loongson 1.0.0 20220701 for 0000:00:06.1 on minor 0
 loongson 0000:00:06.1: [drm] fb0: loongsondrmfb frame buffer device

Sui Jingfeng (8):
  drm/bridge: it66121: Use dev replace ctx->dev in the it66121_probe()
  drm/bridge: it66121: Add bridge_to_it66121() helper and use it
  drm/bridge: it66121: Add a helper function to read bus width
  drm/bridge: it66121: Add a helper function to get the next bridge
  drm/bridge: it66121: Add a helper function to read chip id
  drm/bridge: it66121: Add a helper to initialize the DRM bridge
    structure
  drm/bridge: it66121: Add another implementation for getting match data
  drm/bridge: it66121: Allow link this driver as a lib

 drivers/gpu/drm/bridge/ite-it66121.c | 340 +++++++++++++++++++--------
 include/drm/bridge/ite-it66121.h     |  17 ++
 2 files changed, 258 insertions(+), 99 deletions(-)
 create mode 100644 include/drm/bridge/ite-it66121.h

-- 
2.34.1

