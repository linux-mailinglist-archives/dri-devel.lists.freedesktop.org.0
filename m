Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 69CE99A492A
	for <lists+dri-devel@lfdr.de>; Fri, 18 Oct 2024 23:49:28 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id EE51810E9BD;
	Fri, 18 Oct 2024 21:49:25 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=linaro.org header.i=@linaro.org header.b="F36R66Lu";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-lf1-f54.google.com (mail-lf1-f54.google.com
 [209.85.167.54])
 by gabe.freedesktop.org (Postfix) with ESMTPS id ED25B10E9BE
 for <dri-devel@lists.freedesktop.org>; Fri, 18 Oct 2024 21:49:24 +0000 (UTC)
Received: by mail-lf1-f54.google.com with SMTP id
 2adb3069b0e04-53a0c160b94so543940e87.2
 for <dri-devel@lists.freedesktop.org>; Fri, 18 Oct 2024 14:49:24 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=linaro.org; s=google; t=1729288163; x=1729892963; darn=lists.freedesktop.org;
 h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
 :mime-version:subject:date:from:from:to:cc:subject:date:message-id
 :reply-to; bh=Go5ATa3ANcllBgMb3i995a+Tn/9iklS8uo3r/4fZl+Y=;
 b=F36R66LuKG537OMcWvhgMUFYHHNhV6tpLOHDBBorjRfpPHMR6P9eVAN+nzKtODXWTB
 EjeJ/QRZWfCLriYqgZ+fp/ZAhqc2jq+Gyxo8r3XCd6xWXCYorSpslUfn7oFmOg3VT5Ai
 WMvmQs7m90ALVouK451Pa4AGCq4s/GyZdzrYrHT74zmt6WFeJYeocmuvi6Ea64oj7gzv
 UwTqB3K+a2GF6pKOzeM0BRfN7iQiRPS/7/w8RIyhV6LYWrCnv8JJVLNaRJrLqDmqdXTV
 laW/DpnQ4WluYI0NhWK+d1h+ZQ80EIyrF0VVo71LILFgX6DnJ5p3KLpBI0K/Gt3FhhUh
 j2gA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1729288163; x=1729892963;
 h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
 :mime-version:subject:date:from:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=Go5ATa3ANcllBgMb3i995a+Tn/9iklS8uo3r/4fZl+Y=;
 b=RFJ8hg4B6HC2A7nv3CyuKbDXJf5kPUyutwDATXUrY09IbQurxRebEDBrv+AUjWQjk4
 WcOYe09F6bh75x9A7pYWMdD/XLMnzr1/hw4v5mgOwvdeGrUVSeLHEEbzeRrbGu540oGd
 1Z2ysIhBZf6bLJotbGj+1mF+ludinZFwZLvAiOynl3C+KN269zFowXMHFy/J+CRU6sCG
 AUSHGuAgPZwTbfXGNnXBDFubihCI8aUkDdDN6vfG+tf4OOyx65yttcYP4aXQsOfTT4as
 UUu/t2xT/fECeH04y9dgS2fCvw71f5udYhrxUFfC8CVRIP/O08JaqH7wi07XqalWYLzR
 m/rg==
X-Gm-Message-State: AOJu0YxHlr61thoPSrSxdLs/atx3HgnEj7N10Ih2p9rrjSn51Xc+OMfZ
 WWL4vE5cZYbI9hPh2c7fWPgnYwXfJjb2nDW7RfuLhT3d936EUHnQhT7emH1OQkc=
X-Google-Smtp-Source: AGHT+IEo/FMuV8BXcaeTLXW0eKYEblPO9D0Z6JBXczbnQvEt9ytqgCebRe6synIHwL/ExZe7lEvCMQ==
X-Received: by 2002:a05:6512:3c9e:b0:536:a695:942c with SMTP id
 2adb3069b0e04-53a1520be7dmr2388053e87.7.1729288163023; 
 Fri, 18 Oct 2024 14:49:23 -0700 (PDT)
