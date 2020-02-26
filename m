Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 76C74170306
	for <lists+dri-devel@lfdr.de>; Wed, 26 Feb 2020 16:48:06 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id E099F6E339;
	Wed, 26 Feb 2020 15:48:03 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from us-smtp-1.mimecast.com (us-smtp-delivery-1.mimecast.com
 [207.211.31.120])
 by gabe.freedesktop.org (Postfix) with ESMTPS id E9B6D6E339
 for <dri-devel@lists.freedesktop.org>; Wed, 26 Feb 2020 15:48:02 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1582732082;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding;
 bh=7tLUmgx1Im7L4WZou+xYsGaM4k6R2VeoHZt1D9Q46Q4=;
 b=gHsXt2DkpkUxLTEWKqeu61sj9iX4C7ucwZDTpYbfwHMO96CdlZOv9KWaT6J9ug+CC/pvEn
 jrRAH1475xHnVYQP8uaDdyPd9lf1/G78VzyFI8SkZbiAhzCJbZ09wLqNa+rJ38crwRBV+C
 evXdtoLq4sFkbGVeOnOg0teZO9+5ik4=
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-191-qw71iaVZMTK4UpBaB-C6Cw-1; Wed, 26 Feb 2020 10:47:58 -0500
X-MC-Unique: qw71iaVZMTK4UpBaB-C6Cw-1
Received: from smtp.corp.redhat.com (int-mx03.intmail.prod.int.phx2.redhat.com
 [10.5.11.13])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx01.redhat.com (Postfix) with ESMTPS id DD6BC18C43C2;
 Wed, 26 Feb 2020 15:47:56 +0000 (UTC)
Received: from sirius.home.kraxel.org (ovpn-116-150.ams2.redhat.com
 [10.36.116.150])
 by smtp.corp.redhat.com (Postfix) with ESMTP id 10F609079B;
 Wed, 26 Feb 2020 15:47:53 +0000 (UTC)
Received: by sirius.home.kraxel.org (Postfix, from userid 1000)
 id DEE0A17506; Wed, 26 Feb 2020 16:47:52 +0100 (CET)
From: Gerd Hoffmann <kraxel@redhat.com>
To: dri-devel@lists.freedesktop.org
Subject: [PATCH v5 0/3] drm/virtio: fix mmap page attributes
Date: Wed, 26 Feb 2020 16:47:49 +0100
Message-Id: <20200226154752.24328-1-kraxel@redhat.com>
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.13
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
Cc: Guillaume.Gardet@arm.com, Gerd Hoffmann <kraxel@redhat.com>,
 tzimmermann@suse.de, gurchetansingh@chromium.org
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

v5: rebase, add tags, add cc stable for 1+2, no code changes.
v4: back to v2-ish design, but simplified a bit.
v3: switch to drm_gem_object_funcs callback.
v2: make shmem helper caching configurable.

Gerd Hoffmann (3):
  drm/shmem: add support for per object caching flags.
  drm/virtio: fix mmap page attributes
  drm/udl: simplify gem object mapping.

 include/drm/drm_gem_shmem_helper.h      |  5 ++
 drivers/gpu/drm/drm_gem_shmem_helper.c  | 15 ++++--
 drivers/gpu/drm/udl/udl_gem.c           | 62 ++-----------------------
 drivers/gpu/drm/virtio/virtgpu_object.c |  1 +
 4 files changed, 20 insertions(+), 63 deletions(-)

-- 
2.18.2

_______________________________________________
dri-devel mailing list
dri-devel@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/dri-devel
