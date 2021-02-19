Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 12DA731F6FF
	for <lists+dri-devel@lfdr.de>; Fri, 19 Feb 2021 11:06:07 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id C09506E8B3;
	Fri, 19 Feb 2021 10:05:59 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mga02.intel.com (mga02.intel.com [134.134.136.20])
 by gabe.freedesktop.org (Postfix) with ESMTPS id BA29B6E8B3
 for <dri-devel@lists.freedesktop.org>; Fri, 19 Feb 2021 10:05:58 +0000 (UTC)
IronPort-SDR: QTHDd0MzIslRFXFwfZZw5ZxVKOZDbPLtOcESexdCFL1ODF0FnUy/in7+Con/stiKTXbHxgkYqS
 YpVxO7dPOU5w==
X-IronPort-AV: E=McAfee;i="6000,8403,9899"; a="170932815"
X-IronPort-AV: E=Sophos;i="5.81,189,1610438400"; d="scan'208";a="170932815"
Received: from orsmga004.jf.intel.com ([10.7.209.38])
 by orsmga101.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 19 Feb 2021 02:05:57 -0800
IronPort-SDR: eDSKrm5OR9Xfp9mGraN4lpP9IJ7gVYawLZFqjzIawswzu/uhXj6Y8z+F6gUtDcn+r5g3mYnWkj
 f9ZHEqIOXoVQ==
X-IronPort-AV: E=Sophos;i="5.81,189,1610438400"; d="scan'208";a="513624301"
Received: from vkasired-desk2.fm.intel.com ([10.105.128.127])
 by orsmga004-auth.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 19 Feb 2021 02:05:57 -0800
From: Vivek Kasireddy <vivek.kasireddy@intel.com>
To: virtualization@lists.linux-foundation.org, dri-devel@lists.freedesktop.org
Subject: [RFC v4 0/3] Introduce Virtio based Dmabuf driver(s)
Date: Fri, 19 Feb 2021 01:55:20 -0800
Message-Id: <20210219095523.2621884-1-vivek.kasireddy@intel.com>
X-Mailer: git-send-email 2.26.2
MIME-Version: 1.0
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
Cc: dongwon.kim@intel.com, daniel.vetter@ffwll.ch,
 Vivek Kasireddy <vivek.kasireddy@intel.com>, kraxel@redhat.com,
 daniel.vetter@intel.com, linux-media@vger.kernel.org, christian.koenig@amd.com,
 stevensd@chromium.org
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

The Virtual Dmabuf or Virtio based Dmabuf (Vdmabuf) driver can be used
to "transfer" a page-backed dmabuf created in the Guest to the Host
without making any copies. This is mostly accomplished by recreating the
dmabuf on the Host using the PFNs and other meta-data shared by the guest. 
A use-case where this driver would be a good fit is a multi-GPU system 
(perhaps one discrete and one integrated) where one of the GPUs does not 
have access to the display/connectors/outputs. This could be an embedded 
system design decision or a restriction made at the firmware/BIOS level
or perhaps the device is setup in UPT (Universal Passthrough) mode. When 
such a GPU is passthrough'd to a Guest OS, this driver can help in 
transferring the scanout buffer(s) (rendered using the native rendering 
stack) to the Host for the purpose of displaying them. Or, quite simply,
this driver can be used to transfer a dmabuf created by an application
running on the Guest to another application running on the Host.

The userspace component running in the Guest that transfers the dmabuf
is referred to as the producer or exporter and its counterpart running
in the Host is referred to as importer or consumer. For instance, a
Wayland compositor would potentially be a producer and Qemu UI would
be a consumer. It is the producer's responsibility to not reuse or
destroy the shared buffer while it is still being used by the consumer.
The consumer would send a release cmd indicating that it is done after
which the shared buffer can be safely used again by the producer. One
way the producer can prevent accidental re-use of the shared buffer is
to lock the buffer when it exports it and unlock it after it gets a 
release cmd. As an example, the GBM API provides a simple way to lock 
and unlock a surface's buffers.

For each dmabuf that is to be shared with the Host, a 128-bit unique
ID is generated that identifies this buffer across the whole system.
This ID is a combination of the Qemu process ID, a counter and a
randomizer. We could potentially use UUID API but we currently use
the above mentioned combination to identify the source of the buffer
at any given time for potential bookkeeping.

A typical cycle starts with the producer or exporter calling the
alloc_fd IOCTL to get a new fd/dmabuf from Vdmabuf. It would then import
and render to it and finally exports it by calling the export IOCTL. A 
new unique ID is generated for this buffer and it gets registered with
the Host. The Host then alerts the consumer or importer by raising an
event and shares the ID. In response, the consumer calls the import IOCTL
using the ID and gets a newly created dmabuf fd in return. After it is
done using the dmabuf, the consumer finally calls the release IOCTL and
the Guest is notified which in turn notifies the producer letting it know
that the buffer is now safe to reuse. 

v2:
- Added a notifier mechanism for getting the kvm pointer.
- Added start and stop routines in the Vhost backend.
- Augmented the cover letter and made some minor improvements.

v3:
- Refactored the code to make it similar to vsock.
- Used two virtqueues instead of one for efficient two-way
  communication.

v4:
- Made Vdmabuf guest driver allocate the dma-buf and backing
  storage and exported it to Weston to be used as a render
  target. (Gerd)

The Vdmabuf driver was tested using Weston (headless) and Qemu from here:
https://gitlab.freedesktop.org/Vivek/weston/-/blob/vdmabuf/libweston/backend-headless/headless.c#L522

https://lists.nongnu.org/archive/html/qemu-devel/2021-02/msg02976.html

TODO:
- Use dma_fences to improve synchronization for multiple importers.
- Ensure that a process other than Qemu can also be the importer on Host.

Other Considerations:
- Should virtio-gpu be augmented to provide the same functionality 
  as vdmabuf?
- How can virtio-gpu/vdmabuf work with a Windows Guest?
- Should there be a Vhost backend for virtio-gpu to reduce overhead?
- Should a transfer of a dma-buf from Guest to Host be dependent on a
  DRM driver (virtio-gpu)?

Vivek Kasireddy (3):
  kvm: Add a notifier for create and destroy VM events
  virtio: Introduce Vdmabuf driver
  vhost: Add Vdmabuf backend

 drivers/vhost/Kconfig               |    9 +
 drivers/vhost/Makefile              |    3 +
 drivers/vhost/vdmabuf.c             | 1372 +++++++++++++++++++++++++++
 drivers/virtio/Kconfig              |    8 +
 drivers/virtio/Makefile             |    1 +
 drivers/virtio/virtio_vdmabuf.c     | 1105 +++++++++++++++++++++
 include/linux/kvm_host.h            |    5 +
 include/linux/virtio_vdmabuf.h      |  287 ++++++
 include/uapi/linux/vhost.h          |    3 +
 include/uapi/linux/virtio_ids.h     |    1 +
 include/uapi/linux/virtio_vdmabuf.h |   87 ++
 virt/kvm/kvm_main.c                 |   20 +-
 12 files changed, 2899 insertions(+), 2 deletions(-)
 create mode 100644 drivers/vhost/vdmabuf.c
 create mode 100644 drivers/virtio/virtio_vdmabuf.c
 create mode 100644 include/linux/virtio_vdmabuf.h
 create mode 100644 include/uapi/linux/virtio_vdmabuf.h

-- 
2.26.2

_______________________________________________
dri-devel mailing list
dri-devel@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/dri-devel
