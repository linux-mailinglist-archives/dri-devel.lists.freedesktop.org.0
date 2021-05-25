Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id C2A1738FFF5
	for <lists+dri-devel@lfdr.de>; Tue, 25 May 2021 13:29:13 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 3A48A6E9EF;
	Tue, 25 May 2021 11:29:09 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-ot1-x335.google.com (mail-ot1-x335.google.com
 [IPv6:2607:f8b0:4864:20::335])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 8F5C76E0A5;
 Tue, 25 May 2021 11:29:07 +0000 (UTC)
Received: by mail-ot1-x335.google.com with SMTP id
 d25-20020a0568300459b02902f886f7dd43so28255793otc.6; 
 Tue, 25 May 2021 04:29:07 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=sender:from:to:cc:subject:date:message-id:mime-version
 :content-transfer-encoding;
 bh=OoShwNufQbQ2PZjqsVFrN16U7busUrI6QbgoEQ1ik9U=;
 b=UlUxDSew9qGjS82r1rZpuGLDADXC/09HyxIu97KYoTOIhv1pbPIn0xyx/MbrNGxBoy
 LGfIQeCGjSA9PESwug5um/Fzper9UjbhOUBKUc+aDp7sjNrE9QRBTod2hyOtzPsfrp9K
 6oJykwLnNQmoTdInTlFpu90Svej0cJrTYVOxl+kw9HBpLJGSXb/amOcx1MLHSXLIXiUL
 gIvwbZqRLZNzKdDDngeuMjDarusaqSRk5x1HlmHOcryL+qyDwtuJ2ZGO9JRiJAoHEsKz
 CO2Xz2bbbgI2tas6F2L9E/iEDlElVsADLALlG1P/R6z7AMxcVV95rfo/tKPUPmjSuar4
 UG1Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:sender:from:to:cc:subject:date:message-id
 :mime-version:content-transfer-encoding;
 bh=OoShwNufQbQ2PZjqsVFrN16U7busUrI6QbgoEQ1ik9U=;
 b=BefGPFNijpcmm7TY2fwuPmCsB8+JlqD/JUARDXZTdglLVG6F5GL1qTvotEgPiN8/N4
 VfJua6gkv2OIm+ZsNmHffntd2H5p2eLYmN/fG+UthXZMmoERy0c5b24vU7GrwVi1dijL
 1auV4ovL+l0brNdVhPfvGifjL4WZRw2h2rRNcS+y31u+n4mOW6AKs/3uvOuAeeJ9DTzH
 5A0v1p/BLsWiCT9d8GYtn6p4qLAIqz5yfLgjDxRcnTmXaqsAK4FmEOPdnIubGCKZjmNn
 n7mGvYc8YG6gCHxpmGojUXNPkIxPD3R9daH7vXB4oZXHfgemxehB/yidDaUo+xQ2llD8
 qySw==
X-Gm-Message-State: AOAM531Ct2eDJeGFhjpWnD429bDj0z8q9ivvLIbDbkXW0Ys7UnN9SS0Y
 GTnXppsO1KBY1TujmSb0m4V6y46JMu8=
X-Google-Smtp-Source: ABdhPJweJNrVeu6J02faHo9+lC6+Mm+P38lD8sy+b/xV4p1EN+w+OJfUdWVoLf2jWnnWsFzeqIuA4Q==
X-Received: by 2002:a05:6830:31a1:: with SMTP id
 q1mr19611535ots.106.1621942146883; 
 Tue, 25 May 2021 04:29:06 -0700 (PDT)
Received: from localhost ([2600:1700:e321:62f0:329c:23ff:fee3:9d7c])
 by smtp.gmail.com with ESMTPSA id l20sm3395069oop.3.2021.05.25.04.29.05
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Tue, 25 May 2021 04:29:06 -0700 (PDT)
From: Guenter Roeck <linux@roeck-us.net>
To: Rob Clark <robdclark@gmail.com>
Subject: [PATCH] drm/msm/disp/dpu1/dpu_encoder: Drop unnecessary NULL checks
 after container_of
Date: Tue, 25 May 2021 04:29:04 -0700
Message-Id: <20210525112904.1747066-1-linux@roeck-us.net>
X-Mailer: git-send-email 2.25.1
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
Cc: Sean Paul <sean@poorly.run>, David Airlie <airlied@linux.ie>,
 linux-arm-msm@vger.kernel.org, linux-kernel@vger.kernel.org,
 dri-devel@lists.freedesktop.org, freedreno@lists.freedesktop.org,
 Guenter Roeck <linux@roeck-us.net>
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

The result of container_of() operations is never NULL unless the embedded
element is the first element of the structure. This is not the case here.
The NULL checks on the result of container_of() are therefore unnecessary
and misleading. Remove them.

This change was made automatically with the following Coccinelle script.

@@
type t;
identifier v;
statement s;
@@

<+...
(
  t v = container_of(...);
|
  v = container_of(...);
)
  ...
  when != v
- if (\( !v \| v == NULL \) ) s
...+>

Signed-off-by: Guenter Roeck <linux@roeck-us.net>
---
 drivers/gpu/drm/msm/disp/dpu1/dpu_encoder.c | 10 ----------
 1 file changed, 10 deletions(-)

diff --git a/drivers/gpu/drm/msm/disp/dpu1/dpu_encoder.c b/drivers/gpu/drm/msm/disp/dpu1/dpu_encoder.c
index 8d942052db8a..a573fe211375 100644
--- a/drivers/gpu/drm/msm/disp/dpu1/dpu_encoder.c
+++ b/drivers/gpu/drm/msm/disp/dpu1/dpu_encoder.c
@@ -1453,11 +1453,6 @@ static void dpu_encoder_off_work(struct work_struct *work)
 	struct dpu_encoder_virt *dpu_enc = container_of(work,
 			struct dpu_encoder_virt, delayed_off_work.work);
 
-	if (!dpu_enc) {
-		DPU_ERROR("invalid dpu encoder\n");
-		return;
-	}
-
 	dpu_encoder_resource_control(&dpu_enc->base,
 						DPU_ENC_RC_EVENT_ENTER_IDLE);
 
@@ -1797,11 +1792,6 @@ static void dpu_encoder_vsync_event_work_handler(struct kthread_work *work)
 			struct dpu_encoder_virt, vsync_event_work);
 	ktime_t wakeup_time;
 
-	if (!dpu_enc) {
-		DPU_ERROR("invalid dpu encoder\n");
-		return;
-	}
-
 	if (dpu_encoder_vsync_time(&dpu_enc->base, &wakeup_time))
 		return;
 
-- 
2.25.1

