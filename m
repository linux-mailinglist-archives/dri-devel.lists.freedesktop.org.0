Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id D23BC5BBA7A
	for <lists+dri-devel@lfdr.de>; Sat, 17 Sep 2022 22:59:39 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id EF8B210E142;
	Sat, 17 Sep 2022 20:59:30 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from us-smtp-delivery-124.mimecast.com
 (us-smtp-delivery-124.mimecast.com [170.10.133.124])
 by gabe.freedesktop.org (Postfix) with ESMTPS id DE3B710E13D
 for <dri-devel@lists.freedesktop.org>; Sat, 17 Sep 2022 20:59:25 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1663448364;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding;
 bh=wNhjOA0X7nl5HlNhNakoPxXi2WKHXeoFzjq4zJb4WPI=;
 b=LzdHUiGRwpFJMuQhlIyp4bdjpl3XqCLJBfoDHNRZHBMW0sKJmfwJhn0k7SiGd5Y0OMHYbj
 meoHHV9fuwJZpaEoV+SFGFb/VjIQZwlO/PZ9bOJPGUuu8ayMMmDv4ewHotBUsT7tr0l9LE
 iJl50HPRm5+a1WK/ZEjBnmSdFRmqIDM=
Received: from mimecast-mx02.redhat.com (mx3-rdu2.redhat.com
 [66.187.233.73]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 us-mta-56-DE1RhBw0MTi7ApVeRcIdDQ-1; Sat, 17 Sep 2022 16:59:23 -0400
X-MC-Unique: DE1RhBw0MTi7ApVeRcIdDQ-1
Received: from smtp.corp.redhat.com (int-mx03.intmail.prod.int.rdu2.redhat.com
 [10.11.54.3])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx02.redhat.com (Postfix) with ESMTPS id 2F2A21C05131;
 Sat, 17 Sep 2022 20:59:23 +0000 (UTC)
Received: from shalem.redhat.com (unknown [10.39.192.28])
 by smtp.corp.redhat.com (Postfix) with ESMTP id 0775F1121314;
 Sat, 17 Sep 2022 20:59:21 +0000 (UTC)
From: Hans de Goede <hdegoede@redhat.com>
To: Patrik Jakobsson <patrik.r.jakobsson@gmail.com>,
 Sam Ravnborg <sam@ravnborg.org>
Subject: [PATCH v3 0/5] drm/gma500: Backlight handling changes
Date: Sat, 17 Sep 2022 22:59:15 +0200
Message-Id: <20220917205920.647212-1-hdegoede@redhat.com>
MIME-Version: 1.0
X-Scanned-By: MIMEDefang 3.1 on 10.11.54.3
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

Changes in v3:
- Fix unused variable warnings when CONFIG_BACKLIGHT is not selected by
  marking the 2 variables as  __maybe_unused.

Regards,

Hans


Hans de Goede (5):
  drm/gma500: Refactor backlight support (v2)
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

