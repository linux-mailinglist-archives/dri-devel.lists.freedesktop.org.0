Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 20515465933
	for <lists+dri-devel@lfdr.de>; Wed,  1 Dec 2021 23:26:58 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 4535F6E91B;
	Wed,  1 Dec 2021 22:26:42 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-lj1-x234.google.com (mail-lj1-x234.google.com
 [IPv6:2a00:1450:4864:20::234])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 678C56E0F8
 for <dri-devel@lists.freedesktop.org>; Wed,  1 Dec 2021 22:26:40 +0000 (UTC)
Received: by mail-lj1-x234.google.com with SMTP id u22so51106962lju.7
 for <dri-devel@lists.freedesktop.org>; Wed, 01 Dec 2021 14:26:40 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=fWCoIosLOkr8+Xp5Tky7xqwPwu8pC3ri4jt2sulhCRE=;
 b=Xb2SvLb1ZZ9tHGymd8d9tmuvelPOGxTOoUuK6Q+FG9Z7F/abPDzE7TWHp5oaeghX1o
 4An2eEl8JdsG302stGkaHUsC3nGi2P63gWMK0mpa9/nHbZcm4HAlW9xNEzAxzqurhFW2
 wzRu8qBkPI0gInFNlPjNACnxkzc00sxQqGzQvDu9rt50yzoqeKmdaffo7vzjqxEkLAaG
 mMQ/LqlRPSlq2vFUF+EeSgwh6FkbCcptBR8jHmOd5Vz1+kPQ1aDnM/NkpN8KWoJOolxP
 sR+kXa31AlkkzO29iSFuo7gkIhOE/+nBlJ4zJoENqYuJDY42NuJqTUjUhOYUZ5C4Ausf
 fijg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=fWCoIosLOkr8+Xp5Tky7xqwPwu8pC3ri4jt2sulhCRE=;
 b=osIHeCdynusSYeAtSs2z9TKEcfoxw5qHSZslx87kTzykenquvUFuLWTF8o21FjydyP
 //mWtfF3s7IeSvo/aJ1AFuqOVcITIpD6HvEWJVpQwQ/3DS8/GsKNfCWoavqLu+rM99Mp
 NK41xzfyVebfnZ3RAaDeTAJJ2EjLfYbJqaqs17h5Jc18zu4wkPSnD1NgzslCvV3xELcB
 +82Lla5b6kPXEMYQixyfXObNlrzCyrmy9Kf/dv5VVr4R4+5B8nODuTe9TJji+MPI53E5
 9uWK1SsCwcn8Nk2uUncPAMNajlRLOJ91s9YzjK6/kgojgjI90TJmi6SxL0De40+v+k/i
 +F8A==
X-Gm-Message-State: AOAM533mfKtPO/ToY+ZbPO86DaNYhwhHRgSxEaZPgdmUpuAoOEdDu3MU
 wLjrhsnZkfqr1bDfhrXpF/HZ9Q==
X-Google-Smtp-Source: ABdhPJxtqnDME8ugi6RNS2CRr24FIhayY929Ybdkjjg0tuAthvNZRunt6g/P/cX8aCOWaRL5rkDyVQ==
X-Received: by 2002:a2e:9dc8:: with SMTP id x8mr8170843ljj.502.1638397598784; 
 Wed, 01 Dec 2021 14:26:38 -0800 (PST)
Received: from eriador.lan ([37.153.55.125])
 by smtp.gmail.com with ESMTPSA id u7sm117004lfs.144.2021.12.01.14.26.38
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Wed, 01 Dec 2021 14:26:38 -0800 (PST)
From: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
To: Bjorn Andersson <bjorn.andersson@linaro.org>,
 Rob Clark <robdclark@gmail.com>, Sean Paul <sean@poorly.run>,
 Abhinav Kumar <abhinavk@codeaurora.org>
Subject: [PATCH v1 3/8] drm/msm/dpu: make danger_status/safe_status readable
Date: Thu,  2 Dec 2021 01:26:28 +0300
Message-Id: <20211201222633.2476780-4-dmitry.baryshkov@linaro.org>
X-Mailer: git-send-email 2.33.0
In-Reply-To: <20211201222633.2476780-1-dmitry.baryshkov@linaro.org>
References: <20211201222633.2476780-1-dmitry.baryshkov@linaro.org>
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
Cc: Stephen Boyd <sboyd@kernel.org>, linux-arm-msm@vger.kernel.org,
 dri-devel@lists.freedesktop.org, David Airlie <airlied@linux.ie>,
 freedreno@lists.freedesktop.org
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

Change \t to \n in the print format to stop putting all SSPP status in a
single line. Splitting it to one SSPP per line is much more readable.

Signed-off-by: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
---
 drivers/gpu/drm/msm/disp/dpu1/dpu_kms.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/drivers/gpu/drm/msm/disp/dpu1/dpu_kms.c b/drivers/gpu/drm/msm/disp/dpu1/dpu_kms.c
index e7f0cded2c6b..4c04982c71b2 100644
--- a/drivers/gpu/drm/msm/disp/dpu1/dpu_kms.c
+++ b/drivers/gpu/drm/msm/disp/dpu1/dpu_kms.c
@@ -82,7 +82,7 @@ static int _dpu_danger_signal_status(struct seq_file *s,
 	seq_printf(s, "MDP     :  0x%x\n", status.mdp);
 
 	for (i = SSPP_VIG0; i < SSPP_MAX; i++)
-		seq_printf(s, "SSPP%d   :  0x%x  \t", i - SSPP_VIG0,
+		seq_printf(s, "SSPP%d   :  0x%x  \n", i - SSPP_VIG0,
 				status.sspp[i]);
 	seq_puts(s, "\n");
 
-- 
2.33.0

