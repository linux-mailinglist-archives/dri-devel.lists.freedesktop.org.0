Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 5D3C24E7A15
	for <lists+dri-devel@lfdr.de>; Fri, 25 Mar 2022 18:51:28 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id C403510E595;
	Fri, 25 Mar 2022 17:51:24 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-lf1-x131.google.com (mail-lf1-x131.google.com
 [IPv6:2a00:1450:4864:20::131])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 830E410E595
 for <dri-devel@lists.freedesktop.org>; Fri, 25 Mar 2022 17:51:23 +0000 (UTC)
Received: by mail-lf1-x131.google.com with SMTP id p15so14615028lfk.8
 for <dri-devel@lists.freedesktop.org>; Fri, 25 Mar 2022 10:51:23 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20210112;
 h=from:to:cc:subject:date:message-id:mime-version
 :content-transfer-encoding;
 bh=xVjY+0+WQdrpFP0Z4+mXCq1mql+ycXs6eG3CZHDrAmU=;
 b=lojiQifx8p87NyqVcH+S1qS6PCpqH5hv3kq4ooLqiFC6LxWDa9UgXn8DlfDAioSt1j
 KSAuBaTunUxouxmXWo2+15PDH/VN/ieCBsBJjuXFbc2xfnfwVCtSGvaagNNpTDQGdZgE
 GP918nP4FtvgObAnrg127i02SvnAsUwXRs55MBrgGN+iQOAb1f6li/1MjBa9/AIbQjcl
 mgniBgRiqj/I+/X+mqlQZ3Yf4r8wOKWKwWOdxvUj92XMj6UjWxYclsnxsu9WGd2BMtBK
 AKM5VkfdFaGTir6C62aKUl6BF7HJFlvGSMaTZIWstEg+TiHsrgU4JcvQ7X03/T8g0qeI
 4+HA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:mime-version
 :content-transfer-encoding;
 bh=xVjY+0+WQdrpFP0Z4+mXCq1mql+ycXs6eG3CZHDrAmU=;
 b=wICvn8mAMJD0//IUcDRNKcSNIw6fJCAMzD5J1MmXwEzrFOCpS0yGuYKcZ1YlTwn7jL
 zQTRm9apTqF1nKaokkVuTlzWpOu/l2mez8fa8Z/NjPCvJLqXXpZSUSTvwatxxAHM5SD5
 xEyUOTI9XX7SCHYLeLi0ACEmbEq/ddng9MquYd5BxXOREz+aMB7N6BFdwEy3/DlyMKZ/
 xrIs/hGYbRmSpbSI+Thl0l0bEks62s/LC0xePpzfrX/GLCas029LG4ESiQHPKT/Zhap1
 ilnH7wxIXJffW0uiIGyc3FHUh/n4rNHXw8MtxK1iHLLiejdWTk5TvD0scK9qzmUNSGwQ
 ESrA==
X-Gm-Message-State: AOAM533YpOsGtTtivWyjMB8sfdHdglmDchxYSKaaYFODbdQDSEaXT5lu
 KvLdUfuWNou5s18qvif1Jr5GXiVSHss=
X-Google-Smtp-Source: ABdhPJxAEnH5lsTxK0dwzXh9eTKtgIhBWkNU0rp0Ctj3hfRmVeqJzFqWeVIH6b285IubNGFGBU7ROg==
X-Received: by 2002:ac2:57d4:0:b0:448:2cba:6c86 with SMTP id
 k20-20020ac257d4000000b004482cba6c86mr8667977lfo.201.1648230681400; 
 Fri, 25 Mar 2022 10:51:21 -0700 (PDT)
Received: from inno-pc.lan (88-115-161-74.elisa-laajakaista.fi.
 [88.115.161.74]) by smtp.gmail.com with ESMTPSA id
 h18-20020a056512339200b0044a2e5b94afsm777155lfg.56.2022.03.25.10.51.20
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Fri, 25 Mar 2022 10:51:20 -0700 (PDT)
From: Zhi Wang <zhi.wang.linux@gmail.com>
X-Google-Original-From: Zhi Wang <zhi.a.wang@intel.com>
To: dri-devel@lists.freedesktop.org,
	linux-kernel@vger.kernel.org
Subject: [PATCH v7 0/3] Refactor GVT-g MMIO tracking table and handlers
Date: Fri, 25 Mar 2022 13:51:13 -0400
Message-Id: <20220325175116.167097-1-zhi.a.wang@intel.com>
X-Mailer: git-send-email 2.25.1
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
Cc: Zhi Wang <zhi.a.wang@intel.com>
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

To support the new mdev interfaces and the re-factor patches from
Christoph, which moves the GVT-g code into a dedicated module, the GVT-g
initialization path has to be separated into two phases:

a) Early initialization.

The early initialization of GVT requires to be done when loading i915.
Mostly it's because the initial clean HW state needs to be saved before
i915 touches the HW.

b) Late initalization.

This phases of initalization will setup the rest components of GVT-g,
which can be done later when the dedicated module is being loaded.

To initialize the GVT-g MMIO tracking table in the early initalization
stage, which will be done in i915, the GVT-g MMIO tracking table needs
to be sperated accordingly and moved into i915.

v7:

- Keep the marcos of device generation in GVT-g. (Christoph, Jani)

v6:

- Move the mmio_table.c into i915. (Christoph)
- Keep init_device_info and related structures in GVT-g. (Christoph)
- Refine the callbacks of the iterator. (Christoph)
- Move the flags of MMIO register defination to GVT-g. (Chrsitoph)
- Move the mmio block handling to GVT-g.

v5:

- Re-design the mmio table framework. (Christoph)

v4:

- Fix the errors of patch checking scripts.

v3:

- Fix the errors when CONFIG_DRM_I915_WERROR is turned on. (Jani)

v2:

- Implement a mmio table instead of generating it by marco in i915. (Jani)

Zhi Wang (3):
  i915/gvt: Separate the MMIO tracking table from GVT-g
  i915/gvt: Save the initial HW state snapshot in i915
  i915/gvt: Use the initial HW state snapshot saved in i915

 drivers/gpu/drm/i915/Makefile               |    2 +-
 drivers/gpu/drm/i915/gvt/firmware.c         |   25 +-
 drivers/gpu/drm/i915/gvt/gvt.h              |    3 +-
 drivers/gpu/drm/i915/gvt/handlers.c         | 1031 ++-------------
 drivers/gpu/drm/i915/gvt/mmio.h             |    1 -
 drivers/gpu/drm/i915/gvt/reg.h              |    9 +-
 drivers/gpu/drm/i915/i915_drv.h             |    2 +
 drivers/gpu/drm/i915/intel_gvt.c            |   92 +-
 drivers/gpu/drm/i915/intel_gvt.h            |   21 +
 drivers/gpu/drm/i915/intel_gvt_mmio_table.c | 1308 +++++++++++++++++++
 10 files changed, 1577 insertions(+), 917 deletions(-)
 create mode 100644 drivers/gpu/drm/i915/intel_gvt_mmio_table.c

-- 
2.25.1

