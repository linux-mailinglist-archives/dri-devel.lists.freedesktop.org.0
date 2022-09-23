Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 13A095E838E
	for <lists+dri-devel@lfdr.de>; Fri, 23 Sep 2022 22:29:03 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 153DA10E922;
	Fri, 23 Sep 2022 20:28:45 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-pl1-x629.google.com (mail-pl1-x629.google.com
 [IPv6:2607:f8b0:4864:20::629])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 3FE2110E1C0
 for <dri-devel@lists.freedesktop.org>; Fri, 23 Sep 2022 20:28:27 +0000 (UTC)
Received: by mail-pl1-x629.google.com with SMTP id b21so1165124plz.7
 for <dri-devel@lists.freedesktop.org>; Fri, 23 Sep 2022 13:28:27 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=chromium.org; s=google;
 h=content-transfer-encoding:mime-version:message-id:date:subject:cc
 :to:from:from:to:cc:subject:date;
 bh=WK0bGuD2tAxqqCEo+J+Vcp/Ca26AMBReT0rLu9mHjWo=;
 b=Bq646OyB58An4Ya0i1tJSWid5B14G8+Igfn3fxCST+TPDeet6KAginBjtHf1G+96pP
 KMbRLvXh6hUd7mw6RJpRt7mflnBYm9ibc+vu8XY4rLIHczU3FqSb/xj3tEHFFGtr1oRe
 sICyRsZLX9/FsK6U8cZvA0aX8m/YlImy46ePk=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=content-transfer-encoding:mime-version:message-id:date:subject:cc
 :to:from:x-gm-message-state:from:to:cc:subject:date;
 bh=WK0bGuD2tAxqqCEo+J+Vcp/Ca26AMBReT0rLu9mHjWo=;
 b=mBlgm4yUFO+7lR2wAKnAAEbVA3hDbdn6jOs6oieW4+F/N+9jB7/sON2iMHSCl/w4mX
 XdRxuXzd87aMJmfeTNYqssXYaC+vIQ0Mi8tAKP758uvRIY4lI87C1XvIz7EW+PunDPCc
 FttKoudSSQbOyF8eHZTD0/ZcUqpOswbzIX/ZZBZlx5p0q9LmV04l8vkjxa6AR5zAJFD0
 DXkXszd+Y+BU2D9yo2oZMIlu4zz3FXK35q7tqnZYoYALSkmqYHzbIzS23d2aPahDmJQ/
 kvncVP9rXNRHlSi1b8XeOmgM/mKwIQgp5Xu5HTFkNVPyXfar/afglUPeqH49WzvX3cPM
 Px2w==
X-Gm-Message-State: ACrzQf1+4MKtWHs+UsnKmgXQ9x3/CFnTr9frI/rlBh5tS2DX3FpnR3uS
 1L9Ojkbh2Esxx4ZSohQtpAkQnA==
X-Google-Smtp-Source: AMsMyM72+AZrvCjzG0TpHX1QWIyqlT+yIJNjqD6XgzhlX4O0lN7py3H0HnAbWO3N8SQjTT6PAgNtPQ==
X-Received: by 2002:a17:90b:17cf:b0:202:95a2:e310 with SMTP id
 me15-20020a17090b17cf00b0020295a2e310mr23778042pjb.76.1663964906615; 
 Fri, 23 Sep 2022 13:28:26 -0700 (PDT)
