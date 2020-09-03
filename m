Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id EE57E25D219
	for <lists+dri-devel@lfdr.de>; Fri,  4 Sep 2020 09:13:56 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id B1E5D6EA95;
	Fri,  4 Sep 2020 07:11:50 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-pg1-x542.google.com (mail-pg1-x542.google.com
 [IPv6:2607:f8b0:4864:20::542])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 4FBC56E202
 for <dri-devel@lists.freedesktop.org>; Thu,  3 Sep 2020 16:49:45 +0000 (UTC)
Received: by mail-pg1-x542.google.com with SMTP id h12so2596861pgm.7
 for <dri-devel@lists.freedesktop.org>; Thu, 03 Sep 2020 09:49:45 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=idein-jp.20150623.gappssmtp.com; s=20150623;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=j+qOwJ3GIDW7GU1HM7VpyWshvkHIrsBue+nt2OB0v9Y=;
 b=CcV8feBeWvjB7Gm/Lhgf9B6W0O+Z13xkQJJXTD4mHviOHFrf4kz8jTSuXechD/8j8G
 sd92hdnriFJLbXTfVcBnQKDKSH1OnkB6or5gReIcC33midFFqDP5dliMb5/qMMPwzSJs
 fmDh/VZi0GSQwlNKO4EuxRu2IDoxywK1YMV96Gr94HSmLw9RA6eV4NYIh2isAvh6iLOA
 pgk+vhkXVPnwxwCw1WkITPcQVGNzn4Z9W+fCm4cIsykjMMm+NvI9PF1U2mi80oyUO6Fj
 e3GasYn+vzzXMXY4MHyOTBumK+zDzxdGE7aybX0/U8oLKvDsZa1g1VswZCubXuUl710b
 s63w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=j+qOwJ3GIDW7GU1HM7VpyWshvkHIrsBue+nt2OB0v9Y=;
 b=FLtThX5watI4VpWnrTkEVTsxEoQwZipDhLORwVHk6pVIsJSAhqIeJKOjR7ana852PO
 l/OiixQue5LbeiqOJlhO82w4o7NBE+g4IwJg15SR4QTYt+lheRLdtpL4LCAvRqfd3wJB
 MHTwUQKsd609ynaxa4rF/tIuFCE4BsHgB46F4pyF+MMVCu84ydpBI8uXjX1RiOBmJC66
 5vlWvYWhef9rsnm7pdut6xbZAsqENu+o/yXYsLQKh5sbEsotU99HOIvrK/A6FHH2mjuQ
 7U3vRVDdY5xREO5Ltye2bGvWwmcNG9NVVWqQad2hBND4Z1Gyj8k0E7L4omF0ie5yk4H7
 wrcg==
X-Gm-Message-State: AOAM530/5CrKqSlWloQtq9nvuLGuCYjP3tLmIbcLa3WRNF2yEKMA4p8u
 x+bGUh913m10XtT1MqHJsPZSyyeqP/iIlUc=
X-Google-Smtp-Source: ABdhPJxSVYX8DeiruArBlM7H2GTf9xhDRx7ANZN2VRI6PLfUB4c/cqXhkhot4RO/BeuPWZygw1R3BQ==
X-Received: by 2002:a63:110c:: with SMTP id g12mr3535069pgl.91.1599151784521; 
 Thu, 03 Sep 2020 09:49:44 -0700 (PDT)
Received: from localhost.localdomain
 (i220-221-200-167.s41.a008.ap.plala.or.jp. [220.221.200.167])
 by smtp.googlemail.com with ESMTPSA id mw8sm2897411pjb.47.2020.09.03.09.49.41
 (version=TLS1_2 cipher=ECDHE-ECDSA-AES128-GCM-SHA256 bits=128/128);
 Thu, 03 Sep 2020 09:49:43 -0700 (PDT)
