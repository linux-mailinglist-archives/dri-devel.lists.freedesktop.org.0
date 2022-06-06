Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 3DC2453ED40
	for <lists+dri-devel@lfdr.de>; Mon,  6 Jun 2022 19:53:44 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 6A5EA10FB04;
	Mon,  6 Jun 2022 17:53:32 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from us-smtp-delivery-124.mimecast.com
 (us-smtp-delivery-124.mimecast.com [170.10.133.124])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 8084D88AC8
 for <dri-devel@lists.freedesktop.org>; Mon,  6 Jun 2022 17:53:30 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1654538009;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding;
 bh=sA5FRYdjW46yogT585AFPa7Uprs64JJvNY0R0SXT104=;
 b=B4DlcezkaZvGnDMOpjqb8x132VBa0ukodPsc9qIiu3J13ybEB6ctN+h9zA69esajpqUq+s
 GV9ruat4Bd4QrljSk1HFXO4uTc1ZuY//wLI1o1SWX1tbGnxkV0Y9/H4QEPsFsbTAoJoLaU
 l+CUaqOvEME2O6flsS+t1fcf5lp2ZxI=
Received: from mimecast-mx02.redhat.com (mx3-rdu2.redhat.com
 [66.187.233.73]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 us-mta-94-wX3yXpk8OOSRpbxGlbph8g-1; Mon, 06 Jun 2022 13:53:18 -0400
X-MC-Unique: wX3yXpk8OOSRpbxGlbph8g-1
Received: from smtp.corp.redhat.com (int-mx09.intmail.prod.int.rdu2.redhat.com
 [10.11.54.9])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx02.redhat.com (Postfix) with ESMTPS id 7799E3C60524;
 Mon,  6 Jun 2022 17:53:17 +0000 (UTC)
Received: from [172.30.41.16] (unknown [10.22.35.67])
 by smtp.corp.redhat.com (Postfix) with ESMTP id 3F4F7492C3B;
 Mon,  6 Jun 2022 17:53:16 +0000 (UTC)
Subject: [PATCH 0/2] Improve vfio-pci primary GPU assignment behavior
From: Alex Williamson <alex.williamson@redhat.com>
To: maarten.lankhorst@linux.intel.com, mripard@kernel.org,
 tzimmermann@suse.de, airlied@linux.ie, daniel@ffwll.ch
Date: Mon, 06 Jun 2022 11:53:15 -0600
Message-ID: <165453797543.3592816.6381793341352595461.stgit@omen>
User-Agent: StGit/1.5.dev2+g9ce680a52bd9
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
X-Scanned-By: MIMEDefang 2.85 on 10.11.54.9
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
Cc: kvm@vger.kernel.org, Laszlo Ersek <lersek@redhat.com>,
 Gerd Hoffmann <kraxel@redhat.com>, dri-devel@lists.freedesktop.org,
 linux-kernel@vger.kernel.org
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

Users attempting to enable vfio PCI device assignment with a GPU will
often block the default PCI driver from the device to avoid conflicts
with the device initialization or release path.  This means that
vfio-pci is sometimes the first PCI driver to bind to the device.  In 
the case of assigning the primary graphics device, low-level console
drivers may still generate resource conflicts.  Users often employ
kernel command line arguments to disable conflicting drivers or
perform unbinding in userspace to avoid this, but the actual solution
is often distribution/kernel config specific based on the included
drivers.

We can instead allow vfio-pci to copy the behavior of
drm_aperture_remove_conflicting_pci_framebuffers() in order to remove
these low-level drivers with conflicting resources.  vfio-pci is not
however a DRM driver, nor does vfio-pci depend on DRM config options,
thus we split out and export the necessary DRM apterture support and
mirror the framebuffer and VGA support.

I'd be happy to pull this series in through the vfio branch if
approved by the DRM maintainers.  Thanks,

Alex

---

Alex Williamson (2):
      drm/aperture: Split conflicting platform driver removal
      vfio/pci: Remove console drivers


 drivers/gpu/drm/drm_aperture.c   | 33 +++++++++++++++++++++++---------
 drivers/vfio/pci/vfio_pci_core.c | 17 ++++++++++++++++
 include/drm/drm_aperture.h       |  2 ++
 3 files changed, 43 insertions(+), 9 deletions(-)

