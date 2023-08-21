Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 4CAB778238E
	for <lists+dri-devel@lfdr.de>; Mon, 21 Aug 2023 08:21:01 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 52F1210E1CB;
	Mon, 21 Aug 2023 06:20:58 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-oo1-xc2f.google.com (mail-oo1-xc2f.google.com
 [IPv6:2607:f8b0:4864:20::c2f])
 by gabe.freedesktop.org (Postfix) with ESMTPS id B653D10E1C3;
 Mon, 21 Aug 2023 06:20:55 +0000 (UTC)
Received: by mail-oo1-xc2f.google.com with SMTP id
 006d021491bc7-56e54e52889so452481eaf.1; 
 Sun, 20 Aug 2023 23:20:55 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20221208; t=1692598854; x=1693203654;
 h=content-transfer-encoding:mime-version:message-id:date:subject:cc
 :to:from:from:to:cc:subject:date:message-id:reply-to;
 bh=CA7RRYLtUdje8FIoLFbRrPpcXjegZHP09hi7r4raqgw=;
 b=WWFHmotQ6XSit2rI0inHtCIqsH54fMcIvVVIfK8hzsSrUe3efxSAkA9SR9J9H8CESJ
 dmbTK81c4ztkZnb/03W9c1v9DEkxRAYH5helMAfeTVjQ180OfE+BlUGUirJ1FcwXu3dU
 eDdPaMzFEwvsqGwlPQ9kgQQ2/hr58MSke8vgFnoWpHit0pZNRWiiGT6w94ojJgkTNQ28
 aFTblOyLHUbWW3z+xY/5/k5J07WrW89CQxQ2gXwJc1P64Ynf2A+2+Ro11vD/Y89ZQXdu
 yoqKw4z9yzNx7B6N0eWAKyJaC/l7Xm353pYs8B6Hj4XXtQnfG0fKuTf8LZteG9+5I7yZ
 XLxA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20221208; t=1692598854; x=1693203654;
 h=content-transfer-encoding:mime-version:message-id:date:subject:cc
 :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
 :reply-to;
 bh=CA7RRYLtUdje8FIoLFbRrPpcXjegZHP09hi7r4raqgw=;
 b=GnlUup0AssTyfU+Pn61vlebatL4IcOs9DqWCynsRcFPuMng6+makuWlaerjQErzf3F
 5k7K9SoXaAcDxYBXwt+lqgXCcJvrz3xuEN4fed1YYlZnAbYA6pm4GSyAEKW0O4YxGHhJ
 txqXCAiklGSOF7fZPBjS4PQ/0ea5lDdg4Co2g19l5greFTqA4LpRJtlTAjtJj/uh7I3A
 T+LH+T+85gT8CLQnyAY5IQx7udRWXyAGKTFLyZapUXBYotAaQgJLdQRkgiHkLi6ac/+B
 Bpl7EiSXRUnZA9fK5A2VTJJK1/iXqQ/m3bxGJFpX/iP7ta0NJaBjK0LQGrgJEd6qK7iT
 ncrg==
X-Gm-Message-State: AOJu0YwRHRckFoF+IJ7rZ+iFvq8d4DkmCjPQsL2t7jQDwx0yTqS9JDPx
 YDlrPHZysSGPmJkUjK6jiqRcf8JX1zMTcTSw
X-Google-Smtp-Source: AGHT+IEf+VIm7/xELObtlCq+jIDH6ND1QfCG3bMTLFH58g5apjgxNfc5VmBsyORlfTBPPYkVcabkJw==
X-Received: by 2002:a05:6870:d1c6:b0:1c6:ac86:d59 with SMTP id
 b6-20020a056870d1c600b001c6ac860d59mr6701486oac.2.1692598854300; 
 Sun, 20 Aug 2023 23:20:54 -0700 (PDT)
Received: from localhost (zz20184013906F627101.userreverse.dion.ne.jp.
 [111.98.113.1]) by smtp.gmail.com with ESMTPSA id
 m6-20020a17090a414600b002633fa95ac2sm7146485pjg.13.2023.08.20.23.20.53
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Sun, 20 Aug 2023 23:20:53 -0700 (PDT)
From: Tatsuyuki Ishi <ishitatsuyuki@gmail.com>
To: dri-devel@lists.freedesktop.org,
	amd-gfx@lists.freedesktop.org
Subject: [PATCH v2 0/4] amdgpu: Allow explicitly synchronized submissions.
Date: Mon, 21 Aug 2023 15:20:01 +0900
Message-ID: <20230821062005.109771-1-ishitatsuyuki@gmail.com>
X-Mailer: git-send-email 2.41.0
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

This adds a context option to use DMA_RESV_USAGE_BOOKKEEP for userspace
submissions. This is a respin of [1] but rebased on top of the newly
introduced drm_exec helpers.

Disabling implicit sync is something we've wanted in RADV for a while
for resolving some corner cases. A more immediate thing that would be
solved here is avoiding a bunch of implicit sync on GPU map/unmap
operations as well, which helps with stutter around sparse maps/unmaps.

This has seen a significant improvement in stutter in Forza Horizon 5
and Forza Horizon 4. (As games that had significant issues in sparse
binding related stutter). I've been able to pass a full Vulkan CTS run
on Navi 10 with this.

(Note that the drm_exec patchset has introduced new CTS failures with
duplicate BOs, but we will be tracking that separately.)

Userspace code for this is available at [2] and a branch for the kernel
code is available at [3].

[1]: https://patchwork.freedesktop.org/series/107233/
[2]: https://gitlab.freedesktop.org/ishitatsuyuki/mesa/-/commits/single-sparse-queue-explicit-rebase
[3]: https://github.com/ishitatsuyuki/linux/tree/explicit-sync-drm-misc-next

Bas Nieuwenhuizen (4):
  drm/amdgpu: Add separate mode for syncing DMA_RESV_USAGE_BOOKKEEP.
  drm/amdgpu: Allow explicit sync for VM ops.
  drm/amdgpu: Add option to disable implicit sync for a context.
  drm/amdgpu: Bump amdgpu driver version.

 .../gpu/drm/amd/amdgpu/amdgpu_amdkfd_gpuvm.c  |  2 +-
 drivers/gpu/drm/amd/amdgpu/amdgpu_cs.c        | 18 +++++++----
 drivers/gpu/drm/amd/amdgpu/amdgpu_ctx.c       | 30 +++++++++++++++++++
 drivers/gpu/drm/amd/amdgpu/amdgpu_ctx.h       |  1 +
 drivers/gpu/drm/amd/amdgpu/amdgpu_drv.c       |  3 +-
 drivers/gpu/drm/amd/amdgpu/amdgpu_object.c    | 11 ++++---
 drivers/gpu/drm/amd/amdgpu/amdgpu_object.h    |  3 +-
 drivers/gpu/drm/amd/amdgpu/amdgpu_sync.c      | 11 +++++--
 drivers/gpu/drm/amd/amdgpu/amdgpu_sync.h      |  4 +--
 drivers/gpu/drm/amd/amdgpu/amdgpu_vm_cpu.c    |  3 +-
 drivers/gpu/drm/amd/amdgpu/amdgpu_vm_sdma.c   |  3 +-
 include/uapi/drm/amdgpu_drm.h                 |  4 +++
 12 files changed, 74 insertions(+), 19 deletions(-)

-- 
2.41.0

