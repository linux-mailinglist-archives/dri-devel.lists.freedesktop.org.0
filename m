Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 22CD015BF17
	for <lists+dri-devel@lfdr.de>; Thu, 13 Feb 2020 14:22:17 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 032886F5CA;
	Thu, 13 Feb 2020 13:22:14 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from us-smtp-1.mimecast.com (us-smtp-delivery-1.mimecast.com
 [207.211.31.120])
 by gabe.freedesktop.org (Postfix) with ESMTPS id C98EF6F5CA
 for <dri-devel@lists.freedesktop.org>; Thu, 13 Feb 2020 13:22:11 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1581600130;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding;
 bh=L95NPPEp4fHeQT+Gxr0ykEIvPMZUmsyjB7u5IbBopmU=;
 b=BdxhxJNnxRTkWi05DdKdBejYujoiGfVfNVETqvJxl00GG9G2YbbOSJpRXKda99/oz9V+8N
 p5hqcAzu9VRDVQQ6z38CdbZKZacfXEGIwvX2FXW2xqjo12ViEyVPQQoawPGyEhTJQdzyr6
 +F/ZGzM5udcGjummyxKt4wJIoVdCNCc=
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-205-mbdDjbQ3ON2q8MjGzXVLgQ-1; Thu, 13 Feb 2020 08:22:08 -0500
Received: from smtp.corp.redhat.com (int-mx01.intmail.prod.int.phx2.redhat.com
 [10.5.11.11])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx01.redhat.com (Postfix) with ESMTPS id B294118FE860;
 Thu, 13 Feb 2020 13:22:07 +0000 (UTC)
Received: from sirius.home.kraxel.org (ovpn-117-39.ams2.redhat.com
 [10.36.117.39])
 by smtp.corp.redhat.com (Postfix) with ESMTP id BFE1889F3D;
 Thu, 13 Feb 2020 13:22:04 +0000 (UTC)
Received: by sirius.home.kraxel.org (Postfix, from userid 1000)
 id EED70939C; Thu, 13 Feb 2020 14:22:03 +0100 (CET)
From: Gerd Hoffmann <kraxel@redhat.com>
To: dri-devel@lists.freedesktop.org
Subject: [PATCH v3 0/4] drm/virtio: rework batching
Date: Thu, 13 Feb 2020 14:21:59 +0100
Message-Id: <20200213132203.23441-1-kraxel@redhat.com>
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.11
X-MC-Unique: mbdDjbQ3ON2q8MjGzXVLgQ-1
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
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
Cc: Gerd Hoffmann <kraxel@redhat.com>, gurchetansingh@chromium.org
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

v4:
 - split into multiple patches.

Gerd Hoffmann (4):
  drm/virtio: rework notification for better batching
  drm/virtio: batch plane updates (pageflip)
  drm/virtio: batch resource creation
  drm/virtio: batch display query.

 drivers/gpu/drm/virtio/virtgpu_drv.h     |  6 ++--
 drivers/gpu/drm/virtio/virtgpu_display.c |  2 ++
 drivers/gpu/drm/virtio/virtgpu_ioctl.c   |  1 +
 drivers/gpu/drm/virtio/virtgpu_kms.c     |  2 ++
 drivers/gpu/drm/virtio/virtgpu_object.c  |  1 +
 drivers/gpu/drm/virtio/virtgpu_plane.c   |  7 ++--
 drivers/gpu/drm/virtio/virtgpu_vq.c      | 41 +++++++++++++-----------
 7 files changed, 33 insertions(+), 27 deletions(-)

-- 
2.18.2

_______________________________________________
dri-devel mailing list
dri-devel@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/dri-devel
