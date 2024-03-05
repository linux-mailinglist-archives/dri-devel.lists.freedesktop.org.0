Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 693A48711B0
	for <lists+dri-devel@lfdr.de>; Tue,  5 Mar 2024 01:28:22 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 4ADEE112779;
	Tue,  5 Mar 2024 00:28:16 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=linaro.org header.i=@linaro.org header.b="IivV+VJo";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-lf1-f41.google.com (mail-lf1-f41.google.com
 [209.85.167.41])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 2CBDC112775
 for <dri-devel@lists.freedesktop.org>; Tue,  5 Mar 2024 00:28:14 +0000 (UTC)
Received: by mail-lf1-f41.google.com with SMTP id
 2adb3069b0e04-5131316693cso6664920e87.0
 for <dri-devel@lists.freedesktop.org>; Mon, 04 Mar 2024 16:28:14 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=linaro.org; s=google; t=1709598492; x=1710203292; darn=lists.freedesktop.org;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:from:to:cc:subject:date
 :message-id:reply-to;
 bh=xr6wCNfPCWT62O+BkzsYtFI7aI+vAwjbi8UvrqmJnMk=;
 b=IivV+VJoTj2wK28sO/cKSi8X67yYGWmqAR4Q0McYR7HYIx1CScTySMW6KvgiNUrMRf
 0hRX9ghT63WJc0plH0ieys7qmyZNihQ496SlQG75xEJ8TNuwRNQHKx/qdrFoxM/hH44u
 5sX6dIun1eIV7noHZKwd9SMmuUVPkhPrNqf73K+3FiZ/p3p7UDcTu2Tt+mE+uQIelOtJ
 6Aepw378uCozuPrD4VWqpB1kjOiyT8xooYevRd4TyDbAu+6RjY5gyKb3l0CLxXu+ECHJ
 0N0EabD8AWSQ7LqGLsEz3stU6F4VngQt6RgeJF7xZAWYWpSEDSyH4DTpil29e7XqDkTt
 gaBQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1709598492; x=1710203292;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=xr6wCNfPCWT62O+BkzsYtFI7aI+vAwjbi8UvrqmJnMk=;
 b=NzH1iD2pL/RJdWV+cAWz2ot5G81tRyPZZalWgXbZBfn2HZ03qko6JRbCdrU/TuN5VU
 1yG4/RP0WFY2rqq/5aWGTgU998Md/uSstwbXs9ksXKz4i+MvShzSDWjc8+bS9ZByq+9+
 2g86c3Ow6yXaLRQOaSJ+pRNzmbxWGhfhR9r0DIl8p+SibXS+/aagRBj+UtCUohTPtNvu
 7rDTH+hYSvUNzPQm7uh4WHJFKLMk8F3hh69mG6MDNDO4FrLmqCCfjvhF5xVbCcUghT6/
 zafj9TrD+/NaX8AwmuSbQOuEeGbUYlJU9gPbmfdfQ7ciygK7MdFcKugaueO2yOiqTueN
 4c7w==
X-Forwarded-Encrypted: i=1;
 AJvYcCU6+uYmzHBMEdmRWA7/HPNcNSTqBuSCsHUXVatojWi0N/ibTGUjae0uSIMKwKc+tliqplCj55TXaeUU+KDiDaSYK/A1ONO6RzgzYLy4qpJP
X-Gm-Message-State: AOJu0YwQGOgPYJyghU3e72l+oFZcw29kAbqCFKF9yXvHmCyaDGmumHGO
 Vq1o0MOQqIiJwdhDd2RABeO0leaVY8hjEsZqUZLwpLs5Vv6RXR0tcTqILdKL8qE=
X-Google-Smtp-Source: AGHT+IEpVKRUi1hJu8a/8XKiX0WCgdeworthxvQWON2xS5SR2ABish/KNB9qVAXfHDN+7CkXvRAV7w==
X-Received: by 2002:a05:6512:1243:b0:513:23da:9766 with SMTP id
 fb3-20020a056512124300b0051323da9766mr231986lfb.55.1709598491832; 
 Mon, 04 Mar 2024 16:28:11 -0800 (PST)
Received: from umbar.lan (dzyjmhybhls-s--zn36gy-3.rev.dnainternet.fi.
 [2001:14ba:a00e:a300:264b:feff:fe8b:be8a])
 by smtp.gmail.com with ESMTPSA id
 s15-20020ac2464f000000b005133d11b261sm1149416lfo.92.2024.03.04.16.28.10
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Mon, 04 Mar 2024 16:28:11 -0800 (PST)
From: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
To: freedreno@lists.freedesktop.org,
 Paloma Arellano <quic_parellan@quicinc.com>
