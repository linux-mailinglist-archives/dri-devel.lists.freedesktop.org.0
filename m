Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 78C065AF63A
	for <lists+dri-devel@lfdr.de>; Tue,  6 Sep 2022 22:39:23 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id C136C10EADC;
	Tue,  6 Sep 2022 20:39:04 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from us-smtp-delivery-124.mimecast.com
 (us-smtp-delivery-124.mimecast.com [170.10.129.124])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 21CC610EAD8
 for <dri-devel@lists.freedesktop.org>; Tue,  6 Sep 2022 20:38:59 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1662496737;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding;
 bh=qbR2xoxyOd/49zlUG1dj20kqyS3RnyRS2CBhdLA/Oog=;
 b=BSzUCqaD0mfz1XAzfKtAU8/OVbaP0M36pP/+kgWwamyUAQlLTX3dbqnjb864YZ5XsQ0kJy
 7sStKX6J5B2oZXQFy+bE6ufVhaMBSkCGQoXMRBCbiP8/UcLp6pkaqjjNCjj0SZSvL1Aeac
 bnhzTIglogqsqiWwQpq2y3d1t/n9CHk=
Received: from mimecast-mx02.redhat.com (mx3-rdu2.redhat.com
 [66.187.233.73]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 us-mta-327-MFicdJGXOsO0CPiD1fiR4Q-1; Tue, 06 Sep 2022 16:38:54 -0400
X-MC-Unique: MFicdJGXOsO0CPiD1fiR4Q-1
Received: from smtp.corp.redhat.com (int-mx04.intmail.prod.int.rdu2.redhat.com
 [10.11.54.4])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx02.redhat.com (Postfix) with ESMTPS id 488693C10141;
 Tue,  6 Sep 2022 20:38:53 +0000 (UTC)
Received: from shalem.redhat.com (unknown [10.39.192.36])
 by smtp.corp.redhat.com (Postfix) with ESMTP id AC8242026D4C;
 Tue,  6 Sep 2022 20:38:52 +0000 (UTC)
From: Hans de Goede <hdegoede@redhat.com>
To: Patrik Jakobsson <patrik.r.jakobsson@gmail.com>
Subject: [PATCH v2 0/3] drm/gma500: Fix 2 locking related WARNs + IRQ handling
Date: Tue,  6 Sep 2022 22:38:49 +0200
Message-Id: <20220906203852.527663-1-hdegoede@redhat.com>
MIME-Version: 1.0
X-Scanned-By: MIMEDefang 2.78 on 10.11.54.4
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

I have been testing the gma500 code on a Packard Bell Dot SC (Intel Atom
N2600, cedarview) laptop because I'm working on aligning the gma500
backlight code with the changes done to other drivers in the recent
backlight refactoring.

During the testing I noticed dmesg filling with a WARN_ON constantly
triggering as well as gnome-shell hanging after a suspend-resume cycle.

This series fixes 2 locking WARNs as well as vblank IRQs no longer
getting processed after a suspend-resume.

Changes in v2:
- Drop "drm/gma500: Fix crtc_vblank reference leak when userspace queues multiple events"
- Add "drm/gma500: Fix (vblank) IRQs not working after suspend/resume"

Regards,

Hans


Hans de Goede (3):
  drm/gma500: Fix BUG: sleeping function called from invalid context
    errors
  drm/gma500: Fix WARN_ON(lock->magic != lock) error
  drm/gma500: Fix (vblank) IRQs not working after suspend/resume

 drivers/gpu/drm/gma500/cdv_device.c      |  4 +---
 drivers/gpu/drm/gma500/gem.c             |  4 ++--
 drivers/gpu/drm/gma500/gma_display.c     | 11 +++++++----
 drivers/gpu/drm/gma500/oaktrail_device.c |  5 +----
 drivers/gpu/drm/gma500/power.c           |  8 +-------
 drivers/gpu/drm/gma500/psb_drv.c         |  2 +-
 drivers/gpu/drm/gma500/psb_drv.h         |  5 +----
 drivers/gpu/drm/gma500/psb_irq.c         | 15 ++++++++++++---
 drivers/gpu/drm/gma500/psb_irq.h         |  2 +-
 9 files changed, 27 insertions(+), 29 deletions(-)

-- 
2.37.2

