Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 54E16A3E7A6
	for <lists+dri-devel@lfdr.de>; Thu, 20 Feb 2025 23:41:06 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 27A7610E9E6;
	Thu, 20 Feb 2025 22:41:04 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (1024-bit key; unprotected) header.d=redhat.com header.i=@redhat.com header.b="YEWe2GK/";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from us-smtp-delivery-124.mimecast.com
 (us-smtp-delivery-124.mimecast.com [170.10.129.124])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 83B5410E9E6
 for <dri-devel@lists.freedesktop.org>; Thu, 20 Feb 2025 22:41:02 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1740091261;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding;
 bh=J5LpLD6cTC7YmXPFF3jLaaukEkMquqSf1+9EQ43LXwI=;
 b=YEWe2GK/b4XN0I2H68HOyOl6zxo8tHATURWHDfoywC0qCdpCDG2POjTOSQ1Z9BZNY6KN2K
 mL6Lmy4JPB02Z05bLnMe6sjyUWMihmJzwy6WRuFTMDGDrgfp0RnO5OTk5JCIaJLX9caN3x
 FlyAX0K2LlAC7qNINELMAyJpRvOawrM=
Received: from mx-prod-mc-01.mail-002.prod.us-west-2.aws.redhat.com
 (ec2-54-186-198-63.us-west-2.compute.amazonaws.com [54.186.198.63]) by
 relay.mimecast.com with ESMTP with STARTTLS (version=TLSv1.3,
 cipher=TLS_AES_256_GCM_SHA384) id us-mta-17-iANXzaygMg2TP7RitqHV-g-1; Thu,
 20 Feb 2025 17:40:58 -0500
X-MC-Unique: iANXzaygMg2TP7RitqHV-g-1
X-Mimecast-MFC-AGG-ID: iANXzaygMg2TP7RitqHV-g_1740091256
Received: from mx-prod-int-06.mail-002.prod.us-west-2.aws.redhat.com
 (mx-prod-int-06.mail-002.prod.us-west-2.aws.redhat.com [10.30.177.93])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
 (No client certificate requested)
 by mx-prod-mc-01.mail-002.prod.us-west-2.aws.redhat.com (Postfix) with ESMTPS
 id DAFDC19373DC; Thu, 20 Feb 2025 22:40:55 +0000 (UTC)
Received: from [127.0.1.1] (unknown [10.44.32.26])
 by mx-prod-int-06.mail-002.prod.us-west-2.aws.redhat.com (Postfix) with ESMTP
 id EF92E1800362; Thu, 20 Feb 2025 22:40:47 +0000 (UTC)
From: Sergio Lopez <slp@redhat.com>
Subject: [RFC PATCH v4 0/4] virtio: obtain SHM page size from device
Date: Thu, 20 Feb 2025 23:40:29 +0100
Message-Id: <20250220-virtio-shm-page-size-v4-0-ddaed7b6f734@redhat.com>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
X-B4-Tracking: v=1; b=H4sIAF2vt2cC/4XNSw7CIBCA4as0rMXw6ANceQ/jAssgs6htoCFq0
 7tLu6oxjct/JvPNRCIEhEhOxUQCJIzYP3KUh4K03jzuQNHmJoKJigkuacIwYk+j7+hg8jriG2g
 N2jDVNhYsJ/l0CODwubKXa26PcezDa/2S+DL9AyZOGa0AuNNalbJi5wDWm/HY9h1ZxCS2Srmji
 KwYw2uuodZM3X4UuVEE21FkVlRTOudqJ3Wjv5R5nj93Mzs9RQEAAA==
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
X-Developer-Signature: v=1; a=openpgp-sha256; l=3549; i=slp@redhat.com;
 h=from:subject:message-id; bh=EIrBcICY0nrw3MiybWqAJxN/+0dIBBq+xKit13UVocY=;
 b=owEBbQKS/ZANAwAIAfRpJ40vDAI1AcsmYgBnt69qjlgonWU9HEStbjBbIjyYw0uN/m6xlT0Xi
 gl3E7bgyviJAjMEAAEIAB0WIQS+1fz3US2GgJFC6KL0aSeNLwwCNQUCZ7evagAKCRD0aSeNLwwC
 NbIkEACEE1+9IXPhjSFvatetiBQqLdx5UGlmuYMV1/kU25PHSvKTzrDfJkHYkhrRr1xY7l6WCow
 kIPQyZacDGJnM6LnwXVen3p5L6/KlONB8bMY6gqKWqdswmeJkRQj+YgctanZzyz2GGh94o45p0H
 uRnMOu+BcnmpcwIAo5dlHOfRA2eUDIjRoANeRowVfP66WqFhHugT4qccAKxZmtD08dS55eBIog7
 uOBwBZ4Twjw5ecVVZlhJiQBW2I9xSUuNxILXJHnU7cDAmVLSVOHRUQ9Ye1aimifr8K+5i6vuO8i
 BS/CSwMzljEmhRJWangGEQ/TR4F3EtEKjX10dUo2v1E9ucHzg7C1s+hlCWQtww73hfclun9SFKq
 mk59upsekuZ7v0ucw4WyZFcUFiC4BdSWiqZoKb5aKgExs/WcXY7QIEfPXleQwiaoPwoK/VQI2f9
 CDGIoURjN1nlZXy54syyaX9HxL8qbkPGZXlXOEwQlpDBhGOQiS7Qc16hh2UiC9DdPAXjAg85fH3
 HynYL2FhGB6B9scXwZoGtOGqdDTViKSsxCBdTVUgLA+CFFOAPMPYGBlbJcwmB2NlkPbXqND5/cB
 71JmyEsW2FXYCGrxSPmyPXfiFqDIDcASd/oLAmgBaw+hQNJUJyN4A6ZdzcrevAzOXnkLQ9CKCKZ
 blRpRhEN0VHolbQ==
X-Developer-Key: i=slp@redhat.com; a=openpgp;
 fpr=BED5FCF7512D86809142E8A2F469278D2F0C0235
X-Scanned-By: MIMEDefang 3.4.1 on 10.30.177.93
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
Changes in v4:
- Validate page_shift before deriving the page size from it
  (thanks Daniel Verkamp).
- Use an unsigned integer in left shift (thanks Daniel Verkamp).
- Link to v3: https://lore.kernel.org/r/20250220-virtio-shm-page-size-v3-0-874fff6f3979@redhat.com

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
 drivers/virtio/virtio_mmio.c           | 20 ++++++++++++++++++++
 drivers/virtio/virtio_pci_modern.c     | 32 ++++++++++++++++++++++++++++----
 drivers/virtio/virtio_ring.c           |  2 ++
 include/linux/virtio_config.h          |  1 +
 include/uapi/drm/virtgpu_drm.h         |  1 +
 include/uapi/linux/virtio_config.h     |  7 ++++++-
 include/uapi/linux/virtio_mmio.h       |  3 +++
 include/uapi/linux/virtio_pci.h        |  3 ++-
 9 files changed, 68 insertions(+), 6 deletions(-)
---
base-commit: 4dc1d1bec89864d8076e5ab314f86f46442bfb02
change-id: 20250213-virtio-shm-page-size-6e9a08c7ded1

Best regards,
-- 
Sergio Lopez <slp@redhat.com>

