Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 8F5956785F7
	for <lists+dri-devel@lfdr.de>; Mon, 23 Jan 2023 20:17:57 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id A037A10E070;
	Mon, 23 Jan 2023 19:17:53 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-yb1-xb49.google.com (mail-yb1-xb49.google.com
 [IPv6:2607:f8b0:4864:20::b49])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 1E42710E070
 for <dri-devel@lists.freedesktop.org>; Mon, 23 Jan 2023 19:17:51 +0000 (UTC)
Received: by mail-yb1-xb49.google.com with SMTP id
 w70-20020a25df49000000b00803e799d7b1so8256827ybg.10
 for <dri-devel@lists.freedesktop.org>; Mon, 23 Jan 2023 11:17:51 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=20210112;
 h=cc:to:from:subject:message-id:mime-version:date:from:to:cc:subject
 :date:message-id:reply-to;
 bh=N+YvoWM7hVZLP7f3mNekEgTLNrfGSz/VUTj8ZELQtN0=;
 b=btfBgj1oagL/EjdEgeCa/LpL00/84F14njHYxfZbVx8eK5EnmK1Ttj9sO31U4EmSM8
 1MznIrLgPijCnSyvvb8XtI6YXLZ78NHWa/H/mNm31bw5LcdVJksSSGGO2dzPHlgU3buz
 /p9eEQbQt8x8MWRR7X+Ry+0Y58RX018tAsy1ZXD0QRf9P7CPtLAoftSzjvCACGDXGEgM
 o15+ngRvubcFDwfKC4626oWwr6aoB3/30CZULYiYPJpCKGXHpUDBYU1vHVotztxTUlup
 U435Wlbrn0vhCQELYo1hK06QeiCc3qfIoJ83+mV0bqqYDPZ4ySJ6H5OvU4sUwT2bCQY8
 tDxg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=cc:to:from:subject:message-id:mime-version:date:x-gm-message-state
 :from:to:cc:subject:date:message-id:reply-to;
 bh=N+YvoWM7hVZLP7f3mNekEgTLNrfGSz/VUTj8ZELQtN0=;
 b=eTmLPF6tCGjkvDWbAnmB/Pc8dF5pIhuG/cHPXhcnjoaQe8XXokZSqSBNUwSn4BZAmM
 wsgHhDim82kffDbLeVCjjanIfpXBUiQdANAzLOinJokUKLfnwFu1Zt29CRbp9pM291QU
 GkkzQQSxLsZG+UAJayRxk/TUD6Jf4ak6ImGIwf5wT1fXRaEbYgnGHHANTKE554erBw9d
 XpYDRfNTDWYAIfK4b4hUBXVGNiDURq/8+FHS5ctU9dmDGEd5qMnPT1pyfULWJHYhmDDf
 hzrbpAlcSJAUGqFH9+A9+cPMFAU7R56N7zi3Vg8M5NYlZoBgsFv5Fq0HF5Ma0hnYDzgt
 gMKA==
X-Gm-Message-State: AFqh2kpGcwvV07zAOl8DLzwzZWC534iqnxnqyEnuCDXjAcpbfUrnX707
 +Y1c5Pbl3+F3AGmp8cK5Ti94h5U31KzZa34=
X-Google-Smtp-Source: AMrXdXtnP/Gl6EBzYGNvoAMXHOPKf8g2vx7ry4RLQdGRDJzjzoV9sc3vvEsAv/i0LJexRseYywCPKePifcMKipA=
X-Received: from tj.c.googlers.com ([fda3:e722:ac3:cc00:20:ed76:c0a8:53a])
 (user=tjmercier job=sendgmr) by 2002:a25:bdca:0:b0:7ca:14e:be6d with SMTP id
 g10-20020a25bdca000000b007ca014ebe6dmr3007629ybk.415.1674501470074; Mon, 23
 Jan 2023 11:17:50 -0800 (PST)
