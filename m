Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 22BA73E8F03
	for <lists+dri-devel@lfdr.de>; Wed, 11 Aug 2021 12:50:56 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 1917A6E11F;
	Wed, 11 Aug 2021 10:50:42 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail.kapsi.fi (mail.kapsi.fi [IPv6:2001:67c:1be8::25])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 8419D6E11F
 for <dri-devel@lists.freedesktop.org>; Wed, 11 Aug 2021 10:50:40 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=kapsi.fi;
 s=20161220; h=Content-Transfer-Encoding:MIME-Version:Message-Id:Date:Subject
 :Cc:To:From:Sender:Reply-To:Content-Type:Content-ID:Content-Description:
 Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
 In-Reply-To:References:List-Id:List-Help:List-Unsubscribe:List-Subscribe:
 List-Post:List-Owner:List-Archive;
 bh=7wGqM2CTNMgzFAoCTsxE+tYXNpD4LqM52tDDtrhDGi0=; b=dPplMKmbiSU1B15LZvzpZifUUT
 R/lzecwd8+y9h8uWGbaYZZqxM5+A1tOMyr2Bv+dbHRaInZTL2uoYAKOlxJcy/PbPSA7jOm5maWKaO
 7bbIitvrCQC5Twn4tz1pzWniyXhXJhyvYAuzu8qYGWW5EYUYqYMXEo5ayKZa5ocuW+kYwCW52N4d/
 2YBzcxUlx9pvvPPFqH10nX6LP/BRhrkGto9Ijg4qr3j4AAL9f1EmKiBSlG7z5XPTW+jx+05BmRVuo
 JOK10gjovr9s1wsdpg+WU3yREibOgICnRtxzmp1C4s2sB2BmvXQWXPTFsEcvfxxDnmcNuzOgvgj2N
 +oPO662w==;
Received: from dsl-hkibng22-54f986-236.dhcp.inet.fi ([84.249.134.236]
 helo=toshino.localdomain)
 by mail.kapsi.fi with esmtpsa (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.89) (envelope-from <mperttunen@nvidia.com>)
 id 1mDloh-0007SJ-QO; Wed, 11 Aug 2021 13:50:35 +0300
From: Mikko Perttunen <mperttunen@nvidia.com>
To: thierry.reding@gmail.com, jonathanh@nvidia.com, airlied@linux.ie,
 daniel@ffwll.ch, robh+dt@kernel.org
Cc: dri-devel@lists.freedesktop.org, linux-tegra@vger.kernel.org,
 devicetree@vger.kernel.org, Mikko Perttunen <mperttunen@nvidia.com>
Subject: [PATCH v3 0/3] NVIDIA Tegra NVDEC support
Date: Wed, 11 Aug 2021 13:50:27 +0300
Message-Id: <20210811105030.3458521-1-mperttunen@nvidia.com>
X-Mailer: git-send-email 2.32.0
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
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
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

Here's the v3 of the NVDEC support series, containing minor fixes
compared to v2.

NVDEC hardware documentation can be found at
https://github.com/NVIDIA/open-gpu-doc/tree/master/classes/video

and example userspace can be found at
https://github.com/cyndis/vaapi-tegra-driver

Thanks,
Mikko

Mikko Perttunen (3):
  dt-bindings: Add YAML bindings for NVDEC
  arm64: tegra: Add NVDEC to Tegra186/194 device trees
  drm/tegra: Add NVDEC driver

 .../gpu/host1x/nvidia,tegra210-nvdec.yaml     | 109 ++++
 MAINTAINERS                                   |   1 +
 arch/arm64/boot/dts/nvidia/tegra186.dtsi      |  16 +
 arch/arm64/boot/dts/nvidia/tegra194.dtsi      |  36 ++
 drivers/gpu/drm/tegra/Makefile                |   3 +-
 drivers/gpu/drm/tegra/drm.c                   |   4 +
 drivers/gpu/drm/tegra/drm.h                   |   1 +
 drivers/gpu/drm/tegra/nvdec.c                 | 474 ++++++++++++++++++
 drivers/gpu/host1x/dev.c                      |  18 +
 include/linux/host1x.h                        |   2 +
 10 files changed, 663 insertions(+), 1 deletion(-)
 create mode 100644 Documentation/devicetree/bindings/gpu/host1x/nvidia,tegra210-nvdec.yaml
 create mode 100644 drivers/gpu/drm/tegra/nvdec.c

-- 
2.32.0

