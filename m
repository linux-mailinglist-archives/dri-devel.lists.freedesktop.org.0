Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 23E1B37FC47
	for <lists+dri-devel@lfdr.de>; Thu, 13 May 2021 19:17:44 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id EF1DF6ED8F;
	Thu, 13 May 2021 17:17:39 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-qk1-x731.google.com (mail-qk1-x731.google.com
 [IPv6:2607:f8b0:4864:20::731])
 by gabe.freedesktop.org (Postfix) with ESMTPS id C81C86ED90
 for <dri-devel@lists.freedesktop.org>; Thu, 13 May 2021 17:17:38 +0000 (UTC)
Received: by mail-qk1-x731.google.com with SMTP id f18so4356028qko.7
 for <dri-devel@lists.freedesktop.org>; Thu, 13 May 2021 10:17:38 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=marek-ca.20150623.gappssmtp.com; s=20150623;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=9WG0R1210n0jTNjQDS6goCg7eMSMJrn7+n/wli9p3uE=;
 b=a7WGuaOMXcdyVbHS1oMtsfrUeHQJr5oaOtSUSS8iouy29cPevPdc+8W0XA+vksHIDi
 Zm8VeBJ/2aa0zQSwnxPK1+lFXabRRW8S9gUyxrdsir0JPTGoQyYzItinXzZ+KFcV5T8V
 R5zFT4xsDcG6rP6fh2FWihojqgOORH6V6XzdU4GzV1bMfwrFJNRO9z949T22p6j/mCjy
 TSI5Ep0DnBYHasjwZHxKm2TePX171Y3CMollCPSJL6Z+E22bv/cMFYG2QQZNLBYO3FEw
 6pDUNzzqnQxdWqzSeu/QcRN6/2twVbIZLKnYg7A4f3HtegNlibW6a5cIauts/lLBcYr1
 yQAw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=9WG0R1210n0jTNjQDS6goCg7eMSMJrn7+n/wli9p3uE=;
 b=Io8whqt3d86GRUiJGvNaZCDWolKtOfKpBCYAc7QkbjQ6/xtyPGhFExF/BO9hF7HAzt
 Hosd9zqKb86r3VHHAixkPZr2udlsICnSh4mRqh9XcmHPkcogvl2Alz+vySqsQaqopdQd
 ZN+CJ6L/mVNnlBygf1kYq+ioiZJg/Grq5boYa1Chyr3a0TO5unBAl5Tp5yv0plOYl165
 7LNJqcgloQGE6xKHYzfhhDe9WWAe3gNY47CPcoF588a10sDQnaBMVjL0F+M1eKK38Sto
 PowXqwfcmV4K3CNg8fQTG93bfSgWZR6Y7m5RHeGoARakfHUdV8DWbMSaQ7wU8PW+qp3q
 Sn5Q==
X-Gm-Message-State: AOAM532sPKrvzIxM8igE2Zvsfo5A5N/DR7dENctZ3IbS5WusTOulJEhn
 DQ1Ym85TCL/rdWuvtaXF2eRoRA==
X-Google-Smtp-Source: ABdhPJwp93NLEhRkl5ZJqxvch8hiavkKa9Ms6pYFfYpvTzCXyNoiML+6spdv3qCly1s5rKn3cnni9w==
X-Received: by 2002:a05:620a:1201:: with SMTP id
 u1mr40175153qkj.80.1620926257971; 
 Thu, 13 May 2021 10:17:37 -0700 (PDT)
Received: from localhost.localdomain
 (modemcable068.184-131-66.mc.videotron.ca. [66.131.184.68])
 by smtp.gmail.com with ESMTPSA id f132sm2971117qke.104.2021.05.13.10.17.36
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Thu, 13 May 2021 10:17:37 -0700 (PDT)
From: Jonathan Marek <jonathan@marek.ca>
To: freedreno@lists.freedesktop.org
Subject: [PATCH v2 3/8] drm/msm/a6xx: fix incorrectly set uavflagprd_inv field
 for A650
Date: Thu, 13 May 2021 13:13:58 -0400
Message-Id: <20210513171431.18632-4-jonathan@marek.ca>
X-Mailer: git-send-email 2.26.1
In-Reply-To: <20210513171431.18632-1-jonathan@marek.ca>
References: <20210513171431.18632-1-jonathan@marek.ca>
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
Cc: Sai Prakash Ranjan <saiprakash.ranjan@codeaurora.org>,
 Douglas Anderson <dianders@chromium.org>, David Airlie <airlied@linux.ie>,
 "open list:DRM DRIVER FOR MSM ADRENO GPU" <linux-arm-msm@vger.kernel.org>,
 Sharat Masetty <smasetty@codeaurora.org>,
 Akhil P Oommen <akhilpo@codeaurora.org>,
 "open list:DRM DRIVER FOR MSM ADRENO GPU" <dri-devel@lists.freedesktop.org>,
 Jordan Crouse <jordan@cosmicpenguin.net>, Sean Paul <sean@poorly.run>,
 open list <linux-kernel@vger.kernel.org>
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

Value was shifted in the wrong direction, resulting in the field always
being zero, which is incorrect for A650.

Fixes: d0bac4e9cd66 ("drm/msm/a6xx: set ubwc config for A640 and A650")
Signed-off-by: Jonathan Marek <jonathan@marek.ca>
---
 drivers/gpu/drm/msm/adreno/a6xx_gpu.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/drivers/gpu/drm/msm/adreno/a6xx_gpu.c b/drivers/gpu/drm/msm/adreno/a6xx_gpu.c
index 727d111a413f..45a6a0fce7d7 100644
--- a/drivers/gpu/drm/msm/adreno/a6xx_gpu.c
+++ b/drivers/gpu/drm/msm/adreno/a6xx_gpu.c
@@ -489,7 +489,7 @@ static void a6xx_set_ubwc_config(struct msm_gpu *gpu)
 		rgb565_predicator << 11 | amsbc << 4 | lower_bit << 1);
 	gpu_write(gpu, REG_A6XX_TPL1_NC_MODE_CNTL, lower_bit << 1);
 	gpu_write(gpu, REG_A6XX_SP_NC_MODE_CNTL,
-		uavflagprd_inv >> 4 | lower_bit << 1);
+		uavflagprd_inv << 4 | lower_bit << 1);
 	gpu_write(gpu, REG_A6XX_UCHE_MODE_CNTL, lower_bit << 21);
 }
 
-- 
2.26.1

