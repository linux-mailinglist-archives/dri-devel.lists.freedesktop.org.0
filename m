Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 6BD576A584C
	for <lists+dri-devel@lfdr.de>; Tue, 28 Feb 2023 12:34:21 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 343DC10E693;
	Tue, 28 Feb 2023 11:33:55 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-lf1-x12a.google.com (mail-lf1-x12a.google.com
 [IPv6:2a00:1450:4864:20::12a])
 by gabe.freedesktop.org (Postfix) with ESMTPS id BAD6A10E68F
 for <dri-devel@lists.freedesktop.org>; Tue, 28 Feb 2023 11:33:50 +0000 (UTC)
Received: by mail-lf1-x12a.google.com with SMTP id s22so12709947lfi.9
 for <dri-devel@lists.freedesktop.org>; Tue, 28 Feb 2023 03:33:50 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:from:to:cc:subject:date
 :message-id:reply-to;
 bh=0XHhb9y8jJqdNR1UeSCuBwtF33tdeExxjj7iIgVpW2Y=;
 b=xxWGddobwqSH1ih7hV/wgrZXmvTE8lXrUlo7ECrtBeRff4r6IFdgJGQXsvLLWsDaJr
 2X07rulU7W1oo81xG2hwkrnr95lHQYxbvNtRhDkh2EcDCu8fmis3f6zvjEJRgf0Ga3yz
 xQxakg8C+IFtvC+02EiUVD8qzGEI+TLyfb71TKCU6X5My+qVVXKVFX+QIW2l/U2PRXEB
 9TuBDpHzIPhyTmv1L3OWzDwoiEn4iklEwGSmcwxC2Mtm36A8AMjtv6l4ZteTgamldfC7
 eiyLu5vFkqvrR+xk+u7+3kdiYB9fzKqEza5yqG+6DemfBTE2y0TThi9DDyV03BmnKHxb
 dvfw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=0XHhb9y8jJqdNR1UeSCuBwtF33tdeExxjj7iIgVpW2Y=;
 b=e2OG9yeZTI3LyMzgrd+ofN4rbqk/g1cn2m1K/O3lxvbdS9srF0KQLwaiWBtdMg0iQW
 KEFbMg2cfJiko+ZoxuNdyGSUCTBQtqoTZLm4XjuvdBRTgV/PVb1shi6e+0baP25ULG1V
 xKrpk1MRMYaa56eg7fxKfUTa9pWrrOJ2OcQLswq4qXe91wWeFvC9OQfMx0xc61UGNybr
 d228R1GvyHlCRZvG9Zqdt9xzCg2D/luk9TlANYz0Zjz+3Tw3uPby+Uw5h6iNaEWlMyG+
 SSbQOvpCNpZ5QUDYP4EFCRkA7PSMOmPGtbSd9/a3BXjSTIVjl7LM95kfuVTQtkMgrJ3/
 Hn7A==
X-Gm-Message-State: AO0yUKUv6c/b+Sgo8ndLn1+v1lCU65MLDnq8t9ELahp8grAC6ahDQ2qZ
 waChaAtyJNiqQEwOD3T/6VSakQ==
X-Google-Smtp-Source: AK7set/ibfzkNeOXmgN8W6U3V98KwBYnBbrO23QH8uHu8lZf9oN17vNEhpXby5TrcTwB5uZknsCqDQ==
X-Received: by 2002:ac2:563c:0:b0:4cc:b784:c47e with SMTP id
 b28-20020ac2563c000000b004ccb784c47emr527371lff.62.1677584030164; 
 Tue, 28 Feb 2023 03:33:50 -0800 (PST)
Received: from eriador.lan (dzccz6yyyyyyyyyyybcwt-3.rev.dnainternet.fi.
 [2001:14ba:a085:4d00::8a5]) by smtp.gmail.com with ESMTPSA id
 h20-20020ac25974000000b004dd0bbc89a1sm1288472lfp.244.2023.02.28.03.33.49
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Tue, 28 Feb 2023 03:33:49 -0800 (PST)
From: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
To: David Airlie <airlied@gmail.com>, Daniel Vetter <daniel@ffwll.ch>,
 Jani Nikula <jani.nikula@linux.intel.com>,
 Joonas Lahtinen <joonas.lahtinen@linux.intel.com>,
 Rodrigo Vivi <rodrigo.vivi@intel.com>,
 Tvrtko Ursulin <tvrtko.ursulin@linux.intel.com>,
 Rob Clark <robdclark@gmail.com>, Abhinav Kumar <quic_abhinavk@quicinc.com>,
 Sean Paul <sean@poorly.run>, Marijn Suijten <marijn.suijten@somainline.org>
