Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id D776D562F66
	for <lists+dri-devel@lfdr.de>; Fri,  1 Jul 2022 11:04:00 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 7380010FB0A;
	Fri,  1 Jul 2022 09:03:56 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from madras.collabora.co.uk (madras.collabora.co.uk
 [IPv6:2a00:1098:0:82:1000:25:2eeb:e5ab])
 by gabe.freedesktop.org (Postfix) with ESMTPS id A392810FB9D
 for <dri-devel@lists.freedesktop.org>; Fri,  1 Jul 2022 09:03:54 +0000 (UTC)
Received: from dimapc.. (109-252-118-164.nat.spd-mgts.ru [109.252.118.164])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
 (No client certificate requested)
 (Authenticated sender: dmitry.osipenko)
 by madras.collabora.co.uk (Postfix) with ESMTPSA id 4702766015B2;
 Fri,  1 Jul 2022 10:03:52 +0100 (BST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=collabora.com;
 s=mail; t=1656666233;
 bh=oOZf0LBfOP2Mrd3kKdfyQSfqWEThXNW2359k+fuby8k=;
 h=From:To:Cc:Subject:Date:From;
 b=g/ZoW+eXIu7Ti6gYKeb8pEQXflxFZnZtIgcDJCDmjroTBaTPeja2pKbeaIAjYymTd
 KILCpbkQSCCJXeFo58JBWy7iHoru61NtEyGNJ2bbKudDblMl7ZQ3o6ld1kTArsXvnc
 ukDXgP30Lea0adEDSIbT1mIAaj71TSffSXe6kNNPbumqNusmWLq84VCzKVf+fRvNE9
 t3FqRFroAFay5VZ0jYDkAoQyEgI/7TXu7L4ob/oaSLlQN2ylLvojj33ljEkzIzP9DF
 9YlSvXFkv2+VmP23itjJZgqQUsLsixQMR/XNII8UxlTU/Sanz/obTLqXGq84pk1tY0
 KIpg5seL4xU5Q==
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
Subject: [PATCH v8 0/2] DRM GEM fixes
Date: Fri,  1 Jul 2022 12:02:38 +0300
Message-Id: <20220701090240.1896131-1-dmitry.osipenko@collabora.com>
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

v8: - Dropped stable tag from the "Don't map imported GEMs" patch,
      like was suggested by Thomas Hellström in the review comment to v7.

v7: - Factored out GEM patches from [1] since I'll be working on the
      dma-buf locking in a separate patchset now.

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

