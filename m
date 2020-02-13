Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id B057115CBA5
	for <lists+dri-devel@lfdr.de>; Thu, 13 Feb 2020 21:04:00 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 509496E3E3;
	Thu, 13 Feb 2020 20:03:58 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-pj1-x1042.google.com (mail-pj1-x1042.google.com
 [IPv6:2607:f8b0:4864:20::1042])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 3E61C6E3E3;
 Thu, 13 Feb 2020 20:03:57 +0000 (UTC)
Received: by mail-pj1-x1042.google.com with SMTP id m13so2899405pjb.2;
 Thu, 13 Feb 2020 12:03:57 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=from:to:cc:subject:date:message-id:mime-version
 :content-transfer-encoding;
 bh=UQjjHQDgj0q56YxtAxLxiwd0e2dsyqGtwVu7Hq/6ZWw=;
 b=N/k7RAPUDfZEcoyOkB0wvxfvhSGMwEJU6wxiChP5OO/yVwjVpZSN4JI1eSaUSVN8tm
 YWl7fRqn0MB9brNk7Q8MrlT3MuSh0O5S2tMwW1GuWZwUX7bLucomFKem3FwgSSZVxSUM
 3El9OGIyK8kX91tlZixUZ644/ZIACx51O1h+vgyCKLQEvDPLFbI1o8TI6mRiLIq/ghOS
 cPkbQzKAqvAv68Ca21w/lSp3RuPJiuDzIydBeXAUD8I9EaeqO+cINsvI0ZnCC1j3wbuM
 0b5jUyJ3Z0Kgx9pTtQVVTCJeUVhzy9Rd8AHueHSUlND7MsdoNAkvK+xuNeDdiqONsk3s
 L4GA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:mime-version
 :content-transfer-encoding;
 bh=UQjjHQDgj0q56YxtAxLxiwd0e2dsyqGtwVu7Hq/6ZWw=;
 b=Uo/rexlbyQVh7Ld5iOz2o0QQT6/OP97Y6Nl34rxaXVhYKdLO1heJjj1XwxkpVdXb8J
 cpxNRXdbjpT98MQbnQq5SrUJLUHG7gFko1ychfTpY9twdyg2vGKxLN0i0h9ZRd85+XJy
 7hP+XBsn1eLBNU0WDKKFIrgjWi/b/T/7AmbjWxIo33ZhefzADGmYVc7J82nIye+wE+eC
 mBlNkNf7jBQc6WaAP8Fq4CiIhSa0N749KGXjcRGUbag/5VEaokpekffuy0+Ia8IUwwWf
 orHFVP7aeiaDHPIW3z5UCnUNuWqAwWgLWlB2HA4lFsc77x/Em0ldlF1F/kGNMMC/LPUj
 qxuQ==
X-Gm-Message-State: APjAAAWetfyXWcMOoQ8LBSKzFvHOuenj1gErcF9M2wA0fWSvkt+S5cQq
 sNNoJa/qa2mLpYFZD0yn9xFNzdwF
X-Google-Smtp-Source: APXvYqxK3k8dw4bEbots2NbHpnsfrrHqX2qUwnysFEa+wzONL/xB3/2+U19TyNmfD+4AoiDn7+9nGA==
X-Received: by 2002:a17:90a:a88d:: with SMTP id
 h13mr6597270pjq.55.1581624236430; 
 Thu, 13 Feb 2020 12:03:56 -0800 (PST)
Received: from localhost ([100.118.89.211])
 by smtp.gmail.com with ESMTPSA id w25sm4126396pfi.106.2020.02.13.12.03.55
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Thu, 13 Feb 2020 12:03:55 -0800 (PST)
From: Rob Clark <robdclark@gmail.com>
To: dri-devel@lists.freedesktop.org
Subject: [PATCH] drm/msm/dpu: fix BGR565 vs RGB565 confusion
Date: Thu, 13 Feb 2020 12:01:35 -0800
Message-Id: <20200213200137.745029-1-robdclark@gmail.com>
X-Mailer: git-send-email 2.24.1
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
Cc: Rob Clark <robdclark@chromium.org>,
 "open list:DRM DRIVER FOR MSM ADRENO GPU"
 <freedreno@lists.freedesktop.org>, Fritz Koenig <frkoenig@google.com>,
 David Airlie <airlied@linux.ie>,
 Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
 open list <linux-kernel@vger.kernel.org>,
 Nathan Huckleberry <nhuck@google.com>,
 Alexios Zavras <alexios.zavras@intel.com>,
 Matthias Kaehlcke <mka@chromium.org>,
 "open list:DRM DRIVER FOR MSM ADRENO GPU" <linux-arm-msm@vger.kernel.org>,
 Thomas Gleixner <tglx@linutronix.de>, Sean Paul <sean@poorly.run>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

From: Rob Clark <robdclark@chromium.org>

The component order between the two was swapped, resulting in incorrect
color when games with 565 visual hit the overlay path instead of GPU
composition.

Fixes: 25fdd5933e4c ("drm/msm: Add SDM845 DPU support")
Signed-off-by: Rob Clark <robdclark@chromium.org>
---
 drivers/gpu/drm/msm/disp/dpu1/dpu_formats.c | 4 ++--
 1 file changed, 2 insertions(+), 2 deletions(-)

diff --git a/drivers/gpu/drm/msm/disp/dpu1/dpu_formats.c b/drivers/gpu/drm/msm/disp/dpu1/dpu_formats.c
index 24ab6249083a..6f420cc73dbd 100644
--- a/drivers/gpu/drm/msm/disp/dpu1/dpu_formats.c
+++ b/drivers/gpu/drm/msm/disp/dpu1/dpu_formats.c
@@ -255,13 +255,13 @@ static const struct dpu_format dpu_format_map[] = {
 
 	INTERLEAVED_RGB_FMT(RGB565,
 		0, COLOR_5BIT, COLOR_6BIT, COLOR_5BIT,
-		C2_R_Cr, C0_G_Y, C1_B_Cb, 0, 3,
+		C1_B_Cb, C0_G_Y, C2_R_Cr, 0, 3,
 		false, 2, 0,
 		DPU_FETCH_LINEAR, 1),
 
 	INTERLEAVED_RGB_FMT(BGR565,
 		0, COLOR_5BIT, COLOR_6BIT, COLOR_5BIT,
-		C1_B_Cb, C0_G_Y, C2_R_Cr, 0, 3,
+		C2_R_Cr, C0_G_Y, C1_B_Cb, 0, 3,
 		false, 2, 0,
 		DPU_FETCH_LINEAR, 1),
 
-- 
2.24.1

_______________________________________________
dri-devel mailing list
dri-devel@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/dri-devel