Subject: [PATCH 08/10] drm/display/dsc: add YCbCr 4:2:2 and 4:2:0 RC parameters
Date: Tue, 28 Feb 2023 13:33:40 +0200
Message-Id: <20230228113342.2051425-9-dmitry.baryshkov@linaro.org>
X-Mailer: git-send-email 2.39.2
In-Reply-To: <20230228113342.2051425-1-dmitry.baryshkov@linaro.org>
References: <20230228113342.2051425-1-dmitry.baryshkov@linaro.org>
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

Signed-off-by: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
---
 drivers/gpu/drm/display/drm_dsc_helper.c | 438 +++++++++++++++++++++++
 include/drm/display/drm_dsc_helper.h     |   2 +
 2 files changed, 440 insertions(+)

diff --git a/drivers/gpu/drm/display/drm_dsc_helper.c b/drivers/gpu/drm/display/drm_dsc_helper.c
index 1612536014ea..d11ee8f1efa7 100644
--- a/drivers/gpu/drm/display/drm_dsc_helper.c
+++ b/drivers/gpu/drm/display/drm_dsc_helper.c
@@ -742,6 +742,438 @@ static const struct rc_parameters_data rc_parameters_1_2_444[] = {
 { /* sentinel */ }
 };
 
+static const struct rc_parameters_data rc_parameters_1_2_422[] = {
+{ DSC_BPP(6), 8,
+	/* 12BPP/8BPC */
+	{ 512, 15, 6144, 3, 12, 11, 11, {
+		{ 0, 4, 2 }, { 0, 4, 0 }, { 1, 5, 0 }, { 1, 6, -2 },
+		{ 3, 7, -4 }, { 3, 7, -6 }, { 3, 7, -8 }, { 3, 8, -8 },
+		{ 3, 9, -8 }, { 3, 10, -10 }, { 5, 10, -10 }, { 5, 11, -12 },
+		{ 5, 11, -12 }, { 9, 12, -12 }, { 12, 13, -12 }
+		}
+	}
+},
+{ DSC_BPP(6), 10,
+	/* 12BPP/10BPC */
+	{ 512, 15, 6144, 7, 16, 15, 15, {
+		{ 0, 8, 2 }, { 4, 8, 0 }, { 5, 9, 0 }, { 5, 10, -2 },
+		{ 7, 11, -4 }, { 7, 11, -6 }, { 7, 11, -8 }, { 7, 12, -8 },
+		{ 7, 13, -8 }, { 7, 14, -10 }, { 9, 14, -10 }, { 9, 15, -12 },
+		{ 9, 15, -12 }, { 13, 16, -12 }, { 16, 17, -12 }
+		}
+	}
+},
+{ DSC_BPP(6), 12,
+	/* 12BPP/12BPC */
+	{ 512, 15, 6144, 11, 20, 19, 19, {
+		{ 0, 12, 2 }, { 4, 12, 0 }, { 9, 13, 0 }, { 9, 14, -2 },
+		{ 11, 15, -4 }, { 11, 15, -6 }, { 11, 15, -8 }, { 11, 16, -8 },
+		{ 11, 17, -8 }, { 11, 18, -10 }, { 13, 18, -10 },
+		{ 13, 19, -12 }, { 13, 19, -12 }, { 17, 20, -12 },
+		{ 20, 21, -12 }
+		}
+	}
+},
+{ DSC_BPP(6), 14,
+	/* 12BPP/14BPC */
+	{ 512, 15, 6144, 15, 24, 23, 23, {
+		{ 0, 12, 2 }, { 5, 13, 0 }, { 11, 15, 0 }, { 12, 17, -2 },
+		{ 15, 19, -4 }, { 15, 19, -6 }, { 15, 19, -8 }, { 15, 20, -8 },
+		{ 15, 21, -8 }, { 15, 22, -10 }, { 17, 22, -10 },
+		{ 17, 23, -12 }, { 17, 23, -12 }, { 21, 24, -12 },
+		{ 24, 25, -12 }
+		}
+	}
+},
+{ DSC_BPP(6), 16,
+	/* 12BPP/16BPC */
+	{ 512, 15, 6144, 19, 28, 27, 27, {
+		{ 0, 12, 2 }, { 6, 14, 0 }, { 13, 17, 0 }, { 15, 20, -2 },
+		{ 19, 23, -4 }, { 19, 23, -6 }, { 19, 23, -8 }, { 19, 24, -8 },
+		{ 19, 25, -8 }, { 19, 26, -10 }, { 21, 26, -10 },
+		{ 21, 27, -12 }, { 21, 27, -12 }, { 25, 28, -12 },
+		{ 28, 29, -12 }
+		}
+	}
+},
+{ DSC_BPP(7), 8,
+	/* 14BPP/8BPC */
+	{ 410, 15, 5632, 3, 12, 11, 11, {
+		{ 0, 3, 2 }, { 0, 4, 0 }, { 1, 5, 0 }, { 2, 6, -2 },
+		{ 3, 7, -4 }, { 3, 7, -6 }, { 3, 7, -8 }, { 3, 8, -8 },
+		{ 3, 9, -8 }, { 3, 9, -10 }, { 5, 10, -10 }, { 5, 10, -10 },
+		{ 5, 11, -12 }, { 7, 11, -12 }, { 11, 12, -12 }
+		}
+	}
+},
+{ DSC_BPP(7), 10,
+	/* 14BPP/10BPC */
+	{ 410, 15, 5632, 7, 16, 15, 15, {
+		{ 0, 7, 2 }, { 4, 8, 0 }, { 5, 9, 0 }, { 6, 10, -2 },
+		{ 7, 11, -4 }, { 7, 11, -6 }, { 7, 11, -8 }, { 7, 12, -8 },
+		{ 7, 13, -8 }, { 7, 13, -10 }, { 9, 14, -10 }, { 9, 14, -10 },
+		{ 9, 15, -12 }, { 11, 15, -12 }, { 15, 16, -12 }
+		}
+	}
+},
+{ DSC_BPP(7), 12,
+	/* 14BPP/12BPC */
+	{ 410, 15, 5632, 11, 20, 19, 19, {
+		{ 0, 11, 2 }, { 4, 12, 0 }, { 9, 13, 0 }, { 10, 14, -2 },
+		{ 11, 15, -4 }, { 11, 15, -6 }, { 11, 15, -8 }, { 11, 16, -8 },
+		{ 11, 17, -8 }, { 11, 17, -10 }, { 13, 18, -10 },
+		{ 13, 18, -10 }, { 13, 19, -12 }, { 15, 19, -12 },
+		{ 19, 20, -12 }
+		}
+	}
+},
+{ DSC_BPP(7), 14,
+	/* 14BPP/14BPC */
+	{ 410, 15, 5632, 15, 24, 23, 23, {
+		{ 0, 11, 2 }, { 5, 13, 0 }, { 11, 15, 0 }, { 13, 18, -2 },
+		{ 15, 19, -4 }, { 15, 19, -6 }, { 15, 19, -8 }, { 15, 20, -8 },
+		{ 15, 21, -8 }, { 15, 21, -10 }, { 17, 22, -10 },
+		{ 17, 22, -10 }, { 17, 23, -12 }, { 19, 23, -12 },
+		{ 23, 24, -12 }
+		}
+	}
+},
+{ DSC_BPP(7), 16,
+	/* 14BPP/16BPC */
+	{ 410, 15, 5632, 19, 28, 27, 27, {
+		{ 0, 11, 2 }, { 6, 14, 0 }, { 13, 17, 0 }, { 16, 20, -2 },
+		{ 19, 23, -4 }, { 19, 23, -6 }, { 19, 23, -8 }, { 19, 24, -8 },
+		{ 19, 25, -8 }, { 19, 25, -10 }, { 21, 26, -10 },
+		{ 21, 26, -10 }, { 21, 27, -12 }, { 23, 27, -12 },
+		{ 27, 28, -12 }
+		}
+	}
+},
+{ DSC_BPP(8), 8,
+	/* 16BPP/8BPC */
+	{ 341, 15, 2048, 3, 12, 11, 11, {
+		{ 0, 2, 2 }, { 0, 4, 0 }, { 1, 5, 0 }, { 1, 6, -2 },
+		{ 3, 7, -4 }, { 3, 7, -6 }, { 3, 7, -8 }, { 3, 8, -8 },
+		{ 3, 8, -8 }, { 3, 9, -10 }, { 5, 9, -10 }, { 5, 9, -12 },
+		{ 5, 9, -12 }, { 7, 10, -12 }, { 10, 11, -12 }
+		}
+	}
+},
+{ DSC_BPP(8), 10,
+	/* 16BPP/10BPC */
+	{ 341, 15, 2048, 7, 16, 15, 15, {
+		{ 0, 2, 2 }, { 2, 5, 0 }, { 3, 7, 0 }, { 4, 8, -2 },
+		{ 6, 9, -4 }, { 7, 10, -6 }, { 7, 11, -8 }, { 7, 12, -8 },
+		{ 7, 12, -8 }, { 7, 13, -10 }, { 9, 13, -10 }, { 9, 13, -12 },
+		{ 9, 13, -12 }, { 11, 14, -12 }, { 14, 15, -12 }
+		}
+	}
+},
+{ DSC_BPP(8), 12,
+	/* 16BPP/12BPC */
+	{ 341, 15, 2048, 11, 20, 19, 19, {
+		{ 0, 6, 2 }, { 4, 9, 0 }, { 7, 11, 0 }, { 8, 12, -2 },
+		{ 10, 13, -4 }, { 11, 14, -6 }, { 11, 15, -8 }, { 11, 16, -8 },
+		{ 11, 16, -8 }, { 11, 17, -10 }, { 13, 17, -10 },
+		{ 13, 17, -12 }, { 13, 17, -12 }, { 15, 18, -12 },
+		{ 18, 19, -12 }
+		}
+	}
+},
+{ DSC_BPP(8), 14,
+	/* 16BPP/14BPC */
+	{ 341, 15, 2048, 15, 24, 23, 23, {
+		{ 0, 6, 2 }, { 7, 10, 0 }, { 9, 13, 0 }, { 11, 16, -2 },
+		{ 14, 17, -4 }, { 15, 18, -6 }, { 15, 19, -8 }, { 15, 20, -8 },
+		{ 15, 20, -8 }, { 15, 21, -10 }, { 17, 21, -10 },
+		{ 17, 21, -12 }, { 17, 21, -12 }, { 19, 22, -12 },
+		{ 22, 23, -12 }
+		}
+	}
+},
+{ DSC_BPP(8), 16,
+	/* 16BPP/16BPC */
+	{ 341, 15, 2048, 19, 28, 27, 27, {
+		{ 0, 6, 2 }, { 6, 11, 0 }, { 11, 15, 0 }, { 14, 18, -2 },
+		{ 18, 21, -4 }, { 19, 22, -6 }, { 19, 23, -8 }, { 19, 24, -8 },
+		{ 19, 24, -8 }, { 19, 25, -10 }, { 21, 25, -10 },
+		{ 21, 25, -12 }, { 21, 25, -12 }, { 23, 26, -12 },
+		{ 26, 27, -12 }
+		}
+	}
+},
+{ DSC_BPP(10), 8,
+	/* 20BPP/8BPC */
+	{ 273, 15, 2048, 3, 12, 11, 11, {
+		{ 0, 0, 10 }, { 0, 1, 8 }, { 0, 1, 6 }, { 0, 2, 4 },
+		{ 1, 2, 2 }, { 1, 3, 0 }, { 1, 3, -2 }, { 2, 4, -4 },
+		{ 2, 5, -6 }, { 3, 5, -8 }, { 4, 6, -10 }, { 4, 7, -10 },
+		{ 5, 7, -12 }, { 7, 8, -12 }, { 8, 9, -12 }
+		}
+	}
+},
+{ DSC_BPP(10), 10,
+	/* 20BPP/10BPC */
+	{ 273, 15, 2048, 7, 16, 15, 15, {
+		{ 0, 2, 10 }, { 2, 5, 8 }, { 3, 5, 6 }, { 4, 6, 4 },
+		{ 5, 6, 2 }, { 5, 7, 0 }, { 5, 7, -2 }, { 6, 8, -4 },
+		{ 6, 9, -6 }, { 7, 9, -8 }, { 8, 10, -10 }, { 8, 11, -10 },
+		{ 9, 11, -12 }, { 11, 12, -12 }, { 12, 13, -12 }
+		}
+	}
+},
+{ DSC_BPP(10), 12,
+	/* 20BPP/12BPC */
+	{ 273, 15, 2048, 11, 20, 19, 19, {
+		{ 0, 4, 10 }, { 2, 7, 8 }, { 4, 9, 6 }, { 6, 11, 4 },
+		{ 9, 11, 2 }, { 9, 11, 0 }, { 9, 12, -2 }, { 10, 12, -4 },
+		{ 11, 13, -6 }, { 11, 13, -8 }, { 12, 14, -10 },
+		{ 13, 15, -10 }, { 13, 15, -12 }, { 15, 16, -12 },
+		{ 16, 17, -12 }
+		}
+	}
+},
+{ DSC_BPP(10), 14,
+	/* 20BPP/14BPC */
+	{ 273, 15, 2048, 15, 24, 23, 23, {
+		{ 0, 4, 10 }, { 3, 8, 8 }, { 6, 11, 6 }, { 9, 14, 4 },
+		{ 13, 15, 2 }, { 13, 15, 0 }, { 13, 16, -2 }, { 14, 16, -4 },
+		{ 15, 17, -6 }, { 15, 17, -8 }, { 16, 18, -10 },
+		{ 17, 19, -10 }, { 17, 19, -12 }, { 19, 20, -12 },
+		{ 20, 21, -12 }
+		}
+	}
+},
+{ DSC_BPP(10), 16,
+	/* 20BPP/16BPC */
+	{ 273, 15, 2048, 19, 28, 27, 27, {
+		{ 0, 4, 10 }, { 4, 9, 8 }, { 8, 13, 6 }, { 12, 17, 4 },
+		{ 17, 19, 2 }, { 17, 20, 0 }, { 17, 20, -2 }, { 18, 20, -4 },
+		{ 19, 21, -6 }, { 19, 21, -8 }, { 20, 22, -10 },
+		{ 21, 23, -10 }, { 21, 23, -12 }, { 23, 24, -12 },
+		{ 24, 25, -12 }
+		}
+	}
+},
+{ /* sentinel */ }
+};
+
+static const struct rc_parameters_data rc_parameters_1_2_420[] = {
+{ DSC_BPP(4), 8,
+	/* 8BPP/8BPC */
+	{ 512, 12, 6144, 3, 12, 11, 11, {
+		{ 0, 4, 2 }, { 0, 4, 0 }, { 1, 5, 0 }, { 1, 6, -2 },
+		{ 3, 7, -4 }, { 3, 7, -6 }, { 3, 7, -8 }, { 3, 8, -8 },
+		{ 3, 9, -8 }, { 3, 10, -10 }, { 5, 10, -10 }, { 5, 11, -12 },
+		{ 5, 11, -12 }, { 9, 12, -12 }, { 12, 13, -12 }
+		}
+	}
+},
+{ DSC_BPP(4), 10,
+	/* 8BPP/10BPC */
+	{ 512, 12, 6144, 7, 16, 15, 15, {
+		{ 0, 8, 2 }, { 4, 8, 0 }, { 5, 9, 0 }, { 5, 10, -2 },
+		{ 7, 11, -4 }, { 7, 11, -6 }, { 7, 11, -8 }, { 7, 12, -8 },
+		{ 7, 13, -8 }, { 7, 14, -10 }, { 9, 14, -10 }, { 9, 15, -12 },
+		{ 9, 15, -12 }, { 13, 16, -12 }, { 16, 17, -12 }
+		}
+	}
+},
+{ DSC_BPP(4), 12,
+	/* 8BPP/12BPC */
+	{ 512, 12, 6144, 11, 20, 19, 19, {
+		{ 0, 12, 2 }, { 4, 12, 0 }, { 9, 13, 0 }, { 9, 14, -2 },
+		{ 11, 15, -4 }, { 11, 15, -6 }, { 11, 15, -8 }, { 11, 16, -8 },
+		{ 11, 17, -8 }, { 11, 18, -10 }, { 13, 18, -10 },
+		{ 13, 19, -12 }, { 13, 19, -12 }, { 17, 20, -12 },
+		{ 20, 21, -12 }
+		}
+	}
+},
+{ DSC_BPP(4), 14,
+	/* 8BPP/14BPC */
+	{ 512, 12, 6144, 15, 24, 23, 23, {
+		{ 0, 12, 2 }, { 5, 13, 0 }, { 11, 15, 0 }, { 12, 17, -2 },
+		{ 15, 19, -4 }, { 15, 19, -6 }, { 15, 19, -8 }, { 15, 20, -8 },
+		{ 15, 21, -8 }, { 15, 22, -10 }, { 17, 22, -10 },
+		{ 17, 23, -12 }, { 17, 23, -12 }, { 21, 24, -12 },
+		{ 24, 25, -12 }
+		}
+	}
+},
+{ DSC_BPP(4), 16,
+	/* 8BPP/16BPC */
+	{ 512, 12, 6144, 19, 28, 27, 27, {
+		{ 0, 12, 2 }, { 6, 14, 0 }, { 13, 17, 0 }, { 15, 20, -2 },
+		{ 19, 23, -4 }, { 19, 23, -6 }, { 19, 23, -8 }, { 19, 24, -8 },
+		{ 19, 25, -8 }, { 19, 26, -10 }, { 21, 26, -10 },
+		{ 21, 27, -12 }, { 21, 27, -12 }, { 25, 28, -12 },
+		{ 28, 29, -12 }
+		}
+	}
+},
+{ DSC_BPP(5), 8,
+	/* 10BPP/8BPC */
+	{ 410, 15, 5632, 3, 12, 11, 11, {
+		{ 0, 3, 2 }, { 0, 4, 0 }, { 1, 5, 0 }, { 2, 6, -2 },
+		{ 3, 7, -4 }, { 3, 7, -6 }, { 3, 7, -8 }, { 3, 8, -8 },
+		{ 3, 9, -8 }, { 3, 9, -10 }, { 5, 10, -10 }, { 5, 10, -10 },
+		{ 5, 11, -12 }, { 7, 11, -12 }, { 11, 12, -12 }
+		}
+	}
+},
+{ DSC_BPP(5), 10,
+	/* 10BPP/10BPC */
+	{ 410, 15, 5632, 7, 16, 15, 15, {
+		{ 0, 7, 2 }, { 4, 8, 0 }, { 5, 9, 0 }, { 6, 10, -2 },
+		{ 7, 11, -4 }, { 7, 11, -6 }, { 7, 11, -8 }, { 7, 12, -8 },
+		{ 7, 13, -8 }, { 7, 13, -10 }, { 9, 14, -10 }, { 9, 14, -10 },
+		{ 9, 15, -12 }, { 11, 15, -12 }, { 15, 16, -12 }
+		}
+	}
+},
+{ DSC_BPP(5), 12,
+	/* 10BPP/12BPC */
+	{ 410, 15, 5632, 11, 20, 19, 19, {
+		{ 0, 11, 2 }, { 4, 12, 0 }, { 9, 13, 0 }, { 10, 14, -2 },
+		{ 11, 15, -4 }, { 11, 15, -6 }, { 11, 15, -8 }, { 11, 16, -8 },
+		{ 11, 17, -8 }, { 11, 17, -10 }, { 13, 18, -10 },
+		{ 13, 18, -10 }, { 13, 19, -12 }, { 15, 19, -12 },
+		{ 19, 20, -12 }
+		}
+	}
+},
+{ DSC_BPP(5), 14,
+	/* 10BPP/14BPC */
+	{ 410, 15, 5632, 15, 24, 23, 23, {
+		{ 0, 11, 2 }, { 5, 13, 0 }, { 11, 15, 0 }, { 13, 18, -2 },
+		{ 15, 19, -4 }, { 15, 19, -6 }, { 15, 19, -8 }, { 15, 20, -8 },
+		{ 15, 21, -8 }, { 15, 21, -10 }, { 17, 22, -10 },
+		{ 17, 22, -10 }, { 17, 23, -12 }, { 19, 23, -12 },
+		{ 23, 24, -12 }
+		}
+	}
+},
+{ DSC_BPP(5), 16,
+	/* 10BPP/16BPC */
+	{ 410, 15, 5632, 19, 28, 27, 27, {
+		{ 0, 11, 2 }, { 6, 14, 0 }, { 13, 17, 0 }, { 16, 20, -2 },
+		{ 19, 23, -4 }, { 19, 23, -6 }, { 19, 23, -8 }, { 19, 24, -8 },
+		{ 19, 25, -8 }, { 19, 25, -10 }, { 21, 26, -10 },
+		{ 21, 26, -10 }, { 21, 27, -12 }, { 23, 27, -12 },
+		{ 27, 28, -12 }
+		}
+	}
+},
+{ DSC_BPP(6), 8,
+	/* 12BPP/8BPC */
+	{ 341, 15, 2048, 3, 12, 11, 11, {
+		{ 0, 2, 2 }, { 0, 4, 0 }, { 1, 5, 0 }, { 1, 6, -2 },
+		{ 3, 7, -4 }, { 3, 7, -6 }, { 3, 7, -8 }, { 3, 8, -8 },
+		{ 3, 8, -8 }, { 3, 9, -10 }, { 5, 9, -10 }, { 5, 9, -12 },
+		{ 5, 9, -12 }, { 7, 10, -12 }, { 10, 12, -12 }
+		}
+	}
+},
+{ DSC_BPP(6), 10,
+	/* 12BPP/10BPC */
+	{ 341, 15, 2048, 7, 16, 15, 15, {
+		{ 0, 2, 2 }, { 2, 5, 0 }, { 3, 7, 0 }, { 4, 8, -2 },
+		{ 6, 9, -4 }, { 7, 10, -6 }, { 7, 11, -8 }, { 7, 12, -8 },
+		{ 7, 12, -8 }, { 7, 13, -10 }, { 9, 13, -10 }, { 9, 13, -12 },
+		{ 9, 13, -12 }, { 11, 14, -12 }, { 14, 15, -12 }
+		}
+	}
+},
+{ DSC_BPP(6), 12,
+	/* 12BPP/12BPC */
+	{ 341, 15, 2048, 11, 20, 19, 19, {
+		{ 0, 6, 2 }, { 4, 9, 0 }, { 7, 11, 0 }, { 8, 12, -2 },
+		{ 10, 13, -4 }, { 11, 14, -6 }, { 11, 15, -8 }, { 11, 16, -8 },
+		{ 11, 16, -8 }, { 11, 17, -10 }, { 13, 17, -10 },
+		{ 13, 17, -12 }, { 13, 17, -12 }, { 15, 18, -12 },
+		{ 18, 19, -12 }
+		}
+	}
+},
+{ DSC_BPP(6), 14,
+	/* 12BPP/14BPC */
+	{ 341, 15, 2048, 15, 24, 23, 23, {
+		{ 0, 6, 2 }, { 7, 10, 0 }, { 9, 13, 0 }, { 11, 16, -2 },
+		{ 14, 17, -4 }, { 15, 18, -6 }, { 15, 19, -8 }, { 15, 20, -8 },
+		{ 15, 20, -8 }, { 15, 21, -10 }, { 17, 21, -10 },
+		{ 17, 21, -12 }, { 17, 21, -12 }, { 19, 22, -12 },
+		{ 22, 23, -12 }
+		}
+	}
+},
+{ DSC_BPP(6), 16,
+	/* 12BPP/16BPC */
+	{ 341, 15, 2048, 19, 28, 27, 27, {
+		{ 0, 6, 2 }, { 6, 11, 0 }, { 11, 15, 0 }, { 14, 18, -2 },
+		{ 18, 21, -4 }, { 19, 22, -6 }, { 19, 23, -8 }, { 19, 24, -8 },
+		{ 19, 24, -8 }, { 19, 25, -10 }, { 21, 25, -10 },
+		{ 21, 25, -12 }, { 21, 25, -12 }, { 23, 26, -12 },
+		{ 26, 27, -12 }
+		}
+	}
+},
+{ DSC_BPP(8), 8,
+	/* 16BPP/8BPC */
+	{ 256, 15, 2048, 3, 12, 11, 11, {
+		{ 0, 0, 10 }, { 0, 1, 8 }, { 0, 1, 6 }, { 0, 2, 4 },
+		{ 1, 2, 2 }, { 1, 3, 0 }, { 1, 3, -2 }, { 2, 4, -4 },
+		{ 2, 5, -6 }, { 3, 5, -8 }, { 4, 6, -10 }, { 4, 7, -10 },
+		{ 5, 7, -12 }, { 7, 8, -12 }, { 8, 9, -12 }
+		}
+	}
+},
+{ DSC_BPP(8), 10,
+	/* 16BPP/10BPC */
+	{ 256, 15, 2048, 7, 16, 15, 15, {
+		{ 0, 2, 10 }, { 2, 5, 8 }, { 3, 5, 6 }, { 4, 6, 4 },
+		{ 5, 6, 2 }, { 5, 7, 0 }, { 5, 7, -2 }, { 6, 8, -4 },
+		{ 6, 9, -6 }, { 7, 9, -8 }, { 8, 10, -10 }, { 8, 11, -10 },
+		{ 9, 11, -12 }, { 11, 12, -12 }, { 12, 13, -12 }
+		}
+	}
+},
+{ DSC_BPP(8), 12,
+	/* 16BPP/12BPC */
+	{ 256, 15, 2048, 11, 20, 19, 19, {
+		{ 0, 4, 10 }, { 2, 7, 8 }, { 4, 9, 6 }, { 6, 11, 4 },
+		{ 9, 11, 2 }, { 9, 11, 0 }, { 9, 12, -2 }, { 10, 12, -4 },
+		{ 11, 13, -6 }, { 11, 13, -8 }, { 12, 14, -10 },
+		{ 13, 15, -10 }, { 13, 15, -12 }, { 15, 16, -12 },
+		{ 16, 17, -12 }
+		}
+	}
+},
+{ DSC_BPP(8), 14,
+	/* 16BPP/14BPC */
+	{ 256, 15, 2048, 15, 24, 23, 23, {
+		{ 0, 4, 10 }, { 3, 8, 8 }, { 6, 11, 6 }, { 9, 14, 4 },
+		{ 13, 15, 2 }, { 13, 15, 0 }, { 13, 16, -2 }, { 14, 16, -4 },
+		{ 15, 17, -6 }, { 15, 17, -8 }, { 16, 18, -10 },
+		{ 17, 19, -10 }, { 17, 19, -12 }, { 19, 20, -12 },
+		{ 20, 21, -12 }
+		}
+	}
+},
+{ DSC_BPP(8), 16,
+	/* 16BPP/16BPC */
+	{ 256, 15, 2048, 19, 28, 27, 27, {
+		{ 0, 4, 10 }, { 4, 9, 8 }, { 8, 13, 6 }, { 12, 17, 4 },
+		{ 17, 19, 2 }, { 17, 20, 0 }, { 17, 20, -2 }, { 18, 20, -4 },
+		{ 19, 21, -6 }, { 19, 21, -8 }, { 20, 22, -10 },
+		{ 21, 23, -10 }, { 21, 23, -12 }, { 23, 24, -12 },
+		{ 24, 25, -12 }
+		}
+	}
+},
+{ /* sentinel */ }
+};
+
 static const struct rc_parameters *get_rc_params(const struct rc_parameters_data *rc_parameters,
 						 u16 dsc_bpp,
 						 u8 bits_per_component)
@@ -776,6 +1208,12 @@ int drm_dsc_setup_rc_params(struct drm_dsc_config *vdsc_cfg, enum drm_dsc_params
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
index c634bb2935d3..0bb0c3afd740 100644
--- a/include/drm/display/drm_dsc_helper.h
+++ b/include/drm/display/drm_dsc_helper.h
@@ -13,6 +13,8 @@
 enum drm_dsc_params_kind {
 	DRM_DSC_1_2_444,
 	DRM_DSC_1_1_PRE_SCR, /* legacy params from DSC 1.1 */
+	DRM_DSC_1_2_422,
+	DRM_DSC_1_2_420,
 };
 
 void drm_dsc_dp_pps_header_init(struct dp_sdp_header *pps_header);
-- 
2.39.2

