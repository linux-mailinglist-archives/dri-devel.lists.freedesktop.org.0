Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id D9C71444A03
	for <lists+dri-devel@lfdr.de>; Wed,  3 Nov 2021 21:59:52 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id DFF047A338;
	Wed,  3 Nov 2021 20:59:50 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-pl1-x62d.google.com (mail-pl1-x62d.google.com
 [IPv6:2607:f8b0:4864:20::62d])
 by gabe.freedesktop.org (Postfix) with ESMTPS id D67487A33B;
 Wed,  3 Nov 2021 20:59:48 +0000 (UTC)
Received: by mail-pl1-x62d.google.com with SMTP id u17so3592903plg.9;
 Wed, 03 Nov 2021 13:59:48 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20210112;
 h=from:to:cc:subject:date:message-id:mime-version
 :content-transfer-encoding;
 bh=L9qwrwPbSWoePEB3ehdDf5IbmlgUKU2I8KPH/uSpeUo=;
 b=Lt7D40yqrcq+E/eilwiYhnbfmectRjM0BEy3zDvpgY/YI+nYSYktulLHdhS7BASmnO
 iSi8st9ezddOSPiHfRH8xWEuCPNhsYsfPwbjQxbnNJrOoko3i3gUsjsFP32D68RXLwGV
 WWng7gvsEjtkCcCq6TMHp5hdWQ1RuTkOaRLoeMSIr2t8+++k8WUnFFk7iNshgVvFyhu2
 TFxbOQrUcl1RR+7AGuQwxIDIWf458+NHSLuPMzOwU0E/C6YXaCixBZsSvaPEcnwpnS3M
 SFudCIGtoidM0MA58XZeyqkAHRKSOceNylCO9GF98IJxY7j4FhliZSHSzKGltQtvqACn
 sL6A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:mime-version
 :content-transfer-encoding;
 bh=L9qwrwPbSWoePEB3ehdDf5IbmlgUKU2I8KPH/uSpeUo=;
 b=3a5EqqZTYLXE26OJhDsgvblD9pWHrRj3EMuxPrRwXo8uljZbphykqWc6aqksmgP5EQ
 S8RS1HHvD4SrgcoXdQr1D/f+IXGvlejaGS3sf7krX6YW9L5qXgL51tE2IQ0Cw62bbwew
 dsHUh4iOaRYvdoH/IQ5J5pdcC7hDDT/UvFeYTk4QtYhJCmQ/DaFSzGjYtH1siJBdKglW
 7lhUgVLFZRxFtMDkNrzJ/VKBYHLXA/xhvNrYOUEsoTFfgMWENiArvywxUFGNc8c4uF9s
 q74j3fbC/0hJIF7zbjKbWpOpWszVhBFsPWvF75YYhocWCGUhh4xQrw2UyFsrQxb1C++f
 1qlw==
X-Gm-Message-State: AOAM533MWEerKzu03tFgmd+6fD4Ixxg6VMhN9552c01YXFvFenuOmmou
 g6tJlbihFNitH6YFSFrKGp5WvO8wB2A=
X-Google-Smtp-Source: ABdhPJwfJWRdXRDYT7uBQR1KDP+2q5UZB5BKScj36CPSOBHca+96rzKNXm46X2qjbmIdDSDLwr74EA==
X-Received: by 2002:a17:902:ec90:b0:142:269:4691 with SMTP id
 x16-20020a170902ec9000b0014202694691mr15363741plg.48.1635973187891; 
 Wed, 03 Nov 2021 13:59:47 -0700 (PDT)
Received: from localhost (c-73-25-156-94.hsd1.or.comcast.net. [73.25.156.94])
 by smtp.gmail.com with ESMTPSA id
 c20sm2700362pfl.201.2021.11.03.13.59.46
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Wed, 03 Nov 2021 13:59:47 -0700 (PDT)
From: Rob Clark <robdclark@gmail.com>
To: dri-devel@lists.freedesktop.org
Subject: [PATCH] drm/msm: Hangcheck timer fixes
Date: Wed,  3 Nov 2021 14:04:45 -0700
Message-Id: <20211103210445.623681-1-robdclark@gmail.com>
X-Mailer: git-send-email 2.31.1
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
 linux-arm-msm@vger.kernel.org, open list <linux-kernel@vger.kernel.org>,
 Sean Paul <sean@poorly.run>, freedreno@lists.freedesktop.org
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

From: Rob Clark <robdclark@chromium.org>

Cancel the timer when the GPU is idle, but also remember to restart it
in the recover path if we've re-submitted submits following the one that
hung.

Signed-off-by: Rob Clark <robdclark@chromium.org>
---
 drivers/gpu/drm/msm/msm_gpu.c | 10 ++++++++++
 1 file changed, 10 insertions(+)

diff --git a/drivers/gpu/drm/msm/msm_gpu.c b/drivers/gpu/drm/msm/msm_gpu.c
index 0d56699297c7..367f0c698b40 100644
--- a/drivers/gpu/drm/msm/msm_gpu.c
+++ b/drivers/gpu/drm/msm/msm_gpu.c
@@ -16,6 +16,8 @@
 #include <linux/devcoredump.h>
 #include <linux/sched/task.h>
 
+static void hangcheck_timer_reset(struct msm_gpu *gpu);
+
 /*
  * Power Management:
  */
@@ -450,6 +452,10 @@ static void recover_worker(struct kthread_work *work)
 				gpu->funcs->submit(gpu, submit);
 			spin_unlock_irqrestore(&ring->submit_lock, flags);
 		}
+
+		hangcheck_timer_reset(gpu);
+	} else {
+		del_timer(&gpu->hangcheck_timer);
 	}
 
 	mutex_unlock(&dev->struct_mutex);
@@ -721,6 +727,10 @@ static void retire_worker(struct kthread_work *work)
 	struct msm_gpu *gpu = container_of(work, struct msm_gpu, retire_work);
 
 	retire_submits(gpu);
+
+	if (!msm_gpu_active(gpu)) {
+		del_timer(&gpu->hangcheck_timer);
+	}
 }
 
 /* call from irq handler to schedule work to retire bo's */
-- 
2.31.1

