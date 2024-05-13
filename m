Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id F04618C398A
	for <lists+dri-devel@lfdr.de>; Mon, 13 May 2024 02:13:46 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 2547F10E2D6;
	Mon, 13 May 2024 00:13:45 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (1024-bit key; unprotected) header.d=linux.dev header.i=@linux.dev header.b="VPW/nhbX";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from out-186.mta0.migadu.com (out-186.mta0.migadu.com
 [91.218.175.186])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 5567710E2D6
 for <dri-devel@lists.freedesktop.org>; Mon, 13 May 2024 00:13:43 +0000 (UTC)
X-Report-Abuse: Please report any abuse attempt to abuse@migadu.com and
 include these headers.
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linux.dev; s=key1;
 t=1715559220;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:
 content-transfer-encoding:content-transfer-encoding;
 bh=XJY1www0AxrnCm+16UJMjjPkfXJT0ujI5r+bchZsf1M=;
 b=VPW/nhbX72YlHmO0ZRVZ7TioRdby1C6sMHM3Dd5CcuZx+1gprGSzmW39+/6rq6Rrfnepu9
 PCv42jxiQkKTrvR9JHjuHyaNhUU1IrsxpDSlFJfMmwyqY2676uGt/j/o/+8bIPSh5IG7HU
 1ecOjPtsP3k4Dfn8XoJOxtUh3bQeNCU=
From: Sui Jingfeng <sui.jingfeng@linux.dev>
To: Maxime Ripard <mripard@kernel.org>, Thomas Zimmermann <tzimmermann@suse.de>
Cc: Sui Jingfeng <suijingfeng@loongson.cn>, linux-kernel@vger.kernel.org,
 dri-devel@lists.freedesktop.org, Sui Jingfeng <sui.jingfeng@linux.dev>
Subject: [PATCH 0/3] drm/loongson: Introduce component framework support
Date: Mon, 13 May 2024 08:12:40 +0800
Message-Id: <20240513001243.1739336-1-sui.jingfeng@linux.dev>
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

Introduce the component framework to bind childs and siblings, for better
modularity and paper over the deferral probe problems if it need to attach
exterinal module someday. Hardware units come with PCI(e) are actually all
ready to drive, but there has some board specific modules will return
-EPROBE_DEFER. We need all other submodules ready to attach before we can
register the drm device to userspace.

The idea is to devide the exterinal module dependent part and exterinal
module independent part clearly, for example, the display controller and
the builtin GPIO-I2C just belong to exterinal module independent part.
While the output is belong to exterinal module dependent part.

Also for better reflecting the hardware, we intend to abstract the output
ports as child devices. The output ports may consists of encoder phy and
level shift, while the GPU and VPU are standalone siblings. As those units
are relative separate hardware units from display controller itself.

By design, the display controller PCI(e) is selected as the component
master, gpio-i2c go with master. The manually created virtual child device
are functional as agents for the master, it could return the -EPROBE_DEFER
back to the component core. This allows the master don't have to tear down
everything, the majority setups work can be preserved. The potential cyclic
dependency problem can be solved with such framework.
Sui Jingfeng (3):
  drm/loongson: Add helpers for creating subdevice
  drm/loongson: Introduce component framework support
  drm/loongson: Refactor lsdc device initialize and the output port

 drivers/gpu/drm/loongson/Makefile             |   1 +
 drivers/gpu/drm/loongson/loongson_device.c    |  42 ++++
 drivers/gpu/drm/loongson/loongson_module.c    |  17 +-
 drivers/gpu/drm/loongson/loongson_module.h    |   1 +
 drivers/gpu/drm/loongson/lsdc_drv.c           | 208 +++++++++++-------
 drivers/gpu/drm/loongson/lsdc_drv.h           |  34 +--
 drivers/gpu/drm/loongson/lsdc_output.c        | 183 +++++++++++++++
 drivers/gpu/drm/loongson/lsdc_output.h        |  38 +++-
 drivers/gpu/drm/loongson/lsdc_output_7a1000.c |   3 +-
 drivers/gpu/drm/loongson/lsdc_output_7a2000.c |  15 +-
 10 files changed, 422 insertions(+), 120 deletions(-)
 create mode 100644 drivers/gpu/drm/loongson/lsdc_output.c

-- 
2.34.1

