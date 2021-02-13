Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id E3B5031AABB
	for <lists+dri-devel@lfdr.de>; Sat, 13 Feb 2021 11:15:54 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 809A66E42E;
	Sat, 13 Feb 2021 10:15:47 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail.kapsi.fi (mail.kapsi.fi [IPv6:2001:67c:1be8::25])
 by gabe.freedesktop.org (Postfix) with ESMTPS id B78BB6E425
 for <dri-devel@lists.freedesktop.org>; Sat, 13 Feb 2021 10:15:43 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=kapsi.fi;
 s=20161220; h=Content-Transfer-Encoding:MIME-Version:Message-Id:Date:Subject
 :Cc:To:From:Sender:Reply-To:Content-Type:Content-ID:Content-Description:
 Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
 In-Reply-To:References:List-Id:List-Help:List-Unsubscribe:List-Subscribe:
 List-Post:List-Owner:List-Archive;
 bh=h92k4q5NK3A1mAHN1IEA82rrBkvDURzcbgM6vUKFL9o=; b=K+2hAeZp5qVJnc8RM0udxjoxEC
 /f0hZGO7jl9c2SghvB2lqSjLUPJV5YD4P3LHpqryth0at7AHGkxXHv0FeaQbuz28n8jIfdhqgbvYT
 C27uDRVc2XuN0cxPClTKVL6wa0yfNv0P2dbChVodY6xPDGwzA9HWCp26haGAsYWwVL/l+z6yjmVVO
 +IOyhTspWHOrkhRL8D21AAAlBkCBPVmsKtIJ2YiwXcTzA2FP2DEL8wB2ami0/IfBAGyrOZf78jMzJ
 g/vbyEF9cDGFK6BUcByF3o+kHP3WiQ2Av1aW6RFvJiNzp4odr8P5wiRIsizwtphSAbehO9rYWXLZV
 LuSm3H8g==;
Received: from dsl-hkibng22-54f986-236.dhcp.inet.fi ([84.249.134.236]
 helo=toshino.localdomain)
 by mail.kapsi.fi with esmtpsa (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.89) (envelope-from <mperttunen@nvidia.com>)
 id 1lArxe-0002D2-JH; Sat, 13 Feb 2021 12:15:34 +0200
From: Mikko Perttunen <mperttunen@nvidia.com>
To: thierry.reding@gmail.com, jonathanh@nvidia.com, airlied@linux.ie,
 daniel@ffwll.ch, robh+dt@kernel.org
Subject: [PATCH 0/3] NVIDIA Tegra NVDEC support
Date: Sat, 13 Feb 2021 12:15:09 +0200
Message-Id: <20210213101512.3275069-1-mperttunen@nvidia.com>
X-Mailer: git-send-email 2.30.0
MIME-Version: 1.0
X-SA-Exim-Connect-IP: 84.249.134.236
X-SA-Exim-Mail-From: mperttunen@nvidia.com
X-SA-Exim-Scanned: No (on mail.kapsi.fi); SAEximRunCond expanded to false
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
Cc: linux-tegra@vger.kernel.org, devicetree@vger.kernel.org,
 dri-devel@lists.freedesktop.org, Mikko Perttunen <mperttunen@nvidia.com>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

Hi all,

with the release of documentation headers for Tegra multimedia engines
(NVDEC, NVENC, NVJPG) [1], I have started working on the corresponding
implementations. Here's the first one, NVDEC.

The kernel driver is a simple Falcon boot driver based on the VIC
driver. Some code sharing should be considered there in the future.
The userspace driver to accompany this is a bit more complicated -
I have expanded vaapi-tegra-driver[2] to support MPEG2 decoding.
It should be noted that the implementation is still very clunky
and has poor performance, but it's a start.

This series is based on top of the "Host1x/TegraDRM UAPI" series.
For testing, appropriate firmware should be obtained from a
Linux for Tegra distribution for now; the GPU should also be
enabled in the device tree.

Series was tested on Tegra186.

Thanks!

Mikko

[1] https://github.com/NVIDIA/open-gpu-doc/tree/master/classes/video
[2] https://github.com/cyndis/vaapi-tegra-driver

Mikko Perttunen (3):
  dt-bindings: Add YAML bindings for Host1x and NVDEC
  arm64: tegra: Add NVDEC to Tegra186 device tree
  drm/tegra: Add NVDEC driver

 .../gpu/host1x/nvidia,tegra20-host1x.yaml     | 129 +++++
 .../gpu/host1x/nvidia,tegra210-nvdec.yaml     |  90 ++++
 MAINTAINERS                                   |   1 +
 arch/arm64/boot/dts/nvidia/tegra186.dtsi      |  15 +
 drivers/gpu/drm/tegra/Makefile                |   3 +-
 drivers/gpu/drm/tegra/drm.c                   |   4 +
 drivers/gpu/drm/tegra/drm.h                   |   1 +
 drivers/gpu/drm/tegra/nvdec.c                 | 497 ++++++++++++++++++
 drivers/gpu/host1x/dev.c                      |  12 +
 include/linux/host1x.h                        |   1 +
 10 files changed, 752 insertions(+), 1 deletion(-)
 create mode 100644 Documentation/devicetree/bindings/gpu/host1x/nvidia,tegra20-host1x.yaml
 create mode 100644 Documentation/devicetree/bindings/gpu/host1x/nvidia,tegra210-nvdec.yaml
 create mode 100644 drivers/gpu/drm/tegra/nvdec.c

-- 
2.30.0

_______________________________________________
dri-devel mailing list
dri-devel@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/dri-devel
