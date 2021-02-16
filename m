Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 6A09131C9CA
	for <lists+dri-devel@lfdr.de>; Tue, 16 Feb 2021 12:37:38 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 931B089F3B;
	Tue, 16 Feb 2021 11:37:28 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from us-smtp-delivery-124.mimecast.com
 (us-smtp-delivery-124.mimecast.com [216.205.24.124])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 8523389CD8
 for <dri-devel@lists.freedesktop.org>; Tue, 16 Feb 2021 11:37:27 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1613475446;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding;
 bh=+zhuHviC0isDnPjRBGEn4Q+IeCMU567TRjgWhfSQx2k=;
 b=CIUbzH66cEgtwzJrSun1+cZK1PAHobih9UnaLddRkMrrZOqNX6GT1CmmFEvYfKsozANP2O
 FQumvZy6PhUzbJXasiWVM+oypRkkF8XIuPaqT24pogc1a0cC/dvbi5OGIB3nECUP2dgbQb
 Pvx3n9huS6IcB0M5V3E0zppNDj/1//g=
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-423-eZoRfNZlMHK3PcBliz79UA-1; Tue, 16 Feb 2021 06:37:23 -0500
X-MC-Unique: eZoRfNZlMHK3PcBliz79UA-1
Received: from smtp.corp.redhat.com (int-mx07.intmail.prod.int.phx2.redhat.com
 [10.5.11.22])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx01.redhat.com (Postfix) with ESMTPS id 38796195D560
 for <dri-devel@lists.freedesktop.org>; Tue, 16 Feb 2021 11:37:22 +0000 (UTC)
Received: from sirius.home.kraxel.org (ovpn-114-184.ams2.redhat.com
 [10.36.114.184])
 by smtp.corp.redhat.com (Postfix) with ESMTPS id 115771007612;
 Tue, 16 Feb 2021 11:37:19 +0000 (UTC)
Received: by sirius.home.kraxel.org (Postfix, from userid 1000)
 id F2A62180009A; Tue, 16 Feb 2021 12:37:16 +0100 (CET)
From: Gerd Hoffmann <kraxel@redhat.com>
To: dri-devel@lists.freedesktop.org
Subject: [PATCH 00/10] drm/qxl: a collection of fixes
Date: Tue, 16 Feb 2021 12:37:06 +0100
Message-Id: <20210216113716.716996-1-kraxel@redhat.com>
MIME-Version: 1.0
X-Scanned-By: MIMEDefang 2.84 on 10.5.11.22
Authentication-Results: relay.mimecast.com;
 auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=kraxel@redhat.com
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
Cc: Gerd Hoffmann <kraxel@redhat.com>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

Mostly around locking.

Gerd Hoffmann (10):
  drm/qxl: properly handle device init failures
  drm/qxl: more fence wait rework
  drm/qxl: use ttm bo priorities
  drm/qxl: fix lockdep issue in qxl_alloc_release_reserved
  drm/qxl: rename qxl_bo_kmap -> qxl_bo_kmap_locked
  drm/qxl: add qxl_bo_kmap/qxl_bo_kunmap
  drm/qxl: fix prime kmap
  drm/qxl: fix monitors object kmap
  drm/qxl: map/unmap framebuffers in prepare_fb+cleanup_fb callbacks.
  drm/qxl: add lock asserts to qxl_bo_kmap_locked + qxl_bo_kunmap_locked

 drivers/gpu/drm/qxl/qxl_object.h  |  5 ++-
 drivers/gpu/drm/qxl/qxl_cmd.c     |  2 +-
 drivers/gpu/drm/qxl/qxl_display.c | 34 +++++++++-----------
 drivers/gpu/drm/qxl/qxl_draw.c    |  8 ++---
 drivers/gpu/drm/qxl/qxl_gem.c     |  2 +-
 drivers/gpu/drm/qxl/qxl_image.c   |  2 +-
 drivers/gpu/drm/qxl/qxl_kms.c     |  4 +++
 drivers/gpu/drm/qxl/qxl_object.c  | 53 +++++++++++++++++++++++++++----
 drivers/gpu/drm/qxl/qxl_release.c | 41 +++++++++++++++---------
 9 files changed, 103 insertions(+), 48 deletions(-)

-- 
2.29.2


_______________________________________________
dri-devel mailing list
dri-devel@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/dri-devel
