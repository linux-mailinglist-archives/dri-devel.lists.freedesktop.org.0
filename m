Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 1FD9A675B67
	for <lists+dri-devel@lfdr.de>; Fri, 20 Jan 2023 18:31:20 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id DAC1310E04E;
	Fri, 20 Jan 2023 17:31:11 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-wm1-x32c.google.com (mail-wm1-x32c.google.com
 [IPv6:2a00:1450:4864:20::32c])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 6E92610E04E
 for <dri-devel@lists.freedesktop.org>; Fri, 20 Jan 2023 17:31:08 +0000 (UTC)
Received: by mail-wm1-x32c.google.com with SMTP id
 fl11-20020a05600c0b8b00b003daf72fc844so6368290wmb.0
 for <dri-devel@lists.freedesktop.org>; Fri, 20 Jan 2023 09:31:08 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20210112;
 h=content-transfer-encoding:mime-version:message-id:date:subject:cc
 :to:from:from:to:cc:subject:date:message-id:reply-to;
 bh=3J2itS20NIBDGH/TBRDy55yDYk5wIxakW5Tg51bklwk=;
 b=f8QV4K1CueLOuxG1BRAcVEg+o1sf+kM3UZm8E6LZwxKNzHQweK0Njm/dZSHmV9ZXjP
 1E8qH4ixP6I/knBUajC7iD+7C8LKMIuv0fCuio1+7iASciPTeaE30/GsRVFxAOEYFyvk
 mrLGnA/fDfAGqCKL3iBku9fR5tfEjRi+Z8TRd6ocoo5Wg5qHcEmC+lzDBPJMmyYoSoOE
 /GW28q3PipJ6tsFdvbpidevzpSJw6YPlfygDqwsCtcPHRfpxc+KqJqXMEhNqjK6blug0
 9/akTg4V7MG4/NwGjdSvr08Efe5YdE+RwB3KWZ5APBFhz+/TfOZfAwpI4CTZVIls7mVT
 GoNw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=content-transfer-encoding:mime-version:message-id:date:subject:cc
 :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
 :reply-to;
 bh=3J2itS20NIBDGH/TBRDy55yDYk5wIxakW5Tg51bklwk=;
 b=ZvqE47Hb0dTK3hvn//8iKmNarTqSYXsDzy+WV9hZqUXrsIwEipbhlCCIz20QSW48np
 K2LLEQCVOXmeLzbkgvszoFM4WMjkAbfdf8dOs1qFlcP6VUUuJUdahCRzEL7Kl6RGodCf
 t2g8I/gb2ffbzBmZJQWlHIUrNsUWRtIoYFTK/QQgECx70CUZDKzugW2FbvXAmBmLESSA
 ig4khW06+zJEgv9cqpahn/XZmCIqBcV+4Mf4KpWNC+j4mIWycSy4hqdOjjVcH9MYNH5h
 MkDAjFVhDU55MkO0cyN/l8FRTTkCYlHsPavRKIKb+SjakHNEBR+uuc7qHuosJBl2ylSj
 Lx+g==
X-Gm-Message-State: AFqh2kp+YHco+l6V0x4ylG/Qm6W6CF4UJAQx6OsPOsVpXB44LGyl1n1T
 DuQBMX54Jv0hsNZYNqjZPabzXMlqu5g=
X-Google-Smtp-Source: AMrXdXv/lsHkVq/gvQchmsnaCVqu+Na5fPQU6wvRtzuyU+0iN0+HqEm7rUpVxgO0TnsXAQPRn9aLgA==
X-Received: by 2002:a05:600c:3b91:b0:3d3:5c9e:6b27 with SMTP id
 n17-20020a05600c3b9100b003d35c9e6b27mr11441903wms.12.1674235866759; 
 Fri, 20 Jan 2023 09:31:06 -0800 (PST)
Received: from localhost
 (p200300e41f201d00f22f74fffe1f3a53.dip0.t-ipconnect.de.
 [2003:e4:1f20:1d00:f22f:74ff:fe1f:3a53])
 by smtp.gmail.com with ESMTPSA id
 d22-20020a1c7316000000b003db0dbbea53sm2818758wmb.30.2023.01.20.09.31.06
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Fri, 20 Jan 2023 09:31:06 -0800 (PST)
From: Thierry Reding <thierry.reding@gmail.com>
To: David Airlie <airlied@redhat.com>, Daniel Vetter <daniel@ffwll.ch>,
 Thomas Zimmermann <tzimmermann@suse.de>
Subject: [PATCH v4 0/8] drm/simpledrm: Support system memory framebuffers
Date: Fri, 20 Jan 2023 18:30:55 +0100
Message-Id: <20230120173103.4002342-1-thierry.reding@gmail.com>
X-Mailer: git-send-email 2.39.0
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
 Robin Murphy <robin.murphy@arm.com>, dri-devel@lists.freedesktop.org,
 Jon Hunter <jonathanh@nvidia.com>
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

Version 3 of these patches can be found here:

	https://lore.kernel.org/all/20221117184039.2291937-1-thierry.reding@gmail.com/

Changes in v4:
- rebase onto latest format helper changes, add back AB24 support
- use drm_dbg() instead of drm_info() for some messages
- use consistent name for iosys_map structures
- collect Reviewed-bys from v3

Changes in v3:
- add new formats into conv_from_xrgb8888[] array to make it work after
  commit 6fdaed8c7988 ("drm/format-helper: Only advertise supported
  formats for conversion")
- extract iosys_map fix into a separate patch
- fix bogus increments in struct iosys_map usage
- simplify memory code

Changes in v2:
- DT fields are now cleared so that they can be filled in at runtime
- add XB24 support and treat AB24 the same (alpha bits are unused)
- consistently use struct iosys_map
- fix issues with DT bindings

I've tested these with a simple UEFI implementation that will fill in
the placeholder values and set the simple-framebuffer's status property
to "okay".

Thierry

Thierry Reding (8):
  dt-bindings: display: simple-framebuffer: Support system memory
    framebuffers
  dt-bindings: display: simple-framebuffer: Document 32-bit BGR format
  dt-bindings: reserved-memory: Support framebuffer reserved memory
  drm/simpledrm: Use struct iosys_map consistently
  drm/simpledrm: Add support for system memory framebuffers
  drm/format-helper: Support the AB24/XB24 formats
  drm/simpledrm: Support the XB24/AB24 format
  arm64: tegra: Add simple framebuffer on Jetson Xavier NX

 .../bindings/display/simple-framebuffer.yaml  |   7 ++
 .../bindings/reserved-memory/framebuffer.yaml |  52 +++++++++
 .../nvidia/tegra194-p3509-0000+p3668-0001.dts |  43 +++++++
 arch/arm64/boot/dts/nvidia/tegra194.dtsi      |   2 +-
 drivers/gpu/drm/drm_format_helper.c           |  66 +++++++++++
 drivers/gpu/drm/tiny/simpledrm.c              | 110 +++++++++++++-----
 include/linux/platform_data/simplefb.h        |   1 +
 7 files changed, 251 insertions(+), 30 deletions(-)
 create mode 100644 Documentation/devicetree/bindings/reserved-memory/framebuffer.yaml

-- 
2.39.0

