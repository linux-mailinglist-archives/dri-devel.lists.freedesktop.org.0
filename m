Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 31A4E706537
	for <lists+dri-devel@lfdr.de>; Wed, 17 May 2023 12:28:54 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id CF4AB10E3E5;
	Wed, 17 May 2023 10:28:27 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-lj1-x234.google.com (mail-lj1-x234.google.com
 [IPv6:2a00:1450:4864:20::234])
 by gabe.freedesktop.org (Postfix) with ESMTPS id DE58610E3FA
 for <dri-devel@lists.freedesktop.org>; Wed, 17 May 2023 10:28:21 +0000 (UTC)
Received: by mail-lj1-x234.google.com with SMTP id
 38308e7fff4ca-2ac836f4447so4866781fa.2
 for <dri-devel@lists.freedesktop.org>; Wed, 17 May 2023 03:28:21 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=linaro.org; s=google; t=1684319300; x=1686911300;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:from:to:cc:subject:date
 :message-id:reply-to;
 bh=ces8Cbr0BBGL1+Pg3UIfvDXRl80sR5Mx0Kmm1laM+UI=;
 b=enkWNMwPMMzqAbG6kRwbJZEi8i+bnXnQmA124HoucahWlkGkrvAWIrE3R1rea8K79y
 TZEygngYxqx/EKKf8Czdq9FP00y/xjlwlHwIsFWQ1EMuzJli9JqlwzYooxWYZRU09Zft
 Txk/m6bMFxNwJAl4DCF4shbzZdvSkb0W6EbyWxS70/8oZwkGGMZ4p445Y1ZoaqTqK68Y
 NxzVMuMGr1du0gkzxTE43FWeaCqM+WlXrs5+a/gpDEYnnUOJ+NgiXA/JpkRp/9fxySar
 GzcTQxs8WBeiK74jGps/zFgKqVMjJEkYvEQUQiZKpYVrk0ZIts4bO886gezn6C+3v2/s
 Pplw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20221208; t=1684319300; x=1686911300;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=ces8Cbr0BBGL1+Pg3UIfvDXRl80sR5Mx0Kmm1laM+UI=;
 b=gd1Gte3JjWIYeCxMMF3XpDmqYgAOjlitKu+jyzufEMjp1JCDPyWcruM0V03v2u/Lck
 fCYtt3c823dXXN/daA2Vl7x3hh+zXd3euXAxfM2BOtvzfDPZK4HbR2oo8pMBTD5uBB40
 euzjikQtGmsOoJHUb43312zqrUQHjs+Lf4GnzJ+8qESZVnNdPeteXvAbjttTh6V8/LcG
 k51comMF6FZMZ7LCSOM7ARieyhEdirvPaNvf9PLc9Jq5Xi0kPhIhmIC90mwSaAe0iyY/
 OxFlC/gwdCihrjCtAmgEqWZwu9hg/GEBAg79TcjDlbqUQV3+WLftH2QcjTKU3FgySiVI
 1umA==
X-Gm-Message-State: AC+VfDyadgp3ANXMBFplENJFgiR5v4AvL49o4d1+H6+G2lwtF+au8XgS
 Q2Anh9PrvoysZUTcfAu05gSSh+32OTyLDijgo9s=
X-Google-Smtp-Source: ACHHUZ5pAC+bEN/0vxUlCQhgv65F1IbG7ZIqsHJdbrRWi2VloqMSgiQvgHSlG3IieQNHP7MGzxYpfA==
X-Received: by 2002:a2e:8058:0:b0:2ac:770f:8831 with SMTP id
 p24-20020a2e8058000000b002ac770f8831mr9354197ljg.40.1684319300089; 
 Wed, 17 May 2023 03:28:20 -0700 (PDT)
Received: from eriador.lan (dzdqv0yyyyyyyyyyybcwt-3.rev.dnainternet.fi.
 [2001:14ba:a0db:1f00::8a5]) by smtp.gmail.com with ESMTPSA id
 e16-20020a2e8190000000b002ab017899e8sm4495356ljg.39.2023.05.17.03.28.13
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Wed, 17 May 2023 03:28:19 -0700 (PDT)
From: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
To: David Airlie <airlied@gmail.com>, Daniel Vetter <daniel@ffwll.ch>,
 Jani Nikula <jani.nikula@linux.intel.com>,
 Suraj Kandpal <suraj.kandpal@intel.com>,
 Joonas Lahtinen <joonas.lahtinen@linux.intel.com>,
 Rodrigo Vivi <rodrigo.vivi@intel.com>,
 Tvrtko Ursulin <tvrtko.ursulin@linux.intel.com>,
 Rob Clark <robdclark@gmail.com>, Abhinav Kumar <quic_abhinavk@quicinc.com>,
 Sean Paul <sean@poorly.run>, Marijn Suijten <marijn.suijten@somainline.org>
