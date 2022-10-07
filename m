Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 526685F783C
	for <lists+dri-devel@lfdr.de>; Fri,  7 Oct 2022 14:50:03 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 2810010E0BF;
	Fri,  7 Oct 2022 12:49:55 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-ed1-x536.google.com (mail-ed1-x536.google.com
 [IPv6:2a00:1450:4864:20::536])
 by gabe.freedesktop.org (Postfix) with ESMTPS id A545910E0BF
 for <dri-devel@lists.freedesktop.org>; Fri,  7 Oct 2022 12:49:53 +0000 (UTC)
Received: by mail-ed1-x536.google.com with SMTP id y100so6892948ede.6
 for <dri-devel@lists.freedesktop.org>; Fri, 07 Oct 2022 05:49:53 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20210112;
 h=content-transfer-encoding:mime-version:message-id:date:subject:cc
 :to:from:from:to:cc:subject:date:message-id:reply-to;
 bh=sOV3znLEFXG794EI9+2EiZOeXd8q2Gatr0hi9oBc++c=;
 b=jkYqEHtORIzadnhd6VsorGC5XH1YOH95uuilKYOTJFbt2KBb/hPNH0OS55Bju/Mb75
 qgyPq98Zdkx5OrMMhdlhTKPUdBPVTk4lxY4zi31j7/U3JGQYO8OxeJKR3uZMzTZiHTmo
 QP/trMTh5wulFE9xw6d+it4nncG11NOrCuET4JbiB8kcjMRYhLE4Zv/Y3IyG1BREwVAU
 gXw664Wm3YR/wlt9NVbalbWYyHm/JH/XvKoljp009Kca+bcub0SZH0GH0Sz/oz3vV09h
 zE/0yRMpcOnmhcXk4riKwZcxVuxdneLRlVi1JpQSnbkhCVhjgegxoctNPplXQmmIziUm
 1mdw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=content-transfer-encoding:mime-version:message-id:date:subject:cc
 :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
 :reply-to;
 bh=sOV3znLEFXG794EI9+2EiZOeXd8q2Gatr0hi9oBc++c=;
 b=xdxmnbFd9cyaKkjOyKRWzZVnA3danBEIKYY/BAluAGq9li0teBw3nPCxaHsXgdeC9X
 OwEdMTx/Kz1r5aT1pfvpmZQoJNpsRfJraMS3cX4I1b61wLzy5mXfcGvHevXE8ZdZwlw0
 wxa+Kx3L4KFxLWHwPzNG5L+tVAO2j8/GZyz5Np+JdG59idDVOvBZVzwCvpyQmlAitmY6
 m2SRjT7y4ae6JVV6mTIo3yQgQitx6lPDv98IEU7Wwx1U7S3aTpc35hPqvrDbueFX/Rnr
 y9Vg5IQGv1ceJ/VuB5HhwOcGlOHg58wvKi7Qjx1TvgIBa2VhlvnXQfXF7RuJz1akSUTR
 mPtQ==
X-Gm-Message-State: ACrzQf3uISj3MJDccesX/qLY9tsHUsi+nhn7h+L/kYSmm/gHb3ZTg4Lx
 H8qlQT/uB5wa84oeiDRqfNA=
X-Google-Smtp-Source: AMsMyM5EpvN8nfQqYKLvzczCfmjVuTsWbemH5BtposqbYvEOxhc669IN6GGSHZUQBaEO/x3gtTof9g==
X-Received: by 2002:a05:6402:5419:b0:457:c955:a40f with SMTP id
 ev25-20020a056402541900b00457c955a40fmr4323987edb.391.1665146991940; 
 Fri, 07 Oct 2022 05:49:51 -0700 (PDT)
