Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id CDA739A67CE
	for <lists+dri-devel@lfdr.de>; Mon, 21 Oct 2024 14:17:50 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 40EB810E4AC;
	Mon, 21 Oct 2024 12:17:49 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=linaro.org header.i=@linaro.org header.b="M08BePj5";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-lf1-f41.google.com (mail-lf1-f41.google.com
 [209.85.167.41])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 63E3210E4AC
 for <dri-devel@lists.freedesktop.org>; Mon, 21 Oct 2024 12:17:47 +0000 (UTC)
Received: by mail-lf1-f41.google.com with SMTP id
 2adb3069b0e04-539f4d8ef84so4455797e87.0
 for <dri-devel@lists.freedesktop.org>; Mon, 21 Oct 2024 05:17:47 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=linaro.org; s=google; t=1729513065; x=1730117865; darn=lists.freedesktop.org;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:from:to:cc:subject:date
 :message-id:reply-to;
 bh=qj8L6W818gEgHt04vljDAKiaT7pf1UJVmBdDiPGwTI8=;
 b=M08BePj56tvJNINwlI1C9nVFVguut7g0yfKqVCK+8p5HiDwbgRVze0wymSJ/bU09n6
 HwvGwBps4pR/tfmagB7xLNVokz491r5ar+In42paiitjNjI9NwycMO3POH3UZCblsbMM
 CHrlo5FerSdQWqSnBSwC5GFH9GKAB6HGabtzlie6CpICqWz1LpFbSKPrhTeebwhmvxXX
 LViHZslTvsRDO+HFsvRL3DTmRy7A8ZcrC6BNSdRPjolrhyDGBnN0c8ICGrRq1lPtqPnO
 NN+Deb5EuxHVwsG5gJl5/+w2/pZB2ok/T3JxzFA71Nr7aPZ4c/Z8GGizbBPGLS+JMIAl
 ZSnQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1729513065; x=1730117865;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=qj8L6W818gEgHt04vljDAKiaT7pf1UJVmBdDiPGwTI8=;
 b=MfnkXLxWy2fXMvYox1pAZfgB5ROhtoDS7EKy8RBIJ2rG9do+jKiTVgJVGxU02tC69m
 Q4SmIGJAuFv6WWBoK+Kf86NpYMPwZt44335yVrlnIHGfunbQzNRiZZdSxPw0E2idxm/n
 BCMZkPI5KlS9KPbLjmbQgMaVzQDEunSiSJuS4RWqgOgJ8KRdWK/GDsNvVauFzTjcABOP
 jcIfewmRR/UA3NZk17WAaiFoQ2EQ+Ey0Jm1igAqQBgYyvaN2JrP/vq6tWtBhpgQ0t+3h
 7Iwz7eE/q1dPlH0vNGNJpRu0uQ1wU6YOUc5mwk60jp4brxq/O/ivAWD0L2fFOBw2uArH
 Mvjg==
X-Forwarded-Encrypted: i=1;
 AJvYcCXzEiGZOBwFTe8X9C57Dkhdfcb+q93Ggycr7JLSijLPGQ68bjD62YAXDBjY/p12AspypQDEGE7LIrA=@lists.freedesktop.org
X-Gm-Message-State: AOJu0YxHGPHgEuX4jUT2WMmwO8buTDAo3DwRmLiLqH5wEWOTVwpzuCBK
 U88iO2ENi0danWX80zPBQTCZTWCPvMuJIV2fKksmq5JZ4uibOOAW1KX6pYjxIPg=
X-Google-Smtp-Source: AGHT+IHpSQ4XePG/buVw97pZjciV4B9MDvBfVGMO4z5/K6mvahYyTrgpo88vPai+GK++A8fXgd+WnQ==
X-Received: by 2002:a05:6512:220b:b0:53a:c17:a290 with SMTP id
 2adb3069b0e04-53a15492237mr5085994e87.21.1729513065460; 
 Mon, 21 Oct 2024 05:17:45 -0700 (PDT)
