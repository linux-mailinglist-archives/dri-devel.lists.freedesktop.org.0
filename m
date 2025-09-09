Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 4E1C8B50F5D
	for <lists+dri-devel@lfdr.de>; Wed, 10 Sep 2025 09:28:41 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 16A3510E873;
	Wed, 10 Sep 2025 07:28:39 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (1024-bit key; unprotected) header.d=linux.microsoft.com header.i=@linux.microsoft.com header.b="RMD74kV8";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from linux.microsoft.com (linux.microsoft.com [13.77.154.182])
 by gabe.freedesktop.org (Postfix) with ESMTP id AD5F710E263
 for <dri-devel@lists.freedesktop.org>; Tue,  9 Sep 2025 16:57:29 +0000 (UTC)
Received: from
 linuxonhyperv3.guj3yctzbm1etfxqx2vob5hsef.xx.internal.cloudapp.net
 (linux.microsoft.com [13.77.154.182])
 by linux.microsoft.com (Postfix) with ESMTPSA id E2D7F2119CB4;
 Tue,  9 Sep 2025 09:57:28 -0700 (PDT)
DKIM-Filter: OpenDKIM Filter v2.11.0 linux.microsoft.com E2D7F2119CB4
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linux.microsoft.com;
 s=default; t=1757437048;
 bh=lme8K4Nr1+yoqaz7H6lvUNp0A2O6Va0RIFe2JGydUTE=;
 h=From:To:Subject:Date:From;
 b=RMD74kV8g9ic+OtmzX19t+LcdSJGDKWM+owfdL/97U9Rv2f17n/HsuVdRDK6OM4OG
 hfscUIZphxW4NztwU18/7Y96smpq2BtQ86ZSLWuhmyIQt8XLwnqjGi7QvFo4hNSD1J
 ipB3HSpms4C9ET8HhqVHPDC1oXI2wBW+8h4LwogU=
From: Prasanna Kumar T S M <ptsm@linux.microsoft.com>
To: maarten.lankhorst@linux.intel.com, mripard@kernel.org, tzimmermann@suse.de,
 airlied@gmail.com, simona@ffwll.ch, drawat.floss@gmail.com,
 kys@microsoft.com, haiyangz@microsoft.com, wei.liu@kernel.org,
 decui@microsoft.com, deller@gmx.de, arnd@arndb.de, soci@c64.rulez.org,
 rdunlap@infradead.org, gonzalo.silvalde@gmail.com,
 bartosz.golaszewski@linaro.org, mhklinux@outlook.com,
 ssengar@linux.microsoft.com, linux-kernel@vger.kernel.org,
 dri-devel@lists.freedesktop.org, linux-hyperv@vger.kernel.org,
 linux-fbdev@vger.kernel.org
Subject: [RFC 0/3] fbdev: remove Hyper-V framebuffer driver
Date: Tue,  9 Sep 2025 09:57:24 -0700
Message-Id: <1757437044-2170-1-git-send-email-ptsm@linux.microsoft.com>
X-Mailer: git-send-email 1.8.3.1
X-Spam-Status: No, score=-2.0 required=2.1 tests=BAYES_00,DKIM_SIGNED,
 DKIM_VALID,DKIM_VALID_AU,UNPARSEABLE_RELAY autolearn=ham autolearn_force=no
 version=3.4.0
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
 linuxonhyperv3.guj3yctzbm1etfxqx2vob5hsef.xx.internal.cloudapp.net
X-Mailman-Approved-At: Wed, 10 Sep 2025 07:28:23 +0000
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

This series removes the Hyper-V framebuffer driver. The Hyper-V DRM
driver is available since kernel version 5.14 and provides full KMS
support along with fbdev emulation via the DRM fbdev helpers. This makes
the hyperv_fb driver redundant. So remove hyperv_fb driver.

Prasanna Kumar T S M (3):
  drivers: video: fbdev: Remove hyperv_fb driver
  drm: hyprev: Remove reference to hyperv_fb driver
  drivers: hv: vmbus_drv: Remove reference to hpyerv_fb

 MAINTAINERS                               |    1 -
 drivers/gpu/drm/Kconfig                   |    3 +-
 drivers/gpu/drm/hyperv/hyperv_drm_proto.c |   15 +-
 drivers/hv/vmbus_drv.c                    |    4 +-
 drivers/video/fbdev/Kconfig               |    8 -
 drivers/video/fbdev/Makefile              |    1 -
 drivers/video/fbdev/hyperv_fb.c           | 1386 ---------------------
 7 files changed, 8 insertions(+), 1410 deletions(-)
 delete mode 100644 drivers/video/fbdev/hyperv_fb.c

--
2.49.0

