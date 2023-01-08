Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id DEE826616F4
	for <lists+dri-devel@lfdr.de>; Sun,  8 Jan 2023 17:57:13 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 2A81D10E05F;
	Sun,  8 Jan 2023 16:57:02 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-lf1-x12f.google.com (mail-lf1-x12f.google.com
 [IPv6:2a00:1450:4864:20::12f])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 1E85810E070
 for <dri-devel@lists.freedesktop.org>; Sun,  8 Jan 2023 16:57:01 +0000 (UTC)
Received: by mail-lf1-x12f.google.com with SMTP id j17so9544276lfr.3
 for <dri-devel@lists.freedesktop.org>; Sun, 08 Jan 2023 08:57:01 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:from:to:cc:subject:date
 :message-id:reply-to;
 bh=T9VtndEU9TW3RLFSiBZfc8etzz7z8EaiINnNdBxR7Gk=;
 b=LOaWt0nMZCQMlu/kyhyiFkMmbHnIEYfWIz1Lq09jNRTVo9RvD556KCXF7kHX4y234i
 0rDkmmIB0QA6oY/xLhBvWM17IM3Pt7GcoJHb/5CoYsW2JoNAiUiCUgiQPaWeBO/uyB/p
 8l+r0OY1ZtPu3xYYYGZN+gJPQcMnoAzbQ0QaQn0S+xSqdI8ZInYY+tn9SVFVitOmRCrY
 iZdeFZJgYpMmVvMrXOuu608o2DzR3ylTMiD9vxC0PhdJvOJMRoDWzF3HZq4S+8v+i1Xr
 UO5yrSWKMJaKe7aNESA1UgBPwBiRyMwScg+kZikbtVZdCFzH2LEIa4uhZzQLYOg2/y8v
 5QYg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=T9VtndEU9TW3RLFSiBZfc8etzz7z8EaiINnNdBxR7Gk=;
 b=OmsbBYHv9KgeV76nPs63wxG7NrWYSrA3v6Cwk9Jx5kP9Ofcl7ujw3NdG0w1c4/AmAj
 RXv3bpWvfNiwHVbVkVsYARk4PWA8jlAcS0koBL0V77+ICzpNyuIJLT8TzP/8Ns/HRowv
 O6WmTQWFysy8xFBjcs1gt64NWim/j2WUzf6b1IAmukPgOFANQOmWPwMKnvHuEHHQO1Cc
 T2E4624BXsvRsxwr2Lilh60B02rKLArxO4DQEXQWPQ9GFnopd4dSyTXRqGLxF4jhLXtf
 LXUbk9hFWSyjUvsiy2DcNB+NnSUY0K+Y1gpwwdmetjNVKG/pYo8BicohDjXE5lKjPsgO
 6wfQ==
X-Gm-Message-State: AFqh2kr+k2QOrjln1gP8wNDPQ4NJBNMGJAI2MOwtlH+ANBRiskgH294J
 c6arrl5/SG2In09iw5ZUqv2hUA==
X-Google-Smtp-Source: AMrXdXtCpM5eXruHKS1u8QD4S2xnCLMW2hGmMU07tlOqcgJWEyfhmZKtxavj5iYb1WxbM18EFmM9Sw==
X-Received: by 2002:a05:6512:31ce:b0:4cc:7258:f178 with SMTP id
 j14-20020a05651231ce00b004cc7258f178mr2109800lfe.59.1673197020705; 
 Sun, 08 Jan 2023 08:57:00 -0800 (PST)
Received: from eriador.lan (dzccz6yyyyyyyyyyybcwt-3.rev.dnainternet.fi.
 [2001:14ba:a085:4d00::8a5]) by smtp.gmail.com with ESMTPSA id
 s2-20020a056512202200b004b561b211adsm1138323lfs.254.2023.01.08.08.57.00
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Sun, 08 Jan 2023 08:57:00 -0800 (PST)
From: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
To: Vinod Koul <vkoul@kernel.org>, Andrzej Hajda <andrzej.hajda@intel.com>,
 Neil Armstrong <neil.armstrong@linaro.org>,
 Robert Foss <robert.foss@linaro.org>,
 Laurent Pinchart <Laurent.pinchart@ideasonboard.com>,
 Jonas Karlman <jonas@kwiboo.se>, Jernej Skrabec <jernej.skrabec@gmail.com>
Subject: [PATCH v2 04/13] drm/bridge: lt9611: fix programming of video modes
Date: Sun,  8 Jan 2023 18:56:47 +0200
Message-Id: <20230108165656.136871-5-dmitry.baryshkov@linaro.org>
X-Mailer: git-send-email 2.39.0
In-Reply-To: <20230108165656.136871-1-dmitry.baryshkov@linaro.org>
References: <20230108165656.136871-1-dmitry.baryshkov@linaro.org>
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
Cc: freedreno@lists.freedesktop.org, dri-devel@lists.freedesktop.org,
 linux-arm-msm@vger.kernel.org
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

Program the upper part of the hfront_porch into the proper register.

Fixes: 23278bf54afe ("drm/bridge: Introduce LT9611 DSI to HDMI bridge")
Signed-off-by: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
---
 drivers/gpu/drm/bridge/lontium-lt9611.c | 3 ++-
 1 file changed, 2 insertions(+), 1 deletion(-)

diff --git a/drivers/gpu/drm/bridge/lontium-lt9611.c b/drivers/gpu/drm/bridge/lontium-lt9611.c
index deb503ca956a..f377052a45a4 100644
--- a/drivers/gpu/drm/bridge/lontium-lt9611.c
+++ b/drivers/gpu/drm/bridge/lontium-lt9611.c
@@ -187,7 +187,8 @@ static void lt9611_mipi_video_setup(struct lt9611 *lt9611,
 
 	regmap_write(lt9611->regmap, 0x8319, (u8)(hfront_porch % 256));
 
-	regmap_write(lt9611->regmap, 0x831a, (u8)(hsync_porch / 256));
+	regmap_write(lt9611->regmap, 0x831a, (u8)(hsync_porch / 256) |
+						((hfront_porch / 256) << 4));
 	regmap_write(lt9611->regmap, 0x831b, (u8)(hsync_porch % 256));
 }
 
-- 
2.39.0

