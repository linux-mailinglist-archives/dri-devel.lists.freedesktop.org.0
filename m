Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 13AF185A35A
	for <lists+dri-devel@lfdr.de>; Mon, 19 Feb 2024 13:31:21 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id CE41210E3CB;
	Mon, 19 Feb 2024 12:31:12 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=linaro.org header.i=@linaro.org header.b="wSnggt/F";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-lf1-f42.google.com (mail-lf1-f42.google.com
 [209.85.167.42])
 by gabe.freedesktop.org (Postfix) with ESMTPS id EA7A910E3A7
 for <dri-devel@lists.freedesktop.org>; Mon, 19 Feb 2024 12:30:55 +0000 (UTC)
Received: by mail-lf1-f42.google.com with SMTP id
 2adb3069b0e04-512b85d03daso438112e87.1
 for <dri-devel@lists.freedesktop.org>; Mon, 19 Feb 2024 04:30:55 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=linaro.org; s=google; t=1708345854; x=1708950654; darn=lists.freedesktop.org;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:from:to:cc:subject:date
 :message-id:reply-to;
 bh=kVcz4T5lUX/p2dpLrBnJfdqrXGy/EYfTfCTW6sdiHL0=;
 b=wSnggt/F10UyNdOxKgWZ83VBghfjJ33OkqPq7qW7J2CK6XcyIa2UTzu9iX6CydQhWO
 aqa+8W7/sbeImRYAF4znhwXHU//gJQ1yHQL7KTVaSaPUxmvS6JZUHFY2W+syL2gK3nbR
 uZhZkQ1UW41go8+YUYqNMHX5QJfhUsjWmo8t2kcWLHeVSIre68/P3nXZojQwFgvs/aQS
 KZxKOqsstJ3Vjk8vX7K9WUexixtQ3JfAfpYuiaSpMvQGP0RaUA7mvgzUajVqXS8Vu58v
 oulGQhkhcAzePP5oEvhigq+ITJ61eiNjJFq/GoYXpnX5Q6tK+nVWAsNLgnWn16iFBT+W
 XaVg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1708345854; x=1708950654;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=kVcz4T5lUX/p2dpLrBnJfdqrXGy/EYfTfCTW6sdiHL0=;
 b=py4woL89tfIkcluMNCAVtejzcIGhv92RhtYkCyFLR7DJRnwpGuapczp7ZAv2Gsn1dq
 4c/RF/BjboWHqUFxzKIydgkpQTUYhZdov1ONVZkMAvIKQkuYd7dWJQjJsst8mpZgDPjw
 sywnvfdk0ppeDZwZ8qSwc231IoC85ujuHUEgUmKiGcbYR/NuvbXDqsZsRUtxdJ7O4DPI
 x1ig10G4uv+4PxY00T85cbk7Xf7fCGH6Iwqu2eRWnPAxSZ3Fu6KUcEIEYz+vMswf8/5B
 ROHBvQWVarDU2dBydQGyM0JNlKIMknZ0PDY759pMvGFNq1kk9pcDb8mIi8WoCn8ofZud
 exzw==
X-Gm-Message-State: AOJu0YxMn947SaJwfobW4rFbPBE+TtPtD5UPHMcbrekX8TohlihRaqgZ
 xAMf7I00yO0nDX38GlaouqY8S0oXH9PPmKOne1rUhckioYx6PZBQKHqawOjm7OiYag4QNZ/vaTN
 1
X-Google-Smtp-Source: AGHT+IEPbgwbriAHQa/3aZrBt+n+k4H+sVUGdpUdH32pyxMo7FQlMDDN6LMaGZPj9i2Wa5EUvNTXvQ==
X-Received: by 2002:a05:6512:3b1e:b0:512:bccf:eb03 with SMTP id
 f30-20020a0565123b1e00b00512bccfeb03mr498859lfv.26.1708345853805; 
 Mon, 19 Feb 2024 04:30:53 -0800 (PST)
Received: from umbar.unikie.fi ([192.130.178.91])
 by smtp.gmail.com with ESMTPSA id
 i6-20020ac25226000000b00512bde4cddfsm90466lfl.148.2024.02.19.04.30.53
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Mon, 19 Feb 2024 04:30:53 -0800 (PST)
From: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
To: dri-devel@lists.freedesktop.org, robdclark@gmail.com, sean@poorly.run,
 swboyd@chromium.org, dianders@chromium.org, vkoul@kernel.org,
 daniel@ffwll.ch, airlied@gmail.com, agross@kernel.org,
 andersson@kernel.org, Kuogee Hsieh <quic_khsieh@quicinc.com>
Cc: quic_abhinavk@quicinc.com, quic_jesszhan@quicinc.com,
 quic_sbillaka@quicinc.com, marijn.suijten@somainline.org,
 freedreno@lists.freedesktop.org, linux-arm-msm@vger.kernel.org,
 linux-kernel@vger.kernel.org
Subject: Re: [PATCH v6] drm/msm/dpu: improve DSC allocation
Date: Mon, 19 Feb 2024 14:30:42 +0200
Message-Id: <170834569499.2610898.923684601788968526.b4-ty@linaro.org>
X-Mailer: git-send-email 2.39.2
In-Reply-To: <1702580172-30606-1-git-send-email-quic_khsieh@quicinc.com>
References: <1702580172-30606-1-git-send-email-quic_khsieh@quicinc.com>
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


On Thu, 14 Dec 2023 10:56:12 -0800, Kuogee Hsieh wrote:
> At DSC V1.1 DCE (Display Compression Engine) contains a DSC encoder.
> However, at DSC V1.2 DCE consists of two DSC encoders, one has an odd
> index and another one has an even index. Each encoder can work
> independently. But only two DSC encoders from same DCE can be paired
> to work together to support DSC merge mode at DSC V1.2. For DSC V1.1
> two consecutive DSC encoders (start with even index) have to be paired
> to support DSC merge mode.  In addition, the DSC with even index have
> to be mapped to even PINGPONG index and DSC with odd index have to be
> mapped to odd PINGPONG index at its data path in regardless of DSC
> V1.1 or V1.2. This patch improves DSC allocation mechanism with
> consideration of those factors.
> 
> [...]

Applied, thanks!

[1/1] drm/msm/dpu: improve DSC allocation
      https://gitlab.freedesktop.org/lumag/msm/-/commit/858ddb64f1ff

Best regards,
-- 
Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