Received: from www.outflux.net (smtp.outflux.net. [198.145.64.163])
 by smtp.gmail.com with ESMTPSA id
 t2-20020aa79462000000b0053639773ad8sm6832080pfq.119.2022.09.23.13.28.24
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Fri, 23 Sep 2022 13:28:25 -0700 (PDT)
From: Kees Cook <keescook@chromium.org>
To: Vlastimil Babka <vbabka@suse.cz>
Subject: [PATCH v2 00/16] slab: Introduce kmalloc_size_roundup()
Date: Fri, 23 Sep 2022 13:28:06 -0700
Message-Id: <20220923202822.2667581-1-keescook@chromium.org>
X-Mailer: git-send-email 2.34.1
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
X-Developer-Signature: v=1; a=openpgp-sha256; l=3290; h=from:subject;
 bh=6t8CTnxnusXxlhLGNxOhRs5l2789SVRbReUcmZgsVm4=;
 b=owEBbQKS/ZANAwAKAYly9N/cbcAmAcsmYgBjLhbjKWBYYij171TDp3TdZmoZXSs7dXXkRN1eGod1
 9RjCiP+JAjMEAAEKAB0WIQSlw/aPIp3WD3I+bhOJcvTf3G3AJgUCYy4W4wAKCRCJcvTf3G3AJnMrD/
 9AYEfZWXDOv2krdFVvtjQthCuAcgKZVOWzfaX/ZBtQRlYjuppFlG2ED1IEpuIhD0Ir80c5xPT0sC6o
 NsiMZw3mMRacDRN1JKTgZIg3s63bBHGPVJzr9Ms7LrhbLULxcInTn8Kmx1m+j/SOpIaVQbOz2eMMkZ
 hq15TaNyE7pBLM9SdfCtAyTs9eRAtVTuYrwZqvgSDjZ61SXuxi2k37cjMCmPHUTq/sIlGgP+BbmYVU
 h4TXPtyeel8GsxvMTh+ZJLwcMIm74VL8RdFIlqhUbTT1t2IHy48AtxwQQhaVX0FoQuaeRVIHGZ6W3H
 G8nJ1wcWlIzz3bYBH022dj7eQTsTkVCk6mdVQzd0tBA9yKVcNDoLBacX1DCakWCtJtW9hB3nI7wGSo
 dddWD44+KFc7CqbVkUJUBWKf0KFDD+RBxraKtYUvKQrLMx0oq545fsuTe+Wx85iePymCMknPsuIu7T
 RqpkKnn423yOsp7n6oWGz2jCxpOIGyTubVpWH5O/cuXKNmrDFZz8jsL8Js/2Of2DYZ5nq9YGQsiXeg
 2S+DEM7sXnFtd9YfGznNOceTXn0B6askh1+E8cTpDv624NJQscze/0hYjyKnnV10f4gf0FRf/X6SzA
 azwQEVgyfXgzY00yn92DXcmjocb95A4MMqEAG/m2SLnjQl6aJMp6R561rcig==
X-Developer-Key: i=keescook@chromium.org; a=openpgp;
 fpr=A5C3F68F229DD60F723E6E138972F4DFDC6DC026
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
Cc: llvm@lists.linux.dev, dri-devel@lists.freedesktop.org, "Ruhl,
 Michael J" <michael.j.ruhl@intel.com>, Eric Dumazet <edumazet@google.com>,
 linux-hardening@vger.kernel.org, Hyeonggon Yoo <42.hyeyoo@gmail.com>,
 Christoph Lameter <cl@linux.com>, Sumit Semwal <sumit.semwal@linaro.org>,
 dev@openvswitch.org, x86@kernel.org,
 Jesse Brandeburg <jesse.brandeburg@intel.com>,
 intel-wired-lan@lists.osuosl.org, David Rientjes <rientjes@google.com>,
 Miguel Ojeda <ojeda@kernel.org>, Yonghong Song <yhs@fb.com>,
 Paolo Abeni <pabeni@redhat.com>, linux-media@vger.kernel.org,
 Marco Elver <elver@google.com>, Kees Cook <keescook@chromium.org>,
 Josef Bacik <josef@toxicpanda.com>, linaro-mm-sig@lists.linaro.org,
 Jakub Kicinski <kuba@kernel.org>, David Sterba <dsterba@suse.com>,
 Joonsoo Kim <iamjoonsoo.kim@lge.com>, Alex Elder <elder@kernel.org>,
 linux-mm@kvack.org, Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
 Nick Desaulniers <ndesaulniers@google.com>, linux-kernel@vger.kernel.org,
 "David S. Miller" <davem@davemloft.net>, Pekka Enberg <penberg@kernel.org>,
 Daniel Micay <danielmicay@gmail.com>, netdev@vger.kernel.org,
 linux-fsdevel@vger.kernel.org, Andrew Morton <akpm@linux-foundation.org>,
 =?UTF-8?q?Christian=20K=C3=B6nig?= <christian.koenig@amd.com>,
 linux-btrfs@vger.kernel.org
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

