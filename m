Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id D9EDC5B48E2
	for <lists+dri-devel@lfdr.de>; Sat, 10 Sep 2022 22:51:19 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 41B7D10E082;
	Sat, 10 Sep 2022 20:51:12 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from us-smtp-delivery-124.mimecast.com
 (us-smtp-delivery-124.mimecast.com [170.10.133.124])
 by gabe.freedesktop.org (Postfix) with ESMTPS id AFA0310E2C7
 for <dri-devel@lists.freedesktop.org>; Sat, 10 Sep 2022 20:51:07 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1662843066;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding;
 bh=E/p7gGmD7YFDR35M9mKq82PKYaH7snYHTGJXdl2wnao=;
 b=RIk8By80ed1+kocqmAjCNm+xE5dP/0Rs5CgcapYXUejlydCLqkofwog+S5yUii0MErFIqk
 w3cloSCZOpcJ5BbfpJg5FfokjOX+E2Tdn2OwIEQzhbZW3UPZO+BVmef8gYtnxd8yO57PuA
 SoawvRiwuKggCzHTXO/GvcnZnLpGnd0=
Received: from mimecast-mx02.redhat.com (mimecast-mx02.redhat.com
 [66.187.233.88]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 us-mta-632-UTBhNLg1MBijCJFkev_pcg-1; Sat, 10 Sep 2022 16:51:04 -0400
X-MC-Unique: UTBhNLg1MBijCJFkev_pcg-1
Received: from smtp.corp.redhat.com (int-mx08.intmail.prod.int.rdu2.redhat.com
 [10.11.54.8])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx02.redhat.com (Postfix) with ESMTPS id 20555801755;
 Sat, 10 Sep 2022 20:51:04 +0000 (UTC)
Received: from shalem.redhat.com (unknown [10.39.192.14])
 by smtp.corp.redhat.com (Postfix) with ESMTP id 85482C15BC3;
 Sat, 10 Sep 2022 20:51:03 +0000 (UTC)
From: Hans de Goede <hdegoede@redhat.com>
To: Patrik Jakobsson <patrik.r.jakobsson@gmail.com>
Subject: [PATCH 0/4] drm/gma500: Backlight handling changes
Date: Sat, 10 Sep 2022 22:50:57 +0200
Message-Id: <20220910205101.1355950-1-hdegoede@redhat.com>
MIME-Version: 1.0
X-Scanned-By: MIMEDefang 2.85 on 10.11.54.8
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

Regards,

Hans


Hans de Goede (4):
  drm/gma500: Refactor backlight support
  drm/gma500: Change registered backlight device type to raw/native
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
2.37.2

