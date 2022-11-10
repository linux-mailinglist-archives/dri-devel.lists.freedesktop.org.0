Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 6E0A5624B5D
	for <lists+dri-devel@lfdr.de>; Thu, 10 Nov 2022 21:15:02 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id A2AE310E829;
	Thu, 10 Nov 2022 20:14:56 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from madras.collabora.co.uk (madras.collabora.co.uk
 [IPv6:2a00:1098:0:82:1000:25:2eeb:e5ab])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 870C210E832;
 Thu, 10 Nov 2022 20:14:50 +0000 (UTC)
Received: from dimapc.. (unknown [109.252.117.140])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
 (No client certificate requested)
 (Authenticated sender: dmitry.osipenko)
 by madras.collabora.co.uk (Postfix) with ESMTPSA id 19FBD660035C;
 Thu, 10 Nov 2022 20:14:47 +0000 (GMT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=collabora.com;
 s=mail; t=1668111289;
 bh=1CE2XRZ5gwUkawW6nA0IR/hqxUlaRPTZF6KuqbnAdK4=;
 h=From:To:Cc:Subject:Date:From;
 b=Pj5kMSE9GqU5pIod/hV/hQiqGrn1Pc82jV7zEoc3SPd49PVIzcSZtKB39PBIrJQfb
 slEMr55FoMedpN9OLyjLQUhkBaKsaedxt8g861x65hMcOuNc1EZ0tenq9K/+lRFSCv
 6+N7I7KZHrq6w8JR7W/PkV/fbamPiDjKTFEBCZ843qXcAqj4Aske+v6OrVaT4WmHEn
 +O+YE8LCEqryYWmjsWquLHzHT7NNVjQsKTnNxMZ8OH4Zp3fxvBjFGES+SX6W+AtGfj
 LNmCjLz5cLOmPsp1J1pRKVECoWq3h3DH1kLQLg2LFr/VwQNJ3nRGXV9Tnidn22xWvB
 Ogmwwq6CY1ZRQ==
From: Dmitry Osipenko <dmitry.osipenko@collabora.com>
To: Sumit Semwal <sumit.semwal@linaro.org>,
 =?UTF-8?q?Christian=20K=C3=B6nig?= <christian.koenig@amd.com>,
 Benjamin Gaignard <benjamin.gaignard@collabora.com>,
 Liam Mark <lmark@codeaurora.org>, Brian Starkey <Brian.Starkey@arm.com>,
 John Stultz <jstultz@google.com>, Gerd Hoffmann <kraxel@redhat.com>,
 Daniel Vetter <daniel@ffwll.ch>, Jani Nikula <jani.nikula@linux.intel.com>,
 Joonas Lahtinen <joonas.lahtinen@linux.intel.com>,
 Rodrigo Vivi <rodrigo.vivi@intel.com>,
 Tvrtko Ursulin <tvrtko.ursulin@linux.intel.com>,
 Thomas Zimmermann <tzimmermann@suse.de>, Tomi Valkeinen <tomba@kernel.org>,
 Thierry Reding <thierry.reding@gmail.com>,
 Tomasz Figa <tfiga@chromium.org>,
 Marek Szyprowski <m.szyprowski@samsung.com>,
 Mauro Carvalho Chehab <mchehab@kernel.org>,
 Srinivas Kandagatla <srinivas.kandagatla@linaro.org>,
 Amol Maheshwari <amahesh@qti.qualcomm.com>
Subject: [PATCH v1 0/6] Move dma_buf_mmap_internal() to dynamic locking
 specification
Date: Thu, 10 Nov 2022 23:13:43 +0300
Message-Id: <20221110201349.351294-1-dmitry.osipenko@collabora.com>
X-Mailer: git-send-email 2.37.3
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
Cc: linux-arm-msm@vger.kernel.org, intel-gfx@lists.freedesktop.org,
 linux-kernel@vger.kernel.org, dri-devel@lists.freedesktop.org,
 linux-tegra@vger.kernel.org, kernel@collabora.com, linux-media@vger.kernel.org
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

Hello,

Recently, dma-buf got a common locking convention for importers and
exporters. All the dma-buf functions were moved to the new locking
convention, apart from the dma_buf_mmap_internal() that was missed out
by accident. This series moves dma_buf_mmap_internal() to the dynamic
locking specification and updates drivers that support mmaping of
dma-bufs to use the debug-assert of the lock.

Thanks to Daniel Vetter for spotting the missed function!

Dmitry Osipenko (6):
  dma-buf: Move dma_buf_mmap_internal() to dynamic locking specification
  drm: Assert held reservation lock for dma-buf mmapping
  udmabuf: Assert held reservation lock for dma-buf mmapping
  dma-buf/heaps: Assert held reservation lock for dma-buf mmapping
  media: videobuf2: Assert held reservation lock for dma-buf mmapping
  fastrpc: Assert held reservation lock for dma-buf mmapping

 drivers/dma-buf/dma-buf.c                             | 7 ++++++-
 drivers/dma-buf/heaps/cma_heap.c                      | 3 +++
 drivers/dma-buf/heaps/system_heap.c                   | 3 +++
 drivers/dma-buf/udmabuf.c                             | 3 +++
 drivers/gpu/drm/drm_prime.c                           | 2 ++
 drivers/gpu/drm/i915/gem/i915_gem_dmabuf.c            | 2 ++
 drivers/gpu/drm/omapdrm/omap_gem_dmabuf.c             | 2 ++
 drivers/gpu/drm/tegra/gem.c                           | 2 ++
 drivers/media/common/videobuf2/videobuf2-dma-contig.c | 3 +++
 drivers/media/common/videobuf2/videobuf2-dma-sg.c     | 3 +++
 drivers/media/common/videobuf2/videobuf2-vmalloc.c    | 3 +++
 drivers/misc/fastrpc.c                                | 3 +++
 12 files changed, 35 insertions(+), 1 deletion(-)

-- 
2.37.3