Received: from localhost
 (p200300e41f201d00f22f74fffe1f3a53.dip0.t-ipconnect.de.
 [2003:e4:1f20:1d00:f22f:74ff:fe1f:3a53])
 by smtp.gmail.com with ESMTPSA id
 ky10-20020a170907778a00b0078d0981516esm1203959ejc.38.2022.10.07.05.49.50
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Fri, 07 Oct 2022 05:49:50 -0700 (PDT)
From: Thierry Reding <thierry.reding@gmail.com>
To: David Airlie <airlied@linux.ie>, Daniel Vetter <daniel@ffwll.ch>,
 Rob Herring <robh+dt@kernel.org>,
 Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>,
 Thierry Reding <thierry.reding@gmail.com>
Subject: [PATCH v2 0/7] drm/simpledrm: Support system memory framebuffers
Date: Fri,  7 Oct 2022 14:49:39 +0200
Message-Id: <20221007124946.406808-1-thierry.reding@gmail.com>
X-Mailer: git-send-email 2.37.3
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
Cc: devicetree@vger.kernel.org, dri-devel@lists.freedesktop.org,
 Jon Hunter <jonathanh@nvidia.com>, Thomas Zimmermann <tzimmermann@suse.de>,
 linux-tegra@vger.kernel.org, Robin Murphy <robin.murphy@arm.com>
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

From: Thierry Reding <treding@nvidia.com>

Hi,

this series of patches adds support for framebuffers residing in system
memory to the simple-framebuffer DRM driver. To do this, the DT bindings
are extended do accept the memory-region property in addition to the reg
property for specifying the framebuffer memory. This is done because the
framebuffer memory will typically also need to be marked as reserved so
that the operating system will not reuse it and the memory-region
property is the standard property to reference reserved memory regions.

A new compatible string is documented to annotate the framebuffer memory
regions and the simpledrm driver has code added to bind such annotated
regions to the simple-framebuffer device.

The second half of the series then adds support for the XB24 and AB24
formats and ties it all together to provide a simple-framebuffer on
Jetson Xavier NX. It should be noted, though, that the Jetson Xavier NX
device tree nodes are placeholders only and it is expected that firmware
or a bootloader will fill these in at runtime, due to the variable
nature of the values that they contain.

This example also uses (but doesn't depend on) the iommu-addresses
property that has been proposed and which will hopefully be merged soon.

Version 1 of these patches can be found here:

	https://lore.kernel.org/all/20220905163300.391692-1-thierry.reding@gmail.com/

Changes in v2:
- DT fields are now cleared so that they can be filled in at runtime
- add XB24 support and treat AB24 the same (alpha bits are unused)
- consistently use struct iosys_map
- fix issues with DT bindings

I've tested these with a simple UEFI implementation that will fill in
the placeholder values and set the simple-framebuffer's status property
to "okay".

Thierry

Thierry Reding (7):
  dt-bindings: display: simple-framebuffer: Support system memory
    framebuffers
  dt-bindings: display: simple-framebuffer: Document 32-bit BGR format
  dt-bindings: reserved-memory: Support framebuffer reserved memory
  drm/simpledrm: Add support for system memory framebuffers
  drm/format-helper: Support the XB24 format
  drm/simpledrm: Support the XB24/AB24 format
  arm64: tegra: Add simple framebuffer on Jetson Xavier NX

 .../bindings/display/simple-framebuffer.yaml  |   7 +
 .../bindings/reserved-memory/framebuffer.yaml |  52 +++++
 .../nvidia/tegra194-p3509-0000+p3668-0001.dts |  33 ++++
 arch/arm64/boot/dts/nvidia/tegra194.dtsi      |   2 +-
 drivers/gpu/drm/drm_format_helper.c           |  37 ++++
 drivers/gpu/drm/tiny/simpledrm.c              | 179 ++++++++++++++----
 include/linux/platform_data/simplefb.h        |   1 +
 7 files changed, 274 insertions(+), 37 deletions(-)
 create mode 100644 Documentation/devicetree/bindings/reserved-memory/framebuffer.yaml

-- 
2.37.3

