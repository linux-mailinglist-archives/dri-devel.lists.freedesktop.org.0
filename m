Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 73CC25227DE
	for <lists+dri-devel@lfdr.de>; Wed, 11 May 2022 01:57:02 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id D6A4710E8B8;
	Tue, 10 May 2022 23:56:58 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-yw1-x1149.google.com (mail-yw1-x1149.google.com
 [IPv6:2607:f8b0:4864:20::1149])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 5048310E8B8
 for <dri-devel@lists.freedesktop.org>; Tue, 10 May 2022 23:56:57 +0000 (UTC)
Received: by mail-yw1-x1149.google.com with SMTP id
 00721157ae682-2f7dbceab08so2976617b3.10
 for <dri-devel@lists.freedesktop.org>; Tue, 10 May 2022 16:56:57 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=20210112;
 h=date:message-id:mime-version:subject:from:to:cc
 :content-transfer-encoding;
 bh=8wgwWyWBAO6K1kQcjl7QjLCZGLS4aKj0FBaC6WwhJdI=;
 b=qAYLyisyyXSk7BzH3nmLvQXdJt3d5qR4CpwkUlSCAlxxvdtqzVN1xC/GBhDcXQ+AHX
 bLOvEu+XGuKU/81vlK/f3FLcJ/0slTtnfXChNkgikt5dQIFy5MGBu1PwluanOmrMHu7o
 vb0Xq1aNl917Wu+eUXiInx9Y2/cfGlqvNqwFQCwtsK22jdhOyD5pHpCcpJrIlCLur5cy
 cBoJbiNkMqktkKvNFP8kg/UJY/Kwaa5lGVLiDC0KnZ3rmrPZNN5K0Gn946fuXQOHi9xU
 XmSllLF/cK9feAy13MLeQK4E0M7s/CowRGV4L06o2Ql4CZBs9ImveHZrPy4lgBm0ZkSh
 oZFg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:date:message-id:mime-version:subject:from:to:cc
 :content-transfer-encoding;
 bh=8wgwWyWBAO6K1kQcjl7QjLCZGLS4aKj0FBaC6WwhJdI=;
 b=u5S8Lv5xSTljffTWuUF0k2rZknOllP6GOZfuLgzp4NfBkjt4SP8TDW2YePkVD7j99i
 8bz0aKH12iNbFGZHVAwRskcULgh3rbTz9xZrCnzg0nd9aeLgl1h6V8OD9SqkOhbPgOx9
 AoNMomzv4xJjbxYGI2sKQAKDbdOIBqxitEHoA84UXKkWVlL+jovOe3G9Djlaf4Jd27ZK
 D4hOzRr9Dg4FhO0FOicIazvRBie2vc6jyFZVBGeFOnrIorYZQZ+nJdVQ3w5xw1W0TyNX
 pv2yE0DQpW2d/pKrVnfJrRA1gGp6tbIu3Oh41GWToiQpuPtiofmaJDoVpadKVtg4xwOe
 9NCw==
X-Gm-Message-State: AOAM531VVh8yJcAEv6oRdtCaNHEHmrPyWmBPExU/ZT8ySZlAf+dPDWYM
 iBpsWdKuDVUbFQIfVkoqN2FZJrjboh2EzQE=
X-Google-Smtp-Source: ABdhPJyZR0O/8AupKmR01gHh61HAtkD5xAJaldtC8LToa0+jnj8dKE8fUnC5FYCiGlTORM73cmJPf004bVzHQl0=
X-Received: from tj.c.googlers.com ([fda3:e722:ac3:cc00:20:ed76:c0a8:53a])
 (user=tjmercier job=sendgmr) by 2002:a25:f414:0:b0:624:33e:e486 with SMTP id
 q20-20020a25f414000000b00624033ee486mr20434667ybd.361.1652227016337; Tue, 10
 May 2022 16:56:56 -0700 (PDT)
