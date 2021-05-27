Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 7A6ED3938ED
	for <lists+dri-devel@lfdr.de>; Fri, 28 May 2021 01:09:30 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id A0C0B6E2C0;
	Thu, 27 May 2021 23:09:27 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-il1-x132.google.com (mail-il1-x132.google.com
 [IPv6:2607:f8b0:4864:20::132])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 6ADB46E2C0;
 Thu, 27 May 2021 23:09:27 +0000 (UTC)
Received: by mail-il1-x132.google.com with SMTP id l15so1774079ilh.1;
 Thu, 27 May 2021 16:09:27 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=from:to:cc:subject:date:message-id:mime-version
 :content-transfer-encoding;
 bh=4kLiEsgXJL4l0OE3QcUENS/6JLbXlz5zRsd7ODaSzsA=;
 b=AN9s3c3Nnqymav/1Na5LgRM+yBjehQGzQVHllAlGVj/anzx0uk05waX9p6Xtf+AB1L
 sMWyKD2IQV3IiuxHTkKcNwoXxLgx7iNowi6tWHHMy2FjfaXbbnAr8KECFOUxY2sfgw8a
 xCOFXm7f+fWr8Pi0DVhWkJuMKMg1d+BLm6/QcmgULUGLyiB6I9d1a3b/Xs7Cz7endodL
 sZ7Yn7Dvgw0ZidAvf+VzU3YQWI+cvURDkp/ocIflIPjdhuyA61n06Ec5h9MMkkE/XZnq
 z6K+JUN48Q+XvgRICM5Blx185WYOCsG84f7kPj97hhZihds/zRInHrm2Etmv3Er9TiFg
 QYQA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:mime-version
 :content-transfer-encoding;
 bh=4kLiEsgXJL4l0OE3QcUENS/6JLbXlz5zRsd7ODaSzsA=;
 b=WPkdcRkvE+YSyjVdh1JA5dMkuA//UiIArI+PToRzqGoAA+M7xpGZABGqFYFuljaRyJ
 hT7ryxuWreHeS8tsnLQto9wPCoKPdIYiS+p4OgnXNfgtPvnS1h1X0/XP1yZ7Or0BC3wM
 i0csK9/VwK82UDSTOfAvfSeU7oe8eE0QG6vTrLom8enokM2AJm8++SPLiLTuppfMTZIz
 84vreTossoyRwVI4X0DslkrlfkhR3SvaGcGi8WddPPv6SYu0jVHxCzdB2dwy+QRqNgYK
 bFHbgYCIO2h6VeebGDfLhRaQpZSafffMxAmll8WgeS+FG4gjQh/psN4J2/i2CFbXCPTS
 YjgQ==
X-Gm-Message-State: AOAM530DreF/SYxPdFdPIdx52Bnc9xUlV+Geob4nsRv6npyxqww9hS23
 YSrZoQhMY+MsrIjJ3NfEouk=
X-Google-Smtp-Source: ABdhPJwk5Q8Yq1NmCjqTz3x3UVzu8172YycfbZkjO+O53PFGq2hSwrHmFPyOgtebO7cEMlrgm4pSUA==
X-Received: by 2002:a92:d9d2:: with SMTP id n18mr5096577ilq.10.1622156966745; 
 Thu, 27 May 2021 16:09:26 -0700 (PDT)
Received: from Harpoon.amd.com ([165.204.55.251])
 by smtp.gmail.com with ESMTPSA id r5sm1860014ilb.1.2021.05.27.16.09.06
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Thu, 27 May 2021 16:09:09 -0700 (PDT)
From: Felix Kuehling <felix.kuehling@gmail.com>
X-Google-Original-From: Felix Kuehling <Felix.Kuehling@amd.com>
To: felix.kuehling@amd.com,
	akpm@linux-foundation.org,
	linux-mm@kvack.org
Subject: [RFC PATCH 0/5] Support DEVICE_GENERIC memory in migrate_vma_*
Date: Thu, 27 May 2021 19:08:04 -0400
Message-Id: <20210527230809.3701-1-Felix.Kuehling@amd.com>
X-Mailer: git-send-email 2.31.1
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
Cc: dri-devel@lists.freedesktop.org, jglisse@redhat.com,
 amd-gfx@lists.freedesktop.org, hch@lst.de, jgg@nvidia.com
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

AMD is building a system architecture for the Frontier supercomputer with
a coherent interconnect between CPUs and GPUs. This hardware architecture
allows the CPUs to coherently access GPU device memory. We have hardware
in our labs and we are working with our partner HPE on the BIOS, firmware
and software for delivery to the DOE.

The system BIOS advertises the GPU device memory (aka VRAM) as SPM
(special purpose memory) in the UEFI system address map. The amdgpu driver
looks it up with lookup_resource and registers it with devmap as
MEMORY_DEVICE_GENERIC using devm_memremap_pages.

Now we're trying to migrate data to and from that memory using the
migrate_vma_* helpers so we can support page-based migration in our
unified memory allocations, while also supporting CPU access to those
pages.

This patch series makes a few changes to make MEMORY_DEVICE_GENERIC pages
behave correctly in the migrate_vma_* helpers. We are looking for feedback
about this approach. If we're close, what's needed to make our patches
acceptable upstream? If we're not close, any suggestions how else to
achieve what we are trying to do (i.e. page migration and coherent CPU
access to VRAM)?

This work is based on HMM and our SVM memory manager that was recently
upstreamed to Dave Airlie's drm-next branch
[https://cgit.freedesktop.org/drm/drm/log/?h=drm-next]. On top of that we
did some rework of our VRAM management for migrations to remove some
incorrect assumptions, allow partially successful migrations and GPU
memory mappings that mix pages in VRAM and system memory.
[https://patchwork.kernel.org/project/dri-devel/list/?series=489811]

In this RFC, patches 1 and 2 are for context to show how we are looking up
the SPM memory and registering it with devmap.

Patches 3-5 are the changes we are trying to upstream or rework to make
them acceptable upstream.

Alex Sierra (5):
  drm/amdkfd: add SPM support for SVM
  drm/amdkfd: generic type as sys mem on migration to ram
  include/linux/mm.h: helper to check zone device generic type
  mm: add generic type support for device zone page migration
  mm: changes to unref pages with Generic type

 drivers/gpu/drm/amd/amdkfd/kfd_migrate.c | 15 +++++++++++----
 drivers/gpu/drm/amd/amdkfd/kfd_svm.h     |  1 -
 include/linux/mm.h                       |  8 ++++++++
 kernel/resource.c                        |  2 +-
 mm/memremap.c                            |  5 ++++-
 mm/migrate.c                             | 13 ++++++++-----
 6 files changed, 32 insertions(+), 12 deletions(-)

-- 
2.31.1

