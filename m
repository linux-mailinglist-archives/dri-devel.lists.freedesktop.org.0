Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 2C8D23E2AB0
	for <lists+dri-devel@lfdr.de>; Fri,  6 Aug 2021 14:35:20 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id A89DF6E526;
	Fri,  6 Aug 2021 12:35:04 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail.kapsi.fi (mail.kapsi.fi [IPv6:2001:67c:1be8::25])
 by gabe.freedesktop.org (Postfix) with ESMTPS id C447F6E11E
 for <dri-devel@lists.freedesktop.org>; Fri,  6 Aug 2021 12:35:02 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=kapsi.fi;
 s=20161220; h=Content-Transfer-Encoding:MIME-Version:Message-Id:Date:Subject
 :Cc:To:From:Sender:Reply-To:Content-Type:Content-ID:Content-Description:
 Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
 In-Reply-To:References:List-Id:List-Help:List-Unsubscribe:List-Subscribe:
 List-Post:List-Owner:List-Archive;
 bh=KMi2hxN4D2F/G0iQ1ZwtP7Etd31lSjDCGywBrme4vu4=; b=NoyJP3gkZJ/baztPat1OmJHQoU
 gpFH2tO2qc8buHxWUoJ+ekK1JoIGm38qFa9UEkyHnNmOhX0E4VfQfb8JjzqHheWqFAT4LpMJbLnhb
 QblPILgP/C1wEwLIT+t8UJ5kI2dYRUppExfYVV0barJyuxmqs9fkMakSYYSNuxveJpewm33/pVGJn
 KkNqfziL7N49xhBdQccllvp9Dw4Hjm8gRadeaDboYd+tH2OX6hLN5Ja12HVVdGQql03NDoOdbBk0o
 Br+VN6ouKeI0qNepAdb0S3abfQ6rfTKjBOjtJCWD/Z7kDbbFdrv5psMxesIOsVeWhndzLLLQjJi8g
 zPrzpOfA==;
Received: from dsl-hkibng22-54f986-236.dhcp.inet.fi ([84.249.134.236]
 helo=toshino.localdomain)
 by mail.kapsi.fi with esmtpsa (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.89) (envelope-from <mperttunen@nvidia.com>)
 id 1mBz3x-0004Dc-6J; Fri, 06 Aug 2021 15:34:57 +0300
From: Mikko Perttunen <mperttunen@nvidia.com>
To: thierry.reding@gmail.com, jonathanh@nvidia.com, airlied@linux.ie,
 daniel@ffwll.ch, robh+dt@kernel.org
Cc: dri-devel@lists.freedesktop.org, linux-tegra@vger.kernel.org,
 devicetree@vger.kernel.org, Mikko Perttunen <mperttunen@nvidia.com>
Subject: [PATCH v2 0/3] NVIDIA Tegra NVDEC support
Date: Fri,  6 Aug 2021 15:34:47 +0300
Message-Id: <20210806123450.2970777-1-mperttunen@nvidia.com>
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

Hi all,

here is a v2 of the NVDEC support series. Changes have been done
to accommodate review comments on v1, and the NVDEC1 instance on
Tegra194 is now supported. The series has been tested on Tegra186
on top of my/Thierry's TegraDRM v8 series (though should work on
top of v7 as well).

NVDEC hardware documentation can be found at
https://github.com/NVIDIA/open-gpu-doc/tree/master/classes/video

and example userspace can be found at
https://github.com/cyndis/vaapi-tegra-driver

Thanks,
Mikko

Mikko Perttunen (3):
  dt-bindings: Add YAML bindings for Host1x and NVDEC
  arm64: tegra: Add NVDEC to Tegra186/194 device trees
  drm/tegra: Add NVDEC driver

 .../gpu/host1x/nvidia,tegra20-host1x.yaml     | 131 +++++
 .../gpu/host1x/nvidia,tegra210-nvdec.yaml     | 109 ++++
 MAINTAINERS                                   |   1 +
 arch/arm64/boot/dts/nvidia/tegra186.dtsi      |  16 +
 arch/arm64/boot/dts/nvidia/tegra194.dtsi      |  36 ++
 drivers/gpu/drm/tegra/Makefile                |   3 +-
 drivers/gpu/drm/tegra/drm.c                   |   4 +
 drivers/gpu/drm/tegra/drm.h                   |   1 +
 drivers/gpu/drm/tegra/nvdec.c                 | 473 ++++++++++++++++++
 drivers/gpu/host1x/dev.c                      |  18 +
 include/linux/host1x.h                        |   2 +
 11 files changed, 793 insertions(+), 1 deletion(-)
 create mode 100644 Documentation/devicetree/bindings/gpu/host1x/nvidia,tegra20-host1x.yaml
 create mode 100644 Documentation/devicetree/bindings/gpu/host1x/nvidia,tegra210-nvdec.yaml
 create mode 100644 drivers/gpu/drm/tegra/nvdec.c

-- 
2.32.0

