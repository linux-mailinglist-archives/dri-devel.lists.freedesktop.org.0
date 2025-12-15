Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 53BFFCBD860
	for <lists+dri-devel@lfdr.de>; Mon, 15 Dec 2025 12:39:14 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 9D0AF10E43B;
	Mon, 15 Dec 2025 11:39:11 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=gmail.com header.i=@gmail.com header.b="M7ui1V+K";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-pj1-f45.google.com (mail-pj1-f45.google.com
 [209.85.216.45])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 7EBE510E439
 for <dri-devel@lists.freedesktop.org>; Mon, 15 Dec 2025 11:39:10 +0000 (UTC)
Received: by mail-pj1-f45.google.com with SMTP id
 98e67ed59e1d1-34c5f0222b0so1005417a91.3
 for <dri-devel@lists.freedesktop.org>; Mon, 15 Dec 2025 03:39:10 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20230601; t=1765798750; x=1766403550; darn=lists.freedesktop.org;
 h=content-transfer-encoding:mime-version:message-id:date:subject:cc
 :to:from:from:to:cc:subject:date:message-id:reply-to;
 bh=rTcY4k7PJNNctnILuEp0lcvqj1X2scOTc/Z894ZNYfE=;
 b=M7ui1V+KnFYkCty0HqvgJjWXri7Fd9oWctq9tEzWkUb3SeyjcXQEZg9sV5lPbVESag
 /NloN8Va6SLYSc7b4q+hwQKCjkXs6pjdx8jyTzNAuNQgWJlY4IHJNoNch4ep1rPbmEFc
 W0cNvKfNVqXwNck26b9hQskfJy++E+JiDtG9Bp6zUES96hCubU00OBJ/LnkoKIdA4odg
 NKxXRIK/BIJtH+mtKz5cpUe+qf9tjs9o8i1ZB3pmTZPdeanM0g9mWlrymtAWTFwUbL1I
 g9Non7Y8+AUNi2vaxfhuLSGaiLgRcjCYw9lHFuLOBOcOnqwwEvvbjMfFjuC1/tEZGeQq
 XW7A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1765798750; x=1766403550;
 h=content-transfer-encoding:mime-version:message-id:date:subject:cc
 :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
 :message-id:reply-to;
 bh=rTcY4k7PJNNctnILuEp0lcvqj1X2scOTc/Z894ZNYfE=;
 b=osW3MVHTk4IkKmGt1cl+Fk3V+rFrrCgah8ojTqm/Kz8a/zZ5KraVmPZ3CvmM7rLnf4
 qmQ34QejnIjrZtjbzaJ2os6iRDEw3YBTxsZ5PDG0YXtMJ8CcArTlozL3A1PWreH6xbsh
 u4wts2IQLGE86qXeo1eWc+viyvZ8/3KF4MFnkkISiSWi00GOnNegzIFg7GXDQdUi35CT
 81f6RHUf3g5jGreV3yTqn6W55bKaLiuncGyy8FgvL+j1qgK7/xqdUkqq32hwwzcFn9Dg
 ppxaJlk57VC1+Alg2q2p5LWdQgxg2p65CRvJlw7zmcdTTL7pbcijR3ZHiVqSWogcY1mw
 TH4w==
X-Forwarded-Encrypted: i=1;
 AJvYcCVLVNdzfBKAnEDFhQAFTX+iTFyZkLFrYYGYpEu1S17/5ujily1PvEDpvTJXF+el5ChASJKOmGiGDas=@lists.freedesktop.org
X-Gm-Message-State: AOJu0Yyl7AMcipQfhnlAGnRZvp0T2I9ek1H4+dIhMzvflaCjisYDgVLF
 UKBlyliIMFEzt8Gx5P/vlJZ86zzA6x38vD161YB29HLDnromhow19O84
X-Gm-Gg: AY/fxX63WmmRBmw4i51XzA44rUmP1IX819BSyqU+wfYwAYyMh7MEQghzRXAiRyaddUn
 pTR+gZHY7ZDSaJJ+cpVnpJc9XSheeWsOqVqdW9He81jVOukq3dWNENQ5NEKhz/krnl34P+MhAxX
 LYPvVWgMq2hwwdXX5LeiZm+wZ/1tvn6wrmIuPfTaJjbhkwYFuf8uil8g8MHnbBfZPBUqM+OTgKV
 Nlhir1zyfaC685CIJ3BBZiJniN0Jv88JSjjBpPXCUk4UZ5WKPdpuWzCr3UBy0sNF4EYh0JTo70r
 E9bTFjUZrFOXrqg0YYkNGAMa2/vGxEC4ikRf/VEQeffpGBeLmrnKqzOgUE09cBtkIE/nIsu5Bq5
 7V0QH8I7a0yJI0aR42lkc5gS0VIld5eViTTxcox/URiqiyOtC3AZaUwmzVFSt9eneHrUdkLs0tC
 EQjsa+990P6I5H1LWUkkIimw==
