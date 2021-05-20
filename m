Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 36FBE38B672
	for <lists+dri-devel@lfdr.de>; Thu, 20 May 2021 21:00:30 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 821146F4CE;
	Thu, 20 May 2021 19:00:24 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-pj1-x1033.google.com (mail-pj1-x1033.google.com
 [IPv6:2607:f8b0:4864:20::1033])
 by gabe.freedesktop.org (Postfix) with ESMTPS id EAF266F4DF
 for <dri-devel@lists.freedesktop.org>; Thu, 20 May 2021 19:00:14 +0000 (UTC)
Received: by mail-pj1-x1033.google.com with SMTP id
 ne24-20020a17090b3758b029015f2dafecb0so4625949pjb.4
 for <dri-devel@lists.freedesktop.org>; Thu, 20 May 2021 12:00:14 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=jlekstrand-net.20150623.gappssmtp.com; s=20150623;
 h=from:to:cc:subject:date:message-id:mime-version
 :content-transfer-encoding;
 bh=7eeUApV58YscRHlKze5RofJ7gCwLmXCkwBudl2y3vto=;
 b=l3HVjEQjAKeGw+rLVz7OP0AoPJPQQjHepgRE5NAhpc4Mssh9/qwyu1LaEgeoEP3VUy
 C3W4uVB69MsdewPUmPJsQV3XxfVsT5MVOsfarEFhKp/cMdoOX0g/G++IuqYdZPp+UOy5
 MCl4f1xeaOU0V506ySZOq3N79bWKdpkY8q/EuQohDJM+gA5jI2VtJQ0qyMID4Nj/sG79
 DnHQJ8JR3Qnsm7xcZg8wiyQp5KjbrOdEJ5wNRBJ/ZSl9tiJbYlLsbWXXQLkoK6Yw2btO
 ZfpLcXjvAQ1vk6ql4liSsEkLgz4RAOhNUdM6FPOzMTCRsiTeAvVHAZ0aY6dXrU2Jboz0
 rO0w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:mime-version
 :content-transfer-encoding;
 bh=7eeUApV58YscRHlKze5RofJ7gCwLmXCkwBudl2y3vto=;
 b=r1ztXmcglJ7ITI2Pcx3lukYe5LYmr3rG/1KbvgaoNZaiAt6QUovxZi5Y+L8c9pVKIq
 aGU5pTkVvWbnXm3cy2vNhazjF8fsGAA6ogUjxpXD8ctExzmlGumcFcC5Yja9ODxuzfd9
 DC7yMzNg4EgyzfRx23eKB1YyTBJGn9Oh7y9IUeSZkW6+klcuGtjykGbqlBFl6mfd3UKH
 FPh8QdqXqNKJ+Lu9Cy9wO/e0qgoqo1DUAHojVEYQjYXs0bTzNlmqRwvfT39pkBjOeOL1
 1E4Dbd+sZwvwxDvJmwMJ7f1Y2UTHW5Ma18Gm4braFACP7PuZdNZE0TE3VPITFqYiVidy
 hIyw==
X-Gm-Message-State: AOAM532DGmnJOdqfBB+/H/+hKcKW8G3j/jqvQuPMgHZCq1qS3ERvrrRi
 1NhbH1Mz1z76+ooZPAW1GMkf2q94OxukyQ==
X-Google-Smtp-Source: ABdhPJzMmF+YBoK+NtRwQ87CnExQTzz5igUOi0W+9Y742lhsir8AhZb5ogCiHauYeEIT9kALh2aNCA==
X-Received: by 2002:a17:90a:c7d5:: with SMTP id
 gf21mr6723642pjb.87.1621537212974; 
 Thu, 20 May 2021 12:00:12 -0700 (PDT)
