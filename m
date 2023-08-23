Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 7DDE57862C8
	for <lists+dri-devel@lfdr.de>; Wed, 23 Aug 2023 23:56:17 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 9CB9610E0FF;
	Wed, 23 Aug 2023 21:56:11 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-pf1-x433.google.com (mail-pf1-x433.google.com
 [IPv6:2607:f8b0:4864:20::433])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 12A0D10E0FF;
 Wed, 23 Aug 2023 21:56:09 +0000 (UTC)
Received: by mail-pf1-x433.google.com with SMTP id
 d2e1a72fcca58-68bec4c6b22so286935b3a.2; 
 Wed, 23 Aug 2023 14:56:09 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20221208; t=1692827768; x=1693432568;
 h=content-transfer-encoding:mime-version:message-id:date:subject:cc
 :to:from:from:to:cc:subject:date:message-id:reply-to;
 bh=Vdlec6OkejfhXyJVQ4nqDZbY7wcrBeVjlgnKnIanHMs=;
 b=kTrSNZkIv3S6HbAZmwUpDq7mTW1gjmThol4blUtqcsMvzPx0S/pJ7soK/oGl92KvpY
 4X33Ws9xLe38VOupkqRWlWuEwdsLR9Dky7xF5eRyKy1qBC2G9H9JiodmWPrhY0yQpBIS
 XOaw8+ecfPdj/Kv4ZDrcPwuR3GI0e2avV5PG6h1ulR5xHi1df85LaxVouQUD34mKVEwL
 xGbNp9gh1+nMiuyIRV2QcveoPn217J2c6QhkjguHASMZW9XYQXEw/Zf9C1Sdm4B+wwu4
 /QFs6azeoTmS+7ABoTs8p+HTad9XeWKQCyM5BYwf3syPHBaFEcPsQ7ABg8J4MCkiJoNC
 PPUw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20221208; t=1692827768; x=1693432568;
 h=content-transfer-encoding:mime-version:message-id:date:subject:cc
 :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
 :reply-to;
 bh=Vdlec6OkejfhXyJVQ4nqDZbY7wcrBeVjlgnKnIanHMs=;
 b=IYIb7vavIMXwCpKcShzha9/tsKh8QRGcK41SM2jlegsaY/I5pKr82C0H1CCGKEttVF
 13sCSPEUYYRE9NOU1PleaV0kFRdWZoLJVkVqNOGTolY75VLVeKD70XpT7KpIki3YarSK
 fxhmwcyVpMMR79ymSD72m3kECe9A/ROCb3ndAEwWd7ROh1Ct2G4PXBbDVLwUEMpg0dyR
 EuTMdhACQ+SlZPMF+Xyj9ICotXSRI9J/yXOVZsak3898v3blRGdyTf8H39O7/vyKqFZI
 yzhZS7+yikh7Tk/TlwYUeSD3JrzEUdc377qBowwTAOqlMfp0aKfh+viFGBqtrHQb2JiT
 xAZw==
X-Gm-Message-State: AOJu0YybF7js5JWIy4ERBllmAI0P528gARHBGZ740TVMiG9+46HyzQhI
 emx3wKAL+Vh0EuAkiHdiKqxPg+I0IEc=
X-Google-Smtp-Source: AGHT+IEkOWgvIsdyH4PYVN5etCF6RxN2hmwSfnLjmmcb5cZA9Oqzmyj1dnnsM/qqF7ZbaX1M8jzYgQ==
X-Received: by 2002:a05:6a20:7da9:b0:133:5f6a:fb6 with SMTP id
 v41-20020a056a207da900b001335f6a0fb6mr17085737pzj.1.1692827767845; 
 Wed, 23 Aug 2023 14:56:07 -0700 (PDT)
Received: from localhost ([2a00:79e1:abd:4a00:6c80:7c10:75a0:44f4])
 by smtp.gmail.com with ESMTPSA id
 a21-20020aa780d5000000b00689f10adef9sm9968803pfn.67.2023.08.23.14.56.06
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Wed, 23 Aug 2023 14:56:07 -0700 (PDT)
From: Rob Clark <robdclark@gmail.com>
To: dri-devel@lists.freedesktop.org
Subject: [PATCH v9 0/3] dma-fence: Deadline awareness (uabi edition)
Date: Wed, 23 Aug 2023 14:54:53 -0700
Message-ID: <20230823215458.203366-1-robdclark@gmail.com>
X-Mailer: git-send-email 2.41.0
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
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
Cc: Rob Clark <robdclark@chromium.org>,
 "open list:POWER MANAGEMENT CORE" <linux-pm@vger.kernel.org>,
 Gustavo Padovan <gustavo@padovan.org>, "Rafael J. Wysocki" <rafael@kernel.org>,
 Xaver Hugl <xaver.hugl@gmail.com>, open list <linux-kernel@vger.kernel.org>,
 "moderated list:DMA BUFFER SHARING FRAMEWORK" <linaro-mm-sig@lists.linaro.org>,
 freedreno@lists.freedesktop.org,
 "open list:SYNC FILE FRAMEWORK" <linux-media@vger.kernel.org>
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

From: Rob Clark <robdclark@chromium.org>

This is a re-post of the remaining patches from:
https://patchwork.freedesktop.org/series/114490/

Part of the hold-up of the remaining uabi patches was compositor
support, but now an MR for kwin exists:

  https://invent.kde.org/plasma/kwin/-/merge_requests/4358

The syncobj userspace is:

  https://gitlab.freedesktop.org/mesa/mesa/-/merge_requests/21973

v1: https://patchwork.freedesktop.org/series/93035/
v2: Move filtering out of later deadlines to fence implementation
    to avoid increasing the size of dma_fence
v3: Add support in fence-array and fence-chain; Add some uabi to
    support igt tests and userspace compositors.
v4: Rebase, address various comments, and add syncobj deadline
    support, and sync_file EPOLLPRI based on experience with perf/
    freq issues with clvk compute workloads on i915 (anv)
v5: Clarify that this is a hint as opposed to a more hard deadline
    guarantee, switch to using u64 ns values in UABI (still absolute
    CLOCK_MONOTONIC values), drop syncobj related cap and driver
    feature flag in favor of allowing count_handles==0 for probing
    kernel support.
v6: Re-work vblank helper to calculate time of _start_ of vblank,
    and work correctly if the last vblank event was more than a
    frame ago.  Add (mostly unrelated) drm/msm patch which also
    uses the vblank helper.  Use dma_fence_chain_contained().  More
    verbose syncobj UABI comments.  Drop DMA_FENCE_FLAG_HAS_DEADLINE_BIT.
v7: Fix kbuild complaints about vblank helper.  Add more docs.
v8: Add patch to surface sync_file UAPI, and more docs updates.
v9: Repost the remaining patches that expose new uabi to userspace.

Rob Clark (3):
  drm/syncobj: Add deadline support for syncobj waits
  dma-buf/sync_file: Add SET_DEADLINE ioctl
  dma-buf/sw_sync: Add fence deadline support

 drivers/dma-buf/dma-fence.c    |  3 +-
 drivers/dma-buf/sw_sync.c      | 82 ++++++++++++++++++++++++++++++++++
 drivers/dma-buf/sync_debug.h   |  2 +
 drivers/dma-buf/sync_file.c    | 19 ++++++++
 drivers/gpu/drm/drm_syncobj.c  | 64 ++++++++++++++++++++------
 include/uapi/drm/drm.h         | 17 +++++++
 include/uapi/linux/sync_file.h | 22 +++++++++
 7 files changed, 195 insertions(+), 14 deletions(-)

-- 
2.41.0

