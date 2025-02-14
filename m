Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id CAB5CA36144
	for <lists+dri-devel@lfdr.de>; Fri, 14 Feb 2025 16:17:25 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id A04EB10ECDD;
	Fri, 14 Feb 2025 15:17:23 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (1024-bit key; unprotected) header.d=redhat.com header.i=@redhat.com header.b="A+rh6DFI";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from us-smtp-delivery-124.mimecast.com
 (us-smtp-delivery-124.mimecast.com [170.10.129.124])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 28C1010ECDD
 for <dri-devel@lists.freedesktop.org>; Fri, 14 Feb 2025 15:17:22 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1739546241;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding;
 bh=Bm3yPaKny4y1a4wn4hjcXyuIFC/DbFK31ecJtKtC8CY=;
 b=A+rh6DFIWyj+gl/INB9hTBjq1LGwx06SUzXl3EDnT6IBURUuOejQfZWNu6KPtsQ0MPhr0s
 kw7lm7xtL5DE9AKVlWxIvjZAEfzV0v9aEarXS0TQQMOEVgOsbWqAUb1TQ2fNtIveAPLyoH
 Q6182OhC4ekNucZ+i3HWU+Ig3mqaTps=
Received: from mx-prod-mc-08.mail-002.prod.us-west-2.aws.redhat.com
 (ec2-35-165-154-97.us-west-2.compute.amazonaws.com [35.165.154.97]) by
 relay.mimecast.com with ESMTP with STARTTLS (version=TLSv1.3,
 cipher=TLS_AES_256_GCM_SHA384) id us-mta-595-nAru-cGAMM6QP76sQBfVCg-1; Fri,
 14 Feb 2025 10:17:15 -0500
X-MC-Unique: nAru-cGAMM6QP76sQBfVCg-1
X-Mimecast-MFC-AGG-ID: nAru-cGAMM6QP76sQBfVCg_1739546234
Received: from mx-prod-int-03.mail-002.prod.us-west-2.aws.redhat.com
 (mx-prod-int-03.mail-002.prod.us-west-2.aws.redhat.com [10.30.177.12])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
 (No client certificate requested)
 by mx-prod-mc-08.mail-002.prod.us-west-2.aws.redhat.com (Postfix) with ESMTPS
 id 5C7861801A0D; Fri, 14 Feb 2025 15:17:13 +0000 (UTC)
Received: from [127.0.1.1] (unknown [10.45.225.8])
 by mx-prod-int-03.mail-002.prod.us-west-2.aws.redhat.com (Postfix) with ESMTP
 id 32F8919373C4; Fri, 14 Feb 2025 15:17:05 +0000 (UTC)
From: Sergio Lopez <slp@redhat.com>
Subject: [RFC PATCH v2 0/5] virtio: obtain SHM page size from device
Date: Fri, 14 Feb 2025 16:16:54 +0100
Message-Id: <20250214-virtio-shm-page-size-v2-0-aa1619e6908b@redhat.com>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
X-B4-Tracking: v=1; b=H4sIAGZer2cC/4WNQQ7CIBBFr9LM2jFARUtX3sN0QcpUZtHSQEPUh
 ruLvYDL93/++zskikwJ+maHSJkTh6WCOjUwers8CdlVBiWUFkq2mDluHDD5GVdb68QfwisZK7r
 x5shJqNM10sSvQ/sYKntOW4jv4yXLX/pHmCUK1ERyMqa7tFrcIzlvt/MYZhhKKV9XI3N+uQAAA
 A==
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
X-Developer-Signature: v=1; a=openpgp-sha256; l=2945; i=slp@redhat.com;
 h=from:subject:message-id; bh=LawTWS7KOXk3HVDTnMegANC7KH7FoN89BtX6z8oH154=;
 b=owEBbQKS/ZANAwAIAfRpJ40vDAI1AcsmYgBnr15rLEbtSDv1wv6zy9aRQxVCJWKd6CqI6u8yW
 fu5t99W2b+JAjMEAAEIAB0WIQS+1fz3US2GgJFC6KL0aSeNLwwCNQUCZ69eawAKCRD0aSeNLwwC
 NcAOEACk2q7//SbCHM1dsPBaw1RmOdp75RLuucyZOvzjc8AIQwARgRZZUnJzr/7FVlqx872Voz9
 Q14izG3P5VKkJ9OB2qrCFiBBYMKuVGxryryE2rgXE95K4Epsoz6VM8nuqtGlvFuwTdt5ozVMjfA
 PhQ8WCKeS8cl2Bu+cj6GTYdu9rJDuCHmquAhOpJ9ADabT8M1tZTZ1hsiibudt3WAQoDGMluiRW2
 XqrlpaAgOYE+ROMUwaIcLi7lj0WrIyiDZ8+oS8dJzSXNGID4CeA8c6y1oSJOgy/TQeWMXOeGHWp
 eVbf83LQhbnSUAn99kRfB8ucM6ntpXRdpb3evInFU/jDoLhcEJgurOkVYIURiOk+63kckQ5NTuQ
 /EXaXcyMdvwBwYTuVxSxsJaXOiVzxiMUh3eZm9X1YORj5s2Fuu1xya6FIEXD7eAcMxPhxD3G+7o
 v/dGt+EF/avClopZwDSs5jqkyDH0Xg3FgXI6EPnaFFZpgWqS63CXPjdKFYr4vVJfUlZWAtvLTyo
 JdL8uJlX7XfD3D6UdlVNNKemZsZEGVXCTIGi6SmyMC9URKI3xCxZjGH1+NJSiYuMvhaFVTbfjDM
 cLuWGx9vXnLuY6fHZnBd/Chj61DysyTZMzBugc54InQRUIi3kHk3m0CSM0gr2bwa4op3GT2CBJg
 m0JZEH0rGSTFG0w==
X-Developer-Key: i=slp@redhat.com; a=openpgp;
 fpr=BED5FCF7512D86809142E8A2F469278D2F0C0235
X-Scanned-By: MIMEDefang 3.0 on 10.30.177.12
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
Sergio Lopez (5):
      virtio_config: add page_size field to virtio_shm_region
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