X-Google-Smtp-Source: AGHT+IH7Y0ZP0SVYlRqXrzHx+fOVv/+/V5Bjimjq/e2I+okG90jQDlqbjW8VY0Em0JiciGGZ262G7g==
X-Received: by 2002:a17:902:c402:b0:295:c2e7:7199 with SMTP id
 d9443c01a7336-29f23c7b8b9mr114062105ad.29.1765798749863; 
 Mon, 15 Dec 2025 03:39:09 -0800 (PST)
Received: from archie.me ([210.87.74.117]) by smtp.gmail.com with ESMTPSA id
 d9443c01a7336-29ee9b3850csm133386495ad.17.2025.12.15.03.39.07
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Mon, 15 Dec 2025 03:39:08 -0800 (PST)
Received: by archie.me (Postfix, from userid 1000)
 id AC75C444B38F; Mon, 15 Dec 2025 18:39:05 +0700 (WIB)
From: Bagas Sanjaya <bagasdotme@gmail.com>
To: Linux Kernel Mailing List <linux-kernel@vger.kernel.org>,
 Linux AMDGPU <amd-gfx@lists.freedesktop.org>,
 Linux DRI Development <dri-devel@lists.freedesktop.org>,
 Linux Filesystems Development <linux-fsdevel@vger.kernel.org>,
 Linux Media <linux-media@vger.kernel.org>, linaro-mm-sig@lists.linaro.org,
 kasan-dev@googlegroups.com,
 Linux Virtualization <virtualization@lists.linux.dev>,
 Linux Memory Management List <linux-mm@kvack.org>,
 Linux Network Bridge <bridge@lists.linux.dev>,
 Linux Networking <netdev@vger.kernel.org>
Cc: Harry Wentland <harry.wentland@amd.com>, Leo Li <sunpeng.li@amd.com>,
 Rodrigo Siqueira <siqueira@igalia.com>,
 Alex Deucher <alexander.deucher@amd.com>,
 =?UTF-8?q?Christian=20K=C3=B6nig?= <christian.koenig@amd.com>,
 David Airlie <airlied@gmail.com>, Simona Vetter <simona@ffwll.ch>,
 Maarten Lankhorst <maarten.lankhorst@linux.intel.com>,
 Maxime Ripard <mripard@kernel.org>,
 Thomas Zimmermann <tzimmermann@suse.de>,
 Matthew Brost <matthew.brost@intel.com>,
 Danilo Krummrich <dakr@kernel.org>, Philipp Stanner <phasta@kernel.org>,
 Alexander Viro <viro@zeniv.linux.org.uk>,
 Christian Brauner <brauner@kernel.org>, Jan Kara <jack@suse.cz>,
 Sumit Semwal <sumit.semwal@linaro.org>,
 Alexander Potapenko <glider@google.com>, Marco Elver <elver@google.com>,
 Dmitry Vyukov <dvyukov@google.com>, "Michael S. Tsirkin" <mst@redhat.com>,
 Jason Wang <jasowang@redhat.com>, Xuan Zhuo <xuanzhuo@linux.alibaba.com>,
 =?UTF-8?q?Eugenio=20P=C3=A9rez?= <eperezma@redhat.com>,
 Andrew Morton <akpm@linux-foundation.org>,
 Uladzislau Rezki <urezki@gmail.com>,
 Nikolay Aleksandrov <razor@blackwall.org>,
 Ido Schimmel <idosch@nvidia.com>, "David S. Miller" <davem@davemloft.net>,
 Eric Dumazet <edumazet@google.com>, Jakub Kicinski <kuba@kernel.org>,
 Paolo Abeni <pabeni@redhat.com>, Simon Horman <horms@kernel.org>,
 Taimur Hassan <Syed.Hassan@amd.com>, Wayne Lin <Wayne.Lin@amd.com>,
 Alex Hung <alex.hung@amd.com>, Aurabindo Pillai <aurabindo.pillai@amd.com>,
 Dillon Varone <Dillon.Varone@amd.com>, George Shen <george.shen@amd.com>,
 Aric Cyr <aric.cyr@amd.com>, Cruise Hung <Cruise.Hung@amd.com>,
 Mario Limonciello <mario.limonciello@amd.com>,
 Sunil Khatri <sunil.khatri@amd.com>,
 Dominik Kaszewski <dominik.kaszewski@amd.com>,
 Bagas Sanjaya <bagasdotme@gmail.com>, David Hildenbrand <david@kernel.org>,
 Peter Zijlstra <peterz@infradead.org>,
 Lorenzo Stoakes <lorenzo.stoakes@oracle.com>,
 Max Kellermann <max.kellermann@ionos.com>,
 "Nysal Jan K.A." <nysal@linux.ibm.com>,
 Ryan Roberts <ryan.roberts@arm.com>,
 Alexey Skidanov <alexey.skidanov@intel.com>,
 Vlastimil Babka <vbabka@suse.cz>,
 Kent Overstreet <kent.overstreet@linux.dev>,
 Vitaly Wool <vitaly.wool@konsulko.se>, Harry Yoo <harry.yoo@oracle.com>,
 Mateusz Guzik <mjguzik@gmail.com>, NeilBrown <neil@brown.name>,
 Amir Goldstein <amir73il@gmail.com>, Jeff Layton <jlayton@kernel.org>,
 Ivan Lipski <ivan.lipski@amd.com>, Tao Zhou <tao.zhou1@amd.com>,
 YiPeng Chai <YiPeng.Chai@amd.com>, Hawking Zhang <Hawking.Zhang@amd.com>,
 Lyude Paul <lyude@redhat.com>,
 Daniel Almeida <daniel.almeida@collabora.com>,
 Luben Tuikov <luben.tuikov@amd.com>, Matthew Auld <matthew.auld@intel.com>,
 Roopa Prabhu <roopa@cumulusnetworks.com>, Mao Zhu <zhumao001@208suo.com>,
 Shaomin Deng <dengshaomin@cdjrlc.com>,
 Charles Han <hanchunchao@inspur.com>, Jilin Yuan <yuanjilin@cdjrlc.com>,
 Swaraj Gaikwad <swarajgaikwad1925@gmail.com>,
 George Anthony Vernon <contact@gvernon.com>
