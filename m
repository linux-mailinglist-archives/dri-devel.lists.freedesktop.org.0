Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 2F57C437BAB
	for <lists+dri-devel@lfdr.de>; Fri, 22 Oct 2021 19:16:20 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id C40D76EDBA;
	Fri, 22 Oct 2021 17:16:14 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-pf1-x430.google.com (mail-pf1-x430.google.com
 [IPv6:2607:f8b0:4864:20::430])
 by gabe.freedesktop.org (Postfix) with ESMTPS id D6BF26EDBA;
 Fri, 22 Oct 2021 17:16:13 +0000 (UTC)
Received: by mail-pf1-x430.google.com with SMTP id f11so4206363pfc.12;
 Fri, 22 Oct 2021 10:16:13 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20210112;
 h=from:to:cc:subject:date:message-id:mime-version
 :content-transfer-encoding;
 bh=c9upTkwBh3xY9ywVd8LkCHHOA2Tt2sOFO924JWSijq0=;
 b=QrR58CC78T/zmrIipMKrPGSMwC/I47uWJVSNHT6Ydg3H9l4vuWSR1ZylzAAGbS0hkm
 Sz44gG5gK9JwqfvIJIcdc0nx+qtJNMyJWA581taM6Y5RHeBdkjz3NrfQ4mXRTEqunhJK
 EooRYODEnkxtrk/STfw5MjbjScdCK193Q2VKyWgywQpYlzLSTFrpsYn1dsna0Y1VAeJQ
 8mRZ+vTP72yFJKGlPFOmliIE5y4Ma1qf2b8P/ac22582z18XviqMtUuoH1OcuK5DZHEu
 m0ajmv8RLK4/Rb6umPwwpkwZDFYpgrJMPpMPZdGBSz680xdc8X/3MdSrKtX/dyi0Z9cB
 QaYQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:mime-version
 :content-transfer-encoding;
 bh=c9upTkwBh3xY9ywVd8LkCHHOA2Tt2sOFO924JWSijq0=;
 b=K3RWjnv9Vf4LjV4T+8H5mNaPL77nnybcVwihA6fpHK9XOa8IPdMMbr3tjrPPrjJVHB
 rNDtmjZCVZtmIr//xVAweHckp1SBth9fAOUyItmFT5XR960x5L6P3NWwZdIrYrbeE1dG
 MrLj+Dj+ox/H3N787dEDuL/t34f6SeBI5M51pPyimn9lueo3kqUL8c/Ei5mkm6J8q8uz
 hup12gCpArR85EDf31oTQLdU0KKui9jx7yeTxU0lLcCYxnUG5Bep0M3SCkru7CtUBqk9
 YL5Zc+wFSZKver/+obekfQ02lLK92vBoWUxDJ0eze9tqfEoI/ieDDq0DzwWETBj71ruX
 L64Q==
X-Gm-Message-State: AOAM530V3Dx93XhrYglWSXxNYtCeoDSQ8IBL8ZoFuC0U6MUj74KVPhto
 pZbp7LvYaZMHJqDjTfYL4j8QiUYYMlg=
X-Google-Smtp-Source: ABdhPJyi3p42NwGJnpHuM40MQDCQUuNXmqIX0qRYo/6NEw1YGQJUAfXkXwbF4oXxVbnngtJFjl9IRg==
X-Received: by 2002:a63:e24b:: with SMTP id y11mr741728pgj.452.1634922972511; 
 Fri, 22 Oct 2021 10:16:12 -0700 (PDT)
Received: from localhost (c-73-25-156-94.hsd1.or.comcast.net. [73.25.156.94])
 by smtp.gmail.com with ESMTPSA id
 u66sm10416377pfc.114.2021.10.22.10.16.10
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Fri, 22 Oct 2021 10:16:11 -0700 (PDT)
From: Rob Clark <robdclark@gmail.com>
To: dri-devel@lists.freedesktop.org
Cc: freedreno@lists.freedesktop.org, linux-arm-msm@vger.kernel.org,
 Rob Clark <robdclark@chromium.org>, Rob Clark <robdclark@gmail.com>,
 Sean Paul <sean@poorly.run>, David Airlie <airlied@linux.ie>,
 Daniel Vetter <daniel@ffwll.ch>, Thomas Zimmermann <tzimmermann@suse.de>,
 Dmitry Baryshkov <dmitry.baryshkov@linaro.org>,
 Maxime Ripard <maxime@cerno.tech>, Abhinav Kumar <abhinavk@codeaurora.org>,
 Krishna Manikandan <mkrishn@codeaurora.org>,
 Stephen Boyd <swboyd@chromium.org>, Kalyan Thota <kalyan_t@codeaurora.org>,
 Jessica Zhang <jesszhan@codeaurora.org>,
 Mark Yacoub <markyacoub@google.com>,
 linux-kernel@vger.kernel.org (open list)
Subject: [PATCH 1/2] drm/msm/dpu: Remove impossible NULL check
Date: Fri, 22 Oct 2021 10:20:50 -0700
Message-Id: <20211022172053.3219597-1-robdclark@gmail.com>
X-Mailer: git-send-email 2.31.1
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
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

From: Rob Clark <robdclark@chromium.org>

Signed-off-by: Rob Clark <robdclark@chromium.org>
---
 drivers/gpu/drm/msm/disp/dpu1/dpu_crtc.c | 5 -----
 1 file changed, 5 deletions(-)

diff --git a/drivers/gpu/drm/msm/disp/dpu1/dpu_crtc.c b/drivers/gpu/drm/msm/disp/dpu1/dpu_crtc.c
index e91568d4f09a..0ae397044310 100644
--- a/drivers/gpu/drm/msm/disp/dpu1/dpu_crtc.c
+++ b/drivers/gpu/drm/msm/disp/dpu1/dpu_crtc.c
@@ -187,11 +187,6 @@ static int dpu_crtc_get_crc(struct drm_crtc *crtc)
 	int i = 0;
 	int rc = 0;
 
-	if (!crtc) {
-		DPU_ERROR("Invalid crtc\n");
-		return -EINVAL;
-	}
-
 	crtc_state = to_dpu_crtc_state(crtc->state);
 	crcs = kcalloc(crtc_state->num_mixers, sizeof(*crcs), GFP_KERNEL);
 
-- 
2.31.1

