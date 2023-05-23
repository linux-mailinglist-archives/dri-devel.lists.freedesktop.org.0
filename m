Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 5DD0670DC2D
	for <lists+dri-devel@lfdr.de>; Tue, 23 May 2023 14:15:48 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 98A5A10E447;
	Tue, 23 May 2023 12:15:28 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-lf1-x135.google.com (mail-lf1-x135.google.com
 [IPv6:2a00:1450:4864:20::135])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 5076E10E436
 for <dri-devel@lists.freedesktop.org>; Tue, 23 May 2023 12:15:09 +0000 (UTC)
Received: by mail-lf1-x135.google.com with SMTP id
 2adb3069b0e04-4f3af4295ddso4865959e87.2
 for <dri-devel@lists.freedesktop.org>; Tue, 23 May 2023 05:15:09 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=linaro.org; s=google; t=1684844107; x=1687436107;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:from:to:cc:subject:date
 :message-id:reply-to;
 bh=kMftiAUxeR8BPoZkZvXeNvb1WLgqdhL6DsPjfLjpExg=;
 b=ETX+jpQh1MkS/oEmbkm1RFkjIuPTjVkoKZKMQyqb44Ujy6MPxqvuFFRR5Ozv1N0fPL
 IyRB8EvrCQUBDzkstsPROcFAYQ7O6UofNHKb4BgRFu8BpUTjlKD5eVx0dhx3mVAHQr+e
 ozCd+EVp6H33iBFNoDaAnD5i2WIfckcUzBL91i4FYMXFEn7vvogAnsjs9zn53E/hJkK3
 LElwG+XWm/cAFZrLhqcdOPkbMVV/f7Z65RHR/MDV4Mm2ULcy2ilkir4TjCbvjfiTc8iB
 BnpqO61RlUfjK6tn/iGB7tqivbti3PaXHqJ4yeetkBiZ9/Exc43+iHe9sV9rqRdhlFe8
 Px/A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20221208; t=1684844107; x=1687436107;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=kMftiAUxeR8BPoZkZvXeNvb1WLgqdhL6DsPjfLjpExg=;
 b=COoJywzw56GybO/I3TDLeA+VnpBiBPzQRscL+ir1hmM8Rtl/WtKcJxWt/7OPdAhPe2
 JFJO5vnWI5QYiQFW1HxO//+/B8TXdNvERVew/Q5mN2lptDb3beXgeXs/sgmdX/5LrUZt
 YMc5Owbl/OACUXyQ5jcL40Th8qxh6HlpD6y05vUTYxdjD4GHnuS6oPewyXlaGjHCeodh
 4XJb9UJ5ENJD+pSNwpjLmU4M9KGYSNVXNf8KCrHfblT1J+vTvJWbWoeTb7u8QiI2bOdm
 VbA4m+wLQck1pwoZhL4AUjaqReTdElDgekTR1XFfsqyHYZy7qRWPH/oQKKiP1focCxCp
 eVkg==
X-Gm-Message-State: AC+VfDzD2uaQEzpQFyeSxRlWoypuEhURWqihj0c/KbOMMUdUGTPg4urc
 nT9Ku6QgIbI8MNn+Vfm6skDbWw==
X-Google-Smtp-Source: ACHHUZ43GR6mi7FCfEihpvwLYVmk40w1hC6t0c87laL1uoecXBbBd/pseUpVwOps9C9xtYnTi/b2Gw==
X-Received: by 2002:ac2:5fae:0:b0:4ed:b4f9:28c7 with SMTP id
 s14-20020ac25fae000000b004edb4f928c7mr4155100lfe.6.1684844107381; 
 Tue, 23 May 2023 05:15:07 -0700 (PDT)
Received: from eriador.lan ([192.130.178.91]) by smtp.gmail.com with ESMTPSA id
 c26-20020ac2531a000000b004f160559d4asm1319616lfh.183.2023.05.23.05.15.06
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Tue, 23 May 2023 05:15:07 -0700 (PDT)
From: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
To: Rob Clark <robdclark@gmail.com>, Sean Paul <sean@poorly.run>,
 Abhinav Kumar <quic_abhinavk@quicinc.com>,
 Marijn Suijten <marijn.suijten@somainline.org>,
 Vinod Koul <vkoul@kernel.org>, Kishon Vijay Abraham I <kishon@kernel.org>
Subject: [PATCH 12/15] drm/msm/hdmi: set infoframes on all pre_enable calls
Date: Tue, 23 May 2023 15:14:51 +0300
Message-Id: <20230523121454.3460634-13-dmitry.baryshkov@linaro.org>
X-Mailer: git-send-email 2.39.2
In-Reply-To: <20230523121454.3460634-1-dmitry.baryshkov@linaro.org>
References: <20230523121454.3460634-1-dmitry.baryshkov@linaro.org>
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
 Stephen Boyd <swboyd@chromium.org>, Konrad Dybcio <konrad.dybcio@linaro.org>,
 linux-phy@lists.infradead.org
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

In consequent modeset calls, the atomic_pre_enable() will be called
several times without calling atomic_post_disable() inbetween. Thus
iframes will not be updated for the next mode. Fix this by setting the
iframe outside of the !power_on check.

Signed-off-by: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
---
 drivers/gpu/drm/msm/hdmi/hdmi_bridge.c | 9 +++++----
 1 file changed, 5 insertions(+), 4 deletions(-)

diff --git a/drivers/gpu/drm/msm/hdmi/hdmi_bridge.c b/drivers/gpu/drm/msm/hdmi/hdmi_bridge.c
index f9293f7d8f34..bb10b35194ff 100644
--- a/drivers/gpu/drm/msm/hdmi/hdmi_bridge.c
+++ b/drivers/gpu/drm/msm/hdmi/hdmi_bridge.c
@@ -141,10 +141,11 @@ static void msm_hdmi_bridge_atomic_pre_enable(struct drm_bridge *bridge,
 		msm_hdmi_phy_resource_enable(phy);
 		msm_hdmi_power_on(bridge);
 		hdmi->power_on = true;
-		if (hdmi->hdmi_mode) {
-			msm_hdmi_config_avi_infoframe(hdmi);
-			msm_hdmi_audio_update(hdmi);
-		}
+	}
+
+	if (hdmi->hdmi_mode) {
+		msm_hdmi_config_avi_infoframe(hdmi);
+		msm_hdmi_audio_update(hdmi);
 	}
 
 	msm_hdmi_phy_powerup(phy, hdmi->pixclock);
-- 
2.39.2

