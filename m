Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id D2B6E543726
	for <lists+dri-devel@lfdr.de>; Wed,  8 Jun 2022 17:21:48 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 2CC4810EE0C;
	Wed,  8 Jun 2022 15:21:46 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-ot1-x336.google.com (mail-ot1-x336.google.com
 [IPv6:2607:f8b0:4864:20::336])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 2487110ED0B
 for <dri-devel@lists.freedesktop.org>; Wed,  8 Jun 2022 15:21:45 +0000 (UTC)
Received: by mail-ot1-x336.google.com with SMTP id
 r14-20020a056830418e00b0060b8da9ff75so15304532otu.11
 for <dri-devel@lists.freedesktop.org>; Wed, 08 Jun 2022 08:21:45 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=jlekstrand-net.20210112.gappssmtp.com; s=20210112;
 h=from:to:cc:subject:date:message-id:mime-version
 :content-transfer-encoding;
 bh=E7NZR8YCQ9NPiYJrHyPmVCTYxHjExo4B+GAxgUo2wFc=;
 b=Gsxl1hr4pkmUDnmQJd1J13s18i+TqX6VSnW124BgnGCHaBl2F7ZUFsJaK9mOniU3/G
 wsDxOBpoRFgUlxXWwKmPFe/6SpNTQBzW7GefMS1vRoLYstPj4JNqMAbV8nmqc6Ew39XT
 MBvNHmJW6CPy3KuKHdy4PRVEXUnE2jR54sbGN4K2eVyVSlxcT7PRkDvwHcExWVFbesCn
 9CUp02TrvovwoR6NaZeT7kjk8wfNILFpcQhHR6KmWAQCcx8vjLOaPq0w2SHv4l8Z1ttG
 icUWqJ+0Erjdteztivbh92yHEuxxVJN5sf9X+0XTsu0Y5xowzh3Z2VGYdUn1oEKK0uDu
 CYNA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:mime-version
 :content-transfer-encoding;
 bh=E7NZR8YCQ9NPiYJrHyPmVCTYxHjExo4B+GAxgUo2wFc=;
 b=qFxDcmWSTrIVLD11LG8a0t+Qe7oAukqSVEfw5hLasVCFabrYDvd9M9EDihzCuK8f2V
 8ffe+i154cKcKzR0MIpbvEIzJ1khB9FsITXrMiUSZLpQw6k4QWM9sSqrygvAg5yVH/dt
 v9KITuNVZY38t/DuLDHqk04YlZYYdiKSrD7n2/x0kp+IbzOpCzH7yc/O1XZpJfFIKv7A
 MHa11vD5i8EzNmNEu5tZEnnIdtxix+W6cRCI5ZxJ80dDmguF366o/MkTHq7fu4texnub
 WvFD4Y/zYmbayqVkmElT+kwoLWEjBhWjQIfz4aXgi21HGq8CrdnaWq47h8/sNF4nfJKG
 NNsw==
X-Gm-Message-State: AOAM531c09jBYuRLagWPw9L69j5Wwa+08w5sXsUqyFBrcS/UZoHkb85f
 xDkxp9TRB5oCzhq6hhox3Wq4mdVorbyzRw==
X-Google-Smtp-Source: ABdhPJzjrsPbG4jz7qm0v8KSyw3IDuQ0nKxc0S1znw6plRwRf/8OKzOuGsPlpx4J4G+Z47bbHj9GrQ==
X-Received: by 2002:a9d:53cb:0:b0:60c:1f3b:7e9f with SMTP id
 i11-20020a9d53cb000000b0060c1f3b7e9fmr355329oth.110.1654701704095; 
 Wed, 08 Jun 2022 08:21:44 -0700 (PDT)
