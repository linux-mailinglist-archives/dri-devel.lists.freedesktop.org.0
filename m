Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 36B5120970D
	for <lists+dri-devel@lfdr.de>; Thu, 25 Jun 2020 01:21:30 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id E3A936E2CC;
	Wed, 24 Jun 2020 23:21:25 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from us-smtp-1.mimecast.com (us-smtp-delivery-1.mimecast.com
 [207.211.31.120])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 2EFDA6E2CC
 for <dri-devel@lists.freedesktop.org>; Wed, 24 Jun 2020 23:21:25 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1593040883;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type;
 bh=HVbEuEGkVIuG5NhNxqmnGS+9NKLEk9a8dY03A8fYLyw=;
 b=Lfj54CY8nSERl9bGK9KhEua0C1ASE186ZWI2DVCVvMP40FNuWSGxIAmxMpbdFpVrGwbZby
 dxY7xJqltJeyMvo7ZWexEbKTX8E4RN8Orb8s4rSFjRuYIVR9wvWCv3AsqTZcMMvEBRuuQH
 cGviyc/D9E70mpHVsrOSonJn9owu2jE=
Received: from mail-wm1-f71.google.com (mail-wm1-f71.google.com
 [209.85.128.71]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-191-yXmYOHmIP9qNzciLG7ULJg-1; Wed, 24 Jun 2020 19:21:22 -0400
X-MC-Unique: yXmYOHmIP9qNzciLG7ULJg-1
Received: by mail-wm1-f71.google.com with SMTP id h25so5862666wmb.0
 for <dri-devel@lists.freedesktop.org>; Wed, 24 Jun 2020 16:21:22 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:date:from:to:cc:subject:message-id:mime-version
 :content-disposition;
 bh=HVbEuEGkVIuG5NhNxqmnGS+9NKLEk9a8dY03A8fYLyw=;
 b=RikLN10PocAIC1JZjdKjKonqdj7r1a40zqE7KPn4EPRqtWWccz3LcDAZDv8y3H+1Rd
 wXhLV3smIUzGNHUm3czxMmYMh2dj9kRnJD2uqVJOBi9gjzHqOI+Zw8JtStRaHUigXOjY
 UVXW2VwPAOg6yzyoilbYiXOD6s+mAH+Y6pUeFGiAFcZtK+9ZJrsYOI82UzrTe7mqpv2F
 XsQ+K50XYCpy/VEKz1FrFa+RHvN/38MV4nEBwQQ4GmWiDdN8RAWr3X1dTdiF5mGnEFyM
 d9XHePFFCLLol1/pQccqtA5qtNBi9VQDC8s2PMP+J4/4ombVtgkytIasLmaHl0Qold8s
 D8aA==
X-Gm-Message-State: AOAM533aXsOnotjwi2CVixlL48HzzDfrV4qusd+p+JdzCf+EVBjcVoMJ
 JO7jtkvojQS1iivg79WTXHuW7M4vYYnEwZcawBwek5EeDbUTDu2BFninvva9AVoIhGQcoRQdGwn
 KLBrKTtXOZamgUy4Dl0dcs3NtQg9E
X-Received: by 2002:a1c:f203:: with SMTP id s3mr167748wmc.126.1593040881218;
 Wed, 24 Jun 2020 16:21:21 -0700 (PDT)
X-Google-Smtp-Source: ABdhPJyM0cktsDl5CrWaaOPv+1nYAYm4w3v8Sv0284TWIxv5uQ05SVVcH6miZb9gN0YuAb6dFYTBHA==
X-Received: by 2002:a1c:f203:: with SMTP id s3mr167730wmc.126.1593040881042;
 Wed, 24 Jun 2020 16:21:21 -0700 (PDT)
Received: from redhat.com (bzq-79-182-31-92.red.bezeqint.net. [79.182.31.92])
 by smtp.gmail.com with ESMTPSA id
 c25sm9717109wml.46.2020.06.24.16.21.19
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Wed, 24 Jun 2020 16:21:20 -0700 (PDT)
Date: Wed, 24 Jun 2020 19:21:18 -0400
From: "Michael S. Tsirkin" <mst@redhat.com>
To: linux-kernel@vger.kernel.org
Subject: [PATCH v2 0/2] virtio: modernize DMA quirks
Message-ID: <20200624232035.704217-1-mst@redhat.com>
MIME-Version: 1.0
X-Mailer: git-send-email 2.27.0.106.g8ac3dc51b1
X-Mutt-Fcc: =sent
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Disposition: inline
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
Cc: dri-devel@lists.freedesktop.org, virtualization@lists.linux-foundation.org
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

Use generic names for the quirks to make it clear it is not just about
the IOMMU, it's about DMA access in general.

changes from v1:
	added patch 2

Michael S. Tsirkin (2):
  virtio: VIRTIO_F_IOMMU_PLATFORM -> VIRTIO_F_ACCESS_PLATFORM
  virtio: virtio_has_iommu_quirk -> virtio_has_dma_quirk

 arch/um/drivers/virtio_uml.c            |  2 +-
 drivers/gpu/drm/virtio/virtgpu_object.c |  2 +-
 drivers/gpu/drm/virtio/virtgpu_vq.c     |  4 ++--
 drivers/vdpa/ifcvf/ifcvf_base.h         |  2 +-
 drivers/vdpa/vdpa_sim/vdpa_sim.c        |  4 ++--
 drivers/vhost/net.c                     |  4 ++--
 drivers/vhost/vdpa.c                    |  2 +-
 drivers/virtio/virtio_balloon.c         |  2 +-
 drivers/virtio/virtio_ring.c            |  4 ++--
 include/linux/virtio_config.h           |  6 +++---
 include/uapi/linux/virtio_config.h      | 10 +++++++---
 tools/virtio/linux/virtio_config.h      |  6 +++---
 12 files changed, 26 insertions(+), 22 deletions(-)

-- 
MST

_______________________________________________
dri-devel mailing list
dri-devel@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/dri-devel
