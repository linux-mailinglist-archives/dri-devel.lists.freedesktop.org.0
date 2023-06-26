Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id AB30B73DE61
	for <lists+dri-devel@lfdr.de>; Mon, 26 Jun 2023 14:03:04 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id A2D0410E1E9;
	Mon, 26 Jun 2023 12:02:58 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from madras.collabora.co.uk (madras.collabora.co.uk
 [IPv6:2a00:1098:0:82:1000:25:2eeb:e5ab])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 7168010E1E8
 for <dri-devel@lists.freedesktop.org>; Mon, 26 Jun 2023 12:02:56 +0000 (UTC)
Received: from localhost.localdomain (unknown
 [IPv6:2a01:e0a:2c:6930:5cf4:84a1:2763:fe0d])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
 (No client certificate requested) (Authenticated sender: bbrezillon)
 by madras.collabora.co.uk (Postfix) with ESMTPSA id A5854660710D;
 Mon, 26 Jun 2023 13:02:53 +0100 (BST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=collabora.com;
 s=mail; t=1687780973;
 bh=76WPhB+xZoYnNaREY346vATXxLxI7BeiIlwUbfACYVc=;
 h=From:To:Cc:Subject:Date:From;
 b=jZQriCkQ9tS4UvuIqHC4WTNEl6ga+xGGNWpRevLLrg6wJo7avfKvbrvCqjYQuxC+5
 EhkrDxav9xWWx5hSvZ3UP9gQAR/gnoL73iUtiBIntKQaFwksbLW41zTtiPHdot6RRr
 dVYO5JhFZt1Y9hJWj1hHVedym8LzXaGzXbPAsTbMTZFAmlmKsV6QCOSrBbl3kcSoK2
 jbDDizhPEHHVR4Zu+p1R3tr3iSdX055jCRXoP1ez8vxV3t1cqHCiK/fnghC9KElgd9
 y4FCKE8TnMB1NvtaiNe3dQ2vLCFYdHEnKQ90hl+MFlFy/pJ8axMKZQgiooTYvXCV8t
 igUcwGd4KaROw==
From: Boris Brezillon <boris.brezillon@collabora.com>
To: dri-devel@lists.freedesktop.org
Subject: [PATCH 0/5] drm/shmem-helper: Follow-up on 'Switch to reservation
 lock'
Date: Mon, 26 Jun 2023 14:02:42 +0200
Message-ID: <20230626120247.1337962-1-boris.brezillon@collabora.com>
X-Mailer: git-send-email 2.41.0
MIME-Version: 1.0
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
Cc: Dmitry Osipenko <dmitry.osipenko@collabora.com>,
 Boris Brezillon <boris.brezillon@collabora.com>,
 Emil Velikov <emil.l.velikov@gmail.com>,
 Thomas Zimmermann <tzimmermann@suse.de>
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

Hello,

As mentioned here [1], after rebasing some of my work on
drm-misc-next this morning I noticed that the
drm_gem_shmem_get_pages() I was using to pin pages to a GEM no longer
exists, so I ended up looking at 21aa27ddc582 ("drm/shmem-helper: Switch
to reservation lock") and came up with a few changes to help clarify
the situation.

Note that we will soon need to have drm_gem_shmem_[un]pin_locked()
exposed for the PowerVR and new Mali drivers so we can pin memory
after we've acquired the GEM locks using drm_exec. Not entirely sure
if this should take the form of some generic
drm_gem_[un]pin[_unlocked]() helpers like we have for v[un]map()
operations, or if this should stay shmem-specific.

Regards,

Boris

[1]https://patchwork.freedesktop.org/patch/539994/

Cc: Daniel Vetter <daniel@ffwll.ch>
Cc: Thomas Zimmermann <tzimmermann@suse.de>
Cc: Emil Velikov <emil.l.velikov@gmail.com>
Cc: Dmitry Osipenko <dmitry.osipenko@collabora.com>

Boris Brezillon (5):
  drm/panfrost: Stop using drm_gem_shmem_put_pages()
  drm/shmem-helper: Stop exposing drm_gem_shmem_put_pages()
  drm/shmem-helper: Inline drm_gem_shmem_{get,put}_pages()
  drm/shmem-helper: Make dma_resv_assert_held() unconditional in
    drm_gem_shmem_v[un]map()
  drm/shmem-helper: Clarify drm_gem_shmem_v[un]map() usage

 drivers/gpu/drm/drm_gem_shmem_helper.c  | 125 +++++++++++-------------
 drivers/gpu/drm/panfrost/panfrost_mmu.c |  13 ++-
 include/drm/drm_gem_shmem_helper.h      |   1 -
 3 files changed, 64 insertions(+), 75 deletions(-)

-- 
2.41.0