From: Yukimasa Sugizaki <ysugi@idein.jp>
X-Google-Original-From: Yukimasa Sugizaki <i.can.speak.c.and.basic@gmail.com>
To: dri-devel@lists.freedesktop.org
Subject: [PATCH 2/3] drm/v3d: Correctly restart the timer when progress is made
Date: Fri,  4 Sep 2020 01:48:20 +0900
Message-Id: <20200903164821.2879-3-i.can.speak.c.and.basic@gmail.com>
X-Mailer: git-send-email 2.28.0
In-Reply-To: <20200903164821.2879-1-i.can.speak.c.and.basic@gmail.com>
References: <20200903164821.2879-1-i.can.speak.c.and.basic@gmail.com>
MIME-Version: 1.0
X-Mailman-Approved-At: Fri, 04 Sep 2020 07:11:34 +0000
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
Cc: Emily Deng <Emily.Deng@amd.com>, David Airlie <airlied@linux.ie>,
 =?UTF-8?q?Christian=20K=C3=B6nig?= <christian.koenig@amd.com>,
 Yukimasa Sugizaki <ysugi@idein.jp>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

From: Yukimasa Sugizaki <ysugi@idein.jp>

The V3D scheduler wants a timed-out job to continue running if it made
progress.  However, the current DRM scheduler removes the timed-out job
from ring_mirror_list and thus the timer is not restarted automatically,
resulting in an infinite timeout.  We need stop and restart the DRM
scheduler to rearm the timer.

Fixes: 135517d3565b ("drm/scheduler: Avoid accessing freed bad job.")
Signed-off-by: Yukimasa Sugizaki <ysugi@idein.jp>
---
 drivers/gpu/drm/v3d/v3d_sched.c | 27 +++++++++++++++++++++++++++
 1 file changed, 27 insertions(+)

diff --git a/drivers/gpu/drm/v3d/v3d_sched.c b/drivers/gpu/drm/v3d/v3d_sched.c
index 001216f22017..feef0c749e68 100644
--- a/drivers/gpu/drm/v3d/v3d_sched.c
+++ b/drivers/gpu/drm/v3d/v3d_sched.c
@@ -312,9 +312,24 @@ v3d_cl_job_timedout(struct drm_sched_job *sched_job, enum v3d_queue q,
 	u32 ctca = V3D_CORE_READ(0, V3D_CLE_CTNCA(q));
 	u32 ctra = V3D_CORE_READ(0, V3D_CLE_CTNRA(q));

+	/* If we've made progress, skip reset and let the timer get
+	 * rearmed.
+	 */
 	if (*timedout_ctca != ctca || *timedout_ctra != ctra) {
 		*timedout_ctca = ctca;
 		*timedout_ctra = ctra;
+
+		/* Because the timed-out job has been removed from
+		 * ring_mirror_list in drm_sched_job_timedout(), we need to
+		 * stop and restart the scheduler to rearm the timer.
+		 * Holding the reset_lock is necessary for concurrent
+		 * v3d_gpu_reset_for_timeout().
+		 */
+		mutex_lock(&v3d->reset_lock);
+		drm_sched_stop(sched_job->sched, sched_job);
+		drm_sched_start(sched_job->sched, sched_job);
+		mutex_unlock(&v3d->reset_lock);
+
 		return;
 	}

@@ -359,6 +374,18 @@ v3d_csd_job_timedout(struct drm_sched_job *sched_job)
 	 */
 	if (job->timedout_batches != batches) {
 		job->timedout_batches = batches;
+
+		/* Because the timed-out job has been removed from
+		 * ring_mirror_list in drm_sched_job_timedout(), we need to
+		 * stop and restart the scheduler to rearm the timer.
+		 * Holding the reset_lock is necessary for concurrent
+		 * v3d_gpu_reset_for_timeout().
+		 */
+		mutex_lock(&v3d->reset_lock);
+		drm_sched_stop(sched_job->sched, sched_job);
+		drm_sched_start(sched_job->sched, sched_job);
+		mutex_unlock(&v3d->reset_lock);
+
 		return;
 	}

--
2.7.4

_______________________________________________
dri-devel mailing list
dri-devel@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/dri-devel
