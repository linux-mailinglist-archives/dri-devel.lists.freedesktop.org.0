Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 0C1394B9ACF
	for <lists+dri-devel@lfdr.de>; Thu, 17 Feb 2022 09:24:36 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id DF81110E95B;
	Thu, 17 Feb 2022 08:24:32 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-lf1-x12d.google.com (mail-lf1-x12d.google.com
 [IPv6:2a00:1450:4864:20::12d])
 by gabe.freedesktop.org (Postfix) with ESMTPS id F419710F149
 for <dri-devel@lists.freedesktop.org>; Wed, 16 Feb 2022 14:13:22 +0000 (UTC)
Received: by mail-lf1-x12d.google.com with SMTP id d23so4018798lfv.13
 for <dri-devel@lists.freedesktop.org>; Wed, 16 Feb 2022 06:13:22 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:dkim-signature:mime-version:precedence:list-id
 :content-transfer-encoding;
 bh=3ZyUSPlGqRZPZU/gevmWS0TcFbtyhKP7S0zjcIQWO/Q=;
 b=sEzEE/LwHGWzsp3aF69P3h+TAdURkfuuGcB3ELdVEUh8vso8NnSlvgs1wnMA8iXNlx
 OZj+8UJFqcuYqCaf9FddoJ/jVchuMWzx/K+nOGuL+w8E6Y/X1z+DXfljXEw854gayzkY
 mONCvs8oIWa3Pa2lVoTZz9DkylsCt3qeGVq41+cI1z0Veyc9Dqp7YEWTfP4cMWDoMS+A
 l38poaNSWWEPNPPpl5T4A9KIkJnhP6ea4mlKoW+Ggmsnmjbqy4BoYKZh2rqIKWQmYyZ7
 HJIvzN7pS313FCVcGE1Jw6xt80zHEtkHHYK3uj0BchBkUG+IGa0Yf2QBI57bc9vF2CUn
 kHMA==
X-Gm-Message-State: AOAM533z8HfM9EZ8x0kD5VVvOyvyXE9ge3cf4MJ1QSR0DODvXaSW2lZC
 KWaxRLk1PmsFLEQQ4ozcafa5Ug==
X-Google-Smtp-Source: ABdhPJxgRI6MksKLFL9ndGeRIkO1HZy9NFrYk7wZrX3BdFbwyaxdUsdWYItybk9MhkvnRPVdEyyrCg==
X-Received: by 2002:a05:6512:10c2:b0:441:fa79:8893 with SMTP id
 k2-20020a05651210c200b00441fa798893mr2121701lfg.480.1645020801113; 
 Wed, 16 Feb 2022 06:13:21 -0800 (PST)
Received: from localhost (c-9b28e555.07-21-73746f28.bbcust.telenor.se.
 [85.229.40.155])
 by smtp.gmail.com with ESMTPSA id h11sm2799428lfr.208.2022.02.16.06.13.20
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Wed, 16 Feb 2022 06:13:20 -0800 (PST)
From: Anders Roxell <anders.roxell@linaro.org>
To: robdclark@gmail.com,
	dri-devel@lists.freedesktop.org
Subject: [PATCH v3 2/2] drm/msm/gpu: Cancel idle/boost work on suspend
Date: Wed, 16 Feb 2022 15:13:13 +0100
Message-Id: <20220108180913.814448-3-robdclark@gmail.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20220108180913.814448-1-robdclark@gmail.com>
References: <20220108180913.814448-1-robdclark@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
 aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18]) by
 smtp.lore.kernel.org (Postfix) with ESMTP id 0AEE4C433EF for
 <linux-arm-msm@archiver.kernel.org>; Sat,  8 Jan 2022 18:09:36 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand id
 S234899AbiAHSJc (ORCPT <rfc822; linux-arm-msm@archiver.kernel.org>);
 Sat, 8 Jan 2022 13:09:32 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:43366 "EHLO
 lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org with
 ESMTP id S234868AbiAHSJa (ORCPT <rfc822; linux-arm-msm@vger.kernel.org>);
 Sat, 8 Jan 2022 13:09:30 -0500
Received: from mail-pj1-x102d.google.com (mail-pj1-x102d.google.com
 [IPv6:2607:f8b0:4864:20::102d]) by lindbergh.monkeyblade.net (Postfix) with
 ESMTPS id B6719C06173F; Sat,  8 Jan 2022 10:09:29 -0800 (PST)