Received: from umbar.unikie.fi ([192.130.178.90])
 by smtp.gmail.com with ESMTPSA id
 2adb3069b0e04-53a22431454sm464210e87.212.2024.10.21.05.17.44
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Mon, 21 Oct 2024 05:17:44 -0700 (PDT)
From: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
To: Rob Clark <robdclark@gmail.com>, Abhinav Kumar <quic_abhinavk@quicinc.com>,
 Sean Paul <sean@poorly.run>,
 Marijn Suijten <marijn.suijten@somainline.org>,
 David Airlie <airlied@gmail.com>, Simona Vetter <simona@ffwll.ch>,
 Simona Vetter <simona.vetter@ffwll.ch>,
 =?UTF-8?q?Barnab=C3=A1s=20Cz=C3=A9m=C3=A1n?= <barnabas.czeman@mainlining.org>
Cc: linux-kernel@vger.kernel.org, linux-arm-msm@vger.kernel.org,
 dri-devel@lists.freedesktop.org, freedreno@lists.freedesktop.org,
 Konrad Dybcio <konradybcio@kernel.org>
Subject: Re: [PATCH v2 0/4] Add MSM8996/MSM8953/MSM8937/MSM8917 dpu catalog
Date: Mon, 21 Oct 2024 15:17:36 +0300
Message-Id: <172950935862.2053501.4807849758391227049.b4-ty@linaro.org>
X-Mailer: git-send-email 2.39.5
In-Reply-To: <20240930-dpu-msm8953-msm8996-v2-0-594c3e3190b4@mainlining.org>
References: <20240930-dpu-msm8953-msm8996-v2-0-594c3e3190b4@mainlining.org>
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


On Mon, 30 Sep 2024 20:35:55 +0200, Barnabás Czémán wrote:
> This patch series add dpu support for MSM8996/MSM8953/MSM8937/MSM8917 SoCs.
> 
> This parch series was tested on many devices:
> 
> - Xiaomi Redmi 5A (msm8917, video panel)
> - Xiaomi Redmi Note 5A (msm8917, video panel)
> - Xiaomi Redmi Note 5A Prime (msm8940, video panel)
> - Motorola G5S (msm8937, video panel)
> - Xiaomi Redmi 3S (msm8937, video panel)
> - Xiaomi Redmi 4x (msm8940, video panel)
> - Samsung A6+ LTE (sdm450, cmd panel)
> - Xiaomi Redmi 7 (sdm632, video panel)
> - Xiaomi Redmi 5 (sdm450, video panel)
> - Xiaomi Redmi 5 Plus (msm8953, video panel)
> - Xiaomi Redmi Note 4 (msm8953, video panel)
> - Xiaomi Mi A1 (msm8953, video panel)
> - Xiaomi Mi A2 Lite/Redmi 6 Pro (msm8953, video panel)
> - Xiaomi Redmi S2 (msm8953, video panel)
> - Motorola G5 Plus (msm8953, video panel)
> - Xiaomi Mi Note 2 (msm8996, video panel)
> - Xiaomi Mi 5s (msm8996, cmd panel)
> 
> [...]

Applied, thanks!

[1/4] drm/msm/dpu: Add support for MSM8996
      https://gitlab.freedesktop.org/lumag/msm/-/commit/daf9a92daeb8
[2/4] drm/msm/dpu: Add support for MSM8953
      https://gitlab.freedesktop.org/lumag/msm/-/commit/7a6109ce1c2c
[3/4] drm/msm/dpu: Add support for MSM8937
      https://gitlab.freedesktop.org/lumag/msm/-/commit/c079680bb0fa
[4/4] drm/msm/dpu: Add support for MSM8917
      https://gitlab.freedesktop.org/lumag/msm/-/commit/62af6e1cb596

Best regards,
-- 
Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
