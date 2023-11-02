Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 524907DF488
	for <lists+dri-devel@lfdr.de>; Thu,  2 Nov 2023 15:05:23 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 57E4010E0BC;
	Thu,  2 Nov 2023 14:05:19 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-pl1-x633.google.com (mail-pl1-x633.google.com
 [IPv6:2607:f8b0:4864:20::633])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 64C8310E0A7;
 Thu,  2 Nov 2023 14:05:16 +0000 (UTC)
Received: by mail-pl1-x633.google.com with SMTP id
 d9443c01a7336-1cc41afd376so1621355ad.1; 
 Thu, 02 Nov 2023 07:05:16 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20230601; t=1698933915; x=1699538715; darn=lists.freedesktop.org;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:from:to:cc:subject:date
 :message-id:reply-to;
 bh=RkSIQXNEC4/9tpRxpOPIKWZkKzdEqVJkUDATCSHRoBk=;
 b=Sy/NTWyFNCzQ2YSOlc4k7zzkeFoRS6BwhFio8/rwsV2OPdfAatSMLh9NqK38IkLv4K
 YxTQbtT4zfEN4ODuecLS3nHtXTyH4aPPzcnGzhqH2tV85xSZYK4G1r58F1dC2XWquplg
 xvA7SGOxWq/ySy6jS72W8p9WE+gf7pXKd9bQLSYZPQoOXyYw1tnqoUomulbljjAoyGOD
 fOH3uK7ilCtOxY8+AXejGfIM+iPM/aDO/5MIfr7tZK2Jld2NqpCLtd1Bq8IWfNdSnDHr
 1AdrPX1+7KS7WCCeML0xzwUeonE6LpJ/ut0IaBzrFo9qx4CQv9vjvxoGVAI3YDGbTKut
 Bw9A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1698933915; x=1699538715;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=RkSIQXNEC4/9tpRxpOPIKWZkKzdEqVJkUDATCSHRoBk=;
 b=p2bH16zpGr7ioRDH7KL0KUdKyYybb9n1Hup3hEyBPNfv1TnKo0tnrNFy1io3FvVO4X
 yW9ts+oZTvsmB9nm3ngClLXmud9S4capAoZ8WSPxd2xoAM235lRHmsAg4tAXE0ma3E4b
 RLWXa1TmeAro2F3adwz6eOPORXhP2iXGm8gf+zKM7cYDnAs7RQjFqpzGxUqWDQ3WKUIj
 RSS9UE4H993/gean8XfMkjF+qE8/8pXZHL8BdVvn3xtEao+fvMgavKqHQT/a2UAGz6gW
 8gBySXS5BRKic1YK8SqPDz8y4VXA24LogN4scYcOQutWIxYJEha42x2rhqxxOnHMHwhx
 2Iug==
X-Gm-Message-State: AOJu0YwHlEyZJ/O75k/4wauuH0spDKcLJSoFA1lPVKHu42j52fgzWQuF
 0t73WPq2ePngTWIAfgeGlgLIr2Hc/erlhcKh
X-Google-Smtp-Source: AGHT+IHqA5YkAAOPSDgRKqAQqvHBobb4BR3BjiiG5RX3+UfWmq1jY4wvOKJhOkvbF7PXMHeidsxiTg==
X-Received: by 2002:a17:903:2784:b0:1cc:2b68:40ec with SMTP id
 jw4-20020a170903278400b001cc2b6840ecmr17550007plb.4.1698933914600; 
 Thu, 02 Nov 2023 07:05:14 -0700 (PDT)
Received: from localhost (zz20184013906F627101.userreverse.dion.ne.jp.
 [111.98.113.1]) by smtp.gmail.com with ESMTPSA id
 b1-20020a170902d30100b001cc131c65besm3157501plc.168.2023.11.02.07.05.13
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Thu, 02 Nov 2023 07:05:13 -0700 (PDT)
From: Tatsuyuki Ishi <ishitatsuyuki@gmail.com>
To: dri-devel@lists.freedesktop.org,
	amd-gfx@lists.freedesktop.org
Subject: [PATCH v2 0/3] drm/amdgpu: Add flag to disable implicit sync for GEM
 operations.
Date: Thu,  2 Nov 2023 23:04:33 +0900
Message-ID: <20231102140436.180989-1-ishitatsuyuki@gmail.com>
X-Mailer: git-send-email 2.42.0
In-Reply-To: <20231031134059.171277-1-ishitatsuyuki@gmail.com>
References: <20231031134059.171277-1-ishitatsuyuki@gmail.com>
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

Compared to the previous series [1], this specifically targets the VM
operations and keep everything else intact, including implicit sync on
kernel-initiated moves.

I've been able to pass a full Vulkan CTS run on Navi 10 with this.

Userspace code for this is available at [2] and a branch for the kernel
code is available at [3].

v2 changes:
- Drop the changes to flush split bindings eagerly as its incompatible
  with TLB flush quirks in current hardware. Drop the refactoring
  commits related to that change too.
- Fixed a missing doc warning.
- Removed an accidentally included ioctl change.

[1]: https://lore.kernel.org/all/20230821062005.109771-1-ishitatsuyuki@gmail.com/
[2]: https://gitlab.freedesktop.org/ishitatsuyuki/mesa/-/commits/vm-explicit-sync
[3]: https://github.com/ishitatsuyuki/linux/tree/explicit-sync-drm-misc-next

Tatsuyuki Ishi (3):
  drm/amdgpu: Don't implicit sync PRT maps.
  drm/amdgpu: Add flag to disable implicit sync for GEM operations.
  drm/amdgpu: Bump amdgpu driver version.

 .../gpu/drm/amd/amdgpu/amdgpu_amdkfd_gpuvm.c  |  2 +-
 drivers/gpu/drm/amd/amdgpu/amdgpu_csa.c       |  2 +-
 drivers/gpu/drm/amd/amdgpu/amdgpu_drv.c       |  3 +-
 drivers/gpu/drm/amd/amdgpu/amdgpu_gem.c       | 14 ++++--
 drivers/gpu/drm/amd/amdgpu/amdgpu_object.h    |  7 ++-
 drivers/gpu/drm/amd/amdgpu/amdgpu_trace.h     |  6 ++-
 drivers/gpu/drm/amd/amdgpu/amdgpu_vm.c        | 47 +++++++++++--------
 drivers/gpu/drm/amd/amdgpu/amdgpu_vm.h        | 23 +++++----
 drivers/gpu/drm/amd/amdkfd/kfd_svm.c          | 18 +++----
 include/uapi/drm/amdgpu_drm.h                 |  2 +
 10 files changed, 73 insertions(+), 51 deletions(-)

-- 
2.42.0

