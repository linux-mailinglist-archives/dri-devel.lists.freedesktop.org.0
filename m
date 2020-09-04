Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 80C2825D356
	for <lists+dri-devel@lfdr.de>; Fri,  4 Sep 2020 10:17:12 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 8304D6E270;
	Fri,  4 Sep 2020 08:17:10 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-pf1-x444.google.com (mail-pf1-x444.google.com
 [IPv6:2607:f8b0:4864:20::444])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 665796E270
 for <dri-devel@lists.freedesktop.org>; Fri,  4 Sep 2020 08:17:09 +0000 (UTC)
Received: by mail-pf1-x444.google.com with SMTP id u128so4195715pfb.6
 for <dri-devel@lists.freedesktop.org>; Fri, 04 Sep 2020 01:17:09 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=idein-jp.20150623.gappssmtp.com; s=20150623;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=+JeVLT/WaUYTSHSWdrjuLzdLGSzem2YaDGxkRD0Qvmg=;
 b=g+EcxEwLcsXGmrEDWVxy+SuwHKvezP1OKoJF4cFtCiz03Yk6l0pDwqwbDRp9FM5brH
 CR4MeSOBFl7BmJYLC3auA3DcFw5fHQ39PEeu/EtvO44GK/j+cvrM4aptkHzgKtKUrWzz
 36igMpwAcNrp62UOKrb/PELQY42Z/YLghmWqSefTqUFcbpKolfVOB9uwMXE2uUfhnHLm
 4RPwcKQ4IUTf5n1o9F5Q/JcnZSJ/BxZmads7eoQ8qqO75T7/14sMR1cuJmqPWI4kDLHj
 /2JYuPfm9N2VvK7459oYeybwDNKmsOoM7q+FpuwRh1i3dGaiqR6QzIMyUtnwk2MISSnN
 5bQg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=+JeVLT/WaUYTSHSWdrjuLzdLGSzem2YaDGxkRD0Qvmg=;
 b=N90u5HDFOa/3OkwJJss1C8yj9zstIz3kJm8twCp6A/r4QP3rTadSqaWQE2l8zjVN5k
 pRsOEaNzAu15WQmazuDDsvClu43kLYDChZGk3xqsUS9uxyvZUFpMSBrM6CbRUtgRZVg4
 rnI/RFWdiLJJyqAh2KgdIlruIAvG4VMi6XXGrH2wI7IlZeuFgQB6J0cP4w9q3U1CDd+P
 UFSi6nIVDQM5xBSamLh5Yxxy8njQO5GAzhe0JohKsc29rtqX7e4ECmbl/8IHtXY1I9Sx
 Agl6C/rz9Cz46e7UAlBout3T/t+aQUkHyojBae1WvFjg//3kOjsbdWpa4+KUcsKC+I+T
 kGQQ==
X-Gm-Message-State: AOAM533pbWrnsG0g3p3cAM6KHUQqphrtgtlb6ulgpesRmO37cYLExAk0
 3AjEg8Cush1SxALCOShIRJp8FDd4BLNTEWUzjg==
X-Google-Smtp-Source: ABdhPJx1Twn8R9iiLL2f/YS21M0XvQUr7e3trAyQcFohW4v9mHn8X2uKVkaZUVko0SJC89aLiuD1Ww==
X-Received: by 2002:a62:1a95:0:b029:13c:1611:66bd with SMTP id
 a143-20020a621a950000b029013c161166bdmr5962989pfa.8.1599207428577; 
 Fri, 04 Sep 2020 01:17:08 -0700 (PDT)
Received: from localhost.localdomain
 (i220-221-200-167.s41.a008.ap.plala.or.jp. [220.221.200.167])
 by smtp.googlemail.com with ESMTPSA id i16sm20202630pjv.0.2020.09.04.01.17.05
 (version=TLS1_2 cipher=ECDHE-ECDSA-AES128-GCM-SHA256 bits=128/128);
 Fri, 04 Sep 2020 01:17:07 -0700 (PDT)
From: Yukimasa Sugizaki <ysugi@idein.jp>
To: dri-devel@lists.freedesktop.org
Subject: [PATCH 2/3] drm/v3d: Correctly restart the timer when progress is made
Date: Fri,  4 Sep 2020 17:15:52 +0900
Message-Id: <20200904081552.38052-3-ysugi@idein.jp>
X-Mailer: git-send-email 2.28.0
In-Reply-To: <20200904081552.38052-1-ysugi@idein.jp>
References: <20200904081552.38052-1-ysugi@idein.jp>
MIME-Version: 1.0
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
