Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 51494124762
	for <lists+dri-devel@lfdr.de>; Wed, 18 Dec 2019 13:57:02 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id C64D86E43F;
	Wed, 18 Dec 2019 12:56:57 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from us-smtp-delivery-1.mimecast.com (us-smtp-2.mimecast.com
 [207.211.31.81])
 by gabe.freedesktop.org (Postfix) with ESMTPS id B5A276E42B
 for <dri-devel@lists.freedesktop.org>; Wed, 18 Dec 2019 12:56:54 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1576673813;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding;
 bh=ZERHf61y2RjwcZ6h4RBgnEW/UaFqiSBfCJsYnwPbfW4=;
 b=JXHiyjrF5o0nNLdoTYkjWuoWPLlXj1tH6On30iD4LV/cxLvIcdIGlL6PPHbe8/+3LExnRK
 JhAzBvOH7FqBJo09nvCrYDa6LJ6ZMBWCh449gzw5C7vHbIT3wjJjkn+OEOnnuOr0FY2gfH
 DpQRX12YnZeTCDgEkWqse4xAyHn1zos=
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-353-tHmdBWYaMlSkmtsg9kWIww-1; Wed, 18 Dec 2019 07:56:49 -0500
Received: from smtp.corp.redhat.com (int-mx01.intmail.prod.int.phx2.redhat.com
 [10.5.11.11])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx01.redhat.com (Postfix) with ESMTPS id C4930107ACC5;
 Wed, 18 Dec 2019 12:56:48 +0000 (UTC)
Received: from sirius.home.kraxel.org (ovpn-117-39.ams2.redhat.com
 [10.36.117.39])
 by smtp.corp.redhat.com (Postfix) with ESMTP id 03EC560303;
 Wed, 18 Dec 2019 12:56:46 +0000 (UTC)
Received: by sirius.home.kraxel.org (Postfix, from userid 1000)
 id 3EC8A8FD8; Wed, 18 Dec 2019 13:56:45 +0100 (CET)
From: Gerd Hoffmann <kraxel@redhat.com>
To: dri-devel@lists.freedesktop.org
Subject: [PATCH v4 0/3] drm/virtio: fix mmap page attributes
Date: Wed, 18 Dec 2019 13:56:42 +0100
Message-Id: <20191218125645.9211-1-kraxel@redhat.com>
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.11
X-MC-Unique: tHmdBWYaMlSkmtsg9kWIww-1
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
Cc: Gerd Hoffmann <kraxel@redhat.com>, tzimmermann@suse.de,
 gurchetansingh@chromium.org
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

v4: back to v2-ish design, but simplified a bit.
v3: switch to drm_gem_object_funcs callback.
v2: make shmem helper caching configurable.

Gerd Hoffmann (3):
  drm/shmem: add support for per object caching flags.
  drm/virtio: fix mmap page attributes
  drm/udl: simplify gem object mapping.

 include/drm/drm_gem_shmem_helper.h      |  5 ++
 drivers/gpu/drm/drm_gem_shmem_helper.c  | 12 +++--
 drivers/gpu/drm/udl/udl_gem.c           | 62 ++-----------------------
 drivers/gpu/drm/virtio/virtgpu_object.c |  1 +
 4 files changed, 18 insertions(+), 62 deletions(-)

-- 
2.18.1

_______________________________________________
dri-devel mailing list
dri-devel@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/dri-devel