Cc: linux-arm-msm@vger.kernel.org, dri-devel@lists.freedesktop.org,
 robdclark@gmail.com, seanpaul@chromium.org, swboyd@chromium.org,
 quic_abhinavk@quicinc.com, quic_jesszhan@quicinc.com,
 quic_khsieh@quicinc.com, marijn.suijten@somainline.org,
 neil.armstrong@linaro.org
Subject: Re: [PATCH v5 00/19] Add support for CDM over DP
Date: Tue,  5 Mar 2024 02:28:09 +0200
Message-Id: <170959846405.1203069.15666159691656225354.b4-ty@linaro.org>
X-Mailer: git-send-email 2.39.2
In-Reply-To: <20240222194025.25329-1-quic_parellan@quicinc.com>
References: <20240222194025.25329-1-quic_parellan@quicinc.com>
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


On Thu, 22 Feb 2024 11:39:45 -0800, Paloma Arellano wrote:
> The Chroma Down Sampling (CDM) block is a hardware component in the DPU
> pipeline that includes a CSC block capable of converting RGB input from
> the DPU to YUV data.
> 
> This block can be used with either HDMI, DP, or writeback interfaces.
> This series adds support for the CDM block to be used with DP in
> YUV420 mode format.
> 
> [...]

Applied, thanks!

[01/19] drm/msm/dpu: allow certain formats for CDM for DP
        https://gitlab.freedesktop.org/lumag/msm/-/commit/32b6ff95b912
[02/19] drm/msm/dpu: add division of drm_display_mode's hskew parameter
        https://gitlab.freedesktop.org/lumag/msm/-/commit/551ee0f21099
[03/19] drm/msm/dpu: pass mode dimensions instead of fb size in CDM setup
        https://gitlab.freedesktop.org/lumag/msm/-/commit/d6e547c091d8
[04/19] drm/msm/dpu: allow dpu_encoder_helper_phys_setup_cdm to work for DP
        https://gitlab.freedesktop.org/lumag/msm/-/commit/7cde7ce5be3e
[05/19] drm/msm/dpu: move dpu_encoder_helper_phys_setup_cdm to dpu_encoder
        https://gitlab.freedesktop.org/lumag/msm/-/commit/0ab07bb96826
[06/19] drm/msm/dp: rename wide_bus_en to wide_bus_supported
        https://gitlab.freedesktop.org/lumag/msm/-/commit/3ed77f333bb0
[07/19] drm/msm/dp: store mode YUV420 information to be used by rest of DP
        https://gitlab.freedesktop.org/lumag/msm/-/commit/5b30d1cbd4fb
[08/19] drm/msm/dp: check if VSC SDP is supported in DP programming
        https://gitlab.freedesktop.org/lumag/msm/-/commit/ab2f8603e22e
[09/19] drm/msm/dpu: move widebus logic to its own API
        https://gitlab.freedesktop.org/lumag/msm/-/commit/1cfc64a6ea55
[10/19] drm/msm/dp: program config ctrl for YUV420 over DP
        https://gitlab.freedesktop.org/lumag/msm/-/commit/683d374582e3
[11/19] drm/msm/dp: change clock related programming for YUV420 over DP
        https://gitlab.freedesktop.org/lumag/msm/-/commit/6db6e5606576
[12/19] drm/msm/dp: move parity calculation to dp_utils
        https://gitlab.freedesktop.org/lumag/msm/-/commit/09b27a482a18
[13/19] drm/msm/dp: add VSC SDP support for YUV420 over DP
        https://gitlab.freedesktop.org/lumag/msm/-/commit/55fb8ffc1802
[14/19] drm/msm/dpu: add support of new peripheral flush mechanism
        https://gitlab.freedesktop.org/lumag/msm/-/commit/64f7b81f0358
[15/19] drm/msm/dp: enable SDP and SDE periph flush update
        https://gitlab.freedesktop.org/lumag/msm/-/commit/21497a463347
[16/19] drm/msm/dpu: modify encoder programming for CDM over DP
        https://gitlab.freedesktop.org/lumag/msm/-/commit/b40c8377d792
[17/19] drm/msm/dpu: modify timing engine programming for YUV420 over DP
        https://gitlab.freedesktop.org/lumag/msm/-/commit/57d6ca4c1917
[18/19] drm/msm/dpu: reserve CDM blocks for DP if mode is YUV420
        https://gitlab.freedesktop.org/lumag/msm/-/commit/984809d85007
[19/19] drm/msm/dp: allow YUV420 mode for DP connector when CDM available
        https://gitlab.freedesktop.org/lumag/msm/-/commit/ee2fcc0f514b

Best regards,
-- 
Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
