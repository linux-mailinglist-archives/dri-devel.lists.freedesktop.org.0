Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 18E3E506FC6
	for <lists+dri-devel@lfdr.de>; Tue, 19 Apr 2022 16:08:57 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 003C510EF83;
	Tue, 19 Apr 2022 14:08:49 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from out0.migadu.com (out0.migadu.com [94.23.1.103])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 7C8B610EF83
 for <dri-devel@lists.freedesktop.org>; Tue, 19 Apr 2022 14:08:48 +0000 (UTC)
X-Report-Abuse: Please report any abuse attempt to abuse@migadu.com and
 include these headers.
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linux.dev; s=key1;
 t=1650376782;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:
 content-transfer-encoding:content-transfer-encoding;
 bh=mFWtlF0oHPGP6DlOf6E0rXJ/V6DYNXr//ANS9HvqQvw=;
 b=aJtULM7iH7zTY3r4fHqFFgnk7UShgfYh7JBWbfvVijbe+NAZk7o5lf0cGTu4BrE8W68yHM
 5o9hD6w59zxGhT62iGBdulTuLB1xhfCnA3e+QqpQXs6mueg80DkTVbXmdLZShHm+I/ZG/d
 kwxrgWiHz7qYebXVBViiZxDA+YvydT8=
From: Cai Huoqing <cai.huoqing@linux.dev>
To: cai.huoqing@linux.dev
Subject: [PATCH 0/2] drm/nvdla: Add driver support for NVDLA
Date: Tue, 19 Apr 2022 21:58:58 +0800
Message-Id: <20220419135908.39606-1-cai.huoqing@linux.dev>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Migadu-Flow: FLOW_OUT
X-Migadu-Auth-User: linux.dev
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
Cc: Thomas Zimmermann <tzimmermann@suse.de>, David Airlie <airlied@linux.ie>,
 linux-kernel@vger.kernel.org,
 =?UTF-8?q?Christian=20K=C3=B6nig?= <christian.koenig@amd.com>,
 linaro-mm-sig@lists.linaro.org, dri-devel@lists.freedesktop.org,
 Sumit Semwal <sumit.semwal@linaro.org>, linux-media@vger.kernel.org
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

The NVIDIA Deep Learning Accelerator (NVDLA) is an open source IP
which is integrated into NVIDIA Jetson AGX Xavier,
so add driver support for this accelerator.

NVDLA introduce:
http://nvdla.org/primer.html

User mode driver:
https://github.com/caihuoq/nvdla/tree/main/sw/umd


Cai Huoqing (2):
  MAINTAINERS: Add the driver info of the NVDLA
  drm/nvdla: Add driver support for NVDLA

 MAINTAINERS                             |    7 +
 drivers/gpu/drm/Kconfig                 |    2 +
 drivers/gpu/drm/Makefile                |    1 +
 drivers/gpu/drm/nvdla/Kconfig           |    8 +
 drivers/gpu/drm/nvdla/Makefile          |   19 +
 drivers/gpu/drm/nvdla/nvdla_bdma.c      |  200 +
 drivers/gpu/drm/nvdla/nvdla_cache.c     |  215 +
 drivers/gpu/drm/nvdla/nvdla_cdp.c       |  300 ++
 drivers/gpu/drm/nvdla/nvdla_common.c    |  295 ++
 drivers/gpu/drm/nvdla/nvdla_common.h    |  835 +++
 drivers/gpu/drm/nvdla/nvdla_conv.c      |  683 +++
 drivers/gpu/drm/nvdla/nvdla_drm.c       |  695 +++
 drivers/gpu/drm/nvdla/nvdla_drm.h       |  127 +
 drivers/gpu/drm/nvdla/nvdla_engine.c    |  233 +
 drivers/gpu/drm/nvdla/nvdla_engine.h    |  272 +
 drivers/gpu/drm/nvdla/nvdla_gem.c       |  393 ++
 drivers/gpu/drm/nvdla/nvdla_ioctl.h     |   99 +
 drivers/gpu/drm/nvdla/nvdla_pdp.c       |  446 ++
 drivers/gpu/drm/nvdla/nvdla_reg.h       | 6411 +++++++++++++++++++++++
 drivers/gpu/drm/nvdla/nvdla_rubik.c     |  217 +
 drivers/gpu/drm/nvdla/nvdla_sched.h     |   52 +
 drivers/gpu/drm/nvdla/nvdla_scheduler.c | 1005 ++++
 drivers/gpu/drm/nvdla/nvdla_sdp.c       |  728 +++
 23 files changed, 13243 insertions(+)
 create mode 100644 drivers/gpu/drm/nvdla/Kconfig
 create mode 100644 drivers/gpu/drm/nvdla/Makefile
 create mode 100644 drivers/gpu/drm/nvdla/nvdla_bdma.c
 create mode 100644 drivers/gpu/drm/nvdla/nvdla_cache.c
 create mode 100644 drivers/gpu/drm/nvdla/nvdla_cdp.c
 create mode 100644 drivers/gpu/drm/nvdla/nvdla_common.c
 create mode 100644 drivers/gpu/drm/nvdla/nvdla_common.h
 create mode 100644 drivers/gpu/drm/nvdla/nvdla_conv.c
 create mode 100644 drivers/gpu/drm/nvdla/nvdla_drm.c
 create mode 100644 drivers/gpu/drm/nvdla/nvdla_drm.h
 create mode 100644 drivers/gpu/drm/nvdla/nvdla_engine.c
 create mode 100644 drivers/gpu/drm/nvdla/nvdla_engine.h
 create mode 100644 drivers/gpu/drm/nvdla/nvdla_gem.c
 create mode 100644 drivers/gpu/drm/nvdla/nvdla_ioctl.h
 create mode 100644 drivers/gpu/drm/nvdla/nvdla_pdp.c
 create mode 100644 drivers/gpu/drm/nvdla/nvdla_reg.h
 create mode 100644 drivers/gpu/drm/nvdla/nvdla_rubik.c
 create mode 100644 drivers/gpu/drm/nvdla/nvdla_sched.h
 create mode 100644 drivers/gpu/drm/nvdla/nvdla_scheduler.c
 create mode 100644 drivers/gpu/drm/nvdla/nvdla_sdp.c

-- 
2.25.1

