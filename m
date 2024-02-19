Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 0B89685A345
	for <lists+dri-devel@lfdr.de>; Mon, 19 Feb 2024 13:31:03 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 088DA10E3A9;
	Mon, 19 Feb 2024 12:30:52 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=linaro.org header.i=@linaro.org header.b="nIdbP1rp";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-lf1-f54.google.com (mail-lf1-f54.google.com
 [209.85.167.54])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 886E510E39B
 for <dri-devel@lists.freedesktop.org>; Mon, 19 Feb 2024 12:30:50 +0000 (UTC)
Received: by mail-lf1-f54.google.com with SMTP id
 2adb3069b0e04-5129cdae3c6so2585903e87.1
 for <dri-devel@lists.freedesktop.org>; Mon, 19 Feb 2024 04:30:50 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=linaro.org; s=google; t=1708345848; x=1708950648; darn=lists.freedesktop.org;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:from:to:cc:subject:date
 :message-id:reply-to;
 bh=6sp39V9/P58ZsOOZzf2qvTJrJfggpOrhkMb0iBsxVm0=;
 b=nIdbP1rpiYE0vzQyxWnG60CAJqCJv9Bnr53afdB3RCH0FT+S4sTFG3bGRiCBPTkYrz
 HMiBuKXMpHywJcwyoHnrN+CjmDOwS/EBYDn4/bhFJvmTd/soJMXMCv2y9DZekx0oMgK4
 OgDh/RMvRLwrYxq71jj8kez3qFDGfezCr7Lm0Vdtj0NXqB4t+rytGayz/f3owWs4Lv/3
 DDMSPCqsnzhgHcVih5iWyr96npsR9B1b4pO7FEoOnlJ0XqtZ9HSEqbebQlNLzTfu1qsN
 fWS4srtpa/dQ5DafIYQddY3itajFoD/qGPc9C1HXQXYpZq75B4cviZWaKbwopaZ1rt4G
 baHg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1708345848; x=1708950648;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=6sp39V9/P58ZsOOZzf2qvTJrJfggpOrhkMb0iBsxVm0=;
 b=r0sK1qpUisWY/XwJDnhrq6y+L+x8FEAvN096bUGgg8NoAn0XTpAKQW4xq60UWBnM51
 KoDWD5KnLwnHdELYZweL6aCcaywEWrWvx8AvNzz59Lv52yF55CWjJCcvQyeJ5pX8Xoyr
 xI+6n6sx2QMU2XV80cmb/FTPog2OQ7+LCpQ95TGEgDa7EPVoThJ5eL/RuNxnH99YSoi1
 78aYVxsGYMSuvBG8JIqFMHinK332BajrjkO8dpO918xHXvxNvgjkbfNkuztU7+xC6jhZ
 d41BFYhJtbwh4vmu0kkT6L1k2M4e8AHcEkB7e3NF0BzYop24XjebJ7VoG344FFsIQ+Jf
 mnvA==
X-Forwarded-Encrypted: i=1;
 AJvYcCUXVgejquHtirfdIOJsdPlSNFunv3nSojrUGDGKUQk64q2MhIY1o6Z2XvDYNO7oNJIuNO2Va0QI4bTFfTzMNkgJHEZiIM0aW8kk7l2DUAHs
X-Gm-Message-State: AOJu0YxfXYflGl431GDym/Jcjt3qxm10S0gjS8wElKHqbYHlI37XINzh
 4JoVUCyEsd9MitIz4BmHSDdg82lnENdVvrc5zAzd3GaJVawlDTAt1F4weHfXmGQ=
X-Google-Smtp-Source: AGHT+IFoZP6/ZG8y/H4k48B54cjghy50oBw/WDFb9BTk0tJ7f6x7I94swyk/24k8TDQUDaXjP0IOpA==
X-Received: by 2002:a05:6512:220d:b0:512:ac4c:abf7 with SMTP id
 h13-20020a056512220d00b00512ac4cabf7mr2834148lfu.65.1708345848701; 
 Mon, 19 Feb 2024 04:30:48 -0800 (PST)
Received: from umbar.unikie.fi ([192.130.178.91])
 by smtp.gmail.com with ESMTPSA id
 i6-20020ac25226000000b00512bde4cddfsm90466lfl.148.2024.02.19.04.30.47
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Mon, 19 Feb 2024 04:30:48 -0800 (PST)
From: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
To: Rob Clark <robdclark@gmail.com>, Abhinav Kumar <quic_abhinavk@quicinc.com>,
 Sean Paul <sean@poorly.run>,
 Marijn Suijten <marijn.suijten@somainline.org>,
 David Airlie <airlied@gmail.com>, Daniel Vetter <daniel@ffwll.ch>,
 Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
Cc: linux-arm-msm@vger.kernel.org, dri-devel@lists.freedesktop.org,
 freedreno@lists.freedesktop.org, linux-kernel@vger.kernel.org,
 Stephen Boyd <swboyd@chromium.org>,
 Carl Vanderlip <quic_carlv@quicinc.com>,
 Konrad Dybcio <konrad.dybcio@somainline.org>
Subject: Re: [PATCH v4 0/4] drm/msm: provide migration path from MDP5 to DPU
 driver
Date: Mon, 19 Feb 2024 14:30:35 +0200
Message-Id: <170834569501.2610898.9932991844381586058.b4-ty@linaro.org>
X-Mailer: git-send-email 2.39.2
In-Reply-To: <20240208-fd-migrate-mdp5-v4-0-945d08ef3fa8@linaro.org>
References: <20240208-fd-migrate-mdp5-v4-0-945d08ef3fa8@linaro.org>
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


On Thu, 08 Feb 2024 17:01:07 +0200, Dmitry Baryshkov wrote:
> Over the last several years the DPU driver has been actively developed,
> while the MDP5 is mostly in the maintenance mode. This results in some
> features being available only in the DPU driver. For example, bandwidth
> scaling, writeback support, properly supported bonded DSI aka dual DSI
> support, DSC (display stream compression).
> 
> All the pre-SDM845 platforms were originally supported by the MDP5
> driver only. However it is possible and easy to support some of the
> older SoCs in the DPU driver. For example in the v5.18 it got
> support for MSM8998.  This can not be considered as a proper migration,
> since there msm8998.dtsi didn't describe the display hardware
> beforehand. Instead new bindings were added, making MSM8998 just another
> display hardware to be supported by the DPU driver.
> 
> [...]

Applied, thanks!

[1/4] drm/msm/mdss: generate MDSS data for MDP5 platforms
      https://gitlab.freedesktop.org/lumag/msm/-/commit/d2570ee67a47
[2/4] drm/msm/dpu: support binding to the mdp5 devices
      https://gitlab.freedesktop.org/lumag/msm/-/commit/39b06ed6d4f3
[3/4] drm/msm: add a kernel param to select between MDP5 and DPU drivers
      https://gitlab.freedesktop.org/lumag/msm/-/commit/b8b123187035
[4/4] drm/msm/dpu: add support for SDM660 and SDM630 platforms
      https://gitlab.freedesktop.org/lumag/msm/-/commit/7204df5e7e68

Best regards,
-- 
Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