Received: from umbar.lan ([192.130.178.90]) by smtp.gmail.com with ESMTPSA id
 2adb3069b0e04-53a151f0ce5sm332088e87.181.2024.10.18.14.49.21
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Fri, 18 Oct 2024 14:49:21 -0700 (PDT)
From: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
Date: Sat, 19 Oct 2024 00:49:13 +0300
Subject: [PATCH 2/6] drm/atomic: add interlaced and ycbcr_420 flags to
 connector's state dump
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20241019-bridge-yuv420-v1-2-d74efac9e4e6@linaro.org>
References: <20241019-bridge-yuv420-v1-0-d74efac9e4e6@linaro.org>
In-Reply-To: <20241019-bridge-yuv420-v1-0-d74efac9e4e6@linaro.org>
To: Andrzej Hajda <andrzej.hajda@intel.com>, 
 Neil Armstrong <neil.armstrong@linaro.org>, Robert Foss <rfoss@kernel.org>, 
 Laurent Pinchart <Laurent.pinchart@ideasonboard.com>, 
 Jonas Karlman <jonas@kwiboo.se>, Jernej Skrabec <jernej.skrabec@gmail.com>, 
 Maarten Lankhorst <maarten.lankhorst@linux.intel.com>, 
 Maxime Ripard <mripard@kernel.org>, Thomas Zimmermann <tzimmermann@suse.de>, 
 David Airlie <airlied@gmail.com>, Simona Vetter <simona@ffwll.ch>, 
 Rob Clark <robdclark@gmail.com>, Abhinav Kumar <quic_abhinavk@quicinc.com>, 
 Sean Paul <sean@poorly.run>, Marijn Suijten <marijn.suijten@somainline.org>
Cc: dri-devel@lists.freedesktop.org, linux-kernel@vger.kernel.org, 
 linux-arm-msm@vger.kernel.org, freedreno@lists.freedesktop.org
X-Mailer: b4 0.14.0
X-Developer-Signature: v=1; a=openpgp-sha256; l=1201;
 i=dmitry.baryshkov@linaro.org; h=from:subject:message-id;
 bh=bRmnoe4tVoeG590rXiMuIqAybo/BJ38wHNkcgqIlmso=;
 b=owEBbQGS/pANAwAKAYs8ij4CKSjVAcsmYgBnEtfdV58nH3hPAsgrDZ9l/GYMAVX0S0QXyB3Om
 au9VDJz5tGJATMEAAEKAB0WIQRMcISVXLJjVvC4lX+LPIo+Aiko1QUCZxLX3QAKCRCLPIo+Aiko
 1VjhCACxMe6Efsk0jMD+km71rST56+FRiTPqH+ulz1SSX9gFC5ae64pRNdtVSouzjEQta4XWO55
 TR8odbc1YUb62bW4jdPyQ6hWGQ+m2pnJ76JcZTNomBlvh9WBURN/nn7j3Izw6QJK3o/hozejaOu
 VVfbcWJGzREM7vnHQV3i5fpBqIbd31u9+zf4karPkxgVnUj+6FuOCVsmV/Fp1rRJZQKlpiKq0yd
 MRJFtyJTPKHvXbPGc/wautX5WvPq9TLXrfb8bbaATPxf3th7DP5WbsDfNMSyrfyOjEMsspoQ8Jd
 YGmInnt4UhpdCGWANP5rPQGdkFDWgZc3Rs/ou8nS5YNF2/Go
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

Although the interlace_allowed and ycbcr_420_allowed flags are a part of
the struct drm_connector rather than struct drm_connector_state, still
include them into state dump in order to ease debugging of the setup
issues.

Signed-off-by: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
---
 drivers/gpu/drm/drm_atomic.c | 2 ++
 1 file changed, 2 insertions(+)

diff --git a/drivers/gpu/drm/drm_atomic.c b/drivers/gpu/drm/drm_atomic.c
index 0fc99da93afe..9ea2611770f4 100644
--- a/drivers/gpu/drm/drm_atomic.c
+++ b/drivers/gpu/drm/drm_atomic.c
@@ -1132,6 +1132,8 @@ static void drm_atomic_connector_print_state(struct drm_printer *p,
 	drm_printf(p, "connector[%u]: %s\n", connector->base.id, connector->name);
 	drm_printf(p, "\tcrtc=%s\n", state->crtc ? state->crtc->name : "(null)");
 	drm_printf(p, "\tself_refresh_aware=%d\n", state->self_refresh_aware);
+	drm_printf(p, "\tinterlace_allowed=%d\n", connector->interlace_allowed);
+	drm_printf(p, "\tycbcr_420_allowed=%d\n", connector->ycbcr_420_allowed);
 	drm_printf(p, "\tmax_requested_bpc=%d\n", state->max_requested_bpc);
 	drm_printf(p, "\tcolorspace=%s\n", drm_get_colorspace_name(state->colorspace));
 

-- 
2.39.5

