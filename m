Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 86FE05FE5AD
	for <lists+dri-devel@lfdr.de>; Fri, 14 Oct 2022 00:55:49 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 4E16410E9BF;
	Thu, 13 Oct 2022 22:55:28 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-pl1-x62d.google.com (mail-pl1-x62d.google.com
 [IPv6:2607:f8b0:4864:20::62d])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 3BFDE10E9B4;
 Thu, 13 Oct 2022 22:55:16 +0000 (UTC)
Received: by mail-pl1-x62d.google.com with SMTP id n7so3157737plp.1;
 Thu, 13 Oct 2022 15:55:16 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20210112;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:from:to:cc:subject:date
 :message-id:reply-to;
 bh=vW+J4iogIz8BUKDsm9kkznHVxGsNPGpjXWMAol29GNU=;
 b=XSCBTmcnlQx1gymTBIQTpPqTF9MRbmCYxJDXRbeapNDy77zubrwIRhYDIDpzfpEvSb
 JbgQZlQAPMMy+TcJ0Zl9dcDJyp4wBOy6ZJqfjOA3FnvkxD731zzmVy4/mGVQCfMCpGnS
 jWs9+9iTVPM3M0Gjz1Ydn12Ui/269RbphwybvVPLUj3MWc4Cm/yiU36wNPvVuuY3Xbh0
 6dsN5JSmuA41ErGiPLn0/2KuYyPWFD9xSRe3f/fLf/6WNK3KHliihx+S/XH3EC4sQAo7
 ngq1+APG63K7w9KOU5Tb16IKUhDJP8bbIr4HU5FM2xr6Da1P3l8L7eWhu8Q7hTJYPPT1
 TMjw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=vW+J4iogIz8BUKDsm9kkznHVxGsNPGpjXWMAol29GNU=;
 b=DiPItUYdK3fsTtZhvlF+DuPQCASFIpBDCaMOFdRfnBKhxSTMFUSsM2i7bOIwJC1qpu
 G3Hm/qTGhK6PYdpYZ5saEaMKdao7Q2T9FfX3xkTkJuzdl7NqRHQ26IWGqRTYSzyBXSEI
 2F2ci6iIFcXeVLBY5pgcsXhHazQSrm4UDw5KbFoaWlFMIh+QskTqAqkRjw1yaERK3e07
 0Ywo63a0cWNaYc39T6aFCFDDBfI2vNHXHn06yIkvgc0p3kEkYV41fe56S3BY6r0zQ6m9
 dGFB3ONiRjvssScT+1FVtLu/XJicQjzQHv4HNOyGPxAvSj/5TRnOZF4LQ/QvdUX0d4qy
 g6JA==
X-Gm-Message-State: ACrzQf02HAFRbaaGuJqxzjMLBpxHGiKZGbDIXbKvMFx4a6cGVizBlab2
 Mdr9hDwthGAcs0D5ERebiGg+bWal9fk=
X-Google-Smtp-Source: AMsMyM4XnbS5q2Gnjr9/xh7Q1T5xD9rvWp88uDEg3OCjFW5BXDfhS6gtejtBN21UH89PxfqvVHbiew==
X-Received: by 2002:a17:902:e40a:b0:183:f90:2fb with SMTP id
 m10-20020a170902e40a00b001830f9002fbmr2311120ple.28.1665701715304; 
 Thu, 13 Oct 2022 15:55:15 -0700 (PDT)
Received: from localhost ([2a00:79e1:abd:4a00:2703:3c72:eb1a:cffd])
 by smtp.gmail.com with ESMTPSA id
 t5-20020a170902e84500b0016dbdf7b97bsm325810plg.266.2022.10.13.15.55.14
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Thu, 13 Oct 2022 15:55:14 -0700 (PDT)
From: Rob Clark <robdclark@gmail.com>
To: dri-devel@lists.freedesktop.org
Subject: [PATCH 1/3] drm/msm/a6xx: Fix kvzalloc vs state_kcalloc usage
Date: Thu, 13 Oct 2022 15:55:13 -0700
Message-Id: <20221013225520.371226-2-robdclark@gmail.com>
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
 open list <linux-kernel@vger.kernel.org>, Emma Anholt <emma@anholt.net>,
 Akhil P Oommen <quic_akhilpo@quicinc.com>, David Airlie <airlied@linux.ie>,
 linux-arm-msm@vger.kernel.org, Abhinav Kumar <quic_abhinavk@quicinc.com>,
 Douglas Anderson <dianders@chromium.org>, Sean Paul <sean@poorly.run>,
 Dmitry Baryshkov <dmitry.baryshkov@linaro.org>,
 freedreno@lists.freedesktop.org, Dan Carpenter <dan.carpenter@oracle.com>
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