Subject: [PATCH v7 8/8] drm/display/dsc: add YCbCr 4:2:2 and 4:2:0 RC
 parameters
Date: Wed, 17 May 2023 13:28:07 +0300
Message-Id: <20230517102807.2181589-9-dmitry.baryshkov@linaro.org>
X-Mailer: git-send-email 2.39.2
In-Reply-To: <20230517102807.2181589-1-dmitry.baryshkov@linaro.org>
References: <20230517102807.2181589-1-dmitry.baryshkov@linaro.org>
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

Include RC parameters for YCbCr 4:2:2 and 4:2:0 configurations.

Reviewed-by: Suraj Kandpal <suraj.kandpal@intel.com>
Signed-off-by: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
---
 drivers/gpu/drm/display/drm_dsc_helper.c | 450 +++++++++++++++++++++++
 include/drm/display/drm_dsc_helper.h     |   2 +
 2 files changed, 452 insertions(+)

diff --git a/drivers/gpu/drm/display/drm_dsc_helper.c b/drivers/gpu/drm/display/drm_dsc_helper.c
index f6d8a7be5967..fc187a8d8873 100644
--- a/drivers/gpu/drm/display/drm_dsc_helper.c
+++ b/drivers/gpu/drm/display/drm_dsc_helper.c
@@ -748,6 +748,450 @@ static const struct rc_parameters_data rc_parameters_1_2_444[] = {
 	{ /* sentinel */ }
 };
 
