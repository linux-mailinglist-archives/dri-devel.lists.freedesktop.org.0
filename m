Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id CC5A062E476
	for <lists+dri-devel@lfdr.de>; Thu, 17 Nov 2022 19:40:54 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 53C9910E669;
	Thu, 17 Nov 2022 18:40:49 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-ej1-x634.google.com (mail-ej1-x634.google.com
 [IPv6:2a00:1450:4864:20::634])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 8DFAC10E12C
 for <dri-devel@lists.freedesktop.org>; Thu, 17 Nov 2022 18:40:46 +0000 (UTC)
Received: by mail-ej1-x634.google.com with SMTP id ud5so7336500ejc.4
 for <dri-devel@lists.freedesktop.org>; Thu, 17 Nov 2022 10:40:46 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20210112;
 h=content-transfer-encoding:mime-version:message-id:date:subject:cc
 :to:from:from:to:cc:subject:date:message-id:reply-to;
 bh=SdWdBcRVnJGovle+6r9mHXM5s2nIjF4NnomafJZspdQ=;
 b=iio25gbX1bMRRd0+9jwuh9Nw7EgfgTzEZN/DgMvKJiXXK8z//zor5Feye0llVP57vQ
 w1faTtcLSy7KDZenpep2zUkgazGFrnWF4nBm++7NJGKCpEmqwYYmNFMN0xA0a36R2ES7
 b+2mJFuaoxoVYl+k/H0Vgk/anwEEEXxgfOSEUPzjaCHR+Y2rEQFzxo2GZFoek2jnaf/f
 GmYnKqeduc02g8Il3JNUN08FDhIQH+40i7+0deUB3KI/yfRS1p0Cu9oVLfj0rx89d0Nd
 7nduTXAeySsazb5b6y1P6f2HAvipHIivb32LzGBN2zg8tOjyR4JNArJJtu+gBU6bF+8g
 xWDA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=content-transfer-encoding:mime-version:message-id:date:subject:cc
 :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
 :reply-to;
 bh=SdWdBcRVnJGovle+6r9mHXM5s2nIjF4NnomafJZspdQ=;
 b=mSg3uBzrRNup9AZM8YeGVXx1AA3l/OJPehRhaEBAH+hystDzEeaS2m1UKtizvCid87
 3zH1cJjQF4OSHb6YOyuGAl1UmI3I14L2QbvVqXKa1HK7QmpmJiH95otLAg7P8GPRFLzP
 cvxKeGosp84HAxYIX3fI+n2hVzJgiTZ3X8havzjPaQT4O/Z1o5Y4KN+s/hul3CuSNRUg
 uZnrwHmuYSEFmndZinoSfLb904FgL5scNVTP3jj7IY5wsIvtdTJ0oTI53zvULAreO12i
 jkDAFH2+z2/nR+Dy5tAaWbxOJasiYvRheyhiAR63RJRyFu0kty0DkHRpLi98kWeQOixu
 uYwg==
X-Gm-Message-State: ANoB5plsesHuDCbplL6WD5S+Jiw7tIfNhvNll4kYAmzlhFHmrhVZ9hLH
 8ivAwvqnJZGeaXBWZ83pluk=
X-Google-Smtp-Source: AA0mqf6M80d2AVownwukK88YdOixGPgY0f7Vk8FqgKlgx+RHuHsk9ZiKkvkiaw1foLoV8PPUFHebNA==
X-Received: by 2002:a17:907:98e3:b0:7af:883:ec72 with SMTP id
 ke3-20020a17090798e300b007af0883ec72mr3219830ejc.727.1668710444545; 
 Thu, 17 Nov 2022 10:40:44 -0800 (PST)
Received: from localhost
 (p200300e41f201d00f22f74fffe1f3a53.dip0.t-ipconnect.de.
 [2003:e4:1f20:1d00:f22f:74ff:fe1f:3a53])
 by smtp.gmail.com with ESMTPSA id
 l26-20020a056402231a00b004585eba4baesm867546eda.80.2022.11.17.10.40.43
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Thu, 17 Nov 2022 10:40:43 -0800 (PST)
From: Thierry Reding <thierry.reding@gmail.com>
To: David Airlie <airlied@redhat.com>, Daniel Vetter <daniel@ffwll.ch>,
 Thomas Zimmermann <tzimmermann@suse.de>
Subject: [PATCH v3 0/8] drm/simpledrm: Support system memory framebuffers
Date: Thu, 17 Nov 2022 19:40:31 +0100
Message-Id: <20221117184039.2291937-1-thierry.reding@gmail.com>
X-Mailer: git-send-email 2.38.1
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

Version 2 of these patches can be found here:

	https://lore.kernel.org/all/20221007124946.406808-1-thierry.reding@gmail.com/

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
  drm/format-helper: Support the XB24 format
  drm/simpledrm: Support the XB24/AB24 format
  arm64: tegra: Add simple framebuffer on Jetson Xavier NX

 .../bindings/display/simple-framebuffer.yaml  |   7 ++
 .../bindings/reserved-memory/framebuffer.yaml |  52 ++++++++
 .../nvidia/tegra194-p3509-0000+p3668-0001.dts |  43 +++++++
 arch/arm64/boot/dts/nvidia/tegra194.dtsi      |   2 +-
 drivers/gpu/drm/drm_format_helper.c           |  39 ++++++
 drivers/gpu/drm/tiny/simpledrm.c              | 114 +++++++++++++-----
 include/linux/platform_data/simplefb.h        |   1 +
 7 files changed, 227 insertions(+), 31 deletions(-)
 create mode 100644 Documentation/devicetree/bindings/reserved-memory/framebuffer.yaml

-- 
2.38.1

