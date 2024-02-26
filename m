Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id E5FF9866832
	for <lists+dri-devel@lfdr.de>; Mon, 26 Feb 2024 03:28:12 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 2170610ED33;
	Mon, 26 Feb 2024 02:28:09 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=linaro.org header.i=@linaro.org header.b="Fzz2Orvw";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-lj1-f180.google.com (mail-lj1-f180.google.com
 [209.85.208.180])
 by gabe.freedesktop.org (Postfix) with ESMTPS id E5DEA10ED2D
 for <dri-devel@lists.freedesktop.org>; Mon, 26 Feb 2024 02:28:03 +0000 (UTC)
Received: by mail-lj1-f180.google.com with SMTP id
 38308e7fff4ca-2d204e102a9so30795361fa.0
 for <dri-devel@lists.freedesktop.org>; Sun, 25 Feb 2024 18:28:03 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=linaro.org; s=google; t=1708914482; x=1709519282; darn=lists.freedesktop.org;
 h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
 :mime-version:subject:date:from:from:to:cc:subject:date:message-id
 :reply-to; bh=8UIRQxSlc1BHlT1FIxTW/PhTeczKV/3fX3odMQFOFMs=;
 b=Fzz2Orvw3uLCEZHN3Y+BZCD9xYwchFu+P/jghlNLdaMD8ivCk5eb3qdUzKKvLnSJOY
 jxIUTn6Df/ZcnG6x+P7kRRDKdPByCuORROgqn1ewS6YG+Sl62P/2GPUsI8YSjWz8WdXE
 Lm1wM/3ykNT3AbHC4Xz+BaJdGZy7c8OfSOZPH1/UEtke1GBLOA68PYjW1173qbBMt/P0
 /tUun09e863N+rxAwNPdmLmppG0wV67c14jPgdK0J9j4YxMa71amRxt582nK0iIyRm6F
 naVKOYM5tp3m40s7p3L8f8ah0+nFonOoBS7/rILX5JkRgabCSfi3wWl7jUeSA+xgIAUK
 eSZQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1708914482; x=1709519282;
 h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
 :mime-version:subject:date:from:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=8UIRQxSlc1BHlT1FIxTW/PhTeczKV/3fX3odMQFOFMs=;
 b=ml7QJbQYnI8ot2hUKS16OdsxLsh327xTDV0JwNoQishz/XbIr0xfdwa7+qMujINfcs
 cxNcYn3IUB57pE0rCwS53t7ZWqIp4NkgqMe7OeBihxsjfJBsZsjJ2OSGFem5bb3lwn99
 8xLSQlDvqXTPaeYwuqHSudYhcxBCvsp6f6F0gMnrpwKI85nBnAn8hs8oEylzbWB+CORG
 Rir1HvRR3YCGcZ1U8rTjU941GI38Ac5IeuqYnN3msqeOMCs8WZaqec5OvUgqhNMotJjE
 67kGtGNYIycPx3IyCIcKBS/Nxty2YXX/Sf2sJpKRxs8ixz+bY4fcJosEZXQF2cSM7Gj5
 TvFg==
X-Forwarded-Encrypted: i=1;
 AJvYcCVKwvVvVmemKAvN8jDHY0RYSIh/NsRTDOlNwr9JhQFEEHR2T58YdRRwP3Op3H90yJ+PP1E7et5fGf7sjnS3MPj448DCQIjB7tfpBYIN8Yvp
X-Gm-Message-State: AOJu0Yzjg8Gcf4epP8Oht5cblQl86aQSJe6oqeAwdEi5VVqf3FAlkiMN
 1+MCkDcnTMwh1Kw+MKHTIR+JKOhk6WUWTBxYm7b82YTVvtfAep+FH/Ms+yquT/U=
X-Google-Smtp-Source: AGHT+IEMCMiRII/qO+zr0AXdzytH5T3PU6mkNFMj/oxPWnq4hj7ZB0UmbIODJOC5j/e3MVo+Z+F4sw==
X-Received: by 2002:a2e:87ce:0:b0:2d2:8a86:e5d4 with SMTP id
 v14-20020a2e87ce000000b002d28a86e5d4mr907780ljj.21.1708914481698; 
 Sun, 25 Feb 2024 18:28:01 -0800 (PST)