Received: from omlet.lan (jfdmzpr03-ext.jf.intel.com. [134.134.139.72])
 by smtp.gmail.com with ESMTPSA id v2sm2455072pfm.134.2021.05.20.12.00.10
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Thu, 20 May 2021 12:00:12 -0700 (PDT)
From: Jason Ekstrand <jason@jlekstrand.net>
To: dri-devel@lists.freedesktop.org
Subject: [PATCH 0/4] dma-buf: Add an API for exporting sync files (v8)
Date: Thu, 20 May 2021 14:00:03 -0500
Message-Id: <20210520190007.534046-1-jason@jlekstrand.net>
X-Mailer: git-send-email 2.31.1
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
Cc: Daniel Stone <daniels@collabora.com>,
 =?UTF-8?q?Michel=20D=C3=A4nzer?= <michel@daenzer.net>,
 Jason Ekstrand <jason@jlekstrand.net>, Dave Airlie <airlied@redhat.com>,
 =?UTF-8?q?Christian=20K=C3=B6nig?= <christian.koenig@amd.com>
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

This is mostly a re-send of v8 only with a fourth patch which contains the
sync file import ioctl that I had in the original series.  I've not updated
the IGT tests yet for sync file import.  This resend is mostly intended to
aid in discussions around implicit sync in general.  I'll write up some IGT
tests if there is serious interest in patch 4.  I can also update the Mesa
MR to use it for Vulkan.

-------------------------------------------

Modern userspace APIs like Vulkan are built on an explicit
synchronization model.  This doesn't always play nicely with the
implicit synchronization used in the kernel and assumed by X11 and
Wayland.  The client -> compositor half of the synchronization isn't too
bad, at least on intel, because we can control whether or not i915
synchronizes on the buffer and whether or not it's considered written.

The harder part is the compositor -> client synchronization when we get
the buffer back from the compositor.  We're required to be able to
provide the client with a VkSemaphore and VkFence representing the point
in time where the window system (compositor and/or display) finished
using the buffer.  With current APIs, it's very hard to do this in such
a way that we don't get confused by the Vulkan driver's access of the
buffer.  In particular, once we tell the kernel that we're rendering to
the buffer again, any CPU waits on the buffer or GPU dependencies will
wait on some of the client rendering and not just the compositor.

This new IOCTL solves this problem by allowing us to get a snapshot of
the implicit synchronization state of a given dma-buf in the form of a
sync file.  It's effectively the same as a poll() or I915_GEM_WAIT only,
instead of CPU waiting directly, it encapsulates the wait operation, at
the current moment in time, in a sync_file so we can check/wait on it
later.  As long as the Vulkan driver does the sync_file export from the
dma-buf before we re-introduce it for rendering, it will only contain
fences from the compositor or display.  This allows to accurately turn
it into a VkFence or VkSemaphore without any over- synchronization.

Mesa MR: https://gitlab.freedesktop.org/mesa/mesa/-/merge_requests/4037
IGT tests: https://lists.freedesktop.org/archives/igt-dev/2021-March/029825.html

Cc: Christian König <christian.koenig@amd.com>
Cc: Michel Dänzer <michel@daenzer.net>
Cc: Dave Airlie <airlied@redhat.com>
Cc: Bas Nieuwenhuizen <bas@basnieuwenhuizen.nl>
Cc: Daniel Stone <daniels@collabora.com>

Christian König (1):
  dma-buf: add dma_fence_array_for_each (v2)

Jason Ekstrand (3):
  dma-buf: add dma_resv_get_singleton_rcu (v4)
  dma-buf: Add an API for exporting sync files (v9)
  RFC: dma-buf: Add an API for importing sync files (v6)

 drivers/dma-buf/dma-buf.c         |  94 +++++++++++++++++++++++
 drivers/dma-buf/dma-fence-array.c |  27 +++++++
 drivers/dma-buf/dma-resv.c        | 122 ++++++++++++++++++++++++++++++
 include/linux/dma-fence-array.h   |  17 +++++
 include/linux/dma-resv.h          |   3 +
 include/uapi/linux/dma-buf.h      |  25 ++++++
 6 files changed, 288 insertions(+)

-- 
2.31.1

