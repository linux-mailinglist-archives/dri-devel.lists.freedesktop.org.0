Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 3C99E11AAA0
	for <lists+dri-devel@lfdr.de>; Wed, 11 Dec 2019 13:20:13 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id D48706EB21;
	Wed, 11 Dec 2019 12:20:07 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from us-smtp-1.mimecast.com (us-smtp-delivery-1.mimecast.com
 [205.139.110.120])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 7307B6EB27
 for <dri-devel@lists.freedesktop.org>; Wed, 11 Dec 2019 12:20:06 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1576066805;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding;
 bh=/e5hv/Ov8Jgd7BtfnuilV1uTH67U7UyLp3r7xmprp+c=;
 b=g/ulzhRklQ3qp9G9Wsl6zBqtIDtQDDt00onIcfyJbs40K6Og0ADlBLJGUMAdhXd/gXQzpI
 4OtDil6s4rBVSB3vTsPV0+85Sg3a7Wf43eU0qUqH9h71zlNe+jBTSG1UuXr5MVIDLUeX4u
 fttsgXrDiFILErIAGma0K+X2ysp9hHQ=
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-62-aIcm2W5oM3yqauR-BMeigg-1; Wed, 11 Dec 2019 07:20:01 -0500
Received: from smtp.corp.redhat.com (int-mx05.intmail.prod.int.phx2.redhat.com
 [10.5.11.15])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx01.redhat.com (Postfix) with ESMTPS id C9B40107ACFB;
 Wed, 11 Dec 2019 12:20:00 +0000 (UTC)
Received: from sirius.home.kraxel.org (ovpn-116-67.ams2.redhat.com
 [10.36.116.67])
 by smtp.corp.redhat.com (Postfix) with ESMTP id 065DA61F36;
 Wed, 11 Dec 2019 12:19:58 +0000 (UTC)
Received: by sirius.home.kraxel.org (Postfix, from userid 1000)
 id 1415B16E08; Wed, 11 Dec 2019 13:19:57 +0100 (CET)
From: Gerd Hoffmann <kraxel@redhat.com>
To: dri-devel@lists.freedesktop.org
Subject: [PATCH v3 0/4] drm/virtio: fix mmap page attributes
Date: Wed, 11 Dec 2019 13:19:52 +0100
Message-Id: <20191211121957.18637-1-kraxel@redhat.com>
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.15
X-MC-Unique: aIcm2W5oM3yqauR-BMeigg-1
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

v3: switch to drm_gem_object_funcs callback.
v2: make shmem helper caching configurable.

Gerd Hoffmann (4):
  drm: add pgprot callback to drm_gem_object_funcs
  drm/shmem: add support for per object caching flags.
  drm/virtio: fix mmap page attributes
  drm/udl: simplify gem object mapping.

 include/drm/drm_gem.h                   | 15 ++++++
 drivers/gpu/drm/drm_gem.c               | 46 +++++++++++++++++-
 drivers/gpu/drm/drm_gem_shmem_helper.c  |  6 ++-
 drivers/gpu/drm/udl/udl_gem.c           | 62 +++----------------------
 drivers/gpu/drm/virtio/virtgpu_object.c |  1 +
 5 files changed, 72 insertions(+), 58 deletions(-)

-- 
2.18.1

_______________________________________________
dri-devel mailing list
dri-devel@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/dri-devel