Received: from umbar.lan (dzyjmhybhls-s--zn36gy-3.rev.dnainternet.fi.
 [2001:14ba:a00e:a300:264b:feff:fe8b:be8a])
 by smtp.gmail.com with ESMTPSA id
 u19-20020a2e8553000000b002d11ef66881sm713092ljj.91.2024.02.25.18.28.00
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Sun, 25 Feb 2024 18:28:00 -0800 (PST)
From: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
Date: Mon, 26 Feb 2024 04:27:59 +0200
Subject: [PATCH v4 1/3] drm/msm/dpu: make "vblank timeout" more useful
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20240226-fd-dpu-debug-timeout-v4-1-51eec83dde23@linaro.org>
References: <20240226-fd-dpu-debug-timeout-v4-0-51eec83dde23@linaro.org>
In-Reply-To: <20240226-fd-dpu-debug-timeout-v4-0-51eec83dde23@linaro.org>
To: Rob Clark <robdclark@gmail.com>, 
 Abhinav Kumar <quic_abhinavk@quicinc.com>, Sean Paul <sean@poorly.run>, 
 Marijn Suijten <marijn.suijten@somainline.org>, 
 David Airlie <airlied@gmail.com>, Daniel Vetter <daniel@ffwll.ch>
Cc: Steev Klimaszewski <steev@kali.org>, linux-arm-msm@vger.kernel.org, 
 dri-devel@lists.freedesktop.org, freedreno@lists.freedesktop.org, 
 linux-kernel@vger.kernel.org
X-Mailer: b4 0.13.0
X-Developer-Signature: v=1; a=openpgp-sha256; l=1113;
 i=dmitry.baryshkov@linaro.org; h=from:subject:message-id;
 bh=u/LLMAwCactui0InH0azxw69mOb5zZdT0MKFe0dxyYY=;
 b=owEBbQGS/pANAwAKAYs8ij4CKSjVAcsmYgBl2/cv3wmpf4E4iBAzHWRmMIm2xXfZ9nq0MLbMk
 UhPkkONCbSJATMEAAEKAB0WIQRMcISVXLJjVvC4lX+LPIo+Aiko1QUCZdv3LwAKCRCLPIo+Aiko
 1cuxB/9yyz8H/zy2dEohWWy29s9WbXojtz4t+WYhhbEzbRHqJkpqoSL92QjfIFdLuv/iJWazADD
 tuZyzZgMYyO1Qqlod5lZXLlm7WoelkQGBZzk3xoFSpQWM16HypNWEmxwkgaqyGfos3Alp+L9T4t
 weBlSTgaKeo2WlkB48Rzmk8FRuaPyoQymxyixCFUUb1hy4RF4+XCm0U3wZ8H9d3bdobv4Vu76gG
 IplHCwPOr5aNPomk0hJuxBB6hxHgHPUB9cAuFxKwp+iu6zSXJXUsiLwzFU+9L2hLEffhsycs3aF
 r/Nz9q77g0+W4klVprofqOqI38IMGl7grLFd2vfRAJfyntSP
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

We have several reports of vblank timeout messages. However after some
debugging it was found that there might be different causes to that.
To allow us to identify the DPU block that gets stuck, include the
actual CTL_FLUSH value into the timeout message.

Reviewed-by: Abhinav Kumar <quic_abhinavk@quicinc.com>
Signed-off-by: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
---
 drivers/gpu/drm/msm/disp/dpu1/dpu_encoder_phys_vid.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/drivers/gpu/drm/msm/disp/dpu1/dpu_encoder_phys_vid.c b/drivers/gpu/drm/msm/disp/dpu1/dpu_encoder_phys_vid.c
index 2aa72b578764..6058706f03e4 100644
--- a/drivers/gpu/drm/msm/disp/dpu1/dpu_encoder_phys_vid.c
+++ b/drivers/gpu/drm/msm/disp/dpu1/dpu_encoder_phys_vid.c
@@ -480,7 +480,7 @@ static int dpu_encoder_phys_vid_wait_for_commit_done(
 		(hw_ctl->ops.get_flush_register(hw_ctl) == 0),
 		msecs_to_jiffies(50));
 	if (ret <= 0) {
-		DPU_ERROR("vblank timeout\n");
+		DPU_ERROR("vblank timeout: %x\n", hw_ctl->ops.get_flush_register(hw_ctl));
 		return -ETIMEDOUT;
 	}
 

-- 
2.39.2