Date: Tue, 10 May 2022 23:56:44 +0000
Message-Id: <20220510235653.933868-1-tjmercier@google.com>
Mime-Version: 1.0
X-Mailer: git-send-email 2.36.0.512.ge40c2bad7a-goog
Subject: [PATCH v7 0/6] Proposal for a GPU cgroup controller
From: "T.J. Mercier" <tjmercier@google.com>
To: tjmercier@google.com, Tejun Heo <tj@kernel.org>,
 Zefan Li <lizefan.x@bytedance.com>, 
 Johannes Weiner <hannes@cmpxchg.org>, Jonathan Corbet <corbet@lwn.net>, 
 Greg Kroah-Hartman <gregkh@linuxfoundation.org>, 
 "=?UTF-8?q?Arve=20Hj=C3=B8nnev=C3=A5g?=" <arve@android.com>,
 Todd Kjos <tkjos@android.com>, Martijn Coenen <maco@android.com>, 
 Joel Fernandes <joel@joelfernandes.org>, Christian Brauner <brauner@kernel.org>,
 Hridya Valsaraju <hridya@google.com>, Suren Baghdasaryan <surenb@google.com>, 
 Sumit Semwal <sumit.semwal@linaro.org>, 
 "=?UTF-8?q?Christian=20K=C3=B6nig?=" <christian.koenig@amd.com>, 
 Benjamin Gaignard <benjamin.gaignard@collabora.com>,
 Liam Mark <lmark@codeaurora.org>, 
 Laura Abbott <labbott@redhat.com>, Brian Starkey <Brian.Starkey@arm.com>, 
 John Stultz <john.stultz@linaro.org>, Shuah Khan <shuah@kernel.org>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
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
Cc: linux-kselftest@vger.kernel.org, linux-doc@vger.kernel.org,
 Kenny.Ho@amd.com, cgroups@vger.kernel.org, skhan@linuxfoundation.org,
 cmllamas@google.com, dri-devel@lists.freedesktop.org,
 linux-kernel@vger.kernel.org, linaro-mm-sig@lists.linaro.org, mkoutny@suse.com,
 kaleshsingh@google.com, jstultz@google.com, kernel-team@android.com,
 linux-media@vger.kernel.org
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

This patch series revisits the proposal for a GPU cgroup controller to
track and limit memory allocations by various device/allocator
subsystems. The patch series also contains a simple prototype to
illustrate how Android intends to implement DMA-BUF allocator
attribution using the GPU cgroup controller. The prototype does not
include resource limit enforcements.

Changelog:
v7:
Hide gpucg and gpucg_bucket struct definitions per Michal Koutn=C3=BD.
This means gpucg_register_bucket now returns an internally allocated
struct gpucg_bucket.

Move all public function documentation to the cgroup_gpu.h header.

Remove comment in documentation about duplicate name rejection which
is not relevant to cgroups users per Michal Koutn=C3=BD.

v6:
Move documentation into cgroup-v2.rst per Tejun Heo.

Rename BINDER_FD{A}_FLAG_SENDER_NO_NEED ->
BINDER_FD{A}_FLAG_XFER_CHARGE per Carlos Llamas.

Return error on transfer failure per Carlos Llamas.

v5:
Rebase on top of v5.18-rc3

Drop the global GPU cgroup "total" (sum of all device totals) portion
of the design since there is no currently known use for this per
Tejun Heo.

Fix commit message which still contained the old name for
dma_buf_transfer_charge per Michal Koutn=C3=BD.

Remove all GPU cgroup code except what's necessary to support charge transf=
er
from dma_buf. Previously charging was done in export, but for non-Android
graphics use-cases this is not ideal since there may be a delay between
allocation and export, during which time there is no accounting.

Merge dmabuf: Use the GPU cgroup charge/uncharge APIs patch into
dmabuf: heaps: export system_heap buffers with GPU cgroup charging as a
result of above.

Put the charge and uncharge code in the same file (system_heap_allocate,
system_heap_dma_buf_release) instead of splitting them between the heap and
the dma_buf_release. This avoids asymmetric management of the gpucg charges=
.

Modify the dma_buf_transfer_charge API to accept a task_struct instead
of a gpucg. This avoids requiring the caller to manage the refcount
of the gpucg upon failure and confusing ownership transfer logic.

Support all strings for gpucg_register_bucket instead of just string
literals.

Enforce globally unique gpucg_bucket names.

Constrain gpucg_bucket name lengths to 64 bytes.

Append "-heap" to gpucg_bucket names from dmabuf-heaps.

Drop patch 7 from the series, which changed the types of
binder_transaction_data's sender_pid and sender_euid fields. This was
done in another commit here:
https://lore.kernel.org/all/20220210021129.3386083-4-masahiroy@kernel.org/

Rename:
  gpucg_try_charge -> gpucg_charge
  find_cg_rpool_locked -> cg_rpool_find_locked
  init_cg_rpool -> cg_rpool_init
  get_cg_rpool_locked -> cg_rpool_get_locked
  "gpu cgroup controller" -> "GPU controller"
  gpucg_device -> gpucg_bucket
  usage -> size

Tests:
  Support both binder_fd_array_object and binder_fd_object. This is
  necessary because new versions of Android will use binder_fd_object
  instead of binder_fd_array_object, and we need to support both.

  Tests for both binder_fd_array_object and binder_fd_object.

  For binder_utils return error codes instead of
  struct binder{fs}_ctx.

  Use ifdef __ANDROID__ to choose platform-dependent temp path instead
  of a runtime fallback.

  Ensure binderfs_mntpt ends with a trailing '/' character instead of
  prepending it where used.

