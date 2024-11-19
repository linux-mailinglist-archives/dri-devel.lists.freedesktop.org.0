Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id A1D229D272C
	for <lists+dri-devel@lfdr.de>; Tue, 19 Nov 2024 14:43:14 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 0B36F10E638;
	Tue, 19 Nov 2024 13:43:13 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (1024-bit key; unprotected) header.d=redhat.com header.i=@redhat.com header.b="SfxvfXO3";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from us-smtp-delivery-124.mimecast.com
 (us-smtp-delivery-124.mimecast.com [170.10.133.124])
 by gabe.freedesktop.org (Postfix) with ESMTPS id B413410E638
 for <dri-devel@lists.freedesktop.org>; Tue, 19 Nov 2024 13:43:10 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1732023789;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding;
 bh=q51vTRwe1t2h/8us2udqsXrhP/lb4ZxAuLJ+o2JuCnQ=;
 b=SfxvfXO3DhA/89Ate6yy3r1QSc3RSeBDK4QAxtT8HAZOTtb/w96N6sBXdm6qbO1xZmhMjs
 NKlQmxgEV+dW9+x3Wpoi/yynKWYGojMWCv8UPIuiK4tMteyN/9CgzPP/qdbZ1Nikh7GKp9
 6oTRpQGnzZPcMcOG5akpSuJM2b8Wpgs=
Received: from mail-qk1-f197.google.com (mail-qk1-f197.google.com
 [209.85.222.197]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_256_GCM_SHA384) id
 us-mta-42-T575ydzgOvym4NGiVPpl5A-1; Tue, 19 Nov 2024 08:43:08 -0500
X-MC-Unique: T575ydzgOvym4NGiVPpl5A-1
X-Mimecast-MFC-AGG-ID: T575ydzgOvym4NGiVPpl5A
Received: by mail-qk1-f197.google.com with SMTP id
 af79cd13be357-7b154948b29so633062285a.0
 for <dri-devel@lists.freedesktop.org>; Tue, 19 Nov 2024 05:43:08 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1732023787; x=1732628587;
 h=content-transfer-encoding:mime-version:message-id:date:subject:cc
 :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
 :reply-to;
 bh=q51vTRwe1t2h/8us2udqsXrhP/lb4ZxAuLJ+o2JuCnQ=;
 b=rLZf44ZAXhbFH8hTfa9+7HDIfwpMCkAj5zfTjgKn8bnuK7d6L0K2TVO5Fj4VFN0GNr
 PSCYjOJoIg6Y4aK+rk33jXQXHU0aRkOa+ZkEyQU+Esi4aKi/PSB5WlQoLuVy7WRmCAVX
 yBTysIfPRgRk7C2F668myqWqzMJ9HTJ961fV2XAXAKo607DsjoTb+ag/A2kYWS4F8KEV
 7nPzyGmG0+5YjE/DgbT3P/b5VLQipQf9W90BuUxkLn4EX/dUxCYdXpMMngyi4IraWFHf
 P430t2DtGWCG9noUCrha92wqcHty8UWcXOirtwIi6n3O6XLRZvxfpXGy82OUg2DtbGoE
 hDcA==
X-Gm-Message-State: AOJu0YzOSolTKi6+1Ip1NTnlXqKw6DRECW0ZE3BdM/7EB3R+omCv8UGl
 bE2+ic/fyNf+iJAzB9vg8M7f0LKFnz6A6j/g1ryV4C0mMWU1qQv5K7zao+TX143TNTghmWn5EaQ
 ZtpgbEXegxNh53cHG8bkq1M0PKeP2ICBrbdOFktuCq09LS2XnZNVtXpbOJ5CP2/cdOg==
X-Received: by 2002:a05:620a:f11:b0:7b1:5672:5d46 with SMTP id
 af79cd13be357-7b3622b885emr2283987485a.15.1732023787606; 
 Tue, 19 Nov 2024 05:43:07 -0800 (PST)
X-Google-Smtp-Source: AGHT+IGZfIvNrBCZLyqiCAUGm0Crgd0KH2cCFSun1bEewMvVzk962S1zp7ip9Q5f7nyKGuQ1YjoP/g==
X-Received: by 2002:a05:620a:f11:b0:7b1:5672:5d46 with SMTP id
 af79cd13be357-7b3622b885emr2283985185a.15.1732023787295; 
 Tue, 19 Nov 2024 05:43:07 -0800 (PST)
