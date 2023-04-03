Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 2033A6D4072
	for <lists+dri-devel@lfdr.de>; Mon,  3 Apr 2023 11:23:57 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 757E210E45F;
	Mon,  3 Apr 2023 09:23:27 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-lf1-x12e.google.com (mail-lf1-x12e.google.com
 [IPv6:2a00:1450:4864:20::12e])
 by gabe.freedesktop.org (Postfix) with ESMTPS id C0B2610E3E4
 for <dri-devel@lists.freedesktop.org>; Mon,  3 Apr 2023 09:23:19 +0000 (UTC)
Received: by mail-lf1-x12e.google.com with SMTP id y20so37217646lfj.2
 for <dri-devel@lists.freedesktop.org>; Mon, 03 Apr 2023 02:23:19 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=linaro.org; s=google; t=1680513799;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:from:to:cc:subject:date
 :message-id:reply-to;
 bh=En6Mc/WtUVj/NeVz0q33ivE5D8wBC5ClMkHoJkmE8sE=;
 b=xxIadwXy8Qpim3gSBa9WbUxIb/SwytWqU35+GbMLuFoFV4Ik9GtWxOowZeuiojuQtS
 vrKzb5aYPB92+OQQFHAooqiPmYmqO/Bn6no4vQ/KFUtafDJMb1MTiBfkp3ge5+mjVmjj
 sM+rtb/8PLE/JBvjuQE2F4aqR+oq3ernj6oPPL1UTmaKDyS7p1JJcCuy98fBW+7blp86
 VlZJk1oVPL7GK6yB5QivkQiEhSHHkO36OmimxPhxzc6BVyAihjSPNTlEYdGSoUT/GIiv
 w07DaR2mQwDfnGPk+As4KfJHlbvuYoLGHMNQ4G8GMcaHajSpGLH49yGdQL5fUSzSrieX
 hOfA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112; t=1680513799;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=En6Mc/WtUVj/NeVz0q33ivE5D8wBC5ClMkHoJkmE8sE=;
 b=5F9NKgwdLZBxcGzgvkRIADKyj7BMUN3xQA2ei4YePSKY033vqWvhVdeEzRUYHg9vvC
 YwLZTlAQVVPZTiUpYWM/Ctw1ofo911J0B3l957CrSRcx0jAtlfUu+5VbnMUJEM2Ty7Zk
 2EJYlWI+Hh/0bz8fXZExRJNAz5OtpvuyVfDIJ23Btl5z7CL2As5OdeN/dEc9m133fd01
 RM2v1y3l8xjOQYTlr6d9XOSRsImCNxHoEjRRhmpZxeJtDjaG/W4Tzz9GBLJHm0rYEnkZ
 KcvDwbhnBFLwsFGMWx9XD17ebKw0AdadDtXgGhDuNQ72xVovMCZNtixvXsp7I/dnXltF
 8y1w==
X-Gm-Message-State: AAQBX9cpUaGf0dfrFB4otyjlQs3/v6oQSsCdkKlzI/T1OzrT6g3V2YoD
 aMfP6/K08k7phsrMm0LBMeQ+hg==
X-Google-Smtp-Source: AKy350bh1DMTYHIW24EOAffyDl+HqlTHsQfDhKUzlyB/No7z4e+4mjzYojdImoxVJZG8uMujyJ+0Mg==
X-Received: by 2002:ac2:59c6:0:b0:4e9:5f90:748 with SMTP id
 x6-20020ac259c6000000b004e95f900748mr10309972lfn.9.1680513799354; 
 Mon, 03 Apr 2023 02:23:19 -0700 (PDT)
Received: from eriador.lan (dzccz6yyyyyyyyyyybcwt-3.rev.dnainternet.fi.
 [2001:14ba:a085:4d00::8a5]) by smtp.gmail.com with ESMTPSA id
 w5-20020ac25985000000b004e844bb6939sm1680666lfn.2.2023.04.03.02.23.18
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Mon, 03 Apr 2023 02:23:19 -0700 (PDT)
From: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
To: David Airlie <airlied@gmail.com>, Daniel Vetter <daniel@ffwll.ch>,
 Jani Nikula <jani.nikula@linux.intel.com>,
 Suraj Kandpal <suraj.kandpal@intel.com>,
 Joonas Lahtinen <joonas.lahtinen@linux.intel.com>,
 Rodrigo Vivi <rodrigo.vivi@intel.com>,
 Tvrtko Ursulin <tvrtko.ursulin@linux.intel.com>,
 Rob Clark <robdclark@gmail.com>, Abhinav Kumar <quic_abhinavk@quicinc.com>,
 Sean Paul <sean@poorly.run>, Marijn Suijten <marijn.suijten@somainline.org>
Subject: [PATCH v4 07/12] drm/display/dsc: include the rest of pre-SCR
 parameters
Date: Mon,  3 Apr 2023 12:23:08 +0300
Message-Id: <20230403092313.235320-8-dmitry.baryshkov@linaro.org>
X-Mailer: git-send-email 2.39.2
In-Reply-To: <20230403092313.235320-1-dmitry.baryshkov@linaro.org>
References: <20230403092313.235320-1-dmitry.baryshkov@linaro.org>
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
Cc: linux-arm-msm@vger.kernel.org, intel-gfx@lists.freedesktop.org,
 freedreno@lists.freedesktop.org, dri-devel@lists.freedesktop.org
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

DSC model contains pre-SCR RC parameters for other bpp/bpc combinations,
include them here for completeness.

Signed-off-by: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
---
 drivers/gpu/drm/display/drm_dsc_helper.c | 72 ++++++++++++++++++++++++
 1 file changed, 72 insertions(+)

