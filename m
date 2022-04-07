Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 8E9074F773C
	for <lists+dri-devel@lfdr.de>; Thu,  7 Apr 2022 09:19:58 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 93C4110E497;
	Thu,  7 Apr 2022 07:19:53 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-lj1-x231.google.com (mail-lj1-x231.google.com
 [IPv6:2a00:1450:4864:20::231])
 by gabe.freedesktop.org (Postfix) with ESMTPS id C067210E02A;
 Thu,  7 Apr 2022 07:19:51 +0000 (UTC)
Received: by mail-lj1-x231.google.com with SMTP id g24so6282469lja.7;
 Thu, 07 Apr 2022 00:19:51 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20210112;
 h=from:to:cc:subject:date:message-id:mime-version
 :content-transfer-encoding;
 bh=spWrYcKOdFPkx7V/bTw1Vt2s30IOz+mRUF4zmksu6mQ=;
 b=FyqWdb6gIKxeVrVuAeWCf3FvBqLaOhrR/SjYm0KsyGakK5ERgmZ5Q1v/I4ntkwgobn
 hlYthisEch6PMC+myPJYKddxKfQ3BY8XT0IvHzQHz2oTxYrzXMmxIrlES5MiYPu6C+IC
 apRU8g2a6aaRjRJoWfIJqRgblGYmQXjJ8s57Ue5o2vNTYlsDE4DaomqJN9zeGVNDYYd9
 XHPk5n6eHeF2kERDafquqlfKN1oFDnYuHOccx2cjr10305FRmb7VsKXKsn+3XOAmVIvC
 bjTT+R1ONZYnskGzKTcWqkaweLj9swhAXWdZp+IaSwmFqS2w54zhHKUVKOL2NT35M0W5
 WsNQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:mime-version
 :content-transfer-encoding;
 bh=spWrYcKOdFPkx7V/bTw1Vt2s30IOz+mRUF4zmksu6mQ=;
 b=DJM0QXQVYGQngEhktWK86IhTZt2npv4pa+8NhvV8vBNerVlQe7yl5an8Hr/mY/1E60
 Mr3ec9LNiezi6/bkIPMLrrEE0PIKUv1h/bSPugo/NTOMxhBFGo8ioSYwW4BdEyLXbXdf
 yYmRkz0alYkmwjqvu22C60Mz6iT089v9JbtldoCvIao1TfnOB7yNQqjAgTMsDkzh9AdG
 DEgOzJo0rVdegzMFL/RKAepuc6ONo1LmS4Oq4rVIrD36PBLrwXKhXL5q7NVdPpwYLdIK
 SEZOsfmGR7jPR1KyyAcx3ofu+CD4ScjmkIdn3dxp3dSxjUDjD3pTyntTLZO/e5h3hnUU
 ymrg==
X-Gm-Message-State: AOAM530idVLXltp8s8UI12oM5mkuBaNpPg5Pn5TakXaXnCPngRvCMB4G
 RM8iQIz+A2rYwSAZ95nSckIzekO1YVk=
X-Google-Smtp-Source: ABdhPJwJUzDEU28pZhfXC85eJi/upEh1gZjgy0Gwl5L5LOhJ2xO7R7mU4yWj/MRZ1U86ick83PUMAw==
X-Received: by 2002:a2e:3615:0:b0:24a:fc28:f0b3 with SMTP id
 d21-20020a2e3615000000b0024afc28f0b3mr7894757lja.4.1649315989563; 
 Thu, 07 Apr 2022 00:19:49 -0700 (PDT)
Received: from inno-pc.lan (88-115-161-74.elisa-laajakaista.fi.
 [88.115.161.74]) by smtp.gmail.com with ESMTPSA id
 h10-20020a056512220a00b0044a308dad8csm2081465lfu.149.2022.04.07.00.19.48
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Thu, 07 Apr 2022 00:19:48 -0700 (PDT)
From: Zhi Wang <zhi.wang.linux@gmail.com>
X-Google-Original-From: Zhi Wang <zhi.a.wang@intel.com>
To: dri-devel@lists.freedesktop.org, linux-kernel@vger.kernel.org,
 intel-gfx@lists.freedesktop.org, intel-gvt-dev@lists.freedesktop.org
Subject: [PATCH v9 0/3] Refactor GVT-g MMIO tracking table and handlers
Date: Thu,  7 Apr 2022 03:19:42 -0400
Message-Id: <20220407071945.72148-1-zhi.a.wang@intel.com>
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

v9:
- Fix a problem might casue kernel panic.

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
 drivers/gpu/drm/i915/gvt/handlers.c         | 1033 ++-------------
 drivers/gpu/drm/i915/gvt/mmio.h             |    1 -
 drivers/gpu/drm/i915/gvt/reg.h              |    9 +-
 drivers/gpu/drm/i915/i915_drv.h             |    2 +
 drivers/gpu/drm/i915/intel_gvt.c            |   92 +-
 drivers/gpu/drm/i915/intel_gvt.h            |   21 +
 drivers/gpu/drm/i915/intel_gvt_mmio_table.c | 1290 +++++++++++++++++++
 10 files changed, 1561 insertions(+), 917 deletions(-)
 create mode 100644 drivers/gpu/drm/i915/intel_gvt_mmio_table.c

-- 
2.25.1