Received: from eisenberg.redhat.com (nat-pool-muc-u.redhat.com. [149.14.88.27])
 by smtp.gmail.com with ESMTPSA id
 af79cd13be357-7b37a8aa02fsm92513685a.128.2024.11.19.05.43.04
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Tue, 19 Nov 2024 05:43:07 -0800 (PST)
From: Philipp Stanner <pstanner@redhat.com>
To: Luben Tuikov <ltuikov89@gmail.com>,
 Matthew Brost <matthew.brost@intel.com>,
 Danilo Krummrich <dakr@kernel.org>, Philipp Stanner <pstanner@redhat.com>,
 Maarten Lankhorst <maarten.lankhorst@linux.intel.com>,
 Maxime Ripard <mripard@kernel.org>,
 Thomas Zimmermann <tzimmermann@suse.de>, David Airlie <airlied@gmail.com>,
 Simona Vetter <simona@ffwll.ch>
Cc: dri-devel@lists.freedesktop.org, linux-kernel@vger.kernel.org,
 =?UTF-8?q?Christian=20K=C3=B6nig?= <christian.koenig@amd.com>
Subject: [PATCH 1/2] drm/sched: Fix drm_sched_entity_flush() return val
Date: Tue, 19 Nov 2024 14:41:22 +0100
Message-ID: <20241119134122.21950-2-pstanner@redhat.com>
X-Mailer: git-send-email 2.47.0
MIME-Version: 1.0
X-Mimecast-Spam-Score: 0
X-Mimecast-MFC-PROC-ID: WHKQUhs8vtaM3C0j_ZawpMqsVoyokjgh6JDFVkEJxmw_1732023787
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
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

The documentation of drm_sched_entity_flush() states that the function
shall - always - return the remaining timeout time in jiffies.

However, that is not what the function actually does; in one of its if
branches it simply returns the unchanged timeout value.

Furthermore, the used function wait_event_timeout() doesn't always
return the remaining timeout time.

Adjust the function so that it actually does what the documentation
states it shall do.

Cc: Christian König <christian.koenig@amd.com>
Signed-off-by: Philipp Stanner <pstanner@redhat.com>
---
@AMD:
You guys are the only ones who use the function's return code, so I
leave it completely up to you to decide what behavior you want.

But we should at least do something, because right now function
documentation and behavior do not match.

P.
---
 drivers/gpu/drm/scheduler/sched_entity.c | 23 ++++++++++++++++-------
 1 file changed, 16 insertions(+), 7 deletions(-)

diff --git a/drivers/gpu/drm/scheduler/sched_entity.c b/drivers/gpu/drm/scheduler/sched_entity.c
index a75eede8bf8d..16b172aee453 100644
--- a/drivers/gpu/drm/scheduler/sched_entity.c
+++ b/drivers/gpu/drm/scheduler/sched_entity.c
@@ -278,7 +278,7 @@ static void drm_sched_entity_kill(struct drm_sched_entity *entity)
  * waiting, removes the entity from the runqueue and returns an error when the
  * process was killed.
  *
- * Returns the remaining time in jiffies left from the input timeout
+ * Returns: 0 if the timeout ellapsed, the remaining time otherwise.
  */
 long drm_sched_entity_flush(struct drm_sched_entity *entity, long timeout)
 {
@@ -294,15 +294,24 @@ long drm_sched_entity_flush(struct drm_sched_entity *entity, long timeout)
 	 * The client will not queue more IBs during this fini, consume existing
 	 * queued IBs or discard them on SIGKILL
 	 */
-	if (current->flags & PF_EXITING) {
-		if (timeout)
-			ret = wait_event_timeout(
-					sched->job_scheduled,
-					drm_sched_entity_is_idle(entity),
-					timeout);
+	if (timeout != 0 && (current->flags & PF_EXITING)) {
+		ret = wait_event_timeout(sched->job_scheduled,
+				drm_sched_entity_is_idle(entity),
+				timeout);
+		/*
+		 * wait_event_timeout() returns 1 if it timed out but the
+		 * condition became true on timeout. We only care about whether
+		 * it timed out or not.
+		 */
+		if (ret == 1)
+			ret = 0;
 	} else {
 		wait_event_killable(sched->job_scheduled,
 				    drm_sched_entity_is_idle(entity));
+
+		ret -= (long)get_jiffies_64();
+		if (ret < 0)
+			ret = 0;
 	}
 
 	/* For killed process disable any more IBs enqueue right now */
-- 
2.47.0

