Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 84018693530
	for <lists+dri-devel@lfdr.de>; Sun, 12 Feb 2023 00:14:31 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 469AA10E41B;
	Sat, 11 Feb 2023 23:13:59 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-ej1-x635.google.com (mail-ej1-x635.google.com
 [IPv6:2a00:1450:4864:20::635])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 73F1A10E3FF
 for <dri-devel@lists.freedesktop.org>; Sat, 11 Feb 2023 23:13:48 +0000 (UTC)
Received: by mail-ej1-x635.google.com with SMTP id c26so19167910ejz.10
 for <dri-devel@lists.freedesktop.org>; Sat, 11 Feb 2023 15:13:48 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:from:to:cc:subject:date
 :message-id:reply-to;
 bh=iHQQmWOhgfHuVxPNefuUhrb3kyDxId/lJ4kO/uFtf+0=;
 b=D840DiePbnHiL2RRj5f+XCcNdzN4zBVAFosHBGU0JZD7G/On3F/l11kQW2D0YDXbUB
 ysHm0MAxF5S/sAVJDNxLyZumDSRiVApYTB6XbILeO7mNhbyktoXSPHs+IVqXVzp2rujX
 kqrWMRy/sC0qw6EjWeqBKa9OtGHyY/78qzcq5xwlU/O3orEyWMiGYHq3dMbHcEc91Ey4
 YKxfAxECNeoWkaDnZzpJcq1/C9kCX5b49L3bPaoE3jWSqML4Oi/utDCk5JAyksAKjI2z
 2SXef4NIGgBVUTJN2TLOcefAzq5rMWoeBEQFfFu7w/V8yJUbwnQN31mPCrqc6u4sfCxN
 i33Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=iHQQmWOhgfHuVxPNefuUhrb3kyDxId/lJ4kO/uFtf+0=;
 b=1whY3O90wAoxLgMY3Bg+/x673DysJ1+sBuZE80ajBMKDz4pJ7hVKvOBei5SOvRC1KF
 Y10/WCApABPuXuKGbxfGconzxUIxAnWPDy6efg5KM64W6wh+quv9UawKNDnyAO0/NGog
 LHzlmirZlqsxPx+dkHFlMJj730qnsUNnFaBgBloHoTvHwvnjEMmcOCWb8uN6sqogBE+W
 rRIyX7mV87QUlIxdB0/O5bCxF9xMD2nFhJfjKd+G/WtOGIn57iZuFCf7lb45xcUUdS6n
 nKsVJdojx9XX00BiabF0PyYJ8+zWFP5Vm2NKCnRDKNEiATezJTOKIgAUJyx1UBTLVqSl
 /gZA==
X-Gm-Message-State: AO0yUKVNKwaYDkIYLmGA5kuNVXjBbE45CUpdhnPe0CqUOj5iMYBMM0wh
 iRKXj+zIMlKv4Yfxi1/u3aaYsuEAwWuIGYDC
X-Google-Smtp-Source: AK7set9QFVBfv9yUIuYShfB+fY8WNSPt8xwa1IBgCo7gX2eRbPO1lA7sl4OrFtMPBsk6OrFep+LfTg==
X-Received: by 2002:a17:906:6b1a:b0:895:58be:954 with SMTP id
 q26-20020a1709066b1a00b0089558be0954mr18894745ejr.58.1676157228100; 
 Sat, 11 Feb 2023 15:13:48 -0800 (PST)
Received: from eriador.lan (dzccz6yyyyyyyyyyybcwt-3.rev.dnainternet.fi.
 [2001:14ba:a085:4d00::8a5]) by smtp.gmail.com with ESMTPSA id
 k20-20020a1709061c1400b00871390a3b74sm4517149ejg.177.2023.02.11.15.13.46
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Sat, 11 Feb 2023 15:13:47 -0800 (PST)
From: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
To: Rob Clark <robdclark@gmail.com>, Sean Paul <sean@poorly.run>,
 Abhinav Kumar <quic_abhinavk@quicinc.com>
Subject: [PATCH v2 40/50] drm/msm/dpu: enable DSPP on sc8180x
Date: Sun, 12 Feb 2023 01:12:49 +0200
Message-Id: <20230211231259.1308718-41-dmitry.baryshkov@linaro.org>
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

Enable DSPP blocks on sc8180x platform, basing on the vendor dtsi.

Signed-off-by: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
---
 drivers/gpu/drm/msm/disp/dpu1/catalog/dpu_5_1_sc8180x.h | 2 ++
 1 file changed, 2 insertions(+)

diff --git a/drivers/gpu/drm/msm/disp/dpu1/catalog/dpu_5_1_sc8180x.h b/drivers/gpu/drm/msm/disp/dpu1/catalog/dpu_5_1_sc8180x.h
index c51e1bba1533..457733a6986e 100644
--- a/drivers/gpu/drm/msm/disp/dpu1/catalog/dpu_5_1_sc8180x.h
+++ b/drivers/gpu/drm/msm/disp/dpu1/catalog/dpu_5_1_sc8180x.h
@@ -91,6 +91,8 @@ static const struct dpu_mdss_cfg sc8180x_dpu_cfg = {
 	.sspp = sm8150_sspp,
 	.mixer_count = ARRAY_SIZE(sm8150_lm),
 	.mixer = sm8150_lm,
+	.dspp_count = ARRAY_SIZE(sm8150_dspp),
+	.dspp = sm8150_dspp,
 	.pingpong_count = ARRAY_SIZE(sm8150_pp),
 	.pingpong = sm8150_pp,
 	.merge_3d_count = ARRAY_SIZE(sm8150_merge_3d),
-- 
2.39.1

