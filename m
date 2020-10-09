Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 27F09289099
	for <lists+dri-devel@lfdr.de>; Fri,  9 Oct 2020 20:12:07 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 43C556ED79;
	Fri,  9 Oct 2020 18:12:02 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mga09.intel.com (mga09.intel.com [134.134.136.24])
 by gabe.freedesktop.org (Postfix) with ESMTPS id BC3686ED78
 for <dri-devel@lists.freedesktop.org>; Fri,  9 Oct 2020 18:12:00 +0000 (UTC)
IronPort-SDR: xsl31W6cEvzq5+QfkHVQjsowXkOjrF4sqDPrY0WuwW9LbTW8vtddBNYI7SZ+h7Z5GxijwKvvXC
 NyciuFCFbO4g==
X-IronPort-AV: E=McAfee;i="6000,8403,9769"; a="165633802"
X-IronPort-AV: E=Sophos;i="5.77,355,1596524400"; d="scan'208";a="165633802"
X-Amp-Result: SKIPPED(no attachment in message)
X-Amp-File-Uploaded: False
Received: from fmsmga006.fm.intel.com ([10.253.24.20])
 by orsmga102.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 09 Oct 2020 11:11:59 -0700
IronPort-SDR: KPVSx7Vf5q5hRKIM2RTDcsc+T0rK/lNLwwF35KQc/qk9B1CbliBK89h31nX34AkWaoduqTPJMR
 AQ4kTP2+6e6Q==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.77,355,1596524400"; d="scan'208";a="518774943"
Received: from kkang6-desktop.kssm.intel.com ([172.21.194.67])
 by fmsmga006.fm.intel.com with ESMTP; 09 Oct 2020 11:11:58 -0700
From: kuhanh.murugasen.krishnan@intel.com
To: dri-devel@lists.freedesktop.org
Subject: [PATCH v1 0/4] Add support for Keem Bay VPU DRM driver
Date: Fri,  9 Oct 2020 19:57:51 +0800
Message-Id: <1602244675-8785-1-git-send-email-kuhanh.murugasen.krishnan@intel.com>
X-Mailer: git-send-email 1.9.1
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
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

From: "Murugasen Krishnan, Kuhanh" <kuhanh.murugasen.krishnan@intel.com>

This is a new DRM media codec driver for Intel's Keem Bay SOC which
integrates the Verisilicon's Hantro Video Processor Unit (VPU) IP.
The SoC couples an ARM Cortex A53 CPU with an Intel Movidius VPU.

Hantro VPU IP is a series of video decoder and encoder semiconductor IP cores,
which can be flexibly configured for video surveillance, multimedia consumer
products, Internet of Things, cloud service products, data centers, aerial
photography and recorders, thereby providing video transcoding and multi-channel
HD video encoding and decoding.

Hantro VPU IP consists of Hantro VC8000D for decoder and Hantro VC8000E for encoder.

Hantro VC8000D allows 4K decoding with a minimal silicon single-core solution that
supports HEVC and H.264 video formats, key features:
* HEVC Main10 and Main Profiles up to Level 5.2
* HEVC Main Still Profile
* H.264 Main and High Profiles up to Level 5.2
* HEVC, H.264 and JPEG decoding up to 4K@60fps
* 8 channels 1080p@30fps decoding

Hantro VC8000E allows 4K encoding with a minimal silicon single-core solution that
supports HEVC and H.264 video formats, key features:
* HEVC Main10, Main and Main Still Profile, level 5.1
* H.264 Baseline, Main and High, High10 level 5.2
* JPEG encoder 16Kx16K max resolution
* HEVC/H264 Support up to 4K@60fps performance single-core
* 8 channels 1080p@30fps encoding
* B-frame support for higher compression rates
* Reference Frame Compression

This driver is tested with the Keem Bay EVM board which is the reference baord
for Keem Bay SOC.

Device tree patches are under review here:
https://lore.kernel.org/linux-arm-kernel/20200708175020.194436-1-daniele.alessandrelli@linux.intel.com/T/

Murugasen Krishnan, Kuhanh (4):
  drm: Add Keem Bay VPU codec DRM
  drm: hantro: Keem Bay VPU DRM encoder
  drm: hantro: Keem Bay VPU DRM decoder
  drm: hantro: Keem Bay VPU DRM build files

 drivers/gpu/drm/Kconfig                  |    2 +
 drivers/gpu/drm/Makefile                 |    1 +
 drivers/gpu/drm/hantro/Kconfig           |   21 +
 drivers/gpu/drm/hantro/Makefile          |    6 +
 drivers/gpu/drm/hantro/hantro_dec.c      | 1441 +++++++++++++++++++++++++
 drivers/gpu/drm/hantro/hantro_dec.h      |   59 ++
 drivers/gpu/drm/hantro/hantro_drm.c      | 1673 ++++++++++++++++++++++++++++++
 drivers/gpu/drm/hantro/hantro_drm.h      |  208 ++++
 drivers/gpu/drm/hantro/hantro_dwl_defs.h |  101 ++
 drivers/gpu/drm/hantro/hantro_enc.c      |  738 +++++++++++++
 drivers/gpu/drm/hantro/hantro_enc.h      |   66 ++
 drivers/gpu/drm/hantro/hantro_fence.c    |  284 +++++
 drivers/gpu/drm/hantro/hantro_priv.h     |  106 ++
 13 files changed, 4706 insertions(+)
 create mode 100644 drivers/gpu/drm/hantro/Kconfig
 create mode 100644 drivers/gpu/drm/hantro/Makefile
 create mode 100644 drivers/gpu/drm/hantro/hantro_dec.c
 create mode 100644 drivers/gpu/drm/hantro/hantro_dec.h
 create mode 100644 drivers/gpu/drm/hantro/hantro_drm.c
 create mode 100644 drivers/gpu/drm/hantro/hantro_drm.h
 create mode 100644 drivers/gpu/drm/hantro/hantro_dwl_defs.h
 create mode 100644 drivers/gpu/drm/hantro/hantro_enc.c
 create mode 100644 drivers/gpu/drm/hantro/hantro_enc.h
 create mode 100644 drivers/gpu/drm/hantro/hantro_fence.c
 create mode 100644 drivers/gpu/drm/hantro/hantro_priv.h

-- 
1.9.1

_______________________________________________
dri-devel mailing list
dri-devel@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/dri-devel
