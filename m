Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 1FC969B4B0D
	for <lists+dri-devel@lfdr.de>; Tue, 29 Oct 2024 14:39:12 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id B739910E65E;
	Tue, 29 Oct 2024 13:39:08 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (1024-bit key; unprotected) header.d=redhat.com header.i=@redhat.com header.b="OuN/UwAU";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from us-smtp-delivery-124.mimecast.com
 (us-smtp-delivery-124.mimecast.com [170.10.133.124])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 6DBDC10E1BE
 for <dri-devel@lists.freedesktop.org>; Tue, 29 Oct 2024 13:39:07 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1730209146;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding;
 bh=d9Bml+ipcFmRE9LbTe8J9ZN0xa8/xqfAjwsu2bf7Us8=;
 b=OuN/UwAUtse/f1lXZoJuCyW6eelab8C2cATv9/o41ueQT+l9i+J4WawDLUL7XZxbTj7lqp
 KocVHsqfQ66SQc3+14RG6Xrhqlfjx4d/BTeE2JH2HH7n3gn7FIrL4+2XhGwexQHEtwuWD9
 GfbhmlfHdLRgrKeZ3QdQdHaICSzzea4=
Received: from mail-wr1-f71.google.com (mail-wr1-f71.google.com
 [209.85.221.71]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_256_GCM_SHA384) id
 us-mta-74-J923qYf8Na6QBfO0DbAn1g-1; Tue, 29 Oct 2024 09:39:04 -0400
X-MC-Unique: J923qYf8Na6QBfO0DbAn1g-1
Received: by mail-wr1-f71.google.com with SMTP id
 ffacd0b85a97d-37d43e7acd9so2726224f8f.2
 for <dri-devel@lists.freedesktop.org>; Tue, 29 Oct 2024 06:39:03 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1730209143; x=1730813943;
 h=content-transfer-encoding:mime-version:message-id:date:subject:cc
 :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
 :reply-to;
 bh=d9Bml+ipcFmRE9LbTe8J9ZN0xa8/xqfAjwsu2bf7Us8=;
 b=crJi03RnYF4SQA9K2KEDklYIh8EqCs3HJunyOBG7sLdT1fnZw7iA33/AABT1Ra4J9+
 Ol3QmxjkWnUbOGM+usFmk7ATfwVB9NWl3l9wt5lKsPJL+Kq8bZdyEq8nakfctTnH3ITw
 nmxHp/d3SxZ0ut1CV3woXzUgC0AkW0un9CuzGm8IcvNOhf0F/LzNeBczGf4TS3q+vpkl
 QR1AdWW3NerTYqeaoVSOxDZESLQ0c2I/e2ebiu9e6j5Hk4gNT4EVwQvwa3GOpOdxrBCp
 c8jHBm8myDuXoqFIXQ05cIqfu1zbjQCkNiGI3k5pxqENM1XaF2kqE2co5kUjT7N0rJR1
 HIJQ==
X-Gm-Message-State: AOJu0Yzq2fMaCUtaapNOcjvA50tOJWCYuFqfb2dbH+C7E7JSE/NYxypT
 FTjD6n5RO4cZIVXkgJohGMs8syWg7cjruYaVFLULTBxDgooC2JPgEnbcu415mbsE+JwfzNaE19a
 MhbsulRUAu/F8F3nUdH4Nt9Z2Ek7sQzA9c1o+97v4p3ZemLYR3VP07TGW3OS3K4eLug==
X-Received: by 2002:a5d:42cb:0:b0:37d:4d3f:51e6 with SMTP id
 ffacd0b85a97d-38061128d8dmr9109495f8f.14.1730209142664; 
 Tue, 29 Oct 2024 06:39:02 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IGnNYQdmX/Cf1HAHGYsP3YDXheGvJlNwRqZ9MpjvXIiGh8raR74zxJw+aczFFjgNuCclCWScw==
X-Received: by 2002:a5d:42cb:0:b0:37d:4d3f:51e6 with SMTP id
 ffacd0b85a97d-38061128d8dmr9109470f8f.14.1730209142246; 
 Tue, 29 Oct 2024 06:39:02 -0700 (PDT)
Received: from eisenberg.redhat.com (nat-pool-muc-t.redhat.com. [149.14.88.26])
 by smtp.gmail.com with ESMTPSA id
 ffacd0b85a97d-38058b713f0sm12525299f8f.75.2024.10.29.06.39.01
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Tue, 29 Oct 2024 06:39:01 -0700 (PDT)
From: Philipp Stanner <pstanner@redhat.com>
To: Luben Tuikov <ltuikov89@gmail.com>,
 Matthew Brost <matthew.brost@intel.com>,
 Danilo Krummrich <dakr@kernel.org>, Philipp Stanner <pstanner@redhat.com>,
 Maarten Lankhorst <maarten.lankhorst@linux.intel.com>,
 Maxime Ripard <mripard@kernel.org>,
 Thomas Zimmermann <tzimmermann@suse.de>, David Airlie <airlied@gmail.com>,
 Simona Vetter <simona@ffwll.ch>, Tvrtko Ursulin <tursulin@ursulin.net>
Cc: dri-devel@lists.freedesktop.org,
	linux-kernel@vger.kernel.org
Subject: [PATCH] drm/sched: Document purpose of drm_sched_{start,stop}
Date: Tue, 29 Oct 2024 14:38:20 +0100
Message-ID: <20241029133819.78696-2-pstanner@redhat.com>
X-Mailer: git-send-email 2.47.0
MIME-Version: 1.0
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
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

drm_sched_start()'s and drm_sched_stop()'s names suggest that those
functions might be intended for actively starting and stopping the
scheduler on initialization and teardown.

They are, however, only used on timeout handling (reset recovery). The
docstrings should reflect that to prevent confusion.

Document those functions' purpose.

Signed-off-by: Philipp Stanner <pstanner@redhat.com>
---
 drivers/gpu/drm/scheduler/sched_main.c | 8 +++++++-
 1 file changed, 7 insertions(+), 1 deletion(-)

diff --git a/drivers/gpu/drm/scheduler/sched_main.c b/drivers/gpu/drm/scheduler/sched_main.c
index eaef20f41786..59fd49fc790e 100644
--- a/drivers/gpu/drm/scheduler/sched_main.c
+++ b/drivers/gpu/drm/scheduler/sched_main.c
@@ -601,6 +601,9 @@ static void drm_sched_job_timedout(struct work_struct *work)
  * callers responsibility to release it manually if it's not part of the
  * pending list any more.
  *
+ * This function is typically used for reset recovery (see the docu of
+ * drm_sched_backend_ops.timedout_job() for details). Do not call it for
+ * scheduler teardown, i.e., before calling drm_sched_fini().
  */
 void drm_sched_stop(struct drm_gpu_scheduler *sched, struct drm_sched_job *bad)
 {
@@ -673,7 +676,6 @@ void drm_sched_stop(struct drm_gpu_scheduler *sched, struct drm_sched_job *bad)
 	 */
 	cancel_delayed_work(&sched->work_tdr);
 }
-
 EXPORT_SYMBOL(drm_sched_stop);
 
 /**
@@ -681,6 +683,10 @@ EXPORT_SYMBOL(drm_sched_stop);
  *
  * @sched: scheduler instance
  *
+ * This function is typically used for reset recovery (see the docu of
+ * drm_sched_backend_ops.timedout_job() for details). Do not call it for
+ * scheduler startup. The scheduler itself is fully operational after
+ * drm_sched_init() succeeded.
  */
 void drm_sched_start(struct drm_gpu_scheduler *sched)
 {
-- 
2.47.0

