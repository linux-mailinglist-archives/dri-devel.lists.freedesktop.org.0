Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 87FA0245D07
	for <lists+dri-devel@lfdr.de>; Mon, 17 Aug 2020 09:06:50 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 518726E44C;
	Mon, 17 Aug 2020 07:06:25 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-qt1-x842.google.com (mail-qt1-x842.google.com
 [IPv6:2607:f8b0:4864:20::842])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 7165B6EA90
 for <dri-devel@lists.freedesktop.org>; Thu, 13 Aug 2020 18:55:11 +0000 (UTC)
Received: by mail-qt1-x842.google.com with SMTP id s23so5147513qtq.12
 for <dri-devel@lists.freedesktop.org>; Thu, 13 Aug 2020 11:55:11 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=marek-ca.20150623.gappssmtp.com; s=20150623;
 h=from:to:cc:subject:date:message-id:mime-version
 :content-transfer-encoding;
 bh=+Jgraj+114QRBzFXPeF3FuYfVHOWKZNgIZ9aTNenrPE=;
 b=K5ZUHZoTVkZ0tY5PKep0FfWqPe292MdYUK7XrGfQT5bPLzimznrpCsHYK7epjlHC1i
 xXd7fNIrqvF8K/M1sfQ6jyqPzwslt0B3Bhwb3q3FK+qBiYQjOk/3kdnaLrq5qlsdroFs
 fWiJWg9CRP/lrcvc4QOg8w5q5NCJzb1qqdFsgGhM3jmgGBMWerAeW8B+uXBhXF3qHHn5
 Vcr0kS3wh8MN9ZCjiI+FPVOtUIcllhV4748X8W50DajAZ5duXbgS1buXOExgWl8aY9eQ
 lOj5Y5M+FGSlVFkyntXue9hSAx9OlmmTv8dHjt1lUn8MHgV7guNNProl0yGA34GMCbGP
 30Yw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:mime-version
 :content-transfer-encoding;
 bh=+Jgraj+114QRBzFXPeF3FuYfVHOWKZNgIZ9aTNenrPE=;
 b=ExPklA1Xe1+l39EDfGpsFtJlTwMOHtc0LQeK46zckj5qv7iWe0n2Lg+Ogn5dLwFTe9
 /Ptl8fdsX8QeA/CAb4oXdyQNIAfenB+elE1GmYnbeocblzBbIypDiRZ5cQCFKwnKaN2S
 CaPynFq8moBOZYEkZQJI1TixkdmmDtXF7T9Z4tMBqLENf7ElgkLvMDo9ei/hTAhz8Ere
 1hPMHZzBvW500jcD2EZlbyvWKVmk60CsuLANJFsjbWv6ExfmT/VmmvpLksLTGlBFKv7W
 AiPDxbR76gkjoCLcFcw+I5QjUnBCrJiWdRxgjz5UZswT5Vhg6019lcM91JlGyOmCtsCh
 AGQg==
X-Gm-Message-State: AOAM533xfF5U5NULO/AtwnLoBZ6+7L9MyPSctAENWNRJWHX1fm3LO7aJ
 AMqNKVsDjFkCE9lpriePJgqsvQ==
X-Google-Smtp-Source: ABdhPJzq+Dlcltn9G2WI66j6mqaoOepwS8++0OsOncRBWUC+uPv29ltLhNqGOeIkEg8DOqa3CRYt/g==
X-Received: by 2002:ac8:4e51:: with SMTP id e17mr6954689qtw.173.1597344910414; 
 Thu, 13 Aug 2020 11:55:10 -0700 (PDT)
Received: from localhost.localdomain ([147.253.86.153])
 by smtp.gmail.com with ESMTPSA id l64sm5816733qkc.21.2020.08.13.11.55.09
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Thu, 13 Aug 2020 11:55:09 -0700 (PDT)
From: Jonathan Marek <jonathan@marek.ca>
To: freedreno@lists.freedesktop.org
Subject: [RESEND PATCH] drm/msm/a6xx: fix frequency not always being restored
 on GMU resume
Date: Thu, 13 Aug 2020 14:54:48 -0400
Message-Id: <20200813185450.19387-1-jonathan@marek.ca>
X-Mailer: git-send-email 2.26.1
MIME-Version: 1.0
X-Mailman-Approved-At: Mon, 17 Aug 2020 07:06:11 +0000
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
Cc: David Airlie <airlied@linux.ie>,
 "open list:DRM DRIVER FOR MSM ADRENO GPU" <linux-arm-msm@vger.kernel.org>,
 Sharat Masetty <smasetty@codeaurora.org>,
 "open list:DRM DRIVER FOR MSM ADRENO GPU" <dri-devel@lists.freedesktop.org>,
 Akhil P Oommen <akhilpo@codeaurora.org>,
 Christophe JAILLET <christophe.jaillet@wanadoo.fr>,
 Sean Paul <sean@poorly.run>, open list <linux-kernel@vger.kernel.org>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

The patch reorganizing the set_freq function made it so the gmu resume
doesn't always set the frequency, because a6xx_gmu_set_freq() exits early
when the frequency hasn't been changed. Note this always happens when
resuming GMU after recovering from a hang.

Use a simple workaround to prevent this from happening.

Fixes: 1f60d11423db ("drm: msm: a6xx: send opp instead of a frequency")

Signed-off-by: Jonathan Marek <jonathan@marek.ca>
---
 drivers/gpu/drm/msm/adreno/a6xx_gmu.c | 1 +
 1 file changed, 1 insertion(+)

diff --git a/drivers/gpu/drm/msm/adreno/a6xx_gmu.c b/drivers/gpu/drm/msm/adreno/a6xx_gmu.c
index b67b38c8fadf..bbbd00020f92 100644
--- a/drivers/gpu/drm/msm/adreno/a6xx_gmu.c
+++ b/drivers/gpu/drm/msm/adreno/a6xx_gmu.c
@@ -845,6 +845,7 @@ static void a6xx_gmu_set_initial_freq(struct msm_gpu *gpu, struct a6xx_gmu *gmu)
 	if (IS_ERR_OR_NULL(gpu_opp))
 		return;
 
+	gmu->freq = 0; /* so a6xx_gmu_set_freq() doesn't exit early */
 	a6xx_gmu_set_freq(gpu, gpu_opp);
 	dev_pm_opp_put(gpu_opp);
 }
-- 
2.26.1

_______________________________________________
dri-devel mailing list
dri-devel@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/dri-devel
