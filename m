Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id CDF71A3DCCB
	for <lists+dri-devel@lfdr.de>; Thu, 20 Feb 2025 15:29:50 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 567DD10E977;
	Thu, 20 Feb 2025 14:29:48 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (1024-bit key; unprotected) header.d=redhat.com header.i=@redhat.com header.b="S8WPxhs/";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from us-smtp-delivery-124.mimecast.com
 (us-smtp-delivery-124.mimecast.com [170.10.129.124])
 by gabe.freedesktop.org (Postfix) with ESMTPS id CAA5610E977
 for <dri-devel@lists.freedesktop.org>; Thu, 20 Feb 2025 14:29:46 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1740061785;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding;
 bh=34Pwf2YzB9+5/yrq+BsahBOzUfkk/RYCd6NadSU6ifk=;
 b=S8WPxhs/QQGkF3lagxtjIkjWLBCsKQruP33dpmgxHunYZaTfrnVQvHA7jNjfDK1fmf7tV9
 x5icAP1HwE2Jmm74dHw4apxNOowbv1Q2gs35TLqaQnikWvxXU9SrBDgZqD0aV7Pc/zz78I
 Um7z1HB/+/nodboKLBd4j4rovyE2H1s=
Received: from mx-prod-mc-04.mail-002.prod.us-west-2.aws.redhat.com
 (ec2-54-186-198-63.us-west-2.compute.amazonaws.com [54.186.198.63]) by
 relay.mimecast.com with ESMTP with STARTTLS (version=TLSv1.3,
 cipher=TLS_AES_256_GCM_SHA384) id us-mta-689-Lm159x9TMkac0O8uw4CkmQ-1; Thu,
 20 Feb 2025 09:29:42 -0500
X-MC-Unique: Lm159x9TMkac0O8uw4CkmQ-1
X-Mimecast-MFC-AGG-ID: Lm159x9TMkac0O8uw4CkmQ_1740061780
Received: from mx-prod-int-08.mail-002.prod.us-west-2.aws.redhat.com
 (mx-prod-int-08.mail-002.prod.us-west-2.aws.redhat.com [10.30.177.111])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
 (No client certificate requested)
 by mx-prod-mc-04.mail-002.prod.us-west-2.aws.redhat.com (Postfix) with ESMTPS
 id 5091D1903085; Thu, 20 Feb 2025 14:29:40 +0000 (UTC)
Received: from [127.0.1.1] (unknown [10.45.225.137])
 by mx-prod-int-08.mail-002.prod.us-west-2.aws.redhat.com (Postfix) with ESMTP
 id 051A1180034D; Thu, 20 Feb 2025 14:29:32 +0000 (UTC)
From: Sergio Lopez <slp@redhat.com>
Subject: [RFC PATCH v3 0/4] virtio: obtain SHM page size from device
Date: Thu, 20 Feb 2025 15:28:49 +0100
Message-Id: <20250220-virtio-shm-page-size-v3-0-874fff6f3979@redhat.com>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
X-B4-Tracking: v=1; b=H4sIACE8t2cC/4XNOw7CMAyA4atUnjFK0gcNE/dADKFxiYeSKqkio
 OrdSTvBgBh/W/48Q6TAFOFYzBAocWR/z1HuCuicud8I2eYGJVQtlCwxcZjYY3QDjiavI78IG9J
 GtN3BkpWQT8dAPT829nzJ7ThOPjy3L0mu0z9gkiiwJpK91m1V1uIUyDoz7Ts/wCom9alUPxSVF
 WNkIzU1WrTXL2VZljc4gw4j/wAAAA==
X-Change-ID: 20250213-virtio-shm-page-size-6e9a08c7ded1
To: "Michael S. Tsirkin" <mst@redhat.com>, 
 Daniel Verkamp <dverkamp@chromium.org>, Jason Wang <jasowang@redhat.com>, 
 Xuan Zhuo <xuanzhuo@linux.alibaba.com>, 
 =?utf-8?q?Eugenio_P=C3=A9rez?= <eperezma@redhat.com>, 
 David Airlie <airlied@redhat.com>, Gerd Hoffmann <kraxel@redhat.com>, 
 Gurchetan Singh <gurchetansingh@chromium.org>, 
 Chia-I Wu <olvaffe@gmail.com>, 
 Maarten Lankhorst <maarten.lankhorst@linux.intel.com>, 
 Maxime Ripard <mripard@kernel.org>, Thomas Zimmermann <tzimmermann@suse.de>, 
 Simona Vetter <simona@ffwll.ch>, Rob Clark <robdclark@gmail.com>, 
 Dmitry Osipenko <dmitry.osipenko@collabora.com>, fnkl.kernel@gmail.com
Cc: virtualization@lists.linux.dev, linux-kernel@vger.kernel.org, 
 dri-devel@lists.freedesktop.org, Sergio Lopez <slp@redhat.com>
