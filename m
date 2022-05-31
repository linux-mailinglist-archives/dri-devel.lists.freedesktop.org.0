Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 987675398AA
	for <lists+dri-devel@lfdr.de>; Tue, 31 May 2022 23:25:32 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id EF1A710E103;
	Tue, 31 May 2022 21:25:29 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-yw1-x1149.google.com (mail-yw1-x1149.google.com
 [IPv6:2607:f8b0:4864:20::1149])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 953CF10E103
 for <dri-devel@lists.freedesktop.org>; Tue, 31 May 2022 21:25:28 +0000 (UTC)
Received: by mail-yw1-x1149.google.com with SMTP id
 00721157ae682-3077947cbb8so96947567b3.8
 for <dri-devel@lists.freedesktop.org>; Tue, 31 May 2022 14:25:28 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=20210112;
 h=date:message-id:mime-version:subject:from:cc;
 bh=L5daPTOP8huWXGF9zZZ/YOQgC5+YhUKYKEYEGgJKuXI=;
 b=ni+vDj4JsvkDI6uQO/dBS970cz6dZc8DyFe2Zer4xTkNxkSHvK+9iWBnPWmPFlu+yM
 GldK8tXmwDcVnPqD5rTmrw1O/5Fx84SqlvyYy1O+NdSXpTGCmxmOP42PbCZEsmapK/pI
 LdPWt3eWdMCmmsdUAyhxzJwSk4K/f3XFD8JLMQDfFMKoV7yl3wD7c0YEyQZkVTKpKRls
 bQIXSiUx6bvVEbfIXw2C31CtGBGyRZKnhhZI0oqDXke/z5Cd5Z5SAktEbZN0415/W9kX
 oeGofIRzd3K6V4+k9c5ZaCl6y2CNVM4tUzcRZzthBuZX0q0DdV2YxdbJ4DLgGVowVllW
 //UA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:date:message-id:mime-version:subject:from:cc;
 bh=L5daPTOP8huWXGF9zZZ/YOQgC5+YhUKYKEYEGgJKuXI=;
 b=YJzIqlGKJSqnJEF30ncKG7iaWu+Uoa9ZE9K8mnnH8mTruV1TeThOp0Su+17W5z88mw
 avgLnFH5k2vUizJgJatxSQispcU6sWzovPHOvNzyZ9Zl2HTpiZXVy+pSiILfrtb+OXlh
 eAFuIyx6SkhlLxQf+lIO3ayZuCtrhXN4CMxT0dbFiuijRF/nrsm7VC56FsTwCtRNsJpe
 wFZwW4Y/Oitk4N8s5r8m+T8qMPmaJOaagBkkkQfxXMb/xhhBwwmcGktcV6BrcpRglNTH
 Ps5zZJKU5KkPIzG8m1zGVWxVBqXYGXml99aX+BHblu/jVAkeRt3A7Wh1tUtuMyGEU0gW
 qLCA==
X-Gm-Message-State: AOAM5338Uylnqc+vYZ/mHrI7LGr78qXCc5MKbNwOvXu95Mj4DXQtvJi2
 lmssb4GRr9XqKWfqRbs5EY1RekQ2dworiO+nBg==
X-Google-Smtp-Source: ABdhPJxWIiQFRYynwXQQYY0IBjtnA6j7FHVKcbmfGUIrmeVszzJonKHXPDCnsP8F5SOq9IOCJF3wUkeCrypYAVu4VA==
X-Received: from kaleshsingh.mtv.corp.google.com
 ([2620:15c:211:200:a3c0:2a66:b25c:16df])
 (user=kaleshsingh job=sendgmr) by 2002:a25:6588:0:b0:65d:57b9:c470 with SMTP
 id z130-20020a256588000000b0065d57b9c470mr4071204ybb.142.1654032327734; Tue,
 31 May 2022 14:25:27 -0700 (PDT)
Date: Tue, 31 May 2022 14:25:13 -0700
Message-Id: <20220531212521.1231133-1-kaleshsingh@google.com>
Mime-Version: 1.0
X-Mailer: git-send-email 2.36.1.255.ge46751e96f-goog
Subject: [PATCH 0/2] procfs: Add file path and size to /proc/<pid>/fdinfo
From: Kalesh Singh <kaleshsingh@google.com>
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
Cc: Randy Dunlap <rdunlap@infradead.org>,
 Andrew Morton <akpm@linux-foundation.org>, Jonathan Corbet <corbet@lwn.net>,
 Christoph Anton Mitterer <mail@christoph.anton.mitterer.name>,
 kernel-team@android.com, Johannes Weiner <hannes@cmpxchg.org>,
 ilkos@google.com, linux-kernel@vger.kernel.org, linux-doc@vger.kernel.org,
 Sumit Semwal <sumit.semwal@linaro.org>, linaro-mm-sig@lists.linaro.org,
 Paul Gortmaker <paul.gortmaker@windriver.com>, dri-devel@lists.freedesktop.org,
 Kalesh Singh <kaleshsingh@google.com>, linux-fsdevel@vger.kernel.org,
 =?UTF-8?q?Christian=20K=C3=B6nig?= <christian.koenig@amd.com>,
 David Hildenbrand <david@redhat.com>, surenb@google.com, tjmercier@google.com,
 Mike Rapoport <rppt@kernel.org>, linux-media@vger.kernel.org
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

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

-----

There was some concern about exposing the file path in the RFC[2], to that
effect the change was split into separte patches. Also retrieving the file
path from fdinfo is guarded by the same capability (PTRACE_MODE_READ) as
/proc/<pid>/maps which also exposes file path, so this may not be an issue.

[1] https://lore.kernel.org/r/20210308170651.919148-1-kaleshsingh@google.com/
[2] https://lore.kernel.org/r/20220519214021.3572840-1-kaleshsingh@google.com/


Kalesh Singh (2):
  procfs: Add 'size' to /proc/<pid>/fdinfo/
  procfs: Add 'path' to /proc/<pid>/fdinfo/

 Documentation/filesystems/proc.rst | 22 ++++++++++++++++++++--
 drivers/dma-buf/dma-buf.c          |  1 -
 fs/proc/fd.c                       | 13 +++++++++----
 3 files changed, 29 insertions(+), 7 deletions(-)


base-commit: 8ab2afa23bd197df47819a87f0265c0ac95c5b6a
-- 
2.36.1.255.ge46751e96f-goog