Date: Mon, 23 Jan 2023 19:17:22 +0000
Mime-Version: 1.0
X-Mailer: git-send-email 2.39.0.246.g2a6d74b583-goog
Message-ID: <20230123191728.2928839-1-tjmercier@google.com>
Subject: [PATCH v2 0/4] Track exported dma-buffers with memcg
From: "T.J. Mercier" <tjmercier@google.com>
To: tjmercier@google.com, Tejun Heo <tj@kernel.org>,
 Zefan Li <lizefan.x@bytedance.com>, 
 Johannes Weiner <hannes@cmpxchg.org>, Jonathan Corbet <corbet@lwn.net>, 
 Greg Kroah-Hartman <gregkh@linuxfoundation.org>, 
 "=?UTF-8?q?Arve=20Hj=C3=B8nnev=C3=A5g?=" <arve@android.com>,
 Todd Kjos <tkjos@android.com>, Martijn Coenen <maco@android.com>, 
 Joel Fernandes <joel@joelfernandes.org>, Christian Brauner <brauner@kernel.org>,
 Carlos Llamas <cmllamas@google.com>, Suren Baghdasaryan <surenb@google.com>, 
 Sumit Semwal <sumit.semwal@linaro.org>, 
 "=?UTF-8?q?Christian=20K=C3=B6nig?=" <christian.koenig@amd.com>,
 Michal Hocko <mhocko@kernel.org>, 
 Roman Gushchin <roman.gushchin@linux.dev>, Shakeel Butt <shakeelb@google.com>, 
 Muchun Song <muchun.song@linux.dev>, Andrew Morton <akpm@linux-foundation.org>,
 Paul Moore <paul@paul-moore.com>, James Morris <jmorris@namei.org>, 
 "Serge E. Hallyn" <serge@hallyn.com>,
 Stephen Smalley <stephen.smalley.work@gmail.com>, 
 Eric Paris <eparis@parisplace.org>
Content-Type: text/plain; charset="UTF-8"
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
Cc: android-mm@google.com, linux-doc@vger.kernel.org, selinux@vger.kernel.org,
 daniel.vetter@ffwll.ch, linux-kernel@vger.kernel.org,
 dri-devel@lists.freedesktop.org, linaro-mm-sig@lists.linaro.org,
 linux-mm@kvack.org, linux-security-module@vger.kernel.org, jstultz@google.com,
 jeffv@google.com, cgroups@vger.kernel.org, linux-media@vger.kernel.org
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

Based on discussions at LPC, this series adds a memory.stat counter for
exported dmabufs. This counter allows us to continue tracking
system-wide total exported buffer sizes which there is no longer any
way to get without DMABUF_SYSFS_STATS, and adds a new capability to
track per-cgroup exported buffer sizes. The total (root counter) is
helpful for accounting in-kernel dmabuf use (by comparing with the sum
of child nodes or with the sum of sizes of mapped buffers or FD
references in procfs) in addition to helping identify driver memory
leaks when in-kernel use continually increases over time. With
per-application cgroups, the per-cgroup counter allows us to quickly
see how much dma-buf memory an application has caused to be allocated.
This avoids the need to read through all of procfs which can be a
lengthy process, and causes the charge to "stick" to the allocating
process/cgroup as long as the buffer is alive, regardless of how the
buffer is shared (unless the charge is transferred).

The first patch adds the counter to memcg. The next two patches allow
the charge for a buffer to be transferred across cgroups which is
necessary because of the way most dmabufs are allocated from a central
process on Android. The fourth patch adds the binder object flags to
the existing selinux_binder_transfer_file LSM hook and a SELinux
permission for charge transfers.

[1] https://lore.kernel.org/all/20220617085702.4298-1-christian.koenig@amd.com/

v2:
Actually charge memcg vs just mutate the stat counter per Shakeel Butt
and Michal Hocko. Shakeel pointed me at the skmem functions which
turned out to be very similar to how I was thinking the dmabuf tracking
should work. So I've added a pair of dmabuf functions that do
essentially the same thing, except conditionally implemented behind
CONFIG_MEMCG alongside the other charge/uncharge functions.

Drop security_binder_transfer_charge per Casey Schaufler and Paul Moore

Drop BINDER_FDA_FLAG_XFER_CHARGE (and fix commit message) per Carlos
Llamas

Don't expose is_dma_buf_file for use by binder per Hillf Danton

Call dma_buf_stats_teardown in dma_buf_export error handling

Rebase onto v6.2-rc5

Hridya Valsaraju (1):
  binder: Add flags to relinquish ownership of fds

T.J. Mercier (3):
  memcg: Track exported dma-buffers
  dmabuf: Add cgroup charge transfer function
  security: binder: Add binder object flags to
    selinux_binder_transfer_file

 Documentation/admin-guide/cgroup-v2.rst |  5 ++
 drivers/android/binder.c                | 27 ++++++++--
 drivers/dma-buf/dma-buf.c               | 69 +++++++++++++++++++++++++
 include/linux/dma-buf.h                 |  4 ++
 include/linux/lsm_hook_defs.h           |  2 +-
 include/linux/lsm_hooks.h               |  5 +-
 include/linux/memcontrol.h              | 43 +++++++++++++++
 include/linux/security.h                |  6 ++-
 include/uapi/linux/android/binder.h     | 19 +++++--
 mm/memcontrol.c                         | 19 +++++++
 security/security.c                     |  4 +-
 security/selinux/hooks.c                | 13 ++++-
 security/selinux/include/classmap.h     |  2 +-
 13 files changed, 201 insertions(+), 17 deletions(-)


base-commit: 2241ab53cbb5cdb08a6b2d4688feb13971058f65
-- 
2.39.0.246.g2a6d74b583-goog

