Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id F228D15D7BD
	for <lists+dri-devel@lfdr.de>; Fri, 14 Feb 2020 13:55:47 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 835126F914;
	Fri, 14 Feb 2020 12:55:45 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from us-smtp-1.mimecast.com (us-smtp-delivery-1.mimecast.com
 [207.211.31.120])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 105D36F914
 for <dri-devel@lists.freedesktop.org>; Fri, 14 Feb 2020 12:55:43 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1581684942;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding;
 bh=e5SKfj7xC2IbRKt7wOQXBgBSOomfWZHK+Xw9W/QZZV4=;
 b=ibzbBSPFLWJCPEZ850ub7ifyJNxxcAYJuoKdyk7/XqX27BotrnQ+4m7p2O7uvZ5y++zMP5
 R/6Ll5Zo0D7dNEX1lT+Ha2ivruwIMIUl/iq0gpxIWZA7u72bYUruJohd9DTSwSJyh0th04
 b4leFouqdJDNUKqJ8xMgynXvuYzVdKM=
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-287-nYvbBf2wMvuveFih5xXE-g-1; Fri, 14 Feb 2020 07:55:40 -0500
Received: from smtp.corp.redhat.com (int-mx08.intmail.prod.int.phx2.redhat.com
 [10.5.11.23])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx01.redhat.com (Postfix) with ESMTPS id B25C9800D53;
 Fri, 14 Feb 2020 12:55:39 +0000 (UTC)
Received: from sirius.home.kraxel.org (ovpn-117-39.ams2.redhat.com
 [10.36.117.39])
 by smtp.corp.redhat.com (Postfix) with ESMTP id 31796387;
 Fri, 14 Feb 2020 12:55:36 +0000 (UTC)
Received: by sirius.home.kraxel.org (Postfix, from userid 1000)
 id 3FE0F1747F; Fri, 14 Feb 2020 13:55:35 +0100 (CET)
From: Gerd Hoffmann <kraxel@redhat.com>
To: dri-devel@lists.freedesktop.org
Subject: [PATCH v4 0/6] drm/virtio: rework batching
Date: Fri, 14 Feb 2020 13:55:29 +0100
Message-Id: <20200214125535.26349-1-kraxel@redhat.com>
X-Scanned-By: MIMEDefang 2.84 on 10.5.11.23
X-MC-Unique: nYvbBf2wMvuveFih5xXE-g-1
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
 - add patches #2 + #6.
v3:
 - split into multiple patches.

Gerd Hoffmann (6):
  drm/virtio: rework notification for better batching
  drm/virtio: notify before waiting
  drm/virtio: batch plane updates (pageflip)
  drm/virtio: batch resource creation
  drm/virtio: batch display query
  drm/virtio: move remaining virtio_gpu_notify calls

 drivers/gpu/drm/virtio/virtgpu_drv.h     |  6 ++---
 drivers/gpu/drm/virtio/virtgpu_display.c |  2 ++
 drivers/gpu/drm/virtio/virtgpu_gem.c     |  2 ++
 drivers/gpu/drm/virtio/virtgpu_ioctl.c   |  4 +++
 drivers/gpu/drm/virtio/virtgpu_kms.c     |  5 ++++
 drivers/gpu/drm/virtio/virtgpu_object.c  |  2 ++
 drivers/gpu/drm/virtio/virtgpu_plane.c   |  7 +++--
 drivers/gpu/drm/virtio/virtgpu_vq.c      | 33 ++++++++++--------------
 8 files changed, 34 insertions(+), 27 deletions(-)

-- 
2.18.2

_______________________________________________
dri-devel mailing list
dri-devel@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/dri-devel
