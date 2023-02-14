Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 5BA85696B99
	for <lists+dri-devel@lfdr.de>; Tue, 14 Feb 2023 18:32:15 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 4070210E93E;
	Tue, 14 Feb 2023 17:32:10 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-ed1-x535.google.com (mail-ed1-x535.google.com
 [IPv6:2a00:1450:4864:20::535])
 by gabe.freedesktop.org (Postfix) with ESMTPS id CC55310E93F
 for <dri-devel@lists.freedesktop.org>; Tue, 14 Feb 2023 17:32:07 +0000 (UTC)
Received: by mail-ed1-x535.google.com with SMTP id s11so10763596edd.10
 for <dri-devel@lists.freedesktop.org>; Tue, 14 Feb 2023 09:32:07 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:from:to:cc:subject:date
 :message-id:reply-to;
 bh=5ZAfO7IxAr14EAlhNtiFp5Qcd0YjV1Wu3mwyrUUlhD8=;
 b=Ba+7saktvdPC7xS2+pEh70ok/9U8dm/iKWsOe1jNXabzVeuaHbP4sqVAYuuyXr4Gs1
 U4NLdEa9JojM+btfYFRbqR5/iY0nOJkxZRjm65BPwZmxdu3VN20pvcu28/tVHHtfidvk
 urCoZDHjuyVJAF8eZS582h6ySnE9393qYS9it6ySu5EIA3/TtsGjtkrUdagOnM7e92uP
 mfdnRCIvTFOHUxfmGwWJGJYP7UWMioXin0uj+Bo8WGIll2ppI6XYiNZMPWQphCXsbQSN
 VM0FlBQEAU3w++T6cn7+sHvOY1jE8eFFOSLwpi9Gs4QKxb4sT54UeOG8MORM0jfqfUmI
 Ta2w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=5ZAfO7IxAr14EAlhNtiFp5Qcd0YjV1Wu3mwyrUUlhD8=;
 b=lkVyykLp4ppwtUgFxZtd/BZHn7DCvkUB49Ivj7zLoetNOWL5y79feY59Xsi9yCWLnR
 D390fJLt9nx3vrpDymA3jD0dKaBikbDsTZM+8032SWng5tTPlTk5lUxrH68BmcUl0ys8
 WfttddkYdVQna35Z22CikCwEegjIsIEzy0r6V3fRNazlPXlvZLsnO4Oa4RrrJDlt54Ig
 oM3tMWPIGUPXMvwy7OYdFYAPFxBr+UksSywngFRZ4MJOcVSdtz/CZIOfrUBYslfZ7gnM
 XBmu1TcTnIOQs4SDl5xih+QuvdUSpYvAcTuggdLRBmjl5g0s6W56TOKs/uNETdAWPjt7
 H4rA==
X-Gm-Message-State: AO0yUKV4WeZ6c4Sg2aZIobGcHr99Hxu9X6ujMmp9/AoAnV8DDN24/gUy
 HiqhihmrRS5FTX9qH8dRHffo0iyyc7Uv/xlV
X-Google-Smtp-Source: AK7set86ET7Xv1SeyeM9KIHwEorieCgRjitv8RDoyP7QxxL0FjI1TF352UebhLfgnANze042g7s42g==
X-Received: by 2002:a50:d49d:0:b0:4ac:c84b:1ddd with SMTP id
 s29-20020a50d49d000000b004acc84b1dddmr3473276edi.32.1676395915399; 
 Tue, 14 Feb 2023 09:31:55 -0800 (PST)
Received: from localhost.localdomain (abxh117.neoplus.adsl.tpnet.pl.
 [83.9.1.117]) by smtp.gmail.com with ESMTPSA id
 w8-20020a50c448000000b0049668426aa6sm8325787edf.24.2023.02.14.09.31.53
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Tue, 14 Feb 2023 09:31:55 -0800 (PST)
From: Konrad Dybcio <konrad.dybcio@linaro.org>
To: linux-arm-msm@vger.kernel.org,
	andersson@kernel.org,
	agross@kernel.org
