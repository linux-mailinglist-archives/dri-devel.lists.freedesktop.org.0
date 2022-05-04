Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 7FEA251B8A9
	for <lists+dri-devel@lfdr.de>; Thu,  5 May 2022 09:23:58 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 9362A10E4A1;
	Thu,  5 May 2022 07:23:47 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-oa1-x2d.google.com (mail-oa1-x2d.google.com
 [IPv6:2001:4860:4864:20::2d])
 by gabe.freedesktop.org (Postfix) with ESMTPS id EFD6C10ED42
 for <dri-devel@lists.freedesktop.org>; Wed,  4 May 2022 20:34:12 +0000 (UTC)
Received: by mail-oa1-x2d.google.com with SMTP id
 586e51a60fabf-e2fa360f6dso2391467fac.2
 for <dri-devel@lists.freedesktop.org>; Wed, 04 May 2022 13:34:12 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=jlekstrand-net.20210112.gappssmtp.com; s=20210112;
 h=from:to:cc:subject:date:message-id:mime-version
 :content-transfer-encoding;
 bh=OOjYP4V0wXKpApovQAnpNVqwORVQxcBwfZ0BST5e+0A=;
 b=k/2cSu+EYavJsq/8rb3GTURA9lf1CYJGzZfKd6y6oOQQ1bOTPIw3va6eygi/uET6sL
 OsE9iZOUnMQY6bEREk4EiipyjuYQGPQxX+gJ+lM2rPcphk8aOPiMGIMKeSlBLTEADb1G
 uSY+oMX43dtH7pQ1exEboWLMWToO4EZ1Ny+Sp2Bxqq0N2clWaUgDTns8BeMk5Y1bDrkG
 8qU3FZj/78ov1P9zcJDrdxu5PUrFx976utSICN6L2A1WiTz2ySgQfMeXpkV1mMqjNYXs
 o5lSDW/v4QIVl2qV1RvI4wFo5btxqal4JrSk0dCPu4U7MyTlzCMHKAzRDBMLbcF84zqG
 dudw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:mime-version
 :content-transfer-encoding;
 bh=OOjYP4V0wXKpApovQAnpNVqwORVQxcBwfZ0BST5e+0A=;
 b=O1ax1grzH33+TfMCLjCAw3HHvOjtLeQZnzyJt/wISFhYqqv3HlqYhtgNa2FB1KVQLh
 k144edR/KzKHpXSPJgdwNedrX9r3MQP+grhJih2ryYKk9xm9QrMwXwyt4QbdjyedYuxH
 /Iv9phyERYgMqCwAKLxDmFq6qsWg8VCUq2n5Q+6jVkNZY6sCO1T8RJ0yadXp2qgac+Az
 7ffYOXpVqjciM31z0bV5Tlidzw6KS4k3LUenk0RC6lZx5YzsD7nFPqbjO2ZwFkTulCqR
 HQv4P22O+xqAAt4QWeDCcoa30E+tLk6dwTDaw3GU/oGO7hlrnKq7Kn20UknGjk1K9qAA
 4exg==
X-Gm-Message-State: AOAM530SiHWlh7Ro9/qGeQ8/6US88GIP1ipR5v90Lb2lsWEwrULaN2G+
 lMHhSZDSqPu7M37ZimsknqDDEG8WU3FSAg==
X-Google-Smtp-Source: ABdhPJxhho+TI0DVXB5lVtAOcHQEb3S6A53ar0J4BPt0ilNBI6BC1zFIbQmEvzoFq6AE4EHrQ7+jWA==
X-Received: by 2002:a05:6870:4581:b0:e2:77aa:54ac with SMTP id
 y1-20020a056870458100b000e277aa54acmr676210oao.190.1651696451953; 
 Wed, 04 May 2022 13:34:11 -0700 (PDT)
Received: from animal.lan
 (2603-8080-2102-63d7-a603-c311-740a-6dbf.res6.spectrum.com.
 [2603:8080:2102:63d7:a603:c311:740a:6dbf])
 by smtp.gmail.com with ESMTPSA id
 v3-20020acade03000000b003263cf0f282sm1682085oig.26.2022.05.04.13.34.10
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Wed, 04 May 2022 13:34:11 -0700 (PDT)
From: Jason Ekstrand <jason@jlekstrand.net>
To: dri-devel@lists.freedesktop.org
Subject: [PATCH 0/2] *dma-buf: Add an API for exporting sync files (v13)
Date: Wed,  4 May 2022 15:34:02 -0500
Message-Id: <20220504203404.1495485-1-jason@jlekstrand.net>
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