X-Developer-Signature: v=1; a=openpgp-sha256; l=3259; i=slp@redhat.com;
 h=from:subject:message-id; bh=UEjXDAWuT1WK+CR+e8rDydDEIw+8ZqX6zIyfhUMCRok=;
 b=owEBbQKS/ZANAwAIAfRpJ40vDAI1AcsmYgBntzxHMlmRQMk1+Erj7LL3dGYB/TVpVnTnxfhzx
 RCqrXQQTmSJAjMEAAEIAB0WIQS+1fz3US2GgJFC6KL0aSeNLwwCNQUCZ7c8RwAKCRD0aSeNLwwC
 NQO9D/9+7bcx1mUz/ccUkbJ8scz/nshK3ECZjM1epseg8bST1T7cwWA5I8q/t2hr/ewhSUVHHDs
 NUsgDcjmjDcrXHZkr5cVGSLyflxrY6r46VgteOwwYLDtiRqC6liXfKeo7sShi6assTK1DJo+6ge
 IJ5VHrxNfD5hr/8bBkTOGrP9mnJsf2Du3xrdgx2tt4KiYaSTe9pfHDALhE/agE1zZhQHt2GjI6N
 J3FNXhQ1FaNzZ5BbWZPyvU90c5eo5U8Co59swYDkhsmTEi22+gw/q8QzmCTPykK13/JMLL7OrYI
 xufHR0rF96yjQg0mUr9wh9ivqJZkeIUzIbFzV2eaSBSw7ZE/cpHZHctw7tv+JYvKZ4bISWCmPgp
 9oJScG6X2+Ac8eMRMros1OJMBD/Dxkx8qb3KBRguXGEXQmYqulSUPq0FO/aMTABtQhepQEkqBfF
 I5O7eAFjk/v8ZmxIDabqF7CFRvPqOYVYD5FmV/YBxkcfuJp1ptlxfCtP6RPTQ/MVkiDJH9ol+XA
 O3M0NHoAbhHM3CkpgQqfaxHLEKtG97g2EtqSWmHNvFni9ysuP+ZvRjwBKFYA0ErKa56/uIBoU+5
 hAclojCxkfeN+IyP171gus6FrdSMRDF4Aa1n2K95qlH5FkjzIAYo39T9mrYSrZ7hV3NhIcAQR5N
 0lZQpgUzI3ISmqA==
X-Developer-Key: i=slp@redhat.com; a=openpgp;
 fpr=BED5FCF7512D86809142E8A2F469278D2F0C0235
X-Scanned-By: MIMEDefang 3.4.1 on 10.30.177.111
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
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

There's an incresing number of machines supporting multiple page sizes
and, on these machines, the host and a guest can be running with
different pages sizes.

In addition to this, there might be devices that have a required and/or
preferred page size for mapping memory.

In this series, we extend virtio_shm_region with a field to hold the
page size. The PCI and MMIO transports are updated to read the page
shift for each region and derive the page size accordingly. For the PCI
transport we're borrowing 8 bits from the 16 bit padding, so the
transition is seamless. But for MMIO we need to access a new register,
which could potentially be interpreted by the VMM as an error. For this
reason we're gating this behavior, for every transport, behind the
VIRTIO_F_SHM_PAGE_SIZE feature bit.

How the SHM page size information is used depends on each device. Some
may silently round up allocations, some may expose this information to
userspace. This series includes a patch that extends virtio-gpu to
expose the information via the VIRTGPU_GETPARAM ioctl, as an example of
the second approach.

This patch series is an RFC because it requires changes to the VIRTIO
specifications. This patch series will be used as a reference to
propose such changes.

Signed-off-by: Sergio Lopez <slp@redhat.com>
---
Changes in v3:
- Merge patch 2 (virtio: introduce VIRTIO_F_SHM_PAGE_SIZE) into the
  changes for virtio-pci (thanks Dmitry Osipenko).
- In virtio_gpu_getparam_ioctl(), return ENOENT instead of EINVAL
  if the device lacks a host visible region (thanks Dmitry Osipenko).
- Link to v2: https://lore.kernel.org/r/20250214-virtio-shm-page-size-v2-0-aa1619e6908b@redhat.com

Changes in v2:
- Use "page_shift" instead of "page_size" in the transport-related
  structures to clarify its contents (thanks Daniel Verkamp).
- Update the command for "page_shift" in "virtio_pci_cap" to clarify
  that it's only relevant for VIRTIO_PCI_CAP_SHARED_MEMORY_CFG regions.
  (thanks Daniel Verkamp).
- Instead of a derived value, store page size in virtio_shm_region.
- Update the cover page to reflect that the functionality is gated
  behind the VIRTIO_F_SHM_PAGE_SIZE feature bit.
- Link to v1: https://lore.kernel.org/r/20250213-virtio-shm-page-size-v1-0-5ee1f9984350@redhat.com

---
Sergio Lopez (4):
      virtio: introduce VIRTIO_F_SHM_PAGE_SIZE
      virtio-pci: extend virtio_pci_cap with page_shift
      virtio-mmio: read shm region page size
      drm/virtio: add VIRTGPU_PARAM_HOST_SHM_PAGE_SIZE to params

 drivers/gpu/drm/virtio/virtgpu_ioctl.c |  5 +++++
 drivers/virtio/virtio_mmio.c           | 11 +++++++++++
 drivers/virtio/virtio_pci_modern.c     | 24 ++++++++++++++++++++----
 drivers/virtio/virtio_ring.c           |  2 ++
 include/linux/virtio_config.h          |  1 +
 include/uapi/drm/virtgpu_drm.h         |  1 +
 include/uapi/linux/virtio_config.h     |  7 ++++++-
 include/uapi/linux/virtio_mmio.h       |  3 +++
 include/uapi/linux/virtio_pci.h        |  3 ++-
 9 files changed, 51 insertions(+), 6 deletions(-)
---
base-commit: 4dc1d1bec89864d8076e5ab314f86f46442bfb02
change-id: 20250213-virtio-shm-page-size-6e9a08c7ded1

Best regards,
-- 
Sergio Lopez <slp@redhat.com>

