Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 70E99A560C3
	for <lists+dri-devel@lfdr.de>; Fri,  7 Mar 2025 07:25:16 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 2965910EAF2;
	Fri,  7 Mar 2025 06:25:12 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=kernel.org header.i=@kernel.org header.b="ZK0POu8z";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from nyc.source.kernel.org (nyc.source.kernel.org [147.75.193.91])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 3CB1610EAF0;
 Fri,  7 Mar 2025 06:25:11 +0000 (UTC)
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
 by nyc.source.kernel.org (Postfix) with ESMTP id B37E1A45513;
 Fri,  7 Mar 2025 06:19:39 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id CC1C3C4CED1;
 Fri,  7 Mar 2025 06:25:07 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=k20201202; t=1741328710;
 bh=Usvh7SJRnxUdW+2t40bV5tdcy+l+8OFmkR1Ib2MugvI=;
 h=From:Date:Subject:References:In-Reply-To:To:Cc:From;
 b=ZK0POu8zVZ4mj+Pp7hhmd6oZpvCFjnWxMPGWlq1BCBy6/5RkLPw7gI5HrCFp0oq3m
 MaS951Gc0l+sn9S/DB722v07x0AdznhK8ivVNEvgrSnp2Xp5KgRfwykgzVnBpT/385
 NM5l9D0OPoRjfH/93I7LIt00+itBLd54fYdOhZXJDK25auts8ykW0TchG43/saOmQt
 lGpVhizzsk/3/ImRcabZOBaMrHmLSW2CntDvd/XXuM45Vs1PIzf2M/DM13USmJJm+Q
 7mI2OHfAzvQHUGtxi8bunJclzF+tsnN9eFjKV/GsSIi6x1FJbBhMvT1nP7kKz+/q/U
 R0TwVJB/zwdJg==
From: Dmitry Baryshkov <lumag@kernel.org>
Date: Fri, 07 Mar 2025 08:24:53 +0200
Subject: [PATCH v3 5/8] drm/msm/dpu: don't select single flush for active
 CTL blocks
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20250307-dpu-active-ctl-v3-5-5d20655f10ca@linaro.org>
References: <20250307-dpu-active-ctl-v3-0-5d20655f10ca@linaro.org>
In-Reply-To: <20250307-dpu-active-ctl-v3-0-5d20655f10ca@linaro.org>
To: Rob Clark <robdclark@gmail.com>, 
 Abhinav Kumar <quic_abhinavk@quicinc.com>, Sean Paul <sean@poorly.run>, 
 Marijn Suijten <marijn.suijten@somainline.org>, 
 David Airlie <airlied@gmail.com>, Simona Vetter <simona@ffwll.ch>
Cc: linux-arm-msm@vger.kernel.org, dri-devel@lists.freedesktop.org, 
 freedreno@lists.freedesktop.org, linux-kernel@vger.kernel.org, 
 Neil Armstrong <neil.armstrong@linaro.org>
X-Mailer: b4 0.14.2
X-Developer-Signature: v=1; a=openpgp-sha256; l=1143;
 i=dmitry.baryshkov@linaro.org; h=from:subject:message-id;
 bh=pNBf2aRcMSth9knECWkJ61FgZNwsJWNHoE8JVnYufRk=;
 b=owEBbQGS/pANAwAKAYs8ij4CKSjVAcsmYgBnypE0M3eSbXw1ue3WHHumd5JdB7FbcNE/3t/Wm
 yGLdfZPnWGJATMEAAEKAB0WIQRMcISVXLJjVvC4lX+LPIo+Aiko1QUCZ8qRNAAKCRCLPIo+Aiko
 1XVSB/9EYGsktLgpmAkSdWgo74vRixdtILMoZFOOGOqBalKLk8szxGI02C7NG0ErMo3Vom+zD1u
 X/bCwboFCt96wO/8TVJRoM0v/6hsNrexpf//yFTG9ObmdxuYKEdvQHmAhBTayaJPBT4keDvwZ9b
 JQ8z9pp4biFzbjX9sNCjCrQoTdy4TLiPmeHfhq81nibHV3FKz0OfXq0USzJW13m/xIbCiXTG0zb
 pUyj4kV4JQY0nqQnu2xAE71pmJXra+OSZlMNLuWkEs+C5ckIhpYJ5nzdPwAJ+Cf9iyLMsyGJpFQ
 IEGMkmhuC8wA6Wk24Lm6tDg1BpSrZO4Tp0W158kvYynlxgaE
X-Developer-Key: i=dmitry.baryshkov@linaro.org; a=openpgp;
 fpr=8F88381DD5C873E4AE487DA5199BF1243632046A
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
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

From: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>

In case of ACTIVE CTLs, a single CTL is being used for flushing all INTF
blocks. Don't skip programming the CTL on those targets.

Tested-by: Neil Armstrong <neil.armstrong@linaro.org> # on SM8550-QRD
Signed-off-by: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
---
 drivers/gpu/drm/msm/disp/dpu1/dpu_encoder_phys_vid.c | 3 ++-
 1 file changed, 2 insertions(+), 1 deletion(-)

diff --git a/drivers/gpu/drm/msm/disp/dpu1/dpu_encoder_phys_vid.c b/drivers/gpu/drm/msm/disp/dpu1/dpu_encoder_phys_vid.c
index 232055473ba55998b79dd2e8c752c129bbffbff4..8a618841e3ea89acfe4a42d48319a6c54a1b3495 100644
--- a/drivers/gpu/drm/msm/disp/dpu1/dpu_encoder_phys_vid.c
+++ b/drivers/gpu/drm/msm/disp/dpu1/dpu_encoder_phys_vid.c
@@ -374,7 +374,8 @@ static void dpu_encoder_phys_vid_underrun_irq(void *arg)
 static bool dpu_encoder_phys_vid_needs_single_flush(
 		struct dpu_encoder_phys *phys_enc)
 {
-	return phys_enc->split_role != ENC_ROLE_SOLO;
+	return !(phys_enc->hw_ctl->caps->features & BIT(DPU_CTL_ACTIVE_CFG)) &&
+		phys_enc->split_role != ENC_ROLE_SOLO;
 }
 
 static void dpu_encoder_phys_vid_atomic_mode_set(

-- 
2.39.5

