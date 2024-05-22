Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 634688CBF97
	for <lists+dri-devel@lfdr.de>; Wed, 22 May 2024 12:51:31 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 11BB310F4CB;
	Wed, 22 May 2024 10:51:29 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=linaro.org header.i=@linaro.org header.b="WVmdBwPL";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-lf1-f45.google.com (mail-lf1-f45.google.com
 [209.85.167.45])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 49C5310F4C3
 for <dri-devel@lists.freedesktop.org>; Wed, 22 May 2024 10:51:06 +0000 (UTC)
Received: by mail-lf1-f45.google.com with SMTP id
 2adb3069b0e04-5210684cee6so6655852e87.0
 for <dri-devel@lists.freedesktop.org>; Wed, 22 May 2024 03:51:06 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=linaro.org; s=google; t=1716375064; x=1716979864; darn=lists.freedesktop.org;
 h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
 :mime-version:subject:date:from:from:to:cc:subject:date:message-id
 :reply-to; bh=r6GgwKTdsZwJRv3Ukk7SFtFzEc2aaRxTR76EeCWgZKA=;
 b=WVmdBwPLXQ9dG6UlD8LZgVAd2Wl58x26vR3U3mUQoMTx9pMPWyA+ZbfFyr+ZQVDfLV
 rncd4AVuSJwn4Jp7W8GOdIc+/8SImqH8KUZ1j0BZRWzTdVnX3iIt9Aov0HNW2iz5Hvr6
 zNM8IFTe8aQm9RWoJ9VOfUSXnjPC/97vVLNGJ+4OE9M193qBWiPPaxJ4/Hx1O6bykdy0
 8jHicPXsxtQX/A67D7VTGvZQJZNNWe89fkgsy4b06nrmu4eU91L1ZSkPfmeZjUE4vy6L
 AxpNWF5ddG4bMIztD/0XTPhgeCBLkzKlEKK7gj9+nrQl0YTHhPtlV/hr6zafux6TKdKX
 wRGg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1716375064; x=1716979864;
 h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
 :mime-version:subject:date:from:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=r6GgwKTdsZwJRv3Ukk7SFtFzEc2aaRxTR76EeCWgZKA=;
 b=kDGdhrslcqE/LvYbUf9eephWHqZ6ebbJxZbLCNGKzOeN07t5fBJAylGgEIHCeOAi+I
 R/dRduDCibnYqB+0gizruA6MRGDqMM9BvoB+j/espMnkVXM/fqOXyIRfOauKhOjtS/7I
 5Sqt2LBgJ/B0G/Y1C0EYYE3Whxod6pzJOO9+LQODQl9zKZxMiXnZkvXZphVOxi4X7gPO
 cR4J35/d3BeoARsXRh6DJqS5IDUjXXtuouI1MvmoZCaHuP7GeZ8McdaCHcphOgnrLnqN
 qMmnwPbsEbhwAx7mPMOO+YANKeA+JCx7pfJAZtsTgb3whp+k2Skd7uYkFZuPNJgFX0N6
 NNnw==
X-Forwarded-Encrypted: i=1;
 AJvYcCVAGzwIJ29y3pW6tanTi6hirm95mrWcIbVLYIj9BC5QwghBEdJysuB9+CqjadN4gH2+sCcxUWSYfy9KYbD39WA3AklMZjdDNc7BOnPHoO+u
X-Gm-Message-State: AOJu0YzZeshznP/Wc707Dk4Nxx0AiMyZYQ+1zzvQiwNLbZaZAavNaWwT
 G0nefxchY+qZ/QC9njVR+5MqC4vRpDLDU18YcCcXDLh7lbDQsON8hHtRwygQA38=
X-Google-Smtp-Source: AGHT+IGZEv+CIDPXP0TJ1i+AotzbFz5H7fqitUI/2i1sh33JfiQ5E7D0YHElItOMq6UM8jVLtSM+jA==
X-Received: by 2002:ac2:47e8:0:b0:521:7846:69d1 with SMTP id
 2adb3069b0e04-526be6ea784mr995436e87.6.1716375064461; 
 Wed, 22 May 2024 03:51:04 -0700 (PDT)
Received: from umbar.lan ([192.130.178.91]) by smtp.gmail.com with ESMTPSA id
 2adb3069b0e04-52431778ec8sm1279126e87.194.2024.05.22.03.51.03
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Wed, 22 May 2024 03:51:04 -0700 (PDT)
From: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
Date: Wed, 22 May 2024 13:51:00 +0300
Subject: [PATCH v2 08/14] drm/msm/hdmi: add runtime PM calls to DDC
 transfer function
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20240522-fd-hdmi-hpd-v2-8-c30bdb7c5c7e@linaro.org>
References: <20240522-fd-hdmi-hpd-v2-0-c30bdb7c5c7e@linaro.org>
In-Reply-To: <20240522-fd-hdmi-hpd-v2-0-c30bdb7c5c7e@linaro.org>
To: Rob Clark <robdclark@gmail.com>, 
 Abhinav Kumar <quic_abhinavk@quicinc.com>, 
 Dmitry Baryshkov <dmitry.baryshkov@linaro.org>, Sean Paul <sean@poorly.run>, 
 Marijn Suijten <marijn.suijten@somainline.org>, 
 David Airlie <airlied@gmail.com>, Daniel Vetter <daniel@ffwll.ch>
Cc: linux-arm-msm@vger.kernel.org, dri-devel@lists.freedesktop.org, 
 freedreno@lists.freedesktop.org, linux-kernel@vger.kernel.org
X-Mailer: b4 0.13.0
X-Developer-Signature: v=1; a=openpgp-sha256; l=1518;
 i=dmitry.baryshkov@linaro.org; h=from:subject:message-id;
 bh=Jgttl5H44Vld14qWMns1jroXWg5YOpL1Dc2oQSS9ypw=;
 b=owGbwMvMwMXYbdNlx6SpcZXxtFoSQ5rvOYH/AvxRXG5PuivCtgZbTDkzq5nVPWvqSuvbF7bJ9
 rk0FuZ2MhqzMDByMciKKbL4FLRMjdmUHPZhx9R6mEGsTCBTGLg4BWAik8U4GBpOrL91US2S2SFV
 9ZCs0o4mLsaQ+M5Xpdm66VVdr8SybSZkrV92JVMh3kPGLmgR67tHLIlF57/r1jWJRc/4UDnxY+m
 eeTJx0/alXEoTqJaWKljNnD9vmuILxjDFKMP8sMMFJ0svhu7uyJeqCn45Q3lKZMEFZq9JrYpvfy
 y7FHL66gttO929211S1l5RmLlJsmeSBLf7boZrZzszPBmMFyzbI5fVJGMSfdl5+4nyf9t1vyXP/
 PukZV1B4yyra3/OSLzOcK6Z+CnSfLVGYfnVbwyO/6VbMg801y/ROpJzgLss7q1uTcbtjao+B2Tf
 7zvHoJK1ZYrOpKDmdXeWHam/tVr6j4H+YcHFqf7lBVKnAQ==
X-Developer-Key: i=dmitry.baryshkov@linaro.org; a=openpgp;
 fpr=8F88381DD5C873E4AE487DA5199BF1243632046A
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
index 7aa500d24240..ebefea4fb408 100644
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

