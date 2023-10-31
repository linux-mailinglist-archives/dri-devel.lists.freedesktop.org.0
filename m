Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id C1FFB7DCE05
	for <lists+dri-devel@lfdr.de>; Tue, 31 Oct 2023 14:41:15 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id C757A10E4C8;
	Tue, 31 Oct 2023 13:41:08 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-pf1-x429.google.com (mail-pf1-x429.google.com
 [IPv6:2607:f8b0:4864:20::429])
 by gabe.freedesktop.org (Postfix) with ESMTPS id ACE4D10E4C2;
 Tue, 31 Oct 2023 13:41:05 +0000 (UTC)
Received: by mail-pf1-x429.google.com with SMTP id
 d2e1a72fcca58-6bd20c30831so1352309b3a.1; 
 Tue, 31 Oct 2023 06:41:05 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20230601; t=1698759665; x=1699364465; darn=lists.freedesktop.org;
 h=content-transfer-encoding:mime-version:message-id:date:subject:cc
 :to:from:from:to:cc:subject:date:message-id:reply-to;
 bh=xTHT1djVG+XG1VFJbKuoAItEE4ND+sRUqmluWrrf77w=;
 b=YSCSMwKkKRgAegHmpazT+WmXRxXA5ZpY/0LDowo5VtxVl5bkhh8k/Rp7cZDNAj+PEH
 SFkXxbDTV8LtueezO9/IBVRmMULsCPxXmdcZ1XBo0CFbdqjidjBBLydSoJJuw/fqwZpa
 tHtUn3rHC8A/8azmp6la6iBRj0zejGpS2tGVxvRTILbgYOFLbqPwUDEH3pMR+0m5rQa+
 UfOYzlNK2xyzU9IMIvdo6fmCrzQhT+qY1f2YlKrMjhLYAGB7BVol6DSLJ9BQBGJVgtvX
 zH99mUWBvIIcOr3WvONg8BBiRM5i0oI1Z9xKAt7SFXBMMUNblVYok9bq1dQtdxXn6oUz
 eUJA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1698759665; x=1699364465;
 h=content-transfer-encoding:mime-version:message-id:date:subject:cc
 :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
 :reply-to;
 bh=xTHT1djVG+XG1VFJbKuoAItEE4ND+sRUqmluWrrf77w=;
 b=pCX69Pb1meGNtDAMaiKzo1DnkgK0Iv1JnYz+qlx0f2o8+HiqEyFX8D0rqFnP3iWXD8
 NJImeBadGwPaohFX8/ASe+VNzphVqu706Wypxyn1/BczJMhAUF5NIER1LPu1oiP2QgX/
 9Sbp8eit8Yt1OdUXKYi6pYd+m/QkXU4akqqprjTqqtV+U6kJTo0lGHigw8/FjSBwSHml
 McoupX7HU/uJUhhEV+gF0914ohogQ8brYkKiNnR3O3vas/tgy4+0SalL+KrhcNJOnA1h
 TMsE8g2NzZETorvhgiKJ+OGwfkiMzRAa5d7mdY6q/YHp66AAuTr673SIIWiT6E61XBla
 FqlQ==
X-Gm-Message-State: AOJu0YxscqxY1QFOL8IXHAX6EJV0iANJyJIXgOFTkCA2t0MnkqFIgzQ+
 MTIMSeS8to8RExYsQMOgIF5h82FFenS589jc
X-Google-Smtp-Source: AGHT+IF4Uyg8puKPMvfSubrNSbo/Xrg/Gq6MSoaPzSgqT0brSo+cG/3YielU73pRfGkAwfZMbgts8Q==
X-Received: by 2002:a05:6a20:93a2:b0:171:737:df97 with SMTP id
 x34-20020a056a2093a200b001710737df97mr15531809pzh.2.1698759664582; 
 Tue, 31 Oct 2023 06:41:04 -0700 (PDT)
Received: from localhost (zz20184013906F627101.userreverse.dion.ne.jp.
 [111.98.113.1]) by smtp.gmail.com with ESMTPSA id
 o191-20020a62cdc8000000b00687fcb1e609sm1301276pfg.116.2023.10.31.06.41.03
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Tue, 31 Oct 2023 06:41:03 -0700 (PDT)
From: Tatsuyuki Ishi <ishitatsuyuki@gmail.com>
To: dri-devel@lists.freedesktop.org,
	amd-gfx@lists.freedesktop.org
Subject: [PATCH 0/6] drm/amdgpu: Add flag to disable implicit sync for GEM
 operations.
Date: Tue, 31 Oct 2023 22:40:53 +0900
Message-ID: <20231031134059.171277-1-ishitatsuyuki@gmail.com>
X-Mailer: git-send-email 2.42.0
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
Cc: Tatsuyuki Ishi <ishitatsuyuki@gmail.com>, christian.koenig@amd.com
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

In Vulkan, it is the application's responsibility to perform adequate
synchronization before a sparse unmap, replace or BO destroy operation.
This adds an option to AMDGPU_VA_OPs to disable redundant implicit sync
that happens on sparse unmap or replace operations.

This has seen a significant improvement in stutter in Forza Horizon 5
and Forza Horizon 4. (As games that had significant issues in sparse
binding related stutter).

This patchset also address a tangential issue that some changes were
not being flushed immediately after the ioctls, but were deferred to be
processed on the next CS submission, which also results in stalling.
A refactor of state machine is included to achieve this.

Compared to the previous series [1], this specifically targets the VM
operations and keep everything else intact, including implicit sync on
kernel-initiated moves.

I've been able to pass a full Vulkan CTS run on Navi 10 with this.

Userspace code for this is available at [2] and a branch for the kernel
code is available at [3].

[1]: https://lore.kernel.org/all/20230821062005.109771-1-ishitatsuyuki@gmail.com/
[2]: https://gitlab.freedesktop.org/ishitatsuyuki/mesa/-/commits/vm-explicit-sync
[3]: https://github.com/ishitatsuyuki/linux/tree/explicit-sync-drm-misc-next

Tatsuyuki Ishi (6):
  drm/amdgpu: Don't implicit sync PRT maps.
  drm/amdgpu: Separate eviction from VM status.
  drm/amdgpu: Flush VM updates for split bindings eagerly.
  drm/amdgpu: Remove redundant state change after validation.
  drm/amdgpu: Add flag to disable implicit sync for GEM operations.
  drm/amdgpu: Bump amdgpu driver version.

 .../gpu/drm/amd/amdgpu/amdgpu_amdkfd_gpuvm.c  |   2 +-
 drivers/gpu/drm/amd/amdgpu/amdgpu_csa.c       |   2 +-
 drivers/gpu/drm/amd/amdgpu/amdgpu_drv.c       |   3 +-
 drivers/gpu/drm/amd/amdgpu/amdgpu_gem.c       |  32 +--
 drivers/gpu/drm/amd/amdgpu/amdgpu_object.h    |   7 +-
 drivers/gpu/drm/amd/amdgpu/amdgpu_trace.h     |   6 +-
 drivers/gpu/drm/amd/amdgpu/amdgpu_vm.c        | 185 ++++++++++--------
 drivers/gpu/drm/amd/amdgpu/amdgpu_vm.h        |  27 +--
 drivers/gpu/drm/amd/amdgpu/amdgpu_vm_pt.c     |   1 +
 drivers/gpu/drm/amd/amdkfd/kfd_svm.c          |  18 +-
 include/uapi/drm/amdgpu_drm.h                 |   2 +
 11 files changed, 165 insertions(+), 120 deletions(-)

-- 
2.42.0

