Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id C6E9276832F
	for <lists+dri-devel@lfdr.de>; Sun, 30 Jul 2023 03:19:38 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 8BD3910E24E;
	Sun, 30 Jul 2023 01:19:32 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-ej1-x62a.google.com (mail-ej1-x62a.google.com
 [IPv6:2a00:1450:4864:20::62a])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 6BC4D10E24D
 for <dri-devel@lists.freedesktop.org>; Sun, 30 Jul 2023 01:19:27 +0000 (UTC)
Received: by mail-ej1-x62a.google.com with SMTP id
 a640c23a62f3a-99454855de1so464656266b.2
 for <dri-devel@lists.freedesktop.org>; Sat, 29 Jul 2023 18:19:27 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=linaro.org; s=google; t=1690679966; x=1691284766;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:from:to:cc:subject:date
 :message-id:reply-to;
 bh=U0wpK3A204WX+OKsINI1AYwcUxgviu2sOl+wOj2EUdI=;
 b=aK0f5NWQM6COdeiu7SvyUzC8HCOPFgfS8Ve0Gmj8X2tc2LOYAiu7HmHmPnJHWlQzZD
 V+ec2CgO+zusKNQqdEzadHbCOn0J9Vr8VxR6wvmNvY1Nnl2QBi4CVD8bAZgp0Nr3Jwd0
 SuL6K+IOGMwWI4jT+3N1DGPaNwIqiwH7AqUDiTuoMD7rsmOs4Olni/Xqf9JK4B2nt/gP
 vIHzNif52XgdLSfeJM4z8hk08ULoeEjmB9IjAjvlkI9iMU46H92GoSBH8Qa/ab6IWwHS
 Holw4d8Rnvg5xEzT0opBb+/UfshmikVPaVuf6ZlA8jyIRfM2VkBL+YqeEB6lCTOAV++U
 yaww==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20221208; t=1690679966; x=1691284766;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=U0wpK3A204WX+OKsINI1AYwcUxgviu2sOl+wOj2EUdI=;
 b=dmtd90MkV/h/Z/efT+VBXFVlqMdzpmbN8DFN/iw4he/ilt82boTW+HpnIiWm3LJbjn
 p55PxywqDr1SO9RXsYw9Ta2j7hrd+qSUfKoBPqnk3TfXi812K7eGQR/iSJojk2ONEzXQ
 jEpunC0VzkVmvSggpRpArQkVpnIbWw9n7rABeeI/LBka/2wsAN3g+XWTTA/vRfp+/GUN
 aQVkMLxrxaLxxk56+TyYZSgDzNQT76cyeWBGb/gZNWhIdVrAhZ5XSgioLR7s1hCIfFpx
 zyYs7HgYA3WOfAwF2yFeNfCuLqoWy/pyWXap0PLxUHAb2KxtgElcD+Rl2vo1wfXOaBGf
 Zvvw==
X-Gm-Message-State: ABy/qLZoNnb6zB8BTVVnZMguU2c2HM/TqjUD1y0BRw6sEKiHK6SUJszL
 Eh70hyI2bb9QUjjmIyvONEKUtw==
X-Google-Smtp-Source: APBJJlGRep0ESOlLPd6AHtdKqokWBWL/l7VKefGoEhVF9IspyvdPjQMmbek8jcRmtM3mjTw9InNxNA==
X-Received: by 2002:a17:907:a077:b0:993:d536:3cb8 with SMTP id
 ia23-20020a170907a07700b00993d5363cb8mr2919701ejc.2.1690679965769; 
 Sat, 29 Jul 2023 18:19:25 -0700 (PDT)
Received: from umbar.unikie.fi ([192.130.178.91])
 by smtp.gmail.com with ESMTPSA id
 rk21-20020a170907215500b00992ea405a79sm3915835ejb.166.2023.07.29.18.19.24
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Sat, 29 Jul 2023 18:19:25 -0700 (PDT)
From: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
To: Rob Clark <robdclark@gmail.com>, Sean Paul <sean@poorly.run>,
 Abhinav Kumar <quic_abhinavk@quicinc.com>,
 Marijn Suijten <marijn.suijten@somainline.org>
Subject: [PATCH v3 02/13] drm/msm/dpu: remove IS_ERR_OR_NULL for
 dpu_hw_intr_init() error handling
Date: Sun, 30 Jul 2023 04:19:09 +0300
Message-Id: <20230730011920.354575-3-dmitry.baryshkov@linaro.org>
X-Mailer: git-send-email 2.39.2
In-Reply-To: <20230730011920.354575-1-dmitry.baryshkov@linaro.org>
References: <20230730011920.354575-1-dmitry.baryshkov@linaro.org>
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
Cc: freedreno@lists.freedesktop.org, linux-arm-msm@vger.kernel.org,
 Bjorn Andersson <andersson@kernel.org>, dri-devel@lists.freedesktop.org,
 Stephen Boyd <swboyd@chromium.org>, Jessica Zhang <quic_jesszhan@quicinc.com>
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

Using IS_ERR_OR_NULL() together with PTR_ERR() is a typical mistake. If
the value is NULL, then the function will return 0 instead of a proper
return code. Replace IS_ERR_OR_NULL() with IS_ERR() in the
dpu_hw_intr_init() error check.

Reviewed-by: Jessica Zhang <quic_jesszhan@quicinc.com>
Signed-off-by: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
---
 drivers/gpu/drm/msm/disp/dpu1/dpu_kms.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/drivers/gpu/drm/msm/disp/dpu1/dpu_kms.c b/drivers/gpu/drm/msm/disp/dpu1/dpu_kms.c
index 77a79bc42492..3fe43d9be2e5 100644
--- a/drivers/gpu/drm/msm/disp/dpu1/dpu_kms.c
+++ b/drivers/gpu/drm/msm/disp/dpu1/dpu_kms.c
@@ -1136,7 +1136,7 @@ static int dpu_kms_hw_init(struct msm_kms *kms)
 	}
 
 	dpu_kms->hw_intr = dpu_hw_intr_init(dpu_kms->mmio, dpu_kms->catalog);
-	if (IS_ERR_OR_NULL(dpu_kms->hw_intr)) {
+	if (IS_ERR(dpu_kms->hw_intr)) {
 		rc = PTR_ERR(dpu_kms->hw_intr);
 		DPU_ERROR("hw_intr init failed: %d\n", rc);
 		dpu_kms->hw_intr = NULL;
-- 
2.39.2

