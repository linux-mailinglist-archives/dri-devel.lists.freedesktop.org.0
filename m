Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id DA9D17443A5
	for <lists+dri-devel@lfdr.de>; Fri, 30 Jun 2023 22:55:59 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 915A110E4FD;
	Fri, 30 Jun 2023 20:55:37 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-lf1-x12f.google.com (mail-lf1-x12f.google.com
 [IPv6:2a00:1450:4864:20::12f])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 3657210E4F4
 for <dri-devel@lists.freedesktop.org>; Fri, 30 Jun 2023 20:55:33 +0000 (UTC)
Received: by mail-lf1-x12f.google.com with SMTP id
 2adb3069b0e04-4fb863edcb6so3914190e87.0
 for <dri-devel@lists.freedesktop.org>; Fri, 30 Jun 2023 13:55:33 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=linaro.org; s=google; t=1688158531; x=1690750531;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:from:to:cc:subject:date
 :message-id:reply-to;
 bh=r18mIVnmzqRHDPtVLwyQfg7CU86v3tvlxJpotfkE8/Y=;
 b=LUyeVfhqY4vehUN7iaSFHM+uoOBODXHG8w7l6Lw7PspLCfPKldR4KAwZ1W9FkwPAuz
 kI/Q+1MxAeU1vP5nHpmXjAfiU9JM2e+/iBsUqH0s5rZGQ5euKH3Yt1cji348QgFhMHIq
 qVrBcQRqzKPK4Aox2BpKJuQiYPSASSiuISu/JXDfBywg65cxJov1vuKP53Moc0HZHebx
 aR4n0XANAHbQWlhFuZM9jYtEGHCdwcxW1Q5gIVMVXI5MdqMXJiucCr0kBkpepibS8Ziy
 JORNtbZtmqE2GoUPVrNwAsrmOQWtVoq4RQYaDs34Y9QzFTZEHdg7FMZzquDPDa+YAvLu
 lluQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20221208; t=1688158531; x=1690750531;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=r18mIVnmzqRHDPtVLwyQfg7CU86v3tvlxJpotfkE8/Y=;
 b=iMI11gV/obJDh/Mcxn2f6kRY9g8sLy+TnWZrGd0m8ge1fbmkTPxuqmiw2HXVWngMD7
 1aZANIYnr6CL6WI19WxPV33kBsuAYQNO4LeNQc99INYN5c9ZuAn+CTjSXnb0aUS/bCE6
 sqEYnBLae6CrBItUlpzWmzYpsMfkqfDPP9iwBaJ2/5LjHIfG4U5Y6/iAX0Wlh5g23/+7
 qKk52VcHWwQHfN6dOQq3jIrGmwqsiTTgxCEbKAhlA3Gk8I5p6xNs5/V5BfzmfEIgnHZ9
 aQJ2twfsR2p3nfVFC9lxbFCmR18/MNgrfmDRLWPHrya84YcAlW27e2U3AU6nb8PMPIJp
 lLPg==
X-Gm-Message-State: ABy/qLaQ/1oP7azUwjALRxn9QzBt38uqhnoqnbpZtHyXRXNK6Mq3G11a
 eB45DamoL7iuGbYJeYms7B55Yg==
X-Google-Smtp-Source: APBJJlE7JZKxqCJN4wJq27EJv5YNxShDUyy9x1y4SLSryjFibDNtFji/MeeW5RVzba70K+QXzWeFZw==
X-Received: by 2002:a05:6512:3c81:b0:4f5:1418:e230 with SMTP id
 h1-20020a0565123c8100b004f51418e230mr1018104lfv.52.1688158531172; 
 Fri, 30 Jun 2023 13:55:31 -0700 (PDT)
Received: from umbar.unikie.fi ([192.130.178.91])
 by smtp.gmail.com with ESMTPSA id
 z11-20020ac25deb000000b004fb75943aa0sm2252168lfq.196.2023.06.30.13.55.30
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Fri, 30 Jun 2023 13:55:30 -0700 (PDT)
From: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
To: Rob Clark <robdclark@gmail.com>, Sean Paul <sean@poorly.run>,
 Abhinav Kumar <quic_abhinavk@quicinc.com>,
 Marijn Suijten <marijn.suijten@somainline.org>
Subject: [PATCH 09/15] drm/msm/hdmi: add runtime PM calls to DDC transfer
 function
Date: Fri, 30 Jun 2023 23:55:17 +0300
Message-Id: <20230630205523.76823-10-dmitry.baryshkov@linaro.org>
X-Mailer: git-send-email 2.39.2
In-Reply-To: <20230630205523.76823-1-dmitry.baryshkov@linaro.org>
References: <20230630205523.76823-1-dmitry.baryshkov@linaro.org>
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

We must be sure that the HDMI controller is powered on, while performing
the DDC transfer. Add corresponding runtime PM calls to
msm_hdmi_i2c_xfer().

Signed-off-by: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
---
 drivers/gpu/drm/msm/hdmi/hdmi_i2c.c | 14 ++++++++++++--
 1 file changed, 12 insertions(+), 2 deletions(-)

diff --git a/drivers/gpu/drm/msm/hdmi/hdmi_i2c.c b/drivers/gpu/drm/msm/hdmi/hdmi_i2c.c
index de182c004843..9c78c6c528be 100644
--- a/drivers/gpu/drm/msm/hdmi/hdmi_i2c.c
+++ b/drivers/gpu/drm/msm/hdmi/hdmi_i2c.c
@@ -107,11 +107,15 @@ static int msm_hdmi_i2c_xfer(struct i2c_adapter *i2c,
 	if (num == 0)
 		return num;
 
+	ret = pm_runtime_resume_and_get(&hdmi->pdev->dev);
+	if (ret)
+		return ret;
+
 	init_ddc(hdmi_i2c);
 
 	ret = ddc_clear_irq(hdmi_i2c);
 	if (ret)
-		return ret;
+		goto fail;
 
 	for (i = 0; i < num; i++) {
 		struct i2c_msg *p = &msgs[i];
@@ -169,7 +173,7 @@ static int msm_hdmi_i2c_xfer(struct i2c_adapter *i2c,
 				hdmi_read(hdmi, REG_HDMI_DDC_SW_STATUS),
 				hdmi_read(hdmi, REG_HDMI_DDC_HW_STATUS),
 				hdmi_read(hdmi, REG_HDMI_DDC_INT_CTRL));
-		return ret;
+		goto fail;
 	}
 
 	ddc_status = hdmi_read(hdmi, REG_HDMI_DDC_SW_STATUS);
@@ -202,7 +206,13 @@ static int msm_hdmi_i2c_xfer(struct i2c_adapter *i2c,
 		}
 	}
 
+	pm_runtime_put(&hdmi->pdev->dev);
+
 	return i;
+
+fail:
+	pm_runtime_put(&hdmi->pdev->dev);
+	return ret;
 }
 
 static u32 msm_hdmi_i2c_func(struct i2c_adapter *adapter)
-- 
2.39.2