Received: from animal.lan
 (2603-8080-2102-63d7-a603-c311-740a-6dbf.res6.spectrum.com.
 [2603:8080:2102:63d7:a603:c311:740a:6dbf])
 by smtp.gmail.com with ESMTPSA id
 b185-20020aca34c2000000b0032e956162f5sm4418232oia.53.2022.06.08.08.21.43
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Wed, 08 Jun 2022 08:21:43 -0700 (PDT)
From: Jason Ekstrand <jason@jlekstrand.net>
To: dri-devel@lists.freedesktop.org
Subject: [PATCH 0/2] dma-buf: Add an API for exporting sync files (v15)
Date: Wed,  8 Jun 2022 10:21:40 -0500
Message-Id: <20220608152142.14495-1-jason@jlekstrand.net>
X-Mailer: git-send-email 2.36.1
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
Cc: Jason Ekstrand <jason@jlekstrand.net>
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

Modern userspace APIs like Vulkan are built on an explicit synchronization
model.  This doesn't always play nicely with the implicit synchronization used
in the kernel and assumed by X11 and Wayland.  The client -> compositor half
of the synchronization isn't too bad, at least on intel, because we can
control whether or not i915 synchronizes on the buffer and whether or not it's
considered written.

The harder part is the compositor -> client synchronization when we get the
buffer back from the compositor.  We're required to be able to provide the
client with a VkSemaphore and VkFence representing the point in time where the
window system (compositor and/or display) finished using the buffer.  With
current APIs, it's very hard to do this in such a way that we don't get
confused by the Vulkan driver's access of the buffer.  In particular, once we
tell the kernel that we're rendering to the buffer again, any CPU waits on the
buffer or GPU dependencies will wait on some of the client rendering and not
just the compositor.

This new IOCTL solves this problem by allowing us to get a snapshot of the
implicit synchronization state of a given dma-buf in the form of a sync file.
It's effectively the same as a poll() or I915_GEM_WAIT only, instead of CPU
waiting directly, it encapsulates the wait operation, at the current moment in
time, in a sync_file so we can check/wait on it later.  As long as the Vulkan
driver does the sync_file export from the dma-buf before we re-introduce it
for rendering, it will only contain fences from the compositor or display.
This allows to accurately turn it into a VkFence or VkSemaphore without any
over-synchronization.

This patch series actually contains two new ioctls.  There is the export one
mentioned above as well as an RFC for an import ioctl which provides the other
half.  The intention is to land the export ioctl since it seems like there's
no real disagreement on that one.  The import ioctl, however, has a lot of
debate around it so it's intended to be RFC-only for now.

Mesa MR: https://gitlab.freedesktop.org/mesa/mesa/-/merge_requests/4037
IGT tests: https://patchwork.freedesktop.org/series/90490/

v10 (Jason Ekstrand, Daniel Vetter):
 - Add reviews/acks
 - Add a patch to rename _rcu to _unlocked
 - Split things better so import is clearly RFC status

v11 (Daniel Vetter):
 - Add more CCs to try and get maintainers
 - Add a patch to document DMA_BUF_IOCTL_SYNC
 - Generally better docs
 - Use separate structs for import/export (easier to document)
 - Fix an issue in the import patch

v12 (Daniel Vetter):
 - Better docs for DMA_BUF_IOCTL_SYNC

v12 (Christian König):
 - Drop the rename patch in favor of Christian's series
 - Add a comment to the commit message for the dma-buf sync_file export
   ioctl saying why we made it an ioctl on dma-buf

v13 (Jason Ekstrand):
 - Rebase on Christian König's fence rework

v14 (Daniel Vetter and Christian König):
 - Use dma_rev_usage_rw to get the properly inverted usage to pass to
   dma_resv_get_singleton() for export
 - Clean up the sync_file and fd if copy_to_user() fails
 - Fix -EINVAL checks for the flags parameter in import
 - Add documentation about read/write fences for import
 - Add documentation about the expected usage of import/export and
   specifically call out the possible userspace race.

v15 (Simon Ser):
 - Fix a typo in the docs
 - Collect RB tags

Jason Ekstrand (2):
  dma-buf: Add an API for exporting sync files (v14)
  dma-buf: Add an API for importing sync files (v10)

 drivers/dma-buf/dma-buf.c    | 106 +++++++++++++++++++++++++++++++++++
 include/uapi/linux/dma-buf.h |  84 +++++++++++++++++++++++++++
 2 files changed, 190 insertions(+)

-- 
2.36.1

