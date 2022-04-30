Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id D0F2C515FAE
	for <lists+dri-devel@lfdr.de>; Sat, 30 Apr 2022 19:55:41 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id F200010E25A;
	Sat, 30 Apr 2022 17:55:37 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-lf1-x131.google.com (mail-lf1-x131.google.com
 [IPv6:2a00:1450:4864:20::131])
 by gabe.freedesktop.org (Postfix) with ESMTPS id D9FB010E44C
 for <dri-devel@lists.freedesktop.org>; Sat, 30 Apr 2022 17:55:36 +0000 (UTC)
Received: by mail-lf1-x131.google.com with SMTP id t25so19064344lfg.7
 for <dri-devel@lists.freedesktop.org>; Sat, 30 Apr 2022 10:55:36 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=from:to:cc:subject:date:message-id:mime-version
 :content-transfer-encoding;
 bh=5Y45HNTyNT2hIp564O0VhShXCVFtrKbtd8uqrhfCQS8=;
 b=VQO9DA6oWtzvHO2nzA53gzSN26hGTrlLZ9a5daFM9idyeltWKQguBQB9yx02wZL6bp
 RKYT4jp+KBstu5rGLXuQtnZFa0xRTGUXxPcVg9aIwbob59zVgHIYUJuxkR12LjeHEeV2
 hy0Ta9sSF8h0hNdsrAcYYfqF1Jne0eggAHb21qo8WjP7+iM/gpLlXDcfEQcALEmAaSET
 rtHAT270Lga1nzxfjrAUKFk2XuZF9gVWbo6UsgVYqyuOYcjDHijXjzvPmlWuqg3lYr0B
 c/ZoG/2D5etFJjzkZdRDgGxNy90vw3b7tp3zy4Yhx/rqy7V8+RNSgc46wqaVXOMxlEej
 9joA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:mime-version
 :content-transfer-encoding;
 bh=5Y45HNTyNT2hIp564O0VhShXCVFtrKbtd8uqrhfCQS8=;
 b=74Y/dJNsIsgZuQ1+dy4xaht4m5AkhYcs4uXMaBPPo8db7E00sxxWTpgcB8s+mLBC3J
 CIjGTVceMiLBemzrDClv/FZwu2SxQ9CI/70ia+G+VBhNJjMxarTJfEzOiayl2WAoCY12
 A9T5V8m3mFv4O+cmp+9PYRsEdmOXEtac9D5XmtCXrsKBiPMpUCPWrJoiYky9ddTCnkSQ
 A1+oRStj6u7HUJxe6u59Iy28Jkn4t7iUjMmRKma6OUMLo5yTakgr9NeiIHmTNJ5OUlKB
 Yx7daC2zGIAB9bFRJrAnqmak4Ff0D8fB4/TU8mTbrKnkr40nctTyQdsauYGz/AuS5VWr
 EJnw==
X-Gm-Message-State: AOAM531ldFKr2aiQ34FMI2UqbPqMJ/WJ8sZM+SkU0E/7WPl961I54KWo
 j/dW24wlj2NiDQdVV3gfOT2tpQzfK4mrww==
X-Google-Smtp-Source: ABdhPJwQUukHgHTGombGLcoN6OonLQ2X20+3n9oaDC27k5RVejdILlrlv39taysZbQ2Hy4pjVVmbvA==
X-Received: by 2002:a05:6512:3b26:b0:472:44ba:1a37 with SMTP id
 f38-20020a0565123b2600b0047244ba1a37mr3593054lfv.581.1651341335136; 
 Sat, 30 Apr 2022 10:55:35 -0700 (PDT)
Received: from eriador.lan ([37.153.55.125]) by smtp.gmail.com with ESMTPSA id
 u5-20020ac24c25000000b0047255d21179sm240369lfq.168.2022.04.30.10.55.34
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Sat, 30 Apr 2022 10:55:34 -0700 (PDT)
From: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
To: Bjorn Andersson <bjorn.andersson@linaro.org>,
 Rob Clark <robdclark@gmail.com>, Sean Paul <sean@poorly.run>,
 Abhinav Kumar <quic_abhinavk@quicinc.com>
Subject: [PATCH v2] drm/msm/dsi: use RMW cycles in dsi_update_dsc_timing
Date: Sat, 30 Apr 2022 20:55:33 +0300
Message-Id: <20220430175533.3817792-1-dmitry.baryshkov@linaro.org>
X-Mailer: git-send-email 2.35.1
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
Cc: kernel test robot <lkp@intel.com>, David Airlie <airlied@linux.ie>,
 linux-arm-msm@vger.kernel.org, dri-devel@lists.freedesktop.org,
 Stephen Boyd <swboyd@chromium.org>, freedreno@lists.freedesktop.org
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

The downstream uses read-modify-write for updating command mode
compression registers. Let's follow this approach. This also fixes the
following warning:

drivers/gpu/drm/msm/dsi/dsi_host.c:918:23: warning: variable 'reg_ctrl' set but not used [-Wunused-but-set-variable]

Reported-by: kernel test robot <lkp@intel.com>
Fixes: 08802f515c3c ("drm/msm/dsi: Add support for DSC configuration")
Signed-off-by: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
---

Changes since v1:
 - Fix c&p error and apply mask clear to reg_ctrl2 instead of reg_ctrl
   (Abhinav)

---
 drivers/gpu/drm/msm/dsi/dsi_host.c | 5 ++++-
 1 file changed, 4 insertions(+), 1 deletion(-)

diff --git a/drivers/gpu/drm/msm/dsi/dsi_host.c b/drivers/gpu/drm/msm/dsi/dsi_host.c
index c983698d1384..a95d5df52653 100644
--- a/drivers/gpu/drm/msm/dsi/dsi_host.c
+++ b/drivers/gpu/drm/msm/dsi/dsi_host.c
@@ -961,10 +961,13 @@ static void dsi_update_dsc_timing(struct msm_dsi_host *msm_host, bool is_cmd_mod
 		reg_ctrl = dsi_read(msm_host, REG_DSI_COMMAND_COMPRESSION_MODE_CTRL);
 		reg_ctrl2 = dsi_read(msm_host, REG_DSI_COMMAND_COMPRESSION_MODE_CTRL2);
 
+		reg_ctrl &= ~0xffff;
 		reg_ctrl |= reg;
+
+		reg_ctrl2 &= ~DSI_COMMAND_COMPRESSION_MODE_CTRL2_STREAM0_SLICE_WIDTH__MASK;
 		reg_ctrl2 |= DSI_COMMAND_COMPRESSION_MODE_CTRL2_STREAM0_SLICE_WIDTH(bytes_in_slice);
 
-		dsi_write(msm_host, REG_DSI_COMMAND_COMPRESSION_MODE_CTRL, reg);
+		dsi_write(msm_host, REG_DSI_COMMAND_COMPRESSION_MODE_CTRL, reg_ctrl);
 		dsi_write(msm_host, REG_DSI_COMMAND_COMPRESSION_MODE_CTRL2, reg_ctrl2);
 	} else {
 		dsi_write(msm_host, REG_DSI_VIDEO_COMPRESSION_MODE_CTRL, reg);
-- 
2.35.1

