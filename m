Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 98645A34874
	for <lists+dri-devel@lfdr.de>; Thu, 13 Feb 2025 16:50:28 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id A17FC10E400;
	Thu, 13 Feb 2025 15:50:26 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (1024-bit key; unprotected) header.d=redhat.com header.i=@redhat.com header.b="T6kexPOK";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from us-smtp-delivery-124.mimecast.com
 (us-smtp-delivery-124.mimecast.com [170.10.129.124])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 2C61010E400
 for <dri-devel@lists.freedesktop.org>; Thu, 13 Feb 2025 15:50:25 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1739461824;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding;
 bh=0Y+jKRKsEjO1TFaud7eeAl4edw665Vb/FbaZRDoam2o=;
 b=T6kexPOKz3OsTo7hzO2irIGjKax4or13d6bjwRKvGJvO0qinBpoY2vvTbMsmoUSR0Qp+i0
 iqR/Dm9Ae92TcUCql8rrnRIRxDtUU1buUDPw2COTBnmJ5gimTGRL95RHiVbw6QDR6M9xiA
 7pFvOHQepnkU2g9JKgcZfB2WKsK32qs=
Received: from mx-prod-mc-08.mail-002.prod.us-west-2.aws.redhat.com
 (ec2-35-165-154-97.us-west-2.compute.amazonaws.com [35.165.154.97]) by
 relay.mimecast.com with ESMTP with STARTTLS (version=TLSv1.3,
 cipher=TLS_AES_256_GCM_SHA384) id us-mta-681-0y3rFR6hN_mtWCj48wSuHQ-1; Thu,
 13 Feb 2025 10:50:20 -0500
X-MC-Unique: 0y3rFR6hN_mtWCj48wSuHQ-1
X-Mimecast-MFC-AGG-ID: 0y3rFR6hN_mtWCj48wSuHQ
Received: from mx-prod-int-06.mail-002.prod.us-west-2.aws.redhat.com
 (mx-prod-int-06.mail-002.prod.us-west-2.aws.redhat.com [10.30.177.93])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
 (No client certificate requested)
 by mx-prod-mc-08.mail-002.prod.us-west-2.aws.redhat.com (Postfix) with ESMTPS
 id B7B561800373; Thu, 13 Feb 2025 15:50:17 +0000 (UTC)
Received: from [127.0.1.1] (unknown [10.44.33.58])
 by mx-prod-int-06.mail-002.prod.us-west-2.aws.redhat.com (Postfix) with ESMTP
 id 445121800360; Thu, 13 Feb 2025 15:50:09 +0000 (UTC)
From: Sergio Lopez <slp@redhat.com>
Subject: [RFC PATCH 0/5] virtio: obtain SHM page size from device
Date: Thu, 13 Feb 2025 16:49:14 +0100
Message-Id: <20250213-virtio-shm-page-size-v1-0-5ee1f9984350@redhat.com>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
X-B4-Tracking: v=1; b=H4sIAHoUrmcC/x2MywqAIBAAf0X23IIaPX8lOkhutYdK3JAo+vek4
 zDMPCAUmQR69UCkxMLHnsEUCqbV7Qsh+8xgta20NSUmjicfKOuGwWUtfBPW1DndTo0nbyCnIdL
 M178dxvf9AAM0pylmAAAA
