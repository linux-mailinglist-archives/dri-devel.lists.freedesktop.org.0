Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id D99B7558B0E
	for <lists+dri-devel@lfdr.de>; Fri, 24 Jun 2022 00:06:29 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 8BAC510E0F1;
	Thu, 23 Jun 2022 22:06:24 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-pf1-x449.google.com (mail-pf1-x449.google.com
 [IPv6:2607:f8b0:4864:20::449])
 by gabe.freedesktop.org (Postfix) with ESMTPS id EF6DA10E0F1
 for <dri-devel@lists.freedesktop.org>; Thu, 23 Jun 2022 22:06:23 +0000 (UTC)
Received: by mail-pf1-x449.google.com with SMTP id
 g23-20020a056a00079700b00525285ae44eso354372pfu.13
 for <dri-devel@lists.freedesktop.org>; Thu, 23 Jun 2022 15:06:23 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=20210112;
 h=date:message-id:mime-version:subject:from:to:cc;
 bh=KwqDl7Ku0++kd3bGbvwgzs1gT1laIcj9GIfwKObRL9E=;
 b=f8U/4xKGanNwrOdn737tuWhSmnZoG61m1qxfjiv5VkQ8UPtSqaWeibB404rrX79rJX
 Sr8EwtDegZkmDOiQT1PYLi73vlNuyK3MEO3CteMf7qrTyzJdkDqEDsqiRCNCHSPQ5OpW
 eesWhWqiGdmVom/8h4KWFRd14AnohMl03xMmbV6Ab1oeKOXQCzTP9OQoqz1l8U2F6/ec
 VlqIw1iK8+IqtbCAOHrXtiW4tOefdgMl+CoajfkyUTpBuZ8kM+4EuI/xDArQ35ySZCKy
 wRv8WwozJNFIjWw3i7yzruaQIY9s/ub55YNu2bl9iMISFr3cyMkNMY6hYWwYFcZJ8fYO
 pNYw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:date:message-id:mime-version:subject:from:to:cc;
 bh=KwqDl7Ku0++kd3bGbvwgzs1gT1laIcj9GIfwKObRL9E=;
 b=6+Ju5ssyKOYhsgKmQDUdXpaYdnfDhhnA6sGAl7/DDN7THXlzN0sKlnyPASAT0h11cR
 RaBBTzB/mWP3T9Pd+1wRMDIScJf5FVxYAxHBiSQ9UuJQQePIKTEltLo+tmP+BlYKP4LU
 wN1nxo2E8e0DyA2JCLnQXHWMu0ENKpPo97/+UkIleg9aJeMqCnvHo8lS55exq8Cwj+iG
 xJ/yXbU8M2RSjlKZBlhHg4z7r5DrHyC7128Z4u4nSNuNLkcuCm1Wz/fKBT5f9aTTx/b9
 gifvHs7D2a9V8XZ1yVJ8Kzj4eFm6N8EynwIbYDx+F4iR+jhOWA1j6u7yBVXyaMWALHdz
 jcUQ==
X-Gm-Message-State: AJIora9MwsPn+Mrmr7jvSl1RHUJJVGqP7WcezXisi9hgPbNWxPcjSc8I
 tKapKpbYwpe3FKyMDnO5IyqlpRLF3v2gk0ci3g==
X-Google-Smtp-Source: AGRyM1sO9ieUDBnlX+/hb6X4MjMKGW7axAjbZt6eLMihv8A9ry56mIpW47+iL+E9JFdzcNk6h+YievpjxofEabG5Zw==
X-Received: from kaleshsingh.mtv.corp.google.com
 ([2620:15c:211:200:ac62:20a7:e3c5:c221])
 (user=kaleshsingh job=sendgmr) by 2002:a05:6a00:885:b0:510:950f:f787 with
 SMTP id q5-20020a056a00088500b00510950ff787mr42464806pfj.83.1656021983532;
 Thu, 23 Jun 2022 15:06:23 -0700 (PDT)
