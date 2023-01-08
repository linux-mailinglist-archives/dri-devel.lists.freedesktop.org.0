Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id E2AFD661709
	for <lists+dri-devel@lfdr.de>; Sun,  8 Jan 2023 17:57:31 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 37F2910E208;
	Sun,  8 Jan 2023 16:57:09 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-lf1-x133.google.com (mail-lf1-x133.google.com
 [IPv6:2a00:1450:4864:20::133])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 97D6510E1F7
 for <dri-devel@lists.freedesktop.org>; Sun,  8 Jan 2023 16:57:05 +0000 (UTC)
Received: by mail-lf1-x133.google.com with SMTP id d30so4621134lfv.8
 for <dri-devel@lists.freedesktop.org>; Sun, 08 Jan 2023 08:57:05 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:from:to:cc:subject:date
 :message-id:reply-to;
 bh=VF5ULjO8Nsom9+kPMKOkmOPhLqLOBqB6rEP7ZLKg/cg=;
 b=fCuyGkhONFBFCIntZiPzrNU6TIwzenYQIrN2R9WluJ7c5pJmfRL/hGq7p1CfhPwoYS
 T3gMB0GBRTcfxJNpUap29X/mSZXIx+gpsfsUVZGw/zx83UW6KHr5lffAQ3wQD2ey31Sm
 uyp+IdZRJNbIZqgEGPBdHYxsjr75Rw3u+MIbKEkJ8wLfU7MFy/HS2fi8epUfGSoHbKy5
 cZf8OLn4AUbqyTRZ6SASGaqJUx6BZJw0CAHH0k+5mJSKPaD3jlewnQweY7Pq9hvs/r+X
 9cI4NS0bWZQuSXmTPvWItQyi4khjU0NSW3nKokb4r7rkKgCXJGnnln03au5am3UEC+lN
 8oXA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=VF5ULjO8Nsom9+kPMKOkmOPhLqLOBqB6rEP7ZLKg/cg=;
 b=yODJXGkgI7p/wG70w8ohBiTmLQTUJxwhp9d+L0phG9suowJLUuewoNtvuwo/X/bwiQ
 QS6fQ5Q/VEFDqBhuQnVfoyIqhSWAX1wuMnrHFuJbgjwogC02pHNtK8kuYIuAYHEQP+qF
 JQ2EC9Ayf/QPQ61f2c485FE+WCHFuX1UfKaAwHU9Qb49wNqoicsmaixUs0BaorwcryhU
 uMMWt0toO/MaCu36T9I0VEs4kfEt9xTZizPQQMoTdCibOT4nNU5dY7M88DJwr0hMAdXc
 48v50Q+BroPZ54rJgb5TmayEVifLEq7CAq0PZm3h/uqShCSzg3vxuZs4fgcXfdi+BpBB
 YgKg==
X-Gm-Message-State: AFqh2kpCMWaWzaJQXRxGT/HxEVm4AsWX56J6FpUxIZdSgQgDlPjN1PG3
 u/Qr5dOyhYGMKBZNo9VNe/98cQ==
X-Google-Smtp-Source: AMrXdXsBGlNd7jK7tTazi2o3aynBgbzQGJUlQBLnfvsAvlKqPQVEbViC06RKS6edaTT+EN8Tr5e30w==
X-Received: by 2002:ac2:4adb:0:b0:4cc:83a5:e64e with SMTP id
 m27-20020ac24adb000000b004cc83a5e64emr75825lfp.60.1673197025158; 
 Sun, 08 Jan 2023 08:57:05 -0800 (PST)
Received: from eriador.lan (dzccz6yyyyyyyyyyybcwt-3.rev.dnainternet.fi.
 [2001:14ba:a085:4d00::8a5]) by smtp.gmail.com with ESMTPSA id
 s2-20020a056512202200b004b561b211adsm1138323lfs.254.2023.01.08.08.57.04
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Sun, 08 Jan 2023 08:57:04 -0800 (PST)
From: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
To: Vinod Koul <vkoul@kernel.org>, Andrzej Hajda <andrzej.hajda@intel.com>,
 Neil Armstrong <neil.armstrong@linaro.org>,
 Robert Foss <robert.foss@linaro.org>,
 Laurent Pinchart <Laurent.pinchart@ideasonboard.com>,
 Jonas Karlman <jonas@kwiboo.se>, Jernej Skrabec <jernej.skrabec@gmail.com>
Subject: [PATCH v2 10/13] drm/bridge: lt9611: simplify video timings
 programming
Date: Sun,  8 Jan 2023 18:56:53 +0200
Message-Id: <20230108165656.136871-11-dmitry.baryshkov@linaro.org>
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

Inline calculated values to simplify the calculation in
lt9611_mipi_video_setup().

Signed-off-by: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
---
 drivers/gpu/drm/bridge/lontium-lt9611.c | 4 ++--
 1 file changed, 2 insertions(+), 2 deletions(-)

diff --git a/drivers/gpu/drm/bridge/lontium-lt9611.c b/drivers/gpu/drm/bridge/lontium-lt9611.c
index 7f9be74acf0d..1396ab081f61 100644
--- a/drivers/gpu/drm/bridge/lontium-lt9611.c
+++ b/drivers/gpu/drm/bridge/lontium-lt9611.c
@@ -155,12 +155,12 @@ static void lt9611_mipi_video_setup(struct lt9611 *lt9611,
 	hactive = mode->hdisplay;
 	hsync_len = mode->hsync_end - mode->hsync_start;
 	hfront_porch = mode->hsync_start - mode->hdisplay;
-	hsync_porch = hsync_len + mode->htotal - mode->hsync_end;
+	hsync_porch = mode->htotal - mode->hsync_start;
 
 	vactive = mode->vdisplay;
 	vsync_len = mode->vsync_end - mode->vsync_start;
 	vfront_porch = mode->vsync_start - mode->vdisplay;
-	vsync_porch = vsync_len + mode->vtotal - mode->vsync_end;
+	vsync_porch = mode->vtotal - mode->vsync_start;
 
 	regmap_write(lt9611->regmap, 0x830d, (u8)(v_total / 256));
 	regmap_write(lt9611->regmap, 0x830e, (u8)(v_total % 256));
-- 
2.39.0