X-Change-ID: 20250213-virtio-shm-page-size-6e9a08c7ded1
To: "Michael S. Tsirkin" <mst@redhat.com>, Jason Wang <jasowang@redhat.com>, 
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
X-Developer-Signature: v=1; a=openpgp-sha256; l=2664; i=slp@redhat.com;
 h=from:subject:message-id; bh=SbPUSm3ifegqv7YqorRMY++Q4GLCzSK0nJ0dyTpQQJs=;
 b=owEBbQKS/ZANAwAIAfRpJ40vDAI1AcsmYgBnrhSsWyIbxUAlgUtYgYz1iRByHa4EIlCTgfujK
 JQgSn4pp/KJAjMEAAEIAB0WIQS+1fz3US2GgJFC6KL0aSeNLwwCNQUCZ64UrAAKCRD0aSeNLwwC
 NStrEACD6yQgv1tPtc0cpojYfXRIfQlhDL/XV9gkfuh7RlAdFwVB0q0LUWVKV3W9IFezAsljfJo
 Vr+DtEJ2yWn+Qdh+Xzro4UCBZAySoiPv9AHNnIYbLHIPoBZ5Z8bqwyRQEkTw6Nd83s1h060qyhC
 EhuB3v6bEYqhqDDdc+hxWqBgscYS7S2Q054fUuOokxSJ174N5lqFZOcQDVbgy/TmmWfzV3VmMy3
 +Qt6DGjnGDA5UBol2354Q15YHcKp5+EdSCrZIHPv/bdKQk3C2j77BARu9I4JeBFez7IZuJ+eSGP
 gzq4rO6F+8hdQCapAykeZE4DIoibdY1KGyMcG8Nakhw8MOp8zBh4kqyOSbuzziEydclGaKr1ubj
 g75TvvJW6WRYjdzGgdkC5qqY2fmFHCfi3S5sEGuP7dik2Rcwl5nyJqzHrc5PSzxd5+YUtY6Xy0a
 w4AIbdVXs0k7SoO1Fw/ywi9Y0VQvRROZZIhZWUwXggUAd4zjpJcdoM/qj1ZzC75GnxUikJZ1FBs
 lsNZht8bqWLBfcbHdcmJZu/KNVaU1CUbtgYNz2FmIYB5RMmJBZZlj2ayH2dGVJ4oVhpNBYQvcAj
 mCJ8W309zpxuir27duPN6VNxLAlLdua/b/86UxDuxW3cOROaICpn47s49ySESY8WwAPTFFtQgRd
 uMKbKbOBAqgYM5w==
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
page size. This field has a 16-bit size to accommodate into the existing
padding virtio_pci_cap, simplifying the introduction of this additional
data into the structure. The device will provide the page size in format
PAGE_SIZE >> 12.

The series also extends the PCI and MMIO transports to obtain the
corresponding value from the device. For the PCI one, it should be safe
since we're using an existing 16-bit padding in the virtio_pci_cap
struct. For MMIO, we need to access a new register, so there's a risk
the VMM may overreact and crash the VM. I've checked libkrun,
firecracker, cloud-hypervisor and crosvm, and all of them should deal
with the unexpected MMIO read gracefully. QEMU doesn't support SHM for
the MMIO transport, so that isn't a concern either.

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
Sergio Lopez (5):
      virtio_config: add page_size field to virtio_shm_region
      virtio: introduce VIRTIO_F_SHM_PAGE_SIZE
      virtio-pci: extend virtio_pci_cap to hold page_size
      virtio-mmio: read shm region page size
      drm/virtio: add VIRTGPU_PARAM_HOST_SHM_PAGE_SIZE to params

 drivers/gpu/drm/virtio/virtgpu_ioctl.c |  5 +++++
 drivers/virtio/virtio_mmio.c           | 13 +++++++++++++
 drivers/virtio/virtio_pci_modern.c     | 31 ++++++++++++++++++++++++++++---
 drivers/virtio/virtio_ring.c           |  2 ++
 include/linux/virtio_config.h          |  1 +
 include/uapi/drm/virtgpu_drm.h         |  1 +
 include/uapi/linux/virtio_config.h     |  7 ++++++-
 include/uapi/linux/virtio_mmio.h       |  3 +++
 include/uapi/linux/virtio_pci.h        |  2 +-
 9 files changed, 60 insertions(+), 5 deletions(-)
---
base-commit: 4dc1d1bec89864d8076e5ab314f86f46442bfb02
change-id: 20250213-virtio-shm-page-size-6e9a08c7ded1

Best regards,
-- 
Sergio Lopez <slp@redhat.com>

