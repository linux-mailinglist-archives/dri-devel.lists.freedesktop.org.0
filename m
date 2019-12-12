Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id A4DAA11CD90
	for <lists+dri-devel@lfdr.de>; Thu, 12 Dec 2019 13:54:04 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 141176ED42;
	Thu, 12 Dec 2019 12:53:58 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from us-smtp-delivery-1.mimecast.com (us-smtp-1.mimecast.com
 [205.139.110.61])
 by gabe.freedesktop.org (Postfix) with ESMTPS id F19056ED42
 for <dri-devel@lists.freedesktop.org>; Thu, 12 Dec 2019 12:53:55 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1576155234;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding;
 bh=mGdjz5FkP/lDxyk2Jr06tkf0Jnmx44WJfXjlJXz+pNQ=;
 b=XKPEGIERs8Yz3xzwKF7TZdNRvJTjXoEh2e1a9uwKw/xpJrNMdxRxrmIhwYyUSK47/yr8xh
 Ex+j5lU/mtPKqt5ZGlEQPcfWgtCbRIgXV4azOSm/I5vhc/MBMneuHccKFWJ3lJ5BJA6nLN
 MG6yXLzyaSdsjgb8FdSN2orVg49Ur9g=
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-236-XmNmYYhCMBa-69n991La7Q-1; Thu, 12 Dec 2019 07:53:52 -0500
Received: from smtp.corp.redhat.com (int-mx04.intmail.prod.int.phx2.redhat.com
 [10.5.11.14])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx01.redhat.com (Postfix) with ESMTPS id 29D4F18B9FC1;
 Thu, 12 Dec 2019 12:53:51 +0000 (UTC)
Received: from sirius.home.kraxel.org (unknown [10.36.118.26])
 by smtp.corp.redhat.com (Postfix) with ESMTP id 9FEE35DA70;
 Thu, 12 Dec 2019 12:53:47 +0000 (UTC)
Received: by sirius.home.kraxel.org (Postfix, from userid 1000)
 id D1A0E11AAA; Thu, 12 Dec 2019 13:53:46 +0100 (CET)
From: Gerd Hoffmann <kraxel@redhat.com>
To: dri-devel@lists.freedesktop.org
Subject: [PATCH v2 0/3] drm/virtio: some optimitations.
Date: Thu, 12 Dec 2019 13:53:43 +0100
Message-Id: <20191212125346.8334-1-kraxel@redhat.com>
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.14
X-MC-Unique: XmNmYYhCMBa-69n991La7Q-1
X-Mimecast-Spam-Score: 0
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

v2: fix src rect handling (Chia-I Wu).

Gerd Hoffmann (3):
  drm/virtio: skip set_scanout if framebuffer didn't change
  virtio-gpu: batch display update commands.
  virtio-gpu: use damage info for display updates.

 drivers/gpu/drm/virtio/virtgpu_drv.h   |  6 ++
 drivers/gpu/drm/virtio/virtgpu_plane.c | 80 ++++++++++++++++----------
 drivers/gpu/drm/virtio/virtgpu_vq.c    | 23 +++++++-
 3 files changed, 76 insertions(+), 33 deletions(-)

-- 
2.18.1

_______________________________________________
dri-devel mailing list
dri-devel@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/dri-devel
