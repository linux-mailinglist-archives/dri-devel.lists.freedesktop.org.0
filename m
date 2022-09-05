Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 209435AD77C
	for <lists+dri-devel@lfdr.de>; Mon,  5 Sep 2022 18:33:15 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 3BC5B10E451;
	Mon,  5 Sep 2022 16:33:11 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-ed1-x533.google.com (mail-ed1-x533.google.com
 [IPv6:2a00:1450:4864:20::533])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 67BE910E451
 for <dri-devel@lists.freedesktop.org>; Mon,  5 Sep 2022 16:33:06 +0000 (UTC)
Received: by mail-ed1-x533.google.com with SMTP id e18so12008046edj.3
 for <dri-devel@lists.freedesktop.org>; Mon, 05 Sep 2022 09:33:06 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20210112;
 h=content-transfer-encoding:mime-version:message-id:date:subject:cc
 :to:from:from:to:cc:subject:date;
 bh=6TFP59nE0q4HUv8ZkVfRblTtjKpKsP4sx/tU+vV7vtg=;
 b=QdbMkvg263fL3UC60Vho6UW+iF/AcJ/+rEhNi0lt58zoQyumBmVnOv2DchdMSbX+ux
 ZrBEMxRrm85NsDQWDx0JaoBxJuY2hQU4dM7aYBJZnhkg3kf0KjRSgOC4EIsXR3pO8P+F
 UQrUDCeuPohJnGNb1nT4OIodUFvsmbipF1WFAogLh8X5zprE+C9BYh6vu9/t83/xtiHx
 bzrtCtJKnx9lIFHGpD0nUT0WexVpTfKW7tZrl8MOY9Y3lZ2r8jH94IbmXKg/S+4Lkv6T
 fagubxJivN5b8eqNgrAV+9DW2Pd06+NzqJNsMatpTZwSmD1kb5jWpuGpTgQl/mQeg9Ep
 zgWQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=content-transfer-encoding:mime-version:message-id:date:subject:cc
 :to:from:x-gm-message-state:from:to:cc:subject:date;
 bh=6TFP59nE0q4HUv8ZkVfRblTtjKpKsP4sx/tU+vV7vtg=;
 b=BHk/9bJITDPgVh9ybpcX8lDItYzGOMnjXZnNGTZ8pMdWwZEEOPhTj0UgGn4nOYOE1I
 1csTzhvRllUC+eOjjTyHL1tl45YthCbeIdb7WFM9nV+NyKeL6snfsrxvjOfkJp9qxdLG
 CUvQ/B/oVEPUIrclptfalF0EUkzexiFcO0Amr9X9fmxB521A5Ay0A7BQOEDmg/X7tIDH
 Wws+C9PVU7HHvbn/73qQxe5o28pbqcedc087WnGvethFI+LKaCLiu7nvZdEHFkK6BZVP
 Fah6QQCPFnC+f5AXXyJwBewJnqafNe1lQ0vJ+9L+9/kangGHeqEI4iPHLqD0HO6PudQ8
 JpRw==
X-Gm-Message-State: ACgBeo05TtFdV4mIU6ifXvJ2by2tlk5GANAFQDuQrOdeZ9i1mcrSfz7G
 h5eRvgU8Gs7aPO8s+JMvOQA=
X-Google-Smtp-Source: AA6agR7/WXJVurWceSqahcKJOJ9r9mouFITyPQ5DMwZ49+WkLim/W4jLwYyKVmLg3EuoJ5eITDRlsw==
X-Received: by 2002:a05:6402:26c5:b0:448:e46f:c9f1 with SMTP id
 x5-20020a05640226c500b00448e46fc9f1mr24412377edd.287.1662395584761; 
 Mon, 05 Sep 2022 09:33:04 -0700 (PDT)
Received: from localhost
 (p200300e41f12c800f22f74fffe1f3a53.dip0.t-ipconnect.de.
 [2003:e4:1f12:c800:f22f:74ff:fe1f:3a53])
 by smtp.gmail.com with ESMTPSA id
 l9-20020a1709060cc900b0073ce4abf093sm5239426ejh.214.2022.09.05.09.33.03
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Mon, 05 Sep 2022 09:33:03 -0700 (PDT)
From: Thierry Reding <thierry.reding@gmail.com>
To: David Airlie <airlied@linux.ie>, Daniel Vetter <daniel@ffwll.ch>,
 Rob Herring <robh+dt@kernel.org>,
 Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>,
 Thierry Reding <thierry.reding@gmail.com>
Subject: [PATCH 0/6] drm/simpledrm: Support system memory framebuffers
Date: Mon,  5 Sep 2022 18:32:54 +0200
Message-Id: <20220905163300.391692-1-thierry.reding@gmail.com>
X-Mailer: git-send-email 2.37.2
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
Cc: linux-tegra@vger.kernel.org, devicetree@vger.kernel.org,
 dri-devel@lists.freedesktop.org, Jon Hunter <jonathanh@nvidia.com>
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

The second half of the series then adds support for the AB24 format and
ties it all together to provide a simple-framebuffer on Jetson Xavier
NX. It should be noted, though, that the Jetson Xavier NX device tree
nodes are an example only and ultimately these will be generated (or at
least filled in) at runtime because of the variable nature of the values
that they contain.

This example also uses (but doesn't depend on) the iommu-addresses
property that has been proposed and which will hopefully be merged soon.

Thierry

Thierry Reding (6):
  dt-bindings: display: simple-framebuffer: Support system memory
    framebuffers
  dt-bindings: reserved-memory: Support framebuffer reserved memory
  drm/simpledrm: Add support for system memory framebuffers
  drm/format-helper: Support the AB24 format
  drm/simpledrm: Support the AB24 format
  arm64: tegra: Add simple framebuffer on Jetson Xavier NX

 .../bindings/display/simple-framebuffer.yaml  |   5 +
 .../bindings/reserved-memory/framebuffer.yaml |  46 +++++
 .../nvidia/tegra194-p3509-0000+p3668-0001.dts |  32 ++++
 arch/arm64/boot/dts/nvidia/tegra194.dtsi      |   2 +-
 drivers/gpu/drm/drm_format_helper.c           |  35 ++++
 drivers/gpu/drm/tiny/simpledrm.c              | 167 ++++++++++++++----
 6 files changed, 255 insertions(+), 32 deletions(-)
 create mode 100644 Documentation/devicetree/bindings/reserved-memory/framebuffer.yaml

-- 
2.37.2

