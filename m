Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 1529D515B58
	for <lists+dri-devel@lfdr.de>; Sat, 30 Apr 2022 10:11:07 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id E3A1910E6D0;
	Sat, 30 Apr 2022 08:11:04 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-lf1-x12a.google.com (mail-lf1-x12a.google.com
 [IPv6:2a00:1450:4864:20::12a])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 5478210EA53
 for <dri-devel@lists.freedesktop.org>; Sat, 30 Apr 2022 08:11:04 +0000 (UTC)
Received: by mail-lf1-x12a.google.com with SMTP id h29so10373002lfj.2
 for <dri-devel@lists.freedesktop.org>; Sat, 30 Apr 2022 01:11:04 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=from:to:cc:subject:date:message-id:mime-version
 :content-transfer-encoding;
 bh=GZFy56yledS7FbOebj4m9u5HtvT4WVnS3R3vI55qw0Y=;
 b=FxBjmuck2yLeExqEqI0/4hM+lFyQKgm6MgQgTDZJWsCgv+WQmHhWJ0+OFyZZatThnC
 h+rP1KUsEIP3jDHHSbIXYE2VChtCjoxzBCHLF96ZiAbwb4isogrggpgc/4cOGERMt4tP
 VAVxX+2h0xBMlMJR0skUcYbI9vJT0GVQs+AH/FjT8kwPsJK98ilsnIGErP185tAPnxZe
 kq7OOSujxRnthquPh14yhykmkeahil3srbXLijco0Xbqa3R2nVxSZeixvtiAgq7wb7uF
 FfXv1E5UPVq/t5GnZtmO8Tb602cXB5sXRxJVFytG7m41iFXvc5SbkI/QoXCUtfUk4iHc
 DRIA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:mime-version
 :content-transfer-encoding;
 bh=GZFy56yledS7FbOebj4m9u5HtvT4WVnS3R3vI55qw0Y=;
 b=2NWgnV2/bGG0rzrWQ1vidrXxQv4vKDdoN0NTmHXZE111FWPNb1kXwACoe3Epealogr
 AB7MblZGunN+yz7VOuLYu+8cwruPeWuOadI5uxZYA6/a184nJe/iwDsl9RXNv3NXwHZu
 TGpP7raOY38YJfkWe/O65xhjVTKn/Ms85rR8pn1pb0hsO/Qk1vnoUBDONzWZ2bTJ+K5y
 dI1Q/RsFx4ZBaMowqAae593qfcLm0RFFP6Dg7e7UUZ7jMWpEvNPNCPwdBpUJ11WsbFN8
 YmTsEBixrhHCdBTSvRgsxGYUkSH9GXfz9tNNC3rIXd1/PZJWkuphBvw+cFx10rCpydQl
 Pm5Q==
X-Gm-Message-State: AOAM531fPSh0BOPHilRt/KscHX01P0IM7waS1YNCqKpHqE28mPCUPx7E
 CtM1yw2/2ntDKjAIB7xigTsfpg==
X-Google-Smtp-Source: ABdhPJxkOTCjGyk9PjuqjQDE8yMj/tC5jWYubB71G3pJVejsP4v96n7KM+iTFlb32edoQpX5qpp/oQ==
X-Received: by 2002:a05:6512:3fa1:b0:44a:f351:5a00 with SMTP id
 x33-20020a0565123fa100b0044af3515a00mr2335727lfa.19.1651306262449; 
 Sat, 30 Apr 2022 01:11:02 -0700 (PDT)
Received: from eriador.lan ([37.153.55.125]) by smtp.gmail.com with ESMTPSA id
 p15-20020a2e9a8f000000b0024f3d1daed6sm478319lji.94.2022.04.30.01.11.01
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Sat, 30 Apr 2022 01:11:02 -0700 (PDT)
From: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
To: Bjorn Andersson <bjorn.andersson@linaro.org>,
 Rob Clark <robdclark@gmail.com>, Sean Paul <sean@poorly.run>,
 Abhinav Kumar <quic_abhinavk@quicinc.com>
Subject: [PATCH] drm/msm/dsi: use RMW cycles in dsi_update_dsc_timing
Date: Sat, 30 Apr 2022 11:11:01 +0300
Message-Id: <20220430081101.3763847-1-dmitry.baryshkov@linaro.org>
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
 Stephen Boyd <swboyd@chromium.org>, Vinod Koul <vkoul@kernel.org>,
 freedreno@lists.freedesktop.org
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
 drivers/gpu/drm/msm/dsi/dsi_host.c | 4 +++-
 1 file changed, 3 insertions(+), 1 deletion(-)

diff --git a/drivers/gpu/drm/msm/dsi/dsi_host.c b/drivers/gpu/drm/msm/dsi/dsi_host.c
index c983698d1384..a5619ad82a53 100644
--- a/drivers/gpu/drm/msm/dsi/dsi_host.c
+++ b/drivers/gpu/drm/msm/dsi/dsi_host.c
@@ -961,10 +961,12 @@ static void dsi_update_dsc_timing(struct msm_dsi_host *msm_host, bool is_cmd_mod
 		reg_ctrl = dsi_read(msm_host, REG_DSI_COMMAND_COMPRESSION_MODE_CTRL);
 		reg_ctrl2 = dsi_read(msm_host, REG_DSI_COMMAND_COMPRESSION_MODE_CTRL2);
 
+		reg_ctrl &= ~0xffff;
 		reg_ctrl |= reg;
+		reg_ctrl &= ~DSI_COMMAND_COMPRESSION_MODE_CTRL2_STREAM0_SLICE_WIDTH__MASK;
 		reg_ctrl2 |= DSI_COMMAND_COMPRESSION_MODE_CTRL2_STREAM0_SLICE_WIDTH(bytes_in_slice);
 
-		dsi_write(msm_host, REG_DSI_COMMAND_COMPRESSION_MODE_CTRL, reg);
+		dsi_write(msm_host, REG_DSI_COMMAND_COMPRESSION_MODE_CTRL, reg_ctrl);
 		dsi_write(msm_host, REG_DSI_COMMAND_COMPRESSION_MODE_CTRL2, reg_ctrl2);
 	} else {
 		dsi_write(msm_host, REG_DSI_VIDEO_COMPRESSION_MODE_CTRL, reg);
-- 
2.35.1

