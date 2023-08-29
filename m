Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 5E58978CC68
	for <lists+dri-devel@lfdr.de>; Tue, 29 Aug 2023 20:48:03 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 6CB5110E47F;
	Tue, 29 Aug 2023 18:47:49 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-pf1-x42f.google.com (mail-pf1-x42f.google.com
 [IPv6:2607:f8b0:4864:20::42f])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 422A310E49B
 for <dri-devel@lists.freedesktop.org>; Tue, 29 Aug 2023 18:47:47 +0000 (UTC)
Received: by mail-pf1-x42f.google.com with SMTP id
 d2e1a72fcca58-68c0d4cc3a4so2849848b3a.1
 for <dri-devel@lists.freedesktop.org>; Tue, 29 Aug 2023 11:47:47 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=chromium.org; s=google; t=1693334867; x=1693939667;
 darn=lists.freedesktop.org; 
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:from:to:cc:subject:date
 :message-id:reply-to;
 bh=buOYirvM4LTz9UY1JGw3dQAfNg4ODZnJm46kyV7UDeA=;
 b=UTOezsgiZgQsIIwaJZ7dHH4QwU+TdApc0px/lL3Dww0IBMLXpXyMrv6TnncM/EcsgW
 EABT5JarkK5fvXogolCAURtg6mEJgV7BeFzeMeMaN/pc4gChhmMEwtRinzKovLS06oT3
 HYB+huhBa+3CL9pofotgpZED8Uy+vcN6XpY5o=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20221208; t=1693334867; x=1693939667;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=buOYirvM4LTz9UY1JGw3dQAfNg4ODZnJm46kyV7UDeA=;
 b=WOsz/bSoTg/p1U2CiWJ52ojJn66LpDppSTWjUNNQhl23wfkJdqcBJ36999hvaxlQG3
 JXcJ8azDMD2jglnKuxzBzFd4+9RQhr+1yIbEasazo7LWc96J5W7QPc2FFxu5hyP82Kjm
 GpdNkC35ZF1kNPgSS0waQI5DZqIP88J5isIfwom+Acx/qsD29eqUBFVPCBOkldRoIv9D
 iHEOFyPFZL3yY0Tp1Sxc7DMIclOIx7FYlE3mMJ+aux1/37kM9bEf3touF+ilyb+vhjxQ
 VkMxCu1YX99G2OSN4HxtdNhyU/j2CAVXZgOBAfWEOU+nkEfBDn95DFuoCsj/l8aKo46k
 9PoA==
X-Gm-Message-State: AOJu0Yxr3osTv+8i5zxDnHUJFZRC7Z1Fyk3kAUY0WVHU9MMupsxLTX3F
 JyaRkpqEN7sBlp5I7QHv/JrQyw==
X-Google-Smtp-Source: AGHT+IGoA9R8jy+DLGU8vBrurRLkpQ3/Zg84i8rJk8UcpO+wc/82SKC/x3KJjnmNJ9rfBhL040LnrA==
X-Received: by 2002:a05:6a20:729d:b0:140:4563:2243 with SMTP id
 o29-20020a056a20729d00b0014045632243mr138196pzk.50.1693334866790; 
 Tue, 29 Aug 2023 11:47:46 -0700 (PDT)
Received: from smtp.gmail.com ([2620:15c:11a:201:d603:22a7:5e5e:d239])
 by smtp.gmail.com with ESMTPSA id
 o15-20020a170902d4cf00b001b9e86e05b7sm9697953plg.0.2023.08.29.11.47.45
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Tue, 29 Aug 2023 11:47:46 -0700 (PDT)
From: Stephen Boyd <swboyd@chromium.org>
To: Rob Clark <robdclark@gmail.com>, Abhinav Kumar <quic_abhinavk@quicinc.com>,
 Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
Subject: [PATCH 5/7] drm/msm/dp: Simplify with drm_dp_{max_link_rate,
 max_lane_count}()
Date: Tue, 29 Aug 2023 11:47:30 -0700
Message-ID: <20230829184735.2841739-6-swboyd@chromium.org>
X-Mailer: git-send-email 2.42.0.rc2.253.gd59a3bf2b4-goog
In-Reply-To: <20230829184735.2841739-1-swboyd@chromium.org>
References: <20230829184735.2841739-1-swboyd@chromium.org>
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
Cc: Sean Paul <sean@poorly.run>, linux-kernel@vger.kernel.org,
 dri-devel@lists.freedesktop.org, Vinod Polimera <quic_vpolimer@quicinc.com>,
 patches@lists.linux.dev, Kuogee Hsieh <quic_khsieh@quicinc.com>,
 freedreno@lists.freedesktop.org
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

These are open-coded versions of common functions. Replace them with the
common code to improve readability.

Cc: Vinod Polimera <quic_vpolimer@quicinc.com>
Cc: Kuogee Hsieh <quic_khsieh@quicinc.com>
Signed-off-by: Stephen Boyd <swboyd@chromium.org>
---
 drivers/gpu/drm/msm/dp/dp_panel.c | 4 ++--
 1 file changed, 2 insertions(+), 2 deletions(-)

diff --git a/drivers/gpu/drm/msm/dp/dp_panel.c b/drivers/gpu/drm/msm/dp/dp_panel.c
index 0893522ae158..97ba41593820 100644
--- a/drivers/gpu/drm/msm/dp/dp_panel.c
+++ b/drivers/gpu/drm/msm/dp/dp_panel.c
@@ -58,8 +58,8 @@ static int dp_panel_read_dpcd(struct dp_panel *dp_panel)
 	major = (link_info->revision >> 4) & 0x0f;
 	minor = link_info->revision & 0x0f;
 
-	link_info->rate = drm_dp_bw_code_to_link_rate(dpcd[DP_MAX_LINK_RATE]);
-	link_info->num_lanes = dpcd[DP_MAX_LANE_COUNT] & DP_MAX_LANE_COUNT_MASK;
+	link_info->rate = drm_dp_max_link_rate(dpcd);
+	link_info->num_lanes = drm_dp_max_lane_count(dpcd);
 
 	/* Limit data lanes from data-lanes of endpoint property of dtsi */
 	if (link_info->num_lanes > dp_panel->max_dp_lanes)
-- 
https://chromeos.dev

