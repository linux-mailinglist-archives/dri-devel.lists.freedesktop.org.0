Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 4A9BB51B8AC
	for <lists+dri-devel@lfdr.de>; Thu,  5 May 2022 09:24:04 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 90A2010EDFB;
	Thu,  5 May 2022 07:23:55 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-oi1-x234.google.com (mail-oi1-x234.google.com
 [IPv6:2607:f8b0:4864:20::234])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 4F60E10E4AA
 for <dri-devel@lists.freedesktop.org>; Wed,  4 May 2022 22:44:03 +0000 (UTC)
Received: by mail-oi1-x234.google.com with SMTP id v66so2678305oib.3
 for <dri-devel@lists.freedesktop.org>; Wed, 04 May 2022 15:44:03 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=jlekstrand-net.20210112.gappssmtp.com; s=20210112;
 h=from:to:cc:subject:date:message-id:mime-version
 :content-transfer-encoding;
 bh=OOjYP4V0wXKpApovQAnpNVqwORVQxcBwfZ0BST5e+0A=;
 b=IPp2h/1eGxAF4vmHEu/F7rnEBgAJ094e+tfu3d7vhTQjGzE7+k6FOQVyvE8MkLgrav
 ytq9p/yv0CnvTBZaltCGXPPq076oyDVMVF1MCDW775jbm9z+cmJ42wytUX6RH4CxhsQb
 U3ijY1xDXCE78UXol2YYAjPq0nTbuDCevn0Wx1KpHmG3NGodrlKzbf0i4+459UZiJ2N1
 AhgANMU0qP/Xnvc4NV0nc73rOuixjx5w1NRjRk9LyImbZ4Kvu7Bd0y0Fz1xpawtvq+Vs
 RebCwzj/9glmEwZiQwuFaB0XW3rimeLclF7vBeH+MDVrBx/2Nm0B8yI6F+uCV1JrwQdP
 4qBQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:mime-version
 :content-transfer-encoding;
 bh=OOjYP4V0wXKpApovQAnpNVqwORVQxcBwfZ0BST5e+0A=;
 b=TRvis+ctqBo2I4WWVNiMEqT2MkI6U1WivcbrIIZZUPsO+G+YWFbSDAhLH5TrjkZxla
 ykky7co5efPyOoM4SUKulMc45j7lFX5zIhpBdSRYhliu6C+DNchMBtPnoNInFEk6qWYF
 ccViPlHBGeCbVNxXbiSaFGHVlnPnYnTSqRVsAgXJa00QF+66R/TCzq96bil0fmKPkNgc
 a/+gj0VjO6pyrfjo+njYSSTNd3Ihod0wyxmQ2zvFO8casbxCF+/iRnSCeM88XpVaIHVK
 jFX1YuiKnh3sXv2i25B/u3+sM2iR9jGTPGnQ+At4CepzJcvfC8Kku+84k1mtQmKQYOVr
 zZwA==
X-Gm-Message-State: AOAM531F4k8zI3SN4FLr8p+ZE/BGYpOAu6B0U7FPTtf/hJ5vETkV5gvA
 vn9BCk/G+bAO3qmuxYl4HxxXg99i2fFtng==
X-Google-Smtp-Source: ABdhPJwZUftXOrB7CWC40qxdFv6a4gvLZE3xHLyIamoOCAofbDV93+X/xiFvmammdfCymzS0nEPeRQ==
X-Received: by 2002:aca:1a09:0:b0:325:90ab:a812 with SMTP id
 a9-20020aca1a09000000b0032590aba812mr942178oia.131.1651704242306; 
 Wed, 04 May 2022 15:44:02 -0700 (PDT)
Received: from animal.lan
 (2603-8080-2102-63d7-a603-c311-740a-6dbf.res6.spectrum.com.
 [2603:8080:2102:63d7:a603:c311:740a:6dbf])
 by smtp.gmail.com with ESMTPSA id
 r12-20020a54488c000000b00325cda1ffbasm54419oic.57.2022.05.04.15.44.01
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Wed, 04 May 2022 15:44:01 -0700 (PDT)
From: Jason Ekstrand <jason@jlekstrand.net>
To: dri-devel@lists.freedesktop.org
Subject: [PATCH 0/2] dma-buf: Add an API for exporting sync files (v13)
Date: Wed,  4 May 2022 17:43:47 -0500
Message-Id: <20220504224349.1499888-1-jason@jlekstrand.net>
X-Mailer: git-send-email 2.36.0
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-Mailman-Approved-At: Thu, 05 May 2022 07:23:45 +0000
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
 wayland-devel@lists.freedesktop.org, Jason Ekstrand <jason@jlekstrand.net>,
 Dave Airlie <airlied@redhat.com>, mesa-dev@lists.freedesktop.org,
 =?UTF-8?q?Christian=20K=C3=B6nig?= <christian.koenig@amd.com>
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

Cc: Christian König <christian.koenig@amd.com>
Cc: Michel Dänzer <michel@daenzer.net>
Cc: Dave Airlie <airlied@redhat.com>
Cc: Bas Nieuwenhuizen <bas@basnieuwenhuizen.nl>
Cc: Daniel Stone <daniels@collabora.com>
Cc: mesa-dev@lists.freedesktop.org
Cc: wayland-devel@lists.freedesktop.org

Jason Ekstrand (2):
  dma-buf: Add an API for exporting sync files (v13)
  dma-buf: Add an API for importing sync files (v8)

 drivers/dma-buf/dma-buf.c    | 100 +++++++++++++++++++++++++++++++++++
 include/uapi/linux/dma-buf.h |  57 ++++++++++++++++++++
 2 files changed, 157 insertions(+)

-- 
2.36.0

