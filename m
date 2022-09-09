Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 2FF685B36CC
	for <lists+dri-devel@lfdr.de>; Fri,  9 Sep 2022 13:57:20 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 0BB1510ECC7;
	Fri,  9 Sep 2022 11:57:15 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from us-smtp-delivery-124.mimecast.com
 (us-smtp-delivery-124.mimecast.com [170.10.133.124])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 1E9DD10E041
 for <dri-devel@lists.freedesktop.org>; Fri,  9 Sep 2022 11:56:57 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1662724616;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding;
 bh=wPqt9KxJ2MKyggGMUhNFA2rw5kF+HrAmVR6xkGu8xZM=;
 b=TUR8qjcbybHRZw9oy+i52KqIegtzTYPhvIPbTOSjF3PS5LQe9rTynHhb7n2e3N1f4azOZO
 sFiqcN5kw8s4kiE2XDiaFMbVDH9VM2Hd3PHiXB+4J0veg/ZYa4cEraHOoPldpbDd+8H2ja
 CThGB408WX1uK4u7kdJtHtMdLaWwjd4=
Received: from mimecast-mx02.redhat.com (mimecast-mx02.redhat.com
 [66.187.233.88]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 us-mta-494--4zyXRxiOrelmABpRBoYAA-1; Fri, 09 Sep 2022 07:56:53 -0400
X-MC-Unique: -4zyXRxiOrelmABpRBoYAA-1
Received: from smtp.corp.redhat.com (int-mx07.intmail.prod.int.rdu2.redhat.com
 [10.11.54.7])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx02.redhat.com (Postfix) with ESMTPS id 04B62101A54E;
 Fri,  9 Sep 2022 11:56:53 +0000 (UTC)
Received: from localhost.localdomain (unknown [10.39.193.47])
 by smtp.corp.redhat.com (Postfix) with ESMTP id 641D91410F36;
 Fri,  9 Sep 2022 11:56:52 +0000 (UTC)
From: Hans de Goede <hdegoede@redhat.com>
To: Patrik Jakobsson <patrik.r.jakobsson@gmail.com>
Subject: [PATCH 0/6] drm/gma500: 1 fix + further cleanups
Date: Fri,  9 Sep 2022 13:56:40 +0200
Message-Id: <20220909115646.99920-1-hdegoede@redhat.com>
MIME-Version: 1.0
X-Scanned-By: MIMEDefang 2.85 on 10.11.54.7
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Transfer-Encoding: 8bit
Content-Type: text/plain; charset="US-ASCII"; x-default=true
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
Cc: Hans de Goede <hdegoede@redhat.com>, dri-devel@lists.freedesktop.org
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

Hi Patrik,

Here is another gma500 patch-series with one more bugfix and a bunch
of other cleanups of stuff which I noticed while doing the previous
set of bugfixes.

Regards,

Hans


Hans de Goede (6):
  drm/gma500: Wait longer for the GPU to power-down
  drm/gma500: Remove runtime_allowed dead code in psb_unlocked_ioctl()
  drm/gma500: Remove never set dev_priv->rpm_enabled flag
  drm/gma500: Remove a couple of not useful function wrappers
  drm/gma500: Rewrite power management code
  drm/gma500: Remove unnecessary suspend/resume wrappers

 drivers/gpu/drm/gma500/cdv_device.c    |   2 +-
 drivers/gpu/drm/gma500/gma_display.c   |  19 +--
 drivers/gpu/drm/gma500/gma_display.h   |   2 -
 drivers/gpu/drm/gma500/oaktrail_lvds.c |   1 -
 drivers/gpu/drm/gma500/power.c         | 156 +++++--------------------
 drivers/gpu/drm/gma500/power.h         |  18 ---
 drivers/gpu/drm/gma500/psb_drv.c       |  35 +-----
 drivers/gpu/drm/gma500/psb_drv.h       |   7 +-
 drivers/gpu/drm/gma500/psb_irq.c       |  15 ++-
 9 files changed, 41 insertions(+), 214 deletions(-)

-- 
2.37.2