diff --git a/drivers/gpu/drm/display/drm_dsc_helper.c b/drivers/gpu/drm/display/drm_dsc_helper.c
index 35b39f3109c4..aec6f8c201af 100644
--- a/drivers/gpu/drm/display/drm_dsc_helper.c
+++ b/drivers/gpu/drm/display/drm_dsc_helper.c
@@ -325,6 +325,16 @@ struct rc_parameters_data {
 #define DSC_BPP(bpp)	((bpp) << 4)
 
 static const struct rc_parameters_data rc_parameters_pre_scr[] = {
+	{
+		.bpp = DSC_BPP(6), .bpc = 8,
+		{ 683, 15, 6144, 3, 13, 11, 11, {
+			{ 0, 2, 0 }, { 1, 4, -2 }, { 3, 6, -2 }, { 4, 6, -4 },
+			{ 5, 7, -6 }, { 5, 7, -6 }, { 6, 7, -6 }, { 6, 8, -8 },
+			{ 7, 9, -8 }, { 8, 10, -10 }, { 9, 11, -10 }, { 10, 12, -12 },
+			{ 10, 13, -12 }, { 12, 14, -12 }, { 15, 15, -12 }
+			}
+		}
+	},
 	{
 		.bpp = DSC_BPP(8), .bpc = 8,
 		{ 512, 12, 6144, 3, 12, 11, 11, {
@@ -360,6 +370,37 @@ static const struct rc_parameters_data rc_parameters_pre_scr[] = {
 			}
 		}
 	},
+	{
+		.bpp = DSC_BPP(10), .bpc = 8,
+		{ 410, 12, 5632, 3, 12, 11, 11, {
+			{ 0, 3, 2 }, { 0, 4, 0 }, { 1, 5, 0 }, { 2, 6, -2 },
+			{ 3, 7, -4 }, { 3, 7, -6 }, { 3, 7, -8 }, { 3, 8, -8 },
+			{ 3, 9, -8 }, { 3, 9, -10 }, { 5, 10, -10 }, { 5, 11, -10 },
+			{ 5, 12, -12 }, { 7, 13, -12 }, { 13, 15, -12 }
+			}
+		}
+	},
+	{
+		.bpp = DSC_BPP(10), .bpc = 10,
+		{ 410, 12, 5632, 7, 16, 15, 15, {
+			{ 0, 7, 2 }, { 4, 8, 0 }, { 5, 9, 0 }, { 6, 10, -2 },
+			{ 7, 11, -4 }, { 7, 11, -6 }, { 7, 11, -8 }, { 7, 12, -8 },
+			{ 7, 13, -8 }, { 7, 13, -10 }, { 9, 14, -10 }, { 9, 15, -10 },
+			{ 9, 16, -12 }, { 11, 17, -12 }, { 17, 19, -12 }
+			}
+		}
+	},
+	{
+		.bpp = DSC_BPP(10), .bpc = 12,
+		{ 410, 12, 5632, 11, 20, 19, 19, {
+			{ 0, 11, 2 }, { 4, 12, 0 }, { 9, 13, 0 }, { 10, 14, -2 },
+			{ 11, 15, -4 }, { 11, 15, -6 }, { 11, 15, -8 }, { 11, 16, -8 },
+			{ 11, 17, -8 }, { 11, 17, -10 }, { 13, 18, -10 },
+			{ 13, 19, -10 }, { 13, 20, -12 }, { 15, 21, -12 },
+			{ 21, 23, -12 }
+			}
+		}
+	},
 	{
 		.bpp = DSC_BPP(12), .bpc = 8,
 		{ 341, 15, 2048, 3, 12, 11, 11, {
@@ -391,6 +432,37 @@ static const struct rc_parameters_data rc_parameters_pre_scr[] = {
 			}
 		}
 	},
+	{
+		.bpp = DSC_BPP(15), .bpc = 8,
+		{ 273, 15, 2048, 3, 12, 11, 11, {
+			{ 0, 0, 10 }, { 0, 1, 8 }, { 0, 1, 6 }, { 0, 2, 4 },
+			{ 1, 2, 2 }, { 1, 3, 0 }, { 1, 4, -2 }, { 2, 4, -4 },
+			{ 3, 4, -6 }, { 3, 5, -8 }, { 4, 6, -10 }, { 5, 7, -10 },
+			{ 5, 8, -12 }, { 7, 13, -12 }, { 13, 15, -12 }
+			}
+		}
+	},
+	{
+		.bpp = DSC_BPP(15), .bpc = 10,
+		{ 273, 15, 2048, 7, 16, 15, 15, {
+			{ 0, 2, 10 }, { 2, 5, 8 }, { 3, 5, 6 }, { 4, 6, 4 },
+			{ 5, 6, 2 }, { 5, 7, 0 }, { 5, 8, -2 }, { 6, 8, -4 },
+			{ 7, 8, -6 }, { 7, 9, -8 }, { 8, 10, -10 }, { 9, 11, -10 },
+			{ 9, 12, -12 }, { 11, 17, -12 }, { 17, 19, -12 }
+			}
+		}
+	},
+	{
+		.bpp = DSC_BPP(15), .bpc = 12,
+		{ 273, 15, 2048, 11, 20, 19, 19, {
+			{ 0, 4, 10 }, { 2, 7, 8 }, { 4, 9, 6 }, { 6, 11, 4 },
+			{ 9, 11, 2 }, { 9, 11, 0 }, { 9, 12, -2 }, { 10, 12, -4 },
+			{ 11, 12, -6 }, { 11, 13, -8 }, { 12, 14, -10 },
+			{ 13, 15, -10 }, { 13, 16, -12 }, { 15, 21, -12 },
+			{ 21, 23, -12 }
+			}
+		}
+	},
 	{ /* sentinel */ }
 };
 
-- 
2.39.2