+/*
+ * Selected Rate Control Related Parameter Recommended Values for 4:2:2 from
+ * DSC v1.2, v1.2a, v1.2b
+ *
+ * Cross-checked against C Model releases: DSC_model_20161212 and 20210623
+ */
+static const struct rc_parameters_data rc_parameters_1_2_422[] = {
+	{
+		.bpp = DSC_BPP(6), .bpc = 8,
+		{ 512, 15, 6144, 3, 12, 11, 11, {
+			{ 0, 4, 2 }, { 0, 4, 0 }, { 1, 5, 0 }, { 1, 6, -2 },
+			{ 3, 7, -4 }, { 3, 7, -6 }, { 3, 7, -8 }, { 3, 8, -8 },
+			{ 3, 9, -8 }, { 3, 10, -10 }, { 5, 10, -10 }, { 5, 11, -12 },
+			{ 5, 11, -12 }, { 9, 12, -12 }, { 12, 13, -12 }
+			}
+		}
+	},
+	{
+		.bpp = DSC_BPP(6), .bpc = 10,
+		{ 512, 15, 6144, 7, 16, 15, 15, {
+			{ 0, 8, 2 }, { 4, 8, 0 }, { 5, 9, 0 }, { 5, 10, -2 },
+			{ 7, 11, -4 }, { 7, 11, -6 }, { 7, 11, -8 }, { 7, 12, -8 },
+			{ 7, 13, -8 }, { 7, 14, -10 }, { 9, 14, -10 }, { 9, 15, -12 },
+			{ 9, 15, -12 }, { 13, 16, -12 }, { 16, 17, -12 }
+			}
+		}
+	},
+	{
+		.bpp = DSC_BPP(6), .bpc = 12,
+		{ 512, 15, 6144, 11, 20, 19, 19, {
+			{ 0, 12, 2 }, { 4, 12, 0 }, { 9, 13, 0 }, { 9, 14, -2 },
+			{ 11, 15, -4 }, { 11, 15, -6 }, { 11, 15, -8 }, { 11, 16, -8 },
+			{ 11, 17, -8 }, { 11, 18, -10 }, { 13, 18, -10 },
+			{ 13, 19, -12 }, { 13, 19, -12 }, { 17, 20, -12 },
+			{ 20, 21, -12 }
+			}
+		}
+	},
+	{
+		.bpp = DSC_BPP(6), .bpc = 14,
+		{ 512, 15, 6144, 15, 24, 23, 23, {
+			{ 0, 12, 2 }, { 5, 13, 0 }, { 11, 15, 0 }, { 12, 17, -2 },
+			{ 15, 19, -4 }, { 15, 19, -6 }, { 15, 19, -8 }, { 15, 20, -8 },
+			{ 15, 21, -8 }, { 15, 22, -10 }, { 17, 22, -10 },
+			{ 17, 23, -12 }, { 17, 23, -12 }, { 21, 24, -12 },
+			{ 24, 25, -12 }
+			}
+		}
+	},
+	{
+		.bpp = DSC_BPP(6), .bpc = 16,
+		{ 512, 15, 6144, 19, 28, 27, 27, {
+			{ 0, 12, 2 }, { 6, 14, 0 }, { 13, 17, 0 }, { 15, 20, -2 },
+			{ 19, 23, -4 }, { 19, 23, -6 }, { 19, 23, -8 }, { 19, 24, -8 },
+			{ 19, 25, -8 }, { 19, 26, -10 }, { 21, 26, -10 },
+			{ 21, 27, -12 }, { 21, 27, -12 }, { 25, 28, -12 },
+			{ 28, 29, -12 }
+			}
+		}
+	},
+	{
+		.bpp = DSC_BPP(7), .bpc = 8,
+		{ 410, 15, 5632, 3, 12, 11, 11, {
+			{ 0, 3, 2 }, { 0, 4, 0 }, { 1, 5, 0 }, { 2, 6, -2 },
+			{ 3, 7, -4 }, { 3, 7, -6 }, { 3, 7, -8 }, { 3, 8, -8 },
+			{ 3, 9, -8 }, { 3, 9, -10 }, { 5, 10, -10 }, { 5, 10, -10 },
+			{ 5, 11, -12 }, { 7, 11, -12 }, { 11, 12, -12 }
+			}
+		}
+	},
+	{
+		.bpp = DSC_BPP(7), .bpc = 10,
+		{ 410, 15, 5632, 7, 16, 15, 15, {
+			{ 0, 7, 2 }, { 4, 8, 0 }, { 5, 9, 0 }, { 6, 10, -2 },
+			{ 7, 11, -4 }, { 7, 11, -6 }, { 7, 11, -8 }, { 7, 12, -8 },
+			{ 7, 13, -8 }, { 7, 13, -10 }, { 9, 14, -10 }, { 9, 14, -10 },
+			{ 9, 15, -12 }, { 11, 15, -12 }, { 15, 16, -12 }
+			}
+		}
+	},
+	{
+		.bpp = DSC_BPP(7), .bpc = 12,
+		{ 410, 15, 5632, 11, 20, 19, 19, {
+			{ 0, 11, 2 }, { 4, 12, 0 }, { 9, 13, 0 }, { 10, 14, -2 },
+			{ 11, 15, -4 }, { 11, 15, -6 }, { 11, 15, -8 }, { 11, 16, -8 },
+			{ 11, 17, -8 }, { 11, 17, -10 }, { 13, 18, -10 },
+			{ 13, 18, -10 }, { 13, 19, -12 }, { 15, 19, -12 },
+			{ 19, 20, -12 }
+			}
+		}
+	},
+	{
+		.bpp = DSC_BPP(7), .bpc = 14,
+		{ 410, 15, 5632, 15, 24, 23, 23, {
+			{ 0, 11, 2 }, { 5, 13, 0 }, { 11, 15, 0 }, { 13, 18, -2 },
+			{ 15, 19, -4 }, { 15, 19, -6 }, { 15, 19, -8 }, { 15, 20, -8 },
+			{ 15, 21, -8 }, { 15, 21, -10 }, { 17, 22, -10 },
+			{ 17, 22, -10 }, { 17, 23, -12 }, { 19, 23, -12 },
+			{ 23, 24, -12 }
+			}
+		}
+	},
+	{
+		.bpp = DSC_BPP(7), .bpc = 16,
+		{ 410, 15, 5632, 19, 28, 27, 27, {
+			{ 0, 11, 2 }, { 6, 14, 0 }, { 13, 17, 0 }, { 16, 20, -2 },
+			{ 19, 23, -4 }, { 19, 23, -6 }, { 19, 23, -8 }, { 19, 24, -8 },
+			{ 19, 25, -8 }, { 19, 25, -10 }, { 21, 26, -10 },
+			{ 21, 26, -10 }, { 21, 27, -12 }, { 23, 27, -12 },
+			{ 27, 28, -12 }
+			}
+		}
+	},
+	{
+		.bpp = DSC_BPP(8), .bpc = 8,
+		{ 341, 15, 2048, 3, 12, 11, 11, {
+			{ 0, 2, 2 }, { 0, 4, 0 }, { 1, 5, 0 }, { 1, 6, -2 },
+			{ 3, 7, -4 }, { 3, 7, -6 }, { 3, 7, -8 }, { 3, 8, -8 },
+			{ 3, 8, -8 }, { 3, 9, -10 }, { 5, 9, -10 }, { 5, 9, -12 },
+			{ 5, 9, -12 }, { 7, 10, -12 }, { 10, 11, -12 }
+			}
+		}
+	},
+	{
+		.bpp = DSC_BPP(8), .bpc = 10,
+		{ 341, 15, 2048, 7, 16, 15, 15, {
+			{ 0, 2, 2 }, { 2, 5, 0 }, { 3, 7, 0 }, { 4, 8, -2 },
+			{ 6, 9, -4 }, { 7, 10, -6 }, { 7, 11, -8 }, { 7, 12, -8 },
+			{ 7, 12, -8 }, { 7, 13, -10 }, { 9, 13, -10 }, { 9, 13, -12 },
+			{ 9, 13, -12 }, { 11, 14, -12 }, { 14, 15, -12 }
+			}
+		}
+	},
+	{
+		.bpp = DSC_BPP(8), .bpc = 12,
+		{ 341, 15, 2048, 11, 20, 19, 19, {
+			{ 0, 6, 2 }, { 4, 9, 0 }, { 7, 11, 0 }, { 8, 12, -2 },
+			{ 10, 13, -4 }, { 11, 14, -6 }, { 11, 15, -8 }, { 11, 16, -8 },
+			{ 11, 16, -8 }, { 11, 17, -10 }, { 13, 17, -10 },
+			{ 13, 17, -12 }, { 13, 17, -12 }, { 15, 18, -12 },
+			{ 18, 19, -12 }
+			}
+		}
+	},
+	{
+		.bpp = DSC_BPP(8), .bpc = 14,
+		{ 341, 15, 2048, 15, 24, 23, 23, {
+			{ 0, 6, 2 }, { 7, 10, 0 }, { 9, 13, 0 }, { 11, 16, -2 },
+			{ 14, 17, -4 }, { 15, 18, -6 }, { 15, 19, -8 }, { 15, 20, -8 },
+			{ 15, 20, -8 }, { 15, 21, -10 }, { 17, 21, -10 },
+			{ 17, 21, -12 }, { 17, 21, -12 }, { 19, 22, -12 },
+			{ 22, 23, -12 }
+			}
+		}
+	},
+	{
+		.bpp = DSC_BPP(8), .bpc = 16,
+		{ 341, 15, 2048, 19, 28, 27, 27, {
+			{ 0, 6, 2 }, { 6, 11, 0 }, { 11, 15, 0 }, { 14, 18, -2 },
+			{ 18, 21, -4 }, { 19, 22, -6 }, { 19, 23, -8 }, { 19, 24, -8 },
+			{ 19, 24, -8 }, { 19, 25, -10 }, { 21, 25, -10 },
+			{ 21, 25, -12 }, { 21, 25, -12 }, { 23, 26, -12 },
+			{ 26, 27, -12 }
+			}
+		}
+	},
+	{
+		.bpp = DSC_BPP(10), .bpc = 8,
+		{ 273, 15, 2048, 3, 12, 11, 11, {
+			{ 0, 0, 10 }, { 0, 1, 8 }, { 0, 1, 6 }, { 0, 2, 4 },
+			{ 1, 2, 2 }, { 1, 3, 0 }, { 1, 3, -2 }, { 2, 4, -4 },
+			{ 2, 5, -6 }, { 3, 5, -8 }, { 4, 6, -10 }, { 4, 7, -10 },
+			{ 5, 7, -12 }, { 7, 8, -12 }, { 8, 9, -12 }
+			}
+		}
+	},
+	{
+		.bpp = DSC_BPP(10), .bpc = 10,
+		{ 273, 15, 2048, 7, 16, 15, 15, {
+			{ 0, 2, 10 }, { 2, 5, 8 }, { 3, 5, 6 }, { 4, 6, 4 },
+			{ 5, 6, 2 }, { 5, 7, 0 }, { 5, 7, -2 }, { 6, 8, -4 },
+			{ 6, 9, -6 }, { 7, 9, -8 }, { 8, 10, -10 }, { 8, 11, -10 },
+			{ 9, 11, -12 }, { 11, 12, -12 }, { 12, 13, -12 }
+			}
+		}
+	},
+	{
+		.bpp = DSC_BPP(10), .bpc = 12,
+		{ 273, 15, 2048, 11, 20, 19, 19, {
+			{ 0, 4, 10 }, { 2, 7, 8 }, { 4, 9, 6 }, { 6, 11, 4 },
+			{ 9, 11, 2 }, { 9, 11, 0 }, { 9, 12, -2 }, { 10, 12, -4 },
+			{ 11, 13, -6 }, { 11, 13, -8 }, { 12, 14, -10 },
+			{ 13, 15, -10 }, { 13, 15, -12 }, { 15, 16, -12 },
+			{ 16, 17, -12 }
+			}
+		}
+	},
+	{
+		.bpp = DSC_BPP(10), .bpc = 14,
+		{ 273, 15, 2048, 15, 24, 23, 23, {
+			{ 0, 4, 10 }, { 3, 8, 8 }, { 6, 11, 6 }, { 9, 14, 4 },
+			{ 13, 15, 2 }, { 13, 15, 0 }, { 13, 16, -2 }, { 14, 16, -4 },
+			{ 15, 17, -6 }, { 15, 17, -8 }, { 16, 18, -10 },
+			{ 17, 19, -10 }, { 17, 19, -12 }, { 19, 20, -12 },
+			{ 20, 21, -12 }
+			}
+		}
+	},
+	{
+		.bpp = DSC_BPP(10), .bpc = 16,
+		{ 273, 15, 2048, 19, 28, 27, 27, {
+			{ 0, 4, 10 }, { 4, 9, 8 }, { 8, 13, 6 }, { 12, 17, 4 },
+			{ 17, 19, 2 }, { 17, 20, 0 }, { 17, 20, -2 }, { 18, 20, -4 },
+			{ 19, 21, -6 }, { 19, 21, -8 }, { 20, 22, -10 },
+			{ 21, 23, -10 }, { 21, 23, -12 }, { 23, 24, -12 },
+			{ 24, 25, -12 }
+			}
+		}
+	},
+	{ /* sentinel */ }
+};
+
+/*
+ * Selected Rate Control Related Parameter Recommended Values for 4:2:2 from
+ * DSC v1.2, v1.2a, v1.2b
+ *
+ * Cross-checked against C Model releases: DSC_model_20161212 and 20210623
+ */
+static const struct rc_parameters_data rc_parameters_1_2_420[] = {
+	{
+		.bpp = DSC_BPP(4), .bpc = 8,
+		{ 512, 12, 6144, 3, 12, 11, 11, {
+			{ 0, 4, 2 }, { 0, 4, 0 }, { 1, 5, 0 }, { 1, 6, -2 },
+			{ 3, 7, -4 }, { 3, 7, -6 }, { 3, 7, -8 }, { 3, 8, -8 },
+			{ 3, 9, -8 }, { 3, 10, -10 }, { 5, 10, -10 }, { 5, 11, -12 },
+			{ 5, 11, -12 }, { 9, 12, -12 }, { 12, 13, -12 }
+			}
+		}
+	},
+	{
+		.bpp = DSC_BPP(4), .bpc = 10,
+		{ 512, 12, 6144, 7, 16, 15, 15, {
+			{ 0, 8, 2 }, { 4, 8, 0 }, { 5, 9, 0 }, { 5, 10, -2 },
+			{ 7, 11, -4 }, { 7, 11, -6 }, { 7, 11, -8 }, { 7, 12, -8 },
+			{ 7, 13, -8 }, { 7, 14, -10 }, { 9, 14, -10 }, { 9, 15, -12 },
+			{ 9, 15, -12 }, { 13, 16, -12 }, { 16, 17, -12 }
+			}
+		}
+	},
+	{
+		.bpp = DSC_BPP(4), .bpc = 12,
+		{ 512, 12, 6144, 11, 20, 19, 19, {
+			{ 0, 12, 2 }, { 4, 12, 0 }, { 9, 13, 0 }, { 9, 14, -2 },
+			{ 11, 15, -4 }, { 11, 15, -6 }, { 11, 15, -8 }, { 11, 16, -8 },
+			{ 11, 17, -8 }, { 11, 18, -10 }, { 13, 18, -10 },
+			{ 13, 19, -12 }, { 13, 19, -12 }, { 17, 20, -12 },
+			{ 20, 21, -12 }
+			}
+		}
+	},
+	{
+		.bpp = DSC_BPP(4), .bpc = 14,
+		{ 512, 12, 6144, 15, 24, 23, 23, {
+			{ 0, 12, 2 }, { 5, 13, 0 }, { 11, 15, 0 }, { 12, 17, -2 },
+			{ 15, 19, -4 }, { 15, 19, -6 }, { 15, 19, -8 }, { 15, 20, -8 },
+			{ 15, 21, -8 }, { 15, 22, -10 }, { 17, 22, -10 },
+			{ 17, 23, -12 }, { 17, 23, -12 }, { 21, 24, -12 },
+			{ 24, 25, -12 }
+			}
+		}
+	},
+	{
+		.bpp = DSC_BPP(4), .bpc = 16,
+		{ 512, 12, 6144, 19, 28, 27, 27, {
+			{ 0, 12, 2 }, { 6, 14, 0 }, { 13, 17, 0 }, { 15, 20, -2 },
+			{ 19, 23, -4 }, { 19, 23, -6 }, { 19, 23, -8 }, { 19, 24, -8 },
+			{ 19, 25, -8 }, { 19, 26, -10 }, { 21, 26, -10 },
+			{ 21, 27, -12 }, { 21, 27, -12 }, { 25, 28, -12 },
+			{ 28, 29, -12 }
+			}
+		}
+	},
+	{
+		.bpp = DSC_BPP(5), .bpc = 8,
+		{ 410, 15, 5632, 3, 12, 11, 11, {
+			{ 0, 3, 2 }, { 0, 4, 0 }, { 1, 5, 0 }, { 2, 6, -2 },
+			{ 3, 7, -4 }, { 3, 7, -6 }, { 3, 7, -8 }, { 3, 8, -8 },
+			{ 3, 9, -8 }, { 3, 9, -10 }, { 5, 10, -10 }, { 5, 10, -10 },
+			{ 5, 11, -12 }, { 7, 11, -12 }, { 11, 12, -12 }
+			}
+		}
+	},
+	{
+		.bpp = DSC_BPP(5), .bpc = 10,
+		{ 410, 15, 5632, 7, 16, 15, 15, {
+			{ 0, 7, 2 }, { 4, 8, 0 }, { 5, 9, 0 }, { 6, 10, -2 },
+			{ 7, 11, -4 }, { 7, 11, -6 }, { 7, 11, -8 }, { 7, 12, -8 },
+			{ 7, 13, -8 }, { 7, 13, -10 }, { 9, 14, -10 }, { 9, 14, -10 },
+			{ 9, 15, -12 }, { 11, 15, -12 }, { 15, 16, -12 }
+			}
+		}
+	},
+	{
+		.bpp = DSC_BPP(5), .bpc = 12,
+		{ 410, 15, 5632, 11, 20, 19, 19, {
+			{ 0, 11, 2 }, { 4, 12, 0 }, { 9, 13, 0 }, { 10, 14, -2 },
+			{ 11, 15, -4 }, { 11, 15, -6 }, { 11, 15, -8 }, { 11, 16, -8 },
+			{ 11, 17, -8 }, { 11, 17, -10 }, { 13, 18, -10 },
+			{ 13, 18, -10 }, { 13, 19, -12 }, { 15, 19, -12 },
+			{ 19, 20, -12 }
+			}
+		}
+	},
+	{
+		.bpp = DSC_BPP(5), .bpc = 14,
+		{ 410, 15, 5632, 15, 24, 23, 23, {
+			{ 0, 11, 2 }, { 5, 13, 0 }, { 11, 15, 0 }, { 13, 18, -2 },
+			{ 15, 19, -4 }, { 15, 19, -6 }, { 15, 19, -8 }, { 15, 20, -8 },
+			{ 15, 21, -8 }, { 15, 21, -10 }, { 17, 22, -10 },
+			{ 17, 22, -10 }, { 17, 23, -12 }, { 19, 23, -12 },
+			{ 23, 24, -12 }
+			}
+		}
+	},
+	{
+		.bpp = DSC_BPP(5), .bpc = 16,
+		{ 410, 15, 5632, 19, 28, 27, 27, {
+			{ 0, 11, 2 }, { 6, 14, 0 }, { 13, 17, 0 }, { 16, 20, -2 },
+			{ 19, 23, -4 }, { 19, 23, -6 }, { 19, 23, -8 }, { 19, 24, -8 },
+			{ 19, 25, -8 }, { 19, 25, -10 }, { 21, 26, -10 },
+			{ 21, 26, -10 }, { 21, 27, -12 }, { 23, 27, -12 },
+			{ 27, 28, -12 }
+			}
+		}
+	},
+	{
+		.bpp = DSC_BPP(6), .bpc = 8,
+		{ 341, 15, 2048, 3, 12, 11, 11, {
+			{ 0, 2, 2 }, { 0, 4, 0 }, { 1, 5, 0 }, { 1, 6, -2 },
+			{ 3, 7, -4 }, { 3, 7, -6 }, { 3, 7, -8 }, { 3, 8, -8 },
+			{ 3, 8, -8 }, { 3, 9, -10 }, { 5, 9, -10 }, { 5, 9, -12 },
+			{ 5, 9, -12 }, { 7, 10, -12 }, { 10, 12, -12 }
+			}
+		}
+	},
+	{
+		.bpp = DSC_BPP(6), .bpc = 10,
+		{ 341, 15, 2048, 7, 16, 15, 15, {
+			{ 0, 2, 2 }, { 2, 5, 0 }, { 3, 7, 0 }, { 4, 8, -2 },
+			{ 6, 9, -4 }, { 7, 10, -6 }, { 7, 11, -8 }, { 7, 12, -8 },
+			{ 7, 12, -8 }, { 7, 13, -10 }, { 9, 13, -10 }, { 9, 13, -12 },
+			{ 9, 13, -12 }, { 11, 14, -12 }, { 14, 15, -12 }
+			}
+		}
+	},
+	{
+		.bpp = DSC_BPP(6), .bpc = 12,
+		{ 341, 15, 2048, 11, 20, 19, 19, {
+			{ 0, 6, 2 }, { 4, 9, 0 }, { 7, 11, 0 }, { 8, 12, -2 },
+			{ 10, 13, -4 }, { 11, 14, -6 }, { 11, 15, -8 }, { 11, 16, -8 },
+			{ 11, 16, -8 }, { 11, 17, -10 }, { 13, 17, -10 },
+			{ 13, 17, -12 }, { 13, 17, -12 }, { 15, 18, -12 },
+			{ 18, 19, -12 }
+			}
+		}
+	},
+	{
+		.bpp = DSC_BPP(6), .bpc = 14,
+		{ 341, 15, 2048, 15, 24, 23, 23, {
+			{ 0, 6, 2 }, { 7, 10, 0 }, { 9, 13, 0 }, { 11, 16, -2 },
+			{ 14, 17, -4 }, { 15, 18, -6 }, { 15, 19, -8 }, { 15, 20, -8 },
+			{ 15, 20, -8 }, { 15, 21, -10 }, { 17, 21, -10 },
+			{ 17, 21, -12 }, { 17, 21, -12 }, { 19, 22, -12 },
+			{ 22, 23, -12 }
+			}
+		}
+	},
+	{
+		.bpp = DSC_BPP(6), .bpc = 16,
+		{ 341, 15, 2048, 19, 28, 27, 27, {
+			{ 0, 6, 2 }, { 6, 11, 0 }, { 11, 15, 0 }, { 14, 18, -2 },
+			{ 18, 21, -4 }, { 19, 22, -6 }, { 19, 23, -8 }, { 19, 24, -8 },
+			{ 19, 24, -8 }, { 19, 25, -10 }, { 21, 25, -10 },
+			{ 21, 25, -12 }, { 21, 25, -12 }, { 23, 26, -12 },
+			{ 26, 27, -12 }
+			}
+		}
+	},
+	{
+		.bpp = DSC_BPP(8), .bpc = 8,
+		{ 256, 15, 2048, 3, 12, 11, 11, {
+			{ 0, 0, 10 }, { 0, 1, 8 }, { 0, 1, 6 }, { 0, 2, 4 },
+			{ 1, 2, 2 }, { 1, 3, 0 }, { 1, 3, -2 }, { 2, 4, -4 },
+			{ 2, 5, -6 }, { 3, 5, -8 }, { 4, 6, -10 }, { 4, 7, -10 },
+			{ 5, 7, -12 }, { 7, 8, -12 }, { 8, 9, -12 }
+			}
+		}
+	},
+	{
+		.bpp = DSC_BPP(8), .bpc = 10,
+		{ 256, 15, 2048, 7, 16, 15, 15, {
+			{ 0, 2, 10 }, { 2, 5, 8 }, { 3, 5, 6 }, { 4, 6, 4 },
+			{ 5, 6, 2 }, { 5, 7, 0 }, { 5, 7, -2 }, { 6, 8, -4 },
+			{ 6, 9, -6 }, { 7, 9, -8 }, { 8, 10, -10 }, { 8, 11, -10 },
+			{ 9, 11, -12 }, { 11, 12, -12 }, { 12, 13, -12 }
+			}
+		}
+	},
+	{
+		.bpp = DSC_BPP(8), .bpc = 12,
+		{ 256, 15, 2048, 11, 20, 19, 19, {
+			{ 0, 4, 10 }, { 2, 7, 8 }, { 4, 9, 6 }, { 6, 11, 4 },
+			{ 9, 11, 2 }, { 9, 11, 0 }, { 9, 12, -2 }, { 10, 12, -4 },
+			{ 11, 13, -6 }, { 11, 13, -8 }, { 12, 14, -10 },
+			{ 13, 15, -10 }, { 13, 15, -12 }, { 15, 16, -12 },
+			{ 16, 17, -12 }
+			}
+		}
+	},
+	{
+		.bpp = DSC_BPP(8), .bpc = 14,
+		{ 256, 15, 2048, 15, 24, 23, 23, {
+			{ 0, 4, 10 }, { 3, 8, 8 }, { 6, 11, 6 }, { 9, 14, 4 },
+			{ 13, 15, 2 }, { 13, 15, 0 }, { 13, 16, -2 }, { 14, 16, -4 },
+			{ 15, 17, -6 }, { 15, 17, -8 }, { 16, 18, -10 },
+			{ 17, 19, -10 }, { 17, 19, -12 }, { 19, 20, -12 },
+			{ 20, 21, -12 }
+			}
+		}
+	},
+	{
+		.bpp = DSC_BPP(8), .bpc = 16,
+		{ 256, 15, 2048, 19, 28, 27, 27, {
+			{ 0, 4, 10 }, { 4, 9, 8 }, { 8, 13, 6 }, { 12, 17, 4 },
+			{ 17, 19, 2 }, { 17, 20, 0 }, { 17, 20, -2 }, { 18, 20, -4 },
+			{ 19, 21, -6 }, { 19, 21, -8 }, { 20, 22, -10 },
+			{ 21, 23, -10 }, { 21, 23, -12 }, { 23, 24, -12 },
+			{ 24, 25, -12 }
+			}
+		}
+	},
+	{ /* sentinel */ }
+};
+
 static const struct rc_parameters *get_rc_params(const struct rc_parameters_data *rc_parameters,
 						 u16 dsc_bpp,
 						 u8 bits_per_component)
@@ -790,6 +1234,12 @@ int drm_dsc_setup_rc_params(struct drm_dsc_config *vdsc_cfg, enum drm_dsc_params
 	case DRM_DSC_1_1_PRE_SCR:
 		data = rc_parameters_pre_scr;
 		break;
+	case DRM_DSC_1_2_422:
+		data = rc_parameters_1_2_422;
+		break;
+	case DRM_DSC_1_2_420:
+		data = rc_parameters_1_2_420;
+		break;
 	default:
 		return -EINVAL;
 	}
diff --git a/include/drm/display/drm_dsc_helper.h b/include/drm/display/drm_dsc_helper.h
index 66eac7276d04..fc2104415dcb 100644
--- a/include/drm/display/drm_dsc_helper.h
+++ b/include/drm/display/drm_dsc_helper.h
@@ -13,6 +13,8 @@
 enum drm_dsc_params_type {
 	DRM_DSC_1_2_444,
 	DRM_DSC_1_1_PRE_SCR, /* legacy params from DSC 1.1 */
+	DRM_DSC_1_2_422,
+	DRM_DSC_1_2_420,
 };
 
 void drm_dsc_dp_pps_header_init(struct dp_sdp_header *pps_header);
-- 
2.39.2

