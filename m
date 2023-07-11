Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 5AB7074F1E3
	for <lists+dri-devel@lfdr.de>; Tue, 11 Jul 2023 16:22:21 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id D526510E3AA;
	Tue, 11 Jul 2023 14:22:18 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-lj1-x232.google.com (mail-lj1-x232.google.com
 [IPv6:2a00:1450:4864:20::232])
 by gabe.freedesktop.org (Postfix) with ESMTPS id F10C310E3B5
 for <dri-devel@lists.freedesktop.org>; Tue, 11 Jul 2023 14:22:04 +0000 (UTC)
Received: by mail-lj1-x232.google.com with SMTP id
 38308e7fff4ca-2b703cbfaf5so91972021fa.1
 for <dri-devel@lists.freedesktop.org>; Tue, 11 Jul 2023 07:22:04 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=linaro.org; s=google; t=1689085323; x=1691677323;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:from:to:cc:subject:date
 :message-id:reply-to;
 bh=ik/qOyICB+hOJlY4lmFAhBvArnDlT8QyNux/Uwz9Gbo=;
 b=r0v+ygSfzimP/KLRdLbKaY6CMkxtZVxhReFrhft0vSI/Nvuk2cRuxud72IbafdNu9B
 81poxleuZvfFmfxzykbgjux9VjTCzmAyTQRaMRk4myVDAwhmc4jP0CWqOcuV/VJLIEAo
 9W4cjEDrBm8tVFhnrvtPEG7Pak7wHsk3pDmpv1OJZ6nrb8t0TswD513rzYIH9k880cYi
 YC69AkBvuuM82vnExcT62/Jjb8SFDGySH3O3JMUuLCDCvD2OaOS1n+74xbgwhSZ7+vAC
 l78egxP9CK+Fzo16vvQ7J8esIz7wARIaI+goy3PH5xywbvcKFGm3WAF98BFBZZ86/W+8
 zOmg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20221208; t=1689085323; x=1691677323;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=ik/qOyICB+hOJlY4lmFAhBvArnDlT8QyNux/Uwz9Gbo=;
 b=HR/JwwVnPQMLi03JBmuRtBYIo1EhZJ9QWWilGiXuwrohTcp33U/DOrx2/tx5isQHcP
 Cbh64x6ryDwgoWwFh//qG7/L5fgyTz6yt32u9kpo7eya42UWEvlE707/5V1ICxyBjTbI
 CBlSc6sIpkC65DB1Gw4kTnI5JpCJr/es32e9rRUQViMc3kONF9NwDTdzf385DE5ig1Sz
 D2GXWC4o6TMatTRrUmBGu96CsVMizFsjnGPI45hRf2vC8QO5BuVv7nsxXhkrzF96qi/o
 859dvnBDpihztVWoJ9LqotTZIhODieOXVjWv3z1AJ/kOVd149UPzqGPVXPE7VKyMEQO5
 3cvA==
X-Gm-Message-State: ABy/qLa326CROVQBsSBsQisYbRIkoPUr+YHjRpcAP24VmU0ZaTaijKHJ
 +7qlwQ/sglj8mt08OxwpYOLehw==
X-Google-Smtp-Source: APBJJlEBalRUj+ijS5CyMwGZ73deoQ4XRunAyY0wJowOTqWQavAPcjIpA36nSTndCOGOxWS/74NRxw==
X-Received: by 2002:a2e:8611:0:b0:2b6:daa3:f0af with SMTP id
 a17-20020a2e8611000000b002b6daa3f0afmr14149206lji.25.1689085323017; 
 Tue, 11 Jul 2023 07:22:03 -0700 (PDT)
Received: from eriador.lan (dzdqv0yyyyyyyyyyybcwt-3.rev.dnainternet.fi.
 [2001:14ba:a0db:1f00::8a5]) by smtp.gmail.com with ESMTPSA id
 v9-20020a2e87c9000000b002b6b4424a28sm487934ljj.13.2023.07.11.07.22.02
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Tue, 11 Jul 2023 07:22:02 -0700 (PDT)
From: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
To: Rob Clark <robdclark@gmail.com>, Sean Paul <sean@poorly.run>,
 Marijn Suijten <marijn.suijten@somainline.org>,
 David Airlie <airlied@gmail.com>, Daniel Vetter <daniel@ffwll.ch>,
 Jessica Zhang <quic_jesszhan@quicinc.com>
Subject: Re: [PATCH v2] drm/msm/dsi: Enable BURST_MODE for command mode for
 DSI 6G v1.3+
Date: Tue, 11 Jul 2023 17:21:52 +0300
Message-Id: <168908465039.1869384.13751958187068298061.b4-ty@linaro.org>
X-Mailer: git-send-email 2.40.1
In-Reply-To: <20230608-b4-add-burst-mode-v2-1-2ff468457d46@quicinc.com>
References: <20230608-b4-add-burst-mode-v2-1-2ff468457d46@quicinc.com>
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
Cc: linux-arm-msm@vger.kernel.org, freedreno@lists.freedesktop.org,
 quic_abhinavk@quicinc.com, dri-devel@lists.freedesktop.org,
 linux-kernel@vger.kernel.org
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>


On Tue, 27 Jun 2023 13:31:45 -0700, Jessica Zhang wrote:
> During a frame transfer in command mode, there could be frequent
> LP11 <-> HS transitions when multiple DCS commands are sent mid-frame or
> if the DSI controller is running on slow clock and is throttled. To
> minimize frame latency due to these transitions, it is recommended to
> send the frame in a single burst.
> 
> This feature is supported for DSI 6G 1.3 and above, thus enable burst
> mode if supported.
> 
> [...]

Applied, thanks!

[1/1] drm/msm/dsi: Enable BURST_MODE for command mode for DSI 6G v1.3+
      https://gitlab.freedesktop.org/lumag/msm/-/commit/4ac447e89e71

Best regards,
-- 
Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
