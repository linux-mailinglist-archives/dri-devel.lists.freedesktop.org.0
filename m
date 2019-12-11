Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 6315611A625
	for <lists+dri-devel@lfdr.de>; Wed, 11 Dec 2019 09:42:37 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 171EC6EA96;
	Wed, 11 Dec 2019 08:42:33 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from us-smtp-delivery-1.mimecast.com (us-smtp-1.mimecast.com
 [207.211.31.81])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 53FC86EA94
 for <dri-devel@lists.freedesktop.org>; Wed, 11 Dec 2019 08:42:27 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1576053746;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding;
 bh=vPUye9x/D+mkiJILdWGiM5wLuM3fpVYTX4aS8kYaiFY=;
 b=dNgzg3R5ZPxPc+tjVs6CD7FceBD0sLenj2LTY+FlqeoILiZ9EO5jhu/tGpffN5CzrOkBLt
 tNyoQPltDdHkeQNQexzNt54Cr90PsM/vqK7G5/o+qC75crpySdiERXVI5MmQO3XogekTa+
 zLXzu7iXz0ky5AJONApA1tqbCGGY/K8=
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-335-EuXtqeNzNv2gQxbKIddrMw-1; Wed, 11 Dec 2019 03:42:24 -0500
Received: from smtp.corp.redhat.com (int-mx03.intmail.prod.int.phx2.redhat.com
 [10.5.11.13])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx01.redhat.com (Postfix) with ESMTPS id C37B51005514;
 Wed, 11 Dec 2019 08:42:22 +0000 (UTC)
Received: from sirius.home.kraxel.org (ovpn-116-67.ams2.redhat.com
 [10.36.116.67])
 by smtp.corp.redhat.com (Postfix) with ESMTP id 6D51B67E6D;
 Wed, 11 Dec 2019 08:42:17 +0000 (UTC)
Received: by sirius.home.kraxel.org (Postfix, from userid 1000)
 id 487D316E08; Wed, 11 Dec 2019 09:42:16 +0100 (CET)
From: Gerd Hoffmann <kraxel@redhat.com>
To: dri-devel@lists.freedesktop.org
Subject: [PATCH 0/3] drm/virtio: some optimitations.
Date: Wed, 11 Dec 2019 09:42:13 +0100
Message-Id: <20191211084216.25405-1-kraxel@redhat.com>
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.13
X-MC-Unique: EuXtqeNzNv2gQxbKIddrMw-1
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



Gerd Hoffmann (3):
  drm/virtio: skip set_scanout if framebuffer didn't change
  virtio-gpu: batch display update commands.
  virtio-gpu: use damage info for display updates.

 drivers/gpu/drm/virtio/virtgpu_drv.h   |  6 ++
 drivers/gpu/drm/virtio/virtgpu_plane.c | 76 +++++++++++++++-----------
 drivers/gpu/drm/virtio/virtgpu_vq.c    | 23 +++++++-
 3 files changed, 72 insertions(+), 33 deletions(-)

-- 
2.18.1

_______________________________________________
dri-devel mailing list
dri-devel@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/dri-devel
