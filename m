Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 24B6451E74A
	for <lists+dri-devel@lfdr.de>; Sat,  7 May 2022 15:18:35 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 5C6721132C2;
	Sat,  7 May 2022 13:18:20 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-ot1-x335.google.com (mail-ot1-x335.google.com
 [IPv6:2607:f8b0:4864:20::335])
 by gabe.freedesktop.org (Postfix) with ESMTPS id EA77310EFA8
 for <dri-devel@lists.freedesktop.org>; Fri,  6 May 2022 18:02:20 +0000 (UTC)
Received: by mail-ot1-x335.google.com with SMTP id
 31-20020a9d0822000000b00605f1807664so5425642oty.3
 for <dri-devel@lists.freedesktop.org>; Fri, 06 May 2022 11:02:20 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=jlekstrand-net.20210112.gappssmtp.com; s=20210112;
 h=from:to:cc:subject:date:message-id:mime-version
 :content-transfer-encoding;
 bh=g9m0SfeQX8ce1uzyJAY5naLU6+G6VPskeL7viaqU6cU=;
 b=PXzvjz0yiteSNzzJUDbZqNYFIsiqi5CwhwjIatvd9SiidHIggPfwSYGJj6MvjhAPCs
 tg8fPibgIrATxhNHES9MBYfvfvI/t9gTrhRBYv1YtTaz994rPeOmOkbXZFAUpECfOjA7
 EugnMlqKXFgBtcU/+6JAznygzEW5vIGV78CU52UsB7ju8yYwsgwdNPdcYwpDN56zfZJk
 TClOn6+m8EdA3TMFXkvCRBSogvmeBGHY14DYYvLtXqXgLLFZDxxu0CpAsZEcLmHgAyp4
 9J1Er+EsFjx/6WOB8PHyxRiBsFZlKw7g34Slz4Puiw4WjU4ytZpG9cICQUbOchpxbrCX
 o7Qg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:mime-version
 :content-transfer-encoding;
 bh=g9m0SfeQX8ce1uzyJAY5naLU6+G6VPskeL7viaqU6cU=;
 b=BRui2H43TTGtufzVCw7Z9kqf0kBUth0Ib9Dua8IfmtSPl2hM74YKtpYRdbXzU/zAsf
 8O4Pd6X1BxeJzam6sQOfZEx2Bo0rqjbSKapsGz/JHQXCsnEewJ1/yy7JRjAr+PZU7wZF
 gxWcBjninFPmB4tjDl+pCDc2NES0Z20Say9Eyb6s0JkwUthfgRh8VpE7ohpgAJ5XDnvH
 S2X4HyVu4ca5PmW0W5+ei2aY/4MYLwjPH7tHLFnaV0/sKe02Iq7595HbZyrdcZvQPfrV
 LRabVyFl6eY9drYWtQq8d3ZhPg6NKqwmtw71X1EyuoNfx+yU4+YIF01EpnTS1IvcE8iC
 kQfA==
X-Gm-Message-State: AOAM531l7971TtDahFO+IKEyssjAOMUcjOlibat6pnst2Wp3eJZvKkWw
 PHhdql0uAo7KQwWpKcKPSVRS2mig85Vs4g==
X-Google-Smtp-Source: ABdhPJyGCeOaz0Wp5RiCMvkeqSRVdYu647B2wFFaT75mluVKgUp7VMTt98WYyoze8Ws8FEXZ77SJKA==
X-Received: by 2002:a9d:7999:0:b0:606:34a:4203 with SMTP id
 h25-20020a9d7999000000b00606034a4203mr1489596otm.94.1651860139723; 
 Fri, 06 May 2022 11:02:19 -0700 (PDT)
Received: from animal.lan
 (2603-8080-2102-63d7-a603-c311-740a-6dbf.res6.spectrum.com.
 [2603:8080:2102:63d7:a603:c311:740a:6dbf])
 by smtp.gmail.com with ESMTPSA id
 a32-20020a9d2623000000b006060322123csm1840998otb.12.2022.05.06.11.02.18
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Fri, 06 May 2022 11:02:18 -0700 (PDT)
From: Jason Ekstrand <jason@jlekstrand.net>
To: dri-devel@lists.freedesktop.org
Subject: [PATCH 0/2] dma-buf: Add an API for exporting sync files (v14)
Date: Fri,  6 May 2022 13:02:14 -0500
Message-Id: <20220506180216.2095060-1-jason@jlekstrand.net>
X-Mailer: git-send-email 2.36.0
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-Mailman-Approved-At: Sat, 07 May 2022 13:18:19 +0000
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

Jason Ekstrand (2):
  dma-buf: Add an API for exporting sync files (v14)
  dma-buf: Add an API for importing sync files (v9)

 drivers/dma-buf/dma-buf.c    | 106 +++++++++++++++++++++++++++++++++++
 include/uapi/linux/dma-buf.h |  84 +++++++++++++++++++++++++++
 2 files changed, 190 insertions(+)

-- 
2.36.0