Hi,

The main details on this series are in patch #2's commit log. It's long,
so I won't repeat it again here for the v2. As before, I've tried to
trim the CC list.

v2:
- _keep_ ksize(), but remove instrumentation (makes patch series smaller)
- reorganized skbuff logic to avoid yet more copy/paste code
- added a WARN to a separate skbuff ksize usage
- add new refactorings: bpf, openvswitch, devres, mempool, kasan
- dropped "independent" patches: iwlwifi, x86/microcode/AMD (sent separately)
v1: https://lore.kernel.org/lkml/20220922031013.2150682-1-keescook@chromium.org

Notes:

Originally when I was going to entirely remove ksize(), there were a
handful for refactorings that just needed to do ksize -> __ksize. In
the end, it was cleaner to actually leave ksize() as a real function,
just without the kasan instrumentation. I wonder, however, if it should
be converted into a static inline now?

I dropped Jakub's Ack because I refactored that code a bunch more.

The 2 patches that didn't need to call kmalloc_size_roundup() don't need
to be part of this series. (One is already in -next, actually.)

I'd like to land at least the first two patches in the coming v6.1 merge
window so that the per-subsystem patches can be sent to their various
subsystems directly. Vlastimil, what you think?

Thanks!

-Kees


Kees Cook (16):
  slab: Remove __malloc attribute from realloc functions
  slab: Introduce kmalloc_size_roundup()
  skbuff: Proactively round up to kmalloc bucket size
  skbuff: Phase out ksize() fallback for frag_size
  net: ipa: Proactively round up to kmalloc bucket size
  igb: Proactively round up to kmalloc bucket size
  btrfs: send: Proactively round up to kmalloc bucket size
  dma-buf: Proactively round up to kmalloc bucket size
  coredump: Proactively round up to kmalloc bucket size
  openvswitch: Use kmalloc_size_roundup() to match ksize() usage
  bpf: Use kmalloc_size_roundup() to match ksize() usage
  devres: Use kmalloc_size_roundup() to match ksize() usage
  mempool: Use kmalloc_size_roundup() to match ksize() usage
  kasan: Remove ksize()-related tests
  mm: Make ksize() a reporting-only function
  slab: Restore __alloc_size attribute to __kmalloc_track_caller

 drivers/base/devres.c                     |  3 +
 drivers/dma-buf/dma-resv.c                |  9 ++-
 drivers/net/ethernet/intel/igb/igb_main.c |  5 +-
 drivers/net/ipa/gsi_trans.c               |  7 +-
 fs/btrfs/send.c                           | 11 +--
 fs/coredump.c                             |  7 +-
 include/linux/compiler_types.h            | 13 ++--
 include/linux/skbuff.h                    |  5 +-
 include/linux/slab.h                      | 46 +++++++++++--
 kernel/bpf/verifier.c                     | 49 +++++++++-----
 lib/test_kasan.c                          | 42 ------------
 mm/kasan/shadow.c                         |  4 +-
 mm/mempool.c                              |  2 +-
 mm/slab.c                                 |  9 ++-
 mm/slab_common.c                          | 62 ++++++++++-------
 net/core/skbuff.c                         | 82 ++++++++++++-----------
 net/openvswitch/flow_netlink.c            |  2 +-
 17 files changed, 192 insertions(+), 166 deletions(-)

-- 
2.34.1