v4:
Skip test if not run as root per Shuah Khan

Add better test logging for abnormal child termination per Shuah Khan

Adjust ordering of charge/uncharge during transfer to avoid potentially
hitting cgroup limit per Michal Koutn=C3=BD

Adjust gpucg_try_charge critical section for charge transfer functionality

Fix uninitialized return code error for dmabuf_try_charge error case

v3:
Remove Upstreaming Plan from gpu-cgroup.rst per John Stultz

Use more common dual author commit message format per John Stultz

Remove android from binder changes title per Todd Kjos

Add a kselftest for this new behavior per Greg Kroah-Hartman

Include details on behavior for all combinations of kernel/userspace
versions in changelog (thanks Suren Baghdasaryan) per Greg Kroah-Hartman.

Fix pid and uid types in binder UAPI header

v2:
See the previous revision of this change submitted by Hridya Valsaraju
at: https://lore.kernel.org/all/20220115010622.3185921-1-hridya@google.com/

Move dma-buf cgroup charge transfer from a dma_buf_op defined by every
heap to a single dma-buf function for all heaps per Daniel Vetter and
Christian K=C3=B6nig. Pointers to struct gpucg and struct gpucg_device
tracking the current associations were added to the dma_buf struct to
achieve this.

Fix incorrect Kconfig help section indentation per Randy Dunlap.

History of the GPU cgroup controller
=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=
=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D
The GPU/DRM cgroup controller came into being when a consensus[1]
was reached that the resources it tracked were unsuitable to be integrated
into memcg. Originally, the proposed controller was specific to the DRM
subsystem and was intended to track GEM buffers and GPU-specific
resources[2]. In order to help establish a unified memory accounting model
for all GPU and all related subsystems, Daniel Vetter put forth a
suggestion to move it out of the DRM subsystem so that it can be used by
other DMA-BUF exporters as well[3]. This RFC proposes an interface that
does the same.

[1]: https://patchwork.kernel.org/project/dri-devel/cover/20190501140438.95=
06-1-brian.welty@intel.com/#22624705
[2]: https://lore.kernel.org/amd-gfx/20210126214626.16260-1-brian.welty@int=
el.com/
[3]: https://lore.kernel.org/amd-gfx/YCVOl8%2F87bqRSQei@phenom.ffwll.local/

Hridya Valsaraju (3):
  gpu: rfc: Proposal for a GPU cgroup controller
  cgroup: gpu: Add a cgroup controller for allocator attribution of GPU
    memory
  binder: Add flags to relinquish ownership of fds

T.J. Mercier (3):
  dmabuf: heaps: export system_heap buffers with GPU cgroup charging
  dmabuf: Add gpu cgroup charge transfer function
  selftests: Add binder cgroup gpu memory transfer tests

 Documentation/admin-guide/cgroup-v2.rst       |  23 +
 drivers/android/binder.c                      |  31 +-
 drivers/dma-buf/dma-buf.c                     |  80 ++-
 drivers/dma-buf/dma-heap.c                    |  38 ++
 drivers/dma-buf/heaps/system_heap.c           |  28 +-
 include/linux/cgroup_gpu.h                    | 146 +++++
 include/linux/cgroup_subsys.h                 |   4 +
 include/linux/dma-buf.h                       |  49 +-
 include/linux/dma-heap.h                      |  15 +
 include/uapi/linux/android/binder.h           |  23 +-
 init/Kconfig                                  |   7 +
 kernel/cgroup/Makefile                        |   1 +
 kernel/cgroup/gpu.c                           | 390 +++++++++++++
 .../selftests/drivers/android/binder/Makefile |   8 +
 .../drivers/android/binder/binder_util.c      | 250 +++++++++
 .../drivers/android/binder/binder_util.h      |  32 ++
 .../selftests/drivers/android/binder/config   |   4 +
 .../binder/test_dmabuf_cgroup_transfer.c      | 526 ++++++++++++++++++
 18 files changed, 1632 insertions(+), 23 deletions(-)
 create mode 100644 include/linux/cgroup_gpu.h
 create mode 100644 kernel/cgroup/gpu.c
 create mode 100644 tools/testing/selftests/drivers/android/binder/Makefile
 create mode 100644 tools/testing/selftests/drivers/android/binder/binder_u=
til.c
 create mode 100644 tools/testing/selftests/drivers/android/binder/binder_u=
til.h
 create mode 100644 tools/testing/selftests/drivers/android/binder/config
 create mode 100644 tools/testing/selftests/drivers/android/binder/test_dma=
buf_cgroup_transfer.c

--=20
2.36.0.512.ge40c2bad7a-goog

