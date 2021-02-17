Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id D13B631D965
	for <lists+dri-devel@lfdr.de>; Wed, 17 Feb 2021 13:32:24 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id F039A6E4FF;
	Wed, 17 Feb 2021 12:32:22 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from us-smtp-delivery-124.mimecast.com
 (us-smtp-delivery-124.mimecast.com [63.128.21.124])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 610886E4FE
 for <dri-devel@lists.freedesktop.org>; Wed, 17 Feb 2021 12:32:21 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1613565140;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding;
 bh=dvKDhaSlCuACrfDuvgytu9948JcLMGsuf26MjIdoA2Y=;
 b=f5fg3KO8Gr66qYjB+DYqPD+5RLA0fAomHZVVEXeDNcU+PUuKTXpcuJsmrSe7t2jJ/3xCHx
 r7P7pwuQhc/21oaTsdP4qSGKwAUqBW0Kj0rZ/mtu0VN9wkmhy4ckKF/VnYtOsKi9X3+Qf/
 iRgej10Ohh6sUck67BgTkB/e/SXFCL0=
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-336-24xtT7DHMRChluhc270EEw-1; Wed, 17 Feb 2021 07:32:18 -0500
X-MC-Unique: 24xtT7DHMRChluhc270EEw-1
Received: from smtp.corp.redhat.com (int-mx05.intmail.prod.int.phx2.redhat.com
 [10.5.11.15])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx01.redhat.com (Postfix) with ESMTPS id 000AE107ACF9
 for <dri-devel@lists.freedesktop.org>; Wed, 17 Feb 2021 12:32:17 +0000 (UTC)
Received: from sirius.home.kraxel.org (ovpn-114-184.ams2.redhat.com
 [10.36.114.184])
 by smtp.corp.redhat.com (Postfix) with ESMTPS id D63BE5D72F;
 Wed, 17 Feb 2021 12:32:14 +0000 (UTC)
Received: by sirius.home.kraxel.org (Postfix, from userid 1000)
 id 6413E18000A2; Wed, 17 Feb 2021 13:32:13 +0100 (CET)
From: Gerd Hoffmann <kraxel@redhat.com>
To: dri-devel@lists.freedesktop.org
Subject: [PATCH v2 00/11] drm/qxl: a collection of fixes
Date: Wed, 17 Feb 2021 13:32:02 +0100
Message-Id: <20210217123213.2199186-1-kraxel@redhat.com>
MIME-Version: 1.0
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.15
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

v2:
 - use 'vmap' instead of 'kmap'.
 - rework cursor update workflow.

Gerd Hoffmann (11):
  drm/qxl: properly handle device init failures
  drm/qxl: more fence wait rework
  drm/qxl: use ttm bo priorities
  drm/qxl: fix lockdep issue in qxl_alloc_release_reserved
  drm/qxl: rename qxl_bo_kmap -> qxl_bo_vmap_locked
  drm/qxl: add qxl_bo_vmap/qxl_bo_vunmap
  drm/qxl: fix prime vmap
  drm/qxl: fix monitors object vmap
  drm/qxl: move shadow handling to new qxl_prepare_shadow()
  drm/qxl: rework cursor plane
  drm/qxl: add lock asserts to qxl_bo_vmap_locked + qxl_bo_vunmap_locked

 drivers/gpu/drm/qxl/qxl_object.h  |   7 +-
 drivers/gpu/drm/qxl/qxl_cmd.c     |   2 +-
 drivers/gpu/drm/qxl/qxl_display.c | 319 ++++++++++++++++--------------
 drivers/gpu/drm/qxl/qxl_draw.c    |   8 +-
 drivers/gpu/drm/qxl/qxl_gem.c     |   2 +-
 drivers/gpu/drm/qxl/qxl_image.c   |   2 +-
 drivers/gpu/drm/qxl/qxl_kms.c     |   4 +
 drivers/gpu/drm/qxl/qxl_object.c  |  53 ++++-
 drivers/gpu/drm/qxl/qxl_prime.c   |   4 +-
 drivers/gpu/drm/qxl/qxl_release.c |  39 ++--
 10 files changed, 261 insertions(+), 179 deletions(-)

-- 
2.29.2


_______________________________________________
dri-devel mailing list
dri-devel@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/dri-devel