Subject: [PATCH 00/14] Assorted kernel-doc fixes
Date: Mon, 15 Dec 2025 18:38:48 +0700
Message-ID: <20251215113903.46555-1-bagasdotme@gmail.com>
X-Mailer: git-send-email 2.52.0
MIME-Version: 1.0
X-Developer-Signature: v=1; a=openpgp-sha256; l=2064; i=bagasdotme@gmail.com;
 h=from:subject; bh=zPsruu4atyDYOaQCsKIEqnFkDKfYqb53HHp2txNqt3A=;
 b=owGbwMvMwCX2bWenZ2ig32LG02pJDJn2n4MMm/867RRu9s/LeXucS+TRacFsjy3x8goRK//G7
 Jyfu8O1o5SFQYyLQVZMkWVSIl/T6V1GIhfa1zrCzGFlAhnCwMUpABOJ+cjwP9rl0j2O1i3mgnEF
 j0tV/6z5nLTvdKmsJY/NvB286XtLTzEy7D+8+dTHe63Sb6bPXnHWT1NH5vPMzba75Xe45yw3OaR
 ZzAUA
X-Developer-Key: i=bagasdotme@gmail.com; a=openpgp;
 fpr=701B806FDCA5D3A58FFB8F7D7C276C64A5E44A1D
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
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

Hi,

Here are assorted kernel-doc fixes for 6.19 cycle. As the name
implies, for the merging strategy, the patches can be taken by
respective maintainers to appropriate fixes branches (targetting
6.19 of course) (e.g. for mm it will be mm-hotfixes).

Enjoy!

Bagas Sanjaya (14):
  genalloc: Describe @start_addr parameter in genpool_algo_t
  mm: Describe @flags parameter in memalloc_flags_save()
  textsearch: Describe @list member in ts_ops search
  mm: vmalloc: Fix up vrealloc_node_align() kernel-doc macro name
  mm, kfence: Describe @slab parameter in __kfence_obj_info()
  virtio: Describe @map and @vmap members in virtio_device struct
  fs: Describe @isnew parameter in ilookup5_nowait()
  VFS: fix __start_dirop() kernel-doc warnings
  drm/amd/display: Don't use kernel-doc comment in
    dc_register_software_state struct
  drm/amdgpu: Describe @AMD_IP_BLOCK_TYPE_RAS in amd_ip_block_type enum
  drm/gem/shmem: Describe @shmem and @size parameters
  drm/scheduler: Describe @result in drm_sched_job_done()
  drm/gpusvm: Fix drm_gpusvm_pages_valid_unlocked() kernel-doc comment
  net: bridge: Describe @tunnel_hash member in net_bridge_vlan_group
    struct

 drivers/gpu/drm/amd/display/dc/dc.h      | 2 +-
 drivers/gpu/drm/amd/include/amd_shared.h | 1 +
 drivers/gpu/drm/drm_gem_shmem_helper.c   | 3 ++-
 drivers/gpu/drm/drm_gpusvm.c             | 4 ++--
 drivers/gpu/drm/scheduler/sched_main.c   | 1 +
 fs/inode.c                               | 1 +
 fs/namei.c                               | 3 ++-
 include/linux/genalloc.h                 | 1 +
 include/linux/kfence.h                   | 1 +
 include/linux/sched/mm.h                 | 1 +
 include/linux/textsearch.h               | 1 +
 include/linux/virtio.h                   | 2 ++
 mm/vmalloc.c                             | 2 +-
 net/bridge/br_private.h                  | 1 +
 14 files changed, 18 insertions(+), 6 deletions(-)


base-commit: 8f0b4cce4481fb22653697cced8d0d04027cb1e8
-- 
An old man doll... just what I always wanted! - Clara