Received: by mail-pj1-x102d.google.com with SMTP id hv15so1844920pjb.5;
 Sat, 08 Jan 2022 10:09:29 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20210112;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=NpENl1wlwqcfbBT73rctGeiDbGEPDlZ8miqyZA+HW/A=;
 b=Dadc/cXPO0Uubd/3MkatQs1U4WERUA3XCupDgrJmGVsJIwvpDXnqEeetn63+ka7T6Z
 QJYYtuWQ5Gyrir8ulQHyjWOX0EnHqHvClV0uivmDk7DPOB7iZRL6wlcZIglDpjtOJ1su
 +W99NY5LlfFCa7TGy62ZQFZTX88A0anOL/loyhDqYjjitMGy92fcAVjzSMnBVdlt7yDE
 94MyLMx/eNiHmh8ipu6YCC6PkDl1WMt9c9uXODNhAR5deTV37UvygLEdopJp7mibuvN6
 knAv7q0CKzIOYCT7fetCaRQb7VFAyZT45H84lTcSs7ZqxIxoj3u2UdaLqu3DiBYylpPp iPmg==
X-Received: by 2002:a17:902:e749:b0:148:f083:3905 with SMTP id
 p9-20020a170902e74900b00148f0833905mr68561286plf.136.1641665369257;
 Sat, 08 Jan 2022 10:09:29 -0800 (PST)
Received: from localhost ([2601:1c0:5200:a6:307:a401:7b76:c6e5]) by
 smtp.gmail.com with ESMTPSA id ng7sm2564668pjb.41.2022.01.08.10.09.28
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Sat, 08 Jan 2022 10:09:28 -0800 (PST)
X-Mailer: git-send-email 2.33.1
MIME-Version: 1.0
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
Content-Transfer-Encoding: 8bit
X-Mailman-Approved-At: Thu, 17 Feb 2022 08:24:32 +0000
X-BeenThere: dri-devel@lists.freedesktop.org
X-Mailman-Version: 2.1.29
List-Id: Direct Rendering Infrastructure - Development
 <dri-devel.lists.freedesktop.org>
List-Unsubscribe: <https://lists.freedesktop.org/mailman/options/dri-devel>,
 <mailto:dri-devel-request@lists.freedesktop.org?subject=unsubscribe>
List-Archive: <https://lists.freedesktop.org/archives/dri-devel>
List-Post: <mailto:dri-devel@lists.freedesktop.org>
List-Help: <mailto:dri-devel-request@lists.freedesktop.org?subject=help>
List-Subscribe: <https://lists.freedesktop.org/mailman/listinfo/dri-devel>,
 <mailto:dri-devel-request@lists.freedesktop.org?subject=subscribe>
Cc: robdclark@chromium.org, airlied@linux.ie, linux-arm-msm@vger.kernel.org,
 linux-kernel@vger.kernel.org, quic_abhinavk@quicinc.com, sean@poorly.run,
 freedreno@lists.freedesktop.org
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

From: Rob Clark <robdclark@gmail.com>

From: Rob Clark <robdclark@chromium.org>

With system suspend using pm_runtime_force_suspend() we can't rely on
the pm_runtime_get_if_in_use() trick to deal with devfreq callbacks
after (or racing with) suspend.  So flush any pending idle or boost
work in the suspend path.

Signed-off-by: Rob Clark <robdclark@chromium.org>
---
 drivers/gpu/drm/msm/msm_gpu_devfreq.c | 21 +++++++++++++++++++--
 1 file changed, 19 insertions(+), 2 deletions(-)

diff --git a/drivers/gpu/drm/msm/msm_gpu_devfreq.c b/drivers/gpu/drm/msm/msm_gpu_devfreq.c
index 62405e980925..9bf319be11f6 100644
--- a/drivers/gpu/drm/msm/msm_gpu_devfreq.c
+++ b/drivers/gpu/drm/msm/msm_gpu_devfreq.c
@@ -133,6 +133,18 @@ void msm_devfreq_init(struct msm_gpu *gpu)
 			      CLOCK_MONOTONIC, HRTIMER_MODE_REL);
 }
 
