Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id C13AB6E8B35
	for <lists+dri-devel@lfdr.de>; Thu, 20 Apr 2023 09:15:40 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id CBC8210EBCB;
	Thu, 20 Apr 2023 07:15:36 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-wm1-x334.google.com (mail-wm1-x334.google.com
 [IPv6:2a00:1450:4864:20::334])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 5E66F10E133
 for <dri-devel@lists.freedesktop.org>; Wed, 19 Apr 2023 14:42:00 +0000 (UTC)
Received: by mail-wm1-x334.google.com with SMTP id
 ay3-20020a05600c1e0300b003f17289710aso1546652wmb.5
 for <dri-devel@lists.freedesktop.org>; Wed, 19 Apr 2023 07:42:00 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=freebox-fr.20221208.gappssmtp.com; s=20221208; t=1681915318; x=1684507318;
 h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
 :mime-version:subject:date:from:from:to:cc:subject:date:message-id
 :reply-to; bh=gvyREH2toDbRX8jPDQqcQOz9n9jRJ61Ib08FCCvn3Ik=;
 b=fiEmjRI5sy66IY14yPYdCnD3Wng5CaWmy8/JWcrmhUpLJm++qPxhqYFuZBBwad2Bk1
 fRC3PzylukzxUDXSaONiWypd1Qdz05sGYKefLuw6OlnX0ItB1uSbRHZ8BB9JEI+2f4tG
 ODTG+NUZEU6Bz49uGDl1rbfofa0a2OQPMnNxd0z56unCc1W9/2JHjUzvzMqYysrAmn2e
 LM8DuZQPfdNstgogGHSUQYrwhPTNUpWSVbCBuwrTjhnRPl/iUG/dltawjO0l42MNo37i
 irA1ZHZz+utK25dZM6ERc+rbyPl/k+FsCapqQdUoNmpPXQDwJMZc43wHrPLb2/Bemt4m
 1iTQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20221208; t=1681915318; x=1684507318;
 h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
 :mime-version:subject:date:from:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=gvyREH2toDbRX8jPDQqcQOz9n9jRJ61Ib08FCCvn3Ik=;
 b=Jtm5nvA98dJue6zjoQWVbKT2Ukmo/zZkfxw4dMD/lC8Vs0AUYFkWAAIbW53yZFBGZl
 6RQ+ruiBqqO6I+KHf2UJXEQcY/vtrjjacqOwj3CSCdz7FvsAOxiwhF1+TFoC1911Bk/W
 O0alyNV6ZIIUxsu9EmfayAv3WcS5nUZyak/VyyuOPp7LNN9Tx90Kf5HtObvvfY8D9ndJ
 Ru8oPLtTLKU/MJNlJO7mtkDEyuzEbvpBV1roS2+uE8ojyP6SwNzOUNgU179GNtsNkalx
 DdlcOjCSGFRxav+j2NzzXKKLmRaiQnvXpSq+lPL/CrBlHSFGAhHPwHFXEyfYhsKZgfzv
 TQyQ==
X-Gm-Message-State: AAQBX9c7H580H/BSqxy2phZ7sulTHTqDUD+5M/kaJKIRkgtanhJqbgzu
 xiCTSuloqAT6jymxF5lxaeCa
X-Google-Smtp-Source: AKy350Y41eDbjV44lpKj/xlTrUrnQ2HFRVzK6oIGLJjemuk1KHFBsUN/7nExtMcIBIBSxZ+5N0s1qw==
X-Received: by 2002:a1c:740d:0:b0:3f0:3d47:2cc5 with SMTP id
 p13-20020a1c740d000000b003f03d472cc5mr17091590wmc.10.1681915318268; 
 Wed, 19 Apr 2023 07:41:58 -0700 (PDT)
Received: from [127.0.1.1] (freebox.vlq16.iliad.fr. [213.36.7.13])
 by smtp.gmail.com with ESMTPSA id
 m22-20020a7bcb96000000b003f17131952fsm2388519wmi.29.2023.04.19.07.41.57
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Wed, 19 Apr 2023 07:41:58 -0700 (PDT)
From: Arnaud Vrac <avrac@freebox.fr>
Date: Wed, 19 Apr 2023 16:41:11 +0200
Subject: [PATCH 04/11] drm/msm/dpu: allow using lm mixer base stage
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20230419-dpu-tweaks-v1-4-d1bac46db075@freebox.fr>
References: <20230419-dpu-tweaks-v1-0-d1bac46db075@freebox.fr>
In-Reply-To: <20230419-dpu-tweaks-v1-0-d1bac46db075@freebox.fr>
To: Rob Clark <robdclark@gmail.com>, 
 Abhinav Kumar <quic_abhinavk@quicinc.com>, 
 Dmitry Baryshkov <dmitry.baryshkov@linaro.org>, Sean Paul <sean@poorly.run>, 
 David Airlie <airlied@gmail.com>, Daniel Vetter <daniel@ffwll.ch>
