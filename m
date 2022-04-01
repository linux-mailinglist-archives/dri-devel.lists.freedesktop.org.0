Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id C1DA04EEDA1
	for <lists+dri-devel@lfdr.de>; Fri,  1 Apr 2022 15:02:16 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 2219310E2EC;
	Fri,  1 Apr 2022 13:02:14 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-lj1-x231.google.com (mail-lj1-x231.google.com
 [IPv6:2a00:1450:4864:20::231])
 by gabe.freedesktop.org (Postfix) with ESMTPS id E82B810E2DC;
 Fri,  1 Apr 2022 13:02:12 +0000 (UTC)
Received: by mail-lj1-x231.google.com with SMTP id a30so3762273ljq.13;
 Fri, 01 Apr 2022 06:02:12 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20210112;
 h=from:to:cc:subject:date:message-id:mime-version
 :content-transfer-encoding;
 bh=F2a7FzY8m8T/X8RahAU7iiC4xIiCX7s7pXJBmjYLomg=;
 b=Kllbv9ROEVis7uoR2X2A5Om2EfLwcuUoUFYo2Uqbalt5eN2n2PjiHTIsgraoZr6soK
 6kmAdU75b2GR7Us5DWu9UBJ+YIkI6jVZY0RGMdjhCJt2LbuPUuSS4PtwpsVZp/lVyyiE
 kYxSYv5oTXoVVkBJf2NdoFAkwWYLXC0/dVmj/N5TGrbaf39zSDCLCNNpCS4HtxeE3AbG
 CbfnJgA6FcAIKSxFUxJX3kKDPNhQzvQ9jCwRA1ywyWQfXTan2FaeIkB9d26js8cpFYF8
 5Gpe4gxL/zmJEQ/n0rjKKRaN5vJiaWjr1rxrWTj6QW7WjH+DBmAs7NeqgFjlyYm9HGGE
 x8mQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:mime-version
 :content-transfer-encoding;
 bh=F2a7FzY8m8T/X8RahAU7iiC4xIiCX7s7pXJBmjYLomg=;
 b=R0M0qKOqEO8j7wSWssftyeT3QyWgNIID3Ta4A0V8SYn/wLymXTn2LWyXrFXLn/3qU2
 b37/H6DuKFqsCo9lHTEz4QVX8mY4QVX9MmvkJw1W8Ox7zaQahfqCmcCmj9OeTZa/+u6e
 ii54DBBee3l5MUWB7iyhkx7cOIoCY6tp9JEgyXm6gt3nSbDljgpnx2bclVWLbCK29+aI
 6zyCRSEJp2yZUXEFEKAKuBMwIyJMqxSly4QhpuZBJwLepUczZ7A56MMsV/1iso45hhXU
 zRgNshZr7A0BTENCcbkozVuG+ZVeUHQDh3QdGoCP9Bf19pByjFvuPT9sNkJ9og/H7Zss
 PDuA==
X-Gm-Message-State: AOAM5300YQJeMAkwv2vR5jZwvcACv9YMwXFqWYZvnMmzmMs2nItNDmpG
 afU7Gr6PtqFRzzU0y1iuXDsq8t4joBY=
X-Google-Smtp-Source: ABdhPJwtj+gJj2b3rNmdT/kiOBvx9CCYWYS8G30yDCNSdGmhfGez5asIsu00ahMD2oJ4rY2OAnSOdg==
X-Received: by 2002:a2e:5417:0:b0:24b:503:a2dc with SMTP id
 i23-20020a2e5417000000b0024b0503a2dcmr1238218ljb.485.1648818130833; 
 Fri, 01 Apr 2022 06:02:10 -0700 (PDT)
Received: from inno-pc.lan (88-115-161-74.elisa-laajakaista.fi.
 [88.115.161.74]) by smtp.gmail.com with ESMTPSA id
 y22-20020a056512045600b0044a997dea9esm235574lfk.283.2022.04.01.06.02.09
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Fri, 01 Apr 2022 06:02:10 -0700 (PDT)
From: Zhi Wang <zhi.wang.linux@gmail.com>
X-Google-Original-From: Zhi Wang <zhi.a.wang@intel.com>
To: dri-devel@lists.freedesktop.org, linux-kernel@vger.kernel.org,
 intel-gfx@lists.freedesktop.org, intel-gvt-dev@lists.freedesktop.org
Subject: [PATCH v8 0/3] Refactor GVT-g MMIO tracking table and handlers
Date: Fri,  1 Apr 2022 09:02:04 -0400
Message-Id: <20220401130207.33944-1-zhi.a.wang@intel.com>
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

---
v8:

- Use SPDX header in the intel_gvt_mmio_table.c
- Reference the gvt.h with path. (Jani)
- Add a missing fix on mmio emulation path during my debug.
- Fix a building problem on refreshed gvt-staging branch. (Christoph)


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
 drivers/gpu/drm/i915/intel_gvt_mmio_table.c | 1290 +++++++++++++++++++
 10 files changed, 1559 insertions(+), 917 deletions(-)
 create mode 100644 drivers/gpu/drm/i915/intel_gvt_mmio_table.c

-- 
2.25.1