Subject: [PATCH v2 01/14] drm/msm/a6xx: De-staticize sptprac en/disable
 functions
Date: Tue, 14 Feb 2023 18:31:32 +0100
Message-Id: <20230214173145.2482651-2-konrad.dybcio@linaro.org>
X-Mailer: git-send-email 2.39.1
In-Reply-To: <20230214173145.2482651-1-konrad.dybcio@linaro.org>
References: <20230214173145.2482651-1-konrad.dybcio@linaro.org>
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
Cc: freedreno@lists.freedesktop.org, linux-kernel@vger.kernel.org,
 Akhil P Oommen <quic_akhilpo@quicinc.com>,
 Abhinav Kumar <quic_abhinavk@quicinc.com>, dri-devel@lists.freedesktop.org,
 Douglas Anderson <dianders@chromium.org>,
 Konrad Dybcio <konrad.dybcio@linaro.org>,
 Geert Uytterhoeven <geert@linux-m68k.org>,
 Dmitry Baryshkov <dmitry.baryshkov@linaro.org>, marijn.suijten@somainline.org,
 Sean Paul <sean@poorly.run>, Guenter Roeck <linux@roeck-us.net>
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

These two will be reused by at least A619_holi in the non-gmu
paths. De-staticize them to make it possible.

Signed-off-by: Konrad Dybcio <konrad.dybcio@linaro.org>
---
 drivers/gpu/drm/msm/adreno/a6xx_gmu.c | 4 ++--
 drivers/gpu/drm/msm/adreno/a6xx_gmu.h | 2 ++
 2 files changed, 4 insertions(+), 2 deletions(-)

diff --git a/drivers/gpu/drm/msm/adreno/a6xx_gmu.c b/drivers/gpu/drm/msm/adreno/a6xx_gmu.c
index f3c9600221d4..90e636dcdd5b 100644
--- a/drivers/gpu/drm/msm/adreno/a6xx_gmu.c
+++ b/drivers/gpu/drm/msm/adreno/a6xx_gmu.c
@@ -354,7 +354,7 @@ void a6xx_gmu_clear_oob(struct a6xx_gmu *gmu, enum a6xx_gmu_oob_state state)
 }
 
 /* Enable CPU control of SPTP power power collapse */
-static int a6xx_sptprac_enable(struct a6xx_gmu *gmu)
+int a6xx_sptprac_enable(struct a6xx_gmu *gmu)
 {
 	int ret;
 	u32 val;
@@ -376,7 +376,7 @@ static int a6xx_sptprac_enable(struct a6xx_gmu *gmu)
 }
 
 /* Disable CPU control of SPTP power power collapse */
-static void a6xx_sptprac_disable(struct a6xx_gmu *gmu)
+void a6xx_sptprac_disable(struct a6xx_gmu *gmu)
 {
 	u32 val;
 	int ret;
diff --git a/drivers/gpu/drm/msm/adreno/a6xx_gmu.h b/drivers/gpu/drm/msm/adreno/a6xx_gmu.h
index e034935b3986..ec28abdd327b 100644
--- a/drivers/gpu/drm/msm/adreno/a6xx_gmu.h
+++ b/drivers/gpu/drm/msm/adreno/a6xx_gmu.h
@@ -186,5 +186,7 @@ int a6xx_hfi_set_freq(struct a6xx_gmu *gmu, int index);
 
 bool a6xx_gmu_gx_is_on(struct a6xx_gmu *gmu);
 bool a6xx_gmu_sptprac_is_on(struct a6xx_gmu *gmu);
+void a6xx_sptprac_disable(struct a6xx_gmu *gmu);
+int a6xx_sptprac_enable(struct a6xx_gmu *gmu);
 
 #endif
-- 
2.39.1