From: Rob Clark <robdclark@chromium.org>

adreno_show_object() is a trap!  It will re-allocate the pointer it is
passed on first call, when the data is ascii85 encoded, using kvmalloc/
kvfree().  Which means the data *passed* to it must be kvmalloc'd, ie.
we cannot use the state_kcalloc() helper.

This partially reverts
ec8f1813bf8d ("drm/msm/a6xx: Replace kcalloc() with kvzalloc()"), but
fix the missing kvfree() to fix the memory leak that was present
previously.  And adds a warning comment.

Fixes: ec8f1813bf8d ("drm/msm/a6xx: Replace kcalloc() with kvzalloc()")
Closes: https://gitlab.freedesktop.org/drm/msm/-/issues/20
Signed-off-by: Rob Clark <robdclark@chromium.org>
---
 drivers/gpu/drm/msm/adreno/a6xx_gpu_state.c | 11 ++++++++++-
 drivers/gpu/drm/msm/adreno/adreno_gpu.c     |  7 ++++++-
 2 files changed, 16 insertions(+), 2 deletions(-)

diff --git a/drivers/gpu/drm/msm/adreno/a6xx_gpu_state.c b/drivers/gpu/drm/msm/adreno/a6xx_gpu_state.c
index 3c112a6cc8a2..730355f9e2d4 100644
--- a/drivers/gpu/drm/msm/adreno/a6xx_gpu_state.c
+++ b/drivers/gpu/drm/msm/adreno/a6xx_gpu_state.c
@@ -819,7 +819,7 @@ static struct msm_gpu_state_bo *a6xx_snapshot_gmu_bo(
 
 	snapshot->iova = bo->iova;
 	snapshot->size = bo->size;
-	snapshot->data = state_kcalloc(a6xx_state, 1, snapshot->size);
+	snapshot->data = kvzalloc(snapshot->size, GFP_KERNEL);
 	if (!snapshot->data)
 		return NULL;
 
@@ -1034,6 +1034,15 @@ static void a6xx_gpu_state_destroy(struct kref *kref)
 	struct a6xx_gpu_state *a6xx_state = container_of(state,
 			struct a6xx_gpu_state, base);
 
+	if (a6xx_state->gmu_log)
+		kvfree(a6xx_state->gmu_log->data);
+
+	if (a6xx_state->gmu_hfi)
+		kvfree(a6xx_state->gmu_hfi->data);
+
+	if (a6xx_state->gmu_debug)
+		kvfree(a6xx_state->gmu_debug->data);
+
 	list_for_each_entry_safe(obj, tmp, &a6xx_state->objs, node)
 		kvfree(obj);
 
diff --git a/drivers/gpu/drm/msm/adreno/adreno_gpu.c b/drivers/gpu/drm/msm/adreno/adreno_gpu.c
index 382fb7f9e497..5a0e8491cd3a 100644
--- a/drivers/gpu/drm/msm/adreno/adreno_gpu.c
+++ b/drivers/gpu/drm/msm/adreno/adreno_gpu.c
@@ -729,7 +729,12 @@ static char *adreno_gpu_ascii85_encode(u32 *src, size_t len)
 	return buf;
 }
 
-/* len is expected to be in bytes */
+/* len is expected to be in bytes
+ *
+ * WARNING: *ptr should be allocated with kvmalloc or friends.  It can be free'd
+ * with kvfree() and replaced with a newly kvmalloc'd buffer on the first call
+ * when the unencoded raw data is encoded
+ */
 void adreno_show_object(struct drm_printer *p, void **ptr, int len,
 		bool *encoded)
 {
-- 
2.37.3

