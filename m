Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 8C44925D354
	for <lists+dri-devel@lfdr.de>; Fri,  4 Sep 2020 10:17:06 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id BD0D26E262;
	Fri,  4 Sep 2020 08:17:04 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-pj1-x1041.google.com (mail-pj1-x1041.google.com
 [IPv6:2607:f8b0:4864:20::1041])
 by gabe.freedesktop.org (Postfix) with ESMTPS id CD1C16E270
 for <dri-devel@lists.freedesktop.org>; Fri,  4 Sep 2020 08:17:03 +0000 (UTC)
Received: by mail-pj1-x1041.google.com with SMTP id n3so4888986pjq.1
 for <dri-devel@lists.freedesktop.org>; Fri, 04 Sep 2020 01:17:03 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=idein-jp.20150623.gappssmtp.com; s=20150623;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=X8d+hfgA9Ii9/0R8jrf0w6bherNqm+Veb9EADkBuhkw=;
 b=fFnPtrRlqEFeiiNKuxhcwPC7u7l0mp4nTHM+n19g2H1tDnhDn+Mai/hADyD1bVvHLg
 wgaXB9cqujbPJ0DjsCh1gAoOQlmsK0YsJyhk2Rk2je5hjii4LEPEoGibbcFfR81cJUIa
 YaUp932aZXZ9+m+YXWoXU23q8HQhqE4Rgmgk7cQyIgYanvs/EK8S+YEoJ87c1rLN7K1v
 mj11ghs5BagMJOa0e1ULnAGagwDTgbR64lEVYPMSLcdOmeFsdQ0iB+7rlHevWuyqfN6i
 fgt4/1y8f6cftEQ6UYsy6g8zZ/axNWbuAXv1NaL3xj65X9x2CcLfrGWr6LR/4RO3CQd0
 3TVQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=X8d+hfgA9Ii9/0R8jrf0w6bherNqm+Veb9EADkBuhkw=;
 b=XwMTMfroTNgSIp3+/oaqxypehifn4cFYOVzAswnRdT/QhhuZoh/a5aQuEpTP+Ys4cd
 8cPsj1zFVigPA51KHuY+1Oau3+et8/FdlerVFatoLSnRWVcMmw308GhNfV8JxhT1ROOE
 R09vPaccCSyAdMWLBTcslousBpSNxGacGUSzNVJPE8tUN6LELHC0EUHiCZswLKeHm4JN
 ospXY3UB+S1rH3xp9hJIAqjmWz07Aomw6YesHjuDPPJ2T3/FBS4VJDwtqXl+ZBLquYAi
 WaArvigz+OLJ8qlBqV/YGrcTDmI5i8SnxKBzC7m51sJrQu6LTU1vEugM4o2GpAzrhLT0
 fu6Q==
X-Gm-Message-State: AOAM531GhCCP1qhVHK/5eVrE5KqRi+nflRKiwKSuiKYVAtUtDx8awNCv
 Epd4tHQojpbzRWT1fq95ESTkXwiUj5CMbSR3zQ==
X-Google-Smtp-Source: ABdhPJyXCYCK5wyYdKH2S9UAASeHxeqjgDG6XS64tlEQtMmSqrGS66d+BiyfDIT3gA/xhrMalOPgSA==
X-Received: by 2002:a17:902:6b85:: with SMTP id
 p5mr7730070plk.235.1599207423032; 
 Fri, 04 Sep 2020 01:17:03 -0700 (PDT)
Received: from localhost.localdomain
 (i220-221-200-167.s41.a008.ap.plala.or.jp. [220.221.200.167])
 by smtp.googlemail.com with ESMTPSA id i16sm20202630pjv.0.2020.09.04.01.17.00
 (version=TLS1_2 cipher=ECDHE-ECDSA-AES128-GCM-SHA256 bits=128/128);
 Fri, 04 Sep 2020 01:17:02 -0700 (PDT)
From: Yukimasa Sugizaki <ysugi@idein.jp>
To: dri-devel@lists.freedesktop.org
Subject: [PATCH 1/3] drm/v3d: Don't resubmit guilty CSD jobs
Date: Fri,  4 Sep 2020 17:15:51 +0900
Message-Id: <20200904081552.38052-2-ysugi@idein.jp>
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
Cc: David Airlie <airlied@linux.ie>, Yukimasa Sugizaki <ysugi@idein.jp>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

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