Date: Thu, 23 Jun 2022 15:06:05 -0700
Message-Id: <20220623220613.3014268-1-kaleshsingh@google.com>
Mime-Version: 1.0
X-Mailer: git-send-email 2.37.0.rc0.161.g10f37bed90-goog
Subject: [PATCH v2 0/2] procfs: Add file path and size to /proc/<pid>/fdinfo
From: Kalesh Singh <kaleshsingh@google.com>
To: ckoenig.leichtzumerken@gmail.com, christian.koenig@amd.com, 
 viro@zeniv.linux.org.uk, hch@infradead.org, stephen.s.brennan@oracle.com, 
 David.Laight@ACULAB.COM
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
Cc: Randy Dunlap <rdunlap@infradead.org>, linux-doc@vger.kernel.org,
 Jonathan Corbet <corbet@lwn.net>,
 Christoph Anton Mitterer <mail@christoph.anton.mitterer.name>,
 kernel-team@android.com, Johannes Weiner <hannes@cmpxchg.org>,
 ilkos@google.com, linux-kernel@vger.kernel.org,
 Colin Cross <ccross@google.com>, Sumit Semwal <sumit.semwal@linaro.org>,
 linaro-mm-sig@lists.linaro.org, Paul Gortmaker <paul.gortmaker@windriver.com>,
 dri-devel@lists.freedesktop.org, Kalesh Singh <kaleshsingh@google.com>,
 linux-fsdevel@vger.kernel.org, Andrew Morton <akpm@linux-foundation.org>,
 surenb@google.com, tjmercier@google.com, Mike Rapoport <rppt@kernel.org>,
 linux-media@vger.kernel.org
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

Hi all,

This is v2 of the fdinfo patches. The main update is adding path
field only for files with anon inodes. Rebased on 5.19-rc3.

The previous cover letter is copied below for convenience.

Thanks,
Kalesh

-----------

Processes can pin shared memory by keeping a handle to it through a
file descriptor; for instance dmabufs, memfd, and ashmem (in Android).

In the case of a memory leak, to identify the process pinning the
memory, userspace needs to:
  - Iterate the /proc/<pid>/fd/* for each process
  - Do a readlink on each entry to identify the type of memory from
    the file path.
  - stat() each entry to get the size of the memory.

The file permissions on /proc/<pid>/fd/* only allows for the owner
or root to perform the operations above; and so is not suitable for
capturing the system-wide state in a production environment.

This issue was addressed for dmabufs by making /proc/*/fdinfo/*
accessible to a process with PTRACE_MODE_READ_FSCREDS credentials[1]
To allow the same kind of tracking for other types of shared memory,
add the following fields to /proc/<pid>/fdinfo/<fd>:

path - This allows identifying the type of memory based on common
       prefixes: e.g. "/memfd...", "/dmabuf...", "/dev/ashmem..."

       This was not an issued when dmabuf tracking was introduced
       because the exp_name field of dmabuf fdinfo could be used
       to distinguish dmabuf fds from other types.

size - To track the amount of memory that is being pinned.

       dmabufs expose size as an additional field in fdinfo. Remove
       this and make it a common field for all fds.

Access to /proc/<pid>/fdinfo is governed by PTRACE_MODE_READ_FSCREDS
-- the same as for /proc/<pid>/maps which also exposes the path and
size for mapped memory regions.

This allows for a system process with PTRACE_MODE_READ_FSCREDS to
account the pinned per-process memory via fdinfo.


Kalesh Singh (2):
  procfs: Add 'size' to /proc/<pid>/fdinfo/
  procfs: Add 'path' to /proc/<pid>/fdinfo/

 Documentation/filesystems/proc.rst | 22 ++++++++++++++++++++--
 drivers/dma-buf/dma-buf.c          |  1 -
 fs/libfs.c                         |  9 +++++++++
 fs/proc/fd.c                       | 18 ++++++++++++++----
 include/linux/fs.h                 |  1 +
 5 files changed, 44 insertions(+), 7 deletions(-)


base-commit: a111daf0c53ae91e71fd2bfe7497862d14132e3e
-- 
2.37.0.rc0.161.g10f37bed90-goog

