Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 87DAB25D1DC
	for <lists+dri-devel@lfdr.de>; Fri,  4 Sep 2020 09:12:20 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 97DEE6EAAB;
	Fri,  4 Sep 2020 07:11:35 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-pf1-x442.google.com (mail-pf1-x442.google.com
 [IPv6:2607:f8b0:4864:20::442])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 2BB0A6E202
 for <dri-devel@lists.freedesktop.org>; Thu,  3 Sep 2020 16:49:26 +0000 (UTC)
Received: by mail-pf1-x442.google.com with SMTP id f18so2772432pfa.10
 for <dri-devel@lists.freedesktop.org>; Thu, 03 Sep 2020 09:49:26 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=idein-jp.20150623.gappssmtp.com; s=20150623;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=+yb8hoZtskHzNjveRfuAP0h+6punyflsDh2kuJbWG58=;
 b=10qKDtDhWG53ztWXB9FdVsqU1Cr/G4Ah6xK9585E49E37PtE8erHQztqfiAg4j8DNj
 863AuV5ZGunrSM7SS4DDUmnE9VzMS2AM1fBF9efQq9GRujRFwUHKVZ+jChhBjWpEGCyK
 BscZPfPgGgVinrPsRBmHgp882hUVQJWnAZImJkWb2eaNB4XacQp/zTSmopGrr/mDHCyU
 kc/rQ0PRiKr2kyVD3QqcDYup3gdMUgf7IUlLX936VWSFR/HPpCd29KhiDu1UisrX5sKv
 QssRz8uF/YWHVLgKGk/8pXEdowgrnAi8k/Tm/Zcb99GYeGqgSnuLunobaZRUJBMkYKCb
 Bk4w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=+yb8hoZtskHzNjveRfuAP0h+6punyflsDh2kuJbWG58=;
 b=UrKSoJ1Zwl32YeAfntsXo1SSXLNqefu15CcZOEiN7Tab9izepkH5WgIt2G7CQJimhX
 uHHdyLi3z+DpyprManIO2pjXz7StTOmCSiTtI2vN7rfTlRefLIYr6sxk1g86LnnnJSBX
 2I0KJqyFoCyz02xE9B7KTIbeijIuD8xgEKDir30sum+aO+gLK3FI6n+UW7QSb8XpaBdg
 NqDsVF2N2l+OwutsHcTQ19naqJf9MdEib6NoDDH2RU8bkEs+3oFBGaJGESyTIMcJDPgI
 0V2mMQy9TN/8WOZW06uZhZ9Mf/OjxzhJrUPiL1wF0lprW5HQ6CrhWOHrDJABDD2EwGC6
 zxHw==
X-Gm-Message-State: AOAM5324i69qALeG+qX5t1cQQj0cSjs4yFJBa35S/H/trqiXpzJMsj5D
 jxGIRI+7F75zRBI0uo4y9ODa3yfTHKemvGs=
X-Google-Smtp-Source: ABdhPJxcWynpg53+rkz8YHfacxSAefCvnxu58Ha9bQWNEGqtSJUJPWA5kTQulhi1awUeHqkqNDOGGw==
X-Received: by 2002:a63:cc49:: with SMTP id q9mr3588094pgi.390.1599151765272; 
 Thu, 03 Sep 2020 09:49:25 -0700 (PDT)
Received: from localhost.localdomain
 (i220-221-200-167.s41.a008.ap.plala.or.jp. [220.221.200.167])
 by smtp.googlemail.com with ESMTPSA id mw8sm2897411pjb.47.2020.09.03.09.49.22
 (version=TLS1_2 cipher=ECDHE-ECDSA-AES128-GCM-SHA256 bits=128/128);
 Thu, 03 Sep 2020 09:49:24 -0700 (PDT)
