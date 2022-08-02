Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id E0F225875FF
	for <lists+dri-devel@lfdr.de>; Tue,  2 Aug 2022 05:32:28 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id B507310FF84;
	Tue,  2 Aug 2022 03:31:59 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from us-smtp-delivery-124.mimecast.com
 (us-smtp-delivery-124.mimecast.com [170.10.129.124])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 9C4A11123A3
 for <dri-devel@lists.freedesktop.org>; Tue,  2 Aug 2022 03:31:52 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1659411111;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding;
 bh=o+qUDBHIYcaqcwjO19c+9D25AupKrMJUJZGkK9P5m78=;
 b=KRQO1zdCtgB2ROqwuR/FpU6SCxNpjLi8ysUdliocvPEFNcMmTtlfsfSYl4w/o88f1B3XMW
 gWR7VLRwtrOXXktBSm6hw3cvfS3whOFDKqJNlbeBg3PgCns2HA2R42R2fKg1v0Jn7ef1CG
 H1B+z946XWO1e7Yq547ebANuRzZq1Po=
Received: from mail-lf1-f72.google.com (mail-lf1-f72.google.com
 [209.85.167.72]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 us-mta-5-mwQs09v_NPWoUgw0qgChJg-1; Mon, 01 Aug 2022 23:31:50 -0400
X-MC-Unique: mwQs09v_NPWoUgw0qgChJg-1
Received: by mail-lf1-f72.google.com with SMTP id
 z1-20020a0565120c0100b0048ab2910b13so3983616lfu.23
 for <dri-devel@lists.freedesktop.org>; Mon, 01 Aug 2022 20:31:50 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=content-transfer-encoding:mime-version:message-id:date:subject:cc
 :to:from:x-gm-message-state:from:to:cc;
 bh=o+qUDBHIYcaqcwjO19c+9D25AupKrMJUJZGkK9P5m78=;
 b=2Zhqd3kyDo85mFQWFQMktandse3ny+xRox9hTdC6zZH9xKqAuw00DCNo3U6qcmyMhf
 8AoE3mFRB0L61EEbzzbNg3w9g9KsmwWq3c7CLyszslCp8I3MqGHIaZ+WBrw+rlu/qs3t
 RUrpiwvq8lRgiMb9jAbzKnAEbeu9xXYji8ilZwYI+v68E0AqLCSIOgt5u8NVZkXfk3cy
 qv3af9odQstOt8CnZxfufXUaBb0XtPqWONNhW8agL0/Tho70efl6ntqZHWGo/inKS7Hy
 NKTnH6t4si3toMXO9KRQNdakGkH2gLjWndsuKf+hKqefxzQLR3YZXGQYKhKNqkyPnJ6M
 MiQA==
X-Gm-Message-State: AJIora+i/FPp768SvZK/m1NCZg3ZiJ8fyqebbsBZc+AHuubCvJYDkjy9
 X3q9Q2J6TpepTiZY9KCcEjg7fWhe6kKopMO0xw1xV0nZ6v9SldLGGUT2lIIxSJg/CyTHiA9pVdD
 nWm1de1bA4SIbKA4gzx3ff2eHBc9E/wyX+TvTIehQ1VqRy/3NQCRRW6LH0gHH/UmDII8Dj0iwZj
 iMQks=
X-Received: by 2002:a05:6512:131b:b0:48a:26dd:d823 with SMTP id
 x27-20020a056512131b00b0048a26ddd823mr6410280lfu.661.1659411108808; 
 Mon, 01 Aug 2022 20:31:48 -0700 (PDT)
X-Google-Smtp-Source: AGRyM1tGnInis/3hI/Wg6D76XQoQaIffekX2RxhwrwlZ3egFwM2wSRriEz3UlhMmkgJvB+r66uchTQ==
X-Received: by 2002:a05:6512:131b:b0:48a:26dd:d823 with SMTP id
 x27-20020a056512131b00b0048a26ddd823mr6410273lfu.661.1659411108499; 
 Mon, 01 Aug 2022 20:31:48 -0700 (PDT)
Received: from mjp-Z390-AORUS-MASTER.redhat.com
 (91-145-109-188.bb.dnainternet.fi. [91.145.109.188])
 by smtp.gmail.com with ESMTPSA id
 o20-20020a056512053400b0048a73d83b7csm1106012lfc.133.2022.08.01.20.31.47
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Mon, 01 Aug 2022 20:31:47 -0700 (PDT)
From: mpenttil@redhat.com
To: dri-devel@lists.freedesktop.org
Subject: [PATCH] Prevent CPU deadlock with fbdev based consoles while printing
 scheduler warnings
Date: Tue,  2 Aug 2022 06:31:42 +0300
Message-Id: <20220802033142.31655-1-mpenttil@redhat.com>
X-Mailer: git-send-email 2.17.1
MIME-Version: 1.0
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
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
Cc: airlied@linux.ie, =?UTF-8?q?Mika=20Penttil=C3=A4?= <mpenttil@redhat.com>
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

From: Mika Penttilä <mpenttil@redhat.com>

With some fbdev based consoles, using the deferred_io mechanism and drm_fb_helper,
there can be a call chain like:

Backtrack:

try_to_wake_up  <-- rq_lock taken
__queue_work
queue_work_on
soft_cursor
hide_cursor
vt_console_print
console_unlock
vprintk_emit
printk
__warn_printk
(cfs_rq_is_decayed -> SCHED_WARN_ON)
__update_blocked_fair
update_blocked_averages   <-- rq_lock taken

Example producer is with qemu bochs virtio device (qemu stdvga),
and drm bochs support in the guest.

This can fixed be used using schedule_delayed_work() to get out of scheduler context,
if needed, while queueing the damage_work.

Signed-off-by: Mika Penttilä <mpenttil@redhat.com>
Cc: David Airlie <airlied@linux.ie>
---
 drivers/gpu/drm/drm_fb_helper.c | 8 ++++----
 include/drm/drm_fb_helper.h     | 2 +-
 2 files changed, 5 insertions(+), 5 deletions(-)

diff --git a/drivers/gpu/drm/drm_fb_helper.c b/drivers/gpu/drm/drm_fb_helper.c
index 5ad2b6a2778c..6449e8dc97f6 100644
--- a/drivers/gpu/drm/drm_fb_helper.c
+++ b/drivers/gpu/drm/drm_fb_helper.c
@@ -429,7 +429,7 @@ static int drm_fb_helper_damage_blit(struct drm_fb_helper *fb_helper,
 static void drm_fb_helper_damage_work(struct work_struct *work)
 {
 	struct drm_fb_helper *helper = container_of(work, struct drm_fb_helper,
-						    damage_work);
+						    damage_work.work);
 	struct drm_device *dev = helper->dev;
 	struct drm_clip_rect *clip = &helper->damage_clip;
 	struct drm_clip_rect clip_copy;
@@ -488,7 +488,7 @@ void drm_fb_helper_prepare(struct drm_device *dev, struct drm_fb_helper *helper,
 	INIT_LIST_HEAD(&helper->kernel_fb_list);
 	spin_lock_init(&helper->damage_lock);
 	INIT_WORK(&helper->resume_work, drm_fb_helper_resume_worker);
-	INIT_WORK(&helper->damage_work, drm_fb_helper_damage_work);
+	INIT_DELAYED_WORK(&helper->damage_work, drm_fb_helper_damage_work);
 	helper->damage_clip.x1 = helper->damage_clip.y1 = ~0;
 	mutex_init(&helper->lock);
 	helper->funcs = funcs;
@@ -625,7 +625,7 @@ void drm_fb_helper_fini(struct drm_fb_helper *fb_helper)
 		return;
 
 	cancel_work_sync(&fb_helper->resume_work);
-	cancel_work_sync(&fb_helper->damage_work);
+	cancel_delayed_work_sync(&fb_helper->damage_work);
 
 	info = fb_helper->fbdev;
 	if (info) {
@@ -677,7 +677,7 @@ static void drm_fb_helper_damage(struct fb_info *info, u32 x, u32 y,
 	clip->y2 = max_t(u32, clip->y2, y + height);
 	spin_unlock_irqrestore(&helper->damage_lock, flags);
 
-	schedule_work(&helper->damage_work);
+	schedule_delayed_work(&helper->damage_work, in_atomic() ? 1 : 0);
 }
 
 /* Convert memory region into area of scanlines and pixels per scanline */
diff --git a/include/drm/drm_fb_helper.h b/include/drm/drm_fb_helper.h
index 329607ca65c0..65a26d57d517 100644
--- a/include/drm/drm_fb_helper.h
+++ b/include/drm/drm_fb_helper.h
@@ -132,7 +132,7 @@ struct drm_fb_helper {
 	u32 pseudo_palette[17];
 	struct drm_clip_rect damage_clip;
 	spinlock_t damage_lock;
-	struct work_struct damage_work;
+	struct delayed_work damage_work;
 	struct work_struct resume_work;
 
 	/**
-- 
2.17.1

