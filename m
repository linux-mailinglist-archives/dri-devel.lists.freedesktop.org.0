Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 639EB85A353
	for <lists+dri-devel@lfdr.de>; Mon, 19 Feb 2024 13:31:15 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 6575510E3BC;
	Mon, 19 Feb 2024 12:31:11 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=linaro.org header.i=@linaro.org header.b="vRqbgX4M";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-lf1-f53.google.com (mail-lf1-f53.google.com
 [209.85.167.53])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 6BDB710E3AF
 for <dri-devel@lists.freedesktop.org>; Mon, 19 Feb 2024 12:30:53 +0000 (UTC)
Received: by mail-lf1-f53.google.com with SMTP id
 2adb3069b0e04-512b85d03daso438063e87.1
 for <dri-devel@lists.freedesktop.org>; Mon, 19 Feb 2024 04:30:53 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=linaro.org; s=google; t=1708345851; x=1708950651; darn=lists.freedesktop.org;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:from:to:cc:subject:date
 :message-id:reply-to;
 bh=kjMb4d1hbiL9rkEx3BrswRg3MQUneLIxmtF5Ztvz0jI=;
 b=vRqbgX4MY4PizADug5Zf5ddEAIwBFh1hRB65L4mO0d+p7+nlmuzkg/FOZJBHzF21RF
 Zmd/HKkzw5FeIrlv619iW3760kMQVEstn49rQuzYQQxgLqSB1nCpHYQN5jrcx/RNoK1p
 1uRHIUW+ja9j9XLd11R8FS/8UWJ1JZ6Mdo8ceTcj7pFdkaYQE0gSVIzQ13HZboD/KfrF
 0PNSVxR9KXkSdsS3gcAXW37+FbSaTQcGKJNVwoXZVynrxLRv4zMOtv+kJEjUCMt20EFd
 vhzC/Hpd2jaF6YP4ziLhg8g0PoYBvg86SMngWRmU5qbiMTQHkwiRA67Quv4FRLxqpBcc
 DKWg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1708345851; x=1708950651;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=kjMb4d1hbiL9rkEx3BrswRg3MQUneLIxmtF5Ztvz0jI=;
 b=sDO/P4Or+cxxGnq1Xg02yTSzjvfghC40V9bd1/fb5qrIuJLtRcuH6dYPZL76tg/etL
 N85nzzzxvIuHpGgr5XGE+J2maV7P8QqhCcx5j828JQmEwCNLFwzW10vTB7Jh9yHIsreK
 0paD3FDtJa5GqNn/Q0ICKvYYBqtv1UoohTfVH7yWRP7f+lLP2hnRMfO/j3glQMPpl4tP
 73BNm1wSGRn8DIBjiduYYdz8U0bfDKzs+aMxlriaPkbmxq+8c4v/4b5QHiBbFQzxeqph
 EaHe4BWVwCubHqvg++4lyHEJMCIDYXrMSqTMo/4qyFEZATrEfQJOuKmckg5MBseZWdTJ
 uyHQ==
X-Forwarded-Encrypted: i=1;
 AJvYcCWA3RZ6ZLqIfyR9cE4DNQ61Nr9mL3EsFE5KlRJgsXwc6P+TzIm7TmcIBaDu/UGZu1T9X+Vd+RKmNy5pR8dldRIx4yVl8gchVEIC/t9bt4pU
X-Gm-Message-State: AOJu0Yz5q0LE80+cig5S2fwURPZsZMjAmiF6G23NPr2HAdaZ3Fh24ceZ
 nuqZfIASfbEj+9HDvyiLrbyM9b+BS6/XhcFZrBzZZwlVZ5oYGh9pMZQKF5/XgG3aGBhny8bcxSF
 2
X-Google-Smtp-Source: AGHT+IFsnM5T1SLVsoU88JG+DcwZETnLSFkjv32tNAhdISToncKjt/6wK4uHEKC7yxoH4WxJY1IvhQ==
X-Received: by 2002:a05:6512:b86:b0:512:b39b:9768 with SMTP id
 b6-20020a0565120b8600b00512b39b9768mr955071lfv.31.1708345851583; 
 Mon, 19 Feb 2024 04:30:51 -0800 (PST)
Received: from umbar.unikie.fi ([192.130.178.91])
 by smtp.gmail.com with ESMTPSA id
 i6-20020ac25226000000b00512bde4cddfsm90466lfl.148.2024.02.19.04.30.50
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Mon, 19 Feb 2024 04:30:51 -0800 (PST)
From: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
To: Rob Clark <robdclark@gmail.com>, Abhinav Kumar <quic_abhinavk@quicinc.com>,
 Sean Paul <sean@poorly.run>, David Airlie <airlied@gmail.com>,
 Daniel Vetter <daniel@ffwll.ch>,
 Marijn Suijten <marijn.suijten@somainline.org>
Cc: linux-arm-msm@vger.kernel.org, dri-devel@lists.freedesktop.org,
 freedreno@lists.freedesktop.org, linux-kernel@vger.kernel.org
Subject: Re: [PATCH] drm/msm/dsi: Replace dsi_get_bpp() with mipi_dsi header
 function
Date: Mon, 19 Feb 2024 14:30:39 +0200
Message-Id: <170834569503.2610898.3555817415070936483.b4-ty@linaro.org>
X-Mailer: git-send-email 2.39.2
In-Reply-To: <20240204-drm-msm-dsi-remove-open-coded-get-bpp-v1-1-c16212de7e86@somainline.org>
References: <20240204-drm-msm-dsi-remove-open-coded-get-bpp-v1-1-c16212de7e86@somainline.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
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
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>


On Sun, 04 Feb 2024 18:04:39 +0100, Marijn Suijten wrote:
> drm_mipi_dsi.h already provides a conversion function from MIPI_DSI_FMT_
> to bpp, named mipi_dsi_pixel_format_to_bpp().
> 
> 

Applied, thanks!

[1/1] drm/msm/dsi: Replace dsi_get_bpp() with mipi_dsi header function
      https://gitlab.freedesktop.org/lumag/msm/-/commit/99d519fed75b

Best regards,
-- 
Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