X-Mailer: b4 0.12.2
X-Developer-Signature: v=1; a=openpgp-sha256; l=1074; i=avrac@freebox.fr;
 h=from:subject:message-id; bh=NbkvlB+Rp9R8nBIqIbNdud3AhKbbO3pB8C+IbGJ1/iw=;
 b=owEBbQKS/ZANAwAIAXED/9m7NDSrAcsmYgBkP/2cS8NGHA5wCfb2NpdA7+TL/3Juvg4voqljd
 dCN9998hUiJAjMEAAEIAB0WIQSUwb/ndwkXHdZ/QQZxA//ZuzQ0qwUCZD/9nAAKCRBxA//ZuzQ0
 qzq2EAC8YPFyE4WUiu8BKSb1ZitW40OEsReZvh9sxbDZTP3qWZ+pC1T6aDRLrWtGd01II9zSvnZ
 1e1WtK52yoxgFMMIs9m76wrqd+HyouhNxyA49sA+TJ54CNigIw70r1AjmJlKxS5t4D7JONHX8EN
 8WcDnTOyTyjhOSuR7GMbNNQvMSoyIbLnBwDQi2JgPFIH74gUttelxpiXYp/o3BlfmCvu+jFUJ0m
 6DvZ646BwFhHgi+WdDeR0xa1UHABA2DR5YfRKQEfsd37Utg/ljJuurZ+676ax7Q/f+x5nhrv6tQ
 3MFCvmBJ0WPec4eyrvX/O5sqBeYoGrluaPJwBbwwerXAypw1clzFh5o90KY3sr1APTgKO8fNdWa
 dWf31VLcAWvEOm552brE5gYPZ3nmq151VbNilEz0wGK9BrzP6aiA3PvLX4iJpj9MxEwGlB13zuL
 efJ1ZwqB7FcJZB73j5f4OpckUi5z6ytaxwbNhEs/Ls8H59xlpsey2J2pvhfQIayi+nKxgF2mZLX
 nknVZm6xJQd8qjCKv31ErlindIv/OJMLYWB8CGTjLDSredGRtnPUyTHFPl192rjH4UydVVLvf3N
 BB9TxwJFD+a2TxomXyKgp7DOHsOjeQeReXiNxSuqzfxaFm2ti/HxPir504dyFomWRoUK2BxkKLW
 pB4JplwICLGWejQ==
X-Developer-Key: i=avrac@freebox.fr; a=openpgp;
 fpr=6225092072BB58E3CEEC091E75392A176D952DB4
X-Mailman-Approved-At: Thu, 20 Apr 2023 07:12:56 +0000
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
Cc: Arnaud Vrac <avrac@freebox.fr>, linux-arm-msm@vger.kernel.org,
 freedreno@lists.freedesktop.org, linux-kernel@vger.kernel.org,
 dri-devel@lists.freedesktop.org
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

The dpu backend already handles applying alpha to the base stage, so we
can use it to render the bottom plane in all cases. This allows mixing
one additional plane with the hardware mixer.

Signed-off-by: Arnaud Vrac <avrac@freebox.fr>
---
 drivers/gpu/drm/msm/disp/dpu1/dpu_plane.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/drivers/gpu/drm/msm/disp/dpu1/dpu_plane.c b/drivers/gpu/drm/msm/disp/dpu1/dpu_plane.c
index 14b5cfe306113..148921ed62f85 100644
--- a/drivers/gpu/drm/msm/disp/dpu1/dpu_plane.c
+++ b/drivers/gpu/drm/msm/disp/dpu1/dpu_plane.c
@@ -881,7 +881,7 @@ static int dpu_plane_atomic_check(struct drm_plane *plane,
 	r_pipe->multirect_mode = DPU_SSPP_MULTIRECT_NONE;
 	r_pipe->sspp = NULL;
 
-	pstate->stage = DPU_STAGE_0 + pstate->base.normalized_zpos;
+	pstate->stage = DPU_STAGE_BASE + pstate->base.normalized_zpos;
 	if (pstate->stage >= pdpu->catalog->caps->max_mixer_blendstages) {
 		DPU_ERROR("> %d plane stages assigned\n",
 			  pdpu->catalog->caps->max_mixer_blendstages - DPU_STAGE_0);

-- 
2.40.0

