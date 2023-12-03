Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 3DA0C802011
	for <lists+dri-devel@lfdr.de>; Sun,  3 Dec 2023 01:32:15 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 2C15F10E250;
	Sun,  3 Dec 2023 00:32:10 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-lf1-x129.google.com (mail-lf1-x129.google.com
 [IPv6:2a00:1450:4864:20::129])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 9F32F10E241
 for <dri-devel@lists.freedesktop.org>; Sun,  3 Dec 2023 00:32:06 +0000 (UTC)
Received: by mail-lf1-x129.google.com with SMTP id
 2adb3069b0e04-50bf32c0140so43054e87.1
 for <dri-devel@lists.freedesktop.org>; Sat, 02 Dec 2023 16:32:06 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=linaro.org; s=google; t=1701563525; x=1702168325; darn=lists.freedesktop.org;
 h=content-transfer-encoding:mime-version:message-id:date:subject:cc
 :to:from:from:to:cc:subject:date:message-id:reply-to;
 bh=H1sh+e6WV9mxF+sYcaPaBBaaZreS9crd7exAJRUxSZY=;
 b=zBnjbnXkEf0oQbgWzKEge0QMb0c70t+khmuRP5rI+opA5Ht5Cb0zyoH6BZ/VSHKAF8
 /CWTwSjKaq9FtWibW+k1FI3XidXBZ4tkIh0K4XZZpoyn46F7V/HABN8wM+wWktKa06Je
 6XjHe5j8BoC2bk5E2I+9c9KXP9bKRcp0AgnRnLVlPJ1/WlM7S8WYvCZfNHg3dlLLm3v7
 lIUtkoKqehx64AtF0FFJfhN7lCqOXYvHoT8IoHtZi9PJcB2uhdAV3/yyKXb+TrRO8ne5
 mI8E53godvwr/OTK1FrB7sIZaBH0aXb9KDUmWRupb2AxtpewZRvzr4ESGo3/FpWw1VSB
 Hq6w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1701563525; x=1702168325;
 h=content-transfer-encoding:mime-version:message-id:date:subject:cc
 :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
 :reply-to;
 bh=H1sh+e6WV9mxF+sYcaPaBBaaZreS9crd7exAJRUxSZY=;
 b=GpWDx9fAf2gCmvO28W1A+PZOoDevsOD3zrm6yLtulwgg0/yRNP+QKt8UBGPR+xYhIL
 lX1ToZNnY6vKeWdAivj0fBOrNSD23E63/GnOR+Cihk7+pZx5hNIhC3wGyBxUn7/CT2Aa
 TzPyqWNHiXkVl0LisCrIMXV1tqNnAUGtgnvZpwH1kfM2ADorK3Oxc3xw7IZBrLUt3Pcq
 rYWF7i6ePYIdp/Utln5MOqt79XYGb5luY5jQmAMPH+HyQ28bOclvi6rLGi3CLRZxwmGU
 89MWb5p+ipVudPa7OaVo/aZgERJRHjtXYM86OwEEuQADhMZ3KwTmnRmjzZcJiy+WC4tG
 a6qQ==
X-Gm-Message-State: AOJu0YyU0a/fS22MXnXY+pS3SQb3HmUuIH36kB8+TmQG3PicAHNHzTu5
 R6n+JDJ0iGUZaDhuhooaIDhxhQ==
X-Google-Smtp-Source: AGHT+IExV7d8TC5LUgJOCMr0Y0PtwxL8cWlbUdf980HQHway8QjDisIeQIpeJucyZJBGGAgpBBjIGQ==
X-Received: by 2002:a05:6512:3e09:b0:50b:d764:64d1 with SMTP id
 i9-20020a0565123e0900b0050bd76464d1mr2401906lfv.134.1701563524761; 
 Sat, 02 Dec 2023 16:32:04 -0800 (PST)
Received: from umbar.unikie.fi ([192.130.178.91])
 by smtp.gmail.com with ESMTPSA id
 i7-20020ac25b47000000b0050ba4a26fccsm422408lfp.117.2023.12.02.16.32.04
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Sat, 02 Dec 2023 16:32:04 -0800 (PST)
From: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
To: Rob Clark <robdclark@gmail.com>, Sean Paul <sean@poorly.run>,
 Abhinav Kumar <quic_abhinavk@quicinc.com>,
 Marijn Suijten <marijn.suijten@somainline.org>
Subject: [RFT PATCH v2 0/4] drm/msm/dpu: enable writeback on the other
 platforms
Date: Sun,  3 Dec 2023 03:31:59 +0300
Message-Id: <20231203003203.1293087-1-dmitry.baryshkov@linaro.org>
X-Mailer: git-send-email 2.39.2
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

I was not able to test it on my own, this is a call for testing for the
owners of these platforms. The git version of modetest now fully
supports writeback.

Use libdrm >= 2.4.117, run modetest -ac to determine the writeback
connector, cat /sys/kernel/debug/dri/0/state to determine
spare CRTC and plane, then run something like:

modetest -M msm -a -s 36@85:1024x768 -o test.d -P 79@85:1024x768

where 36 is the Writeback connector id, 85 is CRTC and 79 is the plane.

Then press Enter and check the test.d file for the raw image dump.

Changes since v1:
- Fixed the DPU_CLK_CTRL_WB2 definition

Dmitry Baryshkov (4):
  drm/msm/dpu: enable writeback on SM8150
  drm/msm/dpu: enable writeback on SC8108X
  drm/msm/dpu: enable writeback on SM6125
  drm/msm/dpu: enable writeback on SM6350

 .../drm/msm/disp/dpu1/catalog/dpu_5_0_sm8150.h | 18 ++++++++++++++++++
 .../msm/disp/dpu1/catalog/dpu_5_1_sc8180x.h    | 18 ++++++++++++++++++
 .../drm/msm/disp/dpu1/catalog/dpu_5_4_sm6125.h | 18 ++++++++++++++++++
 .../drm/msm/disp/dpu1/catalog/dpu_6_4_sm6350.h | 18 ++++++++++++++++++
 4 files changed, 72 insertions(+)

-- 
2.39.2

