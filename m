Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 332DF45803E
	for <lists+dri-devel@lfdr.de>; Sat, 20 Nov 2021 20:56:12 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 900F86E239;
	Sat, 20 Nov 2021 19:56:03 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-pj1-x1035.google.com (mail-pj1-x1035.google.com
 [IPv6:2607:f8b0:4864:20::1035])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 677496E1EC;
 Sat, 20 Nov 2021 19:56:00 +0000 (UTC)
Received: by mail-pj1-x1035.google.com with SMTP id
 gf14-20020a17090ac7ce00b001a7a2a0b5c3so13532007pjb.5; 
 Sat, 20 Nov 2021 11:56:00 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20210112;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=f6ln+3/9DBZRpR4O41lZm+OOJ4C7JaNKQynsg2JOb2g=;
 b=gK2AwHPNaUv5ITw79ZSC/UGT2HaxPBYEe7FXzSAQjtMcHhvfQm5Lg1iP2YyQHsLps+
 v47k/HkmgUiMWTDM0TwH9U1iKF2oQ7Q4NqKorGdI+eTBeba77N7B4SHVDS6eIYBKSXiq
 k+cYygXjWCiN7I2Dx9fL7LbLo3Tn78jAnX78yfDXdF0ewSPopNOoUpZKP9JJlvIuiapf
 9rHTCMG+ZdZ7jlxbzqV9l6upSGZiWleLPLykeixUqKnqS0hz8yGRDDGdMed8SEKwGFxO
 2P2azmIM8co9mqSCyHgB9O7EiLF/RR3XxaS/UFozFhQFUQzHOc9tKUcBft/SF7JiuH6E
 IpMA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=f6ln+3/9DBZRpR4O41lZm+OOJ4C7JaNKQynsg2JOb2g=;
 b=OhiRoqWlJkhYQNtyCSdP7Sl1U5HW9WFT1QZCmhkRn1+y79k2OvZfo8YhmIHzU5UlVP
 bZxHOQ2Yu51KYS2O3MpfRc6fTyto2mqfpxzG2CRn35ZatA336VDtpPPWervWduBVKqqG
 D+s2nQ5+M0h1NPSOR/HHkZEoz2vDfqaCZhzxCUPRXXV1LQOlHmazjj7qQ38oTaQlNa/F
 CGksI5TbhjKWITnlPw1XXg0SWYnYdYVeLxY91/4vwRN1vDd/oFuC79xQDVBFKQQe9cFx
 hqmKeFj6NyVVQtStlCwyxfQAB0CBJHjw52UqaLEDHkrNZ+g5m6e4T+pe3ws+pG6yE0K3
 ZnxQ==
X-Gm-Message-State: AOAM532zPe6GNbjgXlbxjf+elQqbW3crRPpgzdHsmyS8rkOFt8bIeIbr
 kbCgFDesuLF+yBAHGtmyuBxRAeIA7fc=
X-Google-Smtp-Source: ABdhPJxkEV85PiqNOKmTRTBg/0gPmEVCe1tk2ZykCrFUfRWSsdVqyGSrh78AML/O54+H63tIu5x4bw==
X-Received: by 2002:a17:90a:db02:: with SMTP id
 g2mr13579182pjv.76.1637438159436; 
 Sat, 20 Nov 2021 11:55:59 -0800 (PST)
Received: from localhost (c-73-25-156-94.hsd1.or.comcast.net. [73.25.156.94])
 by smtp.gmail.com with ESMTPSA id
 kx3sm3020916pjb.5.2021.11.20.11.55.58
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Sat, 20 Nov 2021 11:55:58 -0800 (PST)
From: Rob Clark <robdclark@gmail.com>
To: dri-devel@lists.freedesktop.org
Subject: [PATCH v2 2/3] drm/msm/gpu: Fix check for devices without devfreq
Date: Sat, 20 Nov 2021 12:01:02 -0800
Message-Id: <20211120200103.1051459-2-robdclark@gmail.com>
X-Mailer: git-send-email 2.33.1
In-Reply-To: <20211120200103.1051459-1-robdclark@gmail.com>
References: <20211120200103.1051459-1-robdclark@gmail.com>
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
 linux-arm-msm@vger.kernel.org, Doug Anderson <dianders@chromium.org>,
 open list <linux-kernel@vger.kernel.org>, Sean Paul <sean@poorly.run>,
 freedreno@lists.freedesktop.org
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

From: Rob Clark <robdclark@chromium.org>

Looks like 658f4c829688 ("drm/msm/devfreq: Add 1ms delay before
clamping freq") was badly rebased on top of efb8a170a367 ("drm/msm:
Fix devfreq NULL pointer dereference on a3xx") and ended up with
the NULL check in the wrong place.

Fixes: 658f4c829688 ("drm/msm/devfreq: Add 1ms delay before clamping freq")
Signed-off-by: Rob Clark <robdclark@chromium.org>
---
 drivers/gpu/drm/msm/msm_gpu_devfreq.c | 6 +++---
 1 file changed, 3 insertions(+), 3 deletions(-)

diff --git a/drivers/gpu/drm/msm/msm_gpu_devfreq.c b/drivers/gpu/drm/msm/msm_gpu_devfreq.c
index 7285041c737e..1f55242bb6a1 100644
--- a/drivers/gpu/drm/msm/msm_gpu_devfreq.c
+++ b/drivers/gpu/drm/msm/msm_gpu_devfreq.c
@@ -203,9 +203,6 @@ static void msm_devfreq_idle_work(struct kthread_work *work)
 	struct msm_gpu *gpu = container_of(df, struct msm_gpu, devfreq);
 	unsigned long idle_freq, target_freq = 0;
 
-	if (!df->devfreq)
-		return;
-
 	/*
 	 * Hold devfreq lock to synchronize with get_dev_status()/
 	 * target() callbacks
@@ -227,6 +224,9 @@ void msm_devfreq_idle(struct msm_gpu *gpu)
 {
 	struct msm_gpu_devfreq *df = &gpu->devfreq;
 
+	if (!df->devfreq)
+		return;
+
 	msm_hrtimer_queue_work(&df->idle_work, ms_to_ktime(1),
 			       HRTIMER_MODE_REL);
 }
-- 
2.33.1

