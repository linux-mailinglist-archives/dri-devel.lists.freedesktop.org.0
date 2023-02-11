Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 5E2C66934CE
	for <lists+dri-devel@lfdr.de>; Sun, 12 Feb 2023 00:13:36 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id CF04510E3C7;
	Sat, 11 Feb 2023 23:13:18 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-ej1-x635.google.com (mail-ej1-x635.google.com
 [IPv6:2a00:1450:4864:20::635])
 by gabe.freedesktop.org (Postfix) with ESMTPS id D641D10E3C1
 for <dri-devel@lists.freedesktop.org>; Sat, 11 Feb 2023 23:13:11 +0000 (UTC)
Received: by mail-ej1-x635.google.com with SMTP id c26so19166105ejz.10
 for <dri-devel@lists.freedesktop.org>; Sat, 11 Feb 2023 15:13:11 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:from:to:cc:subject:date
 :message-id:reply-to;
 bh=Zl0aiWsQSI/9XYleu12nXn3J/+ngujBsZWghZ4PcuRs=;
 b=D+huJ1H76IzB6OjVpwQ1e1RzgbU3fZXAggDWBMZMo+X1qVbx2i3rxXlJj7tDam2wcS
 OySi6qD0tZcmPzo0I9VaYKvW6ARd07a9zR0E4B06pnlILFx73pQDf8o8t6gr786wP+au
 phWNATOXGnIq62VpryCR5fEWMeTz1XKSrVkJw2BPQudSa9H1zAKVX7+MakS+oJ8M3Ejh
 Mh0eUDjiId+YGs7Oy0E1cbghc41/AszsP4GbEHc3had1DJRIguQit54TWkXaopoAXMIW
 OsjApI+10UNT64a36Ro22GG95JHG0yzBiamp0HCPlQVukq+orNOnEscZPr/42qkkkWO+
 075w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=Zl0aiWsQSI/9XYleu12nXn3J/+ngujBsZWghZ4PcuRs=;
 b=v0FkerzFolbsoyl7jynWblQTXoOLNaBtNvL5rvoNSRZYPoky22cvSFHyZWOEnBBlou
 h4WHkMIoMFqrDQoGMg04PvW/SSGxVC5EyeH/URYk6T+ylO0spDzMg3R7rv21O8lIaCES
 dDWnqEQSCkNaYMqty86lXV5vOA2294Wr7nUZeL5kUe7Hp26ND5wI/jzB+Snwj6c60QgE
 RKbLvExSr5FQku33qJFpHuqkBUdtHtnwiB9FJLssGJ+ACxXAM91bVVGwDgjpLsuNJTW3
 KfVXVb4hmSFrWURtTtgXKAArK0pf2yNqWo7c3LCzQ6EHKiv/6uYJQlsmg+7IIIHDct/F
 jkiw==
X-Gm-Message-State: AO0yUKV5sdY4wLe4jxh/q4yaJ1L3Q2r6tZyU6TEDB41HD3jF6522X8wH
 ZJuF8pp3aP2riW+uvSIdt2sn5A==
X-Google-Smtp-Source: AK7set+SXa1h1i6GHYPG+9zX1m4DuqQ5+cgFObFmpCdmjGqF3w/mPQtNyHkKpHGdzhGyVw/BQdHqUg==
X-Received: by 2002:a17:906:da19:b0:884:9f42:1ec8 with SMTP id
 fi25-20020a170906da1900b008849f421ec8mr17699572ejb.70.1676157191513; 
 Sat, 11 Feb 2023 15:13:11 -0800 (PST)
Received: from eriador.lan (dzccz6yyyyyyyyyyybcwt-3.rev.dnainternet.fi.
 [2001:14ba:a085:4d00::8a5]) by smtp.gmail.com with ESMTPSA id
 k20-20020a1709061c1400b00871390a3b74sm4517149ejg.177.2023.02.11.15.13.10
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Sat, 11 Feb 2023 15:13:11 -0800 (PST)
From: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
To: Rob Clark <robdclark@gmail.com>, Sean Paul <sean@poorly.run>,
 Abhinav Kumar <quic_abhinavk@quicinc.com>
Subject: [PATCH v2 08/50] drm/msm/dpu: correct sm8450 scaler
Date: Sun, 12 Feb 2023 01:12:17 +0200
Message-Id: <20230211231259.1308718-9-dmitry.baryshkov@linaro.org>
X-Mailer: git-send-email 2.39.1
In-Reply-To: <20230211231259.1308718-1-dmitry.baryshkov@linaro.org>
References: <20230211231259.1308718-1-dmitry.baryshkov@linaro.org>
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

QSEED4 is a newer variant of QSEED3LITE, which should be used on
sm8450. Fix the used feature masks.

Fixes: 100d7ef6995d ("drm/msm/dpu: add support for SM8450")
Signed-off-by: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
---
 drivers/gpu/drm/msm/disp/dpu1/dpu_hw_catalog.c | 8 ++++----
 1 file changed, 4 insertions(+), 4 deletions(-)

diff --git a/drivers/gpu/drm/msm/disp/dpu1/dpu_hw_catalog.c b/drivers/gpu/drm/msm/disp/dpu1/dpu_hw_catalog.c
index 83836cac69e6..4f6555c04256 100644
--- a/drivers/gpu/drm/msm/disp/dpu1/dpu_hw_catalog.c
+++ b/drivers/gpu/drm/msm/disp/dpu1/dpu_hw_catalog.c
@@ -1273,13 +1273,13 @@ static const struct dpu_sspp_cfg sm8250_sspp[] = {
 };
 
 static const struct dpu_sspp_sub_blks sm8450_vig_sblk_0 =
-				_VIG_SBLK("0", 5, DPU_SSPP_SCALER_QSEED3LITE);
+				_VIG_SBLK("0", 5, DPU_SSPP_SCALER_QSEED4);
 static const struct dpu_sspp_sub_blks sm8450_vig_sblk_1 =
-				_VIG_SBLK("1", 6, DPU_SSPP_SCALER_QSEED3LITE);
+				_VIG_SBLK("1", 6, DPU_SSPP_SCALER_QSEED4);
 static const struct dpu_sspp_sub_blks sm8450_vig_sblk_2 =
-				_VIG_SBLK("2", 7, DPU_SSPP_SCALER_QSEED3LITE);
+				_VIG_SBLK("2", 7, DPU_SSPP_SCALER_QSEED4);
 static const struct dpu_sspp_sub_blks sm8450_vig_sblk_3 =
-				_VIG_SBLK("3", 8, DPU_SSPP_SCALER_QSEED3LITE);
+				_VIG_SBLK("3", 8, DPU_SSPP_SCALER_QSEED4);
 
 static const struct dpu_sspp_cfg sm8450_sspp[] = {
 	SSPP_BLK("sspp_0", SSPP_VIG0, 0x4000, VIG_SC7180_MASK,
-- 
2.39.1

