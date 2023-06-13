Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 2B70572D576
	for <lists+dri-devel@lfdr.de>; Tue, 13 Jun 2023 02:10:35 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 5830510E2EA;
	Tue, 13 Jun 2023 00:10:16 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-lf1-x12d.google.com (mail-lf1-x12d.google.com
 [IPv6:2a00:1450:4864:20::12d])
 by gabe.freedesktop.org (Postfix) with ESMTPS id DA01110E2E4
 for <dri-devel@lists.freedesktop.org>; Tue, 13 Jun 2023 00:10:11 +0000 (UTC)
Received: by mail-lf1-x12d.google.com with SMTP id
 2adb3069b0e04-4f629ccb8ebso5898080e87.1
 for <dri-devel@lists.freedesktop.org>; Mon, 12 Jun 2023 17:10:11 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=linaro.org; s=google; t=1686615010; x=1689207010;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:from:to:cc:subject:date
 :message-id:reply-to;
 bh=5VOufof82LdFXq5Avw+IGoCuTtc/4cJuL5op7JwlHY8=;
 b=RMVZESEktU9x/dwTev7Vnf18otE1Pw+LM+9HjPAkDQ/xcPB59RDhPsA46Gazxih5dr
 FachsxGtxUvxIn9w8HN/ZFRclsKkX1IwSrdVzs2DqrApiAZvHBUgHizKKSVhlLD9pqJJ
 KAbQSoiiNdz63+qwAWOff/0vOJ4iL7GShTphjjiihbKe08HvQl294PSVAXCkbk8EGt/j
 hfD4Ka+JIF4funfOCraP73PzkE8q8FgAlHrcEvBvFFOEo41cMe9/YtmBuFq7e1yBexhO
 d1EHnF5BChN3KeXEWkW2MJKV56Yx7/dP0PfIMnhGcueqOZBKRgdwvk+r0W8nvnlO+0tj
 jLig==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20221208; t=1686615010; x=1689207010;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=5VOufof82LdFXq5Avw+IGoCuTtc/4cJuL5op7JwlHY8=;
 b=kE7kxA75+O/hMI46NZ7SnrGSV5EPZwFum1nQIzg9aKkIIctCBsDCH/lHEgR+ZkC62M
 ZmfBF7Pf+TjSh5Qzqt46Dm0FGZjzIJgKMEZ5RI2pZRePXpDPcUFPDs9BcV539Mckm0Rn
 mxNhcEHu607qAE5smDVzQ1HN3ZPkW4nT1/BUAY3W/zJmhbIG5gTrsdtJdvN5P4ojE2PB
 1TFdWd7Ig6dpPu/4B4EYSCXJZENo53XFSZxOc9NUrFzIzkElYlaLNjBWbfvIYTZeXi0U
 H8YPne/0+TuplG9XyGbsQv0IwYprp65abJb96GfKcDv6GHXX8vQZFNUrR4mSKnUhmkxn
 ShnA==
X-Gm-Message-State: AC+VfDxtShbiiS5dMjgwTBOCkFeKmhqe+whk5fCUhM3TyXBdLipPABI9
 VDLkLbTLI7TFIuHC/TJodzl5Kvw/LYRp6KgBN+s=
X-Google-Smtp-Source: ACHHUZ6qNMlmsZQl5mhOYHN407i3q5TDwQmWKGOaWWDRMj8n5sGEIBJreQbMAOvMFV30lg/aU11IcQ==
X-Received: by 2002:ac2:5b11:0:b0:4f1:dcd2:ab6d with SMTP id
 v17-20020ac25b11000000b004f1dcd2ab6dmr5715036lfn.28.1686615009944; 
 Mon, 12 Jun 2023 17:10:09 -0700 (PDT)
Received: from eriador.lan (dzdqv0yyyyyyyyyyybcwt-3.rev.dnainternet.fi.
 [2001:14ba:a0db:1f00::8a5]) by smtp.gmail.com with ESMTPSA id
 c10-20020ac2530a000000b004f63eea01a7sm1581604lfh.192.2023.06.12.17.10.09
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Mon, 12 Jun 2023 17:10:09 -0700 (PDT)
From: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
To: Rob Clark <robdclark@gmail.com>, Sean Paul <sean@poorly.run>,
 Abhinav Kumar <quic_abhinavk@quicinc.com>,
 Marijn Suijten <marijn.suijten@somainline.org>
Subject: [PATCH v2 04/22] drm/msm: enumerate DSI interfaces
Date: Tue, 13 Jun 2023 03:09:43 +0300
Message-Id: <20230613001004.3426676-5-dmitry.baryshkov@linaro.org>
X-Mailer: git-send-email 2.39.2
In-Reply-To: <20230613001004.3426676-1-dmitry.baryshkov@linaro.org>
References: <20230613001004.3426676-1-dmitry.baryshkov@linaro.org>
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
 Stephen Boyd <swboyd@chromium.org>
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

Follow the DP example and define MSM_DSI_CONTROLLER_n enumeration.

Signed-off-by: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
---
 drivers/gpu/drm/msm/msm_drv.h | 8 +++++++-
 1 file changed, 7 insertions(+), 1 deletion(-)

diff --git a/drivers/gpu/drm/msm/msm_drv.h b/drivers/gpu/drm/msm/msm_drv.h
index e13a8cbd61c9..ad4fad2bcdc8 100644
--- a/drivers/gpu/drm/msm/msm_drv.h
+++ b/drivers/gpu/drm/msm/msm_drv.h
@@ -65,6 +65,12 @@ enum msm_dp_controller {
 	MSM_DP_CONTROLLER_COUNT,
 };
 
+enum msm_dsi_controller {
+	MSM_DSI_CONTROLLER_0,
+	MSM_DSI_CONTROLLER_1,
+	MSM_DSI_CONTROLLER_COUNT,
+};
+
 #define MSM_GPU_MAX_RINGS 4
 #define MAX_H_TILES_PER_DISPLAY 2
 
@@ -117,7 +123,7 @@ struct msm_drm_private {
 	struct hdmi *hdmi;
 
 	/* DSI is shared by mdp4 and mdp5 */
-	struct msm_dsi *dsi[2];
+	struct msm_dsi *dsi[MSM_DSI_CONTROLLER_COUNT];
 
 	struct msm_dp *dp[MSM_DP_CONTROLLER_COUNT];
 
-- 
2.39.2