+static void cancel_idle_work(struct msm_gpu_devfreq *df)
+{
+	hrtimer_cancel(&df->idle_work.timer);
+	kthread_cancel_work_sync(&df->idle_work.work);
+}
+
+static void cancel_boost_work(struct msm_gpu_devfreq *df)
+{
+	hrtimer_cancel(&df->boost_work.timer);
+	kthread_cancel_work_sync(&df->boost_work.work);
+}
+
 void msm_devfreq_cleanup(struct msm_gpu *gpu)
 {
 	struct msm_gpu_devfreq *df = &gpu->devfreq;
@@ -152,7 +164,12 @@ void msm_devfreq_resume(struct msm_gpu *gpu)
 
 void msm_devfreq_suspend(struct msm_gpu *gpu)
 {
-	devfreq_suspend_device(gpu->devfreq.devfreq);
+	struct msm_gpu_devfreq *df = &gpu->devfreq;
+
+	devfreq_suspend_device(df->devfreq);
+
+	cancel_idle_work(df);
+	cancel_boost_work(df);
 }
 
 static void msm_devfreq_boost_work(struct kthread_work *work)
@@ -196,7 +213,7 @@ void msm_devfreq_active(struct msm_gpu *gpu)
 	/*
 	 * Cancel any pending transition to idle frequency:
 	 */
-	hrtimer_cancel(&df->idle_work.timer);
+	cancel_idle_work(df);
 
 	idle_time = ktime_to_ms(ktime_sub(ktime_get(), df->idle_time));
 
-- 
2.33.1


From mboxrd@z Thu Jan  1 00:00:00 1970
Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 0DF7AC433F5
	for <dri-devel@archiver.kernel.org>; Sat,  8 Jan 2022 18:09:35 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id AC6CB10F2B7;
	Sat,  8 Jan 2022 18:09:31 +0000 (UTC)
Received: from mail-pj1-x102e.google.com (mail-pj1-x102e.google.com
 [IPv6:2607:f8b0:4864:20::102e])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 53F5A10F2B2;
 Sat,  8 Jan 2022 18:09:30 +0000 (UTC)
Received: by mail-pj1-x102e.google.com with SMTP id
 lr15-20020a17090b4b8f00b001b19671cbebso10921629pjb.1; 
 Sat, 08 Jan 2022 10:09:30 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20210112;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=NpENl1wlwqcfbBT73rctGeiDbGEPDlZ8miqyZA+HW/A=;
 b=Dadc/cXPO0Uubd/3MkatQs1U4WERUA3XCupDgrJmGVsJIwvpDXnqEeetn63+ka7T6Z
 QJYYtuWQ5Gyrir8ulQHyjWOX0EnHqHvClV0uivmDk7DPOB7iZRL6wlcZIglDpjtOJ1su
 +W99NY5LlfFCa7TGy62ZQFZTX88A0anOL/loyhDqYjjitMGy92fcAVjzSMnBVdlt7yDE
 94MyLMx/eNiHmh8ipu6YCC6PkDl1WMt9c9uXODNhAR5deTV37UvygLEdopJp7mibuvN6
 knAv7q0CKzIOYCT7fetCaRQb7VFAyZT45H84lTcSs7ZqxIxoj3u2UdaLqu3DiBYylpPp
 iPmg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=NpENl1wlwqcfbBT73rctGeiDbGEPDlZ8miqyZA+HW/A=;
 b=v8m1bCe6MSTkQVdmofVW3V0nJn5uYDOvN91V7qIcNniz5lZIyitJnWEU6nk4Qs5+0B
 sGXvK8eJq05/tRBO988F0OmO5CRWZdt7TzKrFfvbTgkmVEFUoR0eXvXcSP6bh2AA3x+H
 9nC67C7Xw8/2OK+6wUYe+nLogfTPXVUYd4IQwRZ7taTQH6x1Uaq+LENCPTjmtiOC1/l6
 wEVNsdbQYglWE7xKKmlE3LGkEive83eREZhPgSgaUzaLpuiew2H1pC60VJL4AVvj3jy8
 eCXp/yIhOnSpfwlF66XD2d42psOPeGzZKngNEYVf31efqCfew6oxhL0OFFvESnJstadm
 RAlg==
X-Gm-Message-State: AOAM532NKnqTmW0RBLp3hLEszOlTWrFv6ApNkvB5QZhAnCWZchPYJjFP
 SXfBchbX4NJ3H0TtYPf6Oou5EPJqfxs=
X-Google-Smtp-Source: ABdhPJx4ZDShbND64UCj+uvq1tWaXe/Sn2QWDwmlo3FJc5MoNWsmz0nVsKR3UQiVl1O+Xbl8i6SO9g==
X-Received: by 2002:a17:902:e749:b0:148:f083:3905 with SMTP id
 p9-20020a170902e74900b00148f0833905mr68561286plf.136.1641665369257; 
 Sat, 08 Jan 2022 10:09:29 -0800 (PST)
Received: from localhost ([2601:1c0:5200:a6:307:a401:7b76:c6e5])
 by smtp.gmail.com with ESMTPSA id ng7sm2564668pjb.41.2022.01.08.10.09.28
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Sat, 08 Jan 2022 10:09:28 -0800 (PST)
From: Rob Clark <robdclark@gmail.com>
To: dri-devel@lists.freedesktop.org
Subject: [PATCH v3 2/2] drm/msm/gpu: Cancel idle/boost work on suspend
Date: Sat,  8 Jan 2022 10:09:11 -0800
Message-Id: <20220108180913.814448-3-robdclark@gmail.com>
X-Mailer: git-send-email 2.33.1
In-Reply-To: <20220108180913.814448-1-robdclark@gmail.com>
References: <20220108180913.814448-1-robdclark@gmail.com>
MIME-Version: 1.0
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
Cc: Rob Clark <robdclark@chromium.org>, David Airlie <airlied@linux.ie>,
 linux-arm-msm@vger.kernel.org, Abhinav Kumar <quic_abhinavk@quicinc.com>,
 open list <linux-kernel@vger.kernel.org>, Sean Paul <sean@poorly.run>,
 freedreno@lists.freedesktop.org
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

From: Rob Clark <robdclark@chromium.org>

> With system suspend using pm_runtime_force_suspend() we can't rely on
> the pm_runtime_get_if_in_use() trick to deal with devfreq callbacks
> after (or racing with) suspend.  So flush any pending idle or boost
> work in the suspend path.

While booting Linux mainline on arm64 qcom db410c device the following
kernel NULL pointer dereference noticed due to this patch
 [1] drm/msm/gpu: Cancel idle/boost work on suspend

 [   17.207382] Unable to handle kernel NULL pointer dereference at
 virtual address 0000000000000010
 [   17.207755] Mem abort info:
 [   17.215915]   ESR = 0x96000004
 [   17.217903]   EC = 0x25: DABT (current EL), IL = 32 bits
 [   17.225033]   SET = 0, FnV = 0
 [   17.226501]   EA = 0, S1PTW = 0
 [   17.233147]   FSC = 0x04: level 0 translation fault
 [   17.233332] Data abort info:
 [   17.238135]   ISV = 0, ISS = 0x00000004
 [   17.240720]   CM = 0, WnR = 0
 [   17.244061] user pgtable: 4k pages, 48-bit VAs, pgdp=000000008e7b9000
 [   17.247323] [0000000000000010] pgd=080000008e790003,
 p4d=080000008e790003, pud=080000008c2aa003, pmd=0000000000000000
 [   17.254369] Internal error: Oops: 96000004 [#1] PREEMPT SMP
 [   17.264042] Modules linked in: crct10dif_ce qcom_wcnss_pil
 adv7511(+) cec qcom_pon rtc_pm8xxx qcom_spmi_temp_alarm qcom_spmi_vadc
 qcom_vadc_common snd_soc_msm8916_digital snd_soc_msm8916_analog
 qcom_camss snd_soc_apq8016_sbc snd_soc_lpass_apq8016 snd_soc_lpass_cpu
 qcom_q6v5_mss qcom_pil_info snd_soc_lpass_platform qcom_q6v5
 snd_soc_qcom_common msm videobuf2_dma_sg qcom_sysmon venus_core
 qcom_common v4l2_fwnode qcom_rng qcom_glink_smem v4l2_async
 v4l2_mem2mem qmi_helpers qnoc_msm8916 gpu_sched mdt_loader
 videobuf2_memops qcom_stats videobuf2_v4l2 videobuf2_common
 i2c_qcom_cci display_connector icc_smd_rpm drm_kms_helper rpmsg_char
 socinfo rfkill rmtfs_mem drm qrtr fuse
 [   17.306825] CPU: 2 PID: 67 Comm: kworker/2:2 Not tainted 5.17.0-rc1 #1
 [   17.328796] Hardware name: Qualcomm Technologies, Inc. APQ 8016 SBC (DT)
 [   17.335137] Workqueue: pm pm_runtime_work
 [   17.341979] pstate: 60000005 (nZCv daif -PAN -UAO -TCO -DIT -SSBS BTYPE=--)
 [   17.345896] pc : hrtimer_active+0x14/0x80
 [   17.352652] lr : hrtimer_cancel+0x28/0x70

 Reported-by: Linux Kernel Functional Testing <lkft@linaro.org>
 Reported-by: Anders Roxell <anders.roxell@linaro.org>

 kernel crash log links [2][3].

Cheers,
Anders
[1] https://lore.kernel.org/all/20220108180913.814448-3-robdclark@gmail.com/
[2] https://lkft.validation.linaro.org/scheduler/job/4422191#L2360
[3] https://qa-reports.linaro.org/lkft/linux-mainline-master/build/v5.17-rc1-230-g145d9b498fc8/testrun/7713584/suite/linux-log-parser/test/check-kernel-oops-4422047/log
