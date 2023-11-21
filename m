Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 7FFF47F224D
	for <lists+dri-devel@lfdr.de>; Tue, 21 Nov 2023 01:40:15 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 5350F10E15E;
	Tue, 21 Nov 2023 00:40:06 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-pl1-x630.google.com (mail-pl1-x630.google.com
 [IPv6:2607:f8b0:4864:20::630])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 0CA0E10E00B;
 Tue, 21 Nov 2023 00:40:03 +0000 (UTC)
Received: by mail-pl1-x630.google.com with SMTP id
 d9443c01a7336-1ce3084c2d1so42367565ad.3; 
 Mon, 20 Nov 2023 16:40:03 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20230601; t=1700527203; x=1701132003; darn=lists.freedesktop.org;
 h=content-transfer-encoding:mime-version:message-id:date:subject:cc
 :to:from:from:to:cc:subject:date:message-id:reply-to;
 bh=bWNEMhZS/K0TJv2uoFh3uKzFoySYNwsIpa4bcavYV+M=;
 b=UNIMvzUXuR88ShzjHhxLwBPY0k3sB/U/qIBadD+f3ycteOl+Itl7oqWznB894V07Tr
 Yla2SqW4BHVx/TnbMt/ayVYMtoST1SfgrvdRzjzZDAM+9yHm9SAMn5TONN9ouoh0hY6I
 9CDC9Zyp8O3DLrQdn5V8wwVdl3GaeTpjdbwLSF0aeoQI4xW7WuWmpaLyY2eALcTWrxxf
 XOUHdAHhNbY0iz6XDyeBhFFIuYuvn6eYxJwB4GniNkQ/drv9zjnmuv42UbyX8U8JMEX8
 7Kb+tNpMQ431p08tNHRQMLvCJmASGkIH2jGAV5PgakO5dxc7DX8culphs+91TY6JVzvz
 +43Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1700527203; x=1701132003;
 h=content-transfer-encoding:mime-version:message-id:date:subject:cc
 :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
 :reply-to;
 bh=bWNEMhZS/K0TJv2uoFh3uKzFoySYNwsIpa4bcavYV+M=;
 b=kzMuZotExaQ+qdaiIxAfYh6A1IXq/WmJou0tqabrMSFtuzxPS2P0tR6TXgEE4YgJBx
 Ekybtzw5laHByB7MCj/fewFop0brCM79cickj/Zh0p7c3KfrgbOF2puXkN0EA1PBqNd8
 H/k3YpJD4SovtUmzz3FTb2S+3ormoFEZq4uWE02DQy9NTbAD5EJs1dEyByT0KUFa/l5f
 ySfJODzSn7h6fonhrnv9ewh8nMTwwrJu2YYK4/hr96ncXeacaD7KlzZJBwkJ8OUYfkSu
 b24lqSWbrk7PXOHb1Y36Yx7fRaB685exEPJu+CNOF7Igm9SsGNnq+/U+x3rtJt5bJq/B
 IjUg==
X-Gm-Message-State: AOJu0YygpVR/nkE9W+8tktFu7h+V00l9p1QXXX1Pgj5cweVlyI/VuERt
 SCLjrflgJmDagsAAQPHm0ta5n3xbP3A=
X-Google-Smtp-Source: AGHT+IFXhiAAFyErJlqOO1DTQVYb7f74uon84kYLMLdTjeTRCnwI6JR3VAOwwCqryfnQrGSMB9oxFQ==
X-Received: by 2002:a17:902:eccd:b0:1cf:54e1:8c8c with SMTP id
 a13-20020a170902eccd00b001cf54e18c8cmr9016957plh.63.1700527202832; 
 Mon, 20 Nov 2023 16:40:02 -0800 (PST)
