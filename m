Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (unknown [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 26D9A5BB8A7
	for <lists+dri-devel@lfdr.de>; Sat, 17 Sep 2022 16:04:47 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 8090E10E3B7;
	Sat, 17 Sep 2022 14:04:23 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from us-smtp-delivery-124.mimecast.com
 (us-smtp-delivery-124.mimecast.com [170.10.133.124])
 by gabe.freedesktop.org (Postfix) with ESMTPS id B0CEB10E39C
 for <dri-devel@lists.freedesktop.org>; Sat, 17 Sep 2022 14:04:00 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1663423439;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding;
 bh=Qd0KEZ3rQbn7Z+QhleK+Zfj+5dOqWaNl3iHYKmnqGhk=;
 b=W5eEI9HYTz6iWkS32FzMxNTh5AffLVqyebAfXKi0wTtp8BsVQRv4aE2PwxWTdWA9qTY3DF
 4J2en+O4vZkHSHMe+evuMWEfhrKWwAfJ2xHK9Dzt1Gl8FjYloCfecBu8eU4lJpWroL4Uc1
 RWFvDR6CHw3s1+D77dmn/y5T9/WrG78=
Received: from mimecast-mx02.redhat.com (mimecast-mx02.redhat.com
 [66.187.233.88]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 us-mta-216-IwkbQcliNiCXOfsTyByEBw-1; Sat, 17 Sep 2022 10:03:54 -0400
X-MC-Unique: IwkbQcliNiCXOfsTyByEBw-1
Received: from smtp.corp.redhat.com (int-mx02.intmail.prod.int.rdu2.redhat.com
 [10.11.54.2])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx02.redhat.com (Postfix) with ESMTPS id 75898801231;
 Sat, 17 Sep 2022 14:03:54 +0000 (UTC)
Received: from shalem.redhat.com (unknown [10.39.192.5])
 by smtp.corp.redhat.com (Postfix) with ESMTP id A443B40C6EC2;
 Sat, 17 Sep 2022 14:03:53 +0000 (UTC)
From: Hans de Goede <hdegoede@redhat.com>
To: Patrik Jakobsson <patrik.r.jakobsson@gmail.com>,
 Sam Ravnborg <sam@ravnborg.org>
Subject: [PATCH v2 0/5] drm/gma500: Backlight handling changes
Date: Sat, 17 Sep 2022 16:03:47 +0200
Message-Id: <20220917140352.526507-1-hdegoede@redhat.com>
MIME-Version: 1.0
X-Scanned-By: MIMEDefang 3.1 on 10.11.54.2
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

Hi All,

Here is a patch-series changing gma500's backlight handling to match
the changes done to the other major x86 GPU drivers in the just landed
backlight detection refactor patch series:
https://lore.kernel.org/dri-devel/261afe3d-7790-e945-adf6-a2c96c9b1eff@redhat.com/

The main goal is here is to only register one backlight class device instead
of registering both "acpi_video0" and "psb-bl" backlight class devices;
in preparation for implementing the new backlight userspace-API from:
https://lore.kernel.org/dri-devel/b61d3eeb-6213-afac-2e70-7b9791c86d2e@redhat.com/

Changes in v2:
- Add "Use backlight_get_brightness() to get the brightness" patch

Regards,

Hans


Hans de Goede (5):
  drm/gma500: Refactor backlight support
  drm/gma500: Change registered backlight device type to raw/native
  drm/gma500: Use backlight_get_brightness() to get the brightness
  drm/gma500: Don't register backlight when another backlight should be
    used
  drm/gma500: Call acpi_video_register_backlight()

 drivers/gpu/drm/gma500/backlight.c       | 102 +++++++++++++++--------
 drivers/gpu/drm/gma500/cdv_device.c      |  50 ++---------
 drivers/gpu/drm/gma500/oaktrail_device.c |  65 ++-------------
 drivers/gpu/drm/gma500/opregion.c        |   6 +-
 drivers/gpu/drm/gma500/psb_device.c      |  73 +---------------
 drivers/gpu/drm/gma500/psb_drv.c         |  15 +---
 drivers/gpu/drm/gma500/psb_drv.h         |  13 +--
 7 files changed, 97 insertions(+), 227 deletions(-)

-- 
2.37.3