From: Yukimasa Sugizaki <ysugi@idein.jp>
X-Google-Original-From: Yukimasa Sugizaki <i.can.speak.c.and.basic@gmail.com>
To: dri-devel@lists.freedesktop.org
Subject: [PATCH 1/3] drm/v3d: Don't resubmit guilty CSD jobs
Date: Fri,  4 Sep 2020 01:48:19 +0900
Message-Id: <20200903164821.2879-2-i.can.speak.c.and.basic@gmail.com>
X-Mailer: git-send-email 2.28.0
In-Reply-To: <20200903164821.2879-1-i.can.speak.c.and.basic@gmail.com>
References: <20200903164821.2879-1-i.can.speak.c.and.basic@gmail.com>
MIME-Version: 1.0
X-Mailman-Approved-At: Fri, 04 Sep 2020 07:11:29 +0000
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
Cc: David Airlie <airlied@linux.ie>, Yukimasa Sugizaki <ysugi@idein.jp>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

From: Yukimasa Sugizaki <ysugi@idein.jp>

The previous code misses a check for the timeout error set by
drm_sched_resubmit_jobs(), which results in an infinite GPU reset loop
if once a timeout occurs:

[  178.799106] v3d fec00000.v3d: [drm:v3d_reset [v3d]] *ERROR* Resetting GPU for hang.
[  178.807836] v3d fec00000.v3d: [drm:v3d_reset [v3d]] *ERROR* V3D_ERR_STAT: 0x00001000
[  179.839132] v3d fec00000.v3d: [drm:v3d_reset [v3d]] *ERROR* Resetting GPU for hang.
[  179.847865] v3d fec00000.v3d: [drm:v3d_reset [v3d]] *ERROR* V3D_ERR_STAT: 0x00001000
[  180.879146] v3d fec00000.v3d: [drm:v3d_reset [v3d]] *ERROR* Resetting GPU for hang.
[  180.887925] v3d fec00000.v3d: [drm:v3d_reset [v3d]] *ERROR* V3D_ERR_STAT: 0x00001000
[  181.919188] v3d fec00000.v3d: [drm:v3d_reset [v3d]] *ERROR* Resetting GPU for hang.
[  181.928002] v3d fec00000.v3d: [drm:v3d_reset [v3d]] *ERROR* V3D_ERR_STAT: 0x00001000
...

This commit adds the check for timeout as in v3d_{bin,render}_job_run():

[   66.408962] v3d fec00000.v3d: [drm:v3d_reset [v3d]] *ERROR* Resetting GPU for hang.
[   66.417734] v3d fec00000.v3d: [drm:v3d_reset [v3d]] *ERROR* V3D_ERR_STAT: 0x00001000
[   66.428296] [drm] Skipping CSD job resubmission due to previous error (-125)

, where -125 is -ECANCELED, though users currently have no way other
than inspecting the dmesg to check if the timeout has occurred.

Signed-off-by: Yukimasa Sugizaki <ysugi@idein.jp>
---
 drivers/gpu/drm/v3d/v3d_sched.c | 11 +++++++++++
 1 file changed, 11 insertions(+)

diff --git a/drivers/gpu/drm/v3d/v3d_sched.c b/drivers/gpu/drm/v3d/v3d_sched.c
index 0747614a78f0..001216f22017 100644
--- a/drivers/gpu/drm/v3d/v3d_sched.c
+++ b/drivers/gpu/drm/v3d/v3d_sched.c
@@ -226,6 +226,17 @@ v3d_csd_job_run(struct drm_sched_job *sched_job)
 	struct dma_fence *fence;
 	int i;

+	/* This error is set to -ECANCELED by drm_sched_resubmit_jobs() if this
+	 * job timed out more than sched_job->sched->hang_limit times.
+	 */
+	int error = sched_job->s_fence->finished.error;
+
+	if (unlikely(error < 0)) {
+		DRM_WARN("Skipping CSD job resubmission due to previous error (%d)\n",
+			 error);
+		return ERR_PTR(error);
+	}
+
 	v3d->csd_job = job;

 	v3d_invalidate_caches(v3d);
--
2.7.4

_______________________________________________
dri-devel mailing list
dri-devel@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/dri-devel
