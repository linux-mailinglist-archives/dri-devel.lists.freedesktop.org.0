Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id D0E4D5623C9
	for <lists+dri-devel@lfdr.de>; Thu, 30 Jun 2022 22:04:45 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id B568B10E4BF;
	Thu, 30 Jun 2022 20:04:43 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from madras.collabora.co.uk (madras.collabora.co.uk [46.235.227.172])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 271E510E4BF
 for <dri-devel@lists.freedesktop.org>; Thu, 30 Jun 2022 20:04:42 +0000 (UTC)
Received: from dimapc.. (109-252-118-164.nat.spd-mgts.ru [109.252.118.164])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
 (No client certificate requested)
 (Authenticated sender: dmitry.osipenko)
 by madras.collabora.co.uk (Postfix) with ESMTPSA id 5A5D9660196E;
 Thu, 30 Jun 2022 21:04:39 +0100 (BST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=collabora.com;
 s=mail; t=1656619480;
 bh=V1SHbcWB2a7VYQPoJZtKapo1RnxYVO0PZCoH59y/TXc=;
 h=From:To:Cc:Subject:Date:From;
 b=YlUV6dFWQJG4Fv6Rj5expKG4LJrhePHQ4dwS9cS7fJi16AElKQLL8jX1Ci+ffZTXG
 X3z6vG3N6f/7afzrYA5YabQkIsO0+x3t8y+nP1g1GOSsOE7up/5y88B6b2uv6Fkr+w
 KJzebLf1l+K/mkXB6NGzknoRizo18EjUxJzEfTHVMOqL3r7YO1aHI5g2KVckKRnG6p
 5pt0A14oyMSOMY0uxncJOWdydSeOYtZ1aBnJX50jmtYkUDfUHMeB+LYFGNGsFpY/E6
 t2YZchG+C6sesFOzLVjULRVIjnCaGtoUrlOi5zBd1EGSWEMpDC0W8LR4DAEwoydNCr
 IsMRFFpO4FOJg==
From: Dmitry Osipenko <dmitry.osipenko@collabora.com>
To: David Airlie <airlied@linux.ie>, Gerd Hoffmann <kraxel@redhat.com>,
 Gurchetan Singh <gurchetansingh@chromium.org>,
 Chia-I Wu <olvaffe@gmail.com>, Daniel Vetter <daniel@ffwll.ch>,
 Maarten Lankhorst <maarten.lankhorst@linux.intel.com>,
 Maxime Ripard <mripard@kernel.org>,
 Thomas Zimmermann <tzimmermann@suse.de>,
 Emil Velikov <emil.l.velikov@gmail.com>,
 =?UTF-8?q?Christian=20K=C3=B6nig?= <christian.koenig@amd.com>,
 =?UTF-8?q?Thomas=20Hellstr=C3=B6m?= <thomas_os@shipmail.org>
Subject: [PATCH v7 0/2] DRM GEM fixes
Date: Thu, 30 Jun 2022 23:04:03 +0300
Message-Id: <20220630200405.1883897-1-dmitry.osipenko@collabora.com>
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
Cc: linux-kernel@vger.kernel.org, dri-devel@lists.freedesktop.org,
 virtualization@lists.linux-foundation.org, linux-tegra@vger.kernel.org,
 Dmitry Osipenko <digetx@gmail.com>, kernel@collabora.com
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

This patchset fixes two problems in the common GEM code. First fixed problem
is the bogus lockdep splat that complicates debugging of DRM drivers. Second
problem is the inconsistency in behaviour and improper handling of mapping
the imported GEMs by some drivers, to fix it we will prohibit to map the
imported GEMs like majority of drivers already do.

Changelog:

v7: - Factored out GEM patches from [1] since I'll be working on the
      dma-buf locking in a separate patchsets now.

[1] https://lore.kernel.org/all/20220526235040.678984-1-dmitry.osipenko@collabora.com/

    - Improved commit message and added fixes tag to the "Properly annotate
      WW context" patch.

    - Replaced "Move mapping of imported dma-bufs to drm_gem_mmap_obj()"
      patch with "Don't map imported GEMs", like was suggested by
      Thomas Hellström.

    - Added r-b and suggested-by from Thomas Hellström.

Dmitry Osipenko (2):
  drm/gem: Properly annotate WW context on drm_gem_lock_reservations()
    error
  drm/gem: Don't map imported GEMs

 drivers/gpu/drm/drm_gem.c              | 8 ++++++--
 drivers/gpu/drm/drm_gem_shmem_helper.c | 9 ---------
 2 files changed, 6 insertions(+), 11 deletions(-)

-- 
2.36.1

