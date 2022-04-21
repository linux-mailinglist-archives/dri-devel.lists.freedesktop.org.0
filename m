Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 419F450AA36
	for <lists+dri-devel@lfdr.de>; Thu, 21 Apr 2022 22:42:02 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id C9D3E10E05E;
	Thu, 21 Apr 2022 20:41:57 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
X-Greylist: delayed 372 seconds by postgrey-1.36 at gabe;
 Thu, 21 Apr 2022 20:41:56 UTC
Received: from mail.z3ntu.xyz (mail.z3ntu.xyz [128.199.32.197])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 9E7E010E053;
 Thu, 21 Apr 2022 20:41:56 +0000 (UTC)
Received: from g550jk.arnhem.chello.nl (a246182.upc-a.chello.nl
 [62.163.246.182])
 by mail.z3ntu.xyz (Postfix) with ESMTPSA id 1910FCC043;
 Thu, 21 Apr 2022 20:35:12 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple; d=z3ntu.xyz; s=z3ntu;
 t=1650573312; bh=Wx/zCUfbsxDCv8xhISdDZZirNu+1fzyBwddjK0yGyOg=;
 h=From:To:Cc:Subject:Date;
 b=CQUxwhoVAz4cdMEfo9dta2JoY5jVEcOoXhXsXr+EnXMmkay599as3FhA4d/Zx5sZY
 5ZO/7/wOn1oxMgMwVbc87vRWZn4mEfaN38jiPb3+zUlVhdbEor4HKprwLja/gKpYfd
 Bbr2mwmKx9vVTk4tmYQ8oI3KyqMkA4naO4NVQb9s=
From: Luca Weiss <luca@z3ntu.xyz>
To: dri-devel@lists.freedesktop.org
Subject: [PATCH] drm/msm: Fix null pointer dereferences without iommu
Date: Thu, 21 Apr 2022 22:34:53 +0200
Message-Id: <20220421203455.313523-1-luca@z3ntu.xyz>
X-Mailer: git-send-email 2.36.0
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
Cc: freedreno@lists.freedesktop.org, linux-kernel@vger.kernel.org,
 Emma Anholt <emma@anholt.net>, Jonathan Marek <jonathan@marek.ca>,
 David Airlie <airlied@linux.ie>, linux-arm-msm@vger.kernel.org,
 Stephen Boyd <swboyd@chromium.org>, Abhinav Kumar <quic_abhinavk@quicinc.com>,
 Jordan Crouse <jordan@cosmicpenguin.net>, Luca Weiss <luca@z3ntu.xyz>,
 Akhil P Oommen <quic_akhilpo@quicinc.com>,
 ~postmarketos/upstreaming@lists.sr.ht, phone-devel@vger.kernel.org,
 Sean Paul <sean@poorly.run>, Dan Carpenter <dan.carpenter@oracle.com>
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

Check if 'aspace' is set before using it as it will stay null without
IOMMU, such as on msm8974.

Fixes: bc2112583a0b ("drm/msm/gpu: Track global faults per address-space")
Signed-off-by: Luca Weiss <luca@z3ntu.xyz>
---
 drivers/gpu/drm/msm/adreno/adreno_gpu.c | 5 ++++-
 drivers/gpu/drm/msm/msm_gpu.c           | 3 ++-
 2 files changed, 6 insertions(+), 2 deletions(-)

diff --git a/drivers/gpu/drm/msm/adreno/adreno_gpu.c b/drivers/gpu/drm/msm/adreno/adreno_gpu.c
index 9efc84929be0..1219f71629a5 100644
--- a/drivers/gpu/drm/msm/adreno/adreno_gpu.c
+++ b/drivers/gpu/drm/msm/adreno/adreno_gpu.c
@@ -272,7 +272,10 @@ int adreno_get_param(struct msm_gpu *gpu, struct msm_file_private *ctx,
 		*value = 0;
 		return 0;
 	case MSM_PARAM_FAULTS:
-		*value = gpu->global_faults + ctx->aspace->faults;
+		if (ctx->aspace)
+			*value = gpu->global_faults + ctx->aspace->faults;
+		else
+			*value = gpu->global_faults;
 		return 0;
 	case MSM_PARAM_SUSPENDS:
 		*value = gpu->suspend_count;
diff --git a/drivers/gpu/drm/msm/msm_gpu.c b/drivers/gpu/drm/msm/msm_gpu.c
index faf0c242874e..58eb3e1662cb 100644
--- a/drivers/gpu/drm/msm/msm_gpu.c
+++ b/drivers/gpu/drm/msm/msm_gpu.c
@@ -371,7 +371,8 @@ static void recover_worker(struct kthread_work *work)
 
 		/* Increment the fault counts */
 		submit->queue->faults++;
-		submit->aspace->faults++;
+		if (submit->aspace)
+			submit->aspace->faults++;
 
 		task = get_pid_task(submit->pid, PIDTYPE_PID);
 		if (task) {
-- 
2.36.0