Received: from localhost ([47.215.232.245]) by smtp.gmail.com with ESMTPSA id
 g3-20020a170902868300b001cc436e9806sm6636258plo.81.2023.11.20.16.40.01
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Mon, 20 Nov 2023 16:40:02 -0800 (PST)
From: Rob Clark <robdclark@gmail.com>
To: dri-devel@lists.freedesktop.org
Subject: [PATCH v2 0/7] drm/msm/gem: drm_exec conversion
Date: Mon, 20 Nov 2023 16:38:44 -0800
Message-ID: <20231121003935.5868-1-robdclark@gmail.com>
X-Mailer: git-send-email 2.42.0
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
Cc: Philip Yang <Philip.Yang@amd.com>,
 "open list:DRM DRIVER FOR NVIDIA GEFORCE/QUADRO GPUS"
 <nouveau@lists.freedesktop.org>, Lijo Lazar <lijo.lazar@amd.com>,
 Mario Limonciello <mario.limonciello@amd.com>,
 Marijn Suijten <marijn.suijten@somainline.org>,
 Arthur Grillo <arthurgrillo@riseup.net>,
 "Rafael J. Wysocki" <rafael@kernel.org>, Rob Clark <robdclark@chromium.org>,
 Guchun Chen <guchun.chen@amd.com>, Shashank Sharma <shashank.sharma@amd.com>,
 Suren Baghdasaryan <surenb@google.com>,
 "open list:POWER MANAGEMENT CORE" <linux-pm@vger.kernel.org>,
 "open list:AMD KFD" <amd-gfx@lists.freedesktop.org>,
 Danilo Krummrich <dakr@redhat.com>,
 Veerabadhran Gopalakrishnan <Veerabadhran.Gopalakrishnan@amd.com>,
 freedreno@lists.freedesktop.org,
 Srinivasan Shanmugam <srinivasan.shanmugam@amd.com>,
 Arunpravin Paneer Selvam <Arunpravin.PaneerSelvam@amd.com>,
 linux-arm-msm@vger.kernel.org, Sean Paul <sean@poorly.run>,
 Jack Xiao <Jack.Xiao@amd.com>, Jonathan Kim <jonathan.kim@amd.com>,
 Tvrtko Ursulin <tvrtko.ursulin@intel.com>, Lang Yu <Lang.Yu@amd.com>,
 Felix Kuehling <Felix.Kuehling@amd.com>,
 open list <linux-kernel@vger.kernel.org>,
 Boris Brezillon <boris.brezillon@collabora.com>,
 Alex Deucher <alexander.deucher@amd.com>, Leo Liu <leo.liu@amd.com>,
 =?UTF-8?q?Christian=20K=C3=B6nig?= <christian.koenig@amd.com>
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

From: Rob Clark <robdclark@chromium.org>

Simplify the exec path (removing a legacy optimization) and convert to
drm_exec.  One drm_exec patch to allow passing in the expected # of GEM
objects to avoid re-allocation.

I'd be a bit happier if I could avoid the extra objects table allocation
in drm_exec in the first place, but wasn't really happy with any of the
things I tried to get rid of that.

v2: updates in 6/7 and other nit-addressing

Rob Clark (7):
  drm/msm/gem: Remove "valid" tracking
  drm/msm/gem: Remove submit_unlock_unpin_bo()
  drm/msm/gem: Don't queue job to sched in error cases
  drm/msm/gem: Split out submit_unpin_objects() helper
  drm/msm/gem: Cleanup submit_cleanup_bo()
  drm/exec: Pass in initial # of objects
  drm/msm/gem: Convert to drm_exec

 .../gpu/drm/amd/amdgpu/amdgpu_amdkfd_gpuvm.c  |   8 +-
 drivers/gpu/drm/amd/amdgpu/amdgpu_cs.c        |   2 +-
 drivers/gpu/drm/amd/amdgpu/amdgpu_csa.c       |   4 +-
 drivers/gpu/drm/amd/amdgpu/amdgpu_gem.c       |   4 +-
 drivers/gpu/drm/amd/amdgpu/amdgpu_mes.c       |   4 +-
 drivers/gpu/drm/amd/amdgpu/amdgpu_umsch_mm.c  |   4 +-
 drivers/gpu/drm/amd/amdkfd/kfd_svm.c          |   2 +-
 drivers/gpu/drm/drm_exec.c                    |  13 +-
 drivers/gpu/drm/msm/Kconfig                   |   1 +
 drivers/gpu/drm/msm/msm_gem.h                 |  13 +-
 drivers/gpu/drm/msm/msm_gem_submit.c          | 199 +++++-------------
 drivers/gpu/drm/msm/msm_ringbuffer.c          |   3 +-
 drivers/gpu/drm/nouveau/nouveau_exec.c        |   2 +-
 drivers/gpu/drm/nouveau/nouveau_uvmm.c        |   2 +-
 drivers/gpu/drm/tests/drm_exec_test.c         |  16 +-
 include/drm/drm_exec.h                        |   2 +-
 16 files changed, 92 insertions(+), 187 deletions(-)

-- 
2.42.0

