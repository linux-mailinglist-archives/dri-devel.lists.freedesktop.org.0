Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id CC6F35FE5A6
	for <lists+dri-devel@lfdr.de>; Fri, 14 Oct 2022 00:55:37 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 9FAF110E9BE;
	Thu, 13 Oct 2022 22:55:26 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-pj1-x1033.google.com (mail-pj1-x1033.google.com
 [IPv6:2607:f8b0:4864:20::1033])
 by gabe.freedesktop.org (Postfix) with ESMTPS id A656010E9B8;
 Thu, 13 Oct 2022 22:55:18 +0000 (UTC)
Received: by mail-pj1-x1033.google.com with SMTP id
 x1-20020a17090ab00100b001fda21bbc90so6227572pjq.3; 
 Thu, 13 Oct 2022 15:55:18 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20210112;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:from:to:cc:subject:date
 :message-id:reply-to;
 bh=q3O30/nl6pZCQT2a2Baeof1BC5ax2UChSGPY/GTCY8A=;
 b=SeQLSPqc2/YQ5vhmURpGxCnRKh4YUw5BIN/UHXTmSTFBpDGIN/UqaqBDt6pMvjuhc/
 j2k309PB1WiJaLcgGJw0B2k357k7sU81p9/kKp6HWYR0WsIrciIyoWz6FiWaIjOhYpmC
 zw5NfalFvdad7ehlApMsdc3zw7uDtU0rXa7Rqe0PlHt8vzbW5hGAFR0Jpd3PAtF3BVh2
 7ZHFQd44XtijZYU5yZmnglgziHtJA6kMwzbYr14Qx8jL0Q+t8liFJDFxfghNAxWG+I8M
 TuyzvlRLcp8Hmr/DK46CYysmJpTARRggYYWF3bfXcO6i7UP5EPMcLY+JtsSmxsFdoUI7
 vqGQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=q3O30/nl6pZCQT2a2Baeof1BC5ax2UChSGPY/GTCY8A=;
 b=wHEPbagle/zS/bP2DIh5y/t/jhosLlGTc4GDZ1BePnTOcBVReFnXyf3Pm+2AOHOJmk
 wSqYcHD1bUabVriUiCIN1wfGhTtzdrzz6Q/j6SJh2JbJMN9//Br2zvOLvjHmsr8ahlUB
 Fpow8wGiRmqjEaxsLceJkCRNxA/3Oz+j0HgjG9eXEeBZyiVT/6z+FaslYI+Ug5pqxDCu
 w7n8CCvDE289YiS+V9QeevEixuR7QJK4JAujylgaJEd2sncOzHAsZkv/Le7vqSxjP2er
 KUUa5KJx5X7pr0s+udgH5lf7xT5j/sMrO8thqwukSLHIia8/nQb3tfn1ma83mb8JwnwR
 WxJA==
X-Gm-Message-State: ACrzQf2//6O9rTQh6Eq9akTFSMBJ4JJTbHnFQHXtqjWVLgqbhOEsMizO
 dTxb5Gdt+OHhlKwOHnWwfPdBAIQNyOI=
X-Google-Smtp-Source: AMsMyM4NeJVCQzzcm8W75BjX0XeEL04t0hlo0bW+dZBuuOehbjB/kLxpHcNbIXA8Wid599NWqdBeZQ==
X-Received: by 2002:a17:903:40cb:b0:17f:6e08:6eac with SMTP id
 t11-20020a17090340cb00b0017f6e086eacmr1993232pld.80.1665701717785; 
 Thu, 13 Oct 2022 15:55:17 -0700 (PDT)
Received: from localhost ([2a00:79e1:abd:4a00:2703:3c72:eb1a:cffd])
 by smtp.gmail.com with ESMTPSA id
 n123-20020a622781000000b0053b723a74f7sm226564pfn.90.2022.10.13.15.55.17
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Thu, 13 Oct 2022 15:55:17 -0700 (PDT)
From: Rob Clark <robdclark@gmail.com>
To: dri-devel@lists.freedesktop.org
Subject: [PATCH 2/3] drm/msm/a6xx: Skip snapshotting unused GMU buffers
Date: Thu, 13 Oct 2022 15:55:14 -0700
Message-Id: <20221013225520.371226-3-robdclark@gmail.com>
X-Mailer: git-send-email 2.37.3
In-Reply-To: <20221013225520.371226-1-robdclark@gmail.com>
References: <20221013225520.371226-1-robdclark@gmail.com>
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
Cc: Rob Clark <robdclark@chromium.org>,
 Akhil P Oommen <quic_akhilpo@quicinc.com>, David Airlie <airlied@linux.ie>,
 linux-arm-msm@vger.kernel.org, Abhinav Kumar <quic_abhinavk@quicinc.com>,
 Douglas Anderson <dianders@chromium.org>, Sean Paul <sean@poorly.run>,
 Dmitry Baryshkov <dmitry.baryshkov@linaro.org>,
 freedreno@lists.freedesktop.org, open list <linux-kernel@vger.kernel.org>
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

From: Rob Clark <robdclark@chromium.org>

Some buffers are unused on certain sub-generations of a6xx.  So just
skip them.

Signed-off-by: Rob Clark <robdclark@chromium.org>
---
 drivers/gpu/drm/msm/adreno/a6xx_gpu_state.c | 3 +++
 1 file changed, 3 insertions(+)

diff --git a/drivers/gpu/drm/msm/adreno/a6xx_gpu_state.c b/drivers/gpu/drm/msm/adreno/a6xx_gpu_state.c
index 730355f9e2d4..b0124d0f286c 100644
--- a/drivers/gpu/drm/msm/adreno/a6xx_gpu_state.c
+++ b/drivers/gpu/drm/msm/adreno/a6xx_gpu_state.c
@@ -813,6 +813,9 @@ static struct msm_gpu_state_bo *a6xx_snapshot_gmu_bo(
 {
 	struct msm_gpu_state_bo *snapshot;
 
+	if (!bo->size)
+		return NULL;
+
 	snapshot = state_kcalloc(a6xx_state, 1, sizeof(*snapshot));
 	if (!snapshot)
 		return NULL;
-- 
2.37.3

