Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 4CB4D4B3216
	for <lists+dri-devel@lfdr.de>; Sat, 12 Feb 2022 01:38:21 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id F145110EB73;
	Sat, 12 Feb 2022 00:38:15 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-lf1-x129.google.com (mail-lf1-x129.google.com
 [IPv6:2a00:1450:4864:20::129])
 by gabe.freedesktop.org (Postfix) with ESMTPS id D0AF410E186
 for <dri-devel@lists.freedesktop.org>; Sat, 12 Feb 2022 00:38:14 +0000 (UTC)
Received: by mail-lf1-x129.google.com with SMTP id x15so2385895lfu.10
 for <dri-devel@lists.freedesktop.org>; Fri, 11 Feb 2022 16:38:14 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=from:to:cc:subject:date:message-id:mime-version
 :content-transfer-encoding;
 bh=Fx2z0CufYTJyTYpir6OaLTyO4/xLDcyc75GWCDVFbwo=;
 b=g/3MwNJZ3sMNw6g3ug72TNPOuQHA245Td1UY7zV8Jp7LHXEVrlgebnFBcjAHtWZk+F
 fMCalKwVqKiPVE1yv3dzW/6KheGEqDbc87HHKbYBmzojh0DnVEWfBx72X3QI5P3iBgfz
 4raxpbniCNJEbDPpZaO7zjHeQG2QdnlR4HXeaR8muzfZBQ7g0zgCHOjE+smRi5mPK73O
 SjC5ITr6CFeArI4TVxVfh7sAOtvtuUx/SzmUv0hUclF6ojyK0b3LW2p4nm8td4+k7eUz
 pTiE595E/+2Stond9YXMbhEF1gqTgBz2fq8u33hpMgGf4MdC2sbU3aKugVCjwTUVgF4g
 clXA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:mime-version
 :content-transfer-encoding;
 bh=Fx2z0CufYTJyTYpir6OaLTyO4/xLDcyc75GWCDVFbwo=;
 b=RNOwrqlsNrvNGygbrjwKTyZDtlFa2oDZO32dfiYSK53fE8dJVgb21XhPlxPoUeouE4
 FEihkkBr4IOeZchl7hBKcRdctPTRWpo/EMQJD52E7Qp3Sul7V1DJUnlwCH82OtcLWYt7
 01kjvk0utYaECfH1hn25lRXYO6113gA7aOfQGuTxSrK+FTdRmk1QEuqaXx9QEl0dB+1X
 GL2cu+UF29eTcPkwW3AkerHQqS7it+dY40k+GnrZQbhH+36k6JQvWj0wTvRhw3goZohb
 UemWUsbkoBbW0UulrOEl0+BICiJKl6mHWss7SUPc25NQvNXPwbkZq6D4bcvVICpWI+jK
 ZNvQ==
X-Gm-Message-State: AOAM530n6MmxMvXGomAwYerPnbso60AVpysdKHUbeiF8TmZ4boVVSgH2
 h7YEmwBPdEFo/j8Kgylq+OpWqw==
X-Google-Smtp-Source: ABdhPJxEiiUQkn68ZZbE+++yK4qKDB363KHB0hiEnAhs3j/8PAEw7AfPGwI/l7/SFO2bTfSe/sEhgQ==
X-Received: by 2002:a05:6512:3d9f:: with SMTP id
 k31mr212281lfv.151.1644626293011; 
 Fri, 11 Feb 2022 16:38:13 -0800 (PST)
Received: from eriador.lan ([37.153.55.125])
 by smtp.gmail.com with ESMTPSA id n10sm3207217ljj.106.2022.02.11.16.38.12
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Fri, 11 Feb 2022 16:38:12 -0800 (PST)
From: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
To: Bjorn Andersson <bjorn.andersson@linaro.org>,
 Rob Clark <robdclark@gmail.com>, Sean Paul <sean@poorly.run>,
 Abhinav Kumar <quic_abhinavk@quicinc.com>
Subject: [PATCH v3] drm/msm/dpu: Only create debugfs for PRIMARY minor
Date: Sat, 12 Feb 2022 03:38:11 +0300
Message-Id: <20220212003811.1818774-1-dmitry.baryshkov@linaro.org>
X-Mailer: git-send-email 2.34.1
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
Cc: David Airlie <airlied@linux.ie>, linux-arm-msm@vger.kernel.org,
 dri-devel@lists.freedesktop.org, Stephen Boyd <swboyd@chromium.org>,
 freedreno@lists.freedesktop.org
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

From: Bjorn Andersson <bjorn.andersson@linaro.org>

dpu_kms_debugfs_init() is invoked for each minor being registered. Most
of the files created are unrelated to the minor, so there's no reason to
present them per minor.
The exception to this is the DisplayPort code, which ends up invoking
dp_debug_get() for each minor, each time associate the allocated object
with dp->debug.

As such dp_debug will create debugfs files in both the PRIMARY and the
RENDER minor's debugfs directory, but only the last reference will be
remembered.

The only use of this reference today is in the cleanup path in
dp_display_deinit_sub_modules() and the dp_debug_private object does
outlive the debugfs entries in either case, so there doesn't seem to be
any adverse effects of this, but per the code the current behavior is
unexpected, so change it to only create debugfs files for the PRIMARY
minor.

Signed-off-by: Bjorn Andersson <bjorn.andersson@linaro.org>
[DB: slightly change description and in-patch comment]
Signed-off-by: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
---
This is a replacement for
https://patchwork.freedesktop.org/patch/467273/ with the patch
subject and comment being fixed.
---

 drivers/gpu/drm/msm/disp/dpu1/dpu_kms.c | 4 ++++
 1 file changed, 4 insertions(+)

diff --git a/drivers/gpu/drm/msm/disp/dpu1/dpu_kms.c b/drivers/gpu/drm/msm/disp/dpu1/dpu_kms.c
index 5f0dc44119c9..c394bd6b2e5d 100644
--- a/drivers/gpu/drm/msm/disp/dpu1/dpu_kms.c
+++ b/drivers/gpu/drm/msm/disp/dpu1/dpu_kms.c
@@ -271,6 +271,10 @@ static int dpu_kms_debugfs_init(struct msm_kms *kms, struct drm_minor *minor)
 	if (!p)
 		return -EINVAL;
 
+	/* Only create a set of debugfs for the primary node, ignore render nodes */
+	if (minor->type != DRM_MINOR_PRIMARY)
+		return 0;
+
 	dev = dpu_kms->dev;
 	priv = dev->dev_private;
 
-- 
2.34.1

