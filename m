Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 7D29A4ECFA8
	for <lists+dri-devel@lfdr.de>; Thu, 31 Mar 2022 00:30:22 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id A771110EB4F;
	Wed, 30 Mar 2022 22:30:16 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-lf1-x135.google.com (mail-lf1-x135.google.com
 [IPv6:2a00:1450:4864:20::135])
 by gabe.freedesktop.org (Postfix) with ESMTPS id F30D210EB32
 for <dri-devel@lists.freedesktop.org>; Wed, 30 Mar 2022 22:30:14 +0000 (UTC)
Received: by mail-lf1-x135.google.com with SMTP id p15so38288628lfk.8
 for <dri-devel@lists.freedesktop.org>; Wed, 30 Mar 2022 15:30:14 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=rpqBTpUpCdXhEBEq/E7SmvSY4o1PiwCRJgZfj9SmfN0=;
 b=SnVG0EEs4PG1+YDicQuYa216zYMYgevvP/UzMEUO22qY3OOxe0BF1b9XMBa/ecXQMh
 E/Bso4ecic0stommXyZiP+H33QQaVECpIvnEaT7QLZDJDvQn54ZSdQE5Gh44wK+M0+XH
 UhQihI/gx1RI9EQurSJavIsw5TIP1AFVkN8BpB3dp8EwG5V/GhENwNxmb+NUHdefMuGf
 ERgpQcbq/LboeRNj82U0koSs2YM4tPLxo2P8/vbJxeXH7NcCWdKqr5qVjUxIe7ZGLZGi
 EX+s+SwKHwTZsU87YNLBfv4L7mylnhcVIAn6mhX+s8wqMJFstI7V8Ew2vJPPCiXn7CTB
 qSCg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=rpqBTpUpCdXhEBEq/E7SmvSY4o1PiwCRJgZfj9SmfN0=;
 b=NlYiCvSNI1v3XrvnWcEwdnb7u276QdlcmidaYp4QNoMYpQ1d3Uo87VwccQom8nJm1e
 UPdIcKVoEZvpgmeDZ3fDQJYvRLixkhOPGIH7tU+Qtng+uVNuIOvP0vwMrV+H4fMZ58Ic
 IoxgtX2G7JgEWbcQw/tbPv9GgtcCQuqvNqujB2gLNkuPn5V0jfrno6E49+Pg/8ajdfHc
 Vyybbj4MQDY5BmrbgBdwzebBg66cr6sCc8IyLrx0XyPeGK9909kL8knu0PLbytubtq86
 XPgCXwrWFtVsVveCwsyStRvWCHfnoBRNKuAP2TIlhB8UifJNxiECzCH3np9Qgzltv4gG
 LURA==
X-Gm-Message-State: AOAM5319zGsH6jmeu+XHIHmoOwAl25UVxiXUQBXlNAkgjXOkRPrO15Nl
 XoW0MLcPGfOoaNWuvfZdobBwWg==
X-Google-Smtp-Source: ABdhPJwGjBpbdhdnjRwao/4Ifr2JOjVvqOmqEQ9SfzzOCa3l5eyKcNUesclMb3AlyoajdCZM8CUH7Q==
X-Received: by 2002:a05:6512:31cb:b0:44a:1311:60e4 with SMTP id
 j11-20020a05651231cb00b0044a131160e4mr8488470lfe.521.1648679413241; 
 Wed, 30 Mar 2022 15:30:13 -0700 (PDT)
Received: from eriador.lan ([37.153.55.125]) by smtp.gmail.com with ESMTPSA id
 a4-20020a2eb164000000b0024988e1cfb6sm2521295ljm.94.2022.03.30.15.30.12
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Wed, 30 Mar 2022 15:30:12 -0700 (PDT)
From: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
To: Bjorn Andersson <bjorn.andersson@linaro.org>,
 Rob Clark <robdclark@gmail.com>, Sean Paul <sean@poorly.run>,
 Abhinav Kumar <quic_abhinavk@quicinc.com>,
 Kuogee Hsieh <quic_khsieh@quicinc.com>,
 Sankeerth Billakanti <quic_sbillaka@quicinc.com>
Subject: [PATCH v2 4/4] drm/msm/dp: make dp_connector_mode_valid() more precise
Date: Thu, 31 Mar 2022 01:30:08 +0300
Message-Id: <20220330223008.649274-5-dmitry.baryshkov@linaro.org>
X-Mailer: git-send-email 2.35.1
In-Reply-To: <20220330223008.649274-1-dmitry.baryshkov@linaro.org>
References: <20220330223008.649274-1-dmitry.baryshkov@linaro.org>
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

Make dp_connector_mode_valid() return precise MODE_CLOCK_HIGH rather
than generic MODE_BAD in case the mode clock is higher than
DP_MAX_PIXEL_CLK_KHZ (675 MHz).

Signed-off-by: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
---
 drivers/gpu/drm/msm/dp/dp_drm.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/drivers/gpu/drm/msm/dp/dp_drm.c b/drivers/gpu/drm/msm/dp/dp_drm.c
index a94c9b34f397..3225435fa81b 100644
--- a/drivers/gpu/drm/msm/dp/dp_drm.c
+++ b/drivers/gpu/drm/msm/dp/dp_drm.c
@@ -89,7 +89,7 @@ static enum drm_mode_status dp_connector_mode_valid(
 	dp_disp = to_dp_connector(connector)->dp_display;
 
 	if (mode->clock > DP_MAX_PIXEL_CLK_KHZ)
-		return MODE_BAD;
+		return MODE_CLOCK_HIGH;
 
 	return dp_display_validate_mode(dp_disp, mode->clock);
 }
-- 
2.35.1

